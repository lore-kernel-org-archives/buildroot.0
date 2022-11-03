Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 130BCC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 22:53:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C5D540BDA;
	Thu,  3 Nov 2022 22:53:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C5D540BDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mbIn-TkTch7q; Thu,  3 Nov 2022 22:53:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5DA640BCE;
	Thu,  3 Nov 2022 22:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5DA640BCE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3FFDE1BF331
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:53:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26FBD41875
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 22:53:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26FBD41875
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Czfr8jS9LBit for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 22:53:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCCBB417A6
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCCBB417A6
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 22:53:17 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j15so4839187wrq.3
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 15:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wgR9K6q2qfjoCVMUUwN3IPDtFuSgIe4R5sN3CJhls4A=;
 b=OYHjEH1JjSyUkYSiBTQu/A9iFIh94GwpLwIvgA4gRDqLfhpMNek93+PeSHfTN4xgNI
 G/K3xIo1WEJfXrOkdWAGReYSb6RvkV7R+SpxsoSYkRqULLDTX3FJYZrxmrVOfdZmW2qn
 2iO1/hzwMDBjHYqSxD1FcWbsDwq5yfi0vwpvIefookiqKyVK+6fAvVErFapfWCbtfetb
 vC4AK0zu1M43z7dlHA2ScwMqcNcnnHBRVrXYcFD5SrEjxpnc1NKjg7RRkxZXHGtT1XYo
 1IzYsn3tpr0N51J69uuTzY3rkPK0KC2CeaCEFhH/vwqgIDSS7VgkDtoOcsYFxiPKFRUn
 981A==
X-Gm-Message-State: ACrzQf1L3hYkLWIL3oPFavLPqsOLF3zz/7K3rrhFc6ZylqWOOsFn/ar4
 0lXGGD80CQ1Yxfmu3o85B4p5xGfFqXM=
X-Google-Smtp-Source: AMsMyM4mlLJXEKpISK5muZ84wUdBbUyqhG4H9An5MURS7dVpn/UYRxxXLgdkRIqdTTuNEgrGFigwCg==
X-Received: by 2002:adf:f9cf:0:b0:236:6a26:c055 with SMTP id
 w15-20020adff9cf000000b002366a26c055mr20520439wrr.195.1667515995218; 
 Thu, 03 Nov 2022 15:53:15 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 x17-20020a1c7c11000000b003a3170a7af9sm1119979wmc.4.2022.11.03.15.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 15:53:14 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 23:52:24 +0100
Message-Id: <20221103225224.6375-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wgR9K6q2qfjoCVMUUwN3IPDtFuSgIe4R5sN3CJhls4A=;
 b=R+97XhVOUYCdrBHCjZQxvhMt27sYbju9SxE8S85iqm18ekeC1EYGGaa027pItq4eEV
 NtV3ewwZ6R0krLKGA66Wd0D1htcNZ11S6r6u0aqHNBDoJPqrZmbx1sY9jKd8bIWit3vH
 HABwp3gA1MFdgpcp81Ef/77vsyaeQPLUGT1e1EapkVxU+yybKCIskuhHTJuvFmYwkB9+
 8q8bh5y74HRyqyWgwwkgvDRJIGXskBahykBxGFxP1V02goegDnb3kXeLPe+jtMWL9h5u
 J1AfIaOFnY5+Pgh2flJmB6cwaF3MWbcrSHVQWv4kRqp+VF9B3cjyHkpK8ubn59g+sze3
 4AYw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R+97XhVO
