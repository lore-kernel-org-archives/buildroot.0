From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 May 2017 16:07:54 +0200
Subject: [Buildroot] [PATCH 3/3] package/bluez_utils: fix test build
 issues with musl
In-Reply-To: <20170513171009.5219-3-romain.naour@gmail.com>
References: <20170513171009.5219-1-romain.naour@gmail.com>
 <20170513171009.5219-3-romain.naour@gmail.com>
Message-ID: <20170514160754.5f2b9934@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 13 May 2017 19:10:09 +0200, Romain Naour wrote:
> Add one missing header and avoid encrypt redefinition.
> 
> Fixes:
> http://autobuild.buildroot.net/results/06c/06c930d9c5299b79500d018ac3fb2861ce834c7c/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

I've applied. See a few comments below though.

> diff --git a/package/bluez_utils/0005-test-avoid-conflict-with-encrypt-function.patch b/package/bluez_utils/0005-test-avoid-conflict-with-encrypt-function.patch
> new file mode 100644
> index 0000000..51ab0c1
> --- /dev/null
> +++ b/package/bluez_utils/0005-test-avoid-conflict-with-encrypt-function.patch
> @@ -0,0 +1,107 @@
> +From d8056252d0c99bfb2482f0a420dcf9a36019ddf8 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Sat, 13 May 2017 18:58:51 +0200
> +Subject: [PATCH 5/5] test: avoid conflict with encrypt function

Please generate patches with 'git format-patch -N' to avoid the
sequence number in the patch itself. Thanks!

> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +With a musl based toolchain:
> +
> +test/l2test.c:110:12: error: ?encrypt? redeclared as different kind of symbol
> + static int encrypt = 0;
> +            ^
> +In file included from test/l2test.c:34:0:
> +[...]/sysroot/usr/include/unistd.h:145:6: note: previous declaration of ?encrypt? was here
> + void encrypt(char *, int);

This encrypt thing is a bit messy, because the same issue for another
part of bluez_utils is solved in a different way in
0003-fix-compilation-issues-with-musl.patch.

Anyway the existing patches are already a bit messy. Perhaps we should
start thinking about phasing out bluez_utils? Is there a good reason to
still have bluez_utils? Are there some features or hardware devices
that work with bluez_utils and not bluez5_utils? Or does bluez5_utils
requires a recent kernel version?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
