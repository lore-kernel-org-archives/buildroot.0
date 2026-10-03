Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8DDCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F78A60F8C;
	Sat,  3 Oct 2026 13:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulVPmKLSKInP; Sat,  3 Oct 2026 13:57:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9C9A860F58
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035872;
	b=sUpmpa1tJbOlD0MEyANyDYzbkJXysyjNplU6ftbsPo5yhlomSVTQTdwtgSH2b1USgKkD
	 ZIOX5qHulUIjmpGq0LA2az6YvdP/1b3Z+KC6mJxu+vOlGnq2j1eDqM2MDeQljqZUsGQGc
	 IOBzKESTdXPFEcvTBg6zwqLd7vfpn5R5xWv07zG7Wko7u0IQJbayl7OIcc1HbgDUwEEzX
	 1Yjiat09LYN9702JLnd4pEkz+2YPu3ZyNr186ROP4DdCa1l8ulMysZIElhFobQkUliuIw
	 SlTU6nkjM4fYio9M/3d5VzrVBOmq0V2vl+LvRPBQaYLAvjO6onfKHmcAitKD2Gc4MIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035872;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n8AzxyruriATQkC3C+VGbp5V6s73KVbsRnlJBcVtiuc=;
	b=kbocR76zmp4V+aOoFZnqr4vQ1kj/WTkg53KiQLKknv6C2vmmsd0AkIdGELjQx9nXOVAb
	 1icaeDGgPtQsP8CjpLeGDu8qVeaHztLisD4q1RiaQQLXy4tmkX3Bsin+sewDN8KQq7onC
	 V+SaQznX2Nw1zHGdrMpQloEKXF3m8srwEq71tRfBy50TEFGMiHmfZea1I2D5osKCj9mud
	 3ZevgHiFCYFC63/4pGA7uuTXUFxd6JkhMf7FKiApMsw1wJd0/f6On0TlfvXHOZBwc1qjQ
	 tpwaFS5l1t4Onhs307IUmrJ9aSuuktQzsuOtJ24AQRNg16aMig+WdYh6RdaEMRKikhA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035872;
	bh=n8AzxyruriATQkC3C+VGbp5V6s73KVbsRnlJBcVtiuc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fiF36Rj4vDPiCLdv25imU2oC/+o6eOyNzM/UfcwdbQOcOX4KdQfnhidQ622AANfQY
	 NNvi6SzcMFKRsDP6DE7amqtZXb0R9XzvwxiVAS6RsPcFOx1878kWVsPN72DcUATREm
	 VL1L1QNXQ8bQMRiKv6A/ksMKLT2xR/iiPUJiPmWJYVvHOe01W4xndqJe4d0GWN/O22
	 LXfPOjNEl0F08dVmdtSnukAE1BUpW+9k3H1hP5M3m2ZkTrCaz232edJgTMyvCRgTlW
	 BrvCJF+h5AIeZO2udGJ1M9LMwbQZ57QR5uaWAyq2qWyxHFfoQBZc7guT1KXHyYGPBb
	 sqAG0Sz4xI7Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C9A860F58;
	Sat,  3 Oct 2026 13:57:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 38F6D4B7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FCEB414E3
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9LGxnWjyrfqv for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C0DC4414F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=cEV8+N4bBjgeL5JbJ55c2t8CFX/oLlp0y1vLkGZGQDnycxQsAPNLjoAwR7oTUISN52Bf
 Nvysq4S/pJpdsrd5rQPB0rbQQ8Bsg7lOwp1VcD3ScDD7wx6z+KypeAUXBw87yb2IdwvXM
 uC7aNwKslynNZONQLOJT0ZcjAwGVTRGaZsz6H3Hce/o1MeoZd/gxw8dmqRvhbxmCyCZ09
 QDXVo8POoyghyL/aPqmSNTfwmNu40DbxC2e+1AWPmx8yUo5GpZGIhbdDkhFZNwdksn1IS
 4IE3BnF6tbOYTV9PyRUGAdQbh+/HVI8wyEj/ddJQmk4YFrfcALpOvxQdwR/ndHcb0zA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=6uhCYLHkA7KiANem95S4G7P8W+D72iCBrojW9UOHGMw=;
 b=GlFqRfOKxedxkK3B2y92y756hWgZrG1l7qwF1gjiNXmDPuJWTqK1N117i3mrLOHUYYGF
 ClDaxmBHyy0oIiL4HdQRxH4gaGAqvUtCWbx1N8p7kvylughpfOtS0Af52RDoRvR+RoGwD
 5GuMdRqodn8z5Oi7QOoTqm0HyraUl6BtNjgIh8qbS5wcR7m9o36tzBDESUTGMHc2V1TFV
 nxFx8YaYiSQ17jW9QTXkMyjW5U39WHZSB6a2cjc0Q6ytRQQb0Bkjsib2t3ukNhI0Uu6eF
 fnZlnAavJ2eX7kQSCiQQmSQ8pQOm+3Dpl73T0v3nvb4xgoPOwGbgfSK+cZIKnM4YYJA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0DC4414F8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1769B88731; Sat,  3 Oct 2026 13:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:44:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08904d2a3d56f5b96035b681146eaf8b7bf6b422
X-Git-Newrev: caf8356f76c5bdea2b9888f732b22032a9a0c5f6
X-Patchwork-Hint: ignore
Message-Id: <20261003135542.1769B88731@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hatchling: bump to version
 1.32.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/caf8356f76c5bdea2b9888f732b22032a9a0c5f6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add new host-python-tomlkit dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index 8443d4f412..82a28deb79 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  52ab8110a3a114ddeeb7dd82a624ca53  hatchling-1.29.0.tar.gz
-sha256  793c31816d952cee405b83488ce001c719f325d9cda69f1fc4cd750527640ea6  hatchling-1.29.0.tar.gz
+md5  537991c82a1c02b1c5023fec65972966  hatchling-1.32.4.tar.gz
+sha256  c4468f73144c054d2aab4ef0f0378c43b9878bf07f8ffd6b79690e970d375f07  hatchling-1.32.4.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index e82cb8d5b4..4a116d8837 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.29.0
+PYTHON_HATCHLING_VERSION = 1.32.4
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/cf/9c/b4cfe330cd4f49cff17fd771154730555fa4123beb7f292cf0098b4e6c20
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/f6/97/b5312f01a8c6daf729a9d272dd442e0c546dbcc630495788786c4b567ed0
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
@@ -14,6 +14,7 @@ HOST_PYTHON_HATCHLING_DEPENDENCIES = \
 	host-python-packaging \
 	host-python-pathspec \
 	host-python-pluggy \
+	host-python-tomlkit \
 	host-python-trove-classifiers
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
