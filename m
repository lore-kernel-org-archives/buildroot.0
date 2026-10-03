Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6718CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8072A60EB1;
	Sat,  3 Oct 2026 10:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZvtYQ2TH8bd; Sat,  3 Oct 2026 10:07:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6FE5660EAC
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022058;
	b=AYCPuRtjMeLC/taPRViSOerkFaTfN+s4fS9S+diZVUQIXm81CTaNJci53TWSBhund0cK
	 zw703HLf5GExa11pB0oFpna61iiVabgWhPBYzcT+VVy/FMPo2qpbgtuvgsXDSC3Ue0z+c
	 24H9O2rEwcmmHnpXrSL1unyTMWG2SkHxjHZGQu1puOgnxsx2ODFxzocuP6dlftAWv1ZOj
	 HxutXEBbuGDLFD62Mwgod5XTjI6sUx4NVBcCldfAZzgZC9gUp/H/xmp65H3ME0n4IYpmW
	 Zv+AE42q+AfDJPpxi8X9Kz1J3wCotFohf7Pbl0pBK0FOjkEqTPxBKfShehpm+0VWH7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022058;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PTM8q3AGObEnYQLVvh4U1ply5nFS28nLXF+7foWodsw=;
	b=piYhawTivJv4QcynH2Ui4TmuNwL438NQ8oJOAE6gUKXGcwg9n+sxOZKTvPIvqZvYBa0P
	 A1gM2gN9FEDg/BqBe6VLVK0+v3iwkX/Io7mOs36dKlT/XN2e/KO/NeenLlPbrWE9owFMB
	 mUxCXNuCBccq8CxggkuEu7vi5R1NEC6wQsOZGB7xtlCsLAJYJznOlbMjkxJf3Yh2kDxEA
	 O+Zje8buimV1Nt7NVGiKeyEVfpCPnuMvmIeTZ2+p7TIXQ/vsBrucxa48/rlgHGRsjSpe7
	 fYDD+ecamjZkyVhpeBNe7E14ZaeFFgNZRVQJCJWt1vfuwLaNK5ssw1121Asd0oynqGA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022058;
	bh=PTM8q3AGObEnYQLVvh4U1ply5nFS28nLXF+7foWodsw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kgJQCV3wutXw7j+80imLy6DTC/uCWecX1FXEv3vC6ojWjVJpk1J8NYTn4fXs3f7Kl
	 GbkEzL/kHTLSjf2eU7uXULgnw2MFozHX6yTI8Xyv9OCA9OpJaVIRF8a5MP7Ejz9qhh
	 o7zUjF+LadMrQ8XPRjZqMqqQCjNHIHiS31IpDq0RA33pETZ0qtW/dGcnkK1r3ye0GL
	 +UV+QPET5oLwClAvpmy9toleOvmPetGWITcUDudXn98USyts4h+qQXMJu9eBM6FweK
	 OUAGIRPdoXUjfh3o6/aTwlDNXU3OMMvGTqtKUwYHnIQ4jmtm8ODeZofqGj3H8OkfMZ
	 GTscGBUHeSGIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6FE5660EAC;
	Sat,  3 Oct 2026 10:07:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CE57476
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F6BE811F7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jvquVdm3XhC3 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org DFD7580DDD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022029;
 b=ICGhwqBPtlvLUOoKsJAlQDGpDViJ8pZ5dKlN+Hw6PP1grikPWcyCU0roMxnXvvDrBUS1
 GfXB0MFymdVmQePQUBTsmYIe8YkOLFbTtE0/qvtJf/On0QWH7f/HAar102jWEh6jt2o0G
 o0nOK45t9MazQnPGf+mFTGdJZAxlWCMdSfZnDvKYmCuB20ZJrfnJ3bhg8wH4eZVlKjS+t
 snW+OEJMko4EAilZeaX/CWW9eFXwsJ5tIAmUVvWOvA/l+KDJ8Ug/i7LKJhWl3swhq3ZUD
 aS/MfUKAppjocUWkjWWjgK2EJrkvG5UA2ArDTpXOQ74R6s9ol686oIie/cLtQoBhwKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022029;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XBUl2XU1+EUoLL+ht2rlcRmjuO+h1YlQBQ651s6KX3Q=;
 b=jkgvyFWPp/mhQOvb1hXnQXyyLKwF2mLSHajShoerAsPynuz+t9qVeAGjcibVZFwtyVXL
 qYz2kHuRoNjuS6YBHiMKeJ4ljasu4zHQGg712QK8sI7uOWlzr3xUT2bXhcnvwvIp/Rth8
 urSIFLhXE4eDhdnA/YdMVzllBr6Mj10h8mMLKmtlso2AFxkiX0HPOnusfJsyVN4Id3NNm
 3rwVi2HItXz3yi+iQL26bips9BVgbRX5L5BjRCiloSnSQdgG9Gi7z1L3lBbVx0MWf1HOP
 stPgwbX7gCNq/jvmk4+/AY/+KqJuJn+7/938z1elutd3n/rbMDyu0moH0jojuTrGovw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFD7580DDD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AFCE886EB; Sat,  3 Oct 2026 10:05:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0d644bc38ed94173905ce43e4f243e4651ae8b04
