Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACC8C433EF
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 21:03:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DA8D60E54
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 21:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DA8D60E54
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A1926083B;
	Sun, 31 Oct 2021 21:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YMs2PpGhE3pi; Sun, 31 Oct 2021 21:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80EAA6082C;
	Sun, 31 Oct 2021 21:03:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5D0B31BF327
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 21:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5433F40114
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 21:03:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CiWPPqfQvZ3M for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 21:03:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EC6740124
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 21:03:05 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so10563555wmz.2
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 14:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nugWD8RBJWs9+dlTwlIxTf7AQgkBxT09Rja5s2EOgfI=;
 b=eOfn6DDRySAAtjlzsEdfejxw5W8wxwGpOcYnlOLR3r7Oz3Uy4t+AUR72ckzU+2vf80
 HiKBZYFRdckFFtLUvZxTQHPB/ooOoAKcMUCUWXIM/FaDSa3u0N2XOuZwcAHf/pIr8iQq
 yGhZaLIxoXOZ1+OKudle7tBFfX+RMQ+B0ucFtN8dF1ppMGio4o7UZLqeHmaF0BHlNfGh
 E79deAATpJEmSYATf0S0DD1Tm+CrpblhKf9S4PCFWTE14cDbX9Tx35ngOrOv3Vtt9HnL
 bvFYmevT0GmwzdfbKkuq4kPFGkfc50XQFJ3cLZzVxC2F0+dYd7pXFwxmZzVVx5krA0lN
 TAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nugWD8RBJWs9+dlTwlIxTf7AQgkBxT09Rja5s2EOgfI=;
 b=nynj84qvf5kxjC+HNuVkXBXi0N4tu4ldq2lPCG7DXnLQqsxa9TaOOW+BI9Ef23KYxg
 F42K0DLqYEBhR7FnWkgnTf9wznin4qLaJj+kJIkZT3245iARqw/zNLBc0kk+seS2guKq
 4KQMuJSHjLaH7XkDdE7gAKxrUX4ZbuoanLQStfUxejkpHfgxHNFPMxTVLJ3eMNOrJ5Ga
 6exWM7WRO2xsGXu9A1Y71TKt0lbLYw/3rtYQyYyuGQ5HESm8UDu9UtP0z1WwNdUVJ1Q9
 QbfFN35XHJOZbs5h0++YJYqMNvAz91rVqc/YdNz9T9imTly7Atr/dX56xHZyF0F22iBs
 7DsA==
X-Gm-Message-State: AOAM531kpafc8ucDSQPX2nPaZ9i10N338l5Rm22Rt9PVCeizsysNSYBu
 suuLEovrD1JFa6uGtnjkCMK7aVIIOoA=
X-Google-Smtp-Source: ABdhPJwVAvrC/Eg2YNFRUwzoPCjylbnWt9l57Kg0SoLtatPQ4S8qKlVWoWZ7WJiz1YurHC7UcF5QTQ==
X-Received: by 2002:a7b:c31a:: with SMTP id k26mr34789944wmj.187.1635714183412; 
 Sun, 31 Oct 2021 14:03:03 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id n13sm7138701wrt.44.2021.10.31.14.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Oct 2021 14:03:02 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Oct 2021 22:02:57 +0100
Message-Id: <20211031210258.654193-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [WIP 1/2] package/luvi: don't use LUAJIT_VERSION for
 the luajit installation path
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
Cc: Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

