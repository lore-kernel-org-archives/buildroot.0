Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F8ECA101A
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 22:23:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49E976006A;
	Fri, 30 Aug 2024 22:23:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4gCSByHZKW2; Fri, 30 Aug 2024 22:23:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 368E8606D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 368E8606D5;
	Fri, 30 Aug 2024 22:23:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 697BB1BF990
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 22:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 575E6846F7
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 22:23:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vFcO_0IRB5Lm for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 22:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1190F846CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1190F846CF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1190F846CF
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 22:23:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 3BF2A13F81D;
 Sat, 31 Aug 2024 00:23:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 31 Aug 2024 00:23:43 +0200
Date: Sat, 31 Aug 2024 00:23:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZtJGb8msWCzUxiui@landeda>
References: <20240825092543.2484923-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240825092543.2484923-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1725056626;
 bh=/NCVM7QYL8AviqpX+iHGrdQyAgILuSHYHkJOnL4rLRE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BRQwWxb3pQiNFznugrniSZrj4j0CGneHQdExdM0xOeqpMC2g+cwbDzEuJGOSzbaiB
 b28gVc/tvmfTJaZx3nLpq/DlUusua+qVYtAMxUsDs5dZ0GcfJuQ4iGHFjtRxteR2bY
 i+otXdQTsa3TOIzmO05QHCuoU7SZy3EeOeFzWxI58AeJZMd/QT4BPenVqgzUzfxNuz
 k7CPwha7TagkUfRKDG7zyizFB9BSnl2dpy0xgC8JdUyG0yzrHC5+6e4QVAe8Ff8OGw
 p3fveAU/ZJG7v8UnOl7c/0reMoFsBvIFh8SG0uG5aehLhuWbiyMjiE+BRYzXl3ij2H
 pujFNn7Zwrsjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BRQwWxb3
Subject: Re: [Buildroot] [PATCH] package/gobject-introspection: use objdump
 instead of prelink-cross
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-08-25 11:25 +0200, Thomas Petazzoni via buildroot spake thusly:
> This commit switches the gobject-introspection package from using
> prelink-cross to simply using "objdump -p". This basically implements
> the same change as was done in OpenEmbedded commit:
> 
>   https://git.openembedded.org/openembedded-core/commit/?id=767e0880d4d729e659e859dd99c1cdb084b8ba51
> 
> In particular, this allows to get rid of the architecture dependency
> of prelink-cross, which wasn't currently encoded, but that was
> actually causing failures such as:
> 
> /home/autobuild/autobuild/instance-17/output-1/host/sbin/prelink-rtld: error while loading shared libraries: /lib/libc.so.6: cannot handle TLS data
> 
> It also paves the way for removing host-prelink-cross entirely, as the
> only remaining user of it now is dracut.
> 
> The test tests.package.test_python_gobject.TestPythonPy3Gobject (which
> uses gobject-introspection) has been tested to run fine after this
> commit.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/7efa6a18f543752dfe33577f74c20bda3f8b1e65/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                           |  1 -
>  ...-error-return-codes-from-ldd-wrapper.patch | 31 -------------------
>  .../g-ir-scanner-lddwrapper.in                |  3 +-
>  .../gobject-introspection.mk                  |  3 +-
>  4 files changed, 3 insertions(+), 35 deletions(-)
>  delete mode 100644 package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 81e48bf859..4b1bd6a42e 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -586,7 +586,6 @@ package/go/go-src/0001-build.go-explicit-option-for-crosscompilation.patch lib_p
>  package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
>  package/gobject-introspection/0001-disable-tests.patch lib_patch.Upstream
>  package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
> -package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch lib_patch.Upstream
>  package/gpsd/S50gpsd Shellcheck lib_sysv.Indent lib_sysv.Variables
>  package/gptfdisk/0001-gptcurses-partially-revert-Tweaks-for-building-on-th.patch lib_patch.Upstream
>  package/graphite2/0001-don-t-install-a-libtool-file-with-static-library.patch lib_patch.Upstream
> diff --git a/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch b/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
> deleted file mode 100644
> index f1ea518954..0000000000
> --- a/package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From e0fc4a2a5161a36483ddc518be9bb14390f11b19 Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Wed, 5 Sep 2018 16:46:52 +0200
> -Subject: [PATCH] giscanner: ignore error return codes from ldd-wrapper
> -
> -prelink-rtld, which we use instead of ldd returns 127 when it can't find a library.
> -It is not an error per se, but it breaks subprocess.check_output().
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> -Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ----
> - giscanner/shlibs.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/giscanner/shlibs.py b/giscanner/shlibs.py
> -index 9f8ab5df..7a1a72fe 100644
> ---- a/giscanner/shlibs.py
> -+++ b/giscanner/shlibs.py
> -@@ -103,7 +103,7 @@ def _resolve_non_libtool(options, binary, libraries):
> -             args.extend(['otool', '-L', binary.args[0]])
> -         else:
> -             args.extend(['ldd', binary.args[0]])
> --        output = subprocess.check_output(args)
> -+        output = subprocess.run(args, check=False, stdout=subprocess.PIPE).stdout
> -         if isinstance(output, bytes):
> -             output = output.decode("utf-8", "replace")
> - 
> --- 
> -2.25.1
> -
> diff --git a/package/gobject-introspection/g-ir-scanner-lddwrapper.in b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
> index 2f09bca77a..7f3db67da4 100644
> --- a/package/gobject-introspection/g-ir-scanner-lddwrapper.in
> +++ b/package/gobject-introspection/g-ir-scanner-lddwrapper.in
> @@ -1,3 +1,2 @@
>  #!/usr/bin/env sh
> -
> -"${HOST_DIR}"/sbin/prelink-rtld --root="$(dirname "$0")/../../" "$@"
> +@TARGET_OBJDUMP@ -p "$@"
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index f0c7fcd2ca..ad72af22a2 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -15,7 +15,6 @@ GOBJECT_INTROSPECTION_LICENSE_FILES = COPYING.LGPL COPYING.GPL giscanner/scanner
>  GOBJECT_INTROSPECTION_DEPENDENCIES = \
>  	host-autoconf-archive \
>  	host-gobject-introspection \
> -	host-prelink-cross \
>  	host-qemu \
>  	libffi \
>  	libglib2 \
> @@ -78,6 +77,8 @@ define GOBJECT_INTROSPECTION_INSTALL_PRE_WRAPPERS
>  
>  	$(INSTALL) -D -m 755 $(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner-lddwrapper.in \
>  		$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper
> +	$(SED) "s%@TARGET_OBJDUMP@%$(TARGET_OBJDUMP)%" \
> +		$(STAGING_DIR)/usr/bin/g-ir-scanner-lddwrapper
>  
>  	$(INSTALL) -D -m 755 $(GOBJECT_INTROSPECTION_PKGDIR)/g-ir-scanner-qemuwrapper.in \
>  		$(STAGING_DIR)/usr/bin/g-ir-scanner-qemuwrapper
> -- 
> 2.46.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
