Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29CAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:07:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 500A360E90
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 19:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 500A360E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D1B38271A;
	Fri, 12 Nov 2021 19:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7biyrv3NGSBB; Fri, 12 Nov 2021 19:07:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 736E9826FF;
	Fri, 12 Nov 2021 19:07:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E22E1BF31F
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F225061546
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 19:06:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fRx09bWUqNQu for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 19:06:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8D54B6151C
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 19:06:56 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 c71-20020a1c9a4a000000b0032cdcc8cbafso7518477wme.3
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 11:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=klxV3ILUIce0qY8rTQ0RtYw7r1WC7dw8csYxAG5nGTU=;
 b=p8vOV7VzNEYN1r+8407X6Uh7cC9byHutCqfl4PgQzzXvgOwB4iYHcGMQIfCjl8Wlq+
 AAFZKAblhy001H7PhD/AmalLDu4EYnsElMbtsSfZ1zCV4Dw+4vMLW/ckE27HertmcEnB
 zRb4Xx+kRXQJ9hHjb1/2mR6k+Id0Iybd0tv9wMCdRY+yXQlh5ZyHK5Uu/Cz52fI7yfxi
 xm59s6FwsaIcv9hVMGj5frY1DFuglF8p42p3yx4rZV1eEk1Qsk8kr3HtN1R2Tye0xCdM
 eW4ixNPgr1mn5ASvOs/j/BBcqS+Yj8yYgPUY86IfuFQb1K12dMVH8gEtQrAYwIGxc99n
 NWUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=klxV3ILUIce0qY8rTQ0RtYw7r1WC7dw8csYxAG5nGTU=;
 b=dmq4VsN2Tuu41lpIEcUtKH+FeUbddt6R9blrD7Dyz0KjA5d1WfcM8BMPjqUCiizZbO
 ig/Of0hoW85lKAu4L83mc7RPcicBKHthluV/xJGzCaXElUfKVkaoEZ874BgTQ/FVii1h
 sK8RZO1GIAmZELNMbj2vrDpGop1Pk5WL8Tv8Xy574+fNjeAMKnrr8WR9Dydjt8xV1ebT
 onVfIPTVwAanL/V5Xb8GInd//L2JZLicIXr5ykDM0wOdVjKjA2gYYvLPvSQLsN+ZYfRe
 131Z7Kx58JsGD3DnsLM6Qbh8n9phqSyHx2SFalAsfETj6Os43t52xT7haDOHdKH7itkk
 /jeg==
X-Gm-Message-State: AOAM533nDMfmxBMdgduibNorjyyZ9m4c/td4tXClJoJsmkISA7tds9/l
 UYAxtMPxMOl2UApt1TkVitdS8Qgj4ho=
X-Google-Smtp-Source: ABdhPJxMjbTx400brSzk85ErMIdSREgCieZsKHw3nkFgs4Ohme9n66oDJyHxjANYh7w0TLvj3ZfUfw==
X-Received: by 2002:a05:600c:104b:: with SMTP id
 11mr37921140wmx.54.1636744014846; 
 Fri, 12 Nov 2021 11:06:54 -0800 (PST)
Received: from atlas.home (arennes-651-1-314-16.w2-12.abo.wanadoo.fr.
 [2.12.73.16])
 by smtp.gmail.com with ESMTPSA id d15sm9462604wri.50.2021.11.12.11.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 11:06:54 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 20:06:45 +0100
