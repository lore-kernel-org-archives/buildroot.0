From: Rob Landley <rob@landley.net>
Date: Tue, 20 Dec 2016 01:18:40 -0600
Subject: [Buildroot] [musl] cortex-m support?
In-Reply-To: <20161215185123.GX15584@waldemar-brodkorb.de>
References: <04e5a294-719e-8029-704f-a57d1ec935b0@landley.net>
 <20161208211116.GO1555@brightrain.aerifal.cx>
 <7bfe2625-725d-d1bb-7177-f2d31ce09e9c@landley.net>
 <20161215185123.GX15584@waldemar-brodkorb.de>
Message-ID: <48fb6c09-9dcb-e563-dc2d-f30062c5fceb@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry for the delay responding, lots of deadlines and travel recently...

(Ok, for a definition of "recently" that goes back a decade:
http://lists.busybox.net/pipermail/busybox/2005-June/048743.html)

On 12/15/2016 12:51 PM, Waldemar Brodkorb wrote:
> Hi,
> Rob Landley wrote,
> 
>> On 12/08/2016 03:11 PM, Rich Felker wrote:
>>> On Tue, Dec 06, 2016 at 11:52:29PM -0600, Rob Landley wrote:
>> Make sure you're aware of erratum 752419:
>>
>>   https://sourceware.org/ml/binutils/2011-05/msg00087.html
...
>> cc-ing buildroot because this is still broken in their november release.
> 
> I am wondering why you don't cc me or any uclibc related list? 

I cc'd the buildroot list, which only has uClibc-based cortex-m support
at the moment. Why do you suppose I did that?

Did you want me to send it to the uclibc.org mailing list which hasn't
had a single post this month except your announcement of your fork's
release? The list where nobody's noticed the chrome browser can't access
https://lists.uclibc.org (archives, subscription page, etc) for weeks
now? And yes, I publicized that fact when I noticed it:

  https://twitter.com/landley/status/806202364822597632

Several people replied to that tweet, if nobody bothered to poke
uclibc.org I'm clearly not the only one who thinks the project is dead.

Your fork clearly hasn't fixed any of the structural issues uClibc
developed over the years. We are discussing a patch to cortex-m that I
found because code was crashing, and when gdb was deployed we found out
that code in libpthread/libthreads/pthread.c was getting corrupted, and
we worked out that the corruption ended right after the sigsetjmp() call
in __pthread_timedsuspend_new() and that all the data before it looked
like stack contents, stack grows down on every linux target except
pa-risc so that's actually where the corruption started... and we went
from there.

This was debugging through the _old_ legacy pthreads implementation,
which is the only option on cortex-m because even the one buildroot has
today never got NPTL working there. Musl has nptl for every target it
supports (including a nommu one), but the uClibc developers have spent
TEN YEARS trying to make that work since the first out-of-tree NTPL
version that sjhill promised to release after his OLS presentation, then
after his customer paid him enough, then...

If you don't understand WHY this is such a bad thing, then you clearly
don't know the history of the project. You don't now what the problems
that led to all the multi-year gaps between releases WERE.

Has your fork solved the locales problem?

  http://lists.busybox.net/pipermail/uclibc/2015-June/049000.html

Has your fork solved the nptl issue?

  http://lists.busybox.net/pipermail/uclibc/2008-September/020151.html
  http://lists.busybox.net/pipermail/uclibc/2008-September/020169.html
  http://lists.busybox.net/pipermail/uclibc/2008-September/020171.html
  http://lists.busybox.net/pipermail/uclibc/2008-October/041201.html

Did you fix the fact that huge swaths of uClibc (especially headers) are
just snapshots of old versions of glibc stuff advertising things uClibc
doesn't actually implement and pretending to be glibc?

  http://lists.busybox.net/pipermail/uclibc/2006-March/014811.html

Do you have a sane "make defconfig" that lets people build uClibc
without learning what over a hundred individual config options do and
making decisions about whether or not they need each one? This issue
doesn't even come _up_ with musl, it fundamentally avoids most of the
structural problems that strangled uClibc development, by design.

> You still believe uClibc projects should die?

No, I believe uClibc _already_ died. I believe this because I was there.

I did my turn as Sisyphus on that project. I pushed the boulder uphill
over an over for over a decade. And yes, I mean a full decade, starting
in 2003:

  http://lists.busybox.net/pipermail/uclibc/2003-August/027643.html

I used to prod the maintainer to get releases out by sending him
birthday cakes when the existing release was a year old:

  http://lists.busybox.net/pipermail/uclibc/2005-January/010877.html
  http://lists.busybox.net/pipermail/uclibc/2006-March/014921.html
  http://lists.busybox.net/pipermail/uclibc/2006-March/014923.html
  http://lists.busybox.net/pipermail/uclibc/2006-December/037750.html
  http://lists.busybox.net/pipermail/uclibc/2006-December/037766.html

I had to fight hard for the very IDEA of cutting releases:

  http://lists.busybox.net/pipermail/uclibc/2006-March/014722.html
  http://lists.busybox.net/pipermail/uclibc/2006-March/014881.html
  http://lists.busybox.net/pipermail/uclibc/2006-March/014885.html

Here's a changelog I spent 3 days researching after a particularly long
development cycle (because users had expressed reluctance to move to new
versions when so _much_ had changed at once that the couldn't debug
anything that broke):

  http://lists.busybox.net/pipermail/uclibc/2006-July/016032.html

I used to prod other projects to support uClibc too. For example, it
took me three years to finally convince qemu to stop being incompatible
with uClibc static binaries on powerpc, but they finally made the change:

  https://lists.gnu.org/archive/html/qemu-devel/2010-02/msg00800.html

Circa 2010 I was still trying to convince people uClibc would recover
when everybody _else_ had declared it dead:

  http://lists.busybox.net/pipermail/uclibc/2010-April/043835.html

Buildroot itself was finally ready to declare uClibc dead a couple years
ago:

  http://lists.busybox.net/pipermail/buildroot/2014-February/089789.html

Which is when you stepped in to continue beating the dead horse, so they
didn't have to decide.

It's nice that you're maintaining buildroot's uClibc so they don't have
to maintain their own fork anymore (like emcraft still does, or
https://github.com/mickael-guene/uclibc/tree/uClibc-0.9.33.2-fdpic-m).
Your version is more interesting to me than random other attempt du jour
like https://github.com/davidgfnet/uClibc-Os because buildroot uses your
version.

But cortex-m still only supports pthreads in 2016 and even that's buggy
in ways that were fixed out of tree quite a while ago. The release I
fished this bugfix out of is a year old. I don't have their source
control to see how old the fix really is, but emcraft's "preferred"
kernel (https://github.com/emcraftsystems/linux-emcraft) forked off from
mainline 7 years ago, and cortex-m support for Linux is their core
business, so there's a guess how long ago somebody actually _using_ this
might have noticed it.

In case you really _don't_ know the history, let me walk you through how
the uClibc project died, going back through about ten years of
accumulated scar tissue, and why three different maintainers before you
failed to fix it. The most prominent reasons were a classic "project
tumor", an absentee maintainer, development forking itself to death, and
the code itself forking to death (most prominently over NPTL).

--- Project Tumor

The first problem is that buildroot forked off and sucked away all
uClibc's developers for several years. This doesn't mean buildroot is
bad, QEMU similarly forked off from tinycc and sucked away all that
project's developers. QEMU started life with the purpose of running Wine
on non-x86 platforms
(https://www.winehq.org/pipermail/wine-devel/2003-March/015577.html).

I usually summarize buildroot as "a test harness for uClibc that grew
legs" but the actual history is more complciated, it seems to have been
inspired by a build system for the "tuxscreen" project
(http://lists.busybox.net/pipermail/uclibc/2002-February/002542.html)
which Erik turned into a toolchain builder for uClibc
(http://lists.busybox.net/pipermail/uclibc/2002-August/024891.html when
he abandoned the old toolchain wrapper because of libgcc_s.so issues)
then added the ability to do smoketest boots under User Mode Linux
(which seems to have been brought up at
http://lists.busybox.net/pipermail/busybox/2001-April/037259.html) and
so on. For years its main purpose was people would go "How do I build X
with uClibc" and he'd go
http://lists.busybox.net/pipermail/uclibc/2002-August/004089.html

The problem is, buildroot had no obvious project boundaries (you
couldn't say "no, this is not part of buildroot") so it expanded and
expanded, turning into a Linux distro which took up more and more of the
uClibc developers' time. Erik publicly complained that this was
negatively impacting uClibc development over a decade ago:

  http://lists.busybox.net/pipermail/uclibc/2003-August/027564.html

I don't participate in buildroot development much (yes I still owe you
guys a new toybox patch) but I was there from the beginning, as in I
created the first buildroot config file
(http://lists.busybox.net/pipermail/uclibc/2003-August/027559.html) and
documentation
(http://lists.busybox.net/pipermail/uclibc/2003-August/027531.html).

It was also obvious to _me_ that buildroot traffic was drowning out
uClibc development back at the start:

  http://lists.busybox.net/pipermail/uclibc/2003-November/028342.html

But I didn't have the ability to fix it until Erik handed off busybox
maintainership to me and thus gave me root access to the shared server,
and I abused that access to create this buildroot list, the first post
in the archive of which is:

  https://lists.busybox.net/pipermail/buildroot/2006-July/012219.html

And then I tried to politely shunt the buildroot traffic off the uClibc
list:

  https://lists.busybox.net/pipermail/uclibc/2006-July/015977.html

But that was after buildroot traffic had drowned out uClibc development
traffic for THREE YEARS. Needless to say, this hurt the project's
development. Here are a few highlights from the uClibc thread that led
_up_ to me creating the buildroot list:

  http://lists.busybox.net/pipermail/uclibc/2005-October/033703.html
  http://lists.busybox.net/pipermail/uclibc/2005-October/033709.html
  http://lists.busybox.net/pipermail/uclibc/2005-October/033712.html
  http://lists.busybox.net/pipermail/uclibc/2005-October/033720.html

I.E. my motivation was that buildroot was smothering uClibc, but by the
time I was in a position to separate the two uClibc development had been
significantly eroded.

--- Absentee maintainer

The second problem uClibc died from was an absentee maintainer: Erik ran
a struggling startup that took so much of his time it impacted his
marriage. The prominent developers under him didn't fare much better,
buildroot or no: Manuel Nova was never the same after his fiancee died
(you may notice the various "donate money in memory of" headers in the
code, he got really _bitter_ as time went on and eventually wandered
off). Glenn McGrath burned out and left uClibc and BusyBox due to trying
his hand at license enforcement and having a horrible experience with it
(ala http://lists.busybox.net/pipermail/busybox/2005-April/048256.html
which was one of the things I cited when starting my own license
enforcement effort a few years alter, to take the burden off other
people trying to do it themselves). SJ Hill got mercenary and refused to
release his NPTL work until his employer paid outstanding invoices
(which dragged on for _years_ but we'll get to that).

I took busybox off of Erik's hands in part so he'd have more time to
spend on uClibc (and also so busybox didn't go the _way_ of uClibc):

  http://lists.busybox.net/pipermail/busybox/2005-January/047510.html
  http://lists.busybox.net/pipermail/busybox/2005-January/047601.html
  http://lists.busybox.net/pipermail/busybox/2005-May/048481.html
  http://lists.busybox.net/pipermail/busybox/2005-May/048565.html

And so on scaling up to me taking over busybox maintainership. (Alas the
web archive has some holes in it, ala
http://lists.busybox.net/pipermail/busybox/2005-June/048965.html). But
to clarify: I took work off or Erik's plate when he _asked_ for help
over in busybox-land:

  http://lists.busybox.net/pipermail/busybox/2005-April/048250.html
  http://lists.busybox.net/pipermail/busybox/2005-April/048255.html

And it took up all my spare time. In May 2005 I posted to the busybox
mailing list 104 times.

  http://lists.busybox.net/pipermail/busybox/2005-May/date.html

I didn't have TIME to do the same for uClibc, but I still poked at
various other issues such as the fact there was no official place to get
kernel headers from when building a C library (the kernel guys said that
coming up with sanitized kernel headers for use by userspace was a
distro maintainers' problem, hence
http://lists.busybox.net/pipermail/uclibc/2004-June/030119.html and
http://lists.busybox.net/pipermail/uclibc/2006-February/035260.html and
http://lists.pld-linux.org/mailman/pipermail/llh-discuss/2006-March/000016.html
and https://lwn.net/Articles/244375/ and so on).

Those sort of things reduced the number of people building their own
uClibc systems, outside of something like buildroot that does it for
you. Use of the project actually _declined_ as it got harder to make it
work. (Side note: the eglibc project was created by developers
commenting on how the death of uClibc made their project necessary.
Wanna know how long ago that was?)

Having chosen to get behind busybox and push, I didn't have a similar
amount of spare bandwidth to directly help out uClibc with. Taking
busybox off Erik's plate helped out uClibc a little bit, but it didn't
last. Erik's participation continued to decline until he eventually left
open source development entirely.

--- Forked development

Another reason the uClibc project died was it forked itself to death.
Ten years ago a guy named sjhill did the first uClibc NPTL port:

  https://www.kernel.org/doc/ols/2006/ols2006v1-pages-409-420.pdf

But he refused to release the code, first for various trivial reasons
(ala http://lists.busybox.net/pipermail/uclibc/2006-March/035697.html)
then he wanted to wait until after his OLS presentation, then he wanted
to wait until whoever had sponsored the work (I forget) paid him more
for it... His reasons for not merging it kept changing, and he kept
dangling the idea of merging it but never doing so for years. Here's me
declaring his work dead in an IRC conversation a couple years later
after years of it never going in:

  http://infobot.rikers.org/%23uclibc/20080810.html.gz

Other developers started maintaining out of tree forks as a matter of
course, and complaining that merging code into mainline was
inconveniencing their forks. Doing this eventually chased away the most
active remaining developer who _was_ merging code into mainline,
convincing him that _his_ fork should be out of tree too:

  http://lists.busybox.net/pipermail/uclibc/2006-March/015014.html

In the ensuing discussion other prominent developers admitted that they
valued their private forks more than mainline. Manuel Nova said, and I
quote, "I can't ethicly (at least in my code of ethics) justify handing
out bug fixes to my employer's competitors until necessary."

  http://lists.busybox.net/pipermail/uclibc/2006-March/015018.html
  http://lists.busybox.net/pipermail/uclibc/2006-April/015077.html
  http://lists.busybox.net/pipermail/uclibc/2006-April/015080.html

Here's sjhill calling me a hypocrite for saying code _should_ go upstream:

  http://lists.busybox.net/pipermail/uclibc/2006-April/015103.html

I participated fairly extensively in that thread:

  http://lists.busybox.net/pipermail/uclibc/2006-April/015083.html
  http://lists.busybox.net/pipermail/uclibc/2006-April/015097.html
  http://lists.busybox.net/pipermail/uclibc/2006-April/015127.html

But the maintainer, Erik, didn't. Half his response in that thread was
to propose removing architectures to reduce the maintenance burden. No
really:

  http://lists.busybox.net/pipermail/uclibc/2006-April/015195.html

Erik did not object to the project forking itself to death, specifically
the "we must prevent code going upstream to not inconvenience these out
of tree forks" thread topic was fine by him. I objected to his lack of
objection:

  http://lists.busybox.net/pipermail/uclibc/2006-April/015085.html

But it wasn't _my_ project, and I couldn't overrule its maintainer when
he didn't  care to prevent it from forking itself to death.

--- Forked code

Development wasn't the only thing that fragmented, the in-tree codebase
did too. A persistent habit of uClibc's was cloning large chunks of
glibc. Since the two projects were under the same license, the uClibc
developers could copy a glibc subsystem (such as pthreads) more or less
verbatim, and then try to strip it down to be smaller afterwards. Their
snapshot would inevitably fall out of date with glibc's, and rather than
try to update it themselves they'd eventually clone a less stale version
and put it next to the other one in the tree with a menuconfig option to
select the "old" or "new" version. On more than one occasion they had
three snapshots of the same infrastructure in play at once.

Here's an incomplete list of some of the duplicate infrastructure you
had to select old or new versions of in menuconfig:

  http://lists.busybox.net/pipermail/uclibc/2008-December/041639.html

Just educating yourself on what your OPTIONS were was a daunting task.
And the menuconfig options and help text were often completely
nonsensical. I used to go through and try to audit menuconfig:

  http://lists.busybox.net/pipermail/uclibc/2008-August/040766.html
  http://lists.busybox.net/pipermail/uclibc/2009-August/042851.html

But tended to get pushback from people going "no, it makes sense to _me_
and I refuse to let it be changed":

  http://lists.busybox.net/pipermail/uclibc/2009-August/042868.html

Needing menuconfig at all is another design problem: configuring uClibc
is not a trivial exercise, and all sorts of configuration changes change
the ABI and break binary compatibility. (And of course no uClibc version
upgrade was ever binary compatible with any previous version.) You don't
have this problem with musl-libc, not only _is_ there no menuconfig
stage, but they tried for binary compatibility with glibc (as in trying
to make it a drop-in replacement capable of running the flash plugin and
such) for the longest time, and thus musl has a reasonably stable ABI.
(It's not 100% glibc compatible but they know what their ABI _is_.)

But back to duplicate code: different architectures even had their own
versions of headers that _should_ have been mostly the same, but were
full of version skew. Cleaning this up was a perennial problem, with
occasional small victories:

  http://lists.busybox.net/pipermail/uclibc-cvs/2010-April/027938.html

But mostly, wrestling with this burned out developers and sucked up huge
amounts of effort while falling behind the rate of increase in clutter
and scar tissue in the code (or else the code going stale and not having
current features), while introducing churn and breakage into the
development cycle that exacerbated the lack of releases (because if such
a cleanup broke something nobody would notice for a year or more; the
churn made releases dangerous to do, so the developers simply avoided
having any).

The worst instance of redundant code was uClibc's NPTL support, or lack
thereof. In Linux 2.6 Rusty Russell invented Futexes and the "New Posix
Threading Library" was invented on top of that circa 2004.


http://www.drdobbs.com/open-source/nptl-the-new-implementation-of-threads-f/184406204

The first uClibc version of NPTL support was the aforementioned work by
sjhill, who didn't merge it upstream. As a result, several _other_ NPTL
implementations were done for other architectures, each starting from
scratch and sharing zero code with any of the others:

  http://lists.busybox.net/pipermail/uclibc/2006-March/014793.html
  http://lists.busybox.net/pipermail/uclibc/2006-December/037765.html
  http://lists.busybox.net/pipermail/uclibc/2007-August/039206.html

This combined with the earlier "don't destabilize my out of tree fork by
merging anything upstream" nonsense to ensure that all the different
NPTL implementations stayed as out-of-tree forks for years and years,
slowly diverging, because there was no way to get them upstream. Merging
any of them would inconvenience the others! No, they had to be unified
_before_ they could be merged, which was a chicken and egg problem.

This led to at least four complete and active NPTL ports done by four
groups of people for four different architectures (arm, mips, powerpc,
sh), which had no common code. Multiple summit-like meetings were held
online to try to deal with this, but we still had multiple versions of
the old pthreads code NPTL was supposed to replace, and couldn't even
agree on unifying or removing _those_ duplicates:

  http://lists.busybox.net/pipermail/uclibc/2008-September/041039.html
  http://lists.busybox.net/pipermail/uclibc/2008-September/020198.html

So the situation dragged on for years and years and the code grew more
and more scar tissue as everybody's cleanup efforts focused on their own
fork and not mainline. When releases _did_ happen, they were just a
subset of the development, major features like NPTL were kicked down the
road again and again, in various deveopment branches but not in any
release version.

--- _TWO_ new maintainers didn't help

Circa 2007 uClibc was so clearly dying I stopped being polite about it.

By this point the project was a giant mass of scar tissue from partial
merges of various developers' out of tree forks leaving half-finished
code all over the tree. Nobody could get major subsystems like locales
to work at all, there were multiple regex implementations... Unifying
that mess was a giant cleanup job that nobody had the bandwidth to do,
and the longer it went on the bigger a job it became. Endless _partial_
cleanups just made the problem _worse_, the churn destabilizing the tree
and making releases harder to do.

Along the way Erik basically stopped participating at all. So a year or
so after he handed BusyBox off to me, I poked him to hand off uClibc
maintainership to somebody and just do Buildroot. (We were talking a lot
behind the scenes because of the GPL enforcement suits, which seemed
like a good idea at the time but wound up drawing Erik further away from
day-to-day programming).

But the new uClibc maintainer Erik chose was Mike Frysinger, who
maintained a prominent out of tree fork for blackfin (proprietary, only
customers could access it). And over the next year, Mike never put out a
release. He allowed the gap since the last release to grow to its
highest level ever, and then stopped posting to the uClibc list entirely
to focus on his proprietary blackfin port (which was only available to
customers). When it had been FOUR MONTHS since Mike last posted to the
list, while everybody else was trying to get a release together (because
hey, new maintainer would unblock the project, right?)

So after the new maintainer didn't cut a release for a year and didn't
post to the list for four motnhs straight, I got sick of him:

  http://lists.busybox.net/pipermail/uclibc/2008-September/019987.html

And basically staged a coup and appointed a new maintainer who had the
benefit of actually SHOWING UP:

  http://lists.busybox.net/pipermail/uclibc/2008-October/020339.html

(Remember, root access to the server, and the previous maintainer
answered my email.)

I pitched in and started testing everything, and sending in patches to
try to get a release out and get development unstuck under the new
maintainer (Bernhard, who is still the current nominal maintainer of
uClibc, I.E. the guy _you_ stepped in to replace):

  http://lists.busybox.net/pipermail/uclibc/2008-September/020033.html
  http://lists.busybox.net/pipermail/uclibc/2008-September/020178.html
  http://lists.busybox.net/pipermail/uclibc/2008-September/020182.html
  http://lists.busybox.net/pipermail/uclibc/2008-September/020180.html

Of course bernhard's last release was in 2012, and he let things go over
three years after that without a release before I basically gave up,
stopped performing CPR, and called it. The uClibc project was dead.

Presumably you know it from there, but you're now the FOURTH maintainer
of the project _since_ it died.

You came into a project I'd pushed for 10 years and started collecting
trivial bugfixes without addressing any of the serious architectural
issues (like needlessly duplicated per-architecture headers snapshot
from ancient glibc versions, with a #define pretending to be glibc (musl
doesn't) and declaring all sorts of stuff the library doesn't actually
implement). And you're wondering why I have a more pessimistic outlook
of your chances than you do?

The big elephant in the development room was the NPTL code, and cortex-m
is still using pthreads, not nptl, and WITHIN that pthreads mess is _old
and _new versions of thread wait for supporting 2.2 kernels. (The
menuconfig option has been replaced with _old and _new suffixes on the
functions. Great.)

That does not say to me that you've actually _fixed_ anything. Sure you
can maintain your own version. Just like BeOS isn't really dead as long
as the Haiku project persists, or osfree.org is keeping OS/2 alive, or
reactos can keep windows 95 alive, the multiple open source AmigaOS
clone attempts. But I'm not sure why I should CARE.

You've said that your reason for supporting uclibc-ng was for two
architectures, ARC and Xtensa:

  http://www.openwall.com/lists/musl/2015/05/30/1

That is why _you_ care. I personally think that adding support for those
to musl-libc would be a far better use of your time, but it's not my job
to tell you want to do. It's your hobby time. Do what you like with it.
Just don't expect me to take you seriously after ten years of this.

> It is really cool and very nice that the communication between Rich
> and me is always fruitful. I always report any bugs I find while
> testing musl on new or old platforms (mostly via IRC channel) and I
> always take care that bugfixes for musl targets end up in buildroot.
> (mipsr6 support, binutils microblaze problems, ..)
> 
> I really would like to see a similar open communication between the 
> nommu community, you and me. 
> 
> Just ignoring uClibc-ng does not will make it die.

I cc'd buildroot. That is a real project, which still uses uClibc for
the targets Rich hasn't gotten around to porting musl to yet. I cc'd
them so they would be aware of the issue. I could have just sent it to
the musl list, but chose to inform buildroot as well.

(Oddly enough, lists.buildroot.org doesn't have a web archive of the
list. I have to go to lists.busybox.net to see the archive? I would have
thought they'd moved it over by now. I can _email_ @buildroot...)

> As a good starting point, a nice bug report and/or test application
> which allows me to reproduce the problem would be really
> appreciated.

I spent several days trying to come up with a decent test case, it was
Jonathan finding the eratta that says "this particular instruction has
to get interrupted" that let me know what was actually going on (and
that a reliable reproduction sequence can't be isolated, you need
something like the serial port going to hammer the system with
interrupts to make it happen in under an hour).

That said, the board crashing under load is pretty easy to spot.
Figuring out _why_ was the hard part. :)

Of course this particular group of people using uClibc for a new
cortex-m project were originally specced to use "uclinux". As in
http://www.uclinux.org/ which had its a total disk failure take out its
CVS repository a few years back, but one guy is still putting out
releases every year by editing the previous year's release files, with
no source control. Therefore the project still isn't dead despite the
newest file in the "http download" link on the left being from 2003 and
their "the developers" page having a... ahem, _slightly_younger_ picture
of Jeff Dionne than https://lwn.net/Articles/647636/ (who moved to Japan
in 2003 and hasn't particularly been involved with that project since
then)...

I pointed them at buildroot instead, and I informed buildroot of a bug
using their stuff. If uclinux wants to complain I didn't cc: them on
this bug either...

> best regards
>  Waldemar

Rob
