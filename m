Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6227EE95396
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 13:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D54C40C91;
	Wed,  4 Feb 2026 13:18:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iySiqxpsKSu; Wed,  4 Feb 2026 13:18:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 41FBB40C72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770211131;
	bh=fnXaqi0L98G2ogn7+NYVC60Osi0azVSnhEf5HLhWNO8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CvOTdH3SRB+iWR2I5X4f1igVWXpuzNojXVo6FoS+jb1/qZq/ZNlAiW7FXn7tPTpVr
	 N4Lm2DsLh7XP+PS3SBDVNWekxlfSebN4KA/bw+p1vLTUj52Y5O/1RLRb4QXL7Ysgna
	 IakoEmH9ceeNw0CCEzw2bEJGFry2+EzS/WH7F6hDqN1CbVNUYZbk8qcfJrtLLX+XBK
	 D3uTZWVRSBi6lGKuuhwG048kEPYtSvg5UBBKN9eEq02nlcbyW2aF1KFK7j/5lMoqfA
	 JfJASx9UPUB2JGkzb0zEL65WPVTfoJ5/tllQO17IKArCCNT/U09xaFXGQ9nuhRr1Xy
	 KUfSXuzD1Zi7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41FBB40C72;
	Wed,  4 Feb 2026 13:18:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15B3DF4
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3DA140C6F
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xd3gTORBpMIQ for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 13:18:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A25A240C6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A25A240C6B
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A25A240C6B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 13:18:48 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4359a16a400so6030966f8f.1
 for <buildroot@buildroot.org>; Wed, 04 Feb 2026 05:18:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770211126; x=1770815926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vPp6OSbVIfO9TygxJs7HR9hdiM7fgBHzJN9fJVsVXac=;
 b=uVBPAU4h8C88LpIk+7fI1Tp9tlsIFl05SaDkzicQ3QpnQAk1WA9GW6XL3z5vl/VS+H
 EmrnG1gOsF7HuRgxvChxpepNY84LZe/RX2DQlDQ9A9PLxN+IeWu5ZEnP0j9atXTeyUYi
 T1/O2jlUfLa1VGCA+KYp9p7U8Lq5XLyzkeXa7gVDW9+TwECcO/lbohrkDCZxw2esJQOE
 jLrV+SC6BjuIqez1nlesJT112/TsbAzTLuXSQWLl8Ly6lEm+ygteTpncXRTf/6UkchIV
 Z7g5LDnh2M0oSigbaAXk9mAEo5QaUuB5vgX0Xd1JNFJw3N0tAWz+f1m0Jrf/zGFqeC4W
 HGvA==
X-Gm-Message-State: AOJu0Yze8BoIFsZ4vzMII3jwJB3zhWC9I+RRloYh6ScS/uqZtZ0+lvWn
 Oi/k5m7itG8a1EB9HXOzSE6Wpu9XdLMoXeGsLo0CflN9IeUD/gX9TZvVMH6yYK/SuABdP1CzfgK
 mjKHm
X-Gm-Gg: AZuq6aKVZS1t210L4YEWrurnA0UDYq7faDNT6moNsKrNm2CjrRpOIUXo30HDx6n1Yse
 5vD1jzp9RmpbVzfCtD6O0kEIWP6O7jBRwTMrise6hNRpmhwEFbDxf6Ma/tUef99tb6h1Yk69bzF
 /RL27alnS9/a+nfmIPgmPfjTKP6UVzBNkMuCYVsDDSRc07/PB0aXCRxeqUvNgQVi3T83nXm6C2K
 kySoQRSHftcrAMbCwJ+Y6OB73fCKzEJhhrSj7QDGJeM/vx27x7z69EhcZWZV1d2cnf5WYUxt2nq
 6oEBc/ji/skCU1Uy7ntJdh5lY49yuvUfsqdK8rnhAFRYJWnPUq6hQ38H5632YPt6d50qItNpz+B
 VX3946cHb86233Ln3j8Wd5S5tux6vedwHmWVTEoODcJ+R1VU2HrqLtNyakABHaDgeUZvmuQLDol
 v2HKsiHNyB7tJIskmuyFvbtHNLcf0h9pmdpG9JmG8kpWE=
