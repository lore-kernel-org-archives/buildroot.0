From: Rob Landley <rob@landley.net>
Date: Wed, 25 Jan 2017 17:00:48 -0600
Subject: [Buildroot] [PATCH 1/1] toybox: new package
In-Reply-To: <87k29kix8z.fsf@dell.be.48ers.dk>
References: <5422DBCD.10505@landley.net>
 <CA+TH9Vk+5EVM7xFgcjQG8C1qWFmRwb-fNhu=HSzJ2YKwDT9kmw@mail.gmail.com>
 <54DBCBA5.7010307@landley.net>
 <CA+TH9Vmveq-bH2x1PnYg5zC=dDgy079N6sSdqe-+Gn2aUab5eA@mail.gmail.com>
 <87k29kix8z.fsf@dell.be.48ers.dk>
Message-ID: <8b233955-d30b-1945-1a88-774c6bf865e1@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/24/2017 04:10 AM, Peter Korsgaard wrote:
>>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:
> 
>  > Hi Rob,
>  > Sorry for asking you again, but it will be a new toybox patch any time soon?
> 
>  > I would really like to have toybox in buildroot!
> 
> Out of interest, why? What does it bring you that busybox doesn't have?

I don't think 'iotop' is the answer you're looking for. :)

Toybox provides the standard command line of Android since the "M"
release, as covered by Linux Weekly News here:
https://lwn.net/Articles/629362/ A few months ago Elliott Hughes (the
Android toolbox and bionic maintainer) posted a roadmap to replacing the
last bits of toolbox with toybox:

http://lists.landley.net/pipermail/toybox-landley.net/2016-June/008484.html

I explained my plan for toybox and Android in this 2013 ELC talk:

  video; https://www.youtube.com/watch?v=SGmtP5Lg_t0
  outline: http://landley.net/talks/celf-2013.txt

The tl;dr is phones ship a billion units a year which is going to do to
the PC what the PC did to the minicomputer, but a read-only iPad future
would be a bad thing, so I'm trying to turn Android into a self-hosting
development environment capable of rebuilding itself from source code,
so that _having_ an android phone is sufficient to become a first class
Android developer up to and including doing OS development. (This has
been the case on the PC for decades; if it doesn't _become_ the case on
phones then when PC unit volume drops and they become rare and expensive
we're kinda screwed. Think what happened to Solaris after they got
kicked out of the workstation market by cheap PCs.)

My model use case is an 8 year old girl in india inheriting her mother's
old phone and scrounging up an old USB hub/keyboard/mouse and HDTV. (Or
bluetooth+chromecast and plug the phone into the wall to keep it
powered. Or a solar panel.) Does she have enough to become a systems
developer? What do I need to add to android so that _having_ an android
phone is sufficient to being a first class Android developer, up to and
including OS development? (Like it's been on the PC since Linux started?)

So yes you need a full set of command line utilities good enough to run
build scripts, along with a native llvm and maybe a posix chroot you can
access via Android's container infrastructure (minijail:
https://lwn.net/Articles/700557/). And it should all be preinstalled:
how old can the phone be before there's no active app store for it? But
most of those details are still way down the road.

My previous project (http://landley.net/aboriginal/about.html) is what
led me to extend BusyBox in the first place (and eventually become
maintainer for a bit). I extended it until it could replace all the gnu
packages in Linux From Scratch and give you a tiny development
environment still capable of rebuilding itself (and the original Linux
From Scratch). My motivation back _then_ was that Knoppix had a 700 meg
CD space budget but 100 megs of that was the gnu packages in Linux From
Scratch which tomsrtbt fit in 1.7 megs using busybox and uClibc; and if
I could free up an extra 100 megs for knopix they could work wonders
with it. The 1.0 release of that (I.E. 'does what it set out to do') was
several years ago.

Now instead of Linux From Scratch, I need to take apart the Android Open
Source Project and turn it into a layered system where you can build a
simple "base OS" (boot to a shell prompt layer, init and service demons
layer, app runtime layer...) without downloading 20-something gigabytes
of source code first. But that giant todo item is next up _after_ a 1.0
toybox release, and I've still got a lot of
http://landley.net/toybox/roadmap.html to work through.

Rob

P.S. You asked.

P.P.S. No asking people to reimage their phone before they can do
anything isn't good enough: less than 2% of PC users ever did this, it's
not going to get more common with phones. Preinstalls matter.
