Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B9DEC433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 21:02:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECABA610E8
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 21:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECABA610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9036640855;
	Wed, 13 Oct 2021 21:02:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rMYcOQwRStgQ; Wed, 13 Oct 2021 21:02:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA0DA40847;
	Wed, 13 Oct 2021 21:02:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5C0F11BF35E
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 21:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57C9F40542
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 21:02:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nHBeNELYUXod for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 21:02:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DD6B40155
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 21:02:23 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id r10so12494530wra.12
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 14:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lyaHb+lTf+Yvxd3lrAAsa4JH7u/yR+q3PiOVHQwfsIc=;
 b=FLFLlDD+A96BHyxPaAeDPBvLCrx1fqlVRTtkWx/zcKolXLDzumPgmx/r9T/qfROBlU
 D7wnqBnJqebpWI/OSl7K9SvxhrPvZJzCTZaOrm5N78/lPxHLyXNN36gD6qsx4zz0Sw1k
 wufFCTNKntbzaWIBx4J95tPR5x4asCYWZCl67XYqHExmhr/p6sPM6gXq++RDT9Iuljn3
 XRMhDIbk4cFryhSb4dl7Sfz7LKQrT7NF6/CqxCYri9UtPjwzt8sTzphLZP8K0EUqAB27
 1WiLumWnwFAfV5g31UtJkdMLUyC6KhMg76ySOv/8RlkZT6wvUqDXN7E7E4qlCg7P3Fr3
 bhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lyaHb+lTf+Yvxd3lrAAsa4JH7u/yR+q3PiOVHQwfsIc=;
 b=YNLVrxMryJwF4O+NvcdDQnpeicpqpPL6kxhfiYaO6xTNfYj6qGkLAuXjFLsYMdSJ4L
 D1hPJ0TrSAuYPpuBSuxffX5+OImLIjNKaCxQNjQ3v+l6PQpr02FLsn4IqwqoUbINl0J6
 OeoNsfXZSo9BxalTOxr58Kq5KMyMWHcNonqYmVAu9fOR/gW5vCKx+BSuRgqlhZi6UogI
 tBj6uA1r0JKmORIZvDgaL+1LLV/MtBkGcNUrzUlIx3FWsbI0ZhuiH2/Z8rv/zZl0/RFZ
 q584+r/BN5JAFVXkG0PoaHErHO4MABsIABd8TsfQSSCnxLspvzhFgZSOaZjHHMta6qYX
 kIYA==
X-Gm-Message-State: AOAM533lCrzauquojennCt+Bo6YI90Td1ZtgEjXIA6BeHQKVah7Y7JOy
 InzOiOXYgSkfWK7HwacSXFsqKX0DIZ4=
X-Google-Smtp-Source: ABdhPJzeYRe6f0efSuCgeLI3NCcNIKVV/mRF+PnVY2IGU10feLwT6xD60QYelkn1nxqGqDVUBpSTrQ==
X-Received: by 2002:a05:6000:18cf:: with SMTP id
 w15mr1710684wrq.314.1634158941292; 
 Wed, 13 Oct 2021 14:02:21 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id y5sm556504wrq.85.2021.10.13.14.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 14:02:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 23:01:17 +0200
Message-Id: <20211013210117.1929839-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Revert "package/coreutils: ignore
 CVE-2013-0221, CVE-2013-0222, CVE-2013-0223"
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 8ae9156d8b730689484927fba2ec2fa6c1dc0433 as those
CVEs are not tagged as affecting gnu:coreutils in NVD NIST database but
opensuse:opensuse and redhat:entreprise_linux:
- https://nvd.nist.gov/vuln/detail/CVE-2013-0221
- https://nvd.nist.gov/vuln/detail/CVE-2013-0222
- https://nvd.nist.gov/vuln/detail/CVE-2013-0223

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/coreutils/coreutils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 6822c58a32..9c0f46cb29 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -10,10 +10,6 @@ COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 COREUTILS_LICENSE = GPL-3.0+
 COREUTILS_LICENSE_FILES = COPYING
 COREUTILS_CPE_ID_VENDOR = gnu
-# Only when including SUSE coreutils-i18n.patch
-COREUTILS_IGNORE_CVES = CVE-2013-0221
-COREUTILS_IGNORE_CVES += CVE-2013-0222
-COREUTILS_IGNORE_CVES += CVE-2013-0223
 
 COREUTILS_CONF_OPTS = --disable-rpath \
 	$(if $(BR2_TOOLCHAIN_USES_MUSL),--with-included-regex)
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
