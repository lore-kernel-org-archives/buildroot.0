Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CBCCA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 05:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB91640B30;
	Fri,  2 Oct 2026 05:43:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WnuH6M1IaVmT; Fri,  2 Oct 2026 05:43:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DD80F40B46
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790919790;
	b=cCREodETueakd43+pP2LhhvOiM9pc+EhP1Y97tXz6vC242r78Y18bOhQA/88e92Rn6/E
	 snZzzArX5DmD/fqhZIdPaOr7lVnsubSoI2OcR4NNbiikPaQP3fNNMsBYhsNqOoimLRWbA
	 IDn30ZV3LMDWlS+4FFLt4PN2/ePGSu0Z+dxJdMuMZTaYxKkmXn8H7fGzD28lTY494DCq3
	 IZJ0GOocRr5lP+oFhh3fgueoxBX9B2f5EJ7rda4vE1hG0Zewh3Bn+RRVcMaYSxxSJb1th
	 pKH5fh4p1vN8wtG46O3GjsCAEJGq5JRRPZyr40XUi9Wv2a5gyQoW5IViGQIcfnzio0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790919790;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FtJylmDQax3WR80/O43nmGHroB5WPqO4zPeSvCBMR78=;
	b=IJWcgVqk63yivBtIPCDc/wym7/i0NrbhzNDMK8NZ1TFOGUI4s/C/GszfSHgwxR27tIzr
	 8l9ZdW9cElVciv53ulOeZ/qC0xuSHKfJSJCF2usoLeP9050t4ZQ2S662uQmyNqieBfuPF
	 THDWS6js/5RuAPYrTTKk1ouW0ZOfcaVSDKePmpc2K0lTC6JqTRdH2zC+moA2g0TYpv/+P
	 n1JZ7GGtVst24GUZx1+3+rAkm8omEGP/S9RXAxbJuTgDCm+cFDpaa5MytjixDWmgUtXcb
	 6D6VdoGMqZgXpzhqSY07uoBLpe6uFFnBpIWcsrzltQZaOxNltXIZiAvHd2wmfkkZl7g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790919789;
	bh=FtJylmDQax3WR80/O43nmGHroB5WPqO4zPeSvCBMR78=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i0BvYJD6bB8nh+dLgKHuA6Jcs3jILiiHgjWmsqHypt80YaHY761gusFB/McvycGAs
	 Oj9zO1qndNV4sP+bTsowGEqoLM9xyEE2po9ZWFd5T8BkNGzzRAVLrZL1l0BhNZewcC
	 lc2BgKogP/e+T033O/ofPjp9fYTJndDeJh+jR3rOtezZEa/g5tVA/PyDS+cSPm7GMF
	 XWHV5WgxYUb3N0HYkN4goX9t2k8pnAqVfH1tSML4Fg/+ByH3jueFLX682XPHorPKQG
	 k+suYpbpN3mZZa2GQAz3UxAeOkRvhc+2lOjagbcfIbMFcTpDX4he9MGwEB+Vx6yFo/
	 3g+bd7mbd2hhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD80F40B46;
	Fri,  2 Oct 2026 05:43:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A37B22B
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 05:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C31481122
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 05:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHwDZssEIWyb for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 05:43:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2213180EE3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::17"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790919787;
 b=ZBakRt+JXFFbgUp2OX/9/qPIRXYEM7XQQ0stR2eNiX7F0aQJzPCzikxmHjm568UTYTi8
 GN7QLIVrsQ+128PNN5OzgZcEUbi+Rpp8aJDuWy/6SidQobJe6f3+JbSvVyA9PQsDgjRMB
 mlRZE8gEe0m7Oe8IoBaKIQViSuUTFmWoP7YCNVJVIyAO30QHbyjUuys1mdX99lasb9jcv
 W68sBAYQnKvzkDqYUnAGMzxTWAXG/dc7ZLfPHdr26PW2H8V5B2iRoxjzSGIKeURphgS9J
 05cYAmbJILoSsI9q5qht/V/LjVTSqR7BW2f+FRmNwabz56Wr59V8hjqR1+S6El1tj8w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790919787;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=19aIwyV6USRRFvMFouusFjhe5beUQ0bptD7kU3PV58Q=;
 b=JwY8F349abqwq3uuGa7POD1HcIF0awyJM8M/ibjviZcM5MHBn+SgNt9QiAc5Vty3GpKj
 W1aZmO5RJ3pujEYvAtq1LJfhlrBQ+bQeEmGz+K/uc2vhgH/kc4k/ur5Hy5h2nYoRNqCwL
 BG75jCvemOy3WdZsJw9o6JxLyhISnKuCBeCMUTqsCzz1i86W3e4U7zvZfIl+k4aS/FMnr
 RqNBTljynD5O5AQNzFGd3wV/lI3XE+/iDhZv2cLc5OQOY0rwOhUltyPkmHchnbc07OIB9
 +9eSSZuAEyTeYsEAivOpV0kCB85Re2VfK2qUNVa2Ppsu/IQzXZZrDIcX+uTUeGrUmGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ffEZO0No; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::17"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::17; helo=mail-wr2-x17.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ffEZO0No
