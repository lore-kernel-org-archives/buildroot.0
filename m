Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FE6F44852
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 12:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F1AC82C8F;
	Fri, 10 Apr 2026 12:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKEr7Xwf7doR; Fri, 10 Apr 2026 12:56:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B0E881276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775825818;
	bh=U0nYFhAxI/u+PAnH4+vUky5fFlgAyGppifLjQN2DtYY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LPuWWdWUpu7Ac8f8oCcdIz60tCTQBgmbRleNCsQ1FAj5FhuWYizcPPi7fjCIvrBSt
	 qiOUpzfOeyTlJdpDXWdU6M5sk6z3DsOgshj0Z8H5jeYmFs/7ddJaJUhzNe2ezCRYb7
	 7ob3EkNTjltMb5p6EphLCwdXSoKKq4hagx7JZjn2ceGx047TRQyRi3mbDuVypipf03
	 jRZZ/3TglgDXO5wh+NK36rMpc8+L0ffL0K97EDTKtzZ+R6Rym6Z0hjWFF1ibEIeGhJ
	 k+vxj7vWM9Kwjme78kutQcs6lTvJl07DISM5WO0n+ayI+ms+dWs2ANhztrYdTbJi5r
	 QuG+mZ6OsmjXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B0E881276;
	Fri, 10 Apr 2026 12:56:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 148DB194
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 12:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E661D40DD5
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 12:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iS0Dr3AJTlN0 for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 12:56:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A521C40C92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A521C40C92
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A521C40C92
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 12:56:52 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id BBPlwyJUI5SteBBPlwLxgL; Fri, 10 Apr 2026 14:56:49 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 10 Apr 2026 14:56:48 +0200
Message-ID: <20260410125648.2980692-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJF6P4HLNytQyq/pomgHlyFdqILdoev4zmbP7Qn7iSY4DuzQhNdBLC6U5w1EoEscnB4Yti4My3/fymZh66EeOFyqYD0kIQvtrnp9f3bPZQDfoVZhi4t1
 x+Xa+w64YdTqZ679nmc2beuK/Gyv4v0pczajB/NSn1JlIqlJiZUWL7dopZvO45xTm3gdR0+Ld9xKo5gWt+7hF2bv5V8pIiQnhVasa6X6hvyIgZarnHrKoLHp
 F9Dg2g3m/TC8sG11xt7lTiLvn6BtccUbyhsCbljgrjQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1775825809; bh=uMy4FIp2VDRRaOJFdzapY3SCy4KPk9ga/f8fz/iYQ40=;
 h=From:To:Subject:Date:MIME-Version;
 b=OCGn3/3my/V+zmdRDU4nS+R40F9i8o0wVJwqVr2sjCOWmj8Gap3A9e5dGYPUWm4X5
 waUAXj212T/ZHgxMigiN1uVGgFzvxKV1Mqw1Z//+ifOcQf+/jnPpPMpQaBHUAl+mKQ
 B3tiX8MrTaXYENCs7tvmwaW0hmxwWv/NsR+kv5e9XQZ+9PntNDeSDzzkpnwpZ+qdbX
 oAs3MPSQJqZ9mntEyiu6zxZ7Uz34QIptSfv0ecKhkQt96Xn1BrSUblX/utGL5q24fV
 obf0lSnkD+brh4G5t8GMVykPjY/mYSuHjqEr5Obco7XwRNgDKB4vn9fZjrDn9yA/nz
 kC/y9aEiG035w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=OCGn3/3m
Subject: [Buildroot] [PATCH] package/wireshark: security bump to v4.4.14
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

For more information on the version bump, see:
  - https://www.wireshark.org/docs/relnotes/wireshark-4.4.14.html

Fixes the following vulnerabilities:

- CVE-2026-3201:
    USB HID dissector memory exhaustion in Wireshark 4.4.0 to 4.4.13 and 4.6.0 to
    4.6.3 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-3201

- CVE-2026-3203:
    RF4CE Profile dissector crash in Wireshark 4.4.0 to 4.4.13 and 4.6.0 to
    4.6.3 allows denial of service

    https://www.cve.org/CVERecord?id=CVE-2026-3203

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index 87d5781eed..7572ea8b52 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.13.txt
-sha1  2e85bc1231775283d3e1593ce700566e0dc4efb9  wireshark-4.4.13.tar.xz
-sha256  cdaaf455954b45990651ba334ddcc691ee446fcfb332e78d27b0a8451f22dc0f  wireshark-4.4.13.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.4.14.txt
+sha1  41536d8ba1fc977d0832b509af6ea65056c6fe1d  wireshark-4.4.14.tar.xz
+sha256  c9113130bd2b37919fdcf575f710469ce391960baaff31911e3288469e6a8e8d  wireshark-4.4.14.tar.xz
 
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 196ac63271..d58fa7a6c5 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.4.13
+WIRESHARK_VERSION = 4.4.14
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
