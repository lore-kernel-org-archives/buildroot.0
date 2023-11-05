Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6DFC4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 20:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E61D40993;
	Sun,  5 Nov 2023 20:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E61D40993
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JB70JYk5uAU6; Sun,  5 Nov 2023 20:22:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 610D040A45;
	Sun,  5 Nov 2023 20:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 610D040A45
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 940261BF48C
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A52940A45
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 20:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A52940A45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ysrxnmd1Fl3U for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 20:22:07 +0000 (UTC)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 38F5D40993
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 20:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38F5D40993
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso573907666b.1
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 12:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699215725; x=1699820525;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nx5PBbVlDVzZ42xOFT3CokC24Nq4EOI7MpTk5D5AsP8=;
 b=tgWv+AYFnRFnUrDuIZ8cRF06jx+k3SefpAfjB6oNYzo6/Y83QLSkKhu/fTMd+itH1R
 p29XxGfN2P7LR+n2v+tkFTsAVmoudK6wE9iR80mxcxMCqbrOAodp4EGNwsLM3edFWfTq
 zufEQ/c4iGz0RmxoOU7TCrKJw7MRVkq4PnegILxI7dvEZC/dG432uyrGv8EMJNuUlcnI
 QnmZDSrMBr0RNbOAstJqOTN7xSWW7ORBvtU2mQwYY5HEWmxGxjGtj9qC3H19EMqjjVfv
 W8pAK0QkTvnjs0xLnYYbCw/T5v6j+oyG/KNNxLKnIlDfE56inXk2j5Dwy0R6ZQAEeovz
 kviQ==
X-Gm-Message-State: AOJu0Yzd+F068Or7sTgE3hPjTG5Dc8yWZa9AhC9/+ywCqUsUTNlElx6i
 iJh5J/mgC26McLUlPuJkK5nSXp4A972MUelHqgU=
X-Google-Smtp-Source: AGHT+IGU2wRyMwcbojncC9LzmGFl9teokPfy6gbnRH9s9nqoB+6PpJes7NoPRv9DG3nG3nF/uWaRgg==
X-Received: by 2002:a17:907:843:b0:9be:85c9:43ef with SMTP id
 ww3-20020a170907084300b009be85c943efmr11313484ejb.62.1699215724987; 
 Sun, 05 Nov 2023 12:22:04 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a1709063bca00b009ad7fc17b2asm3348250ejf.224.2023.11.05.12.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Nov 2023 12:22:04 -0800 (PST)
Message-ID: <65d90378-9751-4666-9f36-e101a3e496ab@mind.be>
Date: Sun, 5 Nov 2023 21:22:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20231105183719.3811015-1-peter@korsgaard.com>
In-Reply-To: <20231105183719.3811015-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699215725; x=1699820525; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nx5PBbVlDVzZ42xOFT3CokC24Nq4EOI7MpTk5D5AsP8=;
 b=WCt2i1RULGuGZ72Sg8qiAurjytsyiS6By2woG06kC14KmXTgQ3SPFnP6MD1HAqDF1u
 yzYxCPf/z/n2tR9uFUZlGbxdhfljNgLwgrWKtX6pqIeU2Hi3YGsbfoCjODMZ7P9E6tZY
 WUkKihgF4XZ1PvpKL84qICu8gdWwbeT6AkM+zBbe5Fw6ATrIBroErTPJIhyAdotQr0Wc
 ZggCeUg7V1gvMmTMbLKeYGe3OzO3w72DAGIW7kJ0k/rydRei2b0x/vwWkHs0yQQn3wQa
 hpkjpV+pOXsINgMsjrDuAUwH7adlm5ivgIYmR2p2M4SErclEH3D5TtQvH6hMwd2/2fB8
 OrXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WCt2i1RU
