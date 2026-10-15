Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152C6CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A85F461171;
	Fri, 16 Oct 2026 13:11:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzAxhAC3kMgp; Fri, 16 Oct 2026 13:11:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CEB52610CC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156286;
	b=jxdcNOxI7nj0eRG72wj60khBkrXfhyZ2l6llu7lnhQjuaNksrpdyPxwbqcXHQk+Cpr8X
	 9I9JMLYs8EN4TxBdFVakvdZWI1GYgxbJTFxzqcqClw+7FYORWcHAsahpm3qXkQzmP4tf5
	 B8pVDiHVcir0aPSGIPM6weCmGDeCcRUPmTmJow1oBxw5oWApr4BWeEoz6duGf0AHy6SLK
	 pIqiFOX/5n66OEv6MWzBhPL8qUkhXjIgQeNTJhMDWKEunIcwFD8iEy1DK43bkoGI3ITq3
	 P4j0TOazP+kBnU4QGaCWW3DC63M/IrSLl01wiHHsVD4Jhuo0+rLuIfdLgNmsJUpOcVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156286;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=N6shvXiIsb8jdM40311MFrlQebfiXz78evykolh+lQk=;
	b=JQgVdxNFE8W10vGVsP2CxWQJAMvnsUEyreLE03fFxgyIjIysHWIx+6RSpRN0qbyrrvJ4
	 h189yglz15SMRJOgLaq9kOjIDe/fD+R08GcCRLZzLiv8yuTzPEr5ScogUEnrAp0nwpadX
	 +idPWmSsvUVrjLmWAXw5ryC1k2qC6m0ZAjwf8v1lzkgsJwg1AdzP1cv+Wg9iX3ACKfCdO
	 9RiFaps/1qW0zNxwz4vdyn5r7dvCfjlo17gdXlYIHkAafI97nZY3KIaCz4zKSZBxzjaev
	 nZVM+GBDgQHkCQQeaJYeIp3yJ6HYMuebU6ZTgp1IQL3pY0f/PEg8mONdr0mSRGedLow==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156286;
	bh=N6shvXiIsb8jdM40311MFrlQebfiXz78evykolh+lQk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ksBZ+GUYZrgPJUzkRJmTjkspxr34qeO222h51nTPURHB1KTFVuV1osRip338sW7sF
	 d90Fhszj7gpAqnn6oCx5zyisbi7OogHS1GP35IBaaprZfN6POqkYj++sPRnDuPxM/f
	 rJDoBy8ApFy40lYh7hVM76GbFPOW62+SkisSs1OqUjgAiqEfvffOnTsfXXNmtTT0X9
	 IPv71hVRr+t6FKdk8SRbj2ucCRfz8vZ9Qvd4MYCMsbJYH22pO434TB5hOWvEEGeNRZ
	 r8AQuSkdq84sbotcIGksTGB75HQM76rfuyfQ1poqgVa1KczUlEsB03ZY/aK3QHgmrK
	 d9tudMluiIZxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEB52610CC;
	Fri, 16 Oct 2026 13:11:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 154CA105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0A424048F
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DXB9CfcQoLp for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4B8BD4016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156192;
 b=k7a5SSigee0LWh+w6r5lav9M1XNbRRI6j4nsvHFoX2a07HwelrrGaa85vjSH77XLePZX
 tBNhN5nUhwL00tqmhDFGvrYv1VLS3M2EL6uRu2SNKgCZgIwp/yECieFaFMK6tSzloNqDs
 wz6ZG3Q1BqxL/zJE/i3RuLGiuentZz2Riq0frPnYgX8miWKpE2YRFTOX/Ou4YqXQj2H+6
 CCgYJzNRi+NGoqMVQxxOd3YYwy/zfAlKsq2bE19bAPWsqaG+oIEry+fjXEWscyZCY3qs1
 vEoVd4+5lkNsydbChz+sqePMU0ANsAdX/MtKu6EMC7NYMNi8xMUOUnar+eVVsgQl+xA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156192;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Ptw7F5Ijgfp2RZzUF2Lmd/pVWsSbh1pBIlKryiJK2Es=;
 b=ivrVE0FSx4N1zx2Ud3XIZZoQKygbIPUPdkYf0sXrQ+IEZv0gU2JJwdQs16e+658QNfkt
 JwEJ6idW2/4jeWeAVHe03icAy3uKDxXEx2/gfKVmsxSQy+8SHZhnfiWilTJY7Q2YMQ1xQ
 j6Za+JhzXJ/oyL0vxa5EYsifquBLfWlmJhy1E1RM19rMA8VPR088ol7oshjySl5Fgl/2R
 YnoFlQR0biZBPdyhbjTnavftTDHQ6GX0JkC6AthQLNb1kAJrURou/srjY/HL4FbKHYC2x
 PxuLP0PLlt/VNO5+ddR5cRBDnpkOzI4ida6C9mLBoJyDBk5Ojl0Me2wsFsyOFQD907A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B8BD4016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3BE91960DA; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:30:16 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 06485a786790458687ad5e73d465e793c3f018b2
X-Git-Newrev: e20d53bb75fcea14c4abf4a9b7d795a308f67897
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.3BE91960DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/kbd: reorder .mk
 variables
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
Content-Type: multipart/mixed; boundary="===============2232254493003813561=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2232254493003813561==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e20d53bb75fcea14c4abf4a9b7d795a308f67897
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

We usually put the metadata variables at the beginning of the file and
the variables related to how to build it (like _CONF_OPTS) later.  Apply
this principle.

(alternative to commit 35dc65563dbe9ecc226c09473289f3e8cdb8855e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/kbd/kbd.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 6e34a45bae..a0b48d7c63 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -7,13 +7,16 @@
 KBD_VERSION = 2.9.0
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
-KBD_CONF_OPTS = \
-	--disable-vlock \
-	--disable-tests
+KBD_LICENSE = GPL-2.0+
+KBD_LICENSE_FILES = COPYING CREDITS
 KBD_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf
 
+KBD_CONF_OPTS = \
+	--disable-vlock \
+	--disable-tests
+
 # 0002-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
 # modifies configure.ac and src/libkbdfile/Makefile.am
 KBD_AUTORECONF = YES
@@ -46,9 +49,6 @@ else
 KBD_CONF_OPTS += --without-zstd
 endif
 
-KBD_LICENSE = GPL-2.0+
-KBD_LICENSE_FILES = COPYING CREDITS
-
 KBD_INSTALL_TARGET_OPTS = MKINSTALLDIRS=$(@D)/config/mkinstalldirs DESTDIR=$(TARGET_DIR) install
 
 $(eval $(autotools-package))

--===============2232254493003813561==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2232254493003813561==--
