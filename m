Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D970CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 19:41:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 638C48133F;
	Sun, 13 Feb 2022 19:41:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGVaQeuTtMQD; Sun, 13 Feb 2022 19:41:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B17AE81334;
	Sun, 13 Feb 2022 19:41:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCED91BF29A
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 19:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C31FF40114
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 19:41:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hMwxBMVe8OKj for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 19:41:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2D04400AF
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 19:41:09 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 k127-20020a1ca185000000b0037bc4be8713so10415305wme.3
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RiF4+I5O1meK7qozgd8y93X35gj6W/t8ZGMPdj9isAw=;
 b=ai5SObCVXPpYZw951Qk1cUl010JOtgRg8+UgCRe5jar6pXe3Jzh2yBjzObGHgceZup
 UQE0p4Y5ZbToeVO3tU/fGzNaQngziuWFfcBx9SK3jbz32rxKpu20jx2qJI2qQxHmrDCP
 8zLgIdLmBQ/4v06idegUP+ORT9WljJhPk8IW7qtFbsev4sCBiQmjyGfRBjRXKyKm9a+w
 zw6T2PrlPFXNzi5gAYnVOzX+FhNfxzIbH2Dxwj2OOI2UyOnHMt30RkVzJ36EKhPTma9A
 O+hGgmfh98+LBkaPxyafnQYaMSyFOc9TuuuZ00A8FIpb1CTOBIgsJCBR3yRJKxRahw3q
 pmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RiF4+I5O1meK7qozgd8y93X35gj6W/t8ZGMPdj9isAw=;
 b=y1NKvffapuTNvDqJYPHddlY6iWfmsdirNdia0Qk6p+T8eyFYw+8qMB2Z5JpN+Nw7u0
 +YM2kDvey8kQX6B6a3Pg6CplSrJSpb9ObKyPXysYUXBBaFw8ayQViqZqjVJ1W1zN/uNY
 QXHi/8WBKG3so9tJObS2vCTeP5twSzxf0s9ldjUL4foOxQlWvtQy763c1kE+eSI3NAbi
 LgojalXYUf0Hu8xEl1/4nwCfw/Jt6dMtxtS4/vLaRJoz7TAi0qK70zu2WqEjco+kDvGH
 BAvH1tGfRAx/nBraSgMM13mH3vXTueouQppcZU2DlVPqto9DES81sczlhQ1PI+dWU/9h
 eOdQ==
X-Gm-Message-State: AOAM530uPMm8QN+Dx9YDuzKzdFOZnJ9FKqIS6JEzIdGipNbN1e25hsXO
 n2mQ49PuG34dmbhPCWRW/lXxK6ohdEU=
X-Google-Smtp-Source: ABdhPJzlQI/rw+JNAwr4LjSjN3IZQDy1HnEzOBfPK0uaOX8PTZ5/eGW1DpWNI48Ju++ORYbQrUV09g==
X-Received: by 2002:a1c:541c:: with SMTP id i28mr8404126wmb.62.1644781267689; 
 Sun, 13 Feb 2022 11:41:07 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id f7sm20884551wrz.40.2022.02.13.11.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 11:41:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 20:41:31 +0100
Message-Id: <20220213194131.1103482-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-psutil: add host variant
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add host variant to avoid the following build failure with mongodb since
drop of python3-psutil in commit
aab7bc4a1d499b3f926464290eee3d6459d0e816:

make: *** No rule to make target 'host-python-psutil', needed by '/home/buildroot/autobuild/instance-3/output-1/build/mongodb-4.2.18/.stamp_configured'.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/3bce147b6b34d8854e54fc1102a047fcb2c19d01

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-psutil/python-psutil.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-psutil/python-psutil.mk b/package/python-psutil/python-psutil.mk
index 413fc8a391..3a2781c284 100644
--- a/package/python-psutil/python-psutil.mk
+++ b/package/python-psutil/python-psutil.mk
@@ -14,3 +14,4 @@ PYTHON_PSUTIL_CPE_ID_VENDOR = psutil_project
 PYTHON_PSUTIL_CPE_ID_PRODUCT = psutil
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
