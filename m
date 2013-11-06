From: Charles Krinke <charles.krinke@gmail.com>
Date: Wed, 6 Nov 2013 11:08:22 -0800
Subject: [Buildroot] Qt5 puzzle
In-Reply-To: <CAAXf6LUaGLQh8h7Ujnpaciyq4dz3PM43S7spOcpi08Wd83PUtA@mail.gmail.com>
References: <CALo-6+gmYsfcV1yU2oEAfkbCHCqi2YHSwp6CtvkTX8+bmfXYUw@mail.gmail.com>
 <CAAXf6LUaGLQh8h7Ujnpaciyq4dz3PM43S7spOcpi08Wd83PUtA@mail.gmail.com>
Message-ID: <CALo-6+g+cuLUjWi5+PC+Y1+MUcuENnv3etVT3FXrk3Yqf_vF5Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think I see what is going on. It looks like Qt sets USE_EABI_HARDFLOAT=0
when I need it to be USE_EABI_HARDFLOAG=1.

This is done in qt5jsbackend-5.0.2/src/vi/v8.pri as a consequence of

config_hardfloat {
  DEFINES += USE_EABI_HARDFLOAT=1
} else {
  DEFINES += USE_EABI_HARDFLOAT=0
}

Where config_hardfloat is always undefined.

This may bring up a larger question in that some embedded systems will wish
to use softfloat and some hardfloat




On Wed, Nov 6, 2013 at 9:28 AM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Hi Charles,
>
> On Wed, Nov 6, 2013 at 5:57 PM, Charles Krinke <charles.krinke@gmail.com>
> wrote:
> > Recently one of our app engineers moved to QtQuick 2.0 and all of a
> sudden
> > with the buildroot built binaries from Qt-5.0.2, I am seeing this error
> when
> > a qml-style program is run.
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
> Although I have no experience whatsoever with qt (and will not be able
> to help you myself), I suggest to send a (def)config file that
> exhibits the problem. This may help others in trying to reproduce the
> problem...
>
> Best regards,
> Thomas
>



-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131106/a0247754/attachment.html>
