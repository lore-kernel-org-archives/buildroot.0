Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 569ABCCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 09:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20B79606CF;
	Mon, 19 Oct 2026 09:38:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIgAn-nbd0HJ; Mon, 19 Oct 2026 09:38:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2926160600
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792402737;
	b=N1eIU7MN7HyJ3LhjBb2a7nIbNP5lIvUFr4P3hiGZoAWA9YrkRoHmhv1L8eS2KyhsO/Yu
	 cNB69vuzWy66mgoQL4iUQX8brxtKA2eTCF9vtGwiI8kG4w9nsSWlEMXKp0am8e+FlKSP5
	 7o/je3QdWU0/4f6PpxbS2ennGDD6L3tpnYURv2N/jOjo1F/jvPqOVqYQFS+DXfvxJ1uGG
	 Yv7qlLzO7lJP37mIdUCxgT7EkObVmeZIVpcmxbLz+WbcYTQOer69Kn5s+L1ynXAfWsRTY
	 stjq7AudLkE8EolHzzHo6tXdiif30KiMpZ9aZ4/I7Hsv19rjH+gIdE754JYDFWC73nQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792402737;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=M96vW1OJswvrsVQHW947n8iiAkKj6lwKtM+C+7qD9AA=;
	b=K426XcSf7mTdlAx71dCzSQt7SX4mt9MTy4j30/Q66AHYJvzDR/98Fu+Q0mSsh85a01kd
	 +Ti0JOwndd1hDJZNYUH/tSSiB9U1wDN89+O37pwl29t/vDQ52MjKLkLt6EryCHnoBG7Qu
	 Kek1JBO2+/0MF0ZAGMQyKfV3BeLRZAJJP9e69HtNnQ/tkm+SSr5IpCwSr7f3bsL5muC7s
	 j92A3TENDHA/lZxptNHKrpRXLQAipvgigy+NnmekN5X7VvSUqb9dl01Zwf2spzBiu3/Dm
	 WgemLWRDx+9wVBsMqP0+EDRC2uRyy20s36tuWxy4Nm2DLNaI0mOQs5ZXDc5jv29Nx+g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="fB/0rrsm";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792402737;
	bh=M96vW1OJswvrsVQHW947n8iiAkKj6lwKtM+C+7qD9AA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MPbwe4KQ//nOtAzi0bja6v99jiaUMwlw4bfVj12TcLc5kvO/0IceygFD8TNme9KCA
	 OZ4w5NKLLRiZINM0eXZgu/8xBF1LwhjI3Erz+Knx9y5NaHCaMZTP3lBFkxRF51xoh+
	 ONh1jNQ3oonWVa3esb8iq0rYLEfMugfTMlfdfdeA3LxRdxXcyE/k7PS342+KILaMQH
	 4P96kpNWzXcQ77NgcW+9SD45gOgPv1r6jyhVe0Ksj/qO/JacHWcgatWfWsqjXCGlzW
	 ENQrv5yadsclI3sWgNajjvNnu7jfF7roPbvUtWEJ7cZf+CV4YeRlH3cOAXUCCMdZg1
	 F4DxWC5Xcy4Dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2926160600;
	Mon, 19 Oct 2026 09:38:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D01323F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4299B6075B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HWrSC7UCDIYF for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 09:38:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BC30E60763
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792402733;
 b=SyZo0HKqJxVXpbpWriP8vOzFi5w089Tt+25Yw81t4O3+kOxLqxDyCZhPEZztM7Bs67t4
 Th8w8VSrRyd3x/v+RqVexGAc0ujged8On5oLtPgqJrdBSIeUyt9+1n7sl6KCMQk811UA2
 W0tR4nthSRN8Gksi/9BmxM7CQLOe5iYalxID2NcETwESxLYwGrCsBu2pmaF+pQejrMN4V
 6ulSd9wI07sCUWzSZBLaKCcpqRHQXFWDDwNSIy3IeejvFjPwMthFeK1XzxXHhWp5EiLDB
 3nvJOMuSb+pDXI+sMxovU22zmX0h5ziJsmkYW2zX52MI+MCCTKPoHZG1WVvofHSxNbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792402733;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=XIdyITIxb8dZKzpArBQ/WClHo7/2VOdiggj0QHvYLcE=;
 b=UW5TtLTBRySlpZL2nqIcaiVYfUYgoRQB1AsKbXJ4dz2rnrp7Iju+2gALUer/6uzLzb6G
 +hDbuwYkB228v+Iqr5ilI0FM47mb82h1A2UqAPxzQCfYcSX7GpBi2JPDYJCjpgWvuCi2w
 9aXdGjmVWrQQ90mCLaxSj49yty6t3OEILwIBpmA9Y4bHL6EtNa/9d+FywQfOY3yPXO4Zj
 6vv/bN61AFVeP+KQh63CfJfxRS6atmMsDlH281Ddz6ThJfiu8g2LSte9jJRB7lQbuk8kw
 rcIZ98DrfDucO+O8kS0kajUvGyMH2o+8uEIYEFAi1sgJXRPAj9tKYIhnNHeq6hiVHjw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="fB/0rrsm"; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1334; helo=mail-dy1-x1334.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=fB/0rrsm
