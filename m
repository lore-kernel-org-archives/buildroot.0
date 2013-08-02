From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 2 Aug 2013 10:52:42 +0200
Subject: [Buildroot] [PATCH 2 of 4] host-ccache: turn into a proper
	dependency
In-Reply-To: <CAHXCMM+DtuDr4OBq7e5zdj4+pQnu2uOXP9bj_COxt=hWkwre=w@mail.gmail.com>
References: <patchbomb.1375428832@BEANTN0L019720>
 <f72fc9db6ce74195608e.1375428834@BEANTN0L019720>
 <CAHXCMM+DtuDr4OBq7e5zdj4+pQnu2uOXP9bj_COxt=hWkwre=w@mail.gmail.com>
Message-ID: <20130802105242.123b40af@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Fri, 2 Aug 2013 10:27:49 +0200, Samuel Martin wrote:

> > Note: this in itself works, when the dependencies are built (regular 'make'
> > for example, or explicit 'make dependencies'). However, if we want to
> > supersede patch http://patchwork.ozlabs.org/patch/257372/, that wants
> > the following to work:
> >
> > $ make clean menuconfig
> > $ make {barebox,busybox,ctng,linux,uclibc}-menuconfig
> >
> > then I think something additional is necessary. In the above flow, the
> > dependencies target is never used, so host-ccache doesn't get a chance to
> > build.
> Humm... I don't think so. This patch should be enough to fix the bug #5678.
> I mean, to run *-menuconfig, the package need to be extracted beforehand.
> I expect the 'dependencies' target is part of dependency list of the
> *-extract target (because of host-tar).

But it's not the case as far as I can see.

in busybox.mk:

busybox-menuconfig busybox-xconfig busybox-gconfig: busybox-patch

in pkg-generic.mk

$(1)-patch:             $(1)-extract $$($(2)_TARGET_PATCH)

$(1)-extract:           $(1)-source \
                        $$($(2)_TARGET_EXTRACT)

$(1)-source:            $$($(2)_TARGET_SOURCE)

and that's it. Nowhere it pulls 'dependencies' as far as I can see.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
