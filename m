Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B08CD8CA8
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 06:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 841BA61C86;
	Tue, 16 Jun 2026 06:28:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSMxccZxTSI8; Tue, 16 Jun 2026 06:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABB3261C87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781591286;
	bh=fxJH2coObFw4fSI27Dd6rJcCsVnjGNFu+pCBPPmobqk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gu/M66VJpoFb7ubiQQm6+y256GDtLXnOEzflEbpSfaGoQntIjeoBETmGiPolIDDEQ
	 4zsIMW2Mpq02BqM7oZLFEGI7VQn98yf8lJoj5+DkTiWWoRHPRnAUrMiBsbslwIgD41
	 t74odP3f7I1iOWMAzWjI1iMlF0oyBQLlETUVtRQ7IMnv1bbgracUQ+tG0JiT0AuOIa
	 cgPAIBObnpkeCr+1H86lAPAU2Va8g8gMIJvp5ZhyRiOM/MrF4K7NBXagd79wtgEqTz
	 jDLyO9UfWLxiU4VLMoxf461+7nOlKJV1eu46j+T/yXKjDjc2nNrgdsPS1NUvbgevVt
	 3z3ngPYhmduCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABB3261C87;
	Tue, 16 Jun 2026 06:28:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BAD32F3
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 06:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F154585094
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 06:28:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlRZb9Mn50eU for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 06:28:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 598FC85091
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 598FC85091
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 598FC85091
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 06:28:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b12b.dip0.t-ipconnect.de [84.161.177.43])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90B12A4C00BC
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 08:27:59 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53838)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wZNHD-0000000057e-2oLQ
 for buildroot@buildroot.org; Tue, 16 Jun 2026 06:27:59 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 08:27:58 +0200
Message-ID: <20260616062759.1188404-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1781591279;
 bh=jXVKxwwVRqNNJkTkBc1y3LX0cbbi/xZZ4fxkcFHd/9o=;
 h=From:To:Subject:Date:From;
 b=kNBPHlPHJMEWYf9TcFul4CUTRoMM6fYNlbJyX5vx8NymhTghFbR4XS1tOHa+6h56i
 bj1+wZaeExi+11IZuMKHDTHZ2UbnBb2LCSBo620WnQr4LMz5UYj5o0lWC/tYfjAcyd
 3UmzkK8tmlKt8a0WnVOwPBxf8oRKfoAXqAdD4677+1l95zxLqRawbz2xO1FR1MHNzo
 DT+CnldkOae/EB95LRtQNE2V9YN/pAs811BvklabCG1UCM6prdZPzXcMgH86t+JMQd
 f3YvRo7YntXAaUt04AaPoXuNMYiuwbONediEA7tc/cr1Qx3LyZVIGsQ+6pgsGaclXY
 hmNC3HzmoZWuA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=kNBPHlPH
Subject: [Buildroot] [PATCH 1/1] package/zeromq: needs host-pkgconf for
 libunwind support
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

Buildroot commit 0d0ef33bb74a96d9bf05bf3e36454a808175cfc3 added optional
support for libunwind in 2018 but forgot to add host-pkgconf as
dependency which is used upstream to detect libunwind:
https://github.com/zeromq/libzmq/blob/v4.3.5/configure.ac#L1065
since at least 2017:
https://github.com/zeromq/libzmq/commit/88487e7da3e0412abde30af2855a667ab973f9fc

Fixes:
glibc: https://autobuild.buildroot.net/results/60b/60bc013765ccda60e855026844adcc60192b04f4/
musl: https://autobuild.buildroot.net/results/04d/04d5f11259728777af3ece116a7f2be8478c1a03/
uclibc: https://autobuild.buildroot.net/results/a7a/a7afbee4dad9a7ee56c2f5c83ad994360ab99c26/

A similar error occured in 2022:
https://autobuild.buildroot.net/results/678/678046395be89eac3ad25cb9a4083a6418fec861//
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipeline passed:
https://gitlab.com/bkuhls/buildroot/-/commits/73a3d5c173f234e4f4626bd64895bf599f15c8b0

 package/zeromq/zeromq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index f1a1f02f9e..359b767908 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -93,7 +93,7 @@ ZEROMQ_CONF_OPTS += --without-libsodium
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-ZEROMQ_DEPENDENCIES += libunwind
+ZEROMQ_DEPENDENCIES += host-pkgconf libunwind
 ZEROMQ_CONF_OPTS += --enable-libunwind
 else
 ZEROMQ_CONF_OPTS += --disable-libunwind
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
