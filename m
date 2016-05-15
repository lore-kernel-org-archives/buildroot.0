From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 May 2016 21:38:55 +0200
Subject: [Buildroot] [PATCH] stress-ng: workaround sparc64 gcc ICE
In-Reply-To: <20160514184227.GA2898@waldemar-brodkorb.de>
References: <20160514184227.GA2898@waldemar-brodkorb.de>
Message-ID: <20160515213855.75ba5344@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 14 May 2016 20:42:27 +0200, Waldemar Brodkorb wrote:

> diff --git a/package/stress-ng/0001-disable-vector-sparc64.patch b/package/stress-ng/0001-disable-vector-sparc64.patch
> new file mode 100644
> index 0000000..e740b76
> --- /dev/null
> +++ b/package/stress-ng/0001-disable-vector-sparc64.patch
> @@ -0,0 +1,21 @@
> +Reported upstream:
> +https://bugs.launchpad.net/ubuntu/+source/stress-ng/+bug/1581843

It was weird to report a gcc bug against the package that fails to
build.
> +diff -Nur stress-ng-0.04.16.orig/stress-ng.h stress-ng-0.04.16/stress-ng.h
> +--- stress-ng-0.04.16.orig/stress-ng.h	2015-09-07 11:04:09.000000000 +0200
> ++++ stress-ng-0.04.16/stress-ng.h	2016-05-14 20:16:10.543917851 +0200
> +@@ -457,9 +457,12 @@
> + #define STRESS_X86	1
> + #endif
> + 
> ++/* triggers gcc ICE */
> ++#if !defined(__sparc_v9__)
> + #if NEED_GNUC(4,7,0)
> + #define STRESS_VECTOR	1
> + #endif
> ++#endif
> + 
> + /* NetBSD does not define MAP_ANONYMOUS */
> + #if defined(MAP_ANON) && !defined(MAP_ANONYMOUS)

What about using the patch that was actually committed upstream, i.e
http://kernel.ubuntu.com/git/cking/stress-ng.git/commit/?id=9b5a3aaffdd613f03c10ebe3550b89193e9993ef
according to the bug report you're pointing to?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
