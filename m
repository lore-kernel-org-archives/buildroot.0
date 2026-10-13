Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5220CC6B0F
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A37B940738;
	Tue, 13 Oct 2026 21:58:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1Vj7S37h-O1; Tue, 13 Oct 2026 21:58:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C1B3440729
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791928724;
	b=GxkXlJnjMbADLOre8zZGRHUZXIMqI758f5qr32XV3MB3Bbu1Jd2cpKXmXaO8jb4Ptycf
	 QyDI+x2Y6NQPuRkjeNb8tVxqRSJxU5KaoUquN96wAVecGn9u3jBpdJZ3fh2g8OmDOeY5D
	 ki+YzBKxgPSNiMU7FimY1Uz3UKZCRE1AyZpVqkvlPlGfcTqE/gfSbRMzaNm1fg27rKfFp
	 Y0vDLRbjcjAwMBZTF36MJw9MM1Uy2b4OkgLhGBHz0cEZScHPFhE/i4D8LvoOvL89uKSOu
	 h1wmfXzIRL010Y+BEIhQX0geMNzAz6yBuPFV53RgClgHLs1vUeQf1DWw7ScvzvNfPJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791928724;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HDXK8YWaUO+i7YgNJ+Wuly1jO9TEAwU77K89FMSMa98=;
	b=fyriNOszSXS0nBpX8CyYpHWyuXs8xnetDsccrQ95GbyqFN/YHtnHFAxu/QX2GeUZr93u
	 3gUe0qMmxjUjzYp61I8d7kRaO3NFIJ/f91yiGWX4JXYkziLaIOF0I72UC3Zdw5QA/GWjG
	 EA5757/Sdis0gZUmgEP5sC16fsYVGKuNZFUM65WXwptOQPk0+XOBQpdF1IYCZN27FUS3t
	 qiKCeF+GJCFVdC1EfkMQpVRfq6qYI3nnpZyjhSZ4XeVXGOxDmytXTZMKbwMfmXd39e7Bz
	 w3ZwFxAku/CMMQXM/WrZvtPaO7ZjkzeYmd3WQJYDj2Bz5ci6Wjy10FUrBGsLrdq0iEw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791928724;
	bh=HDXK8YWaUO+i7YgNJ+Wuly1jO9TEAwU77K89FMSMa98=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rKs/xpZu5dqN8BQXLIafm2+ZfNu172MD8J57P742XfRDgSOGuLwtLvq7jLOqntM1Q
	 //9h67A9d7J303pJ7WP9x4WU6fmzmYGrUsVBEeKpYIZ2OoklTH3ZalO7guH+HLNPLn
	 714FqfLh/oeaiJW3JZjESbP8xj13f0Lx+v6pWA0zUyYVRIo3S8bhpog4sjLpw3JQRE
	 nymf65ytA/bbX6LCgU+su4chH9f6bxLCEK2tv718hnKWANFS0/S/9JSt/mDmm8PI7G
	 A7awtbKsQvWFDzZY5xVxc2UWDWF7Zhg30bx6QgE/1D7Z1UWZEqA64Zc+SzccmsmBzN
	 95BlPCPESplQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1B3440729;
	Tue, 13 Oct 2026 21:58:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C668A2AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B7D1180CC5
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LNGE0AMatrg for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:58:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AB32D80AFB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791928721;
 b=WCdkhLaq4/ezIpyvvFIKNAyfMYZzWlKg9iCuVP9iocgoN7gvIAMN3ioy3ixIGQ8FVq5/
 qcC4zkWt3e/dmYO+iSIzsTh742OHuMN9JqzGZiyQ4l4gFa6kgXZ4ZON9RC/MtpPJJVVLj
 BWD27A8ocm+6VUDxkBL9FknFQDyCSeIcp4nO7yHOZNyB9nxtopSR0dnVRJ2xtG5N8Ktcz
 dwIncEwIjShsnslIRZ/5NKWdZi+cZ0IzHPiLs9w8EkXL8FAxKkxDElLqVQBQGaMRwnC5B
 +MQ6IvN8gRC4GWRJalxPzpK5Jm67xHa/J87SBCULVNFv5ipL1iKew0lRdavpMz0Cx+w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791928721;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=68pCo4qHWRW03+Lg80JcEVdLEQb5Per9ZhFCsRcJ0sM=;
 b=dgN0+XzQitdWFPCgjHbBZaPYATwSV6Yb2ubMEICymiepWHoTHuFfTNPVR01CsEu39Hr7
 2VT3S59YR1fMLJ/XstzKqwwT0NkFoUDg+6QtoM4eIv1Fvmklk/59HmA11eEsfp97stXTV
 B6X7dvAad+yve/0wJY9kBW1xz0G3Pvklibqx58XuhtLjiX93+kRz13Q9fCUX5bfH1vRUo
 LyGxBRreR0eRcDzI3uQyFL044AIg30N0p13SWUeEHVKadHaXJifRG8QHMeoNc3ejVl+aF
 GpMVk0yCFHkd7JqfxxtIOHUMbyf9coDL1wgW6WFg5rqTFqrk0WxoF4EkbwFlh85db6g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="PHRstdp/"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=PHRstdp/
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AB32D80AFB
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791928706;
 bh=68pCo4qHWRW03+Lg80JcEVdLEQb5Per9ZhFCsRcJ0sM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=PHRstdp/rrY2nQPRQQiKi1hL5X7BTwXaCsZOTNQ/50CnvD11+4TFAc1PupkHbG+5U
 Va2FD5Pe4J4/f03gE+/tU0YuUO8kF6FtOWpJcMbz81CzLaGwkX7FHUSZf9K9N4WeKX
 hO1SBXPorIVRBclb33OSSHbt6bDr56uKgFYDZav/BkKnPerEDOCam+TykSSphiK08I
 KxVh7FNCLK9RLqY7cAnb09n1MgyKLE8ihJRedxjQWzoB9Bnw6oaVIXqEQtHA9V38FQ
 fjMEqUfLLbqXPy7mdwZGsASsLe4bnXGQgND+vHWoood5Md9FDuj1B0kjoddJcpycv5
 DeBeAnn4pzELg==
X-KAS-Sym: v3:f51bdf72230551df:iRrhmmgc7+3BXX9A7J0fNbonZj/POtdddEk4Wm3Jhqtu+
 sXfYOd4zBWKrruPbrjPdv/aES5XyA4HhkYwm1co6isH0XaNMXgtqj5ztLda6xfN7JMCG5kC0l9e
 eg7Z6CBkYtSFlvHI38C/3xfc6/ar0E34i0+9kgHjEx4muSh1jt+pz1nqnncJQ+adhAsuZfnsXvq
 YBz93Ws0X6CBfGw73C81W2yZVNFEiDXmm2njJa1Z97kdSXiwA83kCl7e1Iei+EnLIJKwlHgl7U+
 TiUmmYdu0QK4VggGIaCUOAcqzRcmHRIsp9t18czpbCJYDCR+z7UrxaMk/Rs6hLK7VsWaFchw==:
 U8h15XB/b4FCyBppYhLbMZXjdxSsU+Ns3//XJWl7F7YaWutKo3876+3HDnDeXoOX7Bqt5vTJdNv
 4dFSzvY+/2B95WW3P6wue0Q9i0n45kEyFbFLJdyr4kJ0WwDxS0o/a8Qb7fkm/G4FaDCPuy609Pj
 Njs5iOVmCgEXLx2SlncIUu6IZ3ybxwf/8ysme+Ujfoj/BjYdZwBSA/Ap/0aScOqG+VvuE6chSAL
 zgRa5mrGCKR8rIFRU67hGT402QqTeboy5xTZf1NzVmPG0ntvDyzI5aUe1iRklBK7//MjcVzlHSs
 oXQu54rGRFAyM75U4BGCx2c+thTxf3EGkkaMGtXiJFPVD5efc4CScxnSdx1B1/4lWnJhmxKUboX
 uXjRNJc0RwesX0FbXYTLC054Z0OPH8mrFjV8paRiK7fJjFZuf5s1DD7Ch6qYBMdMxdTv3QaXSn5
 LcclToNmJjZ2rZHjzLkw4qVsVsz3c/Ir+iPHBEBxuHkoKMfet+OiTbqzBd/PJDjLzYE3+BNyrJN
 i3n2Va4Z2dTvtU6+0qbj3jcb9+z4icuD8A5F1Di1nkcwgC5dpJqojDsxK62mQk/dRX3QX3oitXY
 FTnbTDI+PwR548K4KurviCS6oi9TigFzIG/6dA1qHgWKfs1uNF5ijr+h3oCdus36bEty5U+Mz/a
 BAFRux36YD8+k98GVoPAcpxKky60yDoLGu5DhKXAqUsGiq45g12idVkUEKw==
Received: from fli4l.lan.fli4l (p54a1b220.dip0.t-ipconnect.de [84.161.178.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9D722A4C5896;
 Tue, 13 Oct 2026 23:58:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36996)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xGkVt-00000000333-1ldn;
 Tue, 13 Oct 2026 21:58:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Tue, 13 Oct 2026 23:58:25 +0200
Message-ID: <20261013215825.319471-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013215825.319471-1-bernd@kuhls.net>
References: <20261013215825.319471-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 2/2] package/llvm-project/libclc: apply
 mesa-libclc patch set
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.freedesktop.org/karolherbst/mesa-libclc/-/commits/llvm_23

https://gitlab.freedesktop.org/karolherbst/mesa-libclc/-/blob/llvm_23/README.md
"This is a fork of LLVM's libclc applying some fixes of a known good
 state. [...]
 Alternatively to using this fork distributions can patch their own
 libclc project with the commits titled with "libclc: ..."

Needed for mesa3d >= 26.2.0:
https://lists.freedesktop.org/archives/mesa-announce/2026-August/000863.html
"One important note for packagers is that there is now a Mesa community
maintained libclc fork that is verified to pass the OpenCL CTS with
Mesa/Rusticl, and will fix bugs after an upstream libclc major release
branch goes EoL. The Mesa build system will pick it up when available,
and fall back to upstream libclc if not. This libclc fork is not
verified for any other usages or users of libclc outside of Mesa."

