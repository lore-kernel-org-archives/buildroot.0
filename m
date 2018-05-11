From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 May 2018 13:09:28 +0200
Subject: [Buildroot] [PATCH 1/3] go: patch to fix cross-compilation
 support
In-Reply-To: <20180511101020.10295-2-anisse@astier.eu>
References: <20180511101020.10295-1-anisse@astier.eu>
 <20180511101020.10295-2-anisse@astier.eu>
Message-ID: <20180511130928.6211a644@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks a lot Anisse for those patches!

On Fri, 11 May 2018 12:10:18 +0200, Anisse Astier wrote:
> This patches the go toolchain with upstream-proposed patch by Angelo in
> order to fix cross-compilation when building a go toolchain for a target
> that has the same os and arch as host, but a different libc. This should
> fix the buildroot autobuild failures on x86_64 musl/uclibc targets.
> 
> This patch should go as soon as it's accepted or a similar upstream
> feature is merged.

The commit log of the patch that fixes the build issue should have a
reference to the autobuilder failure being fixed, such as:

Fixes:

  http://autobuild.buildroot.org/...

> I'm adding myself to the DEVELOPERS file in order to get CC-ed to future
> build failures.

This should be done as part of a separate patch.


> diff --git a/package/go/0001-cmd-dist-explicit-option-for-crosscompilation.patch b/package/go/0001-cmd-dist-explicit-option-for-crosscompilation.patch
> new file mode 100644
> index 0000000000..a779179609
> --- /dev/null
> +++ b/package/go/0001-cmd-dist-explicit-option-for-crosscompilation.patch
> @@ -0,0 +1,52 @@
> +From acb08e41dad7f0e642149449564f7276bca3ada4 Mon Sep 17 00:00:00 2001
> +From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> +Date: Tue, 8 May 2018 16:08:44 +0200
> +Subject: [PATCH] cmd/dist: explicit option for crosscompilation
> +
> +If GOHOSTOS == GOOS || GOHOSTARCH == GOARCH the go build system assume
> +it's not cross compiling and uses the same compiler for both
> +CC_FOR_TARGET and CC even if they are declared different. During go
> +compilation, this produces the error:
> +
> +fork/exec
> +/accts/mlweber1/rclinux/rc-buildroot-test/scripts/instance-2/output/build/host-go-1.10/bin/go:
> +no such file or directory
> +
> +cause the go binary produced is linked against a different libc and
> +cannot be run on the host machine.
> +
> +This is a problem in case the cross compilation mandates a different
> +toolchain for host and target like happens in cross compilation
> +environments like buildroot. This patch adds GO_ASSUME_CROSSCOMPILING
> +varible to assure that in case of cross compilation CC_FOR_TARGET can be
> +different from CC.
> +
> +Fixes #25177
> +
> +Change-Id: I4833c6d522407e29b039ca5660fd79df81e4b7ed

This should have your Signed-off-by as well.

Other than that, looks good to me. Could you respin a new version ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
