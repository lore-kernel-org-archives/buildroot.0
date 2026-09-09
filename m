Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92665C79FAD
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 10:30:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B24C06075A;
	Wed,  9 Sep 2026 10:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i9OECrFVQuJD; Wed,  9 Sep 2026 10:30:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 52DCA606CE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788949804;
	b=qfkLhqDsxLM7tKsIKqHrOz7t8f8M9BDm2078dEwV3lFZIFnFteyOnXJJqeJ28sYKf7UV
	 q76O6Ol0A0ykrCEkB8u7fXZCPgaucZ29xtwYgPtOCIwuT0qsY+t0IMWzQJ7ix62KEWovo
	 MJ2LuXiOc4HNybKSZbtLbZwB4A2DmhUiq7MnDBmiBfHeUGRUmC20BDFysLULfRklx+h3b
	 IP89KVc1bOtwZ3GQJNSF3O5KzHak3Yn3xNgyHGL5VIEn28wSjS/BZvpJY/4n2r7kgYRT9
	 hZrUj3b1p69o0qIAExRjqCQ5eDR6JxmwBb4vBko4C0zUR7Lwqj1Er7fJy8iGWORApKg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788949804;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=34YavBMru9M8VNItgidvSPIMn8HPsucfy81qJcwXtHU=;
	b=YpAUjvbD5Yy/rrh7ecpziS/Xy0sjGYuCZJ8CRJhV72XLsAdehOeduGr5RieRCklRzjNf
	 J4QvD1tMuf7gxVx6oMHuwUQEeqOsTj9oaEyvruJac9qLBxw6iHnNf9ywwExG+5HQkAscY
	 oIo1Lcq3XDrcjPR2l0i/97UxHQeVmzs3ox7/O1kQ+NIBrkEjFOPT6gXjmppOQiMtFUWdw
	 ImST9Ie5JEraFzNZV7QZERV6HhEAvTjx0k01f6p4smApboGjHt732nxa3DpUXXL2CjxR7
	 8dBOomLARJVn9S14pTxyU+XM4/jPImConZDHl9Mlb93rai8GSNeoSqISM+IhaFqRVcg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=o6Nb56iO;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788949804;
	bh=34YavBMru9M8VNItgidvSPIMn8HPsucfy81qJcwXtHU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=F/+VkswHLqqOMNeheUIqOv1Hu7a5UBs3CdK0bCHoEu+KhuCCxY9ykNRznuOWEkNkh
	 UA6gjzz8rutOZqp6kLDGCXlu/bU46eS6hDyfjEI5xDb/pnjM/Bkt0K3nBiXea4kjh2
	 rLVelYUDnZSCPu1OtX2NJuhb4U3wmzN6Dd6eTMx8i/3mRVxhjiQSgAp3MJXMTFF6aE
	 pFZCaSx6N1ANCDoEaPhJHlx/7XS0i6G3fS1Dz2bNixAkhhM57TfF0bsnpIFviMUaDl
	 /tZwDXdlhzinCd+zxX3aDWVAkS+W2vWlv0AK3UBppQaGfz1ZJcT17orP8AZaZ8uIFj
	 iOECyYM/68SRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52DCA606CE;
	Wed,  9 Sep 2026 10:30:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3ADC52D2
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 10:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 202AD606D3
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 10:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l8Ps90lFn_fh for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 10:30:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A74DB605E9
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788949801;
 b=LrYy1RRTi8J/PsXaUARQzzv3tfg0cEjbHbwp6NNO1UAQGETRlyFJE60ENCu1LAuyOUtr
 CBH+FwEOsm0EJ5ggXeoWbH131PkjCJRQbnuYoWBjlD4vyzooMmtdkeGZdnjWBzwyIwFSa
 CbRaJe92OjeXvDGAQRpl1wNyyDL3AL2kI0TmIH8vc8cxp6toN3el+NUXoZzuFGsioNWf8
 1XHBW1yHzLk6sMwdKFtD6wlD9QHW/yBKPpoU7sHsgeZypU3//0YZhbgMKDueoDvEC1/3a
 PcJ5UZDjY5zJ+R1ZKZ4rwcGR/i6PqeySi0nCM8tghR+9Mqj25Eqy0VkL1WO+gBtTLJw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788949801;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=f17bi52APe6mh6PFu6BMtAspAcZxyGpHtUDHFkwdB2Y=;
 b=c8xEvvxuNmqBa364r4eRooxvmE7TSeAgI3tRXECe2U9afD1GULv3lIAQMsTnAvYs52v7
 gRSVyLcySJ+Vtq43yr6V6bvLqmpBxa6gqDUUOsY/D1m3Vf/cbseivtBDbiAdLVhlsTYRS
 m9NHeEceR70UfnLiPpvf+Dj4DJmfXK0/zx7q7SvDo3cBlC+nhNAjJqlx9kcLDhshv+rx7
 A/F1nSOOZdUZi0etIJFNDNKDLkqJ6PZ+VGD7CVQAXRgoK3VGpXsWH4KUBgAGGMBrmyvHC
 KdX+PASaph0t2/GdHAl8LMd1nKQHej1tDYnI7QqNOMlg4wG7vlD4AycMyDkjeaH1xXw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=o6Nb56iO; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=o6Nb56iO
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A74DB605E9
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 10:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788949795;
 bh=f17bi52APe6mh6PFu6BMtAspAcZxyGpHtUDHFkwdB2Y=;
 h=From:To:Cc:Subject:Date:From;
 b=o6Nb56iOGvZd9SXH2tOWWlwXKWU8Y5Djk0P1/vXRNPwauHsnUP4Ja87bbv6KMhP9e
 XY5fDRByH2IYiXulFq08XsJ5e9bElBV5sGe8MRFMO3WQMUg0et9VDFNTgwLrBbPtBY
 agkkVWcj6cG51lVJpo681KmePM/3e5VkAtWIYJHSUTbrwXbo2O7v+Bqmy45Jy3c4X0
 jF9CswLmrD88Ycdkj2rCU0S3YGH6VEVpjPLRRO8TY8jgX05cHXiyCoZR2nK7hGz6Gc
 wgNreDjtD5AKF+99PyfcCU/5/jCFkqKRMykZlAncQw5BOkF9mXxKXmVyJgbtulxLO+
 loKr552I+8Tcg==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8568FA4C104F;
 Wed,  9 Sep 2026 12:29:55 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51966)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x4FYx-000000008C2-15Oz;
 Wed, 09 Sep 2026 10:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Wed,  9 Sep 2026 12:29:55 +0200
