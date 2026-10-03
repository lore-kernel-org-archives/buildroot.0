Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF3ACA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60EFE815CE;
	Sat,  3 Oct 2026 13:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7JLBQS_tYq-i; Sat,  3 Oct 2026 13:57:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F36A28159C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035860;
	b=gAW/HT0L4MpsEJa51FkWpZ/WlM8umft1YGbP2/j/bCyzLeWR6RFDL3uN5eHvQIthl7os
	 ja2o4T0U/SyWrqbJiQOmku3MtYZQoJCmvsDlJ4MLGqtRg2HshBTJe2kf35ZoZ4d+zdpcO
	 QnG+Rms5wQ6NaYxFQArHs6NEMjJGmQKR1LIhE5P4hq9WAM26+riFpys15lu164MgePf+D
	 HCO1MOYRSReUXct0mLwKBeGaUyT7W2MmZtYQXQaCI5a4QQRHm3k+PKtCRR5ofrqMQa7Mw
	 RAQjohg+7RHHP8yziSYBB4uslK/8QWpUYDAdwb9BTV69ASoijroIxgvtn7jJPQN9/1g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035860;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qe3gHfY09+t+UP3v6i884p62QF6O9i2TN9kbGUU+X84=;
	b=rco0ZQbdEAad+o4EtK/aZW8qaODv9VEfppvszj4sq7bW0b+LWVr0IbH+ttcoTglW3IaS
	 XQN3p/aLpJloHk7Wym+NRitpzsvPJ6S8yST8g3eTj6BHriNHS4lzTy9ifcX+gBqYnno83
	 jrItBxQyT9GtYPKih2JCagG1FGR+gImswDgiMcsQhVveHcVWZq5tGIxwDDI5FaTfmEO8I
	 D0PgbYxngXFllAk2gCW/09edEjG4/8Ctxxdz8zgDRv+CKiU9vneIma+e3VtTCldgRbOur
	 b6yNqlpjzgw8Nct9jql1AG9sd7D20wnLwt1du6jdPh+sLRR5LlNYlrikzNCSgL0b2nA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035860;
	bh=qe3gHfY09+t+UP3v6i884p62QF6O9i2TN9kbGUU+X84=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DHm1Z3zYAvsh/Fv9lARYDOdhs9MHHkq9Gr+wdslFKhEqvd9i/ekcJZLRcBEGJeHs7
	 LG90S7FobWF/+1CU57+UpYvWK63QQpp5BNr3nI0kopp2OvCUAx87e8Q02Rrgh0ju9M
	 kbtRiqIwBo0Q6sORR4VBee89RNdQTnSiTTYwmHwE2zawEIucRjHx8wAeW339E35EP7
	 ZQIHbFgnWVUOTb3KZNofoiJdyg5nOK2BItVxhvudVBvbsTR0tNd2OrwpmmC6CCtgSJ
	 bhoW5ZDPduB3nABrcy+sawbXwLlgrY4HbYq49S0jYHVQx2lag3HuDIVT6DVba7qtij
	 RJkNqvRm3H9pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F36A28159C;
	Sat,  3 Oct 2026 13:57:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AA42A0F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6E9841502
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vl8dBUNHsxBZ for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3AAE0414EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=DqsO1NHB9WCN4ZlgvPV1oUovEcoXOlEI0Yjse584XrZvXloO+r0D9e2T+wYqqhAkGuZZ
 FBKPIxr3TQ640XJe6KhvNVVDXqjXOl0DMisDsfQc7Nw+RcTs7nFetoOCUQ+qtT5h/T9zo
 WYqTdFvP5BPc7262BkdtnZ4NBmOI6z35sNypUDb1gofAkFI5AeKK+ahew1Q/Ve9+eVeEI
 HgnMfXX3cygJJLRDjrTppSw0Mjjb5pkJbz5WY53y3ib4TmV55KadEHndp3vPw9+MVfzhD
 M4/ZTUg9SLURlByn474wFSUx27BMM6B9lohJWban9URu/Kosg5dRhJBr2bZH/KsSKiw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QW6yAiA8lZgm0noVvtxC5xE7mn6sl9TSz37hKPEhrQg=;
 b=LUwv7HqqMVUK96ssHlIhti762yKmUhh8xGvbHCle922loQMSJix1ZDGu9JzSyrF5Dd1b
 mBTAgX9LojwrSNM3POxg8SZCetwVUIpRGL1+jDZwl0VNDlYb9RaIW1oJViE6wn+7UTIgh
 SuW2ct4O/L2e+xpD840c/3yuA/XleLintbtgWX47aOEEoXMKfEgxCMLI7NxmJ95Ytttg9
 tDrwqaVmDNH4LQliQ3h1T1wXf2Hl5IqMV3P4BJOlHaRokCi48rd+JEmRZbndkY9fK5J2L
 FGsTK9l2pOeCQf4gY2vtX4TBDkTD5ZLX85xtL722hD7oYXE2vj0Hp6K3wC37tNU8T1A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AAE0414EE
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86466814CE; Sat,  3 Oct 2026 13:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 16eae3c371499b2679388ba97fff9b4a9b44b0a7
X-Git-Newrev: 827345fb5544e7aeb87addfcc003615a62342623
X-Patchwork-Hint: ignore
Message-Id: <20261003135541.86466814CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-starlette: bump to version
 1.7.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/827345fb5544e7aeb87addfcc003615a62342623
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index bed49bf689..840e0330f4 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  2d1e880ba9520c487e52dec610a0dfc5  starlette-1.1.0.tar.gz
-sha256  e83c7fe0ddecd8719c5b840080325aec0260acec86e9832899e377b91d65e90f  starlette-1.1.0.tar.gz
+md5  09363df3ca97cae1eab654fd0d2e8bd4  starlette-1.7.0.tar.gz
+sha256  c79f74ea63cff761804fbbfb182f1e0b440c2d07b164d24700c5a1bab5d6ff5d  starlette-1.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 20126e11ae..732085a132 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 1.1.0
+PYTHON_STARLETTE_VERSION = 1.7.0
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/95/66/4d20cdf39a8d6a51e663b7038e3b828ff211d3891a43a713fe7e4643f3a8
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/7b/2b/3850dc6bf7ef71b088962eba31dafc6cffd2f96e577ebb0bb316df96da3e
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
