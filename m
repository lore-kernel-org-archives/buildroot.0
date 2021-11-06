Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B20C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 18:14:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52360610FD
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 18:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52360610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E65C04010B;
	Sat,  6 Nov 2021 18:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TZ3XVkFu3GWs; Sat,  6 Nov 2021 18:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0556F4020E;
	Sat,  6 Nov 2021 18:14:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 64A351BF350
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 18:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62125818C4
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 18:14:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RpaD7NG8r_PW for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 18:14:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AFF058196E
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 18:14:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d27so19040989wrb.6
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 11:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IxhVXzuaQNP2WA+LmSs9de6tCjRew5z7g5zalF4t/SI=;
 b=PPb+v/llQRafEDi+sve89nk8zzdCvR5EW1B3EoVoTbYYyc4cAK73dQxAq7NJYl5PS0
 c8CupUnV5JXGwLuIOKmdqKkV/V18+bAR99zaDHAFRGc+XdWcgZrKnH+2tFiRRakSK5gn
 xEHi0RalOM28eLGRf8mrPmZj9RcaKOUcwA5ODgCgYl4ve/3jKvEU5HS2pCucOg9BD8zw
 +Ly+KyvZ4C42RlWdzdq7P9//3wSsJuwjPz5bb+fHUwS00VM3ZEvHYMuU+CyymJepINfD
 wX4+/jrjia1p6HAnrVXHMdWoWSvsifechyaPmm+XN8xpUIzgC15aK7s7/+nwFrQ1kUsC
 SX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IxhVXzuaQNP2WA+LmSs9de6tCjRew5z7g5zalF4t/SI=;
 b=3d2dW/KAEa3Bark+H0BLjzA2OnlxFiprBAU77DyO+qRkcpmSa1JOxBv3h7KOz2mtMM
 215I1ZtNMaax/RZeUIy5/OmfXddBYSvjrzBNmdYFhPPTDNBkqDo1wmr9Ua445nJ4kZer
 sSQXBENsMg1VeUCmh4JxvAZp4OVIPxaHi7em2VLhpPyOko6mSpQR4nSrzUaViCEW3G0b
 LZd9mWKk9t27j0gkH/nfXWRWaJ6OwshTFbhOUpuCkk3zUQvqP/D9DlQrSTVNcoPLVlg3
 jxilhrcLDedR4QKFr7B+qQHu1hbKg7JCRBu9VpJWWK1ME1OHpe4r0C7fAsZIy7NGQhEA
 Utzw==
X-Gm-Message-State: AOAM5311qftrTDK+pOO1Sz53hhdg59WNCf1V/OuJqcFcUHe0N2CDu3SE
 k8/5RvuOa50VsjLA8lE46LDLnOdBg/g=
X-Google-Smtp-Source: ABdhPJyEgzTVDRgmRoM+h8zdEre1LfsSZ5808BULMcmuCRAbEd989pUfNDpJ4Mmgot+Igi33vTT8uw==
X-Received: by 2002:adf:f88c:: with SMTP id u12mr73908035wrp.29.1636222469385; 
 Sat, 06 Nov 2021 11:14:29 -0700 (PDT)
Received: from Clement-Blade14.home
 (2a01cb0003ba9b00ba9c69ad80a62dfa.ipv6.abo.wanadoo.fr.
 [2a01:cb00:3ba:9b00:ba9c:69ad:80a6:2dfa])
 by smtp.gmail.com with ESMTPSA id u15sm7423986wmq.13.2021.11.06.11.14.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 11:14:29 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 19:14:24 +0100