Message-ID: <20260909102955.3878896-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/turbolua: security bump version to
 2.1.5
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

https://github.com/kernelsauce/turbo/releases/tag/v2.1.5

https://github.com/kernelsauce/turbo/releases/tag/v2.1.4
Security fixes:

HTTP header injection: header values were only checked for a literal
 \r\n, so a lone \r or \n could still split a header. Now rejected on
 either character.

Transfer-Encoding requests are now rejected with 501 instead of silently
 mishandled, closing a request smuggling avenue.

A real default request body size cap (128 MB) with a 413 response,
 previously unbounded.

Secure cookie signature now binds the cookie name, so a value signed for
 one cookie can no longer be replayed under a different name.
 Verification failures return the default value instead of raising.

Constant-time comparison for the secure cookie HMAC, previously a
 timing-leaky ==.

util.secure_random_bytes reads real OS entropy (/dev/urandom,
 BCryptGenRandom on Windows) for WebSocket masks and util.rand_str,
 previously math.random.

WebSocket: unmasked client frames are rejected per RFC 6455, and
 fragmented message reassembly is capped to max_buffer_size to close a
 memory exhaustion path.

StaticFileHandler decodes the request path before the traversal check,
 closing a bypass.

Fixed a 32-byte-per-malformed-request memory leak in the C header parser
 wrapper (found via libFuzzer).

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/50623b5bc818c308c34ebe6dd1c3b6b85bc99901

 package/turbolua/turbolua.hash | 2 +-
 package/turbolua/turbolua.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
index 12c41c6e5c..253b12e47b 100644
--- a/package/turbolua/turbolua.hash
+++ b/package/turbolua/turbolua.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4dbfbe4919118977c2ca40a4da81054ffe407d09f38bf5420eec5ae1449299d3  turbolua-2.1.3.tar.gz
+sha256  65b602ae0638bd14405567de999ef57e8d49f0c8ebfa3561952f4ae7242e9d0c  turbolua-2.1.5.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
index a85256a3e1..6765654afa 100644
--- a/package/turbolua/turbolua.mk
+++ b/package/turbolua/turbolua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TURBOLUA_VERSION = 2.1.3
+TURBOLUA_VERSION = 2.1.5
 TURBOLUA_SITE = $(call github,kernelsauce,turbo,v$(TURBOLUA_VERSION))
 TURBOLUA_DEPENDENCIES = luajit
 TURBOLUA_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
