Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98DECC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 19:48:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35AA76109E
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 19:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35AA76109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2F1440467;
	Thu, 14 Oct 2021 19:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PqHgkro0hcSZ; Thu, 14 Oct 2021 19:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D189140125;
	Thu, 14 Oct 2021 19:48:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAC621BF3F9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 19:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6A7F83A65
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 19:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Lb9felU5OCk for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 19:48:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2A41883A64
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 19:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1634240890;
 bh=RRX1xMPJtKBAA/Z416zIQAbqMTJHsl116q/mukCHtsw=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=IvcuGFrwn1o9QzlsSX0Q8ZDcTFcKxKJcR0jIEPQaBAgvRXezUb/mfxXqbCdHikW/v
 HHu3eYPeVn+MmthCfriqqkUsvtZa5VGR7u+g+liavc/PtCT/HU/W06/1oa+jY7luqF
 IS1MQp9c+pcUhIib+EjRzXPggsjauxqBhoa/NnQg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.156]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MEV3I-1mV6Po359G-00G43H; Thu, 14
 Oct 2021 21:48:10 +0200
Date: Thu, 14 Oct 2021 21:48:09 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211014214809.5996d78d@gmx.net>
In-Reply-To: <9af643e3-0047-5fb4-1c17-ed08bc4bf2fd@mind.be>
References: <CA+eej5MzpM30U7sMqba5gKQ3dG5FznZqd6roacphLhx6J-9auA@mail.gmail.com>
 <fe8b5e30-6cb7-161d-6e6e-cdddadcbbe01@gmail.com>
 <CA+eej5M-SbCseCpknXdMboR7Lz+A94BNHMBZd2WJkcbDD6pZAg@mail.gmail.com>
 <59c215b4-63e2-ba22-285f-0fb4032111b8@mind.be>
 <CA+eej5M2CjZvH+cYL31OhspJCkN0isrbmJA9pUKHsnOzdbuegA@mail.gmail.com>
 <CA+eej5Niy_Qkag54jkV39WgcCLy2t11=S-gY+UndMtjOMqNWpQ@mail.gmail.com>
 <CA+eej5NNTNONO_GX1T=DhRyvbQJzxNhJMrRi-T4Ue-bexYRR3w@mail.gmail.com>
 <CA+eej5NKcWV6n_sM19Px+NP4EoqSDmUqw2W3DdTDGGKQRSqZ5Q@mail.gmail.com>
 <20211012225224.23525d4f@gmx.net>
 <b1aa1e5e-18b1-11b6-0f8d-14982d25ad3b@mind.be>
 <CA+eej5OCBy1brQFnRMQjMqu8DrPtrTgVPRpTT8hKxXTwz5uvNQ@mail.gmail.com>
 <CA+eej5Py5=BfZzMuZS8ARZ5K24xBjGTrpu0iANh7hX9AjK6NQA@mail.gmail.com>
 <20211013182644.6b10f575@gmx.net>
 <CA+eej5M-9OVMikj2YFdL7bDUWKRztiqJZqxk0UzEkYXvHaxh3Q@mail.gmail.com>
 <CA+eej5MVoG1uFTxNyCnSXjdhBQj5enHSxTz_GfFnMioFWihogQ@mail.gmail.com>
 <9af643e3-0047-5fb4-1c17-ed08bc4bf2fd@mind.be>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:FRwnanT9smYQLIZul8xcwC6g3mp6JU7Mp4e2yuXEaa10W/9nJSt
 Elk3oUqSQKbNZOVrwd/a1JeR9lTMBGw4oySDKhPLBj+XVFw8IN4VcBAKSNF0xHeUAX2MBjc
 1a6o+jubhMRj9ewfQf2drWTI1eAqBChFC+NgvKi/5B5aQ3HQ3rsL2PHSnJ0hMn9DQL5wK+E
 g6zGZDAmh5v7aQGkgSHdw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:nfJCMbQ1Qgo=:qgDnwymQPp+/7smT0B0U/J
 iZ7KIYrdHj/wLvzdXDwmjokev24cQaB4ShAA3e4zan4ZzqO480HZfo86gnxUQ8EqeJ1NMDjid
 oR5VyxoZH5JnMeu6jLz3fLkX+B19Az7HXBC42eQZXWAgXVsMGFcj7Ga8UYrvkPs2wsMFoEMDW
 s4zg20quZUnkqUk9Mlvj5b/mUJm45r0rhZW9NaPS7ORp/yEZQYExwf7SHlwWZWHnX0DVa4Tnw
 zSyZdMNf2zstN5w8rmGmMUCdd+ZomQCqVNd4KNSIgYBD/4XIaC2GicwAlefQmKgkrBIeCYGSD
 niLgL+Sn5twdFdOsbzacDP/CQoZzyGpiQUh6g36vW6Nv8fiuQMclPxZDiqhERVy+lCnZHTp+8
 eddTempBnYiPDvMnIFeasgbNRSkla7PHr+ChhhbuFcTh7PpFcdaNCzNWcCcQFi9E1ODlCpJQY
 M6VvfYhrFVsz+EOYZ4pCNu4/GJrG12bn0V5N40QUiN584oaU9rLxD0Kpm4E4SWKtt3AWG6aqy
 /Jx1GZPVYqzoYtp449eQ3N/9EtIXg5/KXvbbt1XwpODuqiBkENdowpgyVVFbgC7j3YS05u18B
 HoWDLq8YRnnfbx9UCQ5aeuOvIpefRYBE1daHCb02o6kyYAw8fGPuNnTugay/r21AffCLZ9NR3
 CbNTy0IsQjZw+SHKq7ZxgpPnvmwQqGNif5VPoowvx21ZkPPSuZkX7FQAhX7hcWTQDfvAu+N8y
 d8K8Jd1vFUwLxsLJ5bJrXLzP7pomiQe0KJXymSY6pOI+czUyBsr9pmO96aMFt7Hcvil5QE0yI
 RHoyHcf7fWZtqhdrQ9K5NEkRVVeuM3aoVhlr78+IdTRpucXMkwW0abMM9QWj6m7gVdlV4uo7b
 Hj/QDZPxn+XHzXqVLZAxzvuku+grpXUfChW44S62ddWCOqry4ZvJH4Hrh4xJBlXADNUVHxGlT
 xvpl71owmazTmhdKOsQTVyCO4W2Ea35/9/bt3vni60G1F4A2Pry6hbYzL3awgJDHiyMZRjwhC
 O2Sr2o2io4l7YmHVxONmO9/LgbEWw6BJOUOYTefXLSvFLrpQXSq3MBLprFO2uI5Z9QxguoGsN
 od/MooLZjWi7q8=
