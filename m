Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908C7C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 15 Jul 2024 09:10:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 391CE81169;
	Mon, 15 Jul 2024 09:10:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4grVZCs15oe; Mon, 15 Jul 2024 09:10:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 269A581116
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 269A581116;
	Mon, 15 Jul 2024 09:10:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6EE031BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CF8060785
 for <buildroot@lists.busybox.net>; Mon, 15 Jul 2024 09:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQQnAGv1b69r for <buildroot@lists.busybox.net>;
 Mon, 15 Jul 2024 09:10:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 08E5E6078F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08E5E6078F
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 08E5E6078F
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 09:10:25 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-367a3d1a378so3613157f8f.1
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 02:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721034624; x=1721639424;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vQCFsCjooJ1QE+jtoKw42vS30Rqt/EEp5FQr4AYlFWI=;
 b=gnHd+zh8RSLiZVzlyxnZsredrrF0eRqg0eOIqDIv7PWNmtmHBvJt48PYTQ48hLlMf7
 hvL/tWcmwipw+y4CAEa/tXdn4VFUOJHTg+0hlymu427dGOPT0/fgV3pGw42q9hMV16i2
 UWSMyHr4yHCuX/fR9Ql4H1mAqXXjgscQvT3ocalkR1UI5N6qt/jchOH1HOk5j9pCRXEn
 vw7gvrc1i5wffCsJ0embhN56XMU7x7IUpZzbNkbPBp+Mor+eiOibh9RPT3jraRnQ68hr
 3Uru5gmafR6eB26litpDtk6VUfKNr8g7S7tgPeHo+yv6LwTtFWnSzCzWY9CWUt5NtLpn
 ZHpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKq86HBLFiwfpCVE6h80jenLo/dkSozKjsWuJOztntT29aKLCD7aLjt5LO9vvX4BzgvOaR5NlpFVT8iNFPSTgu/1bge06erg==
X-Gm-Message-State: AOJu0YzFiUsG+EbsyVShkPI74evEb6WYjipC4v18fcMa/pGdCM21FkmY
 jhK8OpDrRvKLyywtBekWSQpKAC9xaUYs+TDFNqmPyQrXpUwZ3DCDlv8YFLre
X-Google-Smtp-Source: AGHT+IHMV5AvxNu3LIrvGVQM42bq2yuInrNtnzWCf7xnjWceOYZkfTHyubZJJkj8pLf9HWzvxOnjcA==
X-Received: by 2002:adf:e683:0:b0:367:8fc3:a25f with SMTP id
 ffacd0b85a97d-367cea96453mr14915009f8f.37.1721034623516; 
 Mon, 15 Jul 2024 02:10:23 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3680dafbe93sm5730982f8f.77.2024.07.15.02.10.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 02:10:23 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 15 Jul 2024 11:10:22 +0200
Message-Id: <D2PZUUV1LBT7.1EDN48KIUUPUB@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Athaariq Ardhiansyah" <foss@athaariq.my.id>, <buildroot@buildroot.org>
X-Mailer: aerc 0.18.0-0-g5f8620445ed9
References: <20240714160457.39434-1-foss@athaariq.my.id>
In-Reply-To: <20240714160457.39434-1-foss@athaariq.my.id>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721034624; x=1721639424; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQCFsCjooJ1QE+jtoKw42vS30Rqt/EEp5FQr4AYlFWI=;
 b=NHakgG6UZu5/CvJcCMDZN8mg+yWR4qxAsZkbhybGyoryBdJwAJUMV3QeTRQKDuMuCx
 Ot6JeM+Kaow8NkczRC8UtxGJcCliVVPUpO4gDuU8TVP14XuY5dfBGGEpfnZNYeuGWM6e
 efZwO/rRsVwEXkME6hW4rflARVsV1CftbmfNfLdjCjW+RCaGadbnS95vpb9A/2z3/G5o
 eRh3VHarVFhu4tuC9yXLeHWdEBojmhYkzdvxkcPa2w4TYJyPkjeaaFIyG/64f1ZjVDdS
 V5RzYFXxN1TU09+rGxta8Rif03aL2jvY6Ld0peS7iX9efB/P7IWGbiKtRIRvB8vlWYXC
 U9zA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=NHakgG6U