Received: from mail-wr2-x17.google.com (mail-wr2-x17.google.com
 [IPv6:2a00:1450:4864:30::17])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2213180EE3
 for <buildroot@busybox.net>; Fri,  2 Oct 2026 05:43:04 +0000 (UTC)
Received: by mail-wr2-x17.google.com with SMTP id
 ffacd0b85a97d-48b0622cc90so1043869f8f.1
 for <buildroot@busybox.net>; Thu, 01 Oct 2026 22:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790919783; x=1791524583; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=19aIwyV6USRRFvMFouusFjhe5beUQ0bptD7kU3PV58Q=;
 b=ffEZO0NodooC5vR6SJq/Dz2zfrLpbuu9kC6Dke1KrWVF7cvBRh9/5CSDO4GjrHdY+G
 /18HE/Ng7YjE+eZP5mlWqtw9ZwJB3gLS5ljF30zh7xwck8E17GtpQPowXHuifc37cM6G
 gs2uEl/m7YRXfXHVZ6u+dPWPVzxXiqIwX7Fr4E3WZEZseACt6u2zzy0eXOoroz6ICdJp
 4AHE3XjI0IzDNqB58zA3KJl/KQGL870lyP7YBq/4zgk6g5+8ZmzKT1grta5EO9YCP0aD
 wg5HJhIeft3lopvkvSllBQHa4Mkit3XCAvenkQNPx7Qz62e0ZD+3drU/KT+J/ukHwT0B
 ECGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790919783; x=1791524583;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=19aIwyV6USRRFvMFouusFjhe5beUQ0bptD7kU3PV58Q=;
 b=Vg8CjIsPSky1xaI7p3O+MegcGJUNj4LJvsOcUQuIUO5BwRfOqQ4n6UKD5nKcL5zD3X
 WUcdX2RtpTKViz219M9fAclurKabIqY2JpoFfMgtoDZh1k+cJMJqQbn6IDMlhwF1jdq9
 9SgiNp/1CxN5QzK2x2reHHdbERc8e2HmK9lMi8nQk5Y7eZdxcjus7kCkWMi/K+zX/Puw
 vm7O0ohVuov7JhjKcl07L5ZECGPeaHWUHbCCEUyCPgZsUXjFGowNScJvA9IQsKmPh8Vf
 U2VYtnr3xwwxTFBb23CBdnTxKR/NlutX90xSvC3gHcZgGuunGAJEH9dy9L4O+/20xTIB
 e5yA==
X-Gm-Message-State: AFq9FYKDmLyLnDB6lHIPg8SOVh/NtopSIZEXqpMvqDPNrxXRPcbsnkJe
 wxtfMG59rjefAo+yVbnLRtWkv7eGA5REnBy0gyrInzWyQeeJpAfu1phWTJMRzw==
