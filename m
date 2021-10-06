Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D2CCC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:38:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E680561163
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 20:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E680561163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 880604079B;
	Wed,  6 Oct 2021 20:38:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IY4bAFL-6cdH; Wed,  6 Oct 2021 20:38:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD32C4022F;
	Wed,  6 Oct 2021 20:38:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8A4D91BF34F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77B7C60F40
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 20:38:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 96LF4UwoLjSJ for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 20:38:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9571760F3E
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 20:38:32 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id u18so12476179wrg.5
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TeWUEOPPhyYUxgrFDjAwaOkvbwEPoBQiUdC+HeGQ+Ss=;
 b=DAvDjVF0J6wnUbcHtqbwUci72WRXLOYWcQuz4t4DW2pQ7z02D5iCsEEBK/90IhPptN
 Tqg89dzNWHUCCzDObhhtDBh/7Dmq/g+CAuB7qshdKAaf62MuwQOaY7Qq5MJUNSyQTMwf
 Zi/uhNjThEtYXo/z955L7gP9r4sWIcCSGcnG8SCLPf2Gc/aD6pAVUGgEnvN5YaIJD9S7
 GeV7GxjnhkSUjQ6s76jC9sYSBVtePxZhAbwcwykJuafH0cF8P7/UH3T/jhc3BORWmDF7
 QbJzkg0lJ7oGV2Xi0n+RFThJSgsOd1qvXJMBRKlnkbOtkM/Hlh/brlNA3jrcgKaeaBvz
 KS/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=TeWUEOPPhyYUxgrFDjAwaOkvbwEPoBQiUdC+HeGQ+Ss=;
 b=NmyqYDc3edjcaZcPjmPnFLowFQ7Py5p82nOGEe2Ea23APqRbUniwDgWS41wk1TN+a1
 UvwWTWWyeYhXfErH0DMnzbrGVXem584S/mC5JsZJgxaO1RtywlamxIxqT+dA/Pzd+wCA
 +FOueGSzN5Nn+wpfHPgiRuKeVpQ863/6eoLQAxGzIsz2QsPTdt2ZOXEMnzWRPbkBw0lY
 TbLkj3PvGPnvVeMbOAk/MKDA7Td2b/qPXPUO8EfaDtvYAfFTkBEcG4rvl8VLS4d1Nu5z
 Mf87zsGcRtMutG9DggcLyUnv8jkr2G9cytRkTqB04Tjx++aeCcuv4Z8fuyBXB11fYvCK
 ukFA==
X-Gm-Message-State: AOAM531xX1Cv6yhfBfpDxj9Q+uCNn1/wHNSx/J3RH3CQiN/9vcZd4xwY
 qaCLqHXMj5Ndn22TfTmpSf5S81UDHTk=
X-Google-Smtp-Source: ABdhPJwu3h/zhOvk4ovJzDb1enr5OMSVi+wyHFZxDFzU7HnEWJ64a6gzSONIFNEkZ4vnPYDUsDi9eQ==
X-Received: by 2002:adf:ab59:: with SMTP id r25mr323347wrc.208.1633552710577; 
 Wed, 06 Oct 2021 13:38:30 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:a11c:d3e8:9e5:2853])
 by smtp.gmail.com with ESMTPSA id z5sm8570737wmp.26.2021.10.06.13.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 13:38:30 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 22:38:23 +0200
