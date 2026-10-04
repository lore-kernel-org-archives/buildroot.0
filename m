Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAD1CA5FF0
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 251EF606D4;
	Sun,  4 Oct 2026 15:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xc3qg7XICTQM; Sun,  4 Oct 2026 15:59:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3DFEF6060D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129587;
	b=isCDZACInQxilGOCcck3GPfU5SGcuPuaVdSGqHr3Ga4s5Vv9ll3XwI4Xi9EG4LmWnzQv
	 SAadIouTpB2ZBsHN6Dzz+0Zu730U/nV6ZQEMq6f1HReS9XwZgMFpN4+pTrU+DqlUd1zHT
	 7+M84DdeUpllBsy0++4ixmArA3yRzxm2epXvj1jMX9B6p+4iKdhwxaBQnCwT0xVAJ5+OW
	 I5D4LUJ91coq1NUceM/evTKRV/17VecCy/aSfzsaZ5ejXXn7rPgmT1ZSsAP938ZV+HD7i
	 NRdO2+3lvr0Ba9Pcqz7thx94gZFVVj5vR+ta9MAGtyMmS8P0BJhyqB+W2+Ut4qSnIWg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129587;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Piaug3F/htSKoWc9GQ60cc3HXsYDdHI0ZfyRgAOEwOc=;
	b=AL2LVNxW3oZYB4YLAvhOwyGI2QUXU7DiYYSzplVhU8aw0m29dg46KMVtkuXCAv1ewOYG
	 iFMzMLSswIeeQYTr9H4/1BUBCaPylhPuDALe4NPw1tQ2JgU6zIWmVCSbHtUIRjSe96nan
	 5UU92958KlSWDpmCiFpL2+qSh92FLKtB1zLyTjKls3Wvn+VhJK+/DZv9W9C9VdRXkgR6p
	 l4EU5TXy2XvbEDRes5mtyfAHsaypujs0A/rR+fxrxCGinhBJalIp4nZf8mqNoDk4GJfLl
	 Xu8u8gLr8ASIW/29d+nT4i6vtAE1yeq6kDBYsLpaE+QrhF8ZSPrimvKuO/D80Ns1rQA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129587;
	bh=Piaug3F/htSKoWc9GQ60cc3HXsYDdHI0ZfyRgAOEwOc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ddhcav0RxOF9u2xph6YFB7qdKOOeOinDR9n2konMmeKbsEb7DP5jaI5Q8Qm5cgTBB
	 m3usNeQDUx8LCY9km9QWgskaP65EAB7sHBugYZUJGecdDJq5x9255hgRh45xsRakcG
	 aiUTXxWWi8hHU6sCxO2fxN+8bQMrrdQnOXID9Aa8//Op7T2V/ANi4+ghtPpIEGPBZM
	 +86ygVZ0Hc4P5zl9lIbc4pVPpMu+tsdIFnUzcy71pwErDejUrMv4HY/YT0SrFqy+jN
	 6X1f+ALq8oYjoJzC/AJXDPygqi54CJge4uHKg2mV7tEXmhlrH7HQ1H+PBB1bJp14M8
	 T4eSHH2PJ52qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DFEF6060D;
	Sun,  4 Oct 2026 15:59:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79CF632F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 660AF80ADC
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtDeAJ3JKtPU for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BECEC80AEA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129573;
 b=q/TksnOajeB0/bY5xwInL90dRyaV+ynWTaiKV1lfLfDREYqGWXIgHHWLawvU874nsgv/
 1lzvFy4WSSEQt+lnAlJRQD0o+QS6X6dNiZCglOLq5uyQC7UXQ6bC25YG06594oEw6aR2T
 4/53Wpnm+Q1J4mwonXDyWc9m47On2ueJ+ZbDjaLss/8F4kLf/P+EwGid4ZhAE0+7CbSqJ
 lQFFANQSIZ18x67HMldcUz3gAY5EIbgi5ZGke7/4+On8yNab04Cd4JiuQPnr3l5blD9mn
 0XwKzyAZJ1yG6uBldW6vo+vn/mozcHTelV4jeqGSGN4lXVuFIFn1/KSUp37iBP55TSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129573;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/fsRil1L03P5kwHIm+CXpjVyuf2ej3n5ejHooG6B6Vo=;
 b=Q76gJxAAcRhvkqnOFmMmUDaAVfaIHQmWOdgeyjAWQ5NBRTR12S4uPONKiDHWFr10b/X+
 eN/n6jmlcfb2bOMP13avvlykqWGL0gkclfALiHh2QLLmIOEzQd9VoC5S3Ef9YO+H9898A
 5+rWRpD0+OQaswzF3XT+jou4s9EEW76NZLpi9bOOU2DpMgjbgyp0t14r9zWjm3hH554eA
 KdSwwMGZnrt5uIL/V2+hNNPWRxx9NMwcI/CrJXZMN4hZvzKYJWS6qM3RkH1WJ/8ITznK8
 vtWeo2PwwjCFxfx1Q9LulzEWp3Pa0Wjab6SDe1wLgC6Ba4XJK/ySy/UdwJkuX8Na2DQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BECEC80AEA
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:59:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84DF58B6AF; Sun,  4 Oct 2026 15:58:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 17:57:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a42589856a80a422fdf9201c846c77021f957d17
X-Git-Newrev: 6738864261aba4061b99f0685a1a77828393dcc2
X-Patchwork-Hint: ignore
Message-Id: <20261004155818.84DF58B6AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jaraco-functools: bump to
 version 4.6.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6738864261aba4061b99f0685a1a77828393dcc2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to the copyright year inserted by