Subject: [Buildroot] [PATCH 1/1] package/wolfssl: bump to version 5.5.3
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IGZvciBwb3NzaWJsZSBidWZmZXIgemVyb2l6YXRpb24gb3ZlcnJ1biBpbnRyb2R1Y2VkIGF0
IHRoZSBlbmQgb2YKdjUuNS4yIHJlbGVhc2UgY3ljbGUgaW4gR2l0SHViIHB1bGwgcmVxdWVzdCA1
NzQzICgjNTc0MykgYW5kIGZpeGVkIGluCnB1bGwgcmVxdWVzdCA1NzU3ICgjNTc1NykuIEluIHRo
ZSBjYXNlIHdoZXJlIGEgc3BlY2lmaWMgbWVtb3J5CmFsbG9jYXRpb24gZmFpbGVkIG9yIGEgaGFy
ZHdhcmUgZmF1bHQgaGFwcGVuZWQgdGhlcmUgd2FzIHRoZSBwb3RlbnRpYWwKZm9yIGFuIG92ZXJy
dW4gb2YgMOKAmXMgd2hlbiBtYXNraW5nIHRoZSBidWZmZXIgdXNlZCBmb3IgKEQpVExTIDEuMiBh
bmQKbG93ZXIgb3BlcmF0aW9ucy4gKEQpVExTIDEuMyBvbmx5IGFuZCBjcnlwdG8gb25seSB1c2Vy
cyBhcmUgbm90IGFmZmVjdGVkCmJ5IHRoZSBpc3N1ZS4gVGhpcyBpcyBub3QgcmVsYXRlZCBpbiBh
bnkgd2F5IHRvIHJlY2VudCBpc3N1ZXMgcmVwb3J0ZWQKaW4gT3BlblNTTC4KCmh0dHBzOi8vZ2l0
aHViLmNvbS93b2xmU1NML3dvbGZzc2wvcmVsZWFzZXMvdGFnL3Y1LjUuMy1zdGFibGUKClNpZ25l
ZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgot
LS0KIHBhY2thZ2Uvd29sZnNzbC93b2xmc3NsLmhhc2ggfCAyICstCiBwYWNrYWdlL3dvbGZzc2wv
d29sZnNzbC5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS93b2xmc3NsL3dvbGZzc2wuaGFzaCBi
L3BhY2thZ2Uvd29sZnNzbC93b2xmc3NsLmhhc2gKaW5kZXggNjVkNzdjYTY1OS4uMDgyNjIxMTNh
MCAxMDA2NDQKLS0tIGEvcGFja2FnZS93b2xmc3NsL3dvbGZzc2wuaGFzaAorKysgYi9wYWNrYWdl
L3dvbGZzc2wvd29sZnNzbC5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBMb2NhbGx5IGNvbXB1dGVk
Ogotc2hhMjU2ICA0OWM2MTk1NDYyY2FlMDM0ZWZlNmM4NjI2ODgyNGJhNTE1NjgyNTA4YTVmNTE5
OTM1OGQ1NmE0MTY4YTgyY2YwICB3b2xmc3NsLTUuNS4yLnRhci5negorc2hhMjU2ICBmZDMxMzVi
ODY1N2QwOWZiOTZhOGFhZDE2NTg1ZGE4NTBiOTZlYTQyMGFlOGNlNWFjNGQ1ZmRmYzYxNGMyNjgz
ICB3b2xmc3NsLTUuNS4zLnRhci5negogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZXM6CiBzaGEy
NTYgIDgxNzdmOTc1MTMyMTM1MjZkZjJjZjYxODRkOGZmOTg2YzY3NWFmYjUxNGQ0ZTY4YTQwNDAx
MDUyMWI4ODA2NDMgIENPUFlJTkcKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd29sZnNzbC93b2xmc3Ns
Lm1rIGIvcGFja2FnZS93b2xmc3NsL3dvbGZzc2wubWsKaW5kZXggZDlmYTcyY2NmNC4uY2QzYWNk
OTQxMSAxMDA2NDQKLS0tIGEvcGFja2FnZS93b2xmc3NsL3dvbGZzc2wubWsKKysrIGIvcGFja2Fn
ZS93b2xmc3NsL3dvbGZzc2wubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIwogCi1XT0xGU1NMX1ZFUlNJT04gPSA1LjUuMgorV09MRlNTTF9WRVJTSU9OID0gNS41
LjMKIFdPTEZTU0xfU0lURSA9ICQoY2FsbCBnaXRodWIsd29sZlNTTCx3b2xmc3NsLHYkKFdPTEZT
U0xfVkVSU0lPTiktc3RhYmxlKQogV09MRlNTTF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKIAotLSAK
Mi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
