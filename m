Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A98C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 12:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C4EA40374;
	Tue, 23 Jul 2024 12:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3efgi7k_51T7; Tue, 23 Jul 2024 12:42:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA5FC40A12
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA5FC40A12;
	Tue, 23 Jul 2024 12:42:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0699C1BF83C
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 005C440A12
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 12:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DlVKeZpVCSE for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 12:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5F82C40374
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F82C40374
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5F82C40374
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 12:42:48 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52f01b8738dso2155072e87.1
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 05:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721738566; x=1722343366;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C1g+n2xrEYwow4c/46jJNF5L8FITnA7LtQxAA71Fhvg=;
 b=mO744z3jHFwhKYzFQR8WzMNNqBcU76fkJ3Y9vnAJy6yV39ny35HhPpVwLpFJAQDxIo
 q82AUqXWLKGa313CvAZnb0Y0a6DjWyDvSl9LV0oNO+CfLTSxn1hGeNxfuyi2RK/5lVV0
 mLVUYJLcvAS9Z7JVwIy3A8tWy7G6Fz4pr88TL3vNVQ3kIL+ANyXyjFkF81zU+BLYiZhg
 Ys222EJUDReH3QzNuVK3ChSk72xn78hZoqtQKymjqO3giupTHmNG1M1TXB5NfbxEUltq
 JDAZ4eqiI1uvJbhxqAEv94V4+lkrLvyJk+98OJtiJf3UYhZ+eMSGMFFbxlMeuxxeiOar
 KjEA==
X-Gm-Message-State: AOJu0Ywh2wXGIuJiqLSs+LBjDYRUXlwISkrN5rOz5yjzOv+7bpqSE3Gf
 7hIAcyj0QVCYcWrbNfocT7Dzjj/LaYywmWhMs7SQCmsNUwpp3cRP4pz8ctz//Ao3SQGcf/Nvj4M
 E6auoadYzvNHcAfEfVYL1qz3yC8BR2XTw
X-Google-Smtp-Source: AGHT+IHt+mKd1j1ow6sEkgeOUekDyOg+HkvUbrXmL1mRpFL1r30ErZdNPijy7TFAvcWNTLW8If2aQUzp43wgqL7Hlsg=
X-Received: by 2002:a05:6512:1385:b0:52c:99c9:bef6 with SMTP id
 2adb3069b0e04-52fc403d4e5mr2381462e87.7.1721738565986; Tue, 23 Jul 2024
 05:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240723120140.176562-1-fontaine.fabrice@gmail.com>
 <20240723142913.14d32208@windsurf>
In-Reply-To: <20240723142913.14d32208@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 23 Jul 2024 14:42:34 +0200
Message-ID: <CAPi7W824GkT6K-GL_eWiedg=cPFEksw0aWSjqFCWXb34Vux4tg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721738566; x=1722343366; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1g+n2xrEYwow4c/46jJNF5L8FITnA7LtQxAA71Fhvg=;
 b=dQ+M71dNVMm34jZALPZ4h7wpJSAd3tuYkFHAoVy73Tpdc3aOw3APUmYvWcSU4BfCBW
 2ml+tvyJCGl4kt15xFgqg/HbCSspwje93jtPz9em3NRFICxAxfNedrDPhxoa0St7XWSz
 DE7wEq6sfX0Ipxoz0L8GWf18ONzRPmwjvCwKvr3zgubWA5gVT7zAN+05C69R2EI7WHrn
 dabX+jAVcGVakGe4BvjzgOIca+Uts2UISFb6jfs2exy7J5INdkqfKeHoykck2q+20IWY
 7/gSjXGEtxy9eFlcPOPlbMoK1H3MYtg4g0MB8nzGKYG1Fn/4J34NzdLyiUH/nDMvHkTx
 Mcww==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dQ+M71dN
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: bump to version 4.0.4
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgbWFyLiAyMyBqdWlsLiAyMDI0IMOgIDE0OjI5LCBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxs
byBGYWJyaWNlLAo+Cj4gVGhhbmtzIGZvciB0aGUgYnVtcC4gT25lIHF1ZXN0aW9uIGJlbG93Lgo+
Cj4gT24gVHVlLCAyMyBKdWwgMjAyNCAxNDowMTo0MCArMDIwMAo+IEZhYnJpY2UgRm9udGFpbmUg
PGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gLVBST0NQU19OR19WRVJT
SU9OID0gMy4zLjE3Cj4gPiArUFJPQ1BTX05HX1ZFUlNJT04gPSA0LjAuNAo+Cj4gR29pbmcgZnJv
bSAzLnggdG8gNC54IHNlZW1zIGxpa2UgYSAiYmlnIiBidW1wIChub3Qgc3VyZSBleGFjdGx5IGhv
dyBiaWcKPiBpdCBpcykuIERpZCB5b3UgcmV2aWV3IGZvciBhbnkgbmV3IC4vY29uZmlndXJlIG9w
dGlvbiB0aGF0IHNob3VsZCBiZQo+IC0tZGlzYWJsZSBvciAtLXdpdGhvdXQsIG9yIHNvbWUgbmV3
IG9wdGlvbmFsIGRlcGVuZGVuY2llcywgZXRjLiA/CgpJIGRpZG4ndCBzcG90IGFueXRoaW5nIG5l
dyBpbiBjb25maWd1cmUuYWMgaGlzdG9yeS4KTW9yZW92ZXIsIEkgZm9yZ290IHRvIHB1dCBpdCBp
biB0aGUgY29tbWl0IG1lc3NhZ2UgYnV0IGJ1bXAgdG8gNC4wLjQKYWxzbyBmaXggQ1ZFLTIwMjMt
NDAxNjogaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjMtNDAxNgoKPgo+
IFRoYW5rcyEKPgo+IFRob21hcwo+IC0tCj4gVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5k
IENFTywgQm9vdGxpbgo+IEVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5k
IHRyYWluaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQoKQmVzdCBSZWdhcmRzLAoKRmFicmljZQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