Message-Id: <20211112190650.84234-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211112190650.84234-1-romain.naour@gmail.com>
References: <20211112190650.84234-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/6] package/luvi: don't use LUAJIT_VERSION
 for the luajit installation path
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
ZCB0byBydW4gdGhlIHRlc3QuIGx1dmkgLXYgaXMgc3R1Y2sgZHVlIHRvIGdldHJhbmRvbSgpLgoK
djI6IHVzZSBidWlsZC10aW1lIHNoZWxsIGV4cGFuc2lvbiAoWWFubikKLS0tCiBwYWNrYWdlL2x1
dmkvbHV2aS5tayB8IDggKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9sdXZpL2x1dmkubWsgYi9wYWNr
YWdlL2x1dmkvbHV2aS5tawppbmRleCAzODZkYWFmYzMxLi41ZGFhM2MxNzkzIDEwMDY0NAotLS0g
YS9wYWNrYWdlL2x1dmkvbHV2aS5taworKysgYi9wYWNrYWdlL2x1dmkvbHV2aS5tawpAQCAtOSw3
ICs5LDcgQEAgTFVWSV9TT1VSQ0UgPSBsdXZpLXNyYy12JChMVVZJX1ZFUlNJT04pLnRhci5negog
TFVWSV9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL2x1dml0L2x1dmkvcmVsZWFzZXMvZG93bmxv
YWQvdiQoTFVWSV9WRVJTSU9OKQogTFVWSV9MSUNFTlNFID0gQXBhY2hlLTIuMAogTFVWSV9MSUNF
TlNFX0ZJTEVTID0gTElDRU5TRS50eHQKLUxVVklfREVQRU5ERU5DSUVTID0gbGlidXYgbHVhaml0
IGx1diBob3N0LWx1YWppdAorTFVWSV9ERVBFTkRFTkNJRVMgPSBsaWJ1diBsdWFqaXQgbHV2IGhv
c3QtbHVhaml0IGhvc3QtcGtnY29uZgogCiAjIERpc3BhdGNoIGFsbCBhcmNoaXRlY3R1cmVzIG9m
IEx1YUpJVAogaWZlcSAoJChCUjJfaTM4NikseSkKQEAgLTMwLDEyICszMCwxNiBAQCBlbHNlCiBM
VVZJX1RBUkdFVF9BUkNIID0gJChCUjJfQVJDSCkKIGVuZGlmCiAKKyMgTFVBSklUX1ZFUlNJT04g
YW5kIHRoZSBsdWFqaXQgaW5zdGFsbGF0aW9uIHBhdGggbWF5IG5vdCB1c2UgdGhlCisjIHNhbWUg
dmFsdWUuIFVzZSB0aGUgdmFsdWUgZnJvbSBsdWFqaXQucGMgZmlsZS4KK0xVVklfTFVBSklUX1ZF
UlNJT04gPSBgJChQS0dfQ09ORklHX0hPU1RfQklOQVJZKSAtLXZhcmlhYmxlPXZlcnNpb24gbHVh
aml0YAorCiAjIEJ1bmRsZWQgbHVhIGJpbmRpbmdzIGhhdmUgdG8gYmUgbGlua2VkIHN0YXRpY2Fs
bHkgaW50byB0aGUgbHV2aSBleGVjdXRhYmxlCiBMVVZJX0NPTkZfT1BUUyA9IFwKIAktREJVSUxE
X1NIQVJFRF9MSUJTPU9GRiBcCiAJLURXaXRoU2hhcmVkTGlibHV2PU9OIFwKIAktRFRBUkdFVF9B
UkNIPSQoTFVWSV9UQVJHRVRfQVJDSCkgXAotCS1ETFVBX1BBVEg9JChIT1NUX0RJUikvc2hhcmUv
bHVhaml0LSQoTFVBSklUX1ZFUlNJT04pLz8ubHVhCisJLURMVUFfUEFUSD0kKEhPU1RfRElSKS9z
aGFyZS9sdWFqaXQtJChMVVZJX0xVQUpJVF9WRVJTSU9OKS8/Lmx1YQogCiAjIEFkZCAicmV4IiBt
b2R1bGUgKFBDUkUgdmlhIGJ1bmRsZWQgbHJleGxpYikKIGlmZXEgKCQoQlIyX1BBQ0tBR0VfUENS
RSkseSkKLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
