Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804A7CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 17:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B8C6161A;
	Fri, 29 May 2026 17:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TljpAIU0oig5; Fri, 29 May 2026 17:52:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E27161607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780077123;
	bh=hGlNVWNqjdaOKLXqObOIazkLz/OJjPxyFyX0RyZh0PQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iN/2n3zZV4BMtH2Of0aLa/jKIKnZwSngK7Yw3YM5sCWdcxwkJ+iEVa6Bqr6WplP5M
	 fUEO8MnpHJjKt4CYg8m0vytyJv2Ejclnk/gxJCrUtWIF9m24hkfC8N58lBpO5tnGIo
	 0PgfJ3e3DAaJK1OKHQhlJE0c8ofvXmszlCiTIe/nxwf3MMFW/keSSM6dR7pS8JWr4R
	 eoMlLJkAxRjmAp+SWHg7fLqITxR8EeR7tIp3+h3fZcjDXeCkrESmxhjJN+i4DrRXcx
	 E79LXmsI4whPM6NYN9mCNi8a856dbbr7EpFMMKCjUdFYTI/AqRwbS/8IYdHhf4mfgj
	 CJSz71DAxG9Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E27161607;
	Fri, 29 May 2026 17:52:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22FE9372
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10D20421CB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:52:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEM3z9i5Vy1g for <buildroot@buildroot.org>;
 Fri, 29 May 2026 17:52:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E6DEB421CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6DEB421CA
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E6DEB421CA
 for <buildroot@buildroot.org>; Fri, 29 May 2026 17:51:59 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45eecb8bf67so1392212f8f.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 10:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780077117; x=1780681917;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lyzfMvlVFygwDYEV3GkL1ZeE6BISbnTwGOOv6PeFCoM=;
 b=isjW3VJ85bvdXqEkGHpM/DIzOncTO8gLah25hz9iXOEZpcb0kF7pbDZlY/j8eydBLB
 P+fClg1JzS7B46h124OHHpyORzQl/dOsMoPhJgDILYeT/7Fch28/vHel5nfq1+4u7UA0
 QsyRHV5BFh0sH2Hoh6pkzuYdjkraZlhorE1EQqcdvC8VSpeXZUu08ZPW6ckVhvfVBeIO
 CPdfLh5TqD7sNUOLIu5dSXact/qRTIifkDVlbro/b7MBSR8woc6iT87UcVL4ZhBJXrxz
 6kWjZG53uMz4dPpvSngNQM2jq6N0WhC3ZB80rhWH8dcodJ2vIMqrukWHI0P0C+r9i8qo
 5ClQ==
X-Gm-Message-State: AOJu0YyRkeplkpCjAjA1X71a097EjJ1TsnwEiplcJ59/zzw7CdQV9NHT
 7p1HzxIVPretBgZ4x5H+vvou7W1qJ+KpsQ7z/oOiK0oUwXR69A0dB5pmb2hrFpMfMvGiE8qRX3W
 jYUFW
X-Gm-Gg: Acq92OGw6fqJKVM9Ir+8eTTq81ShwGdtnWFNnomae2mXvkvcTriYjfIJ3lHxfbq7LvY
 FF3VIgizKCLGlbyVqHAuA2qySv5GWtXCHlsrwVpj2gnverkGoNsBI2Y90pW3KOz22XDmA8NGTeA
 NbyKxEIsQtz3Aip6zUcO5RqJvbiT1CECiyTAo1ZbkoS1rCKgowHtpm81ymsjisC69Z4ilA+4aN8
 GFhi8hIH/eDsvAXyIletE/W9hvTmTGG7s/dcA/qVDmqZO610EHGBXKSa91xISIAZtC5phiNw0eP
 JyfleVjazxxh+eTXjv9PSHKtgbA5n/yi5txE/WBlZa21YJaavhn10uX2U+7G7PS08FUj61luQev
 N818DMjCCXnedhIXL/Ys0kcrFfilmbh5WGyFr8nYfUXfZt1FdyR84Lxqkrqdk5Png2bq2hHOwm4
 WX5Si7OGK/1HwdnDoFTOVSxjfgUB8/GyBlfqqgMsIsWG8dSEEeHyKNjxPCyA==
X-Received: by 2002:adf:f481:0:b0:45e:f604:1c36 with SMTP id
 ffacd0b85a97d-45ef6b02ff5mr1200273f8f.11.1780077117277; 
 Fri, 29 May 2026 10:51:57 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef358c07bsm5218817f8f.36.2026.05.29.10.51.56
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 10:51:57 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 19:51:55 +0200
Message-ID: <20260529175156.572429-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780077117; x=1780681917; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=lyzfMvlVFygwDYEV3GkL1ZeE6BISbnTwGOOv6PeFCoM=;
 b=Ax96CqkORxAZBao3Ql4b7PBpemwIpnjdYz7RrysK5FyYM8L8vrzSdkAjo820RJk0WG
 IMM5gfPgWCnKF1iD8J/gCGWkaDU2+1BGhZz1iMQkIAAmYFvQVfN91IOnGkoIS+re1sVu
 r1ZBi2Tq4Tb82YbMbks35iPFfK0lJ8+XVMzdpPqeU7btzu32YGYjU+zveyIvUXbM7Ql+
 c8n6ChUqtITtcTyq3DGRfPEvTG82qgVjCcmndcNoalTDc+mjukXvcxJoiQC0Fh7+Qr54
 j+j6aVd9Xx5HfxufNfGN8U7oI9OAPrf5r0GujSqGKA4UG8tqxlWC17sAVKp39tim7uDk
 awgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ax96CqkO
