From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Feb 2017 22:50:56 +0100
Subject: [Buildroot] [PATCH 0/2] package/directfb,sdl: fix static link
In-Reply-To: <cover.1487885342.git.yann.morin.1998@free.fr>
References: <cover.1487885342.git.yann.morin.1998@free.fr>
Message-ID: <20170223225056.57bdac3f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Feb 2017 22:29:19 +0100, Yann E. MORIN wrote:

> Yann E. MORIN (2):
>       package/directfb: hack .pc file for static link
>       package/sdl: fix .pc file

Thanks for working on this. However, can we instead patch the directfb
and sdl build system?

For example, the SDL build system should not add -ldirect to Libs: if
DirectFB was detected with pkg-config, it should add it to the
Requires: line.

For DirectFB, I think libstdc++ could be unconditionally added to
directfb.pc.in.

*But*: let's take a step back. Do we really care about using DirectFB
in static-only scenarios ? If only DirectFB and SDL were active
upstream projects, there would be some incentive to fix this problem
properly. But really, there is no such incentive. So what about making
DirectFB depend on !BR2_STATIC_LIBS instead, and be done with it ?

Nowhere in Buildroot we "select BR2_PACKAGE_DIRECTFB", which means it's
really a simple change to do, as we don't need to propagate this
dependency to any reverse dependency.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
