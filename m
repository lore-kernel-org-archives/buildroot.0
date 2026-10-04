Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDE8CA5FCE
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A648E80D50;
	Sun,  4 Oct 2026 15:59:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-AZ9nbmrU0a; Sun,  4 Oct 2026 15:59:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A853480DAB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129588;
	b=hAe08ojj7yI5fkoe3IGCGSF2W6+Ik8t/SIJhENxkG4RLyc+cfQvKFR5F742sh18lHlN/
	 W32+EyWL0vYqKZihXMkrd8Dz4wav3tbkg5JAKbMNdIg7srHs6kZ7vZgunoLSYutuR3heL
	 xo3kC44nor2WdcQSqtTC6uujAEZH3qyRmoPyWgB3fKdn/slq6vCMhOvM3jYQMrQCVvpBr
	 khkuirfHscHRrAWVNFAl+N1YZrY1wMuGq/LDQLOmkm3R46f2jJDPPUUqysqvah4iRgLX8
	 xlRww8GT7WGZnp7uykNwigmJCYYpvBA8QlpMn4nUW5N79HaDPk9X29mjuNUkLhWclhg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129588;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NzUb7VvN9TNuj8o5Vs/F2+raUT6g+kEbx/rrqBG4haA=;
	b=mCanLGMprSBPmROU9+/CNWgQt6ZwB32xJuoYLYwszVqxOdqdTXWFObDK8m5wqD440qrY
	 uCJhdO1ZZnQC4+fUE1O+raGsNsuksQ8kAn81tu8mLCe1EZ2XKvn7PT6iODyxhkWlJ6pCN
	 NF7j4RRP+BCRgJ4ySSDVt9vkOcIeIbKE+3kiA7x55zBsPpEqMxtWHxoXfaZIYUoniGrIn
	 5+JdhHzjzXR7KsUzKYG6pUyGHE0TtGxf1ylnKEzB+KhF5DgArEGBWs87YbQsNlzGgNPsR
	 hSmqm+uT1ZCTL7y2K3wqG2nclMwrlQ0TMH5qYivfqijeeBz99jz2Q2zxI5meg72cjYw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129588;
	bh=NzUb7VvN9TNuj8o5Vs/F2+raUT6g+kEbx/rrqBG4haA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UrljmAtTOgLUMOpMGzRqo4RSKh85S0CGdwEDqgXUgkbYxDL6TZka0YLBTuorzLKtZ
	 28FnEbv6RmKs3Q3vQENZnWKI3yEWTDSA0xHFKlwxp0/uRyAwmwVV2oQ8tpdeAm+HHB
	 xJCt4Hq6A/IZuod3xeefYRCYOQXHYWdqsB8t9XdoMFoQ5m9lpQd3DzRJ9SG61kmNsn
	 02QmtLCro0yXkSykgBGUgcdIBiR1CenLxWI0eaG/kWyoOCIom8fAZKXF4Kz+wzEeCF
	 6QtU4hCyfjcvvHu7Jt11r/lH3xu2L2erMwMJAJ8LEP551j47HtOURBumFTVGaZuPfd
	 8yuXOqgnWGf7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A853480DAB;
	Sun,  4 Oct 2026 15:59:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8370434E
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6648F40611
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id va_59hkAm6rQ for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B376D405AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129573;
 b=GtCLNwezZm/wjrVYEUKvpV4kh8UuwB0RWImMYCB9F+uiSHHQtPNw90Dx7RXHPpseE7Zz
 FJixBjzG6mvWJGHkRbCewBEue3tEjVA8hbSIBP+3Xf/+Jmo33gV4fvhG7ez+JyuVx2pA7
 QDeus55XcohHZmKWA6xgQjGUXrjEos11jum7iQZomeobtLFFnK6iQCQEgj7+Ta8gmqnt9
 feeR+v/zU21gy//rqQ8rJnir2WBPTi7/rue6Fnp98rZaGJ8c0cQTZrXY7ew1O253E8Dgk
 +mdsu33yoDRWJEPYL6KoeQkZjoy07I71uHMgzUrl07eoEDII3amz9P63loNkUEBsrSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129573;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Rz1bbziYLHLcv9mdOa3gHrNyoqnyCC0A06B3FiD3FzY=;
 b=eIyzCCllAwTNupbrj9IUH9mQnRu3vD8RH8UgiPNOkjJYHy+3v+UjFf+WCubsbeGaMRj8
 oe6JhQIXUDQA6a6UWsGJkzMLZhkJuk5GOxv/vlu6IPUBCjD6ZqasWsQdStKiDumVr2seh
 lsv2iCKtM0ObxY9gzrwxA6kXtAn7LibdT7sMyc6r398EIMYz24dTxmG6hJ2yUQH9KeVHU
 4W+s6V1RXNNnEYOerQBwxW/hnZtN8a+P2wA69soAXj1S1qFYuYZ4Mxd/RlcTNzbJFK4na
 yrhvLA2ugrniZ8ftHqMPFPTPB931piOjp55S5iT16nMzjbvddr31Vy0N8k5OU9N1n6Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B376D405AE
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 69E688B661; Sun,  4 Oct 2026 15:58:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 17:57:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78aa2802a4c384ea07a12afcd931eeb41977bc1d
X-Git-Newrev: 1f885a61a1dab70ab2e74a4fc81fa96d8aa1d2ee
X-Patchwork-Hint: ignore
Message-Id: <20261004155818.69E688B661@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-context: bump to
 version 6.1.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1f885a61a1dab70ab2e74a4fc81fa96d8aa1d2ee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to the copyright year inserted by
