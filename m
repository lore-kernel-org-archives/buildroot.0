Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4698C433FE
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 09:52:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E14F61178
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 09:52:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E14F61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCD7A841F3;
	Wed, 22 Sep 2021 09:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aSSo5boHdC5B; Wed, 22 Sep 2021 09:52:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 274FB841EE;
	Wed, 22 Sep 2021 09:52:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 504961BF35C
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 09:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3FC2D40624
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 09:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5scSNejU9a6 for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 09:52:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE58640613
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 09:52:20 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id e15so9471897lfr.10
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 02:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qMpAgMFBGHMYCp7SGK60qFY9XOZ90XoK1R65MQoLUWE=;
 b=v4hHIAC/8t3WqMW8nBhz2BmOT5bDfdSPBBR+f/Tfbhxr8UUimI/RyqyjQst3fTRec7
 lnebp2hL5dMwzkPzwFIBZ+nzkC3+nZjZMDK2qV5OVXRAfWXzJEqxbiHpkIVOMJvyKdmu
 0ChqYFl0LCAcix9zr9YsUZAfDW1exSI/RupSUkZTJ8jQw0CooY9ugd2P8OJWloDvB4x4
 uGaRVpqx5IuBIJUUf8dMaMZGOi60tFTzaEqYRLiPE3+0CwMPEO89u2SRdG07O4msbzAT
 1oRFjLBI+R6LKGaTZhmmKnNkIjGwZzdYjnMLCx5Fx7EsohAabmKlmNWkmCMHNcJ1u9/0
 imkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qMpAgMFBGHMYCp7SGK60qFY9XOZ90XoK1R65MQoLUWE=;
 b=YP+zDMthk+nNnxySumHSOnJ/Yk6fguHYEgQJKq9fRSMjD7Qa9mJxpmkwIKeRc+58Iw
 Pn4nuH0HWIvsc/7Ygn29KshrIq6G7Lo2cdhp2hFcClugtMonPhmFoJtrmp9Y9oQ5P3oh
 8K+eVK1LSHxkvjZxp8vFDi4II28pQ38OD5V6UtefnsQ0ti/jMaK0jubIBRQrI1YwL+Dw
 alIODFCrASmqJx+0H1IueeE3ue06JX+kf7gCTUhOcmDi5O4RznttuZqUYuRBHi6x/Awb
 dGvHZcmB+MSsIsyj7eb+K1q8bbPWm4GPLQfYo8pDhUF7Ygh5nX3DAPZ5gozuGTEzG+Ci
 2CYw==
X-Gm-Message-State: AOAM533KEwMBNxYBDTubswCt22omd2ErGL3Q07d/Il8mtbjGKQ74KC4k
 7XQ6Yitlcw5tUgW9F9dxi96wJdQYgUTQTSKJ
X-Google-Smtp-Source: ABdhPJyxjcqwrXsKCbG6eVXIrGmr2BMvgGyp2pBMCvH8DGPqRbsWXR7kFTARLVOzhwc2ic6h46Tfiw==
X-Received: by 2002:a05:6512:3451:: with SMTP id
 j17mr26452363lfr.92.1632304338531; 
 Wed, 22 Sep 2021 02:52:18 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id w14sm197910ljw.73.2021.09.22.02.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:52:18 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 12:52:16 +0300
Message-Id: <20210922095216.2388856-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/wpa_supplicant: Allow mesh configuration
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

d3BhX3N1cHBsaWNhbnQgZGVmY29uZmlnIGRvZXNuJ3QgZW5hYmxlIENPTkZJR19NRVNICmJ5IGRl
ZmF1bHQsIGFuZCBjdXJyZW50bHkgdGhlcmUgaXMgb25seSBhIHBhdGggdG8KZGlzYWJsZSBpdCBp
biBidWlsZHJvb3QuIFRoaXMgcGF0Y2ggd2lsbCByZXN0b3JlCnRoZSBsb2dpYyB0byBlbmFibGUg
aXQuCgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBla2thcmluZW5AdW5p
a2llLmNvbT4KLS0tCiBwYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1rIHwg
NCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5tayBiL3Bh
Y2thZ2Uvd3BhX3N1cHBsaWNhbnQvd3BhX3N1cHBsaWNhbnQubWsKaW5kZXggZTkwNzhiOWY4OS4u
M2U2MzJkNzI0NyAxMDA2NDQKLS0tIGEvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxp
Y2FudC5taworKysgYi9wYWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1rCkBA
IC0xMDQsNyArMTA0LDkgQEAgZWxzZQogV1BBX1NVUFBMSUNBTlRfQ09ORklHX0RJU0FCTEUgKz0g
Q09ORklHX1dJRklfRElTUExBWQogZW5kaWYKIAotaWZlcSAoJChCUjJfUEFDS0FHRV9XUEFfU1VQ
UExJQ0FOVF9NRVNIX05FVFdPUktJTkcpLCkKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfV1BBX1NVUFBM
SUNBTlRfTUVTSF9ORVRXT1JLSU5HKSx5KQorV1BBX1NVUFBMSUNBTlRfQ09ORklHX0VOQUJMRSAr
PSBDT05GSUdfX01FU0gKK2Vsc2UKIFdQQV9TVVBQTElDQU5UX0NPTkZJR19ESVNBQkxFICs9IENP
TkZJR19NRVNICiBlbmRpZgogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxp
c3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
