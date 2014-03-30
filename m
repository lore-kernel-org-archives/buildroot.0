From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Mar 2014 17:21:28 +0200
Subject: [Buildroot] qt5, eglfs and xcb
In-Reply-To: <5338207F.9010807@gmail.com>
References: <5338207F.9010807@gmail.com>
Message-ID: <20140330172128.06f1d5d2@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Marco Trapanese,

On Sun, 30 Mar 2014 15:47:43 +0200, Marco Trapanese wrote:

> when you try to build qt5 with the X support (xcb), selecting one of the 
> following modules: qtquick*, qt5declarative, qt5graphicaleffects and 
> qt5multimedia, leads to force the selection of the eglfs support.
> 
> After three days of build failures (due to the same constants defined 
> both from xbc and eglfs) I asked an aid to a company which offer a 
> technical support about Qt. The says only qtquick2 requires the opengl 
> acceleration and this one is provided also from xbc.

This is not quite correct (even though the general problem you raise
actually exists).

First, it's actually qt5declarative that requires OpenGL (or OpenGL ES)
support, and qt5quick1 depends on qt5declarative. Same for
qt5graphicaleffects, it depends on qt5declarative.

Moreover, under X.org, having XCB is clearly not sufficient to get
OpenGL support. XCB is merely a modern implementation of libX11, which
allows to talk to the X server to do some rendering, but not direct,
OpenGL rendering.

> So it shouldn't required at all the eglfs plugin if you're using X.

This is correct. eglfs is only needed for non-X.org situations.

> Please, might you verify this?
> If they are right, could you fix the dependencies so we can build a 
> working buildroot image with Qt5 and xcb?

As explained above, this requires more than just XCB, contrary to what
the company you requested support from is claiming. You need an OpenGL
implementation that works under X.org, and this implementation is
usually Mesa. And the support for making Mesa recognized as a proper
OpenGL implementation has only been merged since yesterday, and is not
yet completely ready.

It would certainly be interesting to fix this in Buildroot and allow
Qt5 to build for X.org with OpenGL support. But if you want this to
happen, you should either:

 1) Do it yourself.

 2) Wait for someone else to do it, but then you can't expect any
    particular deadline or guarantees. It may be something that will
    get done this summer as part of the Google Summer of Code.

 3) Hire a third party to do it. Actually, it's a little bit strange
    that you've asked a company who isn't able to fix the problem in
    Buildroot, rather than a company that actually is able to do it.

BTW, what is your hardware platform? What type of graphics hardware are
you using? What X.org driver are you using?

Anyway, thanks for the report, this is definitely something that should
be improved.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
