Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA07CDB47F
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 18:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CACD8405BF;
	Wed, 24 Jun 2026 18:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8buzbph8Dtw; Wed, 24 Jun 2026 18:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7CD040B4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782326462;
	bh=NtBqoTDPDtfwu/6dYUajZNoSeRkD0+ZQaKssw1Mt4sI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e5lyHtz3TfxeK/ifMJGA5Q8wwMI/5Fir5LOGzp/8/skpuitr83Xm6fBJ5XKEPduxa
	 kuwbmJpz5i5ItEB6Vy68Vgc+xnKZ4G53yfxuFyip6FdcseyW1kwpd4DLNNyDD9WMkV
	 Dpabo+7n/qIMcL3toXYnGJMaPzTvQQSzbAlD6luD5SXuK45w0u4xPs3o7UUMpgWiEC
	 9h0oAq3qDPI5uNy9f3LyKYb+8sJpfIFq4KQTpbirYK7TrXFbY4T5rIUJqnPxtAmTuf
	 3R1pkBhlNDVUMHpRnZQYsnTvHdO8X5a9obduoC7GypfxeYt8VmN9MGajzsartkgYkN
	 sXrnXFbBLxtyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7CD040B4B;
	Wed, 24 Jun 2026 18:41:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9064256
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEB5260BEC
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OTeU81-xj03I for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 18:41:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ABD5660A52
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABD5660A52
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABD5660A52
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 18:40:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c817.dip0.t-ipconnect.de [79.214.200.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D0B37A4C21E5;
 Wed, 24 Jun 2026 20:40:57 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52702)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wcSWv-0000000037l-2kPq;
 Wed, 24 Jun 2026 18:40:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 20:40:57 +0200
Message-ID: <20260624184057.1060045-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782326457;
 bh=Gp91A9nMZ8vgSR8sAAiQHGtUjqN4y9SnmDSSF5CMiIY=;
 h=From:To:Cc:Subject:Date:From;
 b=RGKdoZqi7wMcf5l8dSUeIa6hlx+zfThWO2t4HN2nmGuf8cXAtzDzl5gn+D8TAYYRa
 99VkTb32TDl3KpAqR522SiyfEuoqVcxqUjPo2S8fJj4fQeVghKBR3qdGvycmFZBmId
 +2q1RVG/INzAbzOGpRCXyL1eSK9g5chjRbAjqjDpiS+r93hxkYGHVnEpDknkjhjGKe
 6NP+ge4JNTQKwRdABT3QqJyPAX7JQMADEUgY1dtVhuFRjk/RPbqvi3VyiHDvHCQXYP
 hXGjm7EsW8ffUqhMoWjSzvjuHBvLbKNT/EOukQ98nxkQgMFOPihaHfM3FFEtsO5Taa
 rn/ySFNMkPqCQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=RGKdoZqi
Subject: [Buildroot] [PATCH 1/1] package/libcurl: security bump to version
 8.21.0
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

https://curl.se/ch/8.21.0.html
https://daniel.haxx.se/blog/2026/06/24/curl-8-21-0/

Fixes the following CVEs:

Severity Medium
    CVE-2026-8925: SASL double-free
    CVE-2026-8927: env-set cross-proxy Digest auth state leak
    CVE-2026-9079: stale proxy password leak
    CVE-2026-11856: cross-origin Digest auth state leak

Severity Low
    CVE-2026-8286: wrong STARTTLS connection reuse
    CVE-2026-8458: wrong reuse for different services
    CVE-2026-8924: trailing dot domain super cookie
    CVE-2026-8926: password leak with netrc and user in URL
    CVE-2026-8932: incomplete mTLS config matching in conn reuse
    CVE-2026-9080: UAF after pause in socket callback
    CVE-2026-9545: exposing HTTP/3 early data
    CVE-2026-9546: sending old referer
    CVE-2026-9547: SSH improper host validation
    CVE-2026-10536: HTTP/2 stream-dependency tree UAF
    CVE-2026-11352: QUIC zero-length UDP datagrams busy-loop
    CVE-2026-11564: Native CA trust persist
    CVE-2026-11586: WS Auto-PONG memory exhaustion
    CVE-2026-12064: proto-default skips SSH verification

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/a016b2837c83c8c12dfd612efb0bb723190f7e18

 package/libcurl/libcurl.hash | 6 +++---
 package/libcurl/libcurl.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index 549527b1af..e2393bf2f4 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,7 +1,7 @@
-# From https://github.com/curl/curl/releases/tag/curl-8_20_0
+# From https://github.com/curl/curl/releases/tag/curl-8_21_0
 # after checking pgp signature:
-# https://curl.se/download/curl-8.20.0.tar.xz.asc
+# https://curl.se/download/curl-8.21.0.tar.xz.asc
 # signed with key 27EDEAF22F3ABCEB50DB9A125CC908FDB71E12C2
-sha256  63fe2dc148ba0ceae89922ef838f7e5c946272c2e78b7c59fab4b79d3ce2b896  curl-8.20.0.tar.xz
+sha256  aa1b66a70eace83dc624508745646c08ae561de512ab403adffb93ac87fc72e6  curl-8.21.0.tar.xz
 # Locally computed
 sha256  82f2f4427d6545ee5aaac4f0b80428da6cc8ba41c2cf5da3a03680ec327b9681  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 94d7ec677c..219ce9f712 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 8.20.0
+LIBCURL_VERSION = 8.21.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
