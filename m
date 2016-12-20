From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Dec 2016 00:37:47 +0100
Subject: [Buildroot] [musl] cortex-m support?
In-Reply-To: <48fb6c09-9dcb-e563-dc2d-f30062c5fceb@landley.net>
References: <04e5a294-719e-8029-704f-a57d1ec935b0@landley.net>
 <20161208211116.GO1555@brightrain.aerifal.cx>
 <7bfe2625-725d-d1bb-7177-f2d31ce09e9c@landley.net>
 <20161215185123.GX15584@waldemar-brodkorb.de>
 <48fb6c09-9dcb-e563-dc2d-f30062c5fceb@landley.net>
Message-ID: <7c500379-491b-3099-bef7-5b3a3e0bf354@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Rob,

 First of all, thank you very much for this writeup on the history of uClibc and
Buildroot. It was a really interesting read and filled in a lot of the blanks
for me. Something like this should appear on lwn.net.


On 20-12-16 08:18, Rob Landley wrote:
[snip]
> Did you want me to send it to the uclibc.org mailing list which hasn't
> had a single post this month except your announcement of your fork's
> release? 

 Funny thing: that very post points to the (very active, as Thomas wrote)
uclibc-ng mailing list...


> Your fork clearly hasn't fixed any of the structural issues uClibc
> developed over the years.

 It is pretty rare that a fork fixes the problems with the original project.
eglibc is one of the few ones that come to mind, I expect uClibc-ng to replace
uClibc completely, perhaps taking over the original name at some point.


> We are discussing a patch to cortex-m that I
> found because code was crashing, and when gdb was deployed we found out
> that code in libpthread/libthreads/pthread.c was getting corrupted, and
> we worked out that the corruption ended right after the sigsetjmp() call
> in __pthread_timedsuspend_new() and that all the data before it looked
> like stack contents, stack grows down on every linux target except
> pa-risc so that's actually where the corruption started... and we went
> from there.
> 
> This was debugging through the _old_ legacy pthreads implementation,
> which is the only option on cortex-m because even the one buildroot has
> today never got NPTL working there. 

 Much like the musl that buildroot has today doesn't have NPTL support for ARM
NOMMU ;-)

[snip]
> I used to prod other projects to support uClibc too. For example, it
> took me three years to finally convince qemu to stop being incompatible
> with uClibc static binaries on powerpc, but they finally made the change:

 Then you have your work cut out with musl... In Buildroot, we currently have 48
packages that are excluded on musl, and 114 that need to be patched to be able
to build with musl. And that's not taking into account the global hacks we
introduced for musl: cdefs.h, queue.h, linux headers patching...

 The problem with musl is that the world is not posix :-/  Ignoring this fact
moves the problems from libc to distros.

[snip]
> Buildroot itself was finally ready to declare uClibc dead a couple years
> ago:
> 
>   http://lists.busybox.net/pipermail/buildroot/2014-February/089789.html
> 
> Which is when you stepped in to continue beating the dead horse, so they
> didn't have to decide.

 Note that when we finally switched to uClibc-ng as a default (in 2015), we
already had musl support for more than a year.


> It's nice that you're maintaining buildroot's uClibc so they don't have
> to maintain their own fork anymore

 You seem to have things wrong here. We never maintained a buildroot uClibc,
other than picking some of the uClibc commits and applying them on top of
0.9.33.2. When Waldemar's fork appeared, we started offering that fork as a
choice, then after a few months we switched to uClibc-ng as the default version,
and about a year later we dropped support for the original uClibc-ng.


> (like emcraft still does, or
> https://github.com/mickael-guene/uclibc/tree/uClibc-0.9.33.2-fdpic-m).
> Your version is more interesting to me than random other attempt du jour
> like https://github.com/davidgfnet/uClibc-Os because buildroot uses your
> version.

 I think the main reason why uClibc-ng is more interesting is that it is the
only fork that is actually active: it has a maintainer, a mailing list, regular
releases, a bug tracker, ... .

[snip]
> The first problem is that buildroot forked off and sucked away all
> uClibc's developers for several years. 

 That's an interesting way of looking at it... But back in those days, Buildroot
development suffered pretty much from the same problems as uClibc, no?

[snip]
> In the ensuing discussion other prominent developers admitted that they
> valued their private forks more than mainline. Manuel Nova said, and I
> quote, "I can't ethicly (at least in my code of ethics) justify handing
> out bug fixes to my employer's competitors until necessary."

 Now that's a Quote of the Week :-)

[snip]
> Presumably you know it from there, but you're now the FOURTH maintainer
> of the project _since_ it died.

 Fourth time is the charm :-)

[snip]
> I cc'd buildroot. That is a real project, which still uses uClibc for
> the targets Rich hasn't gotten around to porting musl to yet.

 We do about as much uClibc maintainance as we do musl maintainance, so you
should probably send all musl-related patches to the buildroot mailing list as
well :-P

> I cc'd
> them so they would be aware of the issue. I could have just sent it to
> the musl list, but chose to inform buildroot as well.
> 
> (Oddly enough, lists.buildroot.org doesn't have a web archive of the
> list. I have to go to lists.busybox.net to see the archive? I would have
> thought they'd moved it over by now. I can _email_ @buildroot...)

 IIRC Peter looked at that but it turns out not to be so trivial to migrate a
mailman setup.


 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