Message-Id: <20211006203823.2740442-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: fix python_flask_expect_python
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IGU2ZWUwN2Y0MWEyYiAocGFja2FnZS9weXRob24tZmxhc2stZXhwZWN0cy1qc29uOiBu
ZXcgcGFja2FnZSkKYWRkZWQgYSBub24tZnVuY3Rpb25hbCB0ZXN0IGNhc2UgdGhhdCwgYXMgbm90
aWNlZCBieSBFZGdhciwgZmFpbHMgd2l0aDoKCiAgICBBc3NlcnRpb25FcnJvcjogJyV7aHR0cF9j
b2RlfScgIT0gJzIwMCcKClRoYXQncyBiZWNhdXNlIHRoZSAlIHNpZ24gaXMgc2VsZi1lc2NhcGVk
LCDDoC1sYSBDLCBpbiB0aGUgZmlyc3QgcGFydApvZiB0aGUgY29tbWFuZCwgcHJvYmFibHkgdG8g
YXZvaWQgaXRzIGJlaW5nICUtZm9ybWF0dGVkLiBCdXQgb25seSB0aGUKc2Vjb25kIHBhcnQgb2Yg
dGhlIGNvbW1hbmQgaXMgJS1mb3JtYXR0ZWQsIHNvIHdlIGRvIG5vdCBuZWVkIHRvCnNlbGYtZXNj
YXBlICUgaW4gdGhlIGZpcnN0IHBhcnQuCgpBZGRpdGlvbmFsbHksIHNpbmNlIGViM2VlMzA3OGE3
NiAoc3VwcG9ydC90ZXN0aW5nL2luZnJhL2VtdWxhdG9yLnB5OgpwcmV2ZW50IHRoZSBjb21tYW5k
cyBmcm9tIHdyYXBwaW5nKSwgd2Ugbm8gbG9uZ2VyIG5lZWQgdG8gcGxheSB0cmlja3MKd2l0aCBj
b21tYW5kcyB0aGF0IGFyZSB0b28gbG9uZyB0byBmaXQgb24gdGhlIGZpcnN0IGxpbmUgb2YgdGhl
IHNoZWxsCnByb21wdC4KClNpZ25lZC1vZmYtYnk6IFlhbm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4u
MTk5OEBmcmVlLmZyPgpDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290
bGluLmNvbT4KQ2M6IEVkZ2FyIEJvbmV0IDxib25ldEBncmVub2JsZS5jbnJzLmZyPgotLS0KIC4u
Li90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fZmxhc2tfZXhwZWN0c19qc29uLnB5
ICAgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRo
b25fZmxhc2tfZXhwZWN0c19qc29uLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF9weXRob25fZmxhc2tfZXhwZWN0c19qc29uLnB5CmluZGV4IGI3MzI2ZjVkOWUuLjU1NzZj
YmEyYjQgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0
aG9uX2ZsYXNrX2V4cGVjdHNfanNvbi5weQorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3B5dGhvbl9mbGFza19leHBlY3RzX2pzb24ucHkKQEAgLTE3LDExICsxNywxMSBA
QCBjbGFzcyBUZXN0UHl0aG9uUHkzRmxhc2tFeHBlY3RzSnNvbihUZXN0UHl0aG9uUGFja2FnZUJh
c2UpOgogICAgIHRpbWVvdXQgPSA2MAogCiAgICAgZGVmIHRyeV9qc29uKHNlbGYsIHBheWxvYWQs
IGV4cGVjdHMpOgotICAgICAgICBjbWQgPSAiIiJjdXJsIC1zIC1vIC9kZXYvbnVsbCAtdyAiJSV7
aHR0cF9jb2RlfVxcbiIgLVggUE9TVCAiIiIKKyAgICAgICAgY21kID0gIiIiY3VybCAtcyAtbyAv
ZGV2L251bGwgLXcgIiV7aHR0cF9jb2RlfVxcbiIgLVggUE9TVCAiIiIKICAgICAgICAgY21kICs9
ICIiIi1IICJDb250ZW50LVR5cGU6IGFwcGxpY2F0aW9uL2pzb24iIC1kICclcycgaHR0cDovLzEy
Ny4wLjAuMTo1MDAwIiIiICUgcGF5bG9hZAogICAgICAgICBvdXRwdXQsIGV4aXRfY29kZSA9IHNl
bGYuZW11bGF0b3IucnVuKGNtZCwgdGltZW91dD1zZWxmLnRpbWVvdXQpCiAgICAgICAgIHNlbGYu
YXNzZXJ0RXF1YWwoZXhpdF9jb2RlLCAwKQotICAgICAgICBzZWxmLmFzc2VydEVxdWFsKG91dHB1
dFstMV0sIHN0cihleHBlY3RzKSkKKyAgICAgICAgc2VsZi5hc3NlcnRFcXVhbChvdXRwdXRbMF0s
IHN0cihleHBlY3RzKSkKIAogICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKICAgICAgICAgc2VsZi5s
b2dpbigpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
