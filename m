Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF52CA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 09:13:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2FB484204;
	Fri, 29 Aug 2025 09:13:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JgqxXanLsMcn; Fri, 29 Aug 2025 09:13:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C252C840CD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C252C840CD;
	Fri, 29 Aug 2025 09:13:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 31F55D2
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 22B6E41786
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uFvjsvWU-GLf for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 09:13:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 38AC241783
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38AC241783
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 38AC241783
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 09:13:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 23E1AB978442; Fri, 29 Aug 2025 11:13:43 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Arnout Vandecappelle <arnout@rnout.be>, Vincent Fazio <vfazio@xes-inc.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 29 Aug 2025 11:13:42 +0200
Message-ID: <20250829091342.516051-1-arnout@rnout.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1756458824; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=juvaU+Zw1CiHLpu4SR/DP66GhlvShzVvFBKIRepXtn0=;
 b=c1o4DyzUqtRX3sjBcjh4SitYgqp4TykgWjLATbFIVqpMZtaFf/fRvUFl6/gBkcEXnP5lxh
 pmXHcUslMbVtvpFSSxHTV2F9lv9I7Q6VtDEIiVOrNqRjtJIAHFCnF1aJAdgkK+6dGS5CgO
 r3VptlR2uLnJZDQX5cHeFYAmz2BpML37Vi4/cINBnof3oXoevtSapxX58XDuD5pysLL+kY
 zQ1ad5arFV5r5GQ3XY22mNhOVdaqzCQcg99kO81HxeQFICh+XAoQ31RG1q0TmumtMx5/Sz
 hdqlnQs2IpVFk59nTNgQfA50QMEnLbA0UNd+fRR/cLVECnVo2V9jgoEofvIY3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=c1o4DyzU
Subject: [Buildroot] [PATCH] package/python3: do build-time detection of
 non-working toolchain
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the bump to Python 3.13.2 in commit
d63e207eb869063f82c867658676c2903beb08cb, there is a runtime assertion
in Python when the toolchain doesn't support time64 [1]. The only such
toolchain is one with uClibc and linux headers < 5.1.

Encoding this dependency in Config.in was deemed to complicated (cfr.
commit ffd00280315e60908d0d317b1dfb4c714590a03e).

Instead, do a build-time check of the same condition. The check itself
is a bit complicated, but it is localized to python3.mk and doesn't need
to be propagated to all reverse dependencies.

Testing such a corner case toolchain is a bit complicated. It can be
done with the following configuration.

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://toolchains.bootlin.com/downloads/releases/toolchains/armv7-eabihf/tarballs/armv7-eabihf--uclibc--stable-2018.02-1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_PYTHON3=y

It needs to be built in an environment that has libmpfr.so.4 installed
as the pre-built toolchain from that era did not include it. An easy
way to achieve this is to build this configuration under an old
Buildroot Docker container:

IMAGE=buildroot/base:20180205.0730 ./utils/docker-run make python3

[1] https://gitlab.com/buildroot.org/buildroot/-/issues/95#note_2348479811

Cc: Vincent Fazio <vfazio@xes-inc.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/python3/python3.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ef0658262a..d79c9cd18b 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -315,3 +315,13 @@ define PYTHON3_REMOVE_OPTIMIZED_PYC_FILES
 		xargs -0 --no-run-if-empty rm -f
 endef
 PYTHON3_TARGET_FINALIZE_HOOKS += PYTHON3_REMOVE_OPTIMIZED_PYC_FILES
+
+# uClibc without time64 support (i.e. when linux headers < 5.1) causes
+# a runtime assertion in Python. Encoding this as a dependency in Config.in
+# causes too many problems for propagating reverse dependencies. Therefore
+# instead we do a build time check.
+# Note: if this is changed, there's a corresponding condition in genrandconfig
+# that has to be changed as well.
+ifeq ($(BR_BUILDING)$(BR2_PACKAGE_PYTHON3)$(BR2_TOOLCHAIN_USES_UCLIBC)-$(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1),yyy-)
+$(error Python3 doesn't work with uClibc and kernel headers < 5.1. Please use a different toolchain or unselect Python3.)
+endif
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
