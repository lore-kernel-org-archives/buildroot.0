Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F838D339B9
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 19:00:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5109684983;
	Fri,  5 Dec 2025 19:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80bT3_GOBQ6J; Fri,  5 Dec 2025 19:00:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B39E184943
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764961238;
	bh=WBXBPxAe4wAh43nFtsWKJ/VFv4R895qr1RdS2Nowxvs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kESr/PbEtTVAt+vrQmkpNZCBXI/OYCa3N4zMwRSYrm9msYf3k+dCpzQyJrwdyL7NM
	 pCYUffKHBzaFooDUcvfVfc7lXwj8/qRzRMhvn8MD4rV5Uv1cRd/f8r171oeg28KD7M
	 U3M9hZy8wNCVr0Zjcg3kg5gv58Vy8hf56wa2nn9MaLST+HM825A3//m1v07QFC27yI
	 M3yL9jAGtGsBAVQ4Y8YgbLLUHnq+s+LAsPJTWa/2Ig+ifgI5qwWQKFnjPF6LN8Na0R
	 f/gvSfotEk0Kk3tYf27yJtFOfM15NOROE+XjqZAcjtBOrU4B29whlE7ecgJaO4r1wj
	 0z9t3jvgKj7cQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B39E184943;
	Fri,  5 Dec 2025 19:00:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ECEC1A9
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 850956E3BE
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfuZo8pZCTPo for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 19:00:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59EB861CF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59EB861CF5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59EB861CF5
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 19:00:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0b1d.dip0.t-ipconnect.de [91.58.11.29])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6AF32A4C21AD
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 20:00:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33664)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vRb2f-000000001Wf-2uE0
 for buildroot@buildroot.org; Fri, 05 Dec 2025 19:00:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 20:00:31 +0100
Message-ID: <20251205190034.1839192-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1764961234;
 bh=2X7J/eCmGvx8Wa5tl5g5e9d1pP/oHrhtwoGkytPfU2w=;
 h=From:To:Subject:Date:From;
 b=r+22d6C9MD5vvJFT+1Fi/6yRl9hWkBGQ3iV/rwtqZKIVPgiUd+vSUyNEqMvJEDACl
 ibhaiLKnwbkoVYxCls5TJkB5Z5NQiMkllqSEXhbSoRuv7s1S2l7JbLQjz0HZoYrZED
 UTgHhH9QdU5Zk52GvJZoe43YyZQRRQc5xU0mdqDtKIS/WHSzMrUYqm2ANcL4y98ze4
 DBNsuLVEACR3Wriyj9D2Q5wosvULjkPrxWRD3ZsIeqWbl7c2W0UMZXsUVxrsQ5vL27
 PXukxGXPFzVNgGqRLoP+de9K/uOQzit9VEl4qG81r8uAEVvVlLYCI47CC3/4La4SY7
 7qJOMWO5kjMmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=r+22d6C9
Subject: [Buildroot] [PATCH/next 1/4] package/matchbox-lib: bump version to
 1.14
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://git.yoctoproject.org/libmatchbox/log/?h=1.14

Switched _SOURCE to .gz, upstream does not provide bz2 tarballs anymore.

Updated license hash due to upstream commit:
https://git.yoctoproject.org/libmatchbox/commit/COPYING?h=1.14&id=bd46fea025212dac5e2a218a41f971d4cba92b76

Fixes:
https://autobuild.buildroot.net/results/66a/66ac5ae4b1cd053122ccebad9f61af02fa5fe7f6/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/matchbox-lib/matchbox-lib.hash | 4 ++--
 package/matchbox-lib/matchbox-lib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/matchbox-lib/matchbox-lib.hash b/package/matchbox-lib/matchbox-lib.hash
index 8144c10258..7c2d972440 100644
--- a/package/matchbox-lib/matchbox-lib.hash
+++ b/package/matchbox-lib/matchbox-lib.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5c7795e46c24d848a2b960f3b994911165d95e5d5731e39105ee0d808d2373eb  libmatchbox-1.12.tar.bz2
-sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
+sha256  2d0c3e827acb8f95e801168d6f7fa03497e06ff60cbfe0b8ae7c5e740295c6ac  libmatchbox-1.14.tar.gz
+sha256  8e470c16b6bc23f275c22fec5ed56ca8dceca9d34c87d76d5a0c1295553f15d1  COPYING
diff --git a/package/matchbox-lib/matchbox-lib.mk b/package/matchbox-lib/matchbox-lib.mk
index 00ca4a0d15..097678c028 100644
--- a/package/matchbox-lib/matchbox-lib.mk
+++ b/package/matchbox-lib/matchbox-lib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MATCHBOX_LIB_VERSION = 1.12
-MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.bz2
+MATCHBOX_LIB_VERSION = 1.14
+MATCHBOX_LIB_SOURCE = libmatchbox-$(MATCHBOX_LIB_VERSION).tar.gz
 MATCHBOX_LIB_SITE = http://git.yoctoproject.org/cgit/cgit.cgi/libmatchbox/snapshot
 MATCHBOX_LIB_LICENSE = LGPL-2.1+
 MATCHBOX_LIB_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
