Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCD1F8809B
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 07:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2B4280BB9;
	Thu, 16 Apr 2026 07:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id veeovd8ttZCR; Thu, 16 Apr 2026 07:36:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D429480B20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776325003;
	bh=lbuIrCYo0ROw/j7sh7LtM20oyU/e5Rp5HJsLRZxwCqg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RkleUZSzninwkgZul24v4Cv8Cm5Jp8d8j4SpNMHJpRM4pQ8aA5ynrArL7mBhYuWki
	 macqiL/cO8r/gHGv7w4x65tX24oevzfl9krmOgTzs01XjSefhJidxh7bIp05+ZgnGT
	 4jOYlkZImZBe0TVYdD1pMiqdfPvIktoJuQwbsAojY01mPisCK16N3K84861t74Ykhb
	 F0KLpalGszxnoeqST/Bn9dEPqgMHAqXwK11Wyvz9whrXJ3VnhEYdjkapqE9z3L9UVc
	 XrEhR+JiHbeJ2g7XRQo9EhYMMp3+T0qX2DvMkwk85bX3917PE4/Fzt8v1bwZhtDxhH
	 EmtewRLMwnVSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D429480B20;
	Thu, 16 Apr 2026 07:36:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3BF412CF
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:36:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 562F1407E0
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:36:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EkK9-dFcs43 for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 07:36:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D7D240800
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D7D240800
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D7D240800
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:36:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf3d.dip0.t-ipconnect.de [79.214.207.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7A234A4C0BEA
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 09:36:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35382)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wDHHC-000000007bH-0AnF
 for buildroot@buildroot.org; Thu, 16 Apr 2026 07:36:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 16 Apr 2026 09:36:37 +0200
Message-ID: <20260416073638.3605579-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776324998;
 bh=HTQvGFiX2g1wtvBKQtLea3OC8XnhKpnQ4FUyWrLi2NA=;
 h=From:To:Subject:Date:From;
 b=mb6I13QVVEkd/0XHiXyqA844F6whligTIvYLMsgOB6tR0Ayxu3x/5N2FQHXcUZFHq
 YoB7GwHALXO99kVwHN5RML1FADQ7kZs4/EmW1wafXPIoQIAusAZtkP9mXTOaD8M7Jc
 eAN5dpZ9zjzOPNZ1blqLOLU1wkc/SB7wL2CX9+bPSJDZZtG/2/rmbTl+GPSVHRvH+g
 QS41vRCsCw+3YzDIUh5vVifnwr9serxv3rBtBAlbocNzeFBjBKVKwVuLkFIhFkVkIR
 dQjF6/8r4qOHdeBKyKyoEepl6tgu1ioW9TH2qhmqX72XRzxC27OFLGVZQbpVbiw3AP
 sY2C9J3oJkSjA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=mb6I13QV
Subject: [Buildroot] [PATCH 1/1] package/libexif: security bump to version
 0.6.26
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

https://github.com/libexif/libexif/blob/v0.6.26/NEWS

* Security issues fixed:
  * CVE-2026-40386: An unsigned integer underflow in Fuji and Olympus
    makernote handling
  * CVE-2026-40385: An unsigned integer overflow on 32bit systems in
    Nikon makernote handling
  * CVE-2026-32775: A buffer overwrite via integer underflow in makernote
    handling

Switched to xz tarball and tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libexif/libexif.hash | 3 ++-
 package/libexif/libexif.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/libexif/libexif.hash b/package/libexif/libexif.hash
index 9e95e27f3e..5949bfb36c 100644
--- a/package/libexif/libexif.hash
+++ b/package/libexif/libexif.hash
@@ -1,3 +1,4 @@
+# From https://github.com/libexif/libexif/releases/tag/v0.6.26
+sha256  4a055ed6575e61ca46c3172be3c753cc16c9becd0f99ec71d58dd0e471476c0c  libexif-0.6.26.tar.xz
 # Locally computed:
-sha256  7c9eba99aed3e6594d8c3e85861f1c6aaf450c218621528bc989d3b3e7a26307  libexif-0.6.25.tar.bz2
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/libexif/libexif.mk b/package/libexif/libexif.mk
index 0e50d78fbe..f434f9a922 100644
--- a/package/libexif/libexif.mk
+++ b/package/libexif/libexif.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBEXIF_VERSION = 0.6.25
-LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.bz2
+LIBEXIF_VERSION = 0.6.26
+LIBEXIF_SOURCE = libexif-$(LIBEXIF_VERSION).tar.xz
 LIBEXIF_SITE = \
 	https://github.com/libexif/libexif/releases/download/v$(LIBEXIF_VERSION)
 LIBEXIF_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
