Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 036B1E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE0DB606D0;
	Sat, 20 Dec 2025 21:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_qtvbDOVfPF; Sat, 20 Dec 2025 21:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E69E060DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267098;
	bh=QHDxPxPFtkkwj0LCWv0PDPOXdRNDVrxyks75400Qjz4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sPOY1YSzwLZpVIw0S/aqhO4oM+v1BtXI09jEf/3/fMJ3TBNtwBEVlucfENeSlCGOp
	 qcrITwrMQ1iztRZa3ZzQ3GntUgUJZUC6PCRxmY2NX1TA6OYfoI2847rhFGNnh5vpOd
	 4/IfkahqExPbvrnk0o1G3/nEoI2XyUYdRUANHx1WMl04DVPcfGKEpULP9pHJyJBhBh
	 oUhXU5y5VWdByDkhieGQagwFu4VZPfzf8M79lmMamtEz4hXTmM0N8dneB7aY8EN534
	 2bGJConnzWYXRMb/k6VEm7T5o65do3VJOHUfCVtgH55R4rP0XZwmjjyLkmRJvD8jVe
	 xzgPi1+5raoDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E69E060DFA;
	Sat, 20 Dec 2025 21:44:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98C3E119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A9D181985
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qRwaaR8E362C for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:44:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 86A6F818CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86A6F818CA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 86A6F818CA
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:55 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ED816A4C4DE8;
 Sat, 20 Dec 2025 22:42:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-2Arx;
 Sat, 20 Dec 2025 21:42:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:41:59 +0100
Message-ID: <20251220214206.1089100-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266930;
 bh=ZRgWNKhx+wT1I4layzZO1H8WwMZFVD9JNEOFkGxSOGs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=o/zCv2A4MDGJSoqrcFCOwYrF7pvbVT0EDu7EmsPRFFzrFpGvpvMkQp/Bt33N7c5YC
 CYGL7SZOf8M/L28oWA5NVbYSCCDOySPYeDH9S+0tKuYAqZmi82Y/dTR/rA5G1A4cWb
 4s2ILLItoy+XNxzi+7DtXjlAUDgJsLGVHz40yIRp9ceFEkVh3zQ3Ki1zfEPrrBtMma
 gCh4Tlok7IA2UQMhiZjWGOQBg5UrxgOM8IN6slZpK0muq5FasUM6jzTgH/h2xGEXTl
 7iF0/mgH/qnpQMhS64zKGjsvtNz1Qx19CLtuCXdn7b2bpEI7GRCki8zW5SIRl5Oc/7
 gElS3qIv6XO/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=o/zCv2A4
Subject: [Buildroot] [PATCH 11/18] package/python-grpclib: bump version to
 0.4.9
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

https://github.com/vmagamedov/grpclib/blob/v0.4.9/docs/changelog/index.rst

Updated license hash due to upstream commit:
https://github.com/vmagamedov/grpclib/commit/069f2493abcd7734231e4071d5ecb9b83852a8a9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-grpclib/python-grpclib.hash | 6 +++---
 package/python-grpclib/python-grpclib.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-grpclib/python-grpclib.hash b/package/python-grpclib/python-grpclib.hash
index 31ff505fdb..022c9a7575 100644
--- a/package/python-grpclib/python-grpclib.hash
+++ b/package/python-grpclib/python-grpclib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpclib/json
-md5  c37be825d02fa3f3f488f172c784ca71  grpclib-0.4.8.tar.gz
-sha256  d8823763780ef94fed8b2c562f7485cf0bbee15fc7d065a640673667f7719c9a  grpclib-0.4.8.tar.gz
+md5  4dbde1ad88752eefa7bf70f1fa186182  grpclib-0.4.9.tar.gz
+sha256  cc589c330fa81004c6400a52a566407574498cb5b055fa927013361e21466c46  grpclib-0.4.9.tar.gz
 # Locally computed sha256 checksums
-sha256  6c7fa8cf9b94ad5043a6b550a0ffb98356e66100b69dd1cb8e1f82606b436e8e  LICENSE.txt
+sha256  8d61e1a3368175363c2983902aad03df636144b01144c0f82c2e9b0d41fa9166  LICENSE.txt
diff --git a/package/python-grpclib/python-grpclib.mk b/package/python-grpclib/python-grpclib.mk
index 4f8406ee69..70a0824e64 100644
--- a/package/python-grpclib/python-grpclib.mk
+++ b/package/python-grpclib/python-grpclib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCLIB_VERSION = 0.4.8
+PYTHON_GRPCLIB_VERSION = 0.4.9
 PYTHON_GRPCLIB_SOURCE = grpclib-$(PYTHON_GRPCLIB_VERSION).tar.gz
-PYTHON_GRPCLIB_SITE = https://files.pythonhosted.org/packages/19/75/0f0d3524b38b35e5cd07334b754aa9bd0570140ad982131b04ebfa3b0374
+PYTHON_GRPCLIB_SITE = https://files.pythonhosted.org/packages/5b/28/5a2c299ec82a876a252c5919aa895a6f1d1d35c96417c5ce4a4660dc3a80
 PYTHON_GRPCLIB_SETUP_TYPE = setuptools
 PYTHON_GRPCLIB_LICENSE = BSD-3-Clause
 PYTHON_GRPCLIB_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
