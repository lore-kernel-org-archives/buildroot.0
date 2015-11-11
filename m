From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2015 14:24:17 +0100
Subject: [Buildroot] [PATCH] package/gauche: remove unnecessary files
 for target, fix a typo
In-Reply-To: <201511111311.tABDB5aR013551@ms-omx03.plus.so-net.ne.jp>
References: <20151110114211.365afbbc@free-electrons.com>
 <201511111311.tABDB5aR013551@ms-omx03.plus.so-net.ne.jp>
Message-ID: <20151111142417.76bf1bb7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hiroshi,

On Wed, 11 Nov 2015 22:11:04 +0900, Hiroshi Kawashima wrote:

> 2015-11-11 12:36:54	xtensa		gc not ported

Right, exclude this architecture.

> 2015-11-10 23:30:21	powerpc		./libgauche-0.9.so: undefined reference to `getcontext'

This probably only happens with certain C libraries only. Check if this
build failure occurs with uClibc or glibc, probably only with uClibc.

> 2015-11-10 23:11:45	arc		gc not ported

Right, exclude this architecture as well.

> 2015-11-10 22:20:21	powerpc		./libgauche-0.9.so: undefined reference to `getcontext'
> 2015-11-10 17:30:19	arc		gc not ported
> 2015-11-10 14:16:58	sh4		./libgauche-0.9.so: undefined reference to `getcontext'
> 2015-11-10 08:46:51	powerpc		./libgauche-0.9.so: undefined reference to `getcontext'
> 2015-11-10 04:28:00	arm		./libgauche-0.9.so: undefined reference to `AO_pt_lock'

This is what happens when libatomic_ops is built before gauche. In this
case, gauche tries to use the external libatomic_ops instead of its
internal one.

As I already suggested to fix this, you have two options:

 (1) Understand why using the external libatomic_ops doesn't work and
     fix it.

 (2) Pass a configure option to gauche to force it to use its internal
     version of libatomic_ops.

I'd prefer (1), but we can live with (2) if (1) is too complicated.

> 2015-11-10 00:00:05	arm		./include/private/../gc_pthread_redirects.h:37:22: fatal error: dlfcn.h: No such file or directory

Two options here:

 (1) boehm gc in gauche supports the GC_NO_DLOPEN like the official
     boehm gc. In this case, pass -DGC_NO_DLOPEN when
     BR2_STATIC_LIBS=y. See bdwgc.mk for an example.

 (2) Make gauche depend on !BR2_STATIC_LIBS.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
