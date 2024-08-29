Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36366CA0EC8
	for <buildroot@archiver.kernel.org>; Thu, 29 Aug 2024 23:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC65660612;
	Thu, 29 Aug 2024 23:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulSle9CZfKDp; Thu, 29 Aug 2024 23:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E924861198
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E924861198;
	Thu, 29 Aug 2024 23:35:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5F21BF847
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 23:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 29A3540604
 for <buildroot@lists.busybox.net>; Thu, 29 Aug 2024 23:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0E4jfxkisZe for <buildroot@lists.busybox.net>;
 Thu, 29 Aug 2024 23:35:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2a; helo=mail-vk1-xa2a.google.com;
 envelope-from=alistair23@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B4848401C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B4848401C2
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B4848401C2
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 23:35:55 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id
 71dfb90a1353d-4fcec06ce09so233973e0c.3
 for <buildroot@buildroot.org>; Thu, 29 Aug 2024 16:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724974554; x=1725579354;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TzeL7NsZ6kGH2cQTmlgEGNUVSlSJZm9Z6aQe3ZmQhFs=;
 b=LasyHy7c54ghZ8XxIHEKc9Kw0aM+T8qtSTq2iX3i9rUGqIM8kaFq+F3+DSP+NePd+e
 +iIzdCa2J+2ttyX+oLCrZjcu3utnHUFQnwsRxxWWIaCB+5Zqh7sNC831bWfQCEtWebFF
 f05rmFqzqOnlbiAQof0nMOYx2YqGUqP99KHY2EHRHmzjROBNO4WvjeIbw3LdAaX6Q7wO
 hpCypPtd2uO9PhvB3KzImP2khf6sTBuoBDKkIkGWfWnC9lb3aJrvLLZNT+y7ylprWPQF
 Rb07eF7a1VfvYLSu9xFgewF9mkRftE1QbGqG1EtjD4OKCGGpPNIcW1Lr/3M4w2WNQac7
 CqeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzA+81LxweIKApLdXAVxh/I9wo6Md3fneDkSHDOQtcDKnYTFoLddqr5l1SL3irhXK6fipUJYWrxhA=@buildroot.org
X-Gm-Message-State: AOJu0YzAgIj84wWzR+b8DF4JfgGPFy/5MEESmXMG1NH97c5pfSOqaE4X
 njy3G27rfpdphD1k3qrx5wfGqEYgAiSURihjdHyYqVa3zCiAPmsKjbjOVXjm935byVcLJ/4oPAA
 11bpPe98Bd38KqyXq51OFE+t6BME=
X-Google-Smtp-Source: AGHT+IF1CTnfS3/edePFKMA0tsPscIb6I3NymFKklc8C39o1VAtM3YZx5LmY5S14Yq8NyPeFPwjtjaGY5oqNkfLdHrY=
X-Received: by 2002:a05:6122:3bd1:b0:4f5:cd00:e492 with SMTP id
 71dfb90a1353d-4ffe9ec2a8bmr5281426e0c.7.1724974554124; Thu, 29 Aug 2024
 16:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240829154150.174934-1-bmeng.cn@gmail.com>
In-Reply-To: <20240829154150.174934-1-bmeng.cn@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 30 Aug 2024 09:35:27 +1000
Message-ID: <CAKmqyKOX2=mJODKPBERNXvhz5NHzyp0MMroOG66WTLZXNoxd6Q@mail.gmail.com>
To: Bin Meng <bmeng.cn@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724974554; x=1725579354; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TzeL7NsZ6kGH2cQTmlgEGNUVSlSJZm9Z6aQe3ZmQhFs=;
 b=hXDF7alQmIwUL/8KRunnAO8gvxyHLKd3awPr1XwDbDj4jJhR87rYB1t5MmjaO/u7gR
 9gb7CdTAwGRFmTdgg4tv6tcftloTFqzbe9Pc5sXAof/JLbPBOwzDBPekofs4ze74x3ez
 ul0IiVGMsWrWHYzpTBKZ3tmMbYVh4uE6/HLPgWHsWB+4grP0q8tklsYV/+ZUSgFyQ8MO
 S0tT6kmKdXC/zB2Q0k7XvDQNBtUPhh82Qe01dwg+6HAvHkY/kWUSD31qk1X/UAiplTkf
 sRkiq6Z9IcFPYQh5nAV2IdsheJrrF1b0C6xlnhLZtGkvYxQhLMgNsvcvhuc1rOI3J6C6
 Cv1A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=hXDF7alQ