Message-Id: <20211106181424.299041-2-peron.clem@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211106181424.299041-1-peron.clem@gmail.com>
References: <20211106181424.299041-1-peron.clem@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/beelink_gs1: bump to linux 5.15,
 atf 2.5 and u-boot 2021.10
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bGliZmR0IGZhaWxzIHRvIGNvbXBpbGUgd2l0aCBvbiBDSS4KL3Vzci9iaW4vbGQ6IHNjcmlwdHMv
ZHRjL2R0Yy1wYXJzZXIudGFiLm86KC5ic3MrMHgxMCk6IG11bHRpcGxlIGRlZmluaXRpb24gb2Yg
YHl5bGxvYyc7IHNjcmlwdHMvZHRjL2R0Yy1sZXhlci5sZXgubzooLmJzcysweDApOiBmaXJzdCBk
ZWZpbmVkIGhlcmUKY29sbGVjdDI6IGVycm9yOiBsZCByZXR1cm5lZCAxIGV4aXQgc3RhdHVzCgpC
dW1wIFUtYm9vdCBhbmQgYWxzbyBLZXJuZWwgYW5kIEFURi4KClNpZ25lZC1vZmYtYnk6IENsw6lt
ZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+Ci0tLQogY29uZmlncy9iZWVsaW5rX2dz
MV9kZWZjb25maWcgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NvbmZpZ3MvYmVlbGlua19nczFfZGVm
Y29uZmlnIGIvY29uZmlncy9iZWVsaW5rX2dzMV9kZWZjb25maWcKaW5kZXggMTg3MmFhYmRmMC4u
Y2E5NTNkZjNlYSAxMDA2NDQKLS0tIGEvY29uZmlncy9iZWVsaW5rX2dzMV9kZWZjb25maWcKKysr
IGIvY29uZmlncy9iZWVsaW5rX2dzMV9kZWZjb25maWcKQEAgLTExLDExICsxMSwxMSBAQCBCUjJf
Uk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC9iZWVsaW5rL2dzMS9wb3N0LWJ1aWxkLnNo
IgogQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dlbmltYWdl
LnNoIgogQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyBib2FyZC9iZWVsaW5rL2dzMS9n
ZW5pbWFnZS5jZmciCiAKLSMgS2VybmVsIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEg
NS41IHNlcmllcwotQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RPTV81XzU9eQor
IyBLZXJuZWwgTGludXggaGVhZGVycyBzYW1lIGFzIGtlcm5lbCwgNS4xNSBzZXJpZXMKK0JSMl9Q
QUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xNT15CiBCUjJfTElOVVhfS0VSTkVM
PXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotQlIyX0xJTlVYX0tFUk5FTF9D
VVNUT01fVkVSU0lPTl9WQUxVRT0iNS41LjQiCitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJT
SU9OX1ZBTFVFPSI1LjE1IgogQlIyX0xJTlVYX0tFUk5FTF9VU0VfQVJDSF9ERUZBVUxUX0NPTkZJ
Rz15CiBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKIEJSMl9MSU5VWF9LRVJORUxfSU5U
UkVFX0RUU19OQU1FPSJhbGx3aW5uZXIvc3VuNTBpLWg2LWJlZWxpbmstZ3MxIgpAQCAtMjksMTQg
KzI5LDE0IEBAIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKICMgRmlybXdhcmUK
IEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkU9eQogQlIyX1RBUkdFVF9BUk1fVFJVU1RF
RF9GSVJNV0FSRV9DVVNUT01fVkVSU0lPTj15Ci1CUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1X
QVJFX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSJ2Mi4yIgorQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9G
SVJNV0FSRV9DVVNUT01fVkVSU0lPTl9WQUxVRT0idjIuNSIKIEJSMl9UQVJHRVRfQVJNX1RSVVNU
RURfRklSTVdBUkVfUExBVEZPUk09InN1bjUwaV9oNiIKIAogIyBCb290bG9hZGVyCiBCUjJfVEFS
R0VUX1VCT09UPXkKIEJSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQogQlIy
X1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTj15Ci1CUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9W
RVJTSU9OX1ZBTFVFPSIyMDIwLjAxIgorQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9W
QUxVRT0iMjAyMS4xMCIKIEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJiZWVsaW5r
X2dzMSIKIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfRFRDPXkKIEJSMl9UQVJHRVRfVUJPT1RfTkVF
RFNfUFlUSE9OMz15Ci0tIAoyLjMyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