coherent.licensed:
https://github.com/coherent-oss/coherent.licensed/commit/3b3a6b658d63ddde59499f8ff45b505abea3eb9f

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-jaraco-functools/python-jaraco-functools.hash | 6 +++---
 package/python-jaraco-functools/python-jaraco-functools.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jaraco-functools/python-jaraco-functools.hash b/package/python-jaraco-functools/python-jaraco-functools.hash
index f43efcfd84..d2a69410d1 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.hash
+++ b/package/python-jaraco-functools/python-jaraco-functools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jaraco.functools/json
-md5  501918900674199182b1bfa39db200b6  jaraco_functools-4.4.0.tar.gz
-sha256  da21933b0417b89515562656547a77b4931f98176eb173644c0d35032a33d6bb  jaraco_functools-4.4.0.tar.gz
+md5  24f0dae58bf6fadad9340a29e2353b56  jaraco_functools-4.6.0.tar.gz
+sha256  880c577ec9720b3a052d5bc611fb9f2269b3d87902ef42440df443b88e443280  jaraco_functools-4.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5a57cb4db85e2a2dd88c290628908add57e3451449e0a9a71fdfb38776fd759d  LICENSE
+sha256  9755a18519666e5f0f4cae3daad3d7012bcae48a600b31237d75e9fe134e6683  LICENSE
diff --git a/package/python-jaraco-functools/python-jaraco-functools.mk b/package/python-jaraco-functools/python-jaraco-functools.mk
index 397d5122bf..2e144f0191 100644
--- a/package/python-jaraco-functools/python-jaraco-functools.mk
+++ b/package/python-jaraco-functools/python-jaraco-functools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_JARACO_FUNCTOOLS_VERSION = 4.4.0
+PYTHON_JARACO_FUNCTOOLS_VERSION = 4.6.0
 PYTHON_JARACO_FUNCTOOLS_SOURCE = jaraco_functools-$(PYTHON_JARACO_FUNCTOOLS_VERSION).tar.gz
-PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/0f/27/056e0638a86749374d6f57d0b0db39f29509cce9313cf91bdc0ac4d91084
+PYTHON_JARACO_FUNCTOOLS_SITE = https://files.pythonhosted.org/packages/6c/1f/c23395957d41ccf27c4e535c3d334c4051e5395b3752057ba4cbaec35c56
 PYTHON_JARACO_FUNCTOOLS_LICENSE = MIT
 PYTHON_JARACO_FUNCTOOLS_LICENSE_FILES = LICENSE
 PYTHON_JARACO_FUNCTOOLS_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
