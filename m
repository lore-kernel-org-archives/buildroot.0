From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 13:16:00 +0200
Subject: [Buildroot] [PATCH v6 02/10] package/patchelf: add patch for
 rpath sanitization under a root directory
In-Reply-To: <1499185359-8293-3-git-send-email-wg@grandegger.com>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
 <1499185359-8293-3-git-send-email-wg@grandegger.com>
Message-ID: <20170705131600.05eadaa9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Jul 2017 18:22:31 +0200, Wolfgang Grandegger wrote:

> diff --git a/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch b/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
> new file mode 100644
> index 0000000..46fd123
> --- /dev/null
> +++ b/package/patchelf/0001-Remove-apparently-incorrect-usage-of-static.patch
> @@ -0,0 +1,49 @@
> +From a365bcb7d7025da51b33165ef7ebc7180199a05e Mon Sep 17 00:00:00 2001
> +From: Eelco Dolstra <eelco.dolstra@logicblox.com>
> +Date: Mon, 19 Sep 2016 17:31:37 +0200
> +Subject: [PATCH 14/30] Remove apparently incorrect usage of "static"

The 14/30 should be removed, just make it [PATCH]

> +

Please add here:

[Upstream commit: URL of the upstream commit.]
Signed-off-by: ...


> diff --git a/package/patchelf/0002-Extract-a-function-for-splitting-a-colon-separated-s.patch b/package/patchelf/0002-Extract-a-function-for-splitting-a-colon-separated-s.patch
> new file mode 100644
> index 0000000..63f3bce
> --- /dev/null
> +++ b/package/patchelf/0002-Extract-a-function-for-splitting-a-colon-separated-s.patch
> @@ -0,0 +1,58 @@
> +From 2e3fdc2030c75c19df6fc2924083cfad53856562 Mon Sep 17 00:00:00 2001
> +From: Tuomas Tynkkynen <tuomas@tuxera.com>
> +Date: Fri, 3 Jun 2016 23:03:51 +0300
> +Subject: [PATCH 08/30] Extract a function for splitting a colon-separated
> + string
> +
> +We're going to need this logic in another place, so make a function of
> +this.

Same comments here.


> diff --git a/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch b/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
> new file mode 100644
> index 0000000..4f700d9
> --- /dev/null
> +++ b/package/patchelf/0003-Add-option-to-make-the-rpath-relative-under-a-specif.patch
> @@ -0,0 +1,419 @@
> +From af8d4a24a0ef613bdb47f0b1c3d962d59c53a4be Mon Sep 17 00:00:00 2001
> +From: Wolfgang Grandegger <wg@grandegger.com>
> +Date: Mon, 20 Feb 2017 16:29:24 +0100
> +Subject: [PATCH] Add option to make the rpath relative under a specified root
> + directory
> +
> +Running "patchelf" with the option "--make-rpath-relative ROOTDIR" will
> +modify or delete the RPATHDIRs according the following rules
> +similar to Martin's patches [1] making the Buildroot toolchaing/SDK
> +relocatable.
> +
> +RPATHDIR starts with "$ORIGIN":
> +    The original build-system already took care of setting a relative
> +    RPATH, resolve it and test if it's valid (does exist)
> +
> +RPATHDIR starts with ROOTDIR:
> +    The original build-system added some absolute RPATH (absolute on
> +    the build machine). Test if it's valid (does exist).
> +
> +ROOTDIR/RPATHDIR exists:
> +    The original build-system already took care of setting an absolute
> +    RPATH (absolute in the final rootfs), resolve it and test if it's
> +    valid (does exist).
> +
> +RPATHDIR points somewhere else:
> +    (can be anywhere: build trees, staging tree, host location,
> +    non-existing location, etc.). Just discard such a path.
> +
> +The option "--no-standard-libs" will discard RPATHDIRs ROOTDIR/lib and
> +ROOTDIR/usr/lib. Like "--shrink-rpath", RPATHDIRs are also discarded
> +if the directories do not contain a library referenced by the
> +DT_NEEDED fields.
> +If the option "--relative-to-file" is given, the rpath will start
> +with "$ORIGIN" making it relative to the ELF file, otherwise an
> +absolute path relative to ROOTDIR will be used.
> +
> +[1] http://lists.busybox.net/pipermail/buildroot/2016-April/159422.html

If this has been accepted upstream, add the URL to the upstream commit
here as well.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
