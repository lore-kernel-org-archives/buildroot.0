Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B72CCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C218C60E8B;
	Sat,  3 Oct 2026 10:07:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nkZoSYEf_T4m; Sat,  3 Oct 2026 10:07:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7C16A60E79
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022030;
	b=ZmffrPKScS2V8ryHjiugeKT5pd5q6OMpAOD++i+WITvkyLsSXQbRX0OY3H2R9vSVvduU
	 0imQHNcXq/L0pqGa8jh5WvjZdDsoBvcT/WnXh82xTHpvWHc51DCZcIx/TwwApUsjtJMxx
	 YDjImBcxBxETprHFB4jAO/xPgNcmOxYmaJvWFptGm3EtHCygi4BR9uzi5E7TiqbaZh053
	 xURBC+uzUp34kRSZuotCXxkvHChTQFxK/epS9tq1d2Y8fgP3Fsp9E2yGZP/XDOslu3f2c
	 50cBOSfYHmsPi1NTRlMcr2LGCXTC5Pbx4ZvWDgFvwovkNTRVUfO1TeAr2OcwWuPYyvA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022030;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gXIspp1k/5XANz7FbnGoD6tTVzHZgBs1tyWxc9g4vBk=;
	b=gjpLEnC+8VN2At8VGwCLqAw8j+DJIaB4MzwskOY9L1aCRJbbfWEWtPD4nRijWdwjas2a
	 mSni9YWLyvfVpwKCM/GBvLv+tu4yN0qPr1BfUCJl6Pi1Af3aOtrvb6XoyiaonsYsWv8DV
	 zYMwjJX/aBPuM03feBCPffOCD/KZbJQDr1lax3K6c9/qvgp4iJUv89GuLjdG52oXs2jjm
	 t9ChyrkIkXkpSwyjsaFfALVbF94uey345JlElSvc+FyzYqJU4Y21uXl6vtNYjZYjCVOwB
	 W6nE8VosWXa7XMbuUOfhtIZ+iuOq8QSEaMfdsBidLwjGhXn4NNtGGcuK0fg7a6fj6uA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022030;
	bh=gXIspp1k/5XANz7FbnGoD6tTVzHZgBs1tyWxc9g4vBk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fki7ddPqBVw2IFGnW87nQTDatd7rjGLpPd97mYgJWgHD695yzzh5GfBR7JY/AJczG
	 SOa3iuLaWEn8xraPOZKMo8C/WZrm3MLBTW03KYzRsbBrEd5rodKcp7PWs09E3+6NTi
	 dAnbtAk09P5KDHQlQdb85AFw5vs4ftehcOP3/r74L1PD6Rn69Ihc/uSywSjaNYnwr/
	 U/wtzlgcu4G95sLMlmskXeXZLV5GRA13+fOkLmvTmGUEJYFZLID5DFpfhgnB8uy5Lw
	 cww0UHgjdEeDEEtPvaX94G3zlvjOnej1bYXMXFvyyypz+LZG5OHPdMuvvDpFuQg1eA
	 ALqaEsSrW8EKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C16A60E79;
	Sat,  3 Oct 2026 10:07:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 28137179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E1A68122B
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fxQ_2j9c5cUq for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 638F480DDD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022028;
 b=Aa2k6VITlhZ9mF7L3Wp0tXjHYKedlWnNAhI+9I31jvmVTKZbmxGlLT6SILQptU2Nj7aS
 X9HrcjJGGfLRhR8yY2SihWMneFRxlVBjIOHJrdV46vm889nv5H8wMONjwaNTaVGTefbv1
 bSvtAnU1IhyiSss87DemE9nGTZoOsyB0/wpEtVVyzIqQiVE11MC6OzkMy4Af0S2NyKNvJ
 hJUoYrvGMs1uWCnYiGE/8KCuT3XhmSpzco6ZWwsGiaOWtlDWu6ha8FapRs2TqKrNPaBog
 ZnBHwal24GktWJbX/GP1+XGO7hz1ZFRHoJ5frRAlJ9OpTnATspcUIkFCPYeK0LMd2Og==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022028;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=riKMMZj/9YS3iMLLTZgnYEOCKiCDzabJFj0kjxupxBs=;
 b=ahh5nbpr0SIiiHMsy7tjr5DPtfxa3UhPwg4bfNjBsF9xucEejs9RODZwxBbfEZZEudZ+
 JYMn06nxTcVfTVKZmw1mLMJX3WV02a+X51pFvq4LYNAgsmBIHeSYq2s2C8KNkCzKKR9mq
 H/LHwu7RsZDkUoUrWX8XinPrIyRNVr9G9sKL8BDw4J3h04JdbdezTKzHVIQ5aQ/1qRmQo
 jblw7fhVhIyR51nsqklSoxe+WjVCS3QiEw8FbvRoQtjsKaauze4Mb+cbnXpJXRMJpuxrX
 ock2z8j/GNQsm5JkJ5TjSKZ+Qr/pwbtbEA5FicEuv/PuY/xLJdKWgaV7sFbaAiFTKGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 638F480DDD
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF4DD7FA75; Sat,  3 Oct 2026 10:05:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 12:06:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88adb4c3c13f04af1e34b06c2c9ef49bfac6382e
X-Git-Newrev: 4d369f9093975b532983f565f1b7013d7d6d709a
X-Patchwork-Hint: ignore
Message-Id: <20261003100553.BF4DD7FA75@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bitarray: bump to version
 3.11.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4d369f9093975b532983f565f1b7013d7d6d709a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-bitarray/python-bitarray.hash | 4 ++--
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index 990dda1348..8661d21936 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  7199aad3582d77d568cd673a3477a6f6  bitarray-3.8.1.tar.gz
-sha256  f90bb3c680804ec9630bcf8c0965e54b4de84d33b17d7da57c87c30f0c64c6f5  bitarray-3.8.1.tar.gz
+md5  07b44aa7a18fa6f800bf30cbe4a6e978  bitarray-3.11.0.tar.gz
+sha256  bf19437ec00ec3d40aef82eaeedc14cf4000be9b635c4f5049796506e6630dd8  bitarray-3.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e19b1180b6ee73307a8545716be9b36318cf4f926aaf3eb43f7fde3396a102dd  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index bdfe0494ee..c803b4793b 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 3.8.1
+PYTHON_BITARRAY_VERSION = 3.11.0
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/fc/47/b5da717e7bbe97a6dc4c986f053ca55fd3276078d78f68f9e8b417d1425a
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/04/f7/6765577df59e2345036e435f7e983e1c291d67b7d76a51918eff04ad1494
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