Subject: Re: [Buildroot] [PATCH 1/4] configs/stm32mp157a_dk1_defconfig:
 unbreak TF-A build with GCC >= 12
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Bartosz Bilas <b.bilas@grinn-global.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNS8xMS8yMDIzIDE5OjM3LCBQZXRlciBLb3JzZ2FhcmQgd3JvdGU6Cj4gV2l0aCB0aGUg
bW92ZSB0byBkZWZhdWx0IHRvIEdDQyAxMiBpbiBjb21taXQgZTAwOTFlNDJlZWY5IChwYWNrYWdl
L2djYzoKPiBzd2l0Y2ggdG8gZ2NjIDEyLnggYXMgdGhlIGRlZmF1bHQpLCBURi1BIG5vdyBmYWls
cyB0byBidWlsZCBhcyBhIHdhcm5pbmcgaXMKPiBnZW5lcmF0ZWQgYW5kIGl0IGJ1aWxkcyB3aXRo
IC1XZXJyb3I6Cj4gCj4gICAgQ0MgICAgICBwbGF0L3N0L3N0bTMybXAxL2JsMl9wbGF0X3NldHVw
LmMKPiBkcml2ZXJzL3N0L2lvL2lvX3N0bTMyaW1hZ2UuYzogSW4gZnVuY3Rpb24g4oCYc3RtMzJp
bWFnZV9wYXJ0aXRpb25fcmVhZOKAmToKPiBkcml2ZXJzL3N0L2lvL2lvX3N0bTMyaW1hZ2UuYzoy
NDk6MTM6IGVycm9yOiDigJhyZXN1bHTigJkgbWF5IGJlIHVzZWQgdW5pbml0aWFsaXplZCBbLVdl
cnJvcj1tYXliZS11bmluaXRpYWxpemVkXQo+ICAgIDI0OSB8ICAgICAgICAgaW50IHJlc3VsdDsK
PiAgICAgICAgfCAgICAgICAgICAgICBefn5+fn4KPiBjYzE6IGFsbCB3YXJuaW5ncyBiZWluZyB0
cmVhdGVkIGFzIGVycm9ycwo+IAo+IFRoaXMgaXMgZml4ZWQgaW4gVEYtQSB2Mi42IHdpdGggY29t
bWl0IGMxZDczMmQwZGIyNCAoZml4KGlvX3N0bTMyaW1hZ2UpOgo+IHVuaW5pdGlhbGl6ZWQgdmFy
aWFibGUgd2FybmluZyksIGJ1dCBJIGRvIG5vdCBoYXZlIHRoZSBib2FyZCB0byB2ZXJpZnkgaWYK
PiB2Mi42IHdvcmtzLCBzbyBpbnN0ZWFkIGRpc2FibGUgLVdlcnJvciBieSBtYXNzc2luZyBFPTAu
CgogIEkgKG9yIGFjdHVhbGx5LCBteSBjb2xsZWFndWVzKSBoYXZlIGJvdGggYSBESzEgYW5kIGEg
REsyLCBzbyBzaGFsbCBJIHRlc3QgdGhlIAoyLjkgYnVtcCBvbiB0aGVtPwoKICBSZWdhcmRzLAog
IEFybm91dAoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBLb3JzZ2FhcmQgPHBldGVyQGtvcnNn
YWFyZC5jb20+Cj4gLS0tCj4gICBjb25maWdzL3N0bTMybXAxNTdhX2RrMV9kZWZjb25maWcgfCAy
ICstCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvY29uZmlncy9zdG0zMm1wMTU3YV9kazFfZGVmY29uZmlnIGIvY29uZmln
cy9zdG0zMm1wMTU3YV9kazFfZGVmY29uZmlnCj4gaW5kZXggZWNhYWNlNTRiOC4uZTc2NGExNTU4
ZCAxMDA2NDQKPiAtLS0gYS9jb25maWdzL3N0bTMybXAxNTdhX2RrMV9kZWZjb25maWcKPiArKysg
Yi9jb25maWdzL3N0bTMybXAxNTdhX2RrMV9kZWZjb25maWcKPiBAQCAtMzAsNyArMzAsNyBAQCBC
UjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFPXkKPiAgIEJSMl9UQVJHRVRfQVJNX1RSVVNU
RURfRklSTVdBUkVfQ1VTVE9NX1ZFUlNJT049eQo+ICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9G
SVJNV0FSRV9DVVNUT01fVkVSU0lPTl9WQUxVRT0idjIuNSIKPiAgIEJSMl9UQVJHRVRfQVJNX1RS
VVNURURfRklSTVdBUkVfUExBVEZPUk09InN0bTMybXAxIgo+IC1CUjJfVEFSR0VUX0FSTV9UUlVT
VEVEX0ZJUk1XQVJFX0FERElUSU9OQUxfVkFSSUFCTEVTPSJTVE0zMk1QX1NETU1DPTEgQUFSQ0gz
Ml9TUD1zcF9taW4gRFRCX0ZJTEVfTkFNRT1zdG0zMm1wMTU3YS1kazEuZHRiIgo+ICtCUjJfVEFS
R0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFX0FERElUSU9OQUxfVkFSSUFCTEVTPSJTVE0zMk1QX1NE
TU1DPTEgQUFSQ0gzMl9TUD1zcF9taW4gRFRCX0ZJTEVfTkFNRT1zdG0zMm1wMTU3YS1kazEuZHRi
IEU9MCIKPiAgIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfSU1BR0VTPSIqLnN0bTMy
Igo+ICAgQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9ORUVEU19EVEM9eQo+ICAgQlIy
X1RBUkdFVF9VQk9PVD15Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
