Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B131CA5FE8
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C801B41188;
	Sat,  3 Oct 2026 10:07:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id brKjVR2H7Aak; Sat,  3 Oct 2026 10:07:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D089F4111B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022052;
	b=S+dvDd0T867cYg/s2qXok8OMErONaOHkbcOb4VQEIfcEqqTtDs/lcyRIzV4ZDX6yaV+s
	 8rS5KutndziZq6JmGMWui0Mj95r4j2ktlmf8ApUH9WaFACO/hbbmYlxv0s/I2GDTSEIJb
	 n5kEPdamoZfm/Bll7zo9bNTFdEENokN+YAtOd9d/aOr67/zEyLRdnbokW+/EIta7ee07N
	 9l2mtaDSqgNmCqB/g4TWx57kKMGmris3j8ZQ2TP+vTrA0aZYHd7q9fzVvWnvf2ZagfgSn
	 zI5DQsAagHF5MXuHFe6Uwx6WTrG2WdTiHhoGwUW96HShKBihrElEyDXSHnyThp6xcgg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022052;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2j8zcxLmmLq0YFU6pKdi3NgzZhX9F5ltkwJiCDwK3Xo=;
	b=OtHc00AC7uaLop93hHN/zveoLVp30pBmgderog8whUHvwIrsrh47XqtNVehdLS07ksM5
	 ZbiBGXHGJ97EHYZNbYDglDwYFKH41QlXsq+KQNe0FozpGYhYl8wkhzZ0iGT1ab7UB2PC3
	 TBPFcNRK61u0cRO1eFYneBI0TViyp3P1/XoZoH9HQAdlDFva/ejUvbVyc72ImSghkb9gx
	 vVWEpaqZ3ZBOawYb0gshag4IRAPMDgqIYayuCtsdVkbbmNllr2RHRqY1LI0KHQAFe52yV
	 DUnDbndLgAt59iK+q5ytKEUKXCEzkfj/gp911zIHzGhV5sb3rPDGwx1C09tXYy+O0hA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022051;
	bh=2j8zcxLmmLq0YFU6pKdi3NgzZhX9F5ltkwJiCDwK3Xo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gLR2pAb8DWFqHqcX3DJ8zxHvfqognqDY3ejFTRr4GpHXX1gKUJxJN2cIqVxfBb1t9
	 UqIR6uDH8JrlI6zHU8oJhf5JGiUv2W50Wqqz7qJUFNuGH18NyRx/VT9AIR5OLtZLkQ
	 7JGq1qpc53EEvIJJq5kKKMIXCjwCyVb5HPLpl1Y85duOahV+jNZxwl+dYb1ruklnjU
	 OJ7cDdp3SpcJDv3k7kpO2bgTZQG3FyszRtoEapIOZI3HYKlR6q6/WoSvUXg8sq0X1Z
	 1bXesYYhpWM1MZCm15+Bv8w3kodlBbw+UN5UhqQtEhXGfDsizingW2/B2P1dI6htFk
	 aJem72bs6exag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D089F4111B;
	Sat,  3 Oct 2026 10:07:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C8044B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D8918122B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aMFQQzjvyuAu for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 80366811ED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=CpBFr2JjSoQnCALTTAHJjfL95ZcCw04iy7hzNwyvRTTF/3rlmI+Xs1PLDuOrYREvRdOh
 NzU+o4HteoNHq5k5OrC2CVZbllEc0v8nO97nKSxL1HzDhUQS33xKqYYQN0UOEfgAmAdWA
 M3SyAi7wyzRSYQcsclmm1U22bizJtTl5UhwSsAhJwLzA0TA0qSyBJ4cupzu2w2AK4qwnM
 0CL/Ei+6MrbTG2pR0mQuy6VouxX7enE5mKesb2OBnuktJLnuIN/FwSowgAVSwKP+ankUu
 Y+HVaW2evj+lNKTVxonKqikl0PP9KqMPdmFu8vjTMJ7zI59uHEBlRHrqrXO/biYD/Cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1BPT1OdH3BJsca243EexiESzz9bQIfNNo2LotcbV9JQ=;
 b=OAYzp+82PFPk17kWPWThbhhbSxLO7JCrjZfroHDHbv3uiRz0Pv8NteQ5kQe5MVSiFW8n
 kBw5UIYsB10s9ym1rkLEn6liNlIG1y4WJAtFvhT808QdgEyPK+We4ULh5K1C/1PxSEIQS
 0JzLNf3yMOhGibgMAwtjL3eZoX5x21tY4tcdPIrf5be+/Ia9nlZ/h2ur7+EiMY5vtzzOZ
 wgqA6hmR2+5EYwZ0aoASwk0egDTqwKi+FXm+znsNAC6sS1uiWCJYh934QJ1qC12SMFaLC
 e7UgvzfnOUk+qGk71mmWDb56dn4quWAWdGdyY905mA84sIuE5ne+SooDrflc5p/93JQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80366811ED
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF6CA88801; Sat,  3 Oct 2026 10:05:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ed53d2bc9e36e06c1ef5c756761571af443188d8
X-Git-Newrev: b6fcedf51699b064ce4c01d29cdc173df41ecedd
X-Patchwork-Hint: ignore
Message-Id: <20261003100554.DF6CA88801@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-soupsieve: bump to version
 2.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6fcedf51699b064ce4c01d29cdc173df41ecedd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-soupsieve/python-soupsieve.hash | 4 ++--
 package/python-soupsieve/python-soupsieve.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-soupsieve/python-soupsieve.hash b/package/python-soupsieve/python-soupsieve.hash
index e604cd2d1d..f2c11f1315 100644
--- a/package/python-soupsieve/python-soupsieve.hash
+++ b/package/python-soupsieve/python-soupsieve.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/soupsieve/json
-md5  8c20930a780872dafd6f22175398ccf7  soupsieve-2.8.3.tar.gz
-sha256  3267f1eeea4251fb42728b6dfb746edc9acaffc4a45b27e19450b676586e8349  soupsieve-2.8.3.tar.gz
+md5  411ed4ba0a31ea6cd7025bda680b0834  soupsieve-2.10.tar.gz
+sha256  49e9380d7d2905463583bafe285e818c7366a9ed7b3aee221c1ac79c905d8bc0  soupsieve-2.10.tar.gz
 # Locally computed sha256 checksums
 sha256  76a0acdb98c3a63681e20b6f096699ef8cad5fb35d56eef8387e0fa71d797a9a  LICENSE.md
diff --git a/package/python-soupsieve/python-soupsieve.mk b/package/python-soupsieve/python-soupsieve.mk
index 04d33f67be..1c4279ce06 100644
--- a/package/python-soupsieve/python-soupsieve.mk
+++ b/package/python-soupsieve/python-soupsieve.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SOUPSIEVE_VERSION = 2.8.3
+PYTHON_SOUPSIEVE_VERSION = 2.10
 PYTHON_SOUPSIEVE_SOURCE = soupsieve-$(PYTHON_SOUPSIEVE_VERSION).tar.gz
-PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/7b/ae/2d9c981590ed9999a0d91755b47fc74f74de286b0f5cee14c9269041e6c4
+PYTHON_SOUPSIEVE_SITE = https://files.pythonhosted.org/packages/71/c3/1b817965ac12dc002d7c9cd7dfffdd7d4fbf9b45763ef2ffe7b86ee94670
 PYTHON_SOUPSIEVE_SETUP_TYPE = hatch
 PYTHON_SOUPSIEVE_LICENSE = MIT
 PYTHON_SOUPSIEVE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
