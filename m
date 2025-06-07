Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7D5C5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 19:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 453D381769;
	Sat,  7 Jun 2025 19:07:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4RpP47btDir; Sat,  7 Jun 2025 19:07:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C64B8175A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C64B8175A;
	Sat,  7 Jun 2025 19:07:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B20161A4
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 19:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59FF56059C
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 19:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VfQpPKeSbhZw for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 19:07:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB12560B18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB12560B18
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB12560B18
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 19:07:16 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2124872671; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 07 Jun 2025 19:07:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uNysl-00A6Re-1n;
 Sat, 07 Jun 2025 21:07:07 +0200
To: buildroot@buildroot.org
Date: Sat,  7 Jun 2025 21:07:03 +0200
Message-Id: <20250607190703.2408025-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=oK5mZzBy/Po5aaOfaeQWLHbKcQcoFPKMpziPaBnxk+JZ68KqUUSfQveHimKja/ZEyuAfNyhPEMGwg+KUbRIxeqHvDCWuakbvMwUHOYSmgDFTFn4xOhkGTm/BlPJ35I375udVhWpQehkyJk27oBhEHbnmWAlsVweu+K0mnGxpYNv433ylv1HWO2eoz8Kv9WkD2r9tBZASRdnOZM7nbevHtBX1qd0iRU/cUqVtwbHwA2qu210z1Ommaz8Qch3Ed09qvZk458HIouL6LAHsAsKnF1cc8yBGEIvsl793fqZ2xBLpwiVeOHdZmLlfWKLdlDiHU+awYzHXkrf6gpXSjNSuNA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=u/VYvVknDu8nMdH1p8/eEathNvNjN2DrJ/RZMXz+s7Y=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=oK5mZzBy
X-Mailman-Original-Authentication-Results: purelymail.com; auth=pass
Subject: [Buildroot] [PATCH] package/libcurl: fix build w/ threads + c-ares
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
From: Peter Korsgaard via buildroot <buildroot@buildroot.org>
Reply-To: Peter Korsgaard <peter@korsgaard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
https://autobuild.buildroot.net/results/680b825b93989e6aef247593c198094a6ed916f7/

Since curl 8.14.0 with commit d364f1347f05 ("configure: catch asking for
double resolver without https-rr"), configure errors out when
--enabled-threaded-resolver is used together with --enable-ares (unless the
experimental HTTPS-RR support is enabled), so disable the threaded resolver
when c-ares is enabled.

https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 8501910ac5..5a3a668f06 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -36,7 +36,9 @@ LIBCURL_CONF_OPTS = \
 # https://nvd.nist.gov/vuln/detail/CVE-2024-32928
 LIBCURL_IGNORE_CVES += CVE-2024-32928
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+# threaded resolver cannot be used with c-ares
+# https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES)),yx)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
 else
 LIBCURL_CONF_OPTS += --disable-threaded-resolver
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
