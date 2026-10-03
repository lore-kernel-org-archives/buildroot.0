Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA00CA5FE6
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C92B641136;
	Sat,  3 Oct 2026 10:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvsr_Lv5MC-a; Sat,  3 Oct 2026 10:07:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 48C2B4111D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022033;
	b=hTfeQ01ZKEtWqY7I1xOxhsvjNHYJawXR33tYQcgskbqChp3PQhMyRud6X8mXryIZ7yfe
	 QOUVGhhUfQmuow7DyNHk1GXxg+Q1s7sqDf/xqN368x5Gi63qTmOIDYJX8dIn46diMnLzd
	 GtcLLMMHn7GnOXz1nlS0UcpQ39qbW9RZhizN3rCEr9HICjhUVMG7/2Q+sE9fMAXzOYifA
	 K0/XkBcROwN1CKOGezyHAjkZp+VzTXiay815OQUHLsygQ/V28WzX6YkZR3lprF7raI7TV
	 yVMjvTrVF8psl2tTGeHXDRG6aS4tSxcBPkuy/7d2b8AsVhNBUjk9hzYRcp70UyXJkRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022033;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n0yDQ65hpPDoHC0OcjEf/F3teBJl+Rp7WHzBAzXBq+U=;
	b=hJ4PR/6MP7EPfJj+Vfmi+0BN0iJKuAAfm1oGQlkA1FLaNsEWFbz0seyy7GBFfPnCt7zW
	 bEwlzHcLcdC7VdWjQSECm17BZaeK07rnoGFTMKtUno1MPxWsLBSgU9k/jtRT1N3EmxO5r
	 2I+JfCzYcCeYzUgmUg5iB329UKlJKAyOS91SZMw+fs71SsibpgNta9yp/wK5Q6l2nrjOd
	 v3MS15xL919rmfaB00hPRF6Zrm3AQ/r71dSID70P2VG7d03T1jS98wii28TzUM8F2G9rK
	 pMgiqAvY/FtAkJ9+z7BxPtKjWp4SsKiyJ4qC/MuQ4SpyL2NU9lbfQxiNRpfjNtRPhKA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022033;
	bh=n0yDQ65hpPDoHC0OcjEf/F3teBJl+Rp7WHzBAzXBq+U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gfyNIjOg8+1zH2WAeruX6gG5SV46ZJ85aGemV976FGZbaKgOWysJzgpa20KTmO/M8
	 m77QsY1iceyRJKrmURcsK3NS5TQr6yaF7ZFuDQqqjBEa3b5kGF2omWBP2iqCmrGUQ/
	 t8jWM58lQ97IbYzun3ULxKweBtx+I2dJUHUNAOtfPLB9blwrSs6xUD2hn2uUCjTw4U
	 W5g8a+roJdLV/zpctuiRz+zK762uY33TUMJYfBcdF0yXzDgFS9I5XQBFGBe/Ft1Ixe
	 5BvjV8QYu5gXzlyAVYg8faTj1ItGL7vauy5dOk0xrYPw35rKXTtGazMpwLahfbfTqi
	 3f95Dy1DEUpAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48C2B4111D;
	Sat,  3 Oct 2026 10:07:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6ABB2335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68A6A81230
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EIl5LOt3wRnA for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 85E71811ED
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=Pq5A/1VDWBvvl08zq7jFZZxqct1ArDfDjfYwwkqFgBspa0qAkWLTj9+SL9yX6RsARR/R
 S0ANUMlbATRuTfjKlgGM14tQ0m++af1cdXSlwhg5031CwfRfsA1KsiVhgVt49mYhHxeK1
 BMDvkEwy9N6YUxnoc+gmqj+E3n/baYqVVqJl6Os1l9e9pve2rU+prjsRHw21dnVi+8xIJ
 ZIro2/3vqAhyGayJCAsmZtqXu0zqiKGkob7PPMAH/82yMr7xxFRbkg83pCnUtvhvWGyyQ
 n1lKhh3hIuLySFe1poPh6dHzA9+Slj0x72QvU4xRKJSSWrjlYBT2j+3wugoQQ7AEABg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9d/CLrXrsoJrUU4bfUVBuqHXtcQpatXWgRLBcyxib6Q=;
 b=ey1gVG/tfd7dgpaaZkC/iYlwSWSRbO6qDoGxQezkVqBOBw0oqlBhMoMakxnLVd2Dki+7
 NRdoWpwr7rHAnrqfY+hTWtwKRS0DqoMWO+dPQwxjbhZq9OVRibCc7JN+jhMQfccz1Z7kL
 0yPPVnqBukwq4zPCs/mQlmvS/7up90998hXCyW8sbMWhlirgBsIrNCnddo+s2L6xucLGB
 zsoYa0gl1ZnGjTGAMoNg0zwindlQUrvBCyi+eCMtmPnlTb8IzGcxGxmsDTh/TAl4CkHlg
 GYxjlgwGmHpM6Qz1XbdKZd8nteCso8+p+zWVUt3KZtE6CNCEsXnNQMJMkv/gtPSvG0Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85E71811ED
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E50A38875A; Sat,  3 Oct 2026 10:05:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: feff121cce8a5503f6843e1cc0cf63f31f98e3d2
X-Git-Newrev: c6d8479db6fa72308dacab4e19f00cdc5e1ba84e
X-Patchwork-Hint: ignore
Message-Id: <20261003100553.E50A38875A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cssselect2: bump to version
 0.10.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c6d8479db6fa72308dacab4e19f00cdc5e1ba84e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cssselect2/python-cssselect2.hash | 4 ++--
 package/python-cssselect2/python-cssselect2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect2/python-cssselect2.hash b/package/python-cssselect2/python-cssselect2.hash
index 65319e4ac8..5e5ae17f1b 100644
--- a/package/python-cssselect2/python-cssselect2.hash
+++ b/package/python-cssselect2/python-cssselect2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect2/json
-md5  2aa3610000b7aeabe8da9cad3c390078  cssselect2-0.9.0.tar.gz
-sha256  759aa22c216326356f65e62e791d66160a0f9c91d1424e8d8adc5e74dddfc6fb  cssselect2-0.9.0.tar.gz
+md5  f805527f3913f649c4a8933251d29d75  cssselect2-0.10.1.tar.gz
+sha256  83b0d820ef589dabaf693289b647c2f5b410f76d285f56deba911ffa75a7b9d1  cssselect2-0.10.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd97229a1d1b0f6a8b41e109f413426dbc0874b1e03746d66cc33282601c2c2  LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
index 3644bdca18..194cb802a1 100644
--- a/package/python-cssselect2/python-cssselect2.mk
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT2_VERSION = 0.9.0
+PYTHON_CSSSELECT2_VERSION = 0.10.1
 PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
-PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/e0/20/92eaa6b0aec7189fa4b75c890640e076e9e793095721db69c5c81142c2e1
+PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/06/00/2456b6b664c7a770989cbe3c352aac4eb962c938486f03a2e1255ae963c6
 PYTHON_CSSSELECT2_SETUP_TYPE = flit
 PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
