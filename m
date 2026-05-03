Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD951FF886F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 08:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 903C461217;
	Sun,  3 May 2026 08:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HBcUKI_2GN9V; Sun,  3 May 2026 08:12:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1549611C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777795942;
	bh=l0QJh+y0s7xeNC8+I87x8BnWDKzVst7ICsVHmUE0pOU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VnXRPP3OoUKGnZpbE6pAA2eI9VZcU+A/4qsgWNk9OZlYpL03oprVBuHARKB+lqoc9
	 inW3N3W4kcpFIup3BM0bwMMBKYEzbuyegZYGljs0yPajQAy314CeEqhPQf+/Yy+DJ+
	 gNhLtjKn5GF7KfpzU8/TXw3WYZiZxj5mHSeacKqZc5BLfROthnMWfwB5DB3g7Ysm+h
	 JVP0SaUjLDM06M3IIfuByzxB2WktG/EOux8pYXa2wyp8JEejGiMqRQY5YNHBXeUhB+
	 AICHUQhvyZFJAXo0dBRibRcrL7dB+8+MT0CZ5wm6Co41XkZ/pMPDCf0jjUT7uCjJEX
	 5n1g+8i5x1AIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1549611C1;
	Sun,  3 May 2026 08:12:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B02C190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 08:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F19EE41548
 for <buildroot@buildroot.org>; Sun,  3 May 2026 08:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZ5TVVoB-6oH for <buildroot@buildroot.org>;
 Sun,  3 May 2026 08:12:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2683B41547
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2683B41547
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2683B41547
 for <buildroot@buildroot.org>; Sun,  3 May 2026 08:12:20 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-82f68b3aaf7so1264428b3a.0
 for <buildroot@buildroot.org>; Sun, 03 May 2026 01:12:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777795939; x=1778400739;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUp55vT0bb2Y2fq2of8ibkxFMygZ8VdoBNO1oLZdm/I=;
 b=RhPP3IoNHXOyaC0IDmmB0ObgNS0O8/miQCg2psGD3I1TjWPs7R3oeimEBs0Kjk4xNC
 KzEuc5KwRyAKVyO60+6keXsOlfqVL4yvnXHLOJZ3VLf29qcBbzVryq5uGT4GKf3zDTY8
 UIRk6QWeZ8AjuDyg/Z4L8RKsxY2Fwj+t1S/3ib8zY4q2NmNDLf4DqKCbWQaWahRglVHz
 Zevihweo8yTqfMtlh5RZpJ55oBa0I5OMA8h7A1ITFBVO5iNdOgOJPtQ/qeN0mcL7Sicf
 W1w3I7Y9rXJhP2pntgjV0T1OpbCipKFdJ/IFACcTY+MZPjaNr+idE5e0FiJiVnoI8FQ7
 /oTg==
X-Gm-Message-State: AOJu0YyQLQwlnJvwtNAwU76evDR3SKj2eFEJ54PDYVt+PuFV6Ipv3NA3
 Htd0G2pTgYcE2Jv2quz5AZ32jauw84T5aThavwg6bEIJG/fuUcz+hHLibIyUkxDa
X-Gm-Gg: AeBDievpnrslqicIL+thwuNFhb27HU1y5r3/XfEWXIqbx3YQCkWS9u/K4WRRjpVW5Ce
 OBsJlamesfMoQr3LbHnpus0qefo4Ss4l/UQeD9l4PVD24IJByNVBqvpANLV+UPblmLMn3pDvzvl
 g0pKw05iW0FyzIzsw2sVwyWIy77f+YoSktdrp6uCYWU05fqlaiAWcENetu77wYY8tmOl06MdUuj
 60ASDHNA6ltAJ66UJc9MMlf4ZcdjAHD4PzfYas4BBsj9lxqahTWwLKzh6HJK/a0StleDXDTnjcX
 Ijb7WAtRTEAX0Kq8W3XNoLBqGRZgJR+CxydzV86rR7Foknl+f8rTLRn4Wh+cHGa/LkxHjv8TJqP
 xz3S+zo5xAEt9TWjOxUUheva0y4HCtPyefnG9fx14deW50vYeEuGiMTBZcGVyIce30cf2uYbQ2Q
 9wnDRfjAyVT0bo2iX7j5nsWpcFHQ2WeScTiLd0bVaywwd/
X-Received: by 2002:aa7:9a87:0:b0:82f:abc8:ae0 with SMTP id
 d2e1a72fcca58-8352d1f76fdmr5230846b3a.17.1777795938841; 
 Sun, 03 May 2026 01:12:18 -0700 (PDT)
