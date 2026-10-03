Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAC2CA5FF1
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 379DA60F0C;
	Sat,  3 Oct 2026 15:56:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEiuQ4vNXbC6; Sat,  3 Oct 2026 15:56:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3B87C60F43
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042965;
	b=gsW+jMr0pTkoHXZEVhtQOoVOEVQerkwzl7dM3rbetLV5HVfD2zzCTymiwatLTuIE8Iai
	 tdiMeYzPj2ZX4YnZGOhUZjb6CBdJEr+4GT+WCHi9xq+Igo3LeR+qOo6baTV8plS6ogTYe
	 Zolryvty8X5JXsZMIXiZ8i/nMcoyYMi5gD0Cvw8TcjjUWodyefuyguLo7mt7O2nYPO4VF
	 EmwDY2ghYAkNiW66D5KS3f09TdROnVeICnT0yO2hFtO/x0vnEe53aKHGUPTvG0FXpCE1O
	 mwsN/IVi5qF1rfbRXTKz8kUUuyR1xQACU/BT87axoJQS1OW6N2RZaSrU+JK4fGMhKuA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042965;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2VgwlIN8Q7rC1kWbpH9ptTRzHDSelF1cuZcsDusZDk0=;
	b=qhNf6jB7wqJuqz8wxT+eKWVRprsBrD/H+1AxBFRiZd8zVsaIwJBh+pSSG680K6IL57s4
	 Xl+Nl3qwqPszVwrovg8H0KBe8c9VqFg749dTvcUywZ2GAUCYVy69A2dl7YS4Ama4tP+XY
	 g/nh9DYilEVDNdUYCRjBLvyLl9laoX/3b2s7BRa1dm2J2pYQzkjE2/U936iYS47s3NniD
	 lnnVmW6c6g46zp8ZzbOlh7jKXfaq91bSaxXs2sMwPXeP1tk2RPPUOxbKe9Kg9fydxTqgU
	 j1Jnlnz1nv67b/ggcPxT1+4gM4p6QVr170ja6wjUSMrYSrn0fTXspyi0f6shICUUhlw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042965;
	bh=2VgwlIN8Q7rC1kWbpH9ptTRzHDSelF1cuZcsDusZDk0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iDZuO+mEIcWlNB7e3ai7SY48+azlJrxkYZ8KacnGzAwutKZ6hCXdNuSBm8sLleiWP
	 ZdR9IXUTDPtzaaGrvLIjBAJ3q0laq4BLSaug3J08E93sepWIu/GpaVQ39Jq/wleU22
	 lFvHxuLWah440SDeXN/uUPTNONAikPnYrMmaXH/Je3jRNWu9lARU9p7JVykjBUK6+q
	 lh6XuRrh4dF9CwwTQVeUbjNzQzVww5HQVEraL+zY5g8kgdSryCxZXh3zlOAI32GA1+
	 G1s4/2UwTwzV5BX6296SUN8N9p10YPESJENb809XT8BWJ+zSbJ6DKwT2LWMK2jyH0V
	 zNszxj3qWO5kQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B87C60F43;
	Sat,  3 Oct 2026 15:56:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E41371D2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF333606E5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0nlDsHDaJI-O for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D5D10606B6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=auydaHqQKePdRfzqzPaCCokOtVHf68fplC614ln2JIQFUBQPEiGauIzIKKNn8UU62Xmb
 hMVIwonLaexVR6JrjyBi/kHiE1wkw8JnrQyotQldXhn7mqprdWkJci77WuFzmReONKQSM
 62QKiumKOGtYz7g6SPUQTxAOjB8yT7mgphSpwqtyp0a30GX+wZvNwtCs5eeescCRJSA3O
 DZirtQr2mWY9o9IkaMPma2avPba1cNyD4PiI1UK/j6smli0UE6QXYE0clrPmWQ5vOSQ01
 61+JQZkzxoqxl1eYwikmJaqgp/xJ7AmzS2O17PwZsSbXuBqbvKvzhWQ9btqHOPKKn3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=lesntxSjDUFzDNEme/sD5N71elG+4iU8q9gjmKylpg8=;
 b=D44DIYESVPfTeEVV3I6yF/skoT66djMqH/Qxem3SYkfZo2O0S8Ar+OrHjsHNfEEddN9C
 o+RWUPsSXeUKXfoRt0sJXrXZamj7M5IOS8YqoKcIILF8GwjE3K3V+BnYT68PXlWIJZAXf
 fJMn5vpVX3hg4R0m30IW5qpdpEZXT8gO8M50fObY56TqdEo/tmUugl5GFRsQzpX+J8+lJ
 jbRiVnBgma0HVEyNG2e68uS1XNk56h29Yr2ASDyCjDAD009C6bqqi8DBEKa+0deD2uphw
 A58Ic6tpg/z8Kcf8cQzd6/2cJHrRE3C5oI72WpcEf+O/vFkhlxR6fzhdtNvi8mezmew==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5D10606B6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2370588806; Sat,  3 Oct 2026 15:52:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e325baa39cc45b350ce142e1e209a134a1d62355
X-Git-Newrev: 71c3bc921997cdbac3a83fe838906e9ce0c02c35
X-Patchwork-Hint: ignore
Message-Id: <20261003155251.2370588806@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-txaio: bump version to
 26.6.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/71c3bc921997cdbac3a83fe838906e9ce0c02c35
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-txaio/python-txaio.hash | 4 ++--
 package/python-txaio/python-txaio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index 7e729e969f..ea3d8fdc62 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txaio/json
-md5  86e8dd45a2ef07583fd85006cebd90e3  txaio-25.12.2.tar.gz
-sha256  9f232c21e12aa1ff52690e365b5a0ecfd42cc27a6ec86e1b92ece88f763f4b78  txaio-25.12.2.tar.gz
+md5  e0146234551659a952c33e04019b08a1  txaio-26.6.1.tar.gz
+sha256  3ee900b2331c93457530fddbccc1a320c4e2d7ac8f9073d01c3fbe87762ccb35  txaio-26.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  e7b0171093d8d2cec2db922db6d7634b5ddbb0338de111b38857d3160a7ea770  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index cb29609254..af996ac3be 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 25.12.2
+PYTHON_TXAIO_VERSION = 26.6.1
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/7f/67/ea9c9ddbaa3e0b4d53c91f8778a33e42045be352dc7200ed2b9aaa7dc229
+PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/49/de/52729cab9d2c8de679ad015e87f11f69e092d6fb3084eb9a39735df09ce7
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
 PYTHON_TXAIO_SETUP_TYPE = hatch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
