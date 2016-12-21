From: Rob Landley <rob@landley.net>
Date: Tue, 20 Dec 2016 21:32:41 -0600
Subject: [Buildroot] [musl] cortex-m support?
In-Reply-To: <7c500379-491b-3099-bef7-5b3a3e0bf354@mind.be>
References: <04e5a294-719e-8029-704f-a57d1ec935b0@landley.net>
 <20161208211116.GO1555@brightrain.aerifal.cx>
 <7bfe2625-725d-d1bb-7177-f2d31ce09e9c@landley.net>
 <20161215185123.GX15584@waldemar-brodkorb.de>
 <48fb6c09-9dcb-e563-dc2d-f30062c5fceb@landley.net>
 <7c500379-491b-3099-bef7-5b3a3e0bf354@mind.be>
Message-ID: <964d9d0b-c0dd-406a-aafa-ca7ef7a64d02@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/20/2016 05:37 PM, Arnout Vandecappelle wrote:
>  Hi Rob,
> 
>  First of all, thank you very much for this writeup on the history of uClibc and
> Buildroot. It was a really interesting read and filled in a lot of the blanks
> for me. Something like this should appear on lwn.net.

Computer history's a hobby of mine (http://landley.net/history/mirror).
I occasionally try to document lived experience ala
http://landley.net/aboriginal/history.html or
http://landley.livejournal.com/41393.html or tell a larger story I
pieced together in research like two part
http://landley.net/notes-2010.html#17-07-2010 and
http://landley.net/notes-2010.html#19-07-2010 . Sometimes my history is
highly opinionated (https://landley.net/notes-2014.html#04-09-2014)
Sometimes a random post I make goes viral ala
http://www.osnews.com/story/25556/Understanding_the_bin_sbin_usr_bin_usr_sbin_Split
but mostly not.

If you think _this_ was a linkbomb, you haven't read the green bits and
appendices of https://landley.net/writing/halloween9.html

tl;dr asking me "why did X happen" is dangerous. :)

>  Funny thing: that very post points to the (very active, as Thomas wrote)
> uclibc-ng mailing list...

As I said, I hadn't clicked on the link labeled "release notes". If you
don't know there's a community there, it doesn't necessarily indicate
there's a community there. But good to know.

>> Your fork clearly hasn't fixed any of the structural issues uClibc
>> developed over the years.
> 
>  It is pretty rare that a fork fixes the problems with the original project.
> eglibc is one of the few ones that come to mind, I expect uClibc-ng to replace
> uClibc completely, perhaps taking over the original name at some point.

Quite likely, given gcc->pcc->egcs->gcc last decade, x.org replacing
xfree86, shortly after I wrote that "patch penguin" thing Alan Cox took
a year off from Linux development to get an MBA so his tree _wouldn't_
displace Linus's tree... It happens.

But I've got my plate full regression testing against glibc, bionic, and
musl. My periodic attempts to add a fourth have mostly centered around
BSD variants.

  https://landley.net/notes-2013.html#15-09-2013
  https://landley.net/notes-2014.html#01-04-2014
  https://landley.net/notes-2014.html#11-09-2014

All the new uClibc installs I've seen in the past ~2 years have been
people who think "uclinux" is still synonymous with "nommu". (I've been
working with Jeff Dionne to try to get http://nommu.org and such off the
ground, but I'm juggling too many other balls to give this one the time
it deserves.)

>> This was debugging through the _old_ legacy pthreads implementation,
>> which is the only option on cortex-m because even the one buildroot has
>> today never got NPTL working there. 
> 
>  Much like the musl that buildroot has today doesn't have NPTL support for ARM
> NOMMU ;-)

See thread starting at http://www.openwall.com/lists/musl/2016/12/07/2
and ongoing. I.E. I'm working on that.

> [snip]
>> I used to prod other projects to support uClibc too. For example, it
>> took me three years to finally convince qemu to stop being incompatible
>> with uClibc static binaries on powerpc, but they finally made the change:
> 
>  Then you have your work cut out with musl... In Buildroot, we currently have 48
> packages that are excluded on musl, and 114 that need to be patched to be able
> to build with musl. And that's not taking into account the global hacks we
> introduced for musl: cdefs.h, queue.h, linux headers patching...

Musl is the default C library of ChromeOS, and one of the defaults on
Docker. That gives it a largeish installed base. (And it's a "young"
energetic project with the cleanest code out there, easy to add another
architecture, responsive knowledgeable maintainer, etc.)

Bionic is the default C library of Android. That gives it a ridiculously
large installed base. Elliott Hughes (the bionic maintainer) is the
second most active contributor to my toybox project, so they've added
more than one feature for me already. Most recently, he's been trying to
adapt the android NDK so I can build toybox a bionic toolchain I didn't
have to build from soruce (see
http://lists.landley.net/pipermail/toybox-landley.net/2016-December/008767.html
).

Glibc is the default C library of all the other big iron "Cloud" linux
distros as the PC gets kicked up into the server space like mainframes
and minicomputers before it. (Boring but lucrative.)

I have reasons to be interested in all three of these.

>  The problem with musl is that the world is not posix :-/  Ignoring this fact
> moves the problems from libc to distros.

