Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21AC6C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E142140E91;
	Thu, 24 Sep 2026 18:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4-2XJxYk8Go; Thu, 24 Sep 2026 18:57:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E92CF40E90
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276276;
	b=AqzeRiKfBjxK8CJXq4P0ju6Erm6QLhVMPJSIdoicHKLnyWzMWspCHGFmpm9R/J70jZjJ
	 VSl1qh2hUsTTHTvpFuyfFgs1XgSfQ5tNnY3lE7nxMc+f7J5D3tf+InH/yrARluJjpEmKf
	 3XtJmpKXbWlKtj2/VqTktRjvskSWGZsO8l51JKm5kb9ejyVn7Hea57cYYXY3rLaAIWw5I
	 /33m2gcLe/uI35jElh1Zqyl4rz1o7tj+ZXQn3eBAp43EBP1yvBgLQ4XH3ix/MnUhcQtXV
	 Zhi1V6pAfo7b13wkcB8lLA6Vb5aBSSAErV7G6TfOtBoGvfkcM2+feUJ5sRuQu6E2MLg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276276;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=6uO/V9KfI+CrbyJqcvHbOKVeYXZdUiQ/BhdUW36xDgs=;
	b=a6Uziuj4zwbATiRdQ27rfaZ4mHeDIW4JzBqMsm/9Lq81TnV+fV2bzBYCq3D3UDIgHEvM
	 sZvcXf8gBtxR04uiVajxGY/a3lDN9IQtBovd55WUTtBoS/ateb7ADr1QDs5ZK1RVpvj4y
	 yVPwUABO7yhnWbYax8b988mJej/LiuAAsfc6LqyLC6y+4cxzKi9TgRV5+2cz1IsqdhU3j
	 mCU/mn5xu3Y4l/IPylfiPOvjL9oofjVQe3pe+uS0EPmPVsZUHIE5/T6n0azYxuMWciACV
	 rczOxpgTht7/j5GS2Gw7miGS5rATNZb9qeFnTVCi4pctsmouop0ISvcCF6Fgf6a0NFg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276276;
	bh=6uO/V9KfI+CrbyJqcvHbOKVeYXZdUiQ/BhdUW36xDgs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R60ZxG0YVcKd9uGaBY9aIew4AAoHMJEau9dYiXs+nFPdlBcnico18net/drcgawOF
	 0eCQbJ3BcTbEEOq5HEkaGl9PS92Itktu76MptJzNBBA9jCAcE4ALWB+SJ7uh3xzDfF
	 YNqTnOTmvMVb7Tn32xyRqazKXK2ul1WGR6YvPbssMWs64HlUx39FnQePjWXiVLIWhy
	 Tp9m0CEwR2N7eQBnDmjc5oz/p6Xq1bkV5eGuRxYpOdRdTcs4zT1GJnl1FzlgL0gTl+
	 JGN8vX79iOq37ijDW9nkJ7MrqrZ1dOmU/VRIw3RyiIajsX3mmghzLt1/1PbJgpTyVT
	 f8L+BiBwuxE3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E92CF40E90;
	Thu, 24 Sep 2026 18:57:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0507328
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9220D40ABB
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dwB4znJfkT0x for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B5EB640AD5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276204;
 b=ebF36swbyGjvmQgKWDBnj82gBNMt9zHyb8TFMYZzFlZShpsyaRbeoUyLMU2Pfl+9XtII
 Ta108HvEiJR0SN2/f28NB2E5J0s/Lgi8aS911faAUHD9w9icZe4/55Sn7NHx58LQnDRdu
 5J5T/YfHwtl5n9OeY7cW46R5U204Pj/2TDKix2Eb8WDZaU3Jy6IFgIOwQy3Xxn69hsCkR
 tknOel3lXxkRrJrBYUKNt7csS12WQiKL4/4R7HQipLJs51jv9PyOtdR0iQqZ1EiVAs0m3
 ebQaLmUPob4sZ2TWim0sLWseYf/2/4w4fOq61lGO/smgvLAVfIKxLKZegqEj9xkNWKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276204;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=A6GClcoEKEmOujTq7uLFr6/t6iVPaqxb9b++goYXwgc=;
 b=giseMdNhLihdLkwkhbP38f4lfcUOU8wpkXRp/8L18escsr7T4Bgm+L8Tct3fWes2VGSq
 NqlOwaqUQb995Qvdo6nr22svtqrJs/XeZTBk9ElQK8ltpG8c6gvbkQ3LINW+JYO+TBqPD
 6Jz+8jG2hDDr8ZXZ4hFv6rL687VCrxpYy/ky4z6ov9B+wv5GNNgUnDpceoN/BgOOKLkV4
 47g0cBLNmEIFUON4hJ+vim+ORywXCgyGFqo7PhiMvbjShE8rlI40gVWm6oWBIlm38K3PX
 psKLS2OYrP9Agq98PJXDGBKd7PJ5TmIpFoNEiAkiduPIDsuEHh/S4rM0p7bGJBKyd1w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B5EB640AD5
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59ADE8D5AB; Thu, 24 Sep 2026 18:55:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:24:09 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 98e7cb067b4de0fa318bbd1117b8495575ae251a
X-Git-Newrev: da49ef039c95bb76664d464c687d69abdf0af406
X-Patchwork-Hint: ignore
Message-Id: <20260924185534.59ADE8D5AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgtk3: add
 missing !BR2_STATIC_LIBS dependency
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2325744436564731056=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2325744436564731056==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/da49ef039c95bb76664d464c687d69abdf0af406
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

libgtk3 selects at-spi2-core, so it should inherit its
!BR2_STATIC_LIBS, which this commit does.

This has been an issue since libgtk3 started using at-spi2-core
instead of atk in commit 2c3ca7bea1de76163aeef432412eb14551ed0581.

Fixes: 2c3ca7bea1de76163aeef432412eb14551ed0581 ("package/atk: remove package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 93282f76a535ce54e9a853c72c01152a2c3a6805)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libgtk3/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 52ee50db49..f7618832f1 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,10 +1,11 @@
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9, dynamic library"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
-		!BR2_TOOLCHAIN_HAS_THREADS
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_STATIC_LIBS
 
 comment "libgtk3 needs an OpenGL or an OpenGL-EGL backend"
 	depends on BR2_USE_MMU
@@ -23,6 +24,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL || \
 		BR2_PACKAGE_HAS_LIBGL
+	depends on !BR2_STATIC_LIBS # at-spi2-core
 	select BR2_PACKAGE_AT_SPI2_CORE
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG

--===============2325744436564731056==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2325744436564731056==--