X-Gm-Gg: AYBFou2X65d4TbADUpo7CY+4+XxyW7TgYPpf4Q7fxeG0AoJDVVZVu0orSUYT3bO8cMO
 OXMGO82ermj6NdWCuTiWBX9O5w0+RF8bmQYflgLHdmQl3DigOP3n/2HKVDiYlc+QRFEWX8yh9Xg
 Ijtnq6xJL9RVTZtBz/1fC0WpgIZjao8XBduvVYeCWpN9p0Ey1gT7SYUs5kinPaWZlohr/Vo+Uvn
 13qu8R6xuvmnwHsN3Nj50wR9R+m/NvAB5ZsPfXPogXm3VEe9wNu6FRK/GNZ/yK4PSHJETz2TSbI
 QWm3oF0VXBXZj9xb5I1+1CPmzT9Vvbx8sFBGDzDtbm4DT8G5Cf6fcAV1mn2nL3DTIfSGu3hcRoK
 HoBU+Aiq4lY97RVuVqTBocpsu+/b1h3JCFsVrr25ShtypbYXKJ6uq12sbgKnVRmtTff8MZF46YV
 KuF0HHYLRFeJXS436xLiFZ4Tj1KluQlMgHZSZpCqsrgbienntQ+S68cKlj3SDzFQ7xgcP25PKDC
 3L51/usWuWxq9dHyksX24PqCayyS9us30eB93MJ
X-Received: by 2002:a5d:6f04:0:b0:48b:11ba:1281 with SMTP id
 ffacd0b85a97d-48b127517b4mr2609420f8f.53.1790919782613; 
 Thu, 01 Oct 2026 22:43:02 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48b382f9bc0sm3067690f8f.41.2026.10.01.22.43.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2026 22:43:02 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  2 Oct 2026 07:43:00 +0200
Message-ID: <20261002054300.51538-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/kbd: bump to version 2.10.0
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

remove upstream patch

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 .../kbd/0001-libkbdfile-fix-zlib-build.patch  | 35 -------------------
 package/kbd/kbd.hash                          |  2 +-
 package/kbd/kbd.mk                            |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)
 delete mode 100644 package/kbd/0001-libkbdfile-fix-zlib-build.patch

diff --git a/package/kbd/0001-libkbdfile-fix-zlib-build.patch b/package/kbd/0001-libkbdfile-fix-zlib-build.patch
deleted file mode 100644
index 1324d0b53..000000000
--- a/package/kbd/0001-libkbdfile-fix-zlib-build.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 488872421ef38215d2797f78497eb559d8eec32a Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@users.noreply.github.com>
-Date: Fri, 5 Dec 2025 16:45:36 +0100
-Subject: [PATCH] libkbdfile: fix zlib build
-
-Upstream: https://github.com/legionus/kbd/commit/2f9a4e56c2ef245fbe840677aad9d5932e17f50d
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- src/libkbdfile/elf-note.h | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/src/libkbdfile/elf-note.h b/src/libkbdfile/elf-note.h
-index a0fd9e2..d3b8d5c 100644
---- a/src/libkbdfile/elf-note.h
-+++ b/src/libkbdfile/elf-note.h
-@@ -26,14 +26,11 @@ int dlsym_many(void **dlp, const char *filename, ...);
-  */
- #define DLSYM_ARG(symbol__) &sym_##symbol__, STRINGIFY(symbol__),
- 
--/* For symbols being dynamically loaded */
--#define DECLARE_DLSYM(symbol) static typeof(symbol) *sym_##symbol
--
- /*
-  * Helper defines, to be done locally before including this header to switch between
-  * implementations
-  */
--#define DECLARE_SYM(sym__) DECLARE_DLSYM(sym__);
-+#define DECLARE_SYM(sym__) static typeof(sym__) *sym_##sym__;
- 
- /*
-  * Originally from systemd codebase.
--- 
-2.47.3
-
diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
index d46a60a80..83b45b0e8 100644
--- a/package/kbd/kbd.hash
+++ b/package/kbd/kbd.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
-sha256  fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed  kbd-2.9.0.tar.xz
+sha256  6e5ca4f8d76ee9e3a8db700b667f13e12aac9933828a64e1aaad93d26be9b479  kbd-2.10.0.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 34401075c..d31b11e2e 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KBD_VERSION = 2.9.0
+KBD_VERSION = 2.10.0
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
 KBD_CONF_OPTS = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