Received: from mail-dy1-x1334.google.com (mail-dy1-x1334.google.com
 [IPv6:2607:f8b0:4864:20::1334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC30E60763
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 09:38:53 +0000 (UTC)
Received: by mail-dy1-x1334.google.com with SMTP id
 5a478bee46e88-35829219da8so3401913eec.0
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 02:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792402732; x=1793007532; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XIdyITIxb8dZKzpArBQ/WClHo7/2VOdiggj0QHvYLcE=;
 b=fB/0rrsmf9+qqCmWwpNpfcpjYHNircvBGB73pulwHyDUEDJ40KmgnbFXIvbCokGqrY
 n/mM8FJF8UGb/oHjugIRgvbsI4FJqaHLaaFHkXigEbzcAH6QVM1KVHwuN1j/VdNXCWrU
 V8Dtv4Lrhe8if8Bv6rl3TUa7py3aj1DaRns8lJJu2HS1r2HblchVa5Fl9r+cv9nPcch1
 9x4OlwXvUeZKM0/VVei9E2L+Ju6pFIgbivPignfzXh+0UV/GJBFrqbfABuEEcFYObne7
 Ur2htXvD+J018Yaya0zZbuw5q4XHYZFpwPKzqZRniBFLrPYcaAx8NlKOUYPOyICcaA/B
 BMjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792402732; x=1793007532;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XIdyITIxb8dZKzpArBQ/WClHo7/2VOdiggj0QHvYLcE=;
 b=zfU2PHnhdufdCBPjGTEBwwU2eVZDp4r+ZofE90xSznQNadm6EmDLIu6afnTQLS9iaV
 bv7vY+MRAyQgdGHKC3WFZy9WDTyxG7YA++/FByQUE7hMnQd/0l/XmrZTYThVxt50dEUK
 KSEJ+qOsTA0pG+A5yuWoMyvipM2gEYE24O6GFVMwkRcKr7G5SVbLYJtsgNJjxGd9Ngb8
 5CxNSAkXgRuxzDbMsUfwWnYNe4Hc5astM3WQlLH3y81jRywleVEjKqCL3BTqJ8Kzwnd0
 PqBNVDW+dvIgERs9A6DYETKtBlCk3Mazzl46S2nqlwRsv2uaL0P0jpimnKiBLdDZf2MF
 yb+w==
X-Gm-Message-State: AFq9FYLl4u5POZT2mo/7VHdCo2kcbIV3awFz5lGwP8G6Oc1CYQPsCBpE
 219/Hx1XH5JlQeWiiI4V2o/lzJkgu1qgIcZjUDKFe0gXjhESg+Ly4ERQc3bFAy9pMm0=
X-Gm-Gg: AYBFou2rj7Rr3srh6igSbgl4tBfyy9mfUHA4FUJK+jjiKWO5r9liXjC7Sc5jq4+nIyq
 BcXIyWB6V1MzljBKclGE8QRKoDNEu3sP5JGehrWnjjfS+IhUm2oGZGQ/+QUuUxnVm0/JFEJg3ze
 PvMU2G3SeWXH3owd3yP7kixNtJPlWLtQA81VvhUk8RxO8uQYtYbEDj5suzsyx8JNWTmwU11ksrI
 uFldQw0pxGmAsl28RivfLrOJ4HFmo5XOr8OTlvxubCtcGy8eBOlccHaqezKA6CUk4ciI8m04kaE
 Z47yvK17Lq3P/TIoAFZSrKED20tYWntCX8esTL+IS6VEY4sB37CtRiRWiCCJ00J6lgGuKGo+Joh
 YD05lxKRKZxQu5UqDryn8s3mhEwk2ZSoTCWUkPe9VhVyi7SP4v980Ty5WtsIGpMCR+7kdmEvv8t
 JA4qTWjPlq/YVJlRvHtFoYeNo/L0O5IhR0Osi0Qdd+EHMdSebO6ZqO3Fe/ih6o1dOXlzVCK1o+y
 nuFmNghM3voptlRYLc/CIDOFWDOfegI
X-Received: by 2002:a05:7300:d0aa:b0:35e:2c6:d462 with SMTP id
 5a478bee46e88-3602783b711mr13428824eec.0.1792402732073; 
 Mon, 19 Oct 2026 02:38:52 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2405:201:9008:10c1:dea5:be99:85df:68ae])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-36082a7b33bsm56489599eec.24.2026.10.19.02.38.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 02:38:51 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Mon, 19 Oct 2026 15:08:38 +0530
