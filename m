Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD60C5AC82
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 11:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75D8E606EB;
	Mon, 10 Aug 2026 11:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Qs6AvJMyyJ9; Mon, 10 Aug 2026 11:32:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E5866065D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786361524;
	bh=A+SBbI26bOwlV97Y3C2iOmciH3moCd9fc9tS7OexKno=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ER76Eb6ilUJ7AlOsZX2butT2b7tlXBQMvZfhXlgexbef22UqfkQJ+OvDVEC9+668O
	 PFrSyHh+4uCU13Ug/ChasCy6ypsickHxJauCkTaey+OF1Xyhyuq91UynO3sRcTCErM
	 D0+qEonhsAzaYB+7xXeHAnDa+g+HhxHFEGJrFT+GX5Kx0hjYhk9KNPnADPjWenDtph
	 vtWQoU+9YKGInCspjwcflnL5jLpzor9FzXxSu5h737sw7nCTsnpuvqV9rJy9TZNa5n
	 WSlTnfLpu48R/0GuxjWQxCAjubQHCyHRbjYXCzytQ/Th0sEYmd7dTJ2Fh0lSVBD3Bf
	 HSgeBaOvctpDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E5866065D;
	Mon, 10 Aug 2026 11:32:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9975228A
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 11:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FC8E40127
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 11:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KRpdzFMw9adn for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 11:32:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8A2CA40106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A2CA40106
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A2CA40106
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 11:32:01 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-84e27035206so164854b3a.3
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 04:32:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786361521; x=1786966321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0zu8B1wip6UUS17GjcaF2G1PHWtuTijBNsvGj3WXG4M=;
 b=sYtDnGMagAkJl2lGFua5VBHN2YIx1wFKwS9vQQKEFFPecAwAU8BzDIiY2QPw2X9lLb
 a2LdysqUKS4l2aWz7za03zejx91W1OzDROn4UYwlv7wWSh5fRdRn5IAjoPYdqz+7w6vM
 gdmgXuFM3SUg/cmAxFoghDMwQMDxTsqM11z6ZV92zBOTQ8oOf42gbL7WDtvDKNE0kWS5
 Kq5ADaxdqlwujgQjhe9Fw054xKP2+BP/dDdnTQw2Mfubd19x8J/w9lk0nWm9qp/5NS5b
 tZjjbAjI2weszEbiIsZPX/JHRfBik9fUYzsMDcYQphoFcyV3T0pMnup+iTQTibtEHFC9
 GoLg==
X-Gm-Message-State: AOJu0YytYTDhDpu0Z2mEPEZaJYHwEQ2zAzFLyZsmH/RLejluWtzruZhx
 jVl9Z4u+8yL/J6B9uwMW/MKXxgJEHyTt6W74Q8Dh6ON+AkyD/OcdRlDoBOdWJLCe
X-Gm-Gg: AR+sD10mo2IPIEVmC0ex3FzMdcTEc8vLjwoZXixs7HU/AnPylryOfuxTzxNkLcuV0tE
 foO436bwIauKylt+w7CWP6dLWcXkgJAnuCaY0ErC9K5+OjgLa6DhEBkKFty6KjX+VSE81/T3T+/
 sbeTx85dD2Kjf8+zgQKRAResJ0X6BJELpTLXJZWfq8HTAC+N8Q47UFDfXm9Y9JfTJmV3kCTNqr5
 V3EwoQb7iOuC+BCvkfguqdgn2HULbYGqTM7H6V7q3drtUrkXSYxUIS/pBarwszmCrY5lmAGOMdU
 NVXDCwAXtKi71PEUAQO4FwjU0KPsYwIkmlW8cShNm6zcL08M4HAfiWRVlXxv9b4egu7cGXAVZtw
 O7jCzbwV9pv8zSbj96Yruh9ZAhlJjS2vwFfR3MRRqMwJrhnzbU9s1wbrGshS/QSxOGig7oSZkOG
 Tcxo41G0r+sYLiJDXH5HrlDGE3NpnrWX6yrLTRhLb1jWNtcoOeVItVeEc4IjOIydCC7Gxkhg==
X-Received: by 2002:a05:6a00:450e:b0:848:411f:3969 with SMTP id
 d2e1a72fcca58-84f9c96c01emr779528b3a.20.1786361520554; 
 Mon, 10 Aug 2026 04:32:00 -0700 (PDT)