The "Year of the Linux Desktop" you've heard so much about was 1998.
(And yes, it lasted about a year.)

Just as economies of scale shifting from desktop to laptop components
gave us "blade servers", the economies of scale from a billion annual
phone sales are going to switch everything over to that and price "big
iron" PC components out of the market before too much longer. Faceboot
already runs its servers on ARM. Google is playing its cards close to
its chest but I doubt the powerpc side of
http://www.eetimes.com/document.asp?doc_id=1329374 means much in the
long run (ppc unit volume came from game consoles last generation, but
I'm told xbone and ps4 are both 8-way AMD x86-64 chips?)

Sure you can do conventional linux on arm, and big iron tends to be
conservative (ala sticking with cobol as long as it could). but it also
never invents anything new because those aren't the machines anybody
actually sits in front of. The machines people sit in front of are
phones, and tablets (big phones).

There's always the issue of "what do people write code on" (see Sun's
perennial attacks on Solaris-x86 eliminating its entire developer base)
If android development becomes self-hosting (which I'm _working_ on, ala
http://landley.net/aboriginal/about.html#selfhost and
https://www.youtube.com/watch?v=SGmtP5Lg_t0 and
https://lwn.net/Articles/629362/ ) then you stop cross compiling from
x86 (mostly windows machines outside of Google, according to Elliott's
interview at
http://androidbackstage.blogspot.com/2016/07/episode-53-adb-on-adb.html)
and start compiling natively on Android machines. And that means bionic.

*shrug* I could be wrong. The future's always hard to predict.

>> It's nice that you're maintaining buildroot's uClibc so they don't have
>> to maintain their own fork anymore
> 
>  You seem to have things wrong here. We never maintained a buildroot uClibc,
> other than picking some of the uClibc commits and applying them on top of
> 0.9.33.2.

Maybe not officially, but de-facto buildroot did have its own uClibc.

Then again I had over a dozen uClibc patches at
https://github.com/landley/aboriginal/tree/master/sources/patches before
http://lists.landley.net/pipermail/aboriginal-landley.net/2016-May/002567.html
and
http://lists.landley.net/pipermail/aboriginal-landley.net/2016-November/002591.html
.

> When Waldemar's fork appeared, we started offering that fork as a
> choice, then after a few months we switched to uClibc-ng as the default version,
> and about a year later we dropped support for the original uClibc-ng.

Somebody once said that in a vacuum, all something has to do is exist.
(Woody Allen also said "80% of life is showing up", but the quote I
can't quite remember was better.)

>> (like emcraft still does, or
>> https://github.com/mickael-guene/uclibc/tree/uClibc-0.9.33.2-fdpic-m).
>> Your version is more interesting to me than random other attempt du jour
>> like https://github.com/davidgfnet/uClibc-Os because buildroot uses your
>> version.
> 
>  I think the main reason why uClibc-ng is more interesting is that it is the
> only fork that is actually active: it has a maintainer, a mailing list, regular
> releases, a bug tracker, ... .

And buildroot uses it.

> [snip]
>> The first problem is that buildroot forked off and sucked away all
>> uClibc's developers for several years. 
> 
>  That's an interesting way of looking at it... But back in those days, Buildroot
> development suffered pretty much from the same problems as uClibc, no?

I didn't give the project its own list to _hurt_ buildroot. :)

(I could go into more extended analysis here, but it would be more
tl;dr. I'm glad Erik handed over to Thomas, it was very good for the
project.)

> [snip]
>> Presumably you know it from there, but you're now the FOURTH maintainer
>> of the project _since_ it died.
> 
>  Fourth time is the charm :-)

This implies Bernhard burned down, fell over, and then sank into the
swamp. Seems a bit harsh.

(I have searched the internet. There is no supercut of the Swamp Castle
construction speech and Sinclair explaining to Delenn why they built
Babylon 5 after the first 4 were destroyed. I has a disappoint.)

(Yes, I am aware of http://koti.kapsi.fi/sph/b5/montypython.html .)

> [snip]
>> I cc'd buildroot. That is a real project, which still uses uClibc for
>> the targets Rich hasn't gotten around to porting musl to yet.
> 
>  We do about as much uClibc maintainance as we do musl maintainance, so you
> should probably send all musl-related patches to the buildroot mailing list as
> well :-P

I build my own musl systems and toolchains. The project I was debugging
used buildroot, so I sent you the fix to help them.

>> I cc'd
>> them so they would be aware of the issue. I could have just sent it to
>> the musl list, but chose to inform buildroot as well.
>>
>> (Oddly enough, lists.buildroot.org doesn't have a web archive of the
>> list. I have to go to lists.busybox.net to see the archive? I would have
>> thought they'd moved it over by now. I can _email_ @buildroot...)
> 
>  IIRC Peter looked at that but it turns out not to be so trivial to migrate a
> mailman setup.

Ugh, tell me about it. People got interested in a post I made
(https://utcc.utoronto.ca/~cks/space/blog/unix/GccEarlyEnthusiasm) and
then dreamhost deleted a couple months of the web archive for the
_third_ time and that was one of the ones that went. (And then gmane
went down and _their_ copy went too. Oh well.)

*shrug*. Dreamhost is cheap.

Rob
