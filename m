Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 466C1E8784E
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 17:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4E4640BD3;
	Tue,  3 Feb 2026 17:09:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zA611WPu10Nh; Tue,  3 Feb 2026 17:09:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CE6B408B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770138544;
	bh=PrXjI7qaLpUFaQvGCGw/4VX3zQePWrz9FRHbyIic8aI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=R9lgSiD8+Cr9icoPBsfRA9ShS+rHKoYF67N5wmo4ZOvHNY0qF2celnikl96e2umzI
	 kfYlAnapWpxYikrC9aWfhYbXRbSWauq3LYVkPNDNcb2C9KHhE5cmkWZQglstddhvNX
	 mAEK6KZd58XBjKb3Y+32KX8QuPgKZyoyWiaigMBZT4X66Bq/ThvCoJgspZ4jl9S+XU
	 uTawRa7YfuZKJEfiS9Kpot+sxjyly1hFMFjynhqCVC1ELgJAQjlSazCnYI4H0A1e1d
	 /LzcEycitS2Y5LiTwDec7YDnBraxyQE0sScw4y1DXJoS2gPsDUvX+Ec+8mRGTwgQ3f
	 WnMjz8KEGAWbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CE6B408B5;
	Tue,  3 Feb 2026 17:09:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ED45F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:09:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1ABBC6060C
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:09:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwKfsFs6pUWX for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 17:09:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 349CF605A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 349CF605A6
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 349CF605A6
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 17:09:01 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4806b43beb6so43124355e9.3
 for <buildroot@buildroot.org>; Tue, 03 Feb 2026 09:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770138540; x=1770743340;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tCQVMzy+Pb6UUxaqZlMXCq4TcHcmFakbsu4ABphT4aE=;
 b=RW708MQD+yDctJG/fPv8/6yZbH/jdnGg2FKYqI74Bu4B9umFRqq0srgT/DiShQySnb
 XE8JJzYPCc2MLHc4jnZEd7SXaXbzs5MQvJLi2gQMDAKE2hfSJba4HJgjyADGCq0ktLrI
 EcMyz/Hv+1MNRthg1EmUr4uAXLcN9Cxftq0yMtgK7b6h5oivotvlqksJ26a6JbybHSCn
 6f4O+w3Y+cHInXdZVMS94/T3cj4hmiufSkALHmi2phoWYwJt/7dNt6S9Xberw0vDMELu
 5CN629M6iE3GRUp29ZselT6Sel1l4GyrWMsffNcpnDADPABuyfKL00Vq1dct76bA/v9g
 z1YA==
X-Gm-Message-State: AOJu0Yz447lmJwMeRnBi0ctEpDzMCiz30RMcfD5xDF6WFqVJTSWpxvCF
 gYDuZacYaDxZnqfX+e7U1gOeHdSRkabbZWc2z5gBY4NFHkw4yY4+Kc4C6WKs06HkaNKMA4finyl
 Bj50O
X-Gm-Gg: AZuq6aJFMthH+dBuw89RexCPV3dALY01Um0OG03/NfSnWWczCs/bwrVYke538+LZbAg
 EZDMk0dUmR05Fj0XLyMtTfyqb2HVSB3rMoS2Y/xBf2X4Y/5XwLWJiiVKLEo5H2vvKu6JWmLEMyL
 y09SiC+d+XkOlu8l5Mpe1saS4Zry0ceGDImlB3+lC8hYsaKQp0KAj3Br1U5871dKmsx0MhfIN3E
 euyIW6JiL/9yNICzm8BPo5VqzDw8t1lMSsN6YHS7EFaM6ftc4DKdFWjBlZGdeHQTJndFjVbVF3P
 sgJvpAJyYz+j4gdOJknWj7ojiMCoaEhF8ATLI7qBStP9VYNV+HyOmabL/4nncLgrbxBf6M0mjIP
 J6O9Rdj24o7oV+Px4/IopnfBHJt9SkjH9yUmv4X7gr/QpbhWeLoZ1P/Sq5mDICUHTYsdpyAA85Y
 JsUc0lOfwy1qr/Zf4KRGJwWcT728PbLsV6BqmFIxqzx5o=
X-Received: by 2002:a05:600c:4e05:b0:477:af07:dd21 with SMTP id
 5b1f17b1804b1-4830e977f95mr5116205e9.25.1770138539834; 
 Tue, 03 Feb 2026 09:08:59 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43617e25d0dsm63673f8f.7.2026.02.03.09.08.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Feb 2026 09:08:58 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Feb 2026 18:08:58 +0100
Message-ID: <20260203170858.239036-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770138540; x=1770743340; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=tCQVMzy+Pb6UUxaqZlMXCq4TcHcmFakbsu4ABphT4aE=;
 b=K2c0K/YRk5RVyGptr+JYFZo+znhJzgKTPfCKmY24KE8bLE/Z24H6FU2OoD86HU+22C
 0chLdMN3T5IHAnWhra7Pwb5ozVGWelkmlijp4oipy0sASwSQ8R9c8Yw1doOMG+OzSIAP
 mtJBrqGJB9P0TM/4+PoNXbRQtfzp35mKLh3f38eX+Gs+PSRL/nO9z9tvciazJ9engRfp
 US4oky4E2WUFjoQWpgOkHNt0e6A9wSS+qcz9jbpTxHsGqxFucFLCxtUh+X5i4bL0jUvv
 azJPTm/xQ/9yCHRR+NRWZh7TW5R3OprvcdF+UnMLZLcbuEf9Yr9TqtyvqJWlbQvBuRB+
 6Vgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=K2c0K/YR
Subject: [Buildroot] [PATCH 1/1] Makefile: add 'show-info-all'
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
 Makefile | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 004039d847..a41905577c 100644
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
+# contains a reference to every packages present in Buildroot.
+# Since the 'show-info-all' command might be used without actually having a
+# dotconfig this condition is forced to be set true.
+ifeq ($(MAKECMDGOALS),show-info-all)
+BR2_HAVE_DOT_CONFIG = y
+endif
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),)
 # Disable top-level parallel build if per-package directories is not
@@ -931,6 +938,21 @@ show-info:
 		) \
 	)
 
+.PHONY: show-info-all
+show-info-all:
+	@:
+	$(info $(call clean-json, \
+			{ $(foreach p, \
+				$(sort $(foreach i,$(PACKAGES_ALL) $(TARGETS_ROOTFS), \
+						$(i) \
+						$($(call UPPERCASE,$(i))_FINAL_RECURSIVE_DEPENDENCIES) \
+					) \
+				), \
+				$(call json-info,$(call UPPERCASE,$(p)))$(comma) \
+			) } \
+		) \
+	)
+
 .PHONY: pkg-stats
 pkg-stats:
 	@cd "$(CONFIG_DIR)" ; \
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