X-Git-Newrev: 46cc356b6ad90627b1d47747a5450aa0922cd577
X-Patchwork-Hint: ignore
Message-Id: <20261003100555.4AFCE886EB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/supervisor: bump to version 4.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/46cc356b6ad90627b1d47747a5450aa0922cd577
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Drop the no longer required python-setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/supervisor/Config.in       | 1 -
 package/supervisor/supervisor.hash | 2 +-
 package/supervisor/supervisor.mk   | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/supervisor/Config.in b/package/supervisor/Config.in
index 8ba19dc000..370ffd0f97 100644
--- a/package/supervisor/Config.in
+++ b/package/supervisor/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_SUPERVISOR
 	bool "supervisor"
 	depends on BR2_PACKAGE_PYTHON3
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime dependency
 	help
 	  A client/server system that allows its users to control a
 	  number of processes on UNIX-like operating systems.
diff --git a/package/supervisor/supervisor.hash b/package/supervisor/supervisor.hash
index a61afc4410..43e6fea2e3 100644
--- a/package/supervisor/supervisor.hash
+++ b/package/supervisor/supervisor.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  34761bae1a23c58192281a5115fb07fbf22c9b0133c08166beffc70fed3ebc12  supervisor-4.2.5.tar.gz
+sha256  4a2bf149adf42997e1bb44b70c43b613275ec9852c3edacca86a9166b27e945e  supervisor-4.3.0.tar.gz
 sha256  4c35fda9f70bb7883fd94e5a4d5addd88ad1a6d5d15e21c9d17c4d96fdc5e369  LICENSES.txt
diff --git a/package/supervisor/supervisor.mk b/package/supervisor/supervisor.mk
index eb2a4990b7..7d6eef0cef 100644
--- a/package/supervisor/supervisor.mk
+++ b/package/supervisor/supervisor.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SUPERVISOR_VERSION = 4.2.5
-SUPERVISOR_SITE = https://files.pythonhosted.org/packages/ce/37/517989b05849dd6eaa76c148f24517544704895830a50289cbbf53c7efb9
+SUPERVISOR_VERSION = 4.3.0
+SUPERVISOR_SITE = https://files.pythonhosted.org/packages/a9/b5/37e7a3706de436a8a2d75334711dad1afb4ddffab09f25e31d89e467542f
 SUPERVISOR_LICENSE = BSD-like, rdflib (http_client.py), PSF (medusa)
 SUPERVISOR_LICENSE_FILES = LICENSES.txt
 SUPERVISOR_CPE_ID_VENDOR = supervisord
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
