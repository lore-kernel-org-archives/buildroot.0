From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 6 Nov 2013 12:55:05 -0800
Subject: [Buildroot] Qt5 puzzle
In-Reply-To: <20131106191859.2c4d295c@skate>
References: <CALo-6+gmYsfcV1yU2oEAfkbCHCqi2YHSwp6CtvkTX8+bmfXYUw@mail.gmail.com>
 <20131106191859.2c4d295c@skate>
Message-ID: <CALo-6+gh9ZL4prfb2kVUgzFi=DZGuL7GrB4zmyqW7VL9GBgOLQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes, sir. I am attaching the config so as not to clog up the email too much
and I appreciate your kind words as usual.

Charles


On Wed, Nov 6, 2013 at 10:18 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Charles Krinke,
>
> On Wed, 6 Nov 2013 08:57:45 -0800, Charles Krinke wrote:
>
> > Recently one of our app engineers moved to QtQuick 2.0 and all of a
> sudden
> > with the buildroot built binaries from Qt-5.0.2, I am seeing this error
> > when a qml-style program is run.
> >
> > ERROR: Binary compiled with -mfloat-abi=hard but without
> > -DUSE_EABI_HARDFLOAT
> >
> > In searching this, I can see mention of this on the buildroot mailing
> list
> > from June, but no hints or resolution. The archive of the mailing list is
> > this page:
> >
> >
> http://buildroot-busybox.2317881.n4.nabble.com/ERROR-Binary-compiled-with-mfloat-abi-hard-but-without-DUSE-EABI-HARDFLOAT-td49130.html
> >
> > Although I am using the TI AM3517 and not Raspberry Pi, the error seems
> to
> > be the same.
> >
> > I am assuming this has something to do with make options. This morning, I
> > tried adding "-DUSE-EABI_HARDFLAT" to the Makefile for libQt5V8 where the
> > offending message is coming from, but the cheap shot doesnt work.
> >
> > I am working with a buildroot from the end of July, so am not using the
> > experimental Qt-5.1 stuff (yet) and am hoping not to move forward in a
> > crisis if I can help it.
> >
> > So, ... as usual, I am hoping for a clue or two to let me understand how
> to
> > get QtQuick back to functionality with Qt-5.0.2.
>
> Interesting. I had a look at this, in Qt 5.0.2, as packaged in
> Buildroot 2013.08. Normally, the USE_EABI_HARDFLOAT flag should
> automatically be set to 1 by Qt. From src/v8/v8.pri:
>
> equals(V8_TARGET_ARCH, arm) {
> DEFINES += V8_TARGET_ARCH_ARM
> config_hardfloat {
>     DEFINES += USE_EABI_HARDFLOAT=1
> } else {
>     DEFINES += USE_EABI_HARDFLOAT=0
> }
> ...
>
> config_hardfloat is I believe decided from the test executed from the
> main qtjsbackend.pro:
>
> qtCompileTest(hardfloat)
>
> and there is indeed a config.tests/hardfloat/, which builds a program,
> and then looks up with readelf if it's built hard float or not. Most
> likely this test is failing, for some reason, and therefore believes
> that the toolchain is not hardfp, while it actually is. I had a quick
> read of the test and it seems to be testing something correct.
>
> Can you post your .config so we can see what your toolchain is and what
> is your Buildroot configuration?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131106/5971295c/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: qt5-config
Type: application/octet-stream
Size: 37515 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131106/5971295c/attachment-0001.obj>
