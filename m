From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 21 Jan 2021 22:19:52 +0100
Subject: [Buildroot] [PATCH 2/2] package/mono: disable boehm
In-Reply-To: <20210120175443.157316-2-fontaine.fabrice@gmail.com>
References: <20210120175443.157316-1-fontaine.fabrice@gmail.com>
 <20210120175443.157316-2-fontaine.fabrice@gmail.com>
Message-ID: <20210121221952.34051359@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Jan 2021 18:54:43 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> mono uses the Unity fork of recent Boehm since version 6.10.0.65 and
> https://github.com/mono/mono/commit/cc137237d86b0553e844dc34c9a3cbc5b20782c0
> 
> However, this raises the following build failure:
> 
> /tmp/instance-0/output-1/per-package/mono/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/bits/string3.h:81: warning: memset used with constant zero length parameter; this could be due to transposed parameters
> ../../external/bdwgc/.libs/libgc.a(gc.o): In function `GC_steal_mark_stack':
> gc.c:(.text+0x1d18): undefined reference to `AO_store_full_emulation'

Well, isn't it simply forgetting to link with libatomic_ops ?

Look at your patch from 2018 on bdgwc:
http://lists.busybox.net/pipermail/buildroot/2018-November/235145.html,
the issue was the same, and was caused by the fact that it wasn't
linking with libatomic_ops.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