Subject: Re: [Buildroot] [PATCH v4 1/3] package/rpi-firmware: bump version
 to 1.20240529
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXRoYWFyaXEsCgpUaGFua3MgZm9yIHRoZSBidW1wIQoKT24gU3VuIEp1bCAxNCwgMjAy
NCBhdCA2OjA0IFBNIENFU1QsIEF0aGFhcmlxIEFyZGhpYW5zeWFoIHdyb3RlOgo+IExhdGVzdCBS
UGkgZmlybXdhcmUgYWxyZWFkeSBwcm92aWRlZCBzdXBwb3J0IGZvciBSYXNwYmVycnkgUGkgNS4K
PgoKV2VsbCwgSSB0aGluayB0aGVyZSBpcyBubyBiaWcgdmFsdWUgYWJvdXQgdGhhdCBtZXNzYWdl
OyBmdXJ0aGVybW9yZSwgdGhlCmN1cnJlbnQgcmFzcGJlcnJ5NV9kZWZjb25maWcgZG9lcyBub3Qg
KHJlYWxseSkgdXNlIHRoYXQgcGFja2FnZToKIC0gSXQgbmVlZHMgdGhlIGNvbmZpZy50eHQgdGhh
dCBpcyAqKk5PVCoqIHBhcnQgb2YgdGhhdCBwYWNrYWdlLCB3ZWlyZAogICB0aG91Z2guCiAtIFNp
bmNlIHRoZSBwaTQsIChpLmUgcGk1IGluY2x1ZGVkKSB0aGUgZmlybXdhcmUgaXMgY29udGFpbmVk
IGluIHRoZQogICBFRVBST00gKGkuZS4gdGhlcmUgaXMgbm8gbW9yZSBib290Y29kZS5iaW4gaW4g
dGhlIGZpcnN0IGJvb3QKICAgcGFydGl0aW9uIHRvIGJvb3QgYSBwaSkuCiAtIFRoZSBkZXZpY2Ut
dHJlZSBibG9icyBhcmUgdGFrZW4gZnJvbSB0aGUgbGludXgga2VybmVsIChub3QgZnJvbSB0aGUK
ICAgcnBpLWZpcm13YXJlKS4KIC0gVGhlIHBpNSBoYXMgaXRzIG93biBkZWRpY2F0ZWQgY29uc29s
ZVsxXSwgdGhlcmVmb3JlIHRoZXJlIGlzIG5vIG1vcmUKICAgbmVlZHMgZm9yIHRoZSBkdG92ZXJs
YXk9bWluaXVhcnQtYnQgdG8gaGF2ZSBhIGNvbnNvbGU7IHRoaXMgaXMgd2h5CiAgIHRoZSByYXNw
YmVycnlwaTVfZGVmY29uZmlnIHVuc2V0cyB0aGUgY29uZmlnCiAgIEJSMl9QQUNLQUdFX1JQSV9G
SVJNV0FSRV9JTlNUQUxMX0RUQl9PVkVSTEFZUy4KCkxldCdzIGJhY2sgdG8gdGhlIGNvbW1pdCBt
ZXNzYWdlOyBpdCB3b3VsZCBoYXZlIG1vcmUgc2Vuc2UgaWYgeW91IHRlbGwKeW91ciBjaGFuZ2Ug
dXBkYXRlcyB0byB0aGUgcGFja2FnZSB2ZXJzaW9uIHRvIGEgdGFnIChpbnN0ZWFkIG9mIGEgdGFr
aW5nCmEgInJhbmRvbSIgY29tbWl0IGJldHdlZW4gdGFncykuIFRoZXNlIGRheXMsIHVwc3RyZWFt
IGhhcyByZWxlYXNlZCAoaS5lLgppdCBoYXMgdGFnZ2VkIGNvbW1pdHMpIG1vcmUgb2Z0ZW4gdGhh
biB3ZSBoYXZlIGJ1bXBlZCB0aGUgcGFja2FnZS4KVGhlcmVmb3JlLCBpdCBtYWtlcyBzZW5zZSB0
byBidW1wIHRoZSBycGktZmlybXdhcmUgdG8gYSB0YWdnZWQgY29tbWl0LgooVEJILCB0aGUgY29t
bWl0IHRpdGxlIHN1ZmZpY2VzIGJ5IGl0c2VsZiwgc28gbGVhdmluZyBpdCBibGFuayBpcyBmaW5l
CndpdGggbWUpLgoKSG93ZXZlciwgYW5kIHRoaXMgaXMgaW1wb3J0YW50LCB0aGUgcnBpLWZpcm13
YXJlIGFuZCB0aGUgbGludXgga2VybmVsCmZvciByYXNwYmVycnlwaSBhcmUgY2xvc2VseSAibGlu
a2VkIiB0b2dldGhlciBiZWNhdXNlIG9mIHRoZSBkZXZpY2UtdHJlZQpibG9icy4KCkluZGVlZCwg
dGhlIHJwaS1maXJtd2FyZSBwcm92aWRlcyB0aGUgZGV2aWNlLXRyZWUgYmxvYiBvdmVybGF5cyBh
bmQKdGhlc2UgZmlsZXMgbmVlZHMgdGhlIHN5bWJvbHMgb2YgdGhlIG1hdGNoaW5nIGRldmljZS10
cmVlIGJsb2JzIHRoYXQgYXJlCnByb3ZpZGVkIGJ5IHRoZSBrZXJuZWwuCgpBcyBhIGNvbnNlcXVl
bmNlLCB0aGUgdmVyc2lvbiBiZXR3ZWVuIHJwaS1maXJtd2FyZSBhbmQgbGludXggfn5zaG91bGR+
fgoqKk1VU1QqKiBtYXRjaCB0byBhdm9pZCBhbnkgYm9vdC1mYWlsdXJlIHdpdGggdGhlIHRoZSBs
b2FkIG9mIG92ZXJsYXlzLgoKSW4gYWxsLCBhIGJ1bXAgb2YgdGhlIHJwaS1maXJtd2FyZSAqKlNI
T1VMRCoqIGNvcnJlc3BvbmQgdG8gYSBidW1wIG9mCnRoZSBsaW51eCBrZXJuZWwsIGZvciBldmVy
eSByYXNwYmVycnlwaSBkZWZjb25maWcgZmlsZXMgKGluIGEgc2VwYXJhdGUKY29tbWl0KS4gU2Vl
IGNvbW1pdFsyXVszXS4KCllvdSB3aWxsIGZpbmQgdGhlIGNvbW1pdCBpZCBpbiBleHRyYS9naXRf
aGFzaFs0XSBpbiB0aGUgcnBpLWZpcm13YXJlCnRyZWU6IGMxNDMyYjRiYWU1YjY1ODJmNGQzMmJh
MzgxNDU5ZjMzYzM0ZDE0MjQuIEFuZCwgeW91IHdpbGwgZmlndXJlIG91dAppdCBjb3JyZXNwb25k
cyB0byB0YWcgc3RhYmxlXzIwMjQwNTI5WzVdIGluIHRoZSBsaW51eC1yYXNwYmVycnlwaSB0cmVl
LgoKQ291bGQgeW91IHVwZGF0ZSBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9UQVJCQUxMX0xPQ0FU
SU9OIGFjY29yZGluZ2x5IGluCmEgZGVkaWNhdGVkIGNvbW1pdD8gKEkgdGhpbmsgeW91IGNvdWxk
IHVzZSB0aGUgdGFnIG5hbWUsIG5vIHRlc3RlZCkuCgpUaGFua3MuCgo+IFNpZ25lZC1vZmYtYnk6
IEF0aGFhcmlxIEFyZGhpYW5zeWFoIDxmb3NzQGF0aGFhcmlxLm15LmlkPgo+Cj4gLS0tCj4gQ2hh
bmdlcyB2MSAtPiB2MjoKPiAgIC0gRml4IG1pc3NpbmcgZGVzY3JpcHRpb24gZHVlIHRvIHRlcm1p
bmFsIGlzc3VlCj4KPiBDaGFuZ2VzIHYyIC0+IHY0Ogo+ICAgLSBDaGFuZ2UgYmFjayBmcm9tIGNv
bW1pdCBJRCB0byBjb21taXQgdGFnCj4KPiBTaWduZWQtb2ZmLWJ5OiBBdGhhYXJpcSBBcmRoaWFu
c3lhaCA8Zm9zc0BhdGhhYXJpcS5teS5pZD4KCkl0IGlzIG5vdCBuZWNlc3NhcnkgdG8gU2lnbmVk
LW9mZi1ieSAodHdpY2UpIGluIHRoZSBjaGFuZ2Vsb2cgOikuCgo+IC0tLQo+ICBwYWNrYWdlL3Jw
aS1maXJtd2FyZS9ycGktZmlybXdhcmUuaGFzaCB8IDIgKy0KPiAgcGFja2FnZS9ycGktZmlybXdh
cmUvcnBpLWZpcm13YXJlLm1rICAgfCAyICstCj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBpLWZpcm13
YXJlL3JwaS1maXJtd2FyZS5oYXNoIGIvcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJl
Lmhhc2gKPiBpbmRleCA0NTAxZGI3MzljLi41ZGM2ZWZkOGIzIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5oYXNoCj4gKysrIGIvcGFja2FnZS9ycGktZmly
bXdhcmUvcnBpLWZpcm13YXJlLmhhc2gKPiBAQCAtMSwzICsxLDMgQEAKPiAgIyBMb2NhbGx5IGNv
bXB1dGVkCj4gLXNoYTI1NiAgMDBmZTU0ODczNzZlOWQ1ZWQxNGNiYzcyYTliN2E1YmQ4ZDY5MDBj
ODRhZWUxMGY2ZDY1NmYxOTJhMjZkMTYxYyAgcnBpLWZpcm13YXJlLTU0NzY3MjBkNTJjZjU3OWRj
MTYyNzcxNTI2MmIzMGJhMTI0MjUyNWUudGFyLmd6Cj4gK3NoYTI1NiAgNDhkMGIxYjA0MWJmNzdk
YzgxZDdlZDA0YzQyM2E3ZjRjZTBhZmQwZTNmYmVhMjY0NjIzMDllNzM4Yjg5YTU1MiAgcnBpLWZp
cm13YXJlLTEuMjAyNDA1MjkudGFyLmd6Cj4gIHNoYTI1NiAgYzcyODNmZjUxZjg2M2Q5M2EyNzVj
NjZlM2I0Y2IwODAyMWE1ZGQ0ZDhjMWU3YWNjNDdkODcyZmJlNTJkM2Q2YiAgYm9vdC9MSUNFTkNF
LmJyb2FkY29tCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2Fy
ZS5tayBiL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tawo+IGluZGV4IDdhZTlm
ZjZjMjguLjgxMDY2ZjBmYzAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9ycGktZmlybXdhcmUvcnBp
LWZpcm13YXJlLm1rCj4gKysrIGIvcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLm1r
Cj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4g
LVJQSV9GSVJNV0FSRV9WRVJTSU9OID0gNTQ3NjcyMGQ1MmNmNTc5ZGMxNjI3NzE1MjYyYjMwYmEx
MjQyNTI1ZQo+ICtSUElfRklSTVdBUkVfVkVSU0lPTiA9IDEuMjAyNDA1MjkKPiAgUlBJX0ZJUk1X
QVJFX1NJVEUgPSAkKGNhbGwgZ2l0aHViLHJhc3BiZXJyeXBpLGZpcm13YXJlLCQoUlBJX0ZJUk1X
QVJFX1ZFUlNJT04pKQo+ICBSUElfRklSTVdBUkVfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+ICBS
UElfRklSTVdBUkVfTElDRU5TRV9GSUxFUyA9IGJvb3QvTElDRU5DRS5icm9hZGNvbQoKUGxlYXNl
IHRlbGwgbWUgaWYgaXQgaXMgdW5jbGVhciBvciBpZiBJIG1pc3NlZCBzb21ldGhpbmc7IEkgYW0g
bm8KbWFpbnRhaW5lciwgYW5kIEkgbWF5IHNheSBzdHVwaWQgdGhpbmdzIDopCgpSZWdhcmRzLApH
YcOrbAoKWzFdOiBodHRwczovL3d3dy5yYXNwYmVycnlwaS5jb20vZG9jdW1lbnRhdGlvbi9jb21w
dXRlcnMvY29uZmlndXJhdGlvbi5odG1sI3ByaW1hcnktYW5kLXNlY29uZGFyeS11YXJ0ClsyXTog
aHR0cHM6Ly9naXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QvY29tbWl0LzUxYjQ0MjE3NThl
NWNjYmEwZjA1MTY3MmNjZDI4YmMzMTE0OTQ4ZDkKWzNdOiBodHRwczovL2dpdGh1Yi5jb20vYnVp
bGRyb290L2J1aWxkcm9vdC9jb21taXQvMjhlNjk1M2JhODRkMzlhNjA3NGFlZTQzOWE2NGVmODZi
MTA5ZGNmMApbNF06IGh0dHBzOi8vZ2l0aHViLmNvbS9yYXNwYmVycnlwaS9maXJtd2FyZS9ibG9i
LzEuMjAyNDA1MjkvZXh0cmEvZ2l0X2hhc2gKWzVdOiBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJl
cnJ5cGkvbGludXgvY29tbWl0L2MxNDMyYjRiYWU1YjY1ODJmNGQzMmJhMzgxNDU5ZjMzYzM0ZDE0
MjQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