X-Received: by 2002:a05:6000:2889:b0:436:14c7:32a0 with SMTP id
 ffacd0b85a97d-43618058a8emr4420319f8f.51.1770211126222; 
 Wed, 04 Feb 2026 05:18:46 -0800 (PST)
Received: from mindpad (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4361805faf7sm6283680f8f.30.2026.02.04.05.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 05:18:45 -0800 (PST)
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Feb 2026 14:18:32 +0100
Message-ID: <20260204131841.282589-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260204131841.282589-1-thomas.perale@mind.be>
References: <20260204131841.282589-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770211126; x=1770815926; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vPp6OSbVIfO9TygxJs7HR9hdiM7fgBHzJN9fJVsVXac=;
 b=GQDrmfkURLM/+9yHqB2qBRuhgCul/0npP3jtN7tsrmX+5LPvtrEt3/gTYWvUhcZ+Ka
 3o4NJ0docnR1afu0sqJsQPSeHqOeKofs5gUQ0MAmU87enKQ9btvwQ+D10+Jn7ObVl+0Q
 cCdZ/KyKW0v01hvrit9OZSCNkM++hbIAhu3ptS/mt61p9+2ABX7ZVfF1fjxkERB3/paB
 Wy8WOcrN1d9myxWguba7iZDtd1eRaoUOVC19Fi1QEEHn9vujCAJyKUvcOqUDvAtbKp8S
 CHXCcYW2ZwcV1iQpxvpAR4XGGEliydh2pXXDXphlnbXtpt4EYjec1sogpe495VZnsqP7
 g5lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GQDrmfkU
Subject: [Buildroot] [PATCH 3/4] package/libmad: remove Debian patches
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

In Buildroot there are multiple way to apply patches on a package [1]

- Adding `.patch` file in the package directory.
- Define `<pkg>_PATCH` variable with the location of the patch tar.gz.
    It used to download Debian patches tarball.
- Implement custom patching logic with `PRE`/`POST` patches hooks.

The libmad package is downloading a diff file from the Debian
mirror with the `<pkg>_PATCH` method [2] and then apply that diff to
create a directory containing patches. The patches are then applied in
the `PRE_PATCH_HOOK`.

The Debian patches were integrated in commit [4], in commit [5] the
application of the patches was moved to the PRE_PATCH_HOOK.
The problem is that in the PRE_PATCH step the `_PATCH` downloaded from
Debian don't exist yet and end up not being applied at all.

Since this is not used, remove the Debian patches.

[1] https://buildroot.org/downloads/manual/manual.html#patch-policy
[2] http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad/libmad_0.15.1b-10.diff.gz
[3] 1167d0ff3d docs/manual: mention CVE trailer
[4] 858df3643f package/libmad: switch to debian to fix CVEs
[5] b21184a877 package/libmad: update the patches to be applied with fuzz 0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libmad/libmad.mk | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index db04d22e92..611f13eb67 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -5,7 +5,6 @@
 ################################################################################
 
 LIBMAD_VERSION = 0.15.1b
-LIBMAD_PATCH = libmad_$(LIBMAD_VERSION)-10.diff.gz
 LIBMAD_SOURCE = libmad_$(LIBMAD_VERSION).orig.tar.gz
 LIBMAD_SITE = \
 	http://snapshot.debian.org/archive/debian/20190310T213528Z/pool/main/libm/libmad
@@ -13,20 +12,6 @@ LIBMAD_INSTALL_STAGING = YES
 LIBMAD_LICENSE = GPL-2.0+
 LIBMAD_LICENSE_FILES = COPYING
 
-define LIBMAD_APPLY_DEBIAN_PATCHES
-	if [ -d $(@D)/debian/patches ]; then \
-		$(APPLY_PATCHES) $(@D) $(@D)/debian/patches *.patch; \
-	fi
-endef
-
-LIBMAD_PRE_PATCH_HOOKS += LIBMAD_APPLY_DEBIAN_PATCHES
-
-# debian/patches/md_size.diff
-LIBMAD_IGNORE_CVES += CVE-2017-8372 CVE-2017-8373
-
-# debian/patches/length-check.patch
-LIBMAD_IGNORE_CVES += CVE-2017-8374
-
 # Force autoreconf to be able to use a more recent libtool script, that
 # is able to properly behave in the face of a missing C++ compiler.
 LIBMAD_AUTORECONF = YES
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