Received: from fedora ([2409:40e5:1164:f0da:ce1b:8575:cc78:84c8])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbe8f38882fsm3863211a12.31.2026.08.10.04.31.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 04:31:59 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 10 Aug 2026 17:01:52 +0530
Message-ID: <20260810113154.1955756-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260503081204.963653-1-chakrabortyshubham66@gmail.com>
References: <20260503081204.963653-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786361521; x=1786966321; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0zu8B1wip6UUS17GjcaF2G1PHWtuTijBNsvGj3WXG4M=;
 b=GuiYmjgp2h+fLkcQ+Fi4R9gN0Y7sks4/IpR26tBxzm8FrsLUS/xMbWLAQFm7WHBD40
 16zp2YZFSOdi7pZJGe1qWuhW+g1fYCBd4VkcKkDDib0fY+AlpmkB+zmfSp/jvU6SFT1e
 xm5qegca+LfQ0VOI2sBOKpPaOtmYRDY0XyCpKfYGkRn/x26zGFuJmvmP007E37Ian6Oi
 O7MZ+TDAw0KMUchLpDOZ8lnvX+36mcWxcjipuDxM6QyYkGg4LHn3iIwVR8sQ1+e++gdO
 +ToMRGBpLhvPz4m68HjL1VW9jsNnupO9sNUtQkwK+KCXG6SpCg33CuVERz/PWghCmgvQ
 /SIA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GuiYmjgp
Subject: [Buildroot] [PATCH v2] package/tcl: bump to version 9.0.3
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

Bump the version of tcl to 9.0.3. This is a major version upgrade
from 8.6 to 9.0 series.

Notable changes in Tcl 9.0 include:
 - 64-bit Capacity: Data values larger than 2Gb
 - Unicode and Encodings: full codepoint range, added encodings,
   encoding profiles to govern I/O, and more.
 - Zip Filesystems: mount zipfiles as filesystems
 - Attached Archives: enable starkit-style deployment of apps,
   with support data in filesystem archives attached to executable
   or libraries. Build tclsh and wish this way.
 - New Notifiers: The central event handling engine in Tcl is now
   constructed on top of the system calls epoll or kqueue when they
   are available. The select based implementation also remains for
   platforms where they are not.

Build / Cross-compilation fixes for Tcl 9.0 ZipFS:
 - In Tcl 9.0, Zip virtual filesystems (ZipFS) are built into the core
   package and bundled packages (itcl, thread). Generating these zip
   archives during cross-compilation requires running a native tclsh.
 - Add host-tcl to TCL_DEPENDENCIES and add a HOST_TCL_SYMLINK_TCLSH
   hook so $(HOST_DIR)/bin/tclsh is available.
 - Pass TCLSH and TCLSH_PROG explicitly in TCL_MAKE_OPTS pointing to
   $(HOST_DIR)/bin/tclsh$(TCL_VERSION_MAJOR) to ensure sub-Makefiles
   use the native host interpreter without inheriting target
   LD_LIBRARY_PATH settings.

Note on bundled packages:
Unlike v1, we do not remove the bundled itcl (Incr Tcl) and thread
packages. These packages were already present in 8.6 and built by
default. Removing them in Tcl 9.0 would break compatibility for existing
runtime scripts relying on them (Buildroot has no standalone packages for
them).

More Details & Changelogs:
 - https://www.tcl-lang.org/software/tcltk/9.0.html

Tested using:
 utils/test-pkg -a -c /tmp/tcl.config -p tcl
 (Result: 32 builds, 4 skipped, 0 build failed)

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
Changes v1 -> v2:
  - Reverted removal of bundled 'itcl' and 'thread' packages to prevent
    breaking runtime scripts relying on them.
  - Rewrote commit message highlights to accurately match official Tcl 9.0
    release notes at https://www.tcl-lang.org/software/tcltk/9.0.html.
  - Added explicit note on bundled packages rationale in commit body.
  - Added host-tcl dependency and host tclsh symlink to fix ZipFS build
    failures during cross-compilation.
  - Overrode TCLSH and TCLSH_PROG in TCL_MAKE_OPTS to prevent
    LD_LIBRARY_PATH pollution during cross-compilation.
  - Ran full 32-toolchain test matrix via test-pkg -a (28 builds OK, 4 skipped, 0 failed).
---
 package/tcl/tcl.hash |  2 +-
 package/tcl/tcl.mk   | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

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
index 0cd242a2e9..9f50985263 100644
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
@@ -73,9 +73,19 @@ define TCL_REMOVE_EXTRA
 endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 
+define HOST_TCL_SYMLINK_TCLSH
+	ln -sf tclsh$(TCL_VERSION_MAJOR) $(HOST_DIR)/bin/tclsh
+endef
+HOST_TCL_POST_INSTALL_HOOKS += HOST_TCL_SYMLINK_TCLSH
+
+TCL_MAKE_OPTS = \
+	TCLSH="$(HOST_DIR)/bin/tclsh$(TCL_VERSION_MAJOR)" \
+	TCLSH_PROG="$(HOST_DIR)/bin/tclsh$(TCL_VERSION_MAJOR)"
+
 TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite) \
 	$(if $(BR2_PACKAGE_MARIADB),mariadb) \
 	$(if $(BR2_PACKAGE_POSTGRESQL),postgresql) \
+	host-tcl \
 	zlib
 
 $(eval $(autotools-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
