Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41713C0218F
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4BD940591;
	Sat, 14 Sep 2024 09:55:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqCQsCPG5Rb0; Sat, 14 Sep 2024 09:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1C9F4043A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1C9F4043A;
	Sat, 14 Sep 2024 09:55:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D120C1BF280
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BBCAC8448E
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TirvUnA67jAn for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:55:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 874D184466
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 874D184466
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 874D184466
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:55:14 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42cafda818aso28431335e9.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 02:55:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726307712; x=1726912512;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b7KN05aMglbjPCA93vTJQLZR0w7m6Z4gSlp5vc+hbWU=;
 b=ZQZCK+olObsPWNXyeFMgodDouSFZcYcn8GcR1wHMpvCBbNUKfWEL88cy+O6sO5wnAx
 tapaZXzw6mYS4Epnx27FXk75MOqAoQ0H2Zc+ez1qbkr7WqEiasz8DiPeFC53QdkkAA4g
 L1wuKn6hfJ4X3fnvc/eHDnFzS13ymSsZFjCaEcIP6b7ZJYxZRjOIxszYz3rpAco8T2JA
 +KZ3sxhQFbaiXmai7niVhbhsO8fDq0oGYeC9GvtDqV/p+fg+XBuTps7vnIgKmKy/xmJN
 hR64jWsRs1OwpL+l3jC3mfE/hF/Qog+q7RlGokQMbAiTyIfw0EddAvDovoxOvKkElCl8
 tkMw==
X-Gm-Message-State: AOJu0YxNULbNW5EX3Gzt5EnuFfJE/97/TmEAEXCIN5AG/p/LaKtkfYAc
 JJXl4bxlm+Z5HDjRh+i4iS+VmHsY5Hx3n6q2Wur1Xgg/zrULRvSaZjgKatFwC6yA8uStfoI5qlf
 btv4sug==
X-Google-Smtp-Source: AGHT+IFQ9bT4TmUUenQeihjtuRwalYVm5rwhxPWKqZRHoLkZ/BTwVVFjvJ77tZ6JCv3L5h1r8LmCDw==
X-Received: by 2002:a05:600c:45cf:b0:428:f0c2:ef4a with SMTP id
 5b1f17b1804b1-42cdb531c3dmr87724635e9.13.1726307712303; 
 Sat, 14 Sep 2024 02:55:12 -0700 (PDT)
Received: from localhost.localdomain ([2a02:61:a2::9b5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da22b87a9sm14457395e9.6.2024.09.14.02.55.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 02:55:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:54:59 +0200
Message-ID: <20240914095501.194725-2-arnout@mind.be>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240914095501.194725-1-arnout@mind.be>
References: <20240914095501.194725-1-arnout@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1726307712; x=1726912512; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b7KN05aMglbjPCA93vTJQLZR0w7m6Z4gSlp5vc+hbWU=;
 b=K7ilQFOzsWmnQjqvuKG4cq/g8X9PjrK/chV3g+Vt6fEfgOvYh2SZeTDHFw9aGC6j3C
 JZhjutseeUnL9Uo7TpUErjBNk1BYhoqHKc5deLOznkhiUH7o8o21YXz5XAn9s2smmiy/
 DcaOleyjn2DnlNbIJWKmrrsUF5KVaAj5W+Hz6cBVH2cCX7Ip39/P4CX48ifCYu9Z4nw2
 mzoPD3XLX4Ivrkq7fjsl4eKPzDOOTAgiUB0aA9BVw257Pbv+VFdYpBipESviPU9drC7e
 dKExhqCGNfoUzrGNsnVZcz8bn3sy3lgiVJnA9zicKO6FrYyp3hwVY53nDoR/DVbnssst
 c9Bw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=K7ilQFOz
Subject: [Buildroot] [PATCH 2/4] package/pkg-generic.mk: legal-info: make
 sure host-tar is available
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit aacca7f0639bac6bb3fb262d0b1738c4387edeb0 introduced the
possibility to also create tarballs for packages that are local or
overridden (i.e., with a custom version). However, it doesn't work
correctly for PPD, because the PPD-host-tar and gzip are not available.

This failure was silent because the mk_tar_gz function doesn't exit on
error. The following error was printed but ignored:

    support/download/helpers: line 62: .../per-package/busybox/host/bin/tar: No such file or directory

Call prepare-per-package-directory before calling mk_tar_gz which uses
it. Note that we use only tar and gzip here, not all of
DOWNLOAD_DEPENDENCIES, because tar and gzip are the only ones we really
use.

Also add this dependency to the legal-info target. We use an order-only
dependency even though that makes not difference for a phony target, but
this makes it similar to how it's done for the stamp targets. Note also
that this dependency is redundant, because there is already a dependency
on the foo-rsync target which does depend on DOWNLOAD_DEPENDENCIES. We
still add the dependency explicitly in case things change with the
foo-rsync target in the future.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
Cc: Nicolas Carrier <carrier.nicolas0@gmail.com>
Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-generic.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 69352b3730..48cc8ec800 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -1008,6 +1008,9 @@ $(1)-rsync:		$$($(2)_TARGET_RSYNC)
 
 $(1)-source:
 $(1)-legal-source:
+# For override, legal-info uses host-tar and host-gzip
+$(1)-legal-info: | $(BR2_GZIP_HOST_DEPENDENCY) $(BR2_TAR_HOST_DEPENDENCY)
+
 
 $(1)-external-deps:
 	@echo "file://$$($(2)_OVERRIDE_SRCDIR)"
@@ -1163,6 +1166,7 @@ ifneq ($$($(2)_OVERRIDE_SRCDIR),)
 	$$(Q)rsync -au --chmod=u=rwX,go=rX $$(RSYNC_VCS_EXCLUSIONS) \
 		$(call qstrip,$$($(2)_OVERRIDE_SRCDIR))/ \
 		 $$($(2)_BUILDDIR)/.legal-info-rsync/
+	$$(call prepare-per-package-directory,$$(BR2_GZIP_HOST_DEPENDENCY) $$(BR2_TAR_HOST_DEPENDENCY))
 	$$(Q)mkdir -p $$($(2)_REDIST_SOURCES_DIR)
 	$$(Q). support/download/helpers; set -x; cd $$($(2)_BUILDDIR); TAR=$$(TAR) mk_tar_gz \
 		$$($(2)_BUILDDIR)/.legal-info-rsync/ \
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