Subject: Re: [Buildroot] [PATCH v2] configs: riscv: qemu: Drop
 BR2_TARGET_OPENSBI_CUSTOM_VERSION
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
Cc: Bin Meng <bmeng@tinylab.org>, Alistair Francis <alistair.francis@wdc.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBBdWcgMzAsIDIwMjQgYXQgMTo0MuKAr0FNIEJpbiBNZW5nIDxibWVuZy5jbkBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogQmluIE1lbmcgPGJtZW5nQHRpbnlsYWIub3JnPgo+Cj4g
VXBkYXRlIHFlbXVfcmlzY3YzMl92aXJ0X2RlZmNvbmZpZyBhbmQgcWVtdV9yaXNjdjY0X3ZpcnRf
ZGVmY29uZmlnCj4gdG8gdXNlIHRoZSBsYXRlc3QgT3BlblNCSSBkdWUgdG8gdGhlIHJlYXNvbiB0
aGF0Ogo+Cj4gMS4gdGhleSBhcmUgdGhlIG1haW4gcGxhdGZvcm1zIHRvIGRldmVsb3AgYW5kIHRl
c3QgT3BlblNCSQo+IDIuIGxhdGVzdCBPcGVuU0JJIGJpbmFyaWVzIGFyZSBhbHdheXMgaW50ZWdy
YXRlZCBpbnRvIFFFTVUgYXMKPiAgICB0aGUgZGVmYXVsdCBiaW9zCj4KPiBTaWduZWQtb2ZmLWJ5
OiBCaW4gTWVuZyA8Ym1lbmdAdGlueWxhYi5vcmc+CgpSZXZpZXdlZC1ieTogQWxpc3RhaXIgRnJh
bmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29tPgoKQWxpc3RhaXIKCj4gLS0tCj4gU2VlIHYx
IEAgaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8y
MDIzMDYyNjE2MDAzMC45MzA2My03LWJtZW5nLmNuQGdtYWlsLmNvbS8KPgo+IENoYW5nZXMgaW4g
djI6Cj4gLSBPbmx5IHVwZGF0ZSBRRU1VIGRlZmNvbmZpZyBmaWxlcwo+Cj4gIGNvbmZpZ3MvcWVt
dV9yaXNjdjMyX3ZpcnRfZGVmY29uZmlnIHwgMiAtLQo+ICBjb25maWdzL3FlbXVfcmlzY3Y2NF92
aXJ0X2RlZmNvbmZpZyB8IDIgLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9yaXNjdjMyX3ZpcnRfZGVmY29uZmlnIGIvY29u
Zmlncy9xZW11X3Jpc2N2MzJfdmlydF9kZWZjb25maWcKPiBpbmRleCA2MzE1MjZiNjk1Li4yOGJi
MmIwY2Q2IDEwMDY0NAo+IC0tLSBhL2NvbmZpZ3MvcWVtdV9yaXNjdjMyX3ZpcnRfZGVmY29uZmln
Cj4gKysrIGIvY29uZmlncy9xZW11X3Jpc2N2MzJfdmlydF9kZWZjb25maWcKPiBAQCAtMjksOCAr
MjksNiBAQCBCUjJfTElOVVhfS0VSTkVMX0lNQUdFPXkKPgo+ICAjIEJvb3Rsb2FkZXIKPiAgQlIy
X1RBUkdFVF9PUEVOU0JJPXkKPiAtQlIyX1RBUkdFVF9PUEVOU0JJX0NVU1RPTV9WRVJTSU9OPXkK
PiAtQlIyX1RBUkdFVF9PUEVOU0JJX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSIxLjIiCj4gIEJSMl9U
QVJHRVRfT1BFTlNCSV9QTEFUPSJnZW5lcmljIgo+Cj4gICMgaG9zdC1xZW11IGZvciBnaXRsYWIg
dGVzdGluZwo+IGRpZmYgLS1naXQgYS9jb25maWdzL3FlbXVfcmlzY3Y2NF92aXJ0X2RlZmNvbmZp
ZyBiL2NvbmZpZ3MvcWVtdV9yaXNjdjY0X3ZpcnRfZGVmY29uZmlnCj4gaW5kZXggMzFhYzFkMWVk
OS4uNTQ5OTljZmVlNyAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3FlbXVfcmlzY3Y2NF92aXJ0X2Rl
ZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvcWVtdV9yaXNjdjY0X3ZpcnRfZGVmY29uZmlnCj4gQEAg
LTI5LDggKzI5LDYgQEAgQlIyX0xJTlVYX0tFUk5FTF9JTUFHRT15Cj4KPiAgIyBCb290bG9hZGVy
Cj4gIEJSMl9UQVJHRVRfT1BFTlNCST15Cj4gLUJSMl9UQVJHRVRfT1BFTlNCSV9DVVNUT01fVkVS
U0lPTj15Cj4gLUJSMl9UQVJHRVRfT1BFTlNCSV9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMS4yIgo+
ICBCUjJfVEFSR0VUX09QRU5TQklfUExBVD0iZ2VuZXJpYyIKPgo+ICAjIGhvc3QtcWVtdSBmb3Ig
Z2l0bGFiIHRlc3RpbmcKPiAtLQo+IDIuMzQuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
