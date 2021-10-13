Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DABA6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 06:55:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AE0161027
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 06:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3AE0161027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7B5240119;
	Wed, 13 Oct 2021 06:55:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bFfIPodbOro7; Wed, 13 Oct 2021 06:55:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D97A74013E;
	Wed, 13 Oct 2021 06:55:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC7461BF36F
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 06:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D91FB80E8F
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 06:55:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ljLW1IO6O7dr for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 06:55:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF48A80E74
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 06:55:53 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id o20so4781650wro.3
 for <buildroot@buildroot.org>; Tue, 12 Oct 2021 23:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yVtz+OYjxtTtvBl+jp+p95+bdckfOczYP70057xlivs=;
 b=Wg3x1FX5wzJvbOqfu9GWaXl5aL2LAXCC5c/PLUjA4/1ZSNIH7/ra8vXnIS9F71OJDx
 SSJRcGpn8mQwKU210GbfT8wBwHyIngslIxb1QxbEgft+FrwyQRnYDpUqODA/YypgcuR+
 rbf2AApcfwj8YIGivHCo6Ik6PSpD0RRIY1Pz9Z+0k1+gxN0cVXF2qYGrHqWrhB6cakrz
 t9viXeaLtPLAUDtPsMHyTqJ9odCRlxHxZxSmk1h/ShFWEKm6rsCYMj44ceoeBOh4r1YN
 XBl/10MjlOhk9jAFfUxxxIlP+0MAnEYc6Q3/RdOARADUTILRiLT/lsfA1UgRx851bpGD
 c8vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yVtz+OYjxtTtvBl+jp+p95+bdckfOczYP70057xlivs=;
 b=OJ6p1+2g8fhOJpOJCxz023n2r2jI7ZoCC1Hr54ka3fB5YUDmCJcqFRUjq/IZSicHzq
 vwYyCm8hmmCMr2ugXGNX3FU69Lj6rwyPpQ6zp0hEC6D2fAtGjNnMO/eGpt/cdxriKIp8
 S25mDWczIgJiJCmARfG6Gx5PGR33d2dTw1TWD0jkLVQGzZWFD8kcMxqDi80w+F2rxIuu
 qbz6hbmsznzF4L4Idt3BhQPXx7xn633cA20OW1oY6qTpg4U8GETY44AGqRDHF5qokaij
 ThnZcXgQuA4tJf/nlg2W8CURcXJnQ0y5ABO5fBRwajLSEn/hErJZBtyBgz8RXCEZ7Z00
 pXZg==
X-Gm-Message-State: AOAM531drI0oekdyZPaAGWsEo8Q08z8ymIY3QVPj2a5vNeKhZoaq2piG
 IwqtZ+yHQa3b1v15w36CIXpmDQEbrtg=
X-Google-Smtp-Source: ABdhPJxsK0f6PkVveFNh92ELNodz2sRrZ1rz9KdNdoUmAGvMKxrRLa1SO8ToCo90kkIP0Fm8hnk38g==
X-Received: by 2002:a1c:21c3:: with SMTP id
 h186mr10668414wmh.107.1634108151802; 
 Tue, 12 Oct 2021 23:55:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id c17sm12392176wrq.4.2021.10.12.23.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:55:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Oct 2021 08:54:46 +0200
Message-Id: <20211013065446.1857356-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tpm2-tss: needs host-acl
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

Add host-acl mandatory dependency for setfacl to avoid the following
build failure since bump to version 3.1.0 in commit
470e2e9bc5211184431fbc868359a9d695e624f4 and
https://github.com/tpm2-software/tpm2-tss/commit/9d42f4dbde6a94724e95d57c333cda7711dda57c:

configure: error: Missing required program 'setfacl': ensure it is installed and on PATH.

Fixes:
 - http://autobuild.buildroot.org/results/eab44622f8d8ff4fbf464b5a98856382f019c2cb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tpm2-tss/tpm2-tss.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 8e701933c4..58f3fa38cc 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -11,7 +11,7 @@ TPM2_TSS_LICENSE_FILES = LICENSE
 TPM2_TSS_CPE_ID_VENDOR = tpm2_software_stack_project
 TPM2_TSS_CPE_ID_PRODUCT = tpm2_software_stack
 TPM2_TSS_INSTALL_STAGING = YES
-TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
+TPM2_TSS_DEPENDENCIES = liburiparser openssl host-acl host-pkgconf
 TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc --disable-defaultflags
 # 0001-configure-Only-use-CXX-when-fuzzing.patch
 TPM2_TSS_AUTORECONF = YES
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
