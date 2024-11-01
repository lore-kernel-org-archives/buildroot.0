Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5984FE6F062
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 14:51:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D57041E51;
	Fri,  1 Nov 2024 14:51:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2h5EC0n-Ody; Fri,  1 Nov 2024 14:51:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBE8F410B4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBE8F410B4;
	Fri,  1 Nov 2024 14:51:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DA5E63B
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B2D7A6070F
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4XEP_oc0G1H for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 14:51:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2b; helo=mail-vk1-xa2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BE4CB606EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE4CB606EC
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [IPv6:2607:f8b0:4864:20::a2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE4CB606EC
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 14:51:25 +0000 (UTC)
Received: by mail-vk1-xa2b.google.com with SMTP id
 71dfb90a1353d-50d487a93a5so596930e0c.3
 for <buildroot@buildroot.org>; Fri, 01 Nov 2024 07:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730472684; x=1731077484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aEIRUHYQHYEDNrP6QOIym/m0MTDb6wbpENOdB1s5Z2Q=;
 b=dczBkxjBBTNhnofOBZvjAaPV1CGpc97qxN7msRwixAUyO/pkM1zyuhQk95UXbsrYsD
 oUa52xTvD6GoVCq1lgRjXk0CMvGVgIGj00rCS6pnsoaeUD8r5JqR6YOoXtQcm3AAKVAN
 tc3gyFqOIWHUN6QsnUCPHWwpWB+TFeVBIkaPiiUPHTmq6D8qhzGHXNmk/TzjrSzh8Hs6
 leWdh50U8Drh1kYIWydEKRKNMtqyqEY9bmJQMiYd+o30B8djuD5pFQLQWp3hh1SBPUD/
 cYwktMeeGdJYcgYqqQ6hUwpCarw9iBy+t9pyUnlHSUtuHM5uM1HwD0joVnL5pbWvZObN
 XMJg==
X-Gm-Message-State: AOJu0YxFC0swA+MZ8tHTTtpfgbPCyXBTh9eqUe+5Kc+I8fiRGq0TF328
 TU971GvbR40LTJhXt9o47HSWVoKbl5yhrHJs47oDQbg4mxaUPvC7UQKinNx2MrTQ3P4ukGAMgkC
 TzxOV2goXY0kTCJMXeiPZFcnjbLuejw==
X-Google-Smtp-Source: AGHT+IEgKMPT+6CpvH8L5BfA0EhCDOPapdlBsGFz8hmvAGARG3oR3Q08ekw3sDGFEnehz7Ln6/OdLa+Lc25/R5PBI1Y=
X-Received: by 2002:a05:6122:1809:b0:50d:83e1:94fb with SMTP id
 71dfb90a1353d-5101511d93fmr21635614e0c.12.1730472684139; Fri, 01 Nov 2024
 07:51:24 -0700 (PDT)
MIME-Version: 1.0
References: <20241101144117.3083087-1-buildroot@bubu1.eu>
In-Reply-To: <20241101144117.3083087-1-buildroot@bubu1.eu>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 1 Nov 2024 08:51:12 -0600
Message-ID: <CADvTj4rdufnps5Ag7S0NNGVJ_QU8KBCh_BHatDJMw9MKiYvJMQ@mail.gmail.com>
To: Marcus Hoffmann <buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730472684; x=1731077484; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aEIRUHYQHYEDNrP6QOIym/m0MTDb6wbpENOdB1s5Z2Q=;
 b=CRBy7GvautcaKLnXw++r3XAAXLLsyr65USejFLknl9AWqgIiVB4GXCGjhMf7lX/iRZ
 c8Llxi/LTpz/5laUZDLdxxg3yl8AI7/4okQkJunaDeHC8LI/rFyhaMyqZgmya1honxk1
 hLgoekmb5QKNHXXtHSyfku4jML2KkPQISHIij5krJru8/iS5hDWsQqsm2fNN6uuVXpf4
 EiTIDAZ5RqXS7o2KRWke8LK2n0GtdxgeAAyQMly2xN/4xilO9t6Pa13Unln2r2qSgJ6u
 qSLD264Y2p2fLLEqw3Z7Te1m8rvOeuXhMBvYBqhaOpIkDH1FLMZxc/bGzWiRc8EqFTrV
 i3ww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=CRBy7Gva
Subject: Re: [Buildroot] [PATCH] package/python-flit-core: bump to 3.10.0
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gRnJpLCBOb3YgMSwgMjAyNCBhdCA4OjQx4oCvQU0gTWFyY3VzIEhvZmZtYW5uIDxidWlsZHJv
b3RAYnVidTEuZXU+IHdyb3RlOgo+Cj4gRnJvbTogTWFyY3VzIEhvZmZtYW5uIDxtYXJjdXMuaG9m
Zm1hbm5Ab3RoZXJtby5kZT4KPgo+IENoYW5nZWxvZzogaHR0cHM6Ly9mbGl0LnB5cGEuaW8vZW4v
c3RhYmxlL2hpc3RvcnkuaHRtbCN2ZXJzaW9uLTMtMTAKPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmN1
cyBIb2ZmbWFubiA8YnVpbGRyb290QGJ1YnUxLmV1Pgo+IC0tLQo+ICBwYWNrYWdlL3B5dGhvbi1m
bGl0LWNvcmUvcHl0aG9uLWZsaXQtY29yZS5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvcHl0aG9u
LWZsaXQtY29yZS9weXRob24tZmxpdC1jb3JlLm1rICAgfCA2ICsrLS0tLQo+ICAyIGZpbGVzIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL3B5dGhvbi1mbGl0LWNvcmUvcHl0aG9uLWZsaXQtY29yZS5oYXNoIGIvcGFja2FnZS9w
eXRob24tZmxpdC1jb3JlL3B5dGhvbi1mbGl0LWNvcmUuaGFzaAo+IGluZGV4IDRkNDkwN2Y1ZGMu
LjJjYzgwMzIxOTQgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9weXRob24tZmxpdC1jb3JlL3B5dGhv
bi1mbGl0LWNvcmUuaGFzaAo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLWZsaXQtY29yZS9weXRob24t
ZmxpdC1jb3JlLmhhc2gKPiBAQCAtMSw1ICsxLDUgQEAKPiAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0
dHBzOi8vcHlwaS5vcmcvcHlwaS9mbGl0X2NvcmUvanNvbgo+IC1tZDUgIDNiYzUyZjE5NTJiOWE3
ODM2MTExNDE0N2RhNjNjMzViICBmbGl0X2NvcmUtMy45LjAudGFyLmd6Cj4gLXNoYTI1NiAgNzJh
ZDI2NjE3NmM0YTNmY2ZhYjVmMjkzMGQ3Njg5NjA1OTg1MTI0MDU3MGNlOWE5ODczM2I2NThjYjc4
NmViYSAgZmxpdF9jb3JlLTMuOS4wLnRhci5nego+ICttZDUgIDM4ZmQzNjVkYzk4MGQ5OTEwN2Rm
Y2NhZGM5NmQwYzRmICBmbGl0X2NvcmUtMy4xMC4wLnRhci5nego+ICtzaGEyNTYgIDZkOTA0MjMz
MTc4YjNjOTI0ZjY2NTk0N2FjN2QyODZmMmFjNzk5ZmI2OTA4N2UzOWU1NmNlYjQwODQ3MjRhOTcg
IGZsaXRfY29yZS0zLjEwLjAudGFyLmd6Cj4gICMgTG9jYWxseSBjb21wdXRlZAo+ICBzaGEyNTYg
IDM1YjRmMWRlYzUxMmU2MTcwNzdmZDY5ODBkYmI0M2VmOGMyODg3YWRjNWQwMTg1ZWRiNGMwNGRh
MTc1ZGQ4MTYgIExJQ0VOU0UKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tZmxpdC1jb3Jl
L3B5dGhvbi1mbGl0LWNvcmUubWsgYi9wYWNrYWdlL3B5dGhvbi1mbGl0LWNvcmUvcHl0aG9uLWZs
aXQtY29yZS5tawo+IGluZGV4IDM0ZTU4ZDAzY2EuLmU1N2Q3OTVhNjMgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS9weXRob24tZmxpdC1jb3JlL3B5dGhvbi1mbGl0LWNvcmUubWsKPiArKysgYi9wYWNr
YWdlL3B5dGhvbi1mbGl0LWNvcmUvcHl0aG9uLWZsaXQtY29yZS5tawo+IEBAIC00LDExICs0LDkg
QEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+Cj4gLVBZVEhPTl9GTElUX0NPUkVf
VkVSU0lPTiA9IDMuOS4wCj4gK1BZVEhPTl9GTElUX0NPUkVfVkVSU0lPTiA9IDMuMTAuMAo+ICBQ
WVRIT05fRkxJVF9DT1JFX1NPVVJDRSA9IGZsaXRfY29yZS0kKFBZVEhPTl9GTElUX0NPUkVfVkVS
U0lPTikudGFyLmd6Cj4gLVBZVEhPTl9GTElUX0NPUkVfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0
aG9uaG9zdGVkLm9yZy9wYWNrYWdlcy9jNC9lNi9jMWFjNTBmZTNlZWJiMzhhMTU1MTU1NzExZTZl
ODY0ZTI1NGNlNGI2ZTE3ZmUyNDI5YjRjNGQ1YjllODAKPiAtUFlUSE9OX0ZMSVRfQ09SRV9MSUNF
TlNFID0gQlNELTMtQ2xhdXNlCj4gLVBZVEhPTl9GTElUX0NPUkVfTElDRU5TRV9GSUxFUyA9IExJ
Q0VOU0UKCldoeSBhcmUgdGhlIGxpY2Vuc2UgYW5kIGxpY2Vuc2UgZmlsZXMgYmVpbmcgcmVtb3Zl
ZCBoZXJlPwoKPiArUFlUSE9OX0ZMSVRfQ09SRV9TSVRFID0gaHR0cHM6Ly9maWxlcy5weXRob25o
b3N0ZWQub3JnL3BhY2thZ2VzLzUyLzkyLzg5Y2NlYjljNDlmM2U2YzcyMDkxMzA0NjM2YzVlYmMy
ZmM0OGM1NDY3NDJiYmY4YTZhNDc0ZTQ4ZTY2Ngo+ICBQWVRIT05fRkxJVF9DT1JFX1NFVFVQX1RZ
UEUgPSBmbGl0LWJvb3RzdHJhcAo+Cj4gICMgVXNlIGZsaXQgYnVpbHQgaW4gYm9vdHN0cmFwX2lu
c3RhbGwgZm9yIGluc3RhbGxpbmcgaG9zdC1weXRob24tZmxpdC1jb3JlLgo+IC0tCj4gMi40My4w
Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