This patch adds the mesa-libclc to our libclc package instead of adding
a new mesa-libclc package.

Please note that these patches also fix the build of mesa3d 26.1.8, the
problem is currently hidden by the configure error in libclc fixed by
the previous patch of this series.

Quoting configure log:

Run-time dependency mesa-libclc found: NO  (tried pkg-config and cmake)
Message: mesa-libclc not found. Build will fall back to upstream libclc,
 however this is not recommended for most use cases.
Run-time dependency libclc found: NO  (tried pkg-config and cmake)

output/build/mesa3d-26.1.8/meson.build:958:14: ERROR: Dependency "libclc"
 not found (tried pkg-config and cmake)

Fixes: 5f79161e4a8756acdb25c8500de9b2dee663f2ac

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...disable-use-of-SPV_KHR_fma-extension.patch |  36 ++
 ...0002-libclc-restore-old-fma-behavior.patch |  65 ++
 ...libclc-add-__clc_mesa_libclc_version.patch |  49 ++
 ...le-fp16-version-of-atan2-and-atan2pi.patch |  56 ++
 ...c-Revert-libclc-Update-remquo-187998.patch | 595 ++++++++++++++++++
 ...bclc-Update-hypot-implementation-185.patch | 171 +++++
 ...vert-libclc-Update-trigpi-functions-.patch | 173 +++++
 ...a-precision-issues-due-to-lack-of-fm.patch |  80 +++
 .../libclc/0009-revert-10644a1-v3.patch       |  37 ++
 9 files changed, 1262 insertions(+)
 create mode 100644 package/llvm-project/libclc/0001-libclc-disable-use-of-SPV_KHR_fma-extension.patch
 create mode 100644 package/llvm-project/libclc/0002-libclc-restore-old-fma-behavior.patch
 create mode 100644 package/llvm-project/libclc/0003-libclc-add-__clc_mesa_libclc_version.patch
 create mode 100644 package/llvm-project/libclc/0004-libclc-disable-fp16-version-of-atan2-and-atan2pi.patch
 create mode 100644 package/llvm-project/libclc/0005-libclc-Revert-libclc-Update-remquo-187998.patch
 create mode 100644 package/llvm-project/libclc/0006-libclc-Revert-libclc-Update-hypot-implementation-185.patch
 create mode 100644 package/llvm-project/libclc/0007-libclc-Partly-revert-libclc-Update-trigpi-functions-.patch
 create mode 100644 package/llvm-project/libclc/0008-libclc-fix-tgamma-precision-issues-due-to-lack-of-fm.patch
 create mode 100644 package/llvm-project/libclc/0009-revert-10644a1-v3.patch

