Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B26C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 20:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 728A660811;
	Mon, 24 Mar 2025 20:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HR_mvXxE8TXn; Mon, 24 Mar 2025 20:51:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE59A6078D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE59A6078D;
	Mon, 24 Mar 2025 20:51:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 61DFEC0
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45E0E6078D
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AUbW5xKLZdBd for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 20:51:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 38DAD60618
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38DAD60618
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 38DAD60618
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 20:51:28 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-54ac9b3ddf6so4876780e87.1
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 13:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742849486; x=1743454286;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JCt9fdmPww0eBVPvr25MB3BAoyDV5vMf8yTu08i5Lbw=;
 b=NfDwD0/4+hy8stYSfKnr9aVD4Ya1ZkOeQDeMwRQH9yUByxsd/DV1ABnPA6xDQ+ZOuK
 yw/FxsLD76FeY3Ra2TngB+WOsCs23ush5sVO38vTmK5FJGyYw+j/0iqdeedeJyHq/2NA
 doiIhrvRZ6dPLB+Oo2w30hKRsrN7K0RgDOZaG6yuuNy6HGzZsi9se7TJVk0mUFYonAxq
 D4ysfdqSmSLY6OaW545prIHum6ooKQPATImitC5Ay6YZr5gsie2chj91J7ryJajgkBij
 /htBBtbiSldenM2JyOMZ9zF7nv7Wz4+O2b9lmzMHHCYogoxeA/dD9p1MtcmrZfDuFvaN
 2BzQ==
X-Gm-Message-State: AOJu0YxUd2ZBXal5M19AxHWAvETglEzW35FtKKHFulb6Aq6s0haFLWrU
 lxbY8sYoPQaTmwrrDHfV167dwzaqGxUZklYUroMACdvuYOOdpO1NQqwnMKYKzEfkRtXx0a7+TCe
 yjlanxHgy87nT16EHG9FNsfdRCY7M7g==
X-Gm-Gg: ASbGncsRDp+FW6sbDHuL9aVViKK2eH29m4RFkgxYTIPYeFst6e2BWrCi0GUiQJrBNsE
 +cPQ0gK+Si0flydQOzkZKZz+kHOf1E1+p4m+54lew+nPy6e2Ck7uHMp7UcotD86shDsAYEYVsId
 BouiHgIKe37VD7otHol9QeXyQEgxpFMtwtKQAnUvGIBnl3DnKIYk+d0OXQgQ==
X-Google-Smtp-Source: AGHT+IGuoFJ0rAzsArPLYilszEeQhhGOanamtcMlvDS6yHHTRzj6o+NdjDdEOiGYSrcNZoskeCAGhwgcNg9LawCTI+g=
X-Received: by 2002:a05:6512:138f:b0:545:fc8:e155 with SMTP id
 2adb3069b0e04-54ad647d115mr5298167e87.20.1742849485578; Mon, 24 Mar 2025
 13:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250306204730.29180-1-ju.o@free.fr>
In-Reply-To: <20250306204730.29180-1-ju.o@free.fr>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 24 Mar 2025 17:51:14 -0300
X-Gm-Features: AQ5f1JqjbNyzVx8KyToKdv8WAuGtuUA2Y4oM9H8QxLP2mUSLVaKQppovvKG8yjE
Message-ID: <CAOMZO5CQwTK81O1nS9jbe08MkUqer=Fe=d5uRc6cFSCgf7OLyA@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742849486; x=1743454286; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JCt9fdmPww0eBVPvr25MB3BAoyDV5vMf8yTu08i5Lbw=;
 b=arFoIW6UcVY/ThnCCbdbIGfioA8ZnKt7SmML7ToBNZeadJsM8LkWNyf75NUUoU2aa6
 Bj6l/TTJ8AlIH5UWb0967V5SEgRJR/8w/lLeqzwxXGJyLag5Ynd3tjsFm8GAs8pcy4T2
 MU6NDI0t9Uazfi4ZeDPDdqmZrjFUC+Pg+Qz+yEjSxNO+prWTygk5RgiFpcWuxJ18is+F
 xU4wKCymV19MwTDgDFf2dQdEyyZUT8zezodtDL5MFj023iCKPLzeqhpbQMgzd3ltlQXP
 YOoU4NsK76ILohTV/JUbCaA+HxFaeUP7f0J3izmTf03rc5dOFI3+A8OdfSSJMbdPs5jo
 9S+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=arFoIW6U
