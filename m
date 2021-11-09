Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A08C433FE
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 07:12:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D751461156
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 07:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D751461156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A8E7606B3;
	Tue,  9 Nov 2021 07:12:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUyyqOKwEqbH; Tue,  9 Nov 2021 07:12:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB0656069F;
	Tue,  9 Nov 2021 07:12:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F5001BF86C
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 07:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C2AC40127
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 07:12:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fxQ-FUsiujnd for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 07:12:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85C5A402AA
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 07:12:04 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id o29so11132404wms.2
 for <buildroot@buildroot.org>; Mon, 08 Nov 2021 23:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3WsAGiAXbX18gGLOakypa6YlshEgSvaohTuq7nfcB1c=;
 b=Uuelqcf/0wVC9sol/pwGp6OwLrOHqHNdjgCplJx0O27KALCYmaR39GBneks2ff0e4k
 4nAViVNTm/dvKCvcXoG4/XbgK/evyxQ7LETGtPBX+nqIT/sJRp/llg5Re4cDMZJUQgHK
 B+g8RlgjFn5LptX8skid2RwB6XbGp8D0neX4/t0g0kw/UNzTh37yWBeojl3zIqnCYjeM
 i9/Ulu7KswfoMY+X7nFSGQsqU8CEdlTrVCzd0ygq1f381y17oJqhOPG8wL0XAUMYDD/2
 EazqxHJbrZGyQiMKTaPe+EWL2Q5cluvNsERZoi2ucicx6QwlOzdtVbHTXOx3zp3o094l
 rj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3WsAGiAXbX18gGLOakypa6YlshEgSvaohTuq7nfcB1c=;
 b=DF4sj/2X1dtATz//IZkjijQxHW2sx32AvJ38ZEm+0fG7L2THs3mPAehBQw200Yeqpn
 8iTENW+LEawTX7s96cCDZ8mEs+sjhZj7LvWV3MSF0ALuzYau5jZh/dBRNQGAyt57/eaf
 ICxOhCC7eKibXvMbBBMWX7w5+NoP4EI//Ltwe8lL5lSIoKZSuDMwAKVz3tXKBEGR5aB5
 ZaUHq2NTuJQWmkUK2h/CYLWt8tIuIzKmOch80lsvgyTQ+CDhCpvskRGjLd8TTuPcZCrV
 kv4+thTXHcLhC3YK+ASnxpjUIQgoLf1cieDBUBvAlGSqywI57KJuuowKjOiIEBDZOm7r
 EUnA==
X-Gm-Message-State: AOAM533iVHFgjFD6KYftMBGT6dmbb9UXEtPbK42BaMnh1ZdM1+UWJTXl
 Yam4yAdCEz5WLMM4Gmv03CQBps+tgdQ=
X-Google-Smtp-Source: ABdhPJzzu4miyogTEAcXzIMhXCrc7o5RzENHO0H+VzMELIfFR//+6mGBC5ViL/OWD/naeptY+47jvA==
X-Received: by 2002:a05:600c:24c:: with SMTP id
 12mr4682937wmj.124.1636441922298; 
 Mon, 08 Nov 2021 23:12:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id l26sm1562338wms.15.2021.11.08.23.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 23:12:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 08:10:01 +0100
Message-Id: <20211109071001.3866765-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tpm2-tss: fix build on host without
 useradd
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

Override check for useradd as already done for setfacl since commit
d9123dd79956124ab1b39427764882b61fe44261 to avoid the following build
failure:

checking for useradd... no
configure: error: Missing required program 'useradd': ensure it is installed and on PATH.

Fixes:
 - http://autobuild.buildroot.org/results//97bfa8f7dcb12e36bd63c9d06fb39418070d840b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tpm2-tss/tpm2-tss.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index f2b5f32171..f35e994a5c 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -19,6 +19,7 @@ TPM2_TSS_AUTORECONF = YES
 TPM2_TSS_CONF_OPTS = \
 	ac_cv_prog_result_groupadd=yes \
 	ac_cv_prog_result_setfacl=yes \
+	ac_cv_prog_result_useradd=yes \
 	--with-crypto=ossl \
 	--disable-doxygen-doc \
 	--disable-defaultflags
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
