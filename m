From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Nov 2016 11:10:06 +0100
Subject: [Buildroot] pseudo: remaining issues...
In-Reply-To: <20161123063723.sy6vf3vfscrtg45e@gportay>
References: <20161122212534.GA3529@free.fr>
 <315eabd4-eb7f-2e83-c8f8-caa5a3cd3099@mind.be>
 <20161123063723.sy6vf3vfscrtg45e@gportay>
Message-ID: <06119bed-14a8-0c38-9523-55f9759b4ab2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23-11-16 07:37, Ga?l PORTAY wrote:
> On Wed, Nov 23, 2016 at 12:02:19AM +0100, Arnout Vandecappelle wrote:
>>
>>
>> On 22-11-16 22:25, Yann E. MORIN wrote:
>>> One solution that would make it work in all cases would be:
>>>
>>>   - do the target-finalize actions in a copy of target/
>>>   - generate, filesystem images form that copy
>>>   - trash the copy
>>>   - trash pseudo DB
>>
>>  This could fit pretty well in a per-package-staging like approach (but then per
>> package target, obviously). So each package installs in its own version of the
>> target directory, and at the end everything is put together into the final
>> target. The latter can be done under pseudo.
>>
>>  BTW, it's not really needed to repeat all the makedevs etc. steps under pseudo
>> for every filesystem, we could just do that once, and then generate each
>> filesystem (under pseudo again of course). But that doesn't fix the issues with
>> rebuilding, of course.
>>
> 
> Indeed... or (even better?), run makdevs every time the makedevs_table.txt is
> updated.

 Well, makedevs *will* rerun in every target-finalize (i.e. every time you do
'make'). I see no reason to stop doing that. We just don't need to run it
separately for every filesystem.


>>> Another possibility would be to always do changes in target/ under
>>> pseudo:
>>>   - installing packages
>>>   - taget-finalize
>>>   - filesystem generation
>>
>>  I think this option is where we want to go long-term. Packages are meant to be
>> installed under sudo, so installing them under pseudo is a good idea.
>>
> 
> Agree.
> 
>>  It's not so trivial for us, though. In openembedded they can easily do the
>> equivalent of install-target under pseudo, but we can't because the commands run
>> under individual shells in make. There are a few possibilities to work around
>> that, but it needs some thinking.
> 
> I am not sure to understand...

 Look at the install-target step:

> # Install to target dir
> $(BUILD_DIR)/%/.stamp_target_installed:
>         @$(call step_start,install-target)
>         @$(call MESSAGE,"Installing to target")
>         $(foreach hook,$($(PKG)_PRE_INSTALL_TARGET_HOOKS),$(call $(hook))$(sep))
>         +$($(PKG)_INSTALL_TARGET_CMDS)

We can't simply replace this one with
	+pseudo $($(PKG)_INSTALL_TARGET_CMDS)
because INSTALL_TARGET_CMDS may consist of *several* commands. With the above
change, only the first one would be done under pseudo.

 As I wrote, there are several solutions, but it's far from trivial.


 Note that another issue is that packages may mess with TARGET_DIR outside of
install-target. They shouldn't, of course, but you never know... So we should
also add some protection that detects this.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
