Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA389C678DC
	for <buildroot@archiver.kernel.org>; Wed, 11 Jun 2025 13:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DEA642456;
	Wed, 11 Jun 2025 13:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BPiQAwVCntdY; Wed, 11 Jun 2025 13:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DF2941DAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9DF2941DAE;
	Wed, 11 Jun 2025 13:55:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 205F91F2
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 13:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19BB660ADD
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 13:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FBJ1C0jyZxqb for <buildroot@buildroot.org>;
 Wed, 11 Jun 2025 13:55:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=alex.bennee@linaro.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B2A360A89
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B2A360A89
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B2A360A89
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 13:55:38 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9ebdfso11781090a12.3
 for <buildroot@buildroot.org>; Wed, 11 Jun 2025 06:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749650136; x=1750254936;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=euDPPgVD4xI/QwDhAvEk3oFcYQOYP/l7B31fahPR2bM=;
 b=tCMWgP9c6led3xVZ1b7LPAufPnPiz73BN1ImN5WZymUnmXw84psQ18tvKFmi590O8z
 X26ZZxeGslHTwicZESaYNms5Jh+65W2mWbCo4XoKEx4+lfAADTVjCWaLtpppDBwMaRtB
 q7bnTtS6NnlyNHboO+ho3QzNUNm8YME100ly3pcKafTDeZzDd7MQq1YYkotbQgrJVaSS
 RLQ3fTCwZWKwTMOkb6jWckvA2W53VFpSp4ri/+PNG9W3TpUwJaiXqO44OrbAkMyefnye
 XIPI+sbJdzli0A7tUlqR4a9lQ42lZWBQo8vPClTXTr9nojwwltecW779Ou6w+VtYFFJl
 emGg==
X-Gm-Message-State: AOJu0YwYJKuB0ycW7LJeAE2D7IGK8bdLCQ0dQ+0Ek1HlKlArchiqlTgZ
 nkQPkYNCwQYK5zBVvvMBc/C+DDVQbgCkPfK/Nn1fMD2bleMK1DRur5JKwM2MMQCVRyufdP6CKgt
 Je1xB
X-Gm-Gg: ASbGncsUrrehgZ73SAdkySMdtMyIDwhN4xxF2xtUZI3vQLGNY7xkUtNoiMUHSja4Osj
 4tro+cW5T3XrpZES5z0AfpecS6bAK5OwcA7h61HqEBsZlXbnMtkgRUlnkq/lkMYeObC2wmLll10
 WL657RDyfYX5C1pmoq3IastYoCSmEPzUfv1KRkIWVm7dsK86YUQsSvwcI/bXWTGfuKPgM8RtLa4
 z22lp+xCibt3JAo+8LJamQ+paVCaC4mz6CMArVUnznWK3WC8T0I3kj2E8EI5hXlAjIoA0Ow37cX
 Y+pypd1/y2jDTd92AtqcSugONg8w3RJpx4x3j18I5KT3z/7g9bmmKsxx10KzxgY=
X-Google-Smtp-Source: AGHT+IFUVBuQc6VdFMTOYWDgJNnxSpH4DGrHzMJr1Km6qtnFSCFZSyzUN6Wzltksji2FcP96Xa01jg==
X-Received: by 2002:a17:907:70a:b0:ad2:1f65:8562 with SMTP id
 a640c23a62f3a-ade8c5d4784mr254960366b.14.1749650135840; 
 Wed, 11 Jun 2025 06:55:35 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade1dc38a06sm891557366b.119.2025.06.11.06.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 06:55:33 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E67B75F7CB;
 Wed, 11 Jun 2025 14:55:31 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Heiko Thiery <heiko.thiery@gmail.com>
Cc: buildroot@buildroot.org,  Julien Olivain <ju.o@free.fr>,  Eric Le Bihan
 <eric.le.bihan.dev@free.fr>
