Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B18ACC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 20:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D518880ABD;
	Tue, 13 Oct 2026 20:57:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DYCYooBxqIlk; Tue, 13 Oct 2026 20:57:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E734680ADE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791925059;
	b=HYs96H0IF2yfvHUhZszOChGv8sTuMt2XozgjSRUpjcK3SA9zygX/2MSuXrVHncUbG+Y4
	 QeYkYjQovk76St4O0bU1Ql3prqPN5OCAuTFf3IhUZnUjl6KAusm2eco1iPOECQ0QGpv5y
	 W+wXUdmX3kbIk928aj4n+WR13/cVFCiDYh8DU5CCi5elMaBeCsZILgSQguWHE6wWUQGh9
	 dDJDNxUsc7EXD2VTxH5oxRuUexOMLuOkyoJfKaIYiiQRmfC34sR/JyyxTC66O9Fr959mL
	 J5bgtFK8AYYVWtGie19TvHu+HpTNN237YAwKapcQd8DPsc+jEcK0KrIFbK5jKPRA4/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791925059;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HukDuu1g8T+BOuVdXxl3D6dbBVVTd9h8ogCLOHVgwLs=;
	b=Rwas12cXSo3n8fXVUXj5lXqRvo3ZMSyAGbYFwi2ZsLyMsO0bJk+MVHnps1Mg5hfw2zh/
	 ryiRtUgA3tY7GkUSJohR1+xG14Mvw/43l65q9KHJVf2Ek8FTtj5gbh6LKQ5hQw4RQerGd
	 QI2lf8RJZ4hZF6+z8Pqi9aqPpoQXTBlLVOkH4hcsDSHBH2DQFv5sbcOLkgS18dbS/TLUZ
	 30yqPXSZHTt+uJbl3bC7sFU4LYqm1bdHGxV3YCCqG1G5AFfdXVmzwfyTIy5rdLGpvE793
	 5moRku1NdrtbsDCM94wR4XPYS2VLNabnq3wveDVZws7Ya7RxbXrx3E24g0hcPi+QCww==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791925059;
	bh=HukDuu1g8T+BOuVdXxl3D6dbBVVTd9h8ogCLOHVgwLs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lHpUn8AfEedC/Li13w5yIcYIyzM/Ewbd0gGXZf+tR66BZScSRhNmKod75zMxoXz/H
	 kGoipUS1CqA9+VuGNx4P88aUu8We52nrICZUL75j39XfIlnpvhnYdrij4wQaYUwjjW
	 VpGjTUdGM8rFBegoiJkccESOLIQtgbHUX2wjg3kQ5MHXQ+Qoi1ngnZsickCRRpyneU
	 XEKvs8hCSYjHzdntbghVO+LFDuPWgocBpOupQuulc4C33aTmjRAZhUOsz3etfdKbKm
	 WOBI+uM0FaovBdicfr+//xolVqD9fyjYCHlwD7IRNhWWA0ZIR7nOp3nttooBNGVYZ1
	 kZJ4f4z1nHyRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E734680ADE;
	Tue, 13 Oct 2026 20:57:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B6AF2AE
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 391754062E
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sOU2dusrdOpn for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 20:57:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 81E8440448
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791925054;
 b=EwadGD3i6kVh+OhsjukQ57AK99gyNauH9vNlttk9HtWuT1HJSuCnI1sndLPY9V6yizTE
 C6jj5F5/M9CLb4UDP51bDVfsQppDY3/GlJ7usBC3X7xotrAGuqMLfOVp+KtorywaqqFvO
 xbdpnlenaBZk2jumWeLm3jehLBkuldM2X/Lumj1QgWh1+mlDvFBM7FZOZYmbkigb0ut9x
 16zvsaf1JTVYxyuqiKt1S6HRuZpEWEkOLMnKPHPcrRvvD5McAYldMy3Tq2dC5J5E837vy
 bxeQyLBa+3M9lYO3vcw/2aRNKp8Pj2M+Yleol0rXzm/PnY3XQ9+IE1/m3bdWHvRNkOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791925054;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Tk8cEG8Q+D9NOGKCmviNcFd1pGM+t7X4sRWZgU8hDNM=;
 b=s7ZDbb+09Xj48IOhcgX8MjImv2JcIYiuVGtmJrV2WrnBS2dmO0p8Xvn06osqLL/oT9dm
 UgFBpguSPMotQckDSko7QfOo9klqOS4ePtXnfa7ogeMaeweDRuzuqKEizpOlVoh89KRdt
 Wt6mUiW5GsZjQCRYe/uUUyQsF/NyzPQ+0ZNI9RzY3NzhPte8KOKQ9dqEExUV02sg3Ebx9
 AV+OLTQBiXxQ0Z/+cGHM0HXLfhsxPdd1gClUOjqbrY3M3c+UvCh2+lQPSB247JX5btRwv
 dloPRWaU2hlyI2v3ccTzBrXKXIx7ZyHH6scpiiuEtMlt5tHRh2CUm1virbYFJ+Or/MQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 81E8440448
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 20:57:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99DE3957D0; Tue, 13 Oct 2026 20:56:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 22:54:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a5f741c8e8fd96315cf1226bffe99b4ac000a785
X-Git-Newrev: 5ccbe9fdf4c0a85ffce7e0605da2b87063a9916f
X-Patchwork-Hint: ignore
Message-Id: <20261013205614.99DE3957D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-botocore: bump to version
 1.43.112
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5ccbe9fdf4c0a85ffce7e0605da2b87063a9916f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 59b04e5f07..51be01c029 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  74f03a0859f14c28ca78a6694f74afe9  botocore-1.43.108.tar.gz
-sha256  ee4f75cf3bdbb0da7912e089950e8112f692016539d939312c771499958e6cfd  botocore-1.43.108.tar.gz
+md5  a05d160b6ea2e3b8d54919585c414752  botocore-1.43.112.tar.gz
+sha256  9ce0d70e09fabbb3a2e1126d3ec79ed67d14c88bb3f064e62ab2881d5eaf3c7b  botocore-1.43.112.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 264ea1aab8..376c400332 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.43.108
+PYTHON_BOTOCORE_VERSION = 1.43.112
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/61/16/6b4477f433da2c11193802f538330ce080076c2f38d817ad437ed3cd1465
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/0e/49/58187bfb510831e4cdafd7ced8e2a748097da81e8b9799d93f8d6ebf9f61
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