Received: from fedora ([47.31.117.202]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-83707fab756sm266222b3a.44.2026.05.03.01.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 May 2026 01:12:18 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun,  3 May 2026 13:42:03 +0530
Message-ID: <20260503081204.963653-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777795939; x=1778400739; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jUp55vT0bb2Y2fq2of8ibkxFMygZ8VdoBNO1oLZdm/I=;
 b=Rov5G8Kf3lhvOVY6LuS9zqt9R6OyjEJpQb7m6Fh1awUD0kFZBmQVe5sLUR7iELU5AN
 jT5qaMTCvb4y+RBN6juOYiC5r6OZb/2KHcLFE3wfd5+o/dGNJ8kx1OYh/tjD5rY6KqOc
 akedPtAJJ3mNLsXs8ofhbmTZivnb1gIWYeLpcOUsFN6Kl+WnTovnDHt5S8bHM6ilY0ie
 tJW4e7WX3UJKgvGz8jbvG7BBVoaT6Dwx1xgwuvgPRLR2ew+OEkPI3gGjpWPYZR/KRtrn
 yJ6T4S4eUak9U1jCQMN2/AqOXhieX3Gx1ObJ4IlwedmLoTtVpJpntIHZ6UacqvdjAHV/
 6rqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Rov5G8Kf
Subject: [Buildroot] [PATCH] package/tcl: bump to version 9.0.3
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

Major version upgrade from 8.6 to 9.0 series.

Key changes in Tcl 9.0:
- Full Unicode support (UTF-16/UTF-32/UCS-2 encodings)
- 64-bit integer support
- Enhanced encoding with -profile/-failindex options
- Script library packaged with binary
- Improved virtual filesystem support

Also remove bundled itcl and thread packages to reduce bloat.

https://www.tcl-lang.org/software/tcltk/9.0.html

Tested Using:
- tils/test-pkg -n 13 -p tcl

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 package/tcl/tcl.hash |  2 +-
 package/tcl/tcl.mk   | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/tcl/tcl.hash b/package/tcl/tcl.hash
index d67a7c4e74..b5f401e83d 100644
--- a/package/tcl/tcl.hash
+++ b/package/tcl/tcl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  861e159753f2e2fbd6ec1484103715b0be56be3357522b858d3cbb5f893ffef1  tcl8.6.15-src.tar.gz
+sha256  2537ba0c86112c8c953f7c09d33f134dd45c0fb3a71f2d7f7691fd301d2c33a6  tcl9.0.3-src.tar.gz
 sha256  c0a69a2bfd757361ec7e6143973b103c90409316b49e9c88db26ad6388e79f16  license.terms
diff --git a/package/tcl/tcl.mk b/package/tcl/tcl.mk
index 0cd242a2e9..4a34f71693 100644
--- a/package/tcl/tcl.mk
+++ b/package/tcl/tcl.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-TCL_VERSION_MAJOR = 8.6
-TCL_VERSION = $(TCL_VERSION_MAJOR).15
+TCL_VERSION_MAJOR = 9.0
+TCL_VERSION = $(TCL_VERSION_MAJOR).3
 TCL_SOURCE = tcl$(TCL_VERSION)-src.tar.gz
 TCL_SITE = http://downloads.sourceforge.net/project/tcl/Tcl/$(TCL_VERSION)
 TCL_LICENSE = TCL
@@ -28,17 +28,19 @@ HOST_TCL_CONF_OPTS = \
 # I haven't found a good way to force pkgs to not build
 # or configure without just removing the entire pkg directory.
 define HOST_TCL_REMOVE_PACKAGES
-	rm -fr $(@D)/pkgs/sqlite3* $(@D)/pkgs/tdbc*
+	rm -fr $(@D)/pkgs/itcl* $(@D)/pkgs/sqlite3* $(@D)/pkgs/tdbc* $(@D)/pkgs/thread*
 endef
 HOST_TCL_PRE_CONFIGURE_HOOKS += HOST_TCL_REMOVE_PACKAGES
 
 # We remove the bundled sqlite as we prefer to not use bundled stuff at all.
 define TCL_REMOVE_PACKAGES
-	rm -fr $(@D)/pkgs/sqlite3* \
+	rm -fr $(@D)/pkgs/itcl* \
+		$(@D)/pkgs/sqlite3* \
 		$(if $(BR2_PACKAGE_MARIADB),,$(@D)/pkgs/tdbcmysql*) \
 		$(@D)/pkgs/tdbcodbc* \
 		$(if $(BR2_PACKAGE_POSTGRESQL),,$(@D)/pkgs/tdbcpostgres*) \
-		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3*)
+		$(if $(BR2_PACKAGE_SQLITE),,$(@D)/pkgs/tdbcsqlite3*) \
+		$(@D)/pkgs/thread*
 endef
 TCL_PRE_CONFIGURE_HOOKS += TCL_REMOVE_PACKAGES
 
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
