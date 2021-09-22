Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBA7C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 11:38:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CAD260FA0
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 11:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2CAD260FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB56484239;
	Wed, 22 Sep 2021 11:38:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DcIjnwbW2Wip; Wed, 22 Sep 2021 11:38:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4186184003;
	Wed, 22 Sep 2021 11:38:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0311BF3BE
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 11:38:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1E0C404FB
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 11:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ccvoaq7pUiZ8 for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 11:38:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F2CA400AF
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 11:38:24 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id y28so10931863lfb.0
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 04:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldcM/PfbmWlprOvBgXuUgQ+KvP+eryfiEPTXJSkTeBI=;
 b=l3zWQGLK7Ll79Z/ETvv7vG3NB8u5WhDYM8na9X1vzOeS0kcXF9LHn7XjywEKVEbp1x
 Rea32Tyk+Oci4KbykMWH5rAnwHs+YjyIdTBiPrOsLavTr+/LzTt167rykjWLM1NGVXc3
 H4/KwQmu9hChpvgXutUf/Ae5+g+XEn6A7hkJ9Dg//LM55Ij6nkv1ZrrRB9GgfAjD7HQd
 snPF/WAMAczciIxQQ8Ewla1/vOrD84aDerSyS7bRWFHMwWqNYl/Z+Kt/f2IEfNCg3Gc9
 Cw6hpLyeKZrIy0T8KnqSfHSVM/pEQIv6qri5a6aB8dnE1rxZ3YMSpcJUJn58mf/I6fEQ
 Nurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldcM/PfbmWlprOvBgXuUgQ+KvP+eryfiEPTXJSkTeBI=;
 b=wRr1YEjkRJb+qkyMEBTY4nUrL1xe3Aks3+q/b3VrwCC9PQGwDCnBElZpahLlvj7+H4
 BzcYS43rDuPXjNYU8V8Dk7NsIXtU5nN6l0NGkqk+cNakob3trBvV5EiFPiOwZZURaCoe
 nf3KKy1S1A8G0Wsg9mDkLmYQdvtvetj5lMegJZ/6Ou6RPq7WERPoteVoyx2tj0QRW/3/
 lrvVCIqBirgYWIcvYMoaF3ZNlf/ujpmFHFZTSkRLrpJYXaHrOh2X3C8jcT9G7xByGkoh
 ASnoGoTHT6FGqb3kqMg+r/Q1cQU5VqH9Gi8bODb2E2W/EyfMO0T/3ZxZcFH3MPf+fjt6
 Tm/A==
X-Gm-Message-State: AOAM5319RGa0PjiOdOX6BxDegLdbY0R3hmn80YcqD01dcBLqh/S3v++P
 CJiBHo66RUjBiw0SdvlXDD0qREYJA/YHOsQ8
X-Google-Smtp-Source: ABdhPJwcPsK4/Ri0CCkl0bAT2YMI1WoGDjgDsQDx65tIyPAE6IqlGupaed+yitW6psrf+naASrS/Hg==
X-Received: by 2002:a05:6512:15a3:: with SMTP id
 bp35mr7657062lfb.11.1632310702026; 
 Wed, 22 Sep 2021 04:38:22 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id 3sm224194ljq.136.2021.09.22.04.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 04:38:21 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 14:38:20 +0300
Message-Id: <20210922113820.3628-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/wpa_supplicant: Allow mesh
 configuration
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
a2llLmNvbT4KLS0tClsgdjEgLT4gdjIgXSBzL0NPTkZJR19fTUVTSC9DT05GSUdfTUVTSC8KCiBw
YWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1rIHwgNCArKystCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5tayBiL3BhY2thZ2Uvd3BhX3N1cHBs
aWNhbnQvd3BhX3N1cHBsaWNhbnQubWsKaW5kZXggZTkwNzhiOWY4OS4uM2MwYjBjMWRmYyAxMDA2
NDQKLS0tIGEvcGFja2FnZS93cGFfc3VwcGxpY2FudC93cGFfc3VwcGxpY2FudC5taworKysgYi9w
YWNrYWdlL3dwYV9zdXBwbGljYW50L3dwYV9zdXBwbGljYW50Lm1rCkBAIC0xMDQsNyArMTA0LDkg
QEAgZWxzZQogV1BBX1NVUFBMSUNBTlRfQ09ORklHX0RJU0FCTEUgKz0gQ09ORklHX1dJRklfRElT
UExBWQogZW5kaWYKIAotaWZlcSAoJChCUjJfUEFDS0FHRV9XUEFfU1VQUExJQ0FOVF9NRVNIX05F
VFdPUktJTkcpLCkKK2lmZXEgKCQoQlIyX1BBQ0tBR0VfV1BBX1NVUFBMSUNBTlRfTUVTSF9ORVRX
T1JLSU5HKSx5KQorV1BBX1NVUFBMSUNBTlRfQ09ORklHX0VOQUJMRSArPSBDT05GSUdfTUVTSAor
ZWxzZQogV1BBX1NVUFBMSUNBTlRfQ09ORklHX0RJU0FCTEUgKz0gQ09ORklHX01FU0gKIGVuZGlm
CiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
