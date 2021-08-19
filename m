Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA07BC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 08:00:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C14C61139
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 08:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C14C61139
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22ADA80CCF;
	Thu, 19 Aug 2021 08:00:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yPaA88Rb3YIr; Thu, 19 Aug 2021 08:00:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7698280EC4;
	Thu, 19 Aug 2021 08:00:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 139931BF38D
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 08:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E69C34080D
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 08:00:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20150623.gappssmtp.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKXd5otwOItP for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 08:00:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6084540797
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 08:00:14 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id k5so10940438lfu.4
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 01:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SkPOPt/JS7cuIH/+72SLIiRVHYt2H6bDdvH27RFFbgE=;
 b=LrRuq9Fcyi1BXiMW/ub6hN/THHfLWcXHWuQYIhjrBsQ7qI8rtgyFddPQkY5775WKDh
 MxR65skuhNR3cYdS12yginavkxUvBksve9CX9BhfHprghcVvYW+Q3BBByQzrghPkhESz
 iXuNJ+82sMOoR7//MK0MHCT81lLCbUbdiPUUSPYHkh4STWYAjyvuqUvGf252Z6PeeBJB
 MfLEsTTFXiV9vtLuSRJ+Zr0i2Pz1fyaEbzrlr/iIGFdas7eubg/Qwof201/H+jRJRsog
 aVu4wBFHkZiHu827Jb6ILAM+NwvpXJF+XlVyOAZJEZ8EI/wiWd6/qW0Cmddxk7miQZcp
 l2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SkPOPt/JS7cuIH/+72SLIiRVHYt2H6bDdvH27RFFbgE=;
 b=gz6MgppXF8FQQKR/Hk5xNEJ9G3/pdijn5IyVlvgVUtPNLe2Ha2Pn0Eggwgw7gBB/Y5
 Pfk/S08l78DU5Ri20/Jm9Z8FJ++cV9hF4zh1euNKg1C4bNXJ/mt/mIbP/BzVkGxEqxOs
 mP0/ckA5to31vbvSQBfYnXuyxfBW4Fzw1JRyzRbuHEEmzAccjKljUpzpj1529ak0gXMT
 EozgbSFfbHP1xW2XIAI44Y7/dWA1zaFiyZ/gFZou/s1iy5CAJ/h88iYW9HHa3xpWY4Yz
 S5s+Q93IhJzutPe8rd/zsaR5OXl7aS3jDAZ9awsOLkRHHy7V3INujmi8msIT5uTyZevN
 pXgw==
X-Gm-Message-State: AOAM533bh6c3prljc/TQ7qu61IBOCni9uo77DnFc9Nzp5f/sgFn5mRwW
 kkunPfapH2B6hXi7IWV+Eu5vJesHpJdvV1aC
X-Google-Smtp-Source: ABdhPJxPBggNaihyjBQZjfHDWNLV53IbGZSja3d9UlgQrhmU9kX4Xdq0YDfBFG2yPZDT02bTcaxvkg==
X-Received: by 2002:a05:6512:3886:: with SMTP id
 n6mr9793076lft.279.1629360012078; 
 Thu, 19 Aug 2021 01:00:12 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id w4sm225478lfp.83.2021.08.19.01.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 01:00:11 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Thu, 19 Aug 2021 11:00:10 +0300