Subject: Re: [Buildroot] error when i build buidroot
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
Cc: Joachim Wiberg <troglobit@gmail.com>,
 =?UTF-8?B?RXNhw69l?= Ledoux NJONGSSI KOUAM <kouamdoux@gmail.com>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAxNCBPY3QgMjAyMSAyMTozMDo0MCArMDIwMCwgQXJub3V0IFZhbmRlY2FwcGVsbGUg
PGFybm91dEBtaW5kLmJlPiB3cm90ZToKCj4gT24gMTQvMTAvMjAyMSAxNzoyNCwgRXNhw69lIExl
ZG91eCBOSk9OR1NTSSBLT1VBTSB3cm90ZToKPiA+IFRoYXQncyB0aGUgb3V0cHV0IGluIG15IHRl
cm1pbmFsIC4uLgo+ID4gQ2FuIGkgaG9wZSB0aGF0IGV2ZXJ5dGhpbmcgaXMgb2theSE/Pwo+ID4g
Cj4gPiBMZSBqZXUuIDE0IG9jdC4gMjAyMSDDoCAxMjozNSwgRXNhw69lIExlZG91eCBOSk9OR1NT
SSBLT1VBTSA8a291YW1kb3V4QGdtYWlsLmNvbSAKPiA+IDxtYWlsdG86a291YW1kb3V4QGdtYWls
LmNvbT4+IGEgw6ljcml0wqA6Cj4gPiAKPiA+ICAgICBpcyBpdCBmaW5pc2ggPz8KPiA+IAo+ID4g
ICAgIENyZWF0aW5nIGZpbGVzeXN0ZW0gd2l0aCA2MTQ0MCAxayBibG9ja3MgYW5kIDE1MzYwIGlu
b2Rlcwo+ID4gICAgIEZpbGVzeXN0ZW0gVVVJRDogNzIxYjlhMGQtZDM4My00YjA2LTk0NjktNzc5
NDRjZmZiN2M2Cj4gPiAgICAgU3VwZXJibG9jayBiYWNrdXBzIHN0b3JlZCBvbiBibG9ja3M6Cj4g
PiAgICAgODE5MywgMjQ1NzcsIDQwOTYxLCA1NzM0NQo+ID4gCj4gPiAgICAgQWxsb2NhdGluZyBn
cm91cCB0YWJsZXM6IGRvbmUKPiA+ICAgICBXcml0aW5nIGlub2RlIHRhYmxlczogZG9uZQo+ID4g
ICAgIENvcHlpbmcgZmlsZXMgaW50byB0aGUgZGV2aWNlOiBkb25lCj4gPiAgICAgV3JpdGluZyBz
dXBlcmJsb2NrcyBhbmQgZmlsZXN5c3RlbSBhY2NvdW50aW5nIGluZm9ybWF0aW9uOiBkb25lCj4g
PiAKPiA+ICAgICBsbiAtc25mCj4gPiAgICAgL2hvbWUvbGVkb3V4L0RvY3VtZW50cy9idWlsZHJv
b3Qvb3V0cHV0L2hvc3QveDg2XzY0LWJ1aWxkcm9vdC1saW51eC11Y2xpYmMvc3lzcm9vdAo+ID4g
ICAgIC9ob21lL2xlZG91eC9Eb2N1bWVudHMvYnVpbGRyb290L291dHB1dC9zdGFnaW5nICAKPiA+
ICAgICAgPj4+IMKgIEV4ZWN1dGluZyBwb3N0LWltYWdlIHNjcmlwdCBib2FyZC9xZW11L3Bvc3Qt
aW1hZ2Uuc2ggIAo+IAo+ICAgWWVzIHRoYXQgbG9va3MgT0suCj4gCj4gICBSZWdhcmRzLAo+ICAg
QXJub3V0CgpBbmQgdGFrZSBhIGxvb2sgYXQgYm9hcmQvcWVtdS94ODZfNjQvcmVhZG1lLnR4dCBv
biBoaW50cyBob3cKdG8gcnVuIHRoZSByZXN1bHQgaW4gcWVtdS4uLgoKUmVnYXJkcywKUGV0ZXIK
Cj4gCj4gW3NuaXBdCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
