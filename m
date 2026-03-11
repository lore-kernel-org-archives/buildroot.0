Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B63106289F
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 13:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D768884502;
	Wed, 11 Mar 2026 13:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcevQgGxcFGg; Wed, 11 Mar 2026 13:15:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF01F844FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773234935;
	bh=eizVENb8trpicLnXtfmhetIGTyJYLGWQf6//jNqd3Wg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=m5aFTrOBIl12ecnPCUgEd/yw7MzLjErACXd/M0BB8Ehj5R/yjHsRwRcMc1MyPlVlm
	 mvKKepKXN3rifZvIAimtYIWmag7y3TK9Vbbw21EbR9a3bpIFbwqMNBEnmU1WKQVOy0
	 V7ujjrEbTTnp8Xq++uNlBUVIZAHmIdtlFr9CVwShpMbrlWBcOPoPN/ErjD0FHI2UOR
	 tWxp1S6wpEwtj7hGl6zGyTt6mN8VEUKt9P2JZNJcAtvf8dkdPOamRYlm+540v2EJxQ
	 vZdP6N7+MWQCUc3ZPrCU8DBdjd/bRwJqmyt0J0B/yTKcy0cRtQsoQlH6NwI2OySOci
	 hntOTI+ENvuEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF01F844FF;
	Wed, 11 Mar 2026 13:15:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ED61201
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 13:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40F8E844FE
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 13:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0TaFqhprLf9 for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 13:15:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 241C0844FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 241C0844FB
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 241C0844FB
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 13:15:32 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-439a89b6fd0so10659353f8f.2
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 06:15:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773234930; x=1773839730;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qT59hx/uAO4r8kHVAs5BwoeFLFTwjXnRXWSQxP3VtLo=;
 b=PZ1+FUD7P2W3WWDbsK6aQouj0cYwskeCTlD5W2LS4nXP+w+Rv8sdQKRTHpC/r2HJb7
 k+RkjNKYWQ6p2ei0UDj+3fs1xIVgjdgMAnoXPni7XPGCx0I2iTdhk6fOMIRW4VwudLuE
 gk8CEJt8KljYK8cQFAb1ntXeSGg4zHdg6qnNwMatQ45hS1ecgunt8Ke9Ag9dGZtNP5vO
 G44BXb8sbUpXc3UUJUwEIRdwiwvHsYuDPWTlWCxVwMNnRNoaZwODPnqFC0rFc8e6jpMt
 Mt2iQuLIzprW1JHs1sm1LSkG6TmAAhZ78pHE5gmGs3XaONJOz2tbkAhHXhJhj2omVWnB
 dasA==
X-Gm-Message-State: AOJu0YzT7TrQUt721VYsxJw5hxmw3Z/UJKShnIxZiIVx6Ao6H02Xmh8N
 UzBk6/YLNbvF0w97Sc9zVFL0pj/p2hznteqWbl6zQn8gNyBzdwvhD3yZyKo7h0mh6uUdg/aF4yV
 aKVg9
X-Gm-Gg: ATEYQzw4RpojqnJF0v+q4+2N45blSsjOzPSp52avHDM84NPn/dhKEdOeVQRB3RyIapg
 OHIC9yRHrsfcF7+x6fAvZv14IJ8RWlHdtXzP6pVnb7Fs9lHcJDZ8B2PpQ9ic8zki8ZIVBdCIsZk
 bvQgAyLEpoLNjdh/6bpcxo4O98/q2lryn6uOVIsCKfkVP2yvNvTzYjvgegwhyT1UmoKcc19Cl/b
 B0HyqaxyCaAPBAJV4kaqg5C5vz62fGAeaFXJ3BezDFlI9+KzuRQTS7t/O8bNrvPsRow2fOfS/CG
 Jqc2cGst7qWH9nOhawr+ma73ZP/Dm4SG4VWyWOYPHagYkl6ky7b9SjjgBpIa+gGVRT+ktm+myN6
 kYchINaojxt8a8G1A4ReFHIRbqZiw5vOm8K+TlH3FunlWN6SwS0XmKNAuzxSqTVg/dbSy3I8Q7s
 0/5x5pdcq671Jh2oIM7xOR6ZfWSg==
X-Received: by 2002:a05:6000:2485:b0:439:cc1a:af49 with SMTP id
 ffacd0b85a97d-439f8219fb7mr5274219f8f.27.1773234930069; 
 Wed, 11 Mar 2026 06:15:30 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439f821d095sm7000914f8f.32.2026.03.11.06.15.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 06:15:29 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 11 Mar 2026 14:15:29 +0100
Message-ID: <20260311131529.120513-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773234930; x=1773839730; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=qT59hx/uAO4r8kHVAs5BwoeFLFTwjXnRXWSQxP3VtLo=;
 b=MAiPyUyf56+Rn4Nfxfr8wW2kixq8NRhD6N2glH6uvUeLXY7v29ahOECxHV2gx+SRoS
 Ovt7vYhgZAYfRGJ3uHDXBW1n7Sn11M+pT0XQZdsxKdrZ3loPGSe/WD4KnrBfz0oi7J2U
 ktRxesGbnv4dexoSMe8rM5wrvMQwLVw4EBoyPlJ0c3he4EOYjfZ8Fs56uDtgHP5hfqaK
 pL4O3hejWf3oHgx2uMVXWiLQW3eD0zcCNTJlZyKMR6JrC+aUFfg/ZlO5g/mVt8QY6SVD
 haYKmLZZ4pHWmTvusEUoBZrtMnrzrAWQrCcF2BX0ROFLb+kzhLvzCP1N9I2M5nj8JxTA
 t+EQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MAiPyUyf
Subject: [Buildroot] [v2, PATCH] Makefile: add 'show-info-all'
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

 Makefile | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index f51155b0ed..bd037cc834 100644
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
@@ -941,6 +948,17 @@ show-info:
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
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