THVhaml0IHBhY2thZ2UgaGFzIGJlZW4gcmVjZW50bHkgdXBkYXRlZCB0byB0aGUgbGF0ZXN0IGNv
bW1pdCBpbiB0aGUKbWFzdGVyIGJyYW5jaCBbMV0uIFNpbmNlIHRoZW4gTFVBSklUX1ZFUlNJT04g
ZG9lc24ndCBjb250YWluIHRoZSBsdWFqaXQKdmVyc2lvbiBhbnltb3JlIGJ1dCBhIGNvbW1pdCBo
YXNoOgoKTFVBSklUX1ZFUlNJT04gPSAwNWYxOTg0ZTFhODYyZTRiM2QzYzNiMzcwYzc3MzQ5MmUy
ZWRmODRhCgpVc2UgcGtnLWNvbmZpZyAtLXZhcmlhYmxlPXZlcnNpb24gbHVhaml0IGluIGx1dmkg
cGFja2FnZSB0byBzZXQKTFVBX1BBVEggY29ycmVjdGx5LgoKRml4ZXM6Cmx1YWppdDogdW5rbm93
biBsdWFKSVQgY29tbWFuZCBvciBqaXQuKiBtb2R1bGVzIG5vdCBpbnN0YWxsZWQKCmh0dHBzOi8v
Z2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMTcxMDU1MjYwNQoKWzFd
IDk0NTBiNTNjOGUwNmYxYjVhNzU4NDBiODJjMGY0NjYzYTVkNzVjNDUKClNpZ25lZC1vZmYtYnk6
IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KQ2M6IErDtnJnIEtyYXVzZSA8
am9lcmcua3JhdXNlQGVtYmVkZGVkLnJvY2tzPgotLS0KVGhlIFRlc3RMdXZpIGRvZXNuJ3Qgd29y
ayB5ZXQgZHVlIHRvIG1pc3Npbmcgcm5nIHN1cHBvcnQgb24gUWVtdSBhcm12NyB0YXJnZXQKdXNl
ZCB0byBydW4gdGhlIHRlc3QuIGx1dmkgLXYgaXMgc3R1Y2sgZHVlIHRvIGdldHJhbmRvbSgpLgot
LS0KIHBhY2thZ2UvbHV2aS9sdXZpLm1rIHwgOCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2x1dmkv
bHV2aS5tayBiL3BhY2thZ2UvbHV2aS9sdXZpLm1rCmluZGV4IDM4NmRhYWZjMzEuLmVmNTc3N2Nh
YzggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbHV2aS9sdXZpLm1rCisrKyBiL3BhY2thZ2UvbHV2aS9s
dXZpLm1rCkBAIC05LDcgKzksNyBAQCBMVVZJX1NPVVJDRSA9IGx1dmktc3JjLXYkKExVVklfVkVS
U0lPTikudGFyLmd6CiBMVVZJX1NJVEUgPSBodHRwczovL2dpdGh1Yi5jb20vbHV2aXQvbHV2aS9y
ZWxlYXNlcy9kb3dubG9hZC92JChMVVZJX1ZFUlNJT04pCiBMVVZJX0xJQ0VOU0UgPSBBcGFjaGUt
Mi4wCiBMVVZJX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4dAotTFVWSV9ERVBFTkRFTkNJRVMg
PSBsaWJ1diBsdWFqaXQgbHV2IGhvc3QtbHVhaml0CitMVVZJX0RFUEVOREVOQ0lFUyA9IGxpYnV2
IGx1YWppdCBsdXYgaG9zdC1sdWFqaXQgaG9zdC1wa2djb25mCiAKICMgRGlzcGF0Y2ggYWxsIGFy
Y2hpdGVjdHVyZXMgb2YgTHVhSklUCiBpZmVxICgkKEJSMl9pMzg2KSx5KQpAQCAtMzAsMTIgKzMw
LDE2IEBAIGVsc2UKIExVVklfVEFSR0VUX0FSQ0ggPSAkKEJSMl9BUkNIKQogZW5kaWYKIAorIyBM
VUFKSVRfVkVSU0lPTiBhbmQgdGhlIGx1YWppdCBpbnN0YWxsYXRpb24gcGF0aCBtYXkgbm90IHVz
ZSB0aGUKKyMgc2FtZSB2YWx1ZS4gVXNlIHRoZSB2YWx1ZSBmcm9tIGx1YWppdC5wYyBmaWxlLgor
TFVWSV9MVUFKSVRfVkVSU0lPTiA9ICQoc2hlbGwgJChQS0dfQ09ORklHX0hPU1RfQklOQVJZKSAt
LXZhcmlhYmxlPXZlcnNpb24gbHVhaml0KQorCiAjIEJ1bmRsZWQgbHVhIGJpbmRpbmdzIGhhdmUg
dG8gYmUgbGlua2VkIHN0YXRpY2FsbHkgaW50byB0aGUgbHV2aSBleGVjdXRhYmxlCiBMVVZJX0NP
TkZfT1BUUyA9IFwKIAktREJVSUxEX1NIQVJFRF9MSUJTPU9GRiBcCiAJLURXaXRoU2hhcmVkTGli
bHV2PU9OIFwKIAktRFRBUkdFVF9BUkNIPSQoTFVWSV9UQVJHRVRfQVJDSCkgXAotCS1ETFVBX1BB
VEg9JChIT1NUX0RJUikvc2hhcmUvbHVhaml0LSQoTFVBSklUX1ZFUlNJT04pLz8ubHVhCisJLURM
VUFfUEFUSD0kKEhPU1RfRElSKS9zaGFyZS9sdWFqaXQtJChMVVZJX0xVQUpJVF9WRVJTSU9OKS8/
Lmx1YQogCiAjIEFkZCAicmV4IiBtb2R1bGUgKFBDUkUgdmlhIGJ1bmRsZWQgbHJleGxpYikKIGlm
ZXEgKCQoQlIyX1BBQ0tBR0VfUENSRSkseSkKLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
