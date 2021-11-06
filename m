Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8744C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:32:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CB061073
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 15:32:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61CB061073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C3DE400BD;
	Sat,  6 Nov 2021 15:32:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I9KvCmRWlnfT; Sat,  6 Nov 2021 15:32:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F0DF40131;
	Sat,  6 Nov 2021 15:32:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F2CE1BF2A1
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E1FF8263D
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 15:32:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OYeI_E_jlsOK for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 15:32:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8AAD2825DC
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 15:32:36 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id d24so18574077wra.0
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 08:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aOlRwlmtQND7OTQSiiJglR/w/y1wR5G6MZnT0YhrQCw=;
 b=DPmKuXrLKvKAcskxB+CRzWoKp/SxBHM/PlKfqLRxox2swuPt6TCjaicIALq5MtbetB
 TcuIMLcb5a6hQHgIIs17DiGOuqDCtRyNUik/1gCqqpZcaVCUn2x1h2Owj4xvEXjWkCcZ
 PqFAcF9od0Uq5/Gc5YBcjH2XHaMttscCZsIoITIzlSqdUwgQQMitHYSIq+XzZaDlBXdO
 Lf6Ny1czp1K7PXZ9W0Aq9QOLc5MzQVjsJxRU5hV88Kvv5uCfyEy85UiNJrPDreEzHKgn
 DW5KNBpXgKKPo4bpsqZTvwMz5TCizMwHhC+AR4Ze9jfbFZp8mkYlQaRzDfrPg3Nthhw0
 luBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aOlRwlmtQND7OTQSiiJglR/w/y1wR5G6MZnT0YhrQCw=;
 b=wKAhWFvP1lVo/ADW7VAaQpG+Ntx9yUT05q2fbRfrVaqIMJjUxWWG44Dkrx8BilBX13
 vLaLHHueBY0spbIXoi4o/l+e1vfBICFXEBZjBjLCRU13XztBSCi94veiIoGHYFt7qOrz
 egSAbFD2NxcUse/0GoWUtRgCwHTG2rsb4lTTErWvEyBne7KSNfam63KhiR7VU/GcKNRh
 Xl0qSvIUjx3fNUfVwayUOpLBHWRml0KHeHC8Ac9Vh9sJQBtXgAiN8KkfocUql4OOZtlh
 4AtFvIYogZw+vsdPTRic8hJUKnoN5kd1mahWH3Y/IHqMoouwZJHEMURw+ounBlu/V/H5
 JFCQ==
X-Gm-Message-State: AOAM533zfzeaO445ULB97XlFbq1NCybl53y1NDPZpJnL15AuUmNjWmnO
 +DJkyOV8p4sqq8XGoWA78HXMKCTbJ8Y=
X-Google-Smtp-Source: ABdhPJz0l0H6FsP4MCtqJD9THVINpDo2qerRN7Yx1N+NgsIFGa+1YJMlu7BPeZ9/aZ4wHoqYVo/VLg==
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr32192483wrs.263.1636212754594; 
 Sat, 06 Nov 2021 08:32:34 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id u2sm10446189wrr.35.2021.11.06.08.32.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 08:32:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 16:30:47 +0100
Message-Id: <20211106153047.3188255-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/kexec: don't override dependencies
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

Don't override KEXEC_DEPENDENCIES in a conditional

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kexec/kexec.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kexec/kexec.mk b/package/kexec/kexec.mk
index 13b852c8ed..81d35815d8 100644
--- a/package/kexec/kexec.mk
+++ b/package/kexec/kexec.mk
@@ -16,7 +16,7 @@ KEXEC_MAKE_OPTS = STRIP="$(TARGET_CROSS)strip"
 
 ifeq ($(BR2_PACKAGE_KEXEC_ZLIB),y)
 KEXEC_CONF_OPTS += --with-zlib
-KEXEC_DEPENDENCIES = zlib
+KEXEC_DEPENDENCIES += zlib
 else
 KEXEC_CONF_OPTS += --without-zlib
 endif
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
