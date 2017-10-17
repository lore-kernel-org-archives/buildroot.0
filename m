From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Oct 2017 14:01:41 +0200
Subject: [Buildroot] [PATCH RFC] core: enable per-package log files
In-Reply-To: <20171017091152.67d7ad28@windsurf.lan>
References: <20171011105809.2bf05267@windsurf.lan>
 <1508170801-31062-1-git-send-email-anisse@astier.eu>
 <20171016185248.0463ac82@windsurf.lan> <20171016211842.GA32198@bifrost>
 <20171017091152.67d7ad28@windsurf.lan>
Message-ID: <4234cedb-0646-496e-9ee1-0bc60c847810@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-17 09:11, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 16 Oct 2017 23:18:42 +0200, Anisse Astier wrote:
> 
>>> Are you sure this is working for multi-line hooks ? I think hooks
>>> suffer from the same problem as commands.  
>>
>> No, it's not working for multi-line hooks, I forgot about it. But we
>> could use the helper for this as well.
> 
> Sure, OK.
> 
>>> Why do variables need to be exported? Isn't their value passed as
>>> argument to the recipe-forward-log script ?
>>
>> When simply using the multi-line make variable, it gets replaced in the
>> recipe, and the shell command only receives the first line, even if we
>> enclose the variable in double quotes. Exporting it to the environment
>> made it possible to go through the make -> shell barrier.
> 
> But then there is no point in passing the commands as argument on the
> wrapper command line, no? It could just use the variable from the
> environment, no?
> 
> Does something like:
> 
> 	COMMANDS="$($(PKG)_BUILD_CMDS)" ./support/script/your-wrapper
> 
> works ?

 No it won't:
- any quotation marks will be eaten by the shell;
- non-escaped newlines will still cause the shell to be called twice.

 The environment hack is really the way to go. Note that the "export" in
evalexport is a make command, not a shell command!

 We could instead export these variable globally from within the generic-package
infra, since the variable names anyway have to be unique. It just means that
you'll have quite a huge environment on each process invocation, which might be
problem for other reasons (e.g. performance).

 Another approach would be to call printvars from within the wrapper script, but
also that has terrible performance implications.


>> Then I had to use the eval trick because otherwise the nested/computed
>> $(PKG)_EXTRACT_CMDS variable would only be interpreted once, at initial
>> parsing and not for each packages.
> 
> Adding Arnout in Cc on this topic, because he understands all this
> make/shell sorcery :)

 Heh, at first glance I thought you misspelled sourcery ;-)

 eval is indeed needed, otherwise the export is a shell command, not a make
command. I don't think making it a macro is very useful however, so instead of
$(call exportvar,...) I'd do $(eval export $(PKG)_EXTRACT_CMDS).


>>> How many packages have you tested with this? I'm just a little bit
>>> concerned with this parsing, and how it could break with arbitrary (but
>>> valid) make commands.

 I don't see any way that it could break things, actually. But obviously it
*does* need to be tested more extensively.

>>
>> Not many. I have only tested the qemu_aarch64_virt_defconfig which does
>> not contain much(~28 packages), but I was already able to fix a few
>> parsing issues.
> 
> A bigger test is indeed needed to validate things. But let's see what
> others have to say first.

 Indeed, because I'm not in favour...

- IMO 'make --output-sync=recurse' is sufficient to begin with.

- This script requires python3 for *any* build, but python3 is not currently a
dependency.

- If the script is changed so it supports both 2 and 3, it still requires a
python invocation for every build step, which is slowing things down.

- Even if it is converted to a shell script or sped up in a different way, it
will make things more complicated for IMO limited gain.


 So first of all I would like to see an explanation why --output-sync=recurse is
not sufficient.


 If we *really* do want per-package log files, and we are willing to change the
.stamp_ commands like you do here, then there is in fact an alternative that may
simplify things. We can do

$(subst $(sep),something$(sep)something,$($(PKG)_FOO_CMDS)

to replace all newlines with a redirection command. It's still not trivial:

$(subst $(sep),$(sep) > logfile 2>&1,$($(PKG)_FOO_CMDS) > logfile 2>&1

would be the obvious thing, but the problem is that the commands may already
contain some redirection and we'd end up with double redirection. But you can
see the pattern here :-)

 Note BTW that there is one $(sep) less than the actual number of lines, so you
always need to add an additional preamble and postamble. So clearly we'll want a
macro to do that:

redirect = preamble $(subst $(sep),preamble $(sep) postamble,$(1)) postamble
...
	$(call redirect,$($(PKG)_FOO_CMDS))


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
