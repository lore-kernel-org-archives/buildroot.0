Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFEA8CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8441360EDA;
	Sat,  3 Oct 2026 15:55:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8uvq2dstJMdz; Sat,  3 Oct 2026 15:55:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 799CF60ED6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042945;
	b=VxxJVe4a06IfA7bFgC4hPo5R8067edNQbNj0am4v12rjJNwbiJAT0DnGp49cQrbJLQy1
	 Fj9kmFtxax1PWuI4pE8qfgdUTUT4vMma9UwsWSKjwqNCkOJuL1JYdpGDF2TXitQBWPMLy
	 20B+S3w9ImBCoPsFGj/nsSL6iCAhBfucDG0WqI0vcC81Sq9kK30CTDLV3Fbzn6eJc6faz
	 6K2zROp+/n2mYydLY8vAR0Ad+RHahdNpi9ugstr7i5W+mU8drwrDwDrdM8VhIzZkEZT/u
	 NDW+sQ22k8/N8MqjfvciqPOYkSUaTKiZJkCDqjT/9HFTtPB1FboMvdJW6XMtxhvgETQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042945;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=cYhMivTgetfouquySuVhvkWHosUaw9V5At1geZgjxas=;
	b=jDxW10rNdqsEw1X4HdzJGl1a7ZwN7oygEVCHORs0y6KRLSWIA/Ktzo0N8DXp2gR+QPOd
	 60LZtHl1qcwXGV4Q5x9TadN2D6sKZ+Kr6cH4meeCENEgVmNWMqm6XYfewx+yNBj13EC9O
	 ylEd1MD5BQwNeu4+T2n4oLedOv3DMnfdtZh+LZhjcOJeZ4pwF//SS+NLdcBZm9TtibHrq
	 2Kz0wsZDIcM6vA+mSi80rsHkgRu0JdS4ivClS2VB0uNK5qr4tI1VIJANrxbsj5KqPpwiN
	 /joWP2Dn2OZWr7tkkW5ElVsQ7Qu8tDaSUVOh7FFukNPOF7NXlzmOGY3Jb8ty2ahzlLw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042945;
	bh=cYhMivTgetfouquySuVhvkWHosUaw9V5At1geZgjxas=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ebhKnCcxmvPQc2lKiKZZqFrPEEFj6JgsnbqKXN/9sMIuSbKk39+jhU0+RhULFkCUX
	 J3SdQkwLrf60tKv2DSqX7+Nbj9jFotp40QZ7GXaS0+pnmA8UNeP3iXY53lzIMGdHng
	 8c5/ou/J47n60/SdANHjl4xU+0imYvNi5scHc7OK7mc94BVStyah5FFBlyjvPOrnaf
	 CF7l9O2Po4dGeA3/2OVptgs6NBXvQZogXl6U87j9ilgzi3gvq1c68V7aCrHoXTWNLB
	 8IfGUrU4FFmK2UBG5Upz6u9TsFkOluYZtbKneUbNtii59Cfi9yNbbTzIES7NE/0XN+
	 jU3bZTHeBS60w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 799CF60ED6;
	Sat,  3 Oct 2026 15:55:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A95A04B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9FC8760673
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7rL0_7_uveYJ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 70E7260672
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=MwW+ZWJzYFdBTuAyNWFjCXjwJgjfvcy5cJAn12Po2t7tAM9mKudDQypRm37ZhrzzuGnH
 xJ729TtNfAOkc2vpS7s8mm680zhnBdbXCFakA34GwK+/utoG7sM8Mty8GCqf1rfP2fvaY
 QpEcuOwDxPUPL36+/JN8P0YkYu0vDCeKUDIg7nU0lEpwmZ297gBaFR1Eiwi24Qu4CI+kn
 ZZqyymdp5x6yNG2Ut+wYOPXWBi63O9L/y/B2IeP/m6CqsahSQmlAq6Jo4cFNjasaF6sox
 c7LnnNrbHZ0EmDwdMbMe5m0ghfm4gDuT3zdimAr2Okq5NwwvtuAGH3re/RmpKoWa54w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jd2oVu3+/v2qk0czNbEroWmkPwBCOjqJCPmQAov44+8=;
 b=LzW5AowNouPzbhLp/ekrkG1Z+JqlRIqmxOt21R25GGsNi25rXfwDIzF7VsNE/TUCInZx
 9NkI4SRgOgd4gK1UsuB5SOsjBQWFiwcSGFh+NcuBG/XxXHS4ovsnNUytQYk4AmHpVFp+a
 /xuAoFBTgxwt3Q0fbULXijSqFOrkNLKyG4YGCJaMLXDGtUdITzDUaqesjg6O7oDez7Z6f
 nWXkuXQLf2rGfs5wqQeI4CLuTWbzS9+VoBfpUejN/kiRwAfHhHgKkKYQZAAcMlGbQChgR
 YtWZUJzPxBvY5YkfW9xzM5m+GrX2/sCfqkx08fZxBQL/tQYlkvPyeclfxtyOEkhOZLg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70E7260672
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2C2F8A58C; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fba54c7238c0b72c8dd7f963ea8d654b3f236b7
X-Git-Newrev: c23c414f78170d023be3c4d33286cc9bad7e3b33
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.B2C2F8A58C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-telnetlib3: bump version to
 5.0.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c23c414f78170d023be3c4d33286cc9bad7e3b33
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-telnetlib3/python-telnetlib3.hash | 4 ++--
 package/python-telnetlib3/python-telnetlib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-telnetlib3/python-telnetlib3.hash b/package/python-telnetlib3/python-telnetlib3.hash
index 14c52634f5..65881e7808 100644
--- a/package/python-telnetlib3/python-telnetlib3.hash
+++ b/package/python-telnetlib3/python-telnetlib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/telnetlib3/json
-md5  c72d70acb65fba264c7f1a8ed68d4e07  telnetlib3-4.0.2.tar.gz
-sha256  76726d7a7a34163b5dbef461e9cbf8fb4bda8f4fe7fcb225f56cbb4dcf5fd16e  telnetlib3-4.0.2.tar.gz
+md5  b60dff81a92a07ceba879130b48d1e4f  telnetlib3-5.0.1.tar.gz
+sha256  6fde197ffb71cf26ad27fe2c88694d8364f4b1cc962a37762e0cf7e79b9afaed  telnetlib3-5.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  23bf24a5fe7cbfc70b962da94334649cf60a3b309834c72eb053d91d8caf60cb  LICENSE.txt
diff --git a/package/python-telnetlib3/python-telnetlib3.mk b/package/python-telnetlib3/python-telnetlib3.mk
index 7b29e7b13e..60772a63ba 100644
--- a/package/python-telnetlib3/python-telnetlib3.mk
+++ b/package/python-telnetlib3/python-telnetlib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TELNETLIB3_VERSION = 4.0.2
+PYTHON_TELNETLIB3_VERSION = 5.0.1
 PYTHON_TELNETLIB3_SOURCE = telnetlib3-$(PYTHON_TELNETLIB3_VERSION).tar.gz
-PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/2c/1f/a5de9f0f86976d299a439619417019a9674fa8662377659734dd6e067235
+PYTHON_TELNETLIB3_SITE = https://files.pythonhosted.org/packages/b2/6f/92e130274d84487c48b149f1c5bade54dae3cf535b4c7a5d4ca3e6579590
 PYTHON_TELNETLIB3_SETUP_TYPE = hatch
 PYTHON_TELNETLIB3_LICENSE = ISC
 PYTHON_TELNETLIB3_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