Message-ID: <20261019093840.104537-3-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019093840.104537-1-chakrabortyshubham66@gmail.com>
References: <20260810113154.1955756-1-chakrabortyshubham66@gmail.com>
 <20261019093840.104537-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/2] package/tcl: bump to version 9.0.3
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
 - Add host-tcl to TCL_DEPENDENCIES.
 - Add host-zlib to HOST_TCL_DEPENDENCIES as <zlib.h> is now required
   for host-tcl in minimal build environments.
 - Pass TCLSH in TCL_MAKE_OPTS pointing to
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
Changes v2 -> v3:
  - Add host-zlib dependency to HOST_TCL_DEPENDENCIES to fix host-tcl
    build failures in minimal environments lacking system zlib headers
    (reported by Thomas Petazzoni).
  - Remove HOST_TCL_SYMLINK_TCLSH post-install hook as no packages in
    Buildroot rely on an unversioned host tclsh symlink (suggested by
    Thomas Petazzoni).
  - Drop redundant TCLSH_PROG from TCL_MAKE_OPTS, keeping only TCLSH=
    (suggested by Thomas Petazzoni).
  - Preceded by a patch bumping tcllib to 2.0 to resolve Tcl 9.0 build
    breakage (reported by Thomas Petazzoni).

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
 package/tcl/tcl.hash | 2 +-
 package/tcl/tcl.mk   | 9 +++++++--
 2 files changed, 8 insertions(+), 3 deletions(-)

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
index 0cd242a2e9..bb85f57c13 100644
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
@@ -73,10 +73,15 @@ define TCL_REMOVE_EXTRA
 endef
 TCL_POST_INSTALL_TARGET_HOOKS += TCL_REMOVE_EXTRA
 
+TCL_MAKE_OPTS = TCLSH="$(HOST_DIR)/bin/tclsh$(TCL_VERSION_MAJOR)"
+
 TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite) \
 	$(if $(BR2_PACKAGE_MARIADB),mariadb) \
 	$(if $(BR2_PACKAGE_POSTGRESQL),postgresql) \
+	host-tcl \
 	zlib
 
+HOST_TCL_DEPENDENCIES = host-zlib
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
