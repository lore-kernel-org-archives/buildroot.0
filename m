Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89763CA0EEB
	for <buildroot@archiver.kernel.org>; Fri, 22 Aug 2025 22:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58A7840D11;
	Fri, 22 Aug 2025 22:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywtRWZ4wAdmL; Fri, 22 Aug 2025 22:20:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F1C140D12
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F1C140D12;
	Fri, 22 Aug 2025 22:20:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 217B542E
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 22:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07D9140A30
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 22:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ORBPjj71FjCG for <buildroot@buildroot.org>;
 Fri, 22 Aug 2025 22:20:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 107784099B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 107784099B
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 107784099B
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 22:20:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 0D646C8EC67
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 22:19:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E751E604AD
 for <buildroot@buildroot.org>; Fri, 22 Aug 2025 22:20:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E61B1C22D34D; 
 Sat, 23 Aug 2025 00:20:01 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Aug 2025 00:19:59 +0200
Message-ID: <20250822221959.4092428-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755901209; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=/dUjx9SexH42z2vzedzgSL4QUa1/d6MP3Pc/SAKq5B0=;
 b=zIqGGkU96SWQ1DDfAD8EzG/xjrMYCsg/ax6i7t9zjHUh/mX+5Rno+z8xbTTCsSFM5mRgPv
 /dTEnGvgeUeu8HMMLHox6mZ/ro7fwOMEyjaun9SWFScmSLES7GJCZeoWdfj7SPJjX3R9t/
 4Om4oa3HQ0zV10Xll1uTGBMM0LfKvRaBxHboV4FaCYH3SOc+31g1srh1ywdD4+Y4XR1w47
 C+6vFulRDNIVBLP2su8DcQ88c7GSTHkq7b2KmyiYW/gCgPiZWz7r3n/J8+7TM7JCETOlHx
 CJz0F8yHgkP2Z+r3XyCkhdc4lk6mqf4M/1yxnqkSjxcKS5pmdYeOtjIPJDY8TQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zIqGGkU9
Subject: [Buildroot] [PATCH] package/p11-kit: fix build with GCC 15.x
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The AC_HEADER_STDBOOL macro used in configure.ac is expanded in the
shipped ./configure by a fairly old version, which misdetects our
<stdbool.h> as being not usable. Consequently, the code defines its
own bool type, with true/false, clashing with GCC 15.x.

Doing a pass of autoreconf addresses the problem.

The autoreconf needs pkg.m4, which comes from host-pkgconf, added as a
dependency.

Note that host-pkgconf was already a dependency for one of the
optional dependencies of p11-kit, and we're keeping it there even
though host-pkgconf is now also an unconditional dependency as we
expect this unconditional host-pkgconf dependency to be removed when
we drop autoreconf.

Fixes:

  https://autobuild.buildroot.net/results/760df1a8c21afa893ade5181ce797e14c1f6bdce/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/p11-kit/p11-kit.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 154a34e634..42de3e1065 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -14,6 +14,12 @@ P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
 P11_KIT_LICENSE = BSD-3-Clause
 P11_KIT_LICENSE_FILES = COPYING
 P11_KIT_CPE_ID_VALID = YES
+# Needed because the pre-generated ./configure script has an old
+# broken expansion of AC_HEADER_STDBOOL, which incorrectly detects
+# that <stdbool.h> cannot be used, causing breakage down the road.
+P11_KIT_AUTORECONF = YES
+# Needed for autoreconf
+P11_KIT_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_LIBFFI),y)
 P11_KIT_DEPENDENCIES += host-pkgconf libffi
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