Subject: [Buildroot] [PATCH v3 1/2] Makefile: add 'show-info-all'
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The maintainance and testing workflow sometimes requires to output a
list of every existing packages on Buildroot:

- Generating an SBOM of the whole Buildroot tree for
  security.buildroot.org
- List every sources for every packages for source.buildroot.org

The previous solution relied on `make allyesconfig` but always ran into
conflicts that needed manual resolution. Also some packages would not be
present because they are archicture dependant.

To avoid having to manually modify the 'show-info' command this commit
adds the 'show-info-all' command. It accesses the PACKAGES_ALL variable
with all the packages present on Buildroot independently of the
archicture or any config entries.

It forces the `BR2_HAVE_DOT_CONFIG` variable to be set to force the
reading of the packages mk files.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---

v1 --> v2: removed TARGETS_ROOTFS and recursive dependencies. It
  introduced "host-" package with no name that introduced an empty
  entry when generating an sbom when `make show-info-all` is ran without
  defconfig.
  Checked the diff between the previous version and the new one and
  except the empty entry nothing is changed by just iterating over
  PACKAGES_ALL.

v2 --> v3: 
 - add documentation to make help and manual
 - fix the error message from check-host-cmake.sh when cmake3 is present
   in the path
---
 Makefile                      | 24 ++++++++++++++++++++++--
 docs/manual/common-usage.adoc | 12 ++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index cb52a1d668..b4ce363f5b 100644
--- a/Makefile
+++ b/Makefile
@@ -126,7 +126,7 @@ noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconf
 	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	print-version olddefconfig distclean manual manual-% check-package \
-	check-package-external
+	check-package-external show-info-all
 
 # Some global targets do not trigger a build, but are used to collect
 # metadata, or do various checks. When such targets are triggered,
@@ -142,7 +142,7 @@ nobuild_targets := source %-source \
 	clean distclean help show-targets graph-depends \
 	%-graph-depends %-show-depends %-show-version \
 	graph-build graph-size list-defconfigs \
-	savedefconfig update-defconfig printvars show-vars
+	savedefconfig update-defconfig printvars show-vars show-info-all
 ifeq ($(MAKECMDGOALS),)
 BR_BUILDING = y
 else ifneq ($(filter-out $(nobuild_targets),$(MAKECMDGOALS)),)
@@ -236,6 +236,13 @@ BR2_CONFIG = $(CONFIG_DIR)/.config
 ifeq ($(filter $(noconfig_targets),$(MAKECMDGOALS)),)
 -include $(BR2_CONFIG)
 endif
+# show-info-all needs to access the PACKAGES_ALL variable. This variable
+# contains a reference to every package present in Buildroot.
+# Since the 'show-info-all' command might be used without actually having a
+# dotconfig this condition is forced to be set true.
+ifeq ($(MAKECMDGOALS),show-info-all)
+BR2_HAVE_DOT_CONFIG = y
+endif
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),)
 # Disable top-level parallel build if per-package directories is not
@@ -948,6 +955,17 @@ show-info:
 		) \
 	)
 
+.PHONY: show-info-all
+show-info-all:
+	@:
+	$(info $(call clean-json, \
+			{ $(foreach p, \
+				$(sort $(PACKAGES_ALL)), \
+				$(call json-info,$(call UPPERCASE,$(p)))$(comma) \
+			) } \
+		) \
+	)
+
 .PHONY: pkg-stats
 pkg-stats:
 	@cd "$(CONFIG_DIR)" ; \
@@ -1213,6 +1231,8 @@ help:
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
 	@echo '  show-info              - generate info about packages, as a JSON blurb'
+	@echo '  show-info-all          - generate info about all packages in Buildroot,'
+	@echo '                           regardless of configuration or target architecture'
 	@echo '  pkg-stats              - generate info about packages as JSON and HTML'
 	@echo '  printvars              - dump internal variables selected with VARS=...'
 	@echo '  show-vars              - dump all internal variables as a JSON blurb; use VARS=...'
diff --git a/docs/manual/common-usage.adoc b/docs/manual/common-usage.adoc
index 7437a7c3c0..631c2f7788 100644
--- a/docs/manual/common-usage.adoc
+++ b/docs/manual/common-usage.adoc
@@ -170,6 +170,18 @@ by using the +show-info+ make target:
 make show-info
 ----
 
+Buildroot can also produce information in the +show-info+ format about all
+packages regardless of the configuration or architecture by using
++show-info-all+.
+This is used for maintenance tasks that require information about every
+package in the tree, such as generating a full-tree SBOM for
+https://security.buildroot.org[].
+It does not require a +.config+ file:
+
+----
+make show-info-all
+----
+
 Buildroot can also produce details about packages as HTML and JSON
 output using the +pkg-stats+ make target. Amongst other things, these
 details include whether known CVEs (security vulnerabilities) affect
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