Message-Id: <20210819080010.426760-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libselinux: Add autorelabel for first
 boot
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Q3VycmVudGx5IGJ1aWxkcm9vdCBzaGlwIGxpYnNlbGludXggd2l0aG91dCB0cmlnZ2VyaW5nCnRo
aXMgb3B0aW9uLCB3aGljaCBvZnRlbiBzaG93cyBpbmNvbnNpc3RlbmNpZXMgYmV0d2Vlbgp3aGF0
IHRoZSByZWZwb2xpY3kgZGVmaW5lcyBhcyBhIGxhYmVsIGZvciBhIGZpbGUgYW5kCndoYXQgdGhl
IGFjdHVhbCBmaWxlIGhhcy4gVHJpZ2dlcmluZyBhbiBpbml0aWFsIHJlbGFiZWwKd291bGQgaGVs
cCBhY3RpdmF0aW5nIGVuZm9yY2luZyBzdGF0ZSByaWdodCBhd2F5IHdpdGhvdXQKcmVxdWlyaW5n
IHRvIGVudGVyIGl0IG9uY2UgaW4gcGVybWlzc2l2ZSBhbmQgdHdlYWsgdGhlCmxhYmVscy4KClNp
Z25lZC1vZmYtYnk6IEpvc8OpIFBla2thcmluZW4gPGpvc2UucGVra2FyaW5lbkB1bmlraWUuY29t
PgotLS0KIHBhY2thZ2UvbGlic2VsaW51eC9Db25maWcuaW4gICAgIHwgNSArKysrKwogcGFja2Fn
ZS9saWJzZWxpbnV4L2xpYnNlbGludXgubWsgfCA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgOSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzZWxpbnV4L0NvbmZpZy5pbiBi
L3BhY2thZ2UvbGlic2VsaW51eC9Db25maWcuaW4KaW5kZXggNjIwNzBjOGQ1OS4uNDllYjMwYmRk
ZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJzZWxpbnV4L0NvbmZpZy5pbgorKysgYi9wYWNrYWdl
L2xpYnNlbGludXgvQ29uZmlnLmluCkBAIC0xOCwzICsxOCw4IEBAIGNvbmZpZyBCUjJfUEFDS0FH
RV9MSUJTRUxJTlVYCiAKIGNvbW1lbnQgImxpYnNlbGludXggbmVlZHMgYSB0b29sY2hhaW4gdy8g
dGhyZWFkcywgZHluYW1pYyBsaWJyYXJ5IgogCWRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fSEFT
X1RIUkVBRFMgfHwgQlIyX1NUQVRJQ19MSUJTCisKK2NvbmZpZyBCUjJfUEFDS0FHRV9MSUJTRUxJ
TlVYX0FVVE9SRUxBQkVMCisJYm9vbAorCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfTElCU0VMSU5V
WAorCWRlZmF1bHQgeQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJzZWxpbnV4L2xpYnNlbGludXgu
bWsgYi9wYWNrYWdlL2xpYnNlbGludXgvbGlic2VsaW51eC5tawppbmRleCBmZGQxM2FhOTQyLi5k
ZTJlNzg4NGRmIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYnNlbGludXgvbGlic2VsaW51eC5tawor
KysgYi9wYWNrYWdlL2xpYnNlbGludXgvbGlic2VsaW51eC5tawpAQCAtNzEsNiArNzEsMTAgQEAg
ZGVmaW5lIExJQlNFTElOVVhfSU5TVEFMTF9UQVJHRVRfQ01EUwogCSQoVEFSR0VUX01BS0VfRU5W
KSAkKE1BS0UpIC1DICQoQEQpIFwKIAkJJChMSUJTRUxJTlVYX01BS0VfT1BUUykgREVTVERJUj0k
KFRBUkdFVF9ESVIpIFwKIAkJJChMSUJTRUxJTlVYX01BS0VfSU5TVEFMTF9UQVJHRVRTKQorCWlm
ZXEgKCQoQlIyX1BBQ0tBR0VfTElCU0VMSU5VWF9BVVRPUkVMQUJFTCkseSkKKwkJZWNobyAiLUYi
ID4gJChUQVJHRVRfRElSKS8uYXV0b3JlbGFiZWwKKwkJbWtkaXIgJChUQVJHRVRfRElSKS92YXIv
bGliL3NlbGludXgKKwlmaSAjIGF1dG9yZWxhYmVsCiAJaWYgISBncmVwIC1xICJzZWxpbnV4ZnMi
ICQoVEFSR0VUX0RJUikvZXRjL2ZzdGFiOyB0aGVuIFwKIAkJZWNobyAibm9uZSAvc3lzL2ZzL3Nl
bGludXggc2VsaW51eGZzIG5vYXV0byAwIDAiID4+ICQoVEFSR0VUX0RJUikvZXRjL2ZzdGFiIDsg
ZmkKIGVuZGVmCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0
Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