coherent.licensed:
https://github.com/coherent-oss/coherent.licensed/commit/3b3a6b658d63ddde59499f8ff45b505abea3eb9f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jaraco-context/python-jaraco-context.hash | 6 +++---
 package/python-jaraco-context/python-jaraco-context.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jaraco-context/python-jaraco-context.hash b/package/python-jaraco-context/python-jaraco-context.hash
index 3f65a6275a..8465a76e51 100644
--- a/package/python-jaraco-context/python-jaraco-context.hash
+++ b/package/python-jaraco-context/python-jaraco-context.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco-context/json
-md5  b75fd0eeed9134ba598bad534244b984  jaraco_context-6.0.2.tar.gz
-sha256  953ae8dddb57b1d791bf72ea1009b32088840a7dd19b9ba16443f62be919ee57  jaraco_context-6.0.2.tar.gz
+md5  3832a9304c95b6a209bd218411c6d696  jaraco_context-6.1.2.tar.gz
+sha256  f1a6c9d391e661cc5b8d39861ff077a7dc24dc23833ccee564b234b81c82dfe3  jaraco_context-6.1.2.tar.gz
 # Locally computed sha256 checksums
-sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
+sha256  9755a18519666e5f0f4cae3daad3d7012bcae48a600b31237d75e9fe134e6683  LICENSE
diff --git a/package/python-jaraco-context/python-jaraco-context.mk b/package/python-jaraco-context/python-jaraco-context.mk
index 27cfd7467c..f812cec8f1 100644
--- a/package/python-jaraco-context/python-jaraco-context.mk
+++ b/package/python-jaraco-context/python-jaraco-context.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_CONTEXT_VERSION = 6.0.2
+PYTHON_JARACO_CONTEXT_VERSION = 6.1.2
 PYTHON_JARACO_CONTEXT_SOURCE = jaraco_context-$(PYTHON_JARACO_CONTEXT_VERSION).tar.gz
-PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/8d/7d/41acf8e22d791bde812cb6c2c36128bb932ed8ae066bcb5e39cb198e8253
+PYTHON_JARACO_CONTEXT_SITE = https://files.pythonhosted.org/packages/af/50/4763cd07e722bb6285316d390a164bc7e479db9d90daa769f22578f698b4
 PYTHON_JARACO_CONTEXT_SETUP_TYPE = setuptools
 PYTHON_JARACO_CONTEXT_LICENSE = MIT
 PYTHON_JARACO_CONTEXT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