Subject: Re: [Buildroot] [PATCH next 1/1] configs/freescale_imx93frdm: new
 defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Martin Chabot <martin.chabot@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSnVsaWVuLAoKT24gVGh1LCBNYXIgNiwgMjAyNSBhdCA1OjQ44oCvUE0gSnVsaWVuIE9saXZh
aW4gPGp1Lm9AZnJlZS5mcj4gd3JvdGU6Cj4KPiBUaGlzIGNvbW1pdCBhZGRzIHN1cHBvcnQgZm9y
IHRoZSBpLk1YIDkzIEZSRE0gKEZyZWVkb20pIGJvYXJkLgo+Cj4gVGhlIGkuTVg5MyBGUkRNIGRl
dmVsb3BtZW50IGJvYXJkIGlzIGEgbG93LWNvc3QgYW5kIGNvbXBhY3QKPiBkZXZlbG9wbWVudCBi
b2FyZCBmZWF0dXJpbmcgdGhlIGkuTVg5MyBhcHBsaWNhdGlvbnMgcHJvY2Vzc29yLgo+Cj4gU2Vl
OiBodHRwczovL254cC5jb20vRlJETS1JTVg5MwoKTmljZSBib2FyZCEKCj4gVGhpcyBkZWZjb25m
aWcgaXMgYmFzZWQgb24gZnJlZXNjYWxlX2lteDkzZXZrX2RlZmNvbmZpZyBpbnRyb2R1Y2VkCj4g
YnkgU8OpYmFzdGllbiwgaW4gQ2MuCj4KPiBOb3RlOiB0aGUgTGludXggYW5kIFUtQm9vdCByZXBv
c2l0b3JpZXMgYXJlIGZvcmtzLiBUaGlzIGlzIGJlY2F1c2UKPiB0aGUgTlhQIHNvZnR3YXJlIHRl
YW0gZGlkIG5vdCBpbmNsdWRlZCBhbGwgdGhlIG5lY2Vzc2FyeSBpLk1YOTMgRlJETQo+IHBhdGNo
ZXMgaW4gdGhlIHN0YW5kYXJkIE5YUCBpLk1YIEJTUCBhdCB0aGUgdGltZSBvZiB0aGlzIGNvbW1p
dC4KPiBJbnN0ZWFkLCBwYXRjaGVzIHdlcmUgcHVibGlzaGVkIGluIGEgZGVkaWNhdGVkIFlvY3Rv
IExheWVyIGZyb20gWzFdLgo+IFRoZSBmb3JrcyB1c2VkIGluIHRoaXMgZGVmY29uZmlnIGFyZSBz
aW1wbHkgdGhlIHJlcG9zaXRvcmllcyBbMl0KPiBhbmQgWzNdIHdpdGggcGF0Y2hlcyBmcm9tIFsx
XSBhcHBsaWVkIG9uIHRoZW0uIFRoaXMgaXMgb25seSB0byBtYWtlIHRoaXMKPiBkZWZjb25maWcg
c2ltcGxlciBpbiB0aGUgbWVhbnRpbWUgdGhlIEJTUCBwYXRjaGVzIGFyZSBpbmNsdWRlZCBpbiB0
aGUKPiBOWFAgQlNQIHJlcG9zaXRvcmllcy4KPgo+IFRoYW5rcyB0byBNYXJ0aW4gQ2hhYm90IGZv
ciBsZW5kaW5nIGEgYm9hcmQhCgpJdCB3b3VsZCBiZSBncmVhdCB0byBnZXQgdGhpcyBib2FyZCBz
dXBwb3J0ZWQgaW4gdXBzdHJlYW0gVS1Cb290IGFuZCBrZXJuZWwuCgpJIGNhbiBoZWxwIHdpdGgg
dGhhdCBpZiBzb21lb25lIHNlbmRzIG1lIHRoaXMgYm9hcmQuCgpSZXZpZXdlZC1ieTogRmFiaW8g
RXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