diff --git a/package/llvm-project/libclc/0001-libclc-disable-use-of-SPV_KHR_fma-extension.patch b/package/llvm-project/libclc/0001-libclc-disable-use-of-SPV_KHR_fma-extension.patch
new file mode 100644
index 0000000000..482d61dbff
--- /dev/null
+++ b/package/llvm-project/libclc/0001-libclc-disable-use-of-SPV_KHR_fma-extension.patch
@@ -0,0 +1,36 @@
+From 0fdefef847d704b0162cacdbafe01350f4531a61 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Wed, 22 Jul 2026 13:36:59 +0200
+Subject: [PATCH] libclc: disable use of SPV_KHR_fma extension
+
+Upstream: https://gitlab.freedesktop.org/karolherbst/mesa-libclc/-/commit/0fdefef847d704b0162cacdbafe01350f4531a61
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclc/cmake/modules/AddLibclc.cmake | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/libclc/cmake/modules/AddLibclc.cmake b/libclc/cmake/modules/AddLibclc.cmake
+index d84101f..82aa563 100644
+--- a/libclc/cmake/modules/AddLibclc.cmake
++++ b/libclc/cmake/modules/AddLibclc.cmake
+@@ -165,7 +165,7 @@ function(libclc_add_library target_name)
+     if(LIBCLC_USE_SPIRV_BACKEND)
+       add_custom_command(OUTPUT ${builtins_lib}
+         COMMAND ${CMAKE_CLC_COMPILER} -c --target=${ARG_TRIPLE}
+-                -mllvm --spirv-ext=+SPV_KHR_fma
++                -mllvm
+                 -x ir -o ${builtins_lib} ${linked_bc}
+         DEPENDS ${linked_bc}
+       )
+@@ -173,7 +173,6 @@ function(libclc_add_library target_name)
+       add_custom_command(OUTPUT ${builtins_lib}
+         COMMAND ${llvm-spirv_exe}
+                 --spirv-max-version=1.1
+-                --spirv-ext=+SPV_KHR_fma
+                 -o ${builtins_lib} ${linked_bc}
+         DEPENDS ${linked_bc}
+       )
+-- 
+2.47.3
+
diff --git a/package/llvm-project/libclc/0002-libclc-restore-old-fma-behavior.patch b/package/llvm-project/libclc/0002-libclc-restore-old-fma-behavior.patch
new file mode 100644
index 0000000000..5fe5b2a6b7
--- /dev/null
+++ b/package/llvm-project/libclc/0002-libclc-restore-old-fma-behavior.patch
@@ -0,0 +1,65 @@
+From f55c425b7277bc7178729a4c4335a5ec404d03dc Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Wed, 22 Jul 2026 14:51:19 +0200
+Subject: [PATCH] libclc: restore old fma behavior
+
+Upstream: https://gitlab.freedesktop.org/karolherbst/mesa-libclc/-/commit/f55c425b7277bc7178729a4c4335a5ec404d03dc
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclc/clc/lib/spirv/math/clc_fma.inc | 8 ++++----
+ libclc/opencl/lib/generic/math/fma.cl | 2 +-
+ libclc/opencl/lib/spirv/math/fma.cl   | 3 ++-
+ 3 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/libclc/clc/lib/spirv/math/clc_fma.inc b/libclc/clc/lib/spirv/math/clc_fma.inc
+index 42b1cf9..9efdcc4 100644
+--- a/libclc/clc/lib/spirv/math/clc_fma.inc
++++ b/libclc/clc/lib/spirv/math/clc_fma.inc
+@@ -8,9 +8,9 @@
+ 
+ _CLC_DEF _CLC_OVERLOAD __CLC_GENTYPE __clc_fma(__CLC_GENTYPE a, __CLC_GENTYPE b,
+                                                __CLC_GENTYPE c) {
+-#if __CLC_FPSIZE == 32
+-  if (!__clc_runtime_has_hw_fma32())
+-    return __clc_sw_fma(a, b, c);
+-#endif
++//#if __CLC_FPSIZE == 32
++//  if (!__clc_runtime_has_hw_fma32())
++//    return __clc_sw_fma(a, b, c);
++//#endif
+   return __builtin_elementwise_fma(a, b, c);
+ }
+diff --git a/libclc/opencl/lib/generic/math/fma.cl b/libclc/opencl/lib/generic/math/fma.cl
+index 281ee83..a31864f 100644
+--- a/libclc/opencl/lib/generic/math/fma.cl
++++ b/libclc/opencl/lib/generic/math/fma.cl
+@@ -8,7 +8,7 @@
+ 
+ #include "clc/math/clc_fma.h"
+ 
+-#define __CLC_FUNCTION fma
++#define __CLC_FUNCTION clc_sw_fma
+ #define __CLC_BODY "clc/shared/ternary_def.inc"
+ 
+ #include "clc/math/gentype.inc"
+diff --git a/libclc/opencl/lib/spirv/math/fma.cl b/libclc/opencl/lib/spirv/math/fma.cl
+index b5a44af..ab955a9 100644
+--- a/libclc/opencl/lib/spirv/math/fma.cl
++++ b/libclc/opencl/lib/spirv/math/fma.cl
+@@ -6,10 +6,11 @@
+ //
+ //===----------------------------------------------------------------------===//
+ 
+-#include "clc/math/clc_fma.h"
++#include "clc/internal/math/clc_sw_fma.h"
+ 
+ #define __CLC_FLOAT_ONLY
+ #define __CLC_FUNCTION fma
++#define __CLC_IMPL_FUNCTION(x) __clc_sw_fma
+ #define __CLC_BODY "clc/shared/ternary_def.inc"
+ 
+ #include "clc/math/gentype.inc"
+-- 
+2.47.3
+
diff --git a/package/llvm-project/libclc/0003-libclc-add-__clc_mesa_libclc_version.patch b/package/llvm-project/libclc/0003-libclc-add-__clc_mesa_libclc_version.patch
new file mode 100644
index 0000000000..42fc68d68d
--- /dev/null
+++ b/package/llvm-project/libclc/0003-libclc-add-__clc_mesa_libclc_version.patch
@@ -0,0 +1,49 @@
+From 534609b129e3473b07f8d063c1c7259a07cce93b Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Mon, 20 Jul 2026 16:12:30 +0200
+Subject: [PATCH] libclc: add __clc_mesa_libclc_version
+
+Allows us to detect if we got our own libclc binaries at runtime.
+
+Upstream: https://gitlab.freedesktop.org/karolherbst/mesa-libclc/-/commit/534609b129e3473b07f8d063c1c7259a07cce93b
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclc/opencl/lib/spirv/CMakeLists.txt |  1 +
+ libclc/opencl/lib/spirv/version.cl     | 12 ++++++++++++
+ 2 files changed, 13 insertions(+)
+ create mode 100644 opencl/lib/spirv/version.cl
+
+diff --git a/libclc/opencl/lib/spirv/CMakeLists.txt b/libclc/opencl/lib/spirv/CMakeLists.txt
+index 6e9e28e..715642c 100644
+--- a/libclc/opencl/lib/spirv/CMakeLists.txt
++++ b/libclc/opencl/lib/spirv/CMakeLists.txt
+@@ -5,6 +5,7 @@ endif()
+ 
+ # Non-Vulkan SPIR-V uses a curated subset of generic builtins.
+ libclc_add_sources(${LIBCLC_OPENCL_TARGET} FILES
++  version.cl
+   math/fma.cl
+ )
+ 
+diff --git a/libclc/opencl/lib/spirv/version.cl b/libclc/opencl/lib/spirv/version.cl
+new file mode 100644
+index 0000000..96a3410
+--- /dev/null
++++ b/libclc/opencl/lib/spirv/version.cl
+@@ -0,0 +1,12 @@
++//===----------------------------------------------------------------------===//
++//
++// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
++// See https://llvm.org/LICENSE.txt for license information.
++// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
++//
++//===----------------------------------------------------------------------===//
++
++#include <clc/opencl/opencl-base.h>
++
++/* XXYYZZPP */
++_CLC_DEF uint __clc_mesa_libclc_version() { return 0x23010000; }
+-- 
+2.47.3
+
diff --git a/package/llvm-project/libclc/0004-libclc-disable-fp16-version-of-atan2-and-atan2pi.patch b/package/llvm-project/libclc/0004-libclc-disable-fp16-version-of-atan2-and-atan2pi.patch
new file mode 100644
index 0000000000..23314a990e
--- /dev/null
+++ b/package/llvm-project/libclc/0004-libclc-disable-fp16-version-of-atan2-and-atan2pi.patch
@@ -0,0 +1,56 @@
+From cd0452f7a695165706fe5df85073f86baa46abd4 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Wed, 22 Jul 2026 17:00:36 +0200
+Subject: [PATCH] libclc: disable fp16 version of atan2 and atan2pi
+
+Fixes math_brute_force/test_bruteforce atan2 atan2pi for half
+
+Upstream: https://gitlab.freedesktop.org/karolherbst/mesa-libclc/-/commit/cd0452f7a695165706fe5df85073f86baa46abd4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclc/opencl/lib/generic/math/atan2.cl   | 8 ++++++++
+ libclc/opencl/lib/generic/math/atan2pi.cl | 8 ++++++++
+ 2 files changed, 16 insertions(+)
+
+diff --git a/libclc/opencl/lib/generic/math/atan2.cl b/libclc/opencl/lib/generic/math/atan2.cl
+index 2bbac43..640e5a3 100644
+--- a/libclc/opencl/lib/generic/math/atan2.cl
++++ b/libclc/opencl/lib/generic/math/atan2.cl
+@@ -8,6 +8,14 @@
+ 
+ #include "clc/math/clc_atan2.h"
+ 
++#define __CLC_FLOAT_ONLY
++#define __CLC_FUNCTION atan2
++#define __CLC_BODY "clc/shared/binary_def.inc"
++
++#include "clc/math/gentype.inc"
++
++#undef __CLC_FLOAT_ONLY
++#define __CLC_DOUBLE_ONLY
+ #define __CLC_FUNCTION atan2
+ #define __CLC_BODY "clc/shared/binary_def.inc"
+ 
+diff --git a/libclc/opencl/lib/generic/math/atan2pi.cl b/libclc/opencl/lib/generic/math/atan2pi.cl
+index 2d37e01..be848ae 100644
+--- a/libclc/opencl/lib/generic/math/atan2pi.cl
++++ b/libclc/opencl/lib/generic/math/atan2pi.cl
+@@ -8,6 +8,14 @@
+ 
+ #include "clc/math/clc_atan2pi.h"
+ 
++#define __CLC_FLOAT_ONLY
++#define __CLC_FUNCTION atan2pi
++#define __CLC_BODY "clc/shared/binary_def.inc"
++
++#include "clc/math/gentype.inc"
++
++#undef __CLC_FLOAT_ONLY
++#define __CLC_DOUBLE_ONLY
+ #define __CLC_FUNCTION atan2pi
+ #define __CLC_BODY "clc/shared/binary_def.inc"
+ 
+-- 
+2.47.3
+
diff --git a/package/llvm-project/libclc/0005-libclc-Revert-libclc-Update-remquo-187998.patch b/package/llvm-project/libclc/0005-libclc-Revert-libclc-Update-remquo-187998.patch
new file mode 100644
index 0000000000..64de3b2125
--- /dev/null
+++ b/package/llvm-project/libclc/0005-libclc-Revert-libclc-Update-remquo-187998.patch
@@ -0,0 +1,595 @@
+From 9b54a3b2c09228b3c3269c5c62ca2f3128ec6501 Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Wed, 1 Apr 2026 02:44:30 +0200
+Subject: [PATCH] libclc: Revert "libclc: Update remquo (#187998)"
+
+Fixes math_brute_force/test_bruteforce remainder remquo
+
+This reverts commit 1a9fe1769a0f9684dc9ecfcb7a2cec2d66077cc3.
+
+Upstream: https://gitlab.freedesktop.org/karolherbst/mesa-libclc/-/commit/9b54a3b2c09228b3c3269c5c62ca2f3128ec6501
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclc/clc/include/clc/math/remquo_decl.inc      |  34 +--
+ libclc/clc/lib/generic/math/clc_remquo.cl        |  56 ++---
+ libclc/clc/lib/generic/math/clc_remquo.inc       | 273 ++++++++++++++++++++--
+ libclc/clc/lib/generic/math/clc_remquo_stret.inc | 158 -------------
+ 4 files changed, 287 insertions(+), 234 deletions(-)
+ delete mode 100644 clc/lib/generic/math/clc_remquo_stret.inc
+
+diff --git a/libclc/clc/include/clc/math/remquo_decl.inc b/libclc/clc/include/clc/math/remquo_decl.inc
+index 8ba6011..cba28a7 100644
+--- a/libclc/clc/include/clc/math/remquo_decl.inc
++++ b/libclc/clc/include/clc/math/remquo_decl.inc
+@@ -6,29 +6,19 @@
+ //
+ //===----------------------------------------------------------------------===//
+ 
+-typedef struct __CLC_XCONCAT(__clc_remquo_ret_, __CLC_GENTYPE) {
+-  __CLC_GENTYPE rem;
+-  __CLC_INTN quo;
+-} __CLC_XCONCAT(__clc_remquo_ret_, __CLC_GENTYPE);
++_CLC_OVERLOAD _CLC_DECL __CLC_GENTYPE __CLC_FUNCTION(__CLC_GENTYPE x,
++                                                     __CLC_GENTYPE y,
++                                                     private __CLC_INTN *q);
+ 
+-#define __CLC_REMQUO_RET_GENTYPE __CLC_XCONCAT(__clc_remquo_ret_, __CLC_GENTYPE)
++_CLC_OVERLOAD _CLC_DECL __CLC_GENTYPE __CLC_FUNCTION(__CLC_GENTYPE x,
++                                                     __CLC_GENTYPE y,
++                                                     global __CLC_INTN *q);
+ 
+-_CLC_OVERLOAD _CLC_DECL __CLC_REMQUO_RET_GENTYPE
+-__clc_remquo_stret(__CLC_GENTYPE x, __CLC_GENTYPE y);
+-
+-_CLC_OVERLOAD _CLC_DECL __CLC_GENTYPE __clc_remquo(__CLC_GENTYPE x,
+-                                                   __CLC_GENTYPE y,
+-                                                   private __CLC_INTN *q);
+-
+-_CLC_OVERLOAD _CLC_DECL __CLC_GENTYPE __clc_remquo(__CLC_GENTYPE x,
+-                                                   __CLC_GENTYPE y,
+-                                                   global __CLC_INTN *q);
+-
+-_CLC_OVERLOAD _CLC_DECL __CLC_GENTYPE __clc_remquo(__CLC_GENTYPE x,
+-                                                   __CLC_GENTYPE y,
+-                                                   local __CLC_INTN *q);
++_CLC_OVERLOAD _CLC_DECL __CLC_GENTYPE __CLC_FUNCTION(__CLC_GENTYPE x,
++                                                     __CLC_GENTYPE y,
++                                                     local __CLC_INTN *q);
+ #if _CLC_GENERIC_AS_SUPPORTED
+-_CLC_OVERLOAD _CLC_DECL __CLC_GENTYPE __clc_remquo(__CLC_GENTYPE x,
+-                                                   __CLC_GENTYPE y,
+-                                                   generic __CLC_INTN *q);
++_CLC_OVERLOAD _CLC_DECL __CLC_GENTYPE __CLC_FUNCTION(__CLC_GENTYPE x,
++                                                     __CLC_GENTYPE y,
++                                                     generic __CLC_INTN *q);
+ #endif
+diff --git a/libclc/clc/lib/generic/math/clc_remquo.cl b/libclc/clc/lib/generic/math/clc_remquo.cl
+index 502b9e5..e254093 100644
+--- a/libclc/clc/lib/generic/math/clc_remquo.cl
++++ b/libclc/clc/lib/generic/math/clc_remquo.cl
+@@ -6,58 +6,32 @@
+ //
+ //===----------------------------------------------------------------------===//
+ 
+-#include "clc/math/clc_remquo.h"
+-
+ #include "clc/clc_convert.h"
+-#include "clc/float/definitions.h"
+ #include "clc/integer/clc_clz.h"
+-#include "clc/math/clc_copysign.h"
+-#include "clc/math/clc_fabs.h"
++#include "clc/internal/clc.h"
++#include "clc/math/clc_floor.h"
+ #include "clc/math/clc_flush_if_daz.h"
+ #include "clc/math/clc_fma.h"
+-#include "clc/math/clc_frexp.h"
+ #include "clc/math/clc_ldexp.h"
+-#include "clc/math/clc_mad.h"
+-#include "clc/math/clc_recip_fast.h"
+-#include "clc/math/clc_rint.h"
+ #include "clc/math/clc_subnormal_config.h"
+ #include "clc/math/clc_trunc.h"
+ #include "clc/math/math.h"
+-#include "clc/relational/clc_isfinite.h"
+-#include "clc/relational/clc_isnan.h"
+-#include "clc/relational/clc_signbit.h"
+-
+-#define __CLC_FUNCTION __clc_remquo_stret
+-#define __CLC_BODY "clc_remquo_stret.inc"
+-#include "clc/math/gentype.inc"
+-#undef __CLC_FUNCTION
+-
+-#define __CLC_FUNCTION __clc_remquo
+-#define __CLC_BODY "clc_remquo.inc"
+-#include "clc/math/gentype.inc"
++#include "clc/shared/clc_max.h"
+ 
+-#define __CLC_OUT_ARG3_SCALAR_TYPE int
+-#define __CLC_OUT_ARG3_ADDRESS_SPACE __private
+-#define __CLC_BODY "clc/shared/binary_with_out_arg_scalarize.inc"
+-#include "clc/math/gentype.inc"
+-#undef __CLC_OUT_ARG3_ADDRESS_SPACE
++#define __CLC_ADDRESS_SPACE private
++#include "clc_remquo.inc"
++#undef __CLC_ADDRESS_SPACE
+ 
+-#define __CLC_OUT_ARG3_SCALAR_TYPE int
+-#define __CLC_OUT_ARG3_ADDRESS_SPACE __local
+-#define __CLC_BODY "clc/shared/binary_with_out_arg_scalarize.inc"
+-#include "clc/math/gentype.inc"
+-#undef __CLC_OUT_ARG3_ADDRESS_SPACE
++#define __CLC_ADDRESS_SPACE global
++#include "clc_remquo.inc"
++#undef __CLC_ADDRESS_SPACE
+ 
+-#define __CLC_OUT_ARG3_SCALAR_TYPE int
+-#define __CLC_OUT_ARG3_ADDRESS_SPACE __global
+-#define __CLC_BODY "clc/shared/binary_with_out_arg_scalarize.inc"
+-#include "clc/math/gentype.inc"
+-#undef __CLC_OUT_ARG3_ADDRESS_SPACE
++#define __CLC_ADDRESS_SPACE local
++#include "clc_remquo.inc"
++#undef __CLC_ADDRESS_SPACE
+ 
+ #if _CLC_DISTINCT_GENERIC_AS_SUPPORTED
+-#define __CLC_OUT_ARG3_SCALAR_TYPE int
+-#define __CLC_OUT_ARG3_ADDRESS_SPACE
+-#define __CLC_BODY "clc/shared/binary_with_out_arg_scalarize.inc"
+-#include "clc/math/gentype.inc"
+-#undef __CLC_OUT_ARG3_ADDRESS_SPACE
++#define __CLC_ADDRESS_SPACE generic
++#include "clc_remquo.inc"
++#undef __CLC_ADDRESS_SPACE
+ #endif
+diff --git a/libclc/clc/lib/generic/math/clc_remquo.inc b/libclc/clc/lib/generic/math/clc_remquo.inc
+index 649bdd9..79ce0fe 100644
+--- a/libclc/clc/lib/generic/math/clc_remquo.inc
++++ b/libclc/clc/lib/generic/math/clc_remquo.inc
+@@ -6,19 +6,266 @@
+ //
+ //===----------------------------------------------------------------------===//
+ 
+-#ifdef __CLC_SCALAR
+-#define __CLC_REMQUO_DEF(addrspace)                                            \
+-  _CLC_DEF _CLC_OVERLOAD __CLC_GENTYPE __clc_remquo(                           \
+-      __CLC_GENTYPE x, __CLC_GENTYPE y, addrspace __CLC_INTN *quo_out) {       \
+-    __CLC_REMQUO_RET_GENTYPE result = __clc_remquo_stret(x, y);                \
+-    *quo_out = result.quo;                                                     \
+-    return result.rem;                                                         \
++_CLC_DEF _CLC_OVERLOAD float __clc_remquo(float x, float y,
++                                          __CLC_ADDRESS_SPACE int *quo) {
++  x = __clc_flush_if_daz(x);
++  y = __clc_flush_if_daz(y);
++  int ux = __clc_as_int(x);
++  int ax = ux & EXSIGNBIT_SP32;
++  float xa = __clc_as_float(ax);
++  int sx = ux ^ ax;
++  int ex = ax >> EXPSHIFTBITS_SP32;
++
++  int uy = __clc_as_int(y);
++  int ay = uy & EXSIGNBIT_SP32;
++  float ya = __clc_as_float(ay);
++  int sy = uy ^ ay;
++  int ey = ay >> EXPSHIFTBITS_SP32;
++
++  float xr = __clc_as_float(0x3f800000 | (ax & 0x007fffff));
++  float yr = __clc_as_float(0x3f800000 | (ay & 0x007fffff));
++  int c;
++  int k = ex - ey;
++
++  uint q = 0;
++
++  while (k > 0) {
++    c = xr >= yr;
++    q = (q << 1) | c;
++    xr -= c ? yr : 0.0f;
++    xr += xr;
++    --k;
++  }
++
++  c = xr > yr;
++  q = (q << 1) | c;
++  xr -= c ? yr : 0.0f;
++
++  int lt = ex < ey;
++
++  q = lt ? 0 : q;
++  xr = lt ? xa : xr;
++  yr = lt ? ya : yr;
++
++  c = (yr < 2.0f * xr) | ((yr == 2.0f * xr) & ((q & 0x1) == 0x1));
++  xr -= c ? yr : 0.0f;
++  q += c;
++
++  float s = __clc_as_float(ey << EXPSHIFTBITS_SP32);
++  xr *= lt ? 1.0f : s;
++
++  int qsgn = sx == sy ? 1 : -1;
++  int quot = (q & 0x7f) * qsgn;
++
++  c = ax == ay;
++  quot = c ? qsgn : quot;
++  xr = c ? 0.0f : xr;
++
++  xr = __clc_as_float(sx ^ __clc_as_int(xr));
++
++  c = ax > PINFBITPATT_SP32 | ay > PINFBITPATT_SP32 | ax == PINFBITPATT_SP32 |
++      ay == 0;
++  quot = c ? 0 : quot;
++  xr = c ? __clc_as_float(QNANBITPATT_SP32) : xr;
++
++  *quo = quot;
++
++  return xr;
++}
++
++// remquo signature is special, we don't have macro for this
++#define __CLC_VEC_REMQUO(TYPE, VEC_SIZE, HALF_VEC_SIZE)                        \
++  _CLC_DEF _CLC_OVERLOAD TYPE##VEC_SIZE __clc_remquo(                          \
++      TYPE##VEC_SIZE x, TYPE##VEC_SIZE y,                                      \
++      __CLC_ADDRESS_SPACE int##VEC_SIZE *quo) {                                \
++    int##HALF_VEC_SIZE lo, hi;                                                 \
++    TYPE##VEC_SIZE ret;                                                        \
++    ret.lo = __clc_remquo(x.lo, y.lo, &lo);                                    \
++    ret.hi = __clc_remquo(x.hi, y.hi, &hi);                                    \
++    (*quo).lo = lo;                                                            \
++    (*quo).hi = hi;                                                            \
++    return ret;                                                                \
+   }
+ 
+-__CLC_REMQUO_DEF(private)
+-__CLC_REMQUO_DEF(local)
+-__CLC_REMQUO_DEF(global)
+-#if _CLC_DISTINCT_GENERIC_AS_SUPPORTED
+-__CLC_REMQUO_DEF(generic)
++#define __CLC_VEC3_REMQUO(TYPE)                                                \
++  _CLC_DEF _CLC_OVERLOAD TYPE##3 __clc_remquo(                                 \
++      TYPE##3 x, TYPE##3 y, __CLC_ADDRESS_SPACE int##3 * quo) {                \
++    int2 lo;                                                                   \
++    int hi;                                                                    \
++    TYPE##3 ret;                                                               \
++    ret.s01 = __clc_remquo(x.s01, y.s01, &lo);                                 \
++    ret.s2 = __clc_remquo(x.s2, y.s2, &hi);                                    \
++    (*quo).s01 = lo;                                                           \
++    (*quo).s2 = hi;                                                            \
++    return ret;                                                                \
++  }
++__CLC_VEC_REMQUO(float, 2, )
++__CLC_VEC3_REMQUO(float)
++__CLC_VEC_REMQUO(float, 4, 2)
++__CLC_VEC_REMQUO(float, 8, 4)
++__CLC_VEC_REMQUO(float, 16, 8)
++
++#ifdef cl_khr_fp64
++
++#pragma OPENCL EXTENSION cl_khr_fp64 : enable
++
++_CLC_DEF _CLC_OVERLOAD double __clc_remquo(double x, double y,
++                                           __CLC_ADDRESS_SPACE int *pquo) {
++  ulong ux = __clc_as_ulong(x);
++  ulong ax = ux & ~SIGNBIT_DP64;
++  ulong xsgn = ux ^ ax;
++  double dx = __clc_as_double(ax);
++  int xexp = __clc_convert_int(ax >> EXPSHIFTBITS_DP64);
++  int xexp1 = 11 - (int)__clc_clz(ax & MANTBITS_DP64);
++  xexp1 = xexp < 1 ? xexp1 : xexp;
++
++  ulong uy = __clc_as_ulong(y);
++  ulong ay = uy & ~SIGNBIT_DP64;
++  double dy = __clc_as_double(ay);
++  int yexp = __clc_convert_int(ay >> EXPSHIFTBITS_DP64);
++  int yexp1 = 11 - (int)__clc_clz(ay & MANTBITS_DP64);
++  yexp1 = yexp < 1 ? yexp1 : yexp;
++
++  int qsgn = ((ux ^ uy) & SIGNBIT_DP64) == 0UL ? 1 : -1;
++
++  // First assume |x| > |y|
++
++  // Set ntimes to the number of times we need to do a
++  // partial remainder. If the exponent of x is an exact multiple
++  // of 53 larger than the exponent of y, and the mantissa of x is
++  // less than the mantissa of y, ntimes will be one too large
++  // but it doesn't matter - it just means that we'll go round
++  // the loop below one extra time.
++  int ntimes = __clc_max(0, (xexp1 - yexp1) / 53);
++  double w = __clc_ldexp(dy, ntimes * 53);
++  w = ntimes == 0 ? dy : w;
++  double scale = ntimes == 0 ? 1.0 : 0x1.0p-53;
++
++  // Each time round the loop we compute a partial remainder.
++  // This is done by subtracting a large multiple of w
++  // from x each time, where w is a scaled up version of y.
++  // The subtraction must be performed exactly in quad
++  // precision, though the result at each stage can
++  // fit exactly in a double precision number.
++  int i;
++  double t, v, p, pp;
++
++  for (i = 0; i < ntimes; i++) {
++    // Compute integral multiplier
++    t = __clc_trunc(dx / w);
++
++    // Compute w * t in quad precision
++    p = w * t;
++    pp = __clc_fma(w, t, -p);
++
++    // Subtract w * t from dx
++    v = dx - p;
++    dx = v + (((dx - v) - p) - pp);
++
++    // If t was one too large, dx will be negative. Add back one w.
++    dx += dx < 0.0 ? w : 0.0;
++
++    // Scale w down by 2^(-53) for the next iteration
++    w *= scale;
++  }
++
++  // One more time
++  // Variable todd says whether the integer t is odd or not
++  t = __clc_floor(dx / w);
++  long lt = (long)t;
++  int todd = lt & 1;
++
++  p = w * t;
++  pp = __clc_fma(w, t, -p);
++  v = dx - p;
++  dx = v + (((dx - v) - p) - pp);
++  i = dx < 0.0;
++  todd ^= i;
++  dx += i ? w : 0.0;
++
++  lt -= i;
++
++  // At this point, dx lies in the range [0,dy)
++
++  // For the remainder function, we need to adjust dx
++  // so that it lies in the range (-y/2, y/2] by carefully
++  // subtracting w (== dy == y) if necessary. The rigmarole
++  // with todd is to get the correct sign of the result
++  // when x/y lies exactly half way between two integers,
++  // when we need to choose the even integer.
++
++  int al = (2.0 * dx > w) | (todd & (2.0 * dx == w));
++  double dxl = dx - (al ? w : 0.0);
++
++  int ag = (dx > 0.5 * w) | (todd & (dx == 0.5 * w));
++  double dxg = dx - (ag ? w : 0.0);
++
++  dx = dy < 0x1.0p+1022 ? dxl : dxg;
++  lt += dy < 0x1.0p+1022 ? al : ag;
++  int quo = ((int)lt & 0x7f) * qsgn;
++
++  double ret = __clc_as_double(xsgn ^ __clc_as_ulong(dx));
++  dx = __clc_as_double(ax);
++
++  // Now handle |x| == |y|
++  int c = dx == dy;
++  t = __clc_as_double(xsgn);
++  quo = c ? qsgn : quo;
++  ret = c ? t : ret;
++
++  // Next, handle |x| < |y|
++  c = dx < dy;
++  quo = c ? 0 : quo;
++  ret = c ? x : ret;
++
++  c &= (yexp<1023 & 2.0 * dx> dy) | (dx > 0.5 * dy);
++  quo = c ? qsgn : quo;
++  // we could use a conversion here instead since qsgn = +-1
++  p = qsgn == 1 ? -1.0 : 1.0;
++  t = __clc_fma(y, p, x);
++  ret = c ? t : ret;
++
++  // We don't need anything special for |x| == 0
++
++  // |y| is 0
++  c = dy == 0.0;
++  quo = c ? 0 : quo;
++  ret = c ? __clc_as_double(QNANBITPATT_DP64) : ret;
++
++  // y is +-Inf, NaN
++  c = yexp > BIASEDEMAX_DP64;
++  quo = c ? 0 : quo;
++  t = y == y ? x : y;
++  ret = c ? t : ret;
++
++  // x is +=Inf, NaN
++  c = xexp > BIASEDEMAX_DP64;
++  quo = c ? 0 : quo;
++  ret = c ? __clc_as_double(QNANBITPATT_DP64) : ret;
++
++  *pquo = quo;
++  return ret;
++}
++__CLC_VEC_REMQUO(double, 2, )
++__CLC_VEC3_REMQUO(double)
++__CLC_VEC_REMQUO(double, 4, 2)
++__CLC_VEC_REMQUO(double, 8, 4)
++__CLC_VEC_REMQUO(double, 16, 8)
++
++#endif
++
++#ifdef cl_khr_fp16
++
++#pragma OPENCL EXTENSION cl_khr_fp16 : enable
++
++_CLC_OVERLOAD _CLC_DEF half __clc_remquo(half x, half y,
++                                         __CLC_ADDRESS_SPACE int *pquo) {
++  return (half)__clc_remquo((float)x, (float)y, pquo);
++}
++__CLC_VEC_REMQUO(half, 2, )
++__CLC_VEC3_REMQUO(half)
++__CLC_VEC_REMQUO(half, 4, 2)
++__CLC_VEC_REMQUO(half, 8, 4)
++__CLC_VEC_REMQUO(half, 16, 8)
++
+ #endif
+-#endif // __CLC_SCALAR
+diff --git a/libclc/clc/lib/generic/math/clc_remquo_stret.inc b/libclc/clc/lib/generic/math/clc_remquo_stret.inc
+deleted file mode 100644
+index eecc255..0000000
+--- a/libclc/clc/lib/generic/math/clc_remquo_stret.inc
++++ /dev/null
+@@ -1,158 +0,0 @@
+-//===----------------------------------------------------------------------===//
+-//
+-// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
+-// See https://llvm.org/LICENSE.txt for license information.
+-// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
+-//
+-//===----------------------------------------------------------------------===//
+-
+-#ifdef __CLC_SCALAR
+-
+-#if __CLC_FPSIZE == 32 || __CLC_FPSIZE == 64
+-#define __CLC_REMQUO_EVAL_TYPE __CLC_GENTYPE
+-#define __CLC_CONVERT_REMQUO_EVAL_TYPE __CLC_CONVERT_GENTYPE
+-#define __CLC_S_EVAL_TYPE __CLC_S_GENTYPE
+-#define __CLC_CONVERT_S_EVAL_TYPE __CLC_CONVERT_S_GENTYPE
+-#elif __CLC_FPSIZE == 16
+-#define __CLC_REMQUO_EVAL_TYPE __CLC_FLOATN
+-#define __CLC_CONVERT_REMQUO_EVAL_TYPE __CLC_CONVERT_FLOATN
+-#define __CLC_S_EVAL_TYPE __CLC_INTN
+-#define __CLC_CONVERT_S_EVAL_TYPE __CLC_CONVERT_INTN
+-#endif
+-
+-_CLC_DEF _CLC_OVERLOAD _CLC_CONST __CLC_REMQUO_RET_GENTYPE
+-__clc_remquo_stret(__CLC_GENTYPE x, __CLC_GENTYPE y) {
+-  // How many bits of the quotient per iteration
+-
+-#if __CLC_FPSIZE == 32
+-  const __CLC_INTN bits = 12;
+-  const __CLC_GENTYPE max_exp = 0x1.0p+127f;
+-#elif __CLC_FPSIZE == 64
+-  const __CLC_INTN bits = 26;
+-  const __CLC_GENTYPE max_exp = 0x1.0p+1023;
+-#elif __CLC_FPSIZE == 16
+-  const __CLC_INTN bits = 11;
+-  const __CLC_GENTYPE max_exp = 0x1.0p+15h;
+-#endif
+-
+-  // Track low 7 bits of the integral quotient.
+-  __CLC_INTN q7;
+-
+-  __CLC_REMQUO_EVAL_TYPE ax = __CLC_CONVERT_REMQUO_EVAL_TYPE(__clc_fabs(x));
+-  __CLC_REMQUO_EVAL_TYPE ay = __CLC_CONVERT_REMQUO_EVAL_TYPE(__clc_fabs(y));
+-
+-  __CLC_GENTYPE ret;
+-
+-  if (ax > ay) {
+-    __CLC_INTN ex, ey;
+-
+-    __CLC_REMQUO_EVAL_TYPE mx = __clc_frexp(ax, &ex);
+-    --ex;
+-
+-    __CLC_REMQUO_EVAL_TYPE my = __clc_frexp(ay, &ey);
+-    --ey;
+-
+-    ax = __clc_ldexp(mx, bits);
+-    ay = __clc_ldexp(my, 1);
+-
+-    __CLC_INTN nb = ex - ey;
+-    __CLC_REMQUO_EVAL_TYPE ayinv = __clc_recip_fast(ay);
+-
+-    __CLC_INTN qacc = 0;
+-
+-    while (nb > bits) {
+-      __CLC_REMQUO_EVAL_TYPE q = __clc_rint(ax * ayinv);
+-
+-#if __CLC_FPSIZE == 16
+-      ax = __clc_mad(-q, ay, ax);
+-#else
+-      ax = __clc_fma(-q, ay, ax);
+-#endif
+-      __CLC_S_GENTYPE clt = ax < (__CLC_REMQUO_EVAL_TYPE)0.0;
+-      __CLC_REMQUO_EVAL_TYPE axp = ax + ay;
+-      ax = clt ? axp : ax;
+-      ax = __clc_ldexp(ax, bits);
+-
+-      __CLC_INTN iq = __CLC_CONVERT_INTN(q);
+-      iq -= __CLC_CONVERT_INTN(clt) ? 1 : 0;
+-      qacc = (qacc << bits) | iq;
+-
+-      nb -= bits;
+-    }
+-
+-    ax = __clc_ldexp(ax, nb - bits + 1);
+-
+-    __CLC_INTN is_odd;
+-
+-    // Final iteration
+-    {
+-      __CLC_REMQUO_EVAL_TYPE q = __clc_rint(ax * ayinv);
+-#if __CLC_FPSIZE == 16
+-      ax = __clc_mad(-q, ay, ax);
+-#else
+-      ax = __clc_fma(-q, ay, ax);
+-#endif
+-
+-      __CLC_S_GENTYPE clt = ax < (__CLC_REMQUO_EVAL_TYPE)0.0;
+-      __CLC_REMQUO_EVAL_TYPE axp = ax + ay;
+-      ax = clt ? axp : ax;
+-      __CLC_INTN iq = __CLC_CONVERT_INTN(q);
+-      iq -= __CLC_CONVERT_INTN(clt) ? 1 : 0;
+-
+-      qacc = (qacc << (nb + 1)) | iq;
+-      is_odd = (iq & 1) != 0;
+-    }
+-
+-    // Adjust ax so that it is the range (-y/2, y/2]
+-    // We need to choose the even integer when x/y is midway between two
+-    // integers
+-    __CLC_S_EVAL_TYPE aq = ((__CLC_REMQUO_EVAL_TYPE)2.0 * ax > ay) |
+-                           (__CLC_CONVERT_S_EVAL_TYPE(is_odd) &
+-                            ((__CLC_REMQUO_EVAL_TYPE)2.0 * ax == ay));
+-    ax = ax - (aq ? ay : (__CLC_REMQUO_EVAL_TYPE)0.0);
+-
+-    ax = __clc_ldexp(ax, ey);
+-    qacc += aq ? 1 : 0;
+-
+-    __CLC_S_GENTYPE qneg = __clc_signbit(x) ^ __clc_signbit(y) ? -1 : 0;
+-    q7 = ((qacc & 0x7f) ^ qneg) - qneg;
+-
+-    ret = __clc_signbit(x) ? -ax : ax;
+-  } else {
+-    __CLC_S_EVAL_TYPE c = (ax > (__CLC_REMQUO_EVAL_TYPE)0.5 * ay);
+-    if (__CLC_FPSIZE != 16)
+-      c |= (ay < max_exp && (__CLC_REMQUO_EVAL_TYPE)2.0 * ax > ay);
+-
+-    __CLC_CHARN qsgn = __CLC_CONVERT_CHARN(__clc_signbit(x) == __clc_signbit(y))
+-                           ? (__CLC_CHARN)1
+-                           : (__CLC_CHARN)-1;
+-
+-    __CLC_GENTYPE t = __clc_mad(y, -__CLC_CONVERT_GENTYPE(qsgn), x);
+-    ret = c ? t : __clc_flush_if_daz(x);
+-    q7 = c ? qsgn : 0;
+-
+-    __CLC_GENTYPE zero = __clc_copysign(__CLC_FP_LIT(0.0), x);
+-    ret = ax == ay ? zero : ret;
+-    q7 = ax == ay ? qsgn : q7;
+-  }
+-
+-  ret = y == __CLC_FP_LIT(0.0) ? __CLC_GENTYPE_NAN : ret;
+-  q7 = y == __CLC_FP_LIT(0.0) ? 0 : q7;
+-
+-  __CLC_S_GENTYPE finite = !__clc_isnan(y) && __clc_isfinite(x);
+-
+-  // A defined 0 result for quo with a nan result is an additional OpenCL
+-  // requirement beyond standard C.
+-  __CLC_REMQUO_RET_GENTYPE result;
+-  result.quo = finite ? q7 : 0;
+-  result.rem = finite ? ret : __CLC_GENTYPE_NAN;
+-
+-  return result;
+-}
+-
+-#undef __CLC_REMQUO_EVAL_TYPE
+-#undef __CLC_CONVERT_REMQUO_EVAL_TYPE
+-#undef __CLC_S_EVAL_TYPE
+-#undef __CLC_CONVERT_S_EVAL_TYPE
+-
+-#endif // __CLC_SCALAR
+-- 
+2.47.3
+
diff --git a/package/llvm-project/libclc/0006-libclc-Revert-libclc-Update-hypot-implementation-185.patch b/package/llvm-project/libclc/0006-libclc-Revert-libclc-Update-hypot-implementation-185.patch
new file mode 100644
index 0000000000..eb68b65b8e
--- /dev/null
+++ b/package/llvm-project/libclc/0006-libclc-Revert-libclc-Update-hypot-implementation-185.patch
@@ -0,0 +1,171 @@
+From 931f02ef3281fa7bcf14362a7f90edec40825aaf Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Wed, 22 Jul 2026 18:06:52 +0200
+Subject: [PATCH] libclc: Revert "libclc: Update hypot implementation
+ (#185873)"
+
+Fixes math_brute_force/test_bruteforce hypot
+
+This reverts commit 3da14eeacb90b5298805197b96f92551b7759a1d.
+
+Upstream: https://gitlab.freedesktop.org/karolherbst/mesa-libclc/-/commit/931f02ef3281fa7bcf14362a7f90edec40825aaf
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclc/clc/lib/generic/math/clc_hypot.cl  |  14 ++--
+ libclc/clc/lib/generic/math/clc_hypot.inc | 101 ++++++++++++++++++++---------
+ 2 files changed, 75 insertions(+), 40 deletions(-)
+
+diff --git a/libclc/clc/lib/generic/math/clc_hypot.cl b/libclc/clc/lib/generic/math/clc_hypot.cl
+index b609d68..8eef0a5 100644
+--- a/libclc/clc/lib/generic/math/clc_hypot.cl
++++ b/libclc/clc/lib/generic/math/clc_hypot.cl
+@@ -7,17 +7,15 @@
+ //===----------------------------------------------------------------------===//
+ 
+ #include "clc/clc_convert.h"
+-#include "clc/float/definitions.h"
++#include "clc/integer/clc_abs.h"
+ #include "clc/internal/clc.h"
+-#include "clc/math/clc_fabs.h"
+-#include "clc/math/clc_fmax.h"
+-#include "clc/math/clc_frexp_exp.h"
+-#include "clc/math/clc_ldexp.h"
++#include "clc/math/clc_fma.h"
+ #include "clc/math/clc_mad.h"
+-#include "clc/math/clc_sqrt_fast.h"
++#include "clc/math/clc_sqrt.h"
++#include "clc/math/clc_subnormal_config.h"
+ #include "clc/math/math.h"
+-#include "clc/relational/clc_isinf.h"
+-#include "clc/relational/clc_isunordered.h"
++#include "clc/relational/clc_isnan.h"
++#include "clc/shared/clc_clamp.h"
+ 
+ #define __CLC_BODY "clc_hypot.inc"
+ #include "clc/math/gentype.inc"
+diff --git a/libclc/clc/lib/generic/math/clc_hypot.inc b/libclc/clc/lib/generic/math/clc_hypot.inc
+index 2321fb3..2fa9162 100644
+--- a/libclc/clc/lib/generic/math/clc_hypot.inc
++++ b/libclc/clc/lib/generic/math/clc_hypot.inc
+@@ -10,48 +10,85 @@
+ // warrants it
+ 
+ #if __CLC_FPSIZE == 32
+-_CLC_OVERLOAD _CLC_DEF _CLC_CONST __CLC_GENTYPE __clc_hypot(__CLC_GENTYPE x,
+-                                                            __CLC_GENTYPE y) {
+-  __CLC_GENTYPE a = __clc_fabs(x);
+-  __CLC_GENTYPE b = __clc_fabs(y);
+-  __CLC_GENTYPE t = __clc_fmax(a, b);
+-  __CLC_INTN e = __clc_frexp_exp(t);
+-
+-  a = __clc_ldexp(a, -e);
+-  b = __clc_ldexp(b, -e);
+-  __CLC_GENTYPE ret = __clc_ldexp(__clc_sqrt_fast(__clc_mad(a, a, b * b)), e);
+-
+-  return __clc_isinf(t) ? __CLC_GENTYPE_INF : ret;
++_CLC_DEF _CLC_OVERLOAD __CLC_GENTYPE __clc_hypot(__CLC_GENTYPE x,
++                                                 __CLC_GENTYPE y) {
++  __CLC_UINTN ux = __CLC_AS_UINTN(x);
++  __CLC_UINTN aux = ux & EXSIGNBIT_SP32;
++  __CLC_UINTN uy = __CLC_AS_UINTN(y);
++  __CLC_UINTN auy = uy & EXSIGNBIT_SP32;
++  __CLC_INTN c = aux > auy;
++  ux = c ? aux : auy;
++  uy = c ? auy : aux;
++
++  __CLC_INTN xexp = __clc_clamp(
++      __CLC_AS_INTN(ux >> EXPSHIFTBITS_SP32) - EXPBIAS_SP32, -126, 126);
++  __CLC_GENTYPE fx_exp =
++      __CLC_AS_GENTYPE((xexp + EXPBIAS_SP32) << EXPSHIFTBITS_SP32);
++  __CLC_GENTYPE fi_exp =
++      __CLC_AS_GENTYPE((-xexp + EXPBIAS_SP32) << EXPSHIFTBITS_SP32);
++  __CLC_GENTYPE fx = __CLC_AS_GENTYPE(ux) * fi_exp;
++  __CLC_GENTYPE fy = __CLC_AS_GENTYPE(uy) * fi_exp;
++
++  __CLC_GENTYPE retval = __clc_sqrt(__clc_mad(fx, fx, fy * fy)) * fx_exp;
++
++  retval = (ux > PINFBITPATT_SP32 || uy == 0) ? __CLC_AS_GENTYPE(ux) : retval;
++  retval = (ux == PINFBITPATT_SP32 || uy == PINFBITPATT_SP32)
++               ? __CLC_AS_GENTYPE((__CLC_UINTN)PINFBITPATT_SP32)
++               : retval;
++  return retval;
+ }
+ 
+ #elif __CLC_FPSIZE == 64
+ 
+-_CLC_OVERLOAD _CLC_DEF _CLC_CONST __CLC_GENTYPE __clc_hypot(__CLC_GENTYPE x,
+-                                                            __CLC_GENTYPE y) {
+-  __CLC_GENTYPE a = __clc_fabs(x);
+-  __CLC_GENTYPE b = __clc_fabs(y);
+-  __CLC_GENTYPE t = __clc_fmax(a, b);
+-  __CLC_INTN e = __clc_frexp_exp(t);
++_CLC_DEF _CLC_OVERLOAD __CLC_GENTYPE __clc_hypot(__CLC_GENTYPE x,
++                                                 __CLC_GENTYPE y) {
++  __CLC_ULONGN ux = __CLC_AS_ULONGN(x) & ~SIGNBIT_DP64;
++  __CLC_INTN xexp = __CLC_CONVERT_INTN(ux >> EXPSHIFTBITS_DP64);
++  x = __CLC_AS_GENTYPE(ux);
+ 
+-  a = __clc_ldexp(a, -e);
+-  b = __clc_ldexp(b, -e);
+-  __CLC_GENTYPE ret = __clc_ldexp(__clc_sqrt_fast(__clc_mad(a, a, b * b)), e);
++  __CLC_ULONGN uy = __CLC_AS_ULONGN(y) & ~SIGNBIT_DP64;
++  __CLC_INTN yexp = __CLC_CONVERT_INTN(uy >> EXPSHIFTBITS_DP64);
++  y = __CLC_AS_GENTYPE(uy);
+ 
+-  ret = __clc_isunordered(x, y) ? __CLC_GENTYPE_NAN : ret;
+-  return __clc_isinf(x) || __clc_isinf(y) ? __CLC_GENTYPE_INF : ret;
+-}
++  __CLC_LONGN c = __CLC_CONVERT_LONGN(xexp > EXPBIAS_DP64 + 500 ||
++                                      yexp > EXPBIAS_DP64 + 500);
++  __CLC_GENTYPE preadjust = c ? 0x1.0p-600 : 1.0;
++  __CLC_GENTYPE postadjust = c ? 0x1.0p+600 : 1.0;
+ 
+-#elif __CLC_FPSIZE == 16
++  c = __CLC_CONVERT_LONGN(xexp < EXPBIAS_DP64 - 500 ||
++                          yexp < EXPBIAS_DP64 - 500);
++  preadjust = c ? 0x1.0p+600 : preadjust;
++  postadjust = c ? 0x1.0p-600 : postadjust;
++
++  __CLC_GENTYPE ax = x * preadjust;
++  __CLC_GENTYPE ay = y * preadjust;
+ 
+-_CLC_OVERLOAD _CLC_DEF _CLC_CONST __CLC_GENTYPE __clc_hypot(__CLC_GENTYPE x,
+-                                                            __CLC_GENTYPE y) {
+-  __CLC_FLOATN fx = __CLC_CONVERT_FLOATN(x);
+-  __CLC_FLOATN fy = __CLC_CONVERT_FLOATN(y);
+-  __CLC_FLOATN d2 = __clc_mad(fx, fx, fy * fy);
++  // The post adjust may overflow, but this can't be avoided in any case
++  __CLC_GENTYPE r = __clc_sqrt(__clc_fma(ax, ax, ay * ay)) * postadjust;
+ 
+-  __CLC_GENTYPE ret = __CLC_CONVERT_HALFN(__clc_sqrt_fast(d2));
++  // If the difference in exponents between x and y is large
++  __CLC_GENTYPE s = x + y;
++  c = __CLC_CONVERT_LONGN(__clc_abs(xexp - yexp) > MANTLENGTH_DP64 + 1);
++  r = c ? s : r;
++
++  // Check for NaN
++  c = __clc_isnan(x) || __clc_isnan(y);
++  r = c ? __CLC_AS_GENTYPE((__CLC_ULONGN)QNANBITPATT_DP64) : r;
++
++  // If either is Inf, we must return Inf
++  c = x == __CLC_AS_GENTYPE((__CLC_ULONGN)PINFBITPATT_DP64) ||
++      y == __CLC_AS_GENTYPE((__CLC_ULONGN)PINFBITPATT_DP64);
++  r = c ? __CLC_AS_GENTYPE((__CLC_ULONGN)PINFBITPATT_DP64) : r;
++
++  return r;
++}
++
++#elif __CLC_FPSIZE == 16
+ 
+-  return __clc_isinf(x) || __clc_isinf(y) ? __CLC_GENTYPE_INF : ret;
++_CLC_DEF _CLC_OVERLOAD __CLC_GENTYPE __clc_hypot(__CLC_GENTYPE x,
++                                                 __CLC_GENTYPE y) {
++  return __CLC_CONVERT_GENTYPE(
++      __clc_hypot(__CLC_CONVERT_FLOATN(x), __CLC_CONVERT_FLOATN(y)));
+ }
+ 
+ #endif
+-- 
+2.47.3
+
diff --git a/package/llvm-project/libclc/0007-libclc-Partly-revert-libclc-Update-trigpi-functions-.patch b/package/llvm-project/libclc/0007-libclc-Partly-revert-libclc-Update-trigpi-functions-.patch
new file mode 100644
index 0000000000..062ec0e5a6
--- /dev/null
+++ b/package/llvm-project/libclc/0007-libclc-Partly-revert-libclc-Update-trigpi-functions-.patch
@@ -0,0 +1,173 @@
+From 1e379e04c3fc1457a80d47e0da2a6e242237094c Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Wed, 1 Apr 2026 02:55:52 +0200
+Subject: [PATCH] libclc: Partly revert "libclc: Update trigpi functions
+ (#187579)"
+
+The initial commit broke sinpi
+
+This partly reverts commit 421bf13e4bf1c19a0cc48fbb0af63b902d3118b1
+
+Upstream: https://gitlab.freedesktop.org/karolherbst/mesa-libclc/-/commit/1e379e04c3fc1457a80d47e0da2a6e242237094c
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ .../clc/math/clc_sincos_helpers_fp64_decl.inc |   5 +
+ libclc/clc/lib/generic/math/clc_sinpi.cl             |   8 +-
+ libclc/clc/lib/generic/math/clc_sinpi.inc            | 106 +++++++++++++++++-
+ 3 files changed, 115 insertions(+), 4 deletions(-)
+
+diff --git a/libclc/clc/include/clc/math/clc_sincos_helpers_fp64_decl.inc b/libclc/clc/include/clc/math/clc_sincos_helpers_fp64_decl.inc
+index 22081d9..d638d72 100644
+--- a/libclc/clc/include/clc/math/clc_sincos_helpers_fp64_decl.inc
++++ b/libclc/clc/include/clc/math/clc_sincos_helpers_fp64_decl.inc
+@@ -22,6 +22,11 @@ _CLC_DEF _CLC_OVERLOAD __CLC_DOUBLEN __clc_tan_reduced_eval(__CLC_DOUBLEN x,
+                                                             __CLC_DOUBLEN y,
+                                                             __CLC_INTN is_odd);
+ 
++_CLC_DECL _CLC_OVERLOAD void __clc_sincos_piby4(__CLC_DOUBLEN x,
++                                                __CLC_DOUBLEN xx,
++                                                private __CLC_DOUBLEN *sinval,
++                                                private __CLC_DOUBLEN *cosval);
++
+ _CLC_DECL _CLC_OVERLOAD __CLC_INTN __clc_remainder_piby2_small(
+     __CLC_DOUBLEN x, private __CLC_DOUBLEN *r, private __CLC_DOUBLEN *rr);
+ 
+diff --git a/libclc/clc/lib/generic/math/clc_sinpi.cl b/libclc/clc/lib/generic/math/clc_sinpi.cl
+index bf57dc4..f9bed7e 100644
+--- a/libclc/clc/lib/generic/math/clc_sinpi.cl
++++ b/libclc/clc/lib/generic/math/clc_sinpi.cl
+@@ -6,8 +6,12 @@
+ //
+ //===----------------------------------------------------------------------===//
+ 
+-#include "clc/math/clc_sincospi.h"
+-#include "clc/math/clc_sinpi.h"
++#include "clc/clc_convert.h"
++#include "clc/float/definitions.h"
++#include "clc/internal/clc.h"
++#include "clc/math/clc_fabs.h"
++#include "clc/math/clc_sincos_helpers.h"
++#include "clc/math/math.h"
+ 
+ #define __CLC_BODY "clc_sinpi.inc"
+ #include "clc/math/gentype.inc"
+diff --git a/libclc/clc/lib/generic/math/clc_sinpi.inc b/libclc/clc/lib/generic/math/clc_sinpi.inc
+index a6e5ee7..264609a 100644
+--- a/libclc/clc/lib/generic/math/clc_sinpi.inc
++++ b/libclc/clc/lib/generic/math/clc_sinpi.inc
+@@ -6,7 +6,109 @@
+ //
+ //===----------------------------------------------------------------------===//
+ 
++#if __CLC_FPSIZE == 32
++
+ _CLC_OVERLOAD _CLC_DEF __CLC_GENTYPE __clc_sinpi(__CLC_GENTYPE x) {
+-  __CLC_GENTYPE unused_cos;
+-  return __clc_sincospi(x, &unused_cos);
++  __CLC_INTN ix = __CLC_AS_INTN(x);
++  __CLC_INTN xsgn = ix & (__CLC_INTN)0x80000000;
++  ix ^= xsgn;
++  __CLC_GENTYPE absx = __clc_fabs(x);
++  __CLC_INTN iax = __CLC_CONVERT_INTN(absx);
++  __CLC_GENTYPE r = absx - __CLC_CONVERT_GENTYPE(iax);
++  __CLC_INTN xodd =
++      xsgn ^ ((iax & 0x1) != 0 ? (__CLC_INTN)0x80000000 : (__CLC_INTN)0);
++
++  // Initialize with return for +-Inf and NaN
++  __CLC_INTN ir = QNANBITPATT_SP32;
++
++  // 2^23 <= |x| < Inf, the result is always integer
++  ir = ix < PINFBITPATT_SP32 ? xsgn : ir;
++
++  // 0x1.0p-7 <= |x| < 2^23, result depends on which 0.25 interval
++
++  // r < 1.0
++  __CLC_GENTYPE a = 1.0f - r;
++  __CLC_INTN e = 0;
++
++  // r <= 0.75
++  __CLC_INTN c = r <= 0.75f;
++  a = c ? r - 0.5f : a;
++  e = c ? 1 : e;
++
++  // r < 0.5
++  c = r < 0.5f;
++  a = c ? 0.5f - r : a;
++
++  // 0 < r <= 0.25
++  c = r <= 0.25f;
++  a = c ? r : a;
++  e = c ? 0 : e;
++
++  __CLC_GENTYPE sinval, cosval;
++  __clc_sincos_piby4(a * M_PI_F, &sinval, &cosval);
++  __CLC_INTN jr = xodd ^ __CLC_AS_INTN(e != 0 ? cosval : sinval);
++
++  ir = ix < 0x4b000000 ? jr : ir;
++
++  return __CLC_AS_GENTYPE(ir);
+ }
++
++#elif __CLC_FPSIZE == 64
++
++_CLC_OVERLOAD _CLC_DEF __CLC_GENTYPE __clc_sinpi(__CLC_GENTYPE x) {
++  __CLC_LONGN ix = __CLC_AS_LONGN(x);
++  __CLC_LONGN xsgn = ix & (__CLC_LONGN)0x8000000000000000L;
++  ix ^= xsgn;
++  __CLC_GENTYPE absx = __clc_fabs(x);
++  __CLC_LONGN iax = __CLC_CONVERT_LONGN(absx);
++  __CLC_GENTYPE r = absx - __CLC_CONVERT_GENTYPE(iax);
++  __CLC_LONGN xodd =
++      xsgn ^
++      ((iax & 0x1L) != 0 ? (__CLC_LONGN)0x8000000000000000L : (__CLC_LONGN)0L);
++
++  // Initialize with return for +-Inf and NaN
++  __CLC_LONGN ir = QNANBITPATT_DP64;
++
++  // 2^23 <= |x| < Inf, the result is always integer
++  ir = ix < PINFBITPATT_DP64 ? xsgn : ir;
++
++  // 0x1.0p-7 <= |x| < 2^23, result depends on which 0.25 interval
++
++  // r < 1.0
++  __CLC_GENTYPE a = 1.0 - r;
++  __CLC_LONGN e = 0;
++
++  //  r <= 0.75
++  __CLC_LONGN c = r <= 0.75;
++  __CLC_GENTYPE t = r - 0.5;
++  a = c ? t : a;
++  e = c ? 1 : e;
++
++  // r < 0.5
++  c = r < 0.5;
++  t = 0.5 - r;
++  a = c ? t : a;
++
++  // r <= 0.25
++  c = r <= 0.25;
++  a = c ? r : a;
++  e = c ? 0 : e;
++
++  __CLC_GENTYPE api = a * M_PI;
++
++  __CLC_GENTYPE sinval, cosval;
++  __clc_sincos_piby4(api, 0.0, &sinval, &cosval);
++  __CLC_LONGN jr = xodd ^ __CLC_AS_LONGN(e != 0 ? cosval : sinval);
++
++  ir = absx < 0x1.0p+52 ? jr : ir;
++
++  return __CLC_AS_GENTYPE(ir);
++}
++
++#elif __CLC_FPSIZE == 16
++
++_CLC_OVERLOAD _CLC_DEF __CLC_GENTYPE __clc_sinpi(__CLC_GENTYPE x) {
++  return __CLC_CONVERT_GENTYPE(__clc_sinpi(__CLC_CONVERT_FLOATN(x)));
++}
++
++#endif
+-- 
+2.47.3
+
diff --git a/package/llvm-project/libclc/0008-libclc-fix-tgamma-precision-issues-due-to-lack-of-fm.patch b/package/llvm-project/libclc/0008-libclc-fix-tgamma-precision-issues-due-to-lack-of-fm.patch
new file mode 100644
index 0000000000..301d8918e1
--- /dev/null
+++ b/package/llvm-project/libclc/0008-libclc-fix-tgamma-precision-issues-due-to-lack-of-fm.patch
@@ -0,0 +1,80 @@
+From 298976d4ddad1c7e0472647bcb50e1336a1bfd1a Mon Sep 17 00:00:00 2001
+From: Karol Herbst <kherbst@redhat.com>
+Date: Sat, 25 Jul 2026 18:03:18 +0200
+Subject: [PATCH] libclc: fix tgamma precision issues due to lack of fma
+
+The current tgamma implementation isn't precise enough when certain mads
+are implemented as unfused.
+
+Upstream: https://gitlab.freedesktop.org/karolherbst/mesa-libclc/-/commit/298976d4ddad1c7e0472647bcb50e1336a1bfd1a
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ libclc/clc/lib/generic/math/clc_tgamma.cl  |  1 +
+ libclc/clc/lib/generic/math/clc_tgamma.inc | 14 +++++++-------
+ 2 files changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/libclc/clc/lib/generic/math/clc_tgamma.cl b/libclc/clc/lib/generic/math/clc_tgamma.cl
+index 7e34ac6..c474b68 100644
+--- a/libclc/clc/lib/generic/math/clc_tgamma.cl
++++ b/libclc/clc/lib/generic/math/clc_tgamma.cl
+@@ -13,6 +13,7 @@
+ #include "clc/math/clc_copysign.h"
+ #include "clc/math/clc_exp.h"
+ #include "clc/math/clc_fabs.h"
++#include "clc/math/clc_fma.h"
+ #include "clc/math/clc_mad.h"
+ #include "clc/math/clc_powr.h"
+ #include "clc/math/clc_recip_fast.h"
+diff --git a/libclc/clc/lib/generic/math/clc_tgamma.inc b/libclc/clc/lib/generic/math/clc_tgamma.inc
+index 0b8c354..e49540c 100644
+--- a/libclc/clc/lib/generic/math/clc_tgamma.inc
++++ b/libclc/clc/lib/generic/math/clc_tgamma.inc
+@@ -30,14 +30,14 @@ _CLC_DEF _CLC_OVERLOAD _CLC_CONST __CLC_GENTYPE __clc_tgamma(__CLC_FLOATN x) {
+       n = 1.0f;
+ 
+       while (y > 2.5f) {
+-        n = __clc_mad(n, y, -n);
++        n = __clc_fma(n, y, -n);
+         y = y - 1.0f;
+-        n = __clc_mad(n, y, -n);
++        n = __clc_fma(n, y, -n);
+         y = y - 1.0f;
+       }
+ 
+       if (y > 1.5f) {
+-        n = __clc_mad(n, y, -n);
++        n = __clc_fma(n, y, -n);
+         y = y - 1.0f;
+       }
+ 
+@@ -49,14 +49,14 @@ _CLC_DEF _CLC_OVERLOAD _CLC_CONST __CLC_GENTYPE __clc_tgamma(__CLC_FLOATN x) {
+       d = x;
+ 
+       while (y < -1.5f) {
+-        d = __clc_mad(d, y, d);
++        d = __clc_fma(d, y, d);
+         y = y + 1.0f;
+-        d = __clc_mad(d, y, d);
++        d = __clc_fma(d, y, d);
+         y = y + 1.0f;
+       }
+ 
+       if (y < -0.5f) {
+-        d = __clc_mad(d, y, d);
++        d = __clc_fma(d, y, d);
+         y = y + 1.0f;
+       }
+ 
+@@ -70,7 +70,7 @@ _CLC_DEF _CLC_OVERLOAD _CLC_CONST __CLC_GENTYPE __clc_tgamma(__CLC_FLOATN x) {
+     __CLC_FLOATN p4 = __clc_mad(y, p3, -0x1.4fcfd6p-1f);
+     __CLC_FLOATN qt = __clc_mad(y, p4, 0x1.2788ccp-1f);
+ 
+-    ret = n / __clc_mad(d, y * qt, d);
++    ret = n / __clc_fma(d, y * qt, d);
+     ret = x == 0.0f ? __clc_copysign(__CLC_GENTYPE_INF, x) : ret;
+     ret = (x < 0.0f && __clc_fract_is_zero(x)) ? FLT_NAN : ret;
+   } else {
+-- 
+2.47.3
+
diff --git a/package/llvm-project/libclc/0009-revert-10644a1-v3.patch b/package/llvm-project/libclc/0009-revert-10644a1-v3.patch
new file mode 100644
index 0000000000..ad5eb1b98e
--- /dev/null
+++ b/package/llvm-project/libclc/0009-revert-10644a1-v3.patch
@@ -0,0 +1,37 @@
+Restore libclc.pc
+
+Revert the upstream removal of libclc.pc
+https://github.com/llvm/llvm-project/pull/185654
+
+which is needed by mesa3d to detect libclc.
+
+Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40601#note_3639151
+
+Downloaded from
+https://aur.archlinux.org/cgit/aur.git/tree/revert-10644a1-v3.patch?h=libclc-minimal-git
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -uraN llvm-project/libclc/CMakeLists.txt llvm-project.new/libclc/CMakeLists.txt
+--- llvm-project/libclc/CMakeLists.txt	2026-06-05 23:42:11.119610382 +0200
++++ llvm-project.new/libclc/CMakeLists.txt	2026-06-05 23:43:45.639449958 +0200
+@@ -123,6 +123,9 @@
+   endif()
+ endforeach()
+ 
++configure_file( libclc.pc.in libclc.pc @ONLY )
++install( FILES ${CMAKE_CURRENT_BINARY_DIR}/libclc.pc DESTINATION "${CMAKE_INSTALL_DATADIR}/pkgconfig" )
++
+ # Determine the clang target triple.
+ set(clang_triple ${LIBCLC_TARGET})
+ 
+diff -uraN llvm-project/libclc/libclc.pc.in llvm-project.new/libclc/libclc.pc.in
+--- llvm-project/libclc/libclc.pc.in	1970-01-01 01:00:00.000000000 +0100
++++ llvm-project.new/libclc/libclc.pc.in	2026-06-05 23:21:12.849811269 +0200
+@@ -0,0 +1,6 @@
++libexecdir=@CMAKE_INSTALL_PREFIX@/@CMAKE_INSTALL_DATADIR@/clc
++
++Name: libclc
++Description: Library requirements of the OpenCL C programming language
++Version: @PROJECT_VERSION@
++Libs: -L${libexecdir}
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