In-Reply-To: <CAEyMn7Yu_ZAPhaAOSHO7K+LbbVAGQqe84_UCe4uKqnJ+4UbDsQ@mail.gmail.com>
 (Heiko Thiery's message of "Wed, 11 Jun 2025 15:11:05 +0200")
References: <20250611111640.702572-1-alex.bennee@linaro.org>
 <20250611111640.702572-5-alex.bennee@linaro.org>
 <CAEyMn7Yu_ZAPhaAOSHO7K+LbbVAGQqe84_UCe4uKqnJ+4UbDsQ@mail.gmail.com>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Wed, 11 Jun 2025 14:55:31 +0100
Message-ID: <87jz5ijsbw.fsf@draig.linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749650136; x=1750254936; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=euDPPgVD4xI/QwDhAvEk3oFcYQOYP/l7B31fahPR2bM=;
 b=wETvo5JCkicaOJMsDKiqwiicnlrhD0IqKFuis3I7x474y0Pt4gkMsbMQ0LHkLLiOwH
 zskd3PCcayFmZVVHcUCMLdOZ2z5CSQZb8wgMjqOSIGnb6UmlMiKNGhqNdFuwd0h9PlG5
 xR5r6dhx1LFumf37tDmtYBZkdlIho+RlWvXRpxyNK7EJNeADV/MLm2JgCYupf8YFl9T/
 8HSzIfi+U5PbBdaCXUUHDurz8pNlLdyWMarNxldJpjTomHnznnvCYDIxSaqqvqExU4OC
 kreobjygStezIJp6VP2cJDwPFKaFCjVn5S9xb9qhLjNDaQMS76STXdzkz3HtvmNxwRn9
 ryLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=linaro.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wETvo5JC
Subject: Re: [Buildroot] [PATCH v6 4/5] package/vkmark: add vkmark
 benchmarking tool
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVpa28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPiB3cml0ZXM6Cgo+IEhpIEFsZXgs
Cj4KPiBBbSBNaS4sIDExLiBKdW5pIDIwMjUgdW0gMTM6MTYgVWhyIHNjaHJpZWIgQWxleCBCZW5u
w6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjoKPgo+ICBXZSBidWlsZCBmcm9tIGEgcmVjZW50
IEhFQUQgdG8gZW5zdXJlIHdlIGhhdmUgdGhlIGZpeGVzIHRvIGJldHRlcgo+ICBoYW5kbGUgdGhl
IG1pc3NpbmcgS0hSX2Rpc3BsYXkgZXh0ZW5zaW9uLgo+Cj4gIFNpZ25lZC1vZmYtYnk6IEFsZXgg
QmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz4KPgo+IEkgdHJpZWQgdG8gYnVpbGQgdmtt
YXJrIGFnYWluc3QsIG5vdyB3aXRoIHdheWxhbmQgZW5hYmxlZCBhbmQgSSBzZWUgdGhpczoKPgo+
IFByb2dyYW0gL3Vzci9iaW4vd2F5bGFuZC1zY2FubmVyIGZvdW5kOiBOTwo+Cj4gLi4vb3V0LXdl
c3Rvbi9idWlsZC92a21hcmstMzZlN2Q5YjJlY2Y3MjNlODc2YWRkNjU1MzRlOTVmNTVlYzFiYzc5
ZC9zcmMvbWVzb24uYnVpbGQ6MTE2OjIyOiBFUlJPUjogUHJvZ3JhbQo+ICcvdXNyL2Jpbi93YXls
YW5kLXNjYW5uZXInIG5vdCBmb3VuZCBvciBub3QgZXhlY3V0YWJsZQoKSG1tIHRoaXMgc2VlbXMg
b2RkLiBBdCBsZWFzdCB3YXlsYW5kLXNjYW5uZXIgaGFzIGEgcGtnY29uZiB2YXJpYWJsZToKCiAg
8J+VmTE0OjUxOjIxIGFsZXhAZHJhaWc6YnVpbGRyb290LmdpdC9idWlsZHMveDg2XzY0ICBvbiDu
gqAgYWRkLXZpcnRpby12dWxrYW4tdmttYXJrOm1hc3RlciBbJCE/4oehXSAKICDinpwgIHBrZy1j
b25maWcgLS12YXJpYWJsZT13YXlsYW5kX3NjYW5uZXIgIHdheWxhbmQtc2Nhbm5lcgogIC91c3Iv
YmluL3dheWxhbmQtc2Nhbm5lcgogIPCflZkxNDo1MjoxNiBhbGV4QGRyYWlnOmJ1aWxkcm9vdC5n
aXQvYnVpbGRzL3g4Nl82NCAgb24g7oKgIGFkZC12aXJ0aW8tdnVsa2FuLXZrbWFyazptYXN0ZXIg
WyQhP+KHoV0gCiAg4p6cICAuL2hvc3QvYmluL3BrZ2NvbmYgLS12YXJpYWJsZT13YXlsYW5kX3Nj
YW5uZXIgIHdheWxhbmQtc2Nhbm5lcgogIC9ob21lL2FsZXgvbHNyYy90ZXN0cy9idWlsZHJvb3Qu
Z2l0L2J1aWxkcy94ODZfNjQvaG9zdC9iaW4vd2F5bGFuZC1zY2FubmVyCiAg8J+VmTE0OjUyOjI5
IGFsZXhAZHJhaWc6YnVpbGRyb290LmdpdC9idWlsZHMveDg2XzY0ICBvbiDugqAgYWRkLXZpcnRp
by12dWxrYW4tdmttYXJrOm1hc3RlciBbJCE/4oehXSAKICDinpwKCkFuZCB0aGUgbWVzb24gc2hv
dWxkIGZpbmQgaXQgd2l0aCB0aGUgbm9ybWFsIGRlcGVuZGVuY3kgbG9naWM6CgogICAgd2F5bGFu
ZF9zY2FubmVyID0gZmluZF9wcm9ncmFtKHdheWxhbmRfc2Nhbm5lcl9kZXAuZ2V0X3ZhcmlhYmxl
KCd3YXlsYW5kX3NjYW5uZXInKSkKCj4KPiBBIGZ1bGwgbG9nIGNhbiBiZSBmb3VuZCBhdAo+IC9z
cnYvc3RvcmFnZS9odGhpZXJ5L3NvdXJjZXMvc2E2Ny9vdXQtd2VzdG9uL2J1aWxkL3ZrbWFyay0z
NmU3ZDliMmVjZjcyM2U4NzZhZGQ2NTUzNGU5NWY1NWVjMWJjNzlkL2J1aWxkcm9vdC1idWlsZC9t
ZXNvbi1sb2dzL21lc29uLWxvZy50eHQKPgo+IG1ha2VbMV06ICoqKiBbcGFja2FnZS9wa2ctZ2Vu
ZXJpYy5tazoyNjM6Cj4gL3Nydi9zdG9yYWdlL2h0aGllcnkvc291cmNlcy9zYTY3L291dC13ZXN0
b24vYnVpbGQvdmttYXJrLTM2ZTdkOWIyZWNmNzIzZTg3NmFkZDY1NTM0ZTk1ZjU1ZWMxYmM3OWQv
LnN0YW1wX2NvbmZpZ3VyZWRdCj4gRXJyb3IgMQo+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MjM6IF9h
bGxdIEVycm9yIDIKPgo+IEl0IGxvb2tzIGxpa2UgaGVyZSB3ZSBoYXZlIHNvbWV0aGluZyBzaW1p
bGFyIGxpa2UgYmVmb3JlLiBJdCBsb29rcyB1bmRlciAgJy91c3IvYmluL3dheWxhbmQtc2Nhbm5l
cicgYnV0IHRoZSBwcmVmaXggaXMgbWlzc2luZy4KPHNuaXA+CgpZZWFoIEkgc2VlIHRoZSBzYW1l
OgoKICBGb3VuZCBwa2ctY29uZmlnOiBZRVMgKC9ob21lL2FsZXgvbHNyYy90ZXN0cy9idWlsZHJv
b3QuZ2l0L2J1aWxkcy9hcm02NC9ob3N0L2Jpbi9wa2djb25mKSAyLjMuMCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAKICBSdW4tdGltZSBkZXBlbmRlbmN5IHZ1bGthbiBmb3VuZDogWUVTIDEuNC4zMTcg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAKICBMaWJyYXJ5IGRsIGZvdW5kOiBZRVMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAKICBGb3VuZCBDTWFrZTogL3Vzci9iaW4vY21ha2UgKDMuMzEu
NikgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAKICBSdW4tdGltZSBkZXBlbmRlbmN5IGdsbSBmb3Vu
ZDogWUVTIDEuMC4wICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICBSdW4tdGltZSBkZXBlbmRlbmN5IGFz
c2ltcCBmb3VuZDogWUVTIDUuNC4zICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICBSdW4tdGltZSBkZXBlbmRl
bmN5IHhjYiBmb3VuZDogWUVTIDEuMTUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICBSdW4tdGltZSBk
ZXBlbmRlbmN5IHhjYi1pY2NjbSBmb3VuZDogWUVTIDAuNC4yICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICBSdW4t
dGltZSBkZXBlbmRlbmN5IHdheWxhbmQtY2xpZW50IGZvdW5kOiBZRVMgMS4yMy4xICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAK
ICBSdW4tdGltZSBkZXBlbmRlbmN5IHdheWxhbmQtcHJvdG9jb2xzIGZvdW5kOiBZRVMgMS40MiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAKICBSdW4tdGltZSBkZXBlbmRlbmN5IHdheWxhbmQtc2Nhbm5lciBmb3VuZDogWUVTIDEu
MjMuMSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAKICBSdW4tdGltZSBkZXBlbmRlbmN5IGxpYmRybSBmb3VuZDogWUVTIDIuNC4x
MjQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAKICBSdW4tdGltZSBkZXBlbmRlbmN5IGdibSBmb3VuZDogWUVTIDI1
LjEuMyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAKICBQcm9ncmFtIHB5dGhvbjMgZm91bmQ6IFlFUyAoL2hv
bWUvYWxleC9sc3JjL3Rlc3RzL2J1aWxkcm9vdC5naXQvYnVpbGRzL2FybTY0L2hvc3QvYmluL3B5
dGhvbjMpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAKICBQcm9ncmFtIC91c3IvYmluL3dheWxhbmQt
c2Nhbm5lciBmb3VuZDogWUVTICgvdXNyL2Jpbi93YXlsYW5kLXNjYW5uZXIpCgotLSAKQWxleCBC
ZW5uw6llClZpcnR1YWxpc2F0aW9uIFRlY2ggTGVhZCBAIExpbmFybwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
