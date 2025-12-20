Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169B6E668B7
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:45:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E357B606D0;
	Sat, 20 Dec 2025 21:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2MWQbF7rykTc; Sat, 20 Dec 2025 21:45:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14D2460E0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267121;
	bh=zkhMkXnekdisD/doi8OzlJA4tD92mk6zt1I2KKP7rds=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=MaWzNdrSpq66bnAgmgjaHrrdlkicJkQaQIC89EvyxmULL7zS8z06gIoWXBBcBkGc7
	 tKItHHbCTJRKYtmIOGDbq8iBvdCXBzjB37TJBk+bNZrKfJimRSmon09rE3UOTS1tBR
	 iAT6XK3VYYa2C5HXOEW2tkyHSj2LZnXmnXuraerxcUl2mJXZnAVN0PpPnYGuvS8iV4
	 ejLMaQE/5QgwejLtcXOtQpGxJWJhIWBpRkKBDjm3kIYY5w6bhc4nC7ddKNNJI6Zj9T
	 OfjwuCSPUopE0p3V9HRiC8ld0uxFKGeeudKUql9J5EMLqxh5vZ392T2N01GnU9MQXn
	 k5rTmQgnDIHXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14D2460E0D;
	Sat, 20 Dec 2025 21:45:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35B2C119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27E56406DD
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HaW-aSn_6Llt for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:45:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 254A0405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 254A0405A3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 254A0405A3
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:45:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F4DFA4C4F66;
 Sat, 20 Dec 2025 22:42:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-2lh4;
 Sat, 20 Dec 2025 21:42:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:42:01 +0100
Message-ID: <20251220214206.1089100-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266931;
 bh=Ot0O1IBwOXtoXPR69YInvDxANN843OxgkYajOEMPWvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Zl+YuVRImwriwxubDydsUvfE8UDo834naKgLUTvSZUz56lQih7sjQg3uQHYZ4zELV
 +nrr4tTVKpHA9uoM1EbBxLaHU6QVnRLzzEo+68JGh0+kER5V6dENL04+KfNh13cO6X
 LLxFaHwXLRh1JLgCDzMRKi2s0bDEwqcOqJ/vY5bRuRAtvDEXMtrwzZfuc+9fHqLmOF
 xyKczP3Wezx4wu2sRWlHFwQfq6MYwTDTEClGCaerlCV0gxY2VvHJk11qbC5tPshd+C
 wLiAin/GrSyu4KREcJ6F7WBXy/09+JACsVMx0/uqeeIXB8KIIqEYhnHNEbConFuGCu
 VojpYKaVC0JxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Zl+YuVRI
Subject: [Buildroot] [PATCH 13/18] package/python-boto3: bump version to
 1.42.14
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/boto/boto3/blob/1.42.14/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index f8816bdf1f..ae99b5092c 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  2dd524bffeeac5d9ee37f8ca136558fc  boto3-1.42.5.tar.gz
-sha256  e3b7be255e5e29272b6424af4417005384f5a3f1caf6ca3352258ee1d9b8551a  boto3-1.42.5.tar.gz
+md5  8abc4bb707739d3ad3e9fe14b42d5234  boto3-1.42.14.tar.gz
+sha256  a5d005667b480c844ed3f814a59f199ce249d0f5669532a17d06200c0a93119c  boto3-1.42.14.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index e3da232e51..9ee51b454d 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.42.5
+PYTHON_BOTO3_VERSION = 1.42.14
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/8b/91/c00b45b5ca95184f7ab6140f586ba7d23074168ee3feae3eaf6954cc11c3
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/09/72/e236ca627bc0461710685f5b7438f759ef3b4106e0e08dda08513a6539ab
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
