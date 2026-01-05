Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB86CC79FA7
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 17:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAE85812B1;
	Mon,  5 Jan 2026 17:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ma_FoHZp0Oew; Mon,  5 Jan 2026 17:28:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D44D38127F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767634138;
	bh=meb+HjKdzXDTZf6mqW6PLiiwqTaGVJUykua0ifWnFNE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b4Y5ClbbuafUNF5JQ/z1eyTsLrq5Y970h5O80VbednM8EjPCvzhiFk+/HBfcBs4Wp
	 MCt2Co3Au9COzJDA56enfaavy+Op9nfWbluXBnzSZ54v0aN6uEYtvsDiff/hpjnVN5
	 NS5TQsWxWhnGucmMqd1LU6Fz0h5XCoFwJefcJXYUBccxhWjubwLVPyv4S33LU5iWhf
	 iV0nLwXbCWyVxMxTO2GU6x9elt2KR85LfLWHldL+gfqiZyzjURDfcQGfrnRGugK2LH
	 fISon78fHlV9lkb+rcpz6zURx00D8T0zwHoIEdOiRkRfKt0N4na1OB03WpaQuRMGQF
	 K5hrdFANY+74g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D44D38127F;
	Mon,  5 Jan 2026 17:28:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B2F04E7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 17:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A51D0401DA
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 17:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INb7uTrQt_o1 for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 17:28:55 +0000 (UTC)
X-Greylist: delayed 306 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 05 Jan 2026 17:28:54 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9A3C340187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A3C340187
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.131;
 helo=mout.kundenserver.de; envelope-from=paguilar@paguilar.org;
 receiver=<UNKNOWN> 
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A3C340187
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 17:28:54 +0000 (UTC)
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [192.168.0.72] ([81.56.223.94]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.17.189]) with ESMTPSA (Nemesis) id
 1MbS0X-1w9P2J1PsP-00ei0B; Mon, 05 Jan 2026 18:23:46 +0100
Message-ID: <cdf7d955-4108-45b8-a06b-de93b52cef91@paguilar.org>
Date: Mon, 5 Jan 2026 18:23:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Pedro Aguilar <paguilar@paguilar.org>
Content-Language: en-US
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, romain.naour@smile.fr
X-Provags-ID: V03:K1:jO47H2mhWM8lxa1OdRF88Xc9nhED8yMUP1Y/WqMx3j1uBbeIzjb
 MxxUxeaEk6FrbxCwGH8+imPP9EZmQEDkvcIrtcd2a3vYCVUQAOsdXhqIVpozzbAVXUQDv+A
 KHrvIDCO9tVJ2c38/TIS3Hk2RCaSnQfPDR7lD/9HGLzIp5UJub03fUht7y3K35bIiKaumq/
 ImWV7Jr0Q0sDmTJyTaUfw==
UI-OutboundReport: notjunk:1;M01:P0:8miqENcM/N8=;nvCkl4hRuN7aJYAroSjEMuUVcgA
 ewtb5Bem0iAPDPcDiENyL375XuJy4RNyvh7WLXsB9JSbcHvbJzz33hrRR5jDBpJs/DdpfAq2T
 58KqCl3mzifxoFVzXsEkcsFb54QXaGVsOGxxT74/+1+TxHSIerdcFLbWZ3pM9Lrfiqh5Ml71m
 Mua6nV+0NqH7SHkIW9ggxrWXs7oHqz8VR7e1dbS9gwLdLb8EcjfHqj9VWt/4TQlqYq+ag+Yg+
 Yfd5U2IzGCnkxX2bPzQlLvls7Epy9i3Wn1h6wpXfuDt+pg4BP+E3qK6rrOmSLYg6xDOZjayNx
 y6hd4jdfi9xAG6AlYcGDflZbwjJk1q6G18Wyy3RV38HJdGZwrsm+MdxcJ9KTlL8sVMEsEowrl
 ogYYdsptH3yKrxUcZdAAC7cRnR3YaAHA13KpcRaFPX4MoegYBFHKKsoyDKbpOJB09YYfoSv+k
 eDSOdmycfBI+rbKAW+0k/1HXXoMHcmV0RBczu0GEu2uZlIDP7nqExFi0AWd3y2nTH4GWKTAKA
 pbVD2MVSHMfTmY1GQxaq7NhpHWt9T2oPfmOFLR9NPxaK2voKfq29rBZJ+pxV+sWDxfC8nVget
 ySlTVsuZwi6fakNAZaG5tVvvHedOnkCwDx7lHnsP1GMPoAHBE+MMpfMvnojaFH64SLO1pzBRl
 2M1NxdSHbn+R0tjBDDCbBKTlfacjCAob6DicuZTAWYxfy0m6NnB6RIaRLbVC9DSRp9AVgebRa
 6oDE8fomOLQ6l6+7+fNL8fMVYcgWSA7borTMUe2JBu3g96bveSDfs6wAluXyEAszcDsGOVfDn
 Ul+1O4DAkqM6AV1vBJzu2AlFY7hzhc2KIq3ZEal9yopP3taVMrzaygJdT1HMKcBbC1jCIFSdN
 5VCLxnICycCHhBU1CltOrbYspkE5MMP41fAKaDt/g9P0HJB1qHVKiH8+53S0PPm+X2DqnIRsJ
 C59wq11OTHX6q10+K/+R5NlzwkDe0Ncvq+j4Xp4u/a0wae1C50Mjj7L+f/+5Jnaza5DhieFqc
 uBqBjoMALqf0wJfDoKHc4t913MDc6sBd1SxXJ5f/wY95yH6LhDsryjpYLYZV2CUvVlUW/YASj
 qh0wInklmr/tB5WHPHRrV853hoXY3fN0Wmmf2nPKfXb5IT9gzgrx0NRGHbYB+mJPANFl/hYz+
 Ssy7pf6Z9cE8I2A31FX28sVsuAF5PM7MPcPSh+AXcVPcymgPCPenf4EQd4LplHNtjp6GGsRSH
 qnMo+28OuX8E3blZYz/EiNEoYqHP8MaC+xHqvnLIFnMYJJysBrKFxyMKMWAqYf8tDF/iuFtb4
 35JL5X6mlwrB1dT0lnSTxLTpFCP5BW6KtnkFNrtDSzyskixgP9Q8jimuSo1Zvmgp2CnM63Lkt
 dLG9kA39LvqD5uQULnzEC1BNvEulyo5G7y8ajAWnANRSo9R//TjsEvO91tsdG0mMvtKh9y2Qc
 5V3rlDkKd9r2X/Lw1rm/W9+ELa42YBswvUdZZTIr64MMvSkKsSmXKgH2b2wE9WjLOGwUNqrit
 FVVQr7exFLip/AYbazBKiWZrcVCTLVgjxjbbOAlKpfBmn6p77jg9B9ghD9iLXuYSpqqGOuWVR
 XOSZs/id/XjmnxmIICjQABWTCzv0UwDNupqbkk2hFHBnlGtPpJznQrCoKBvZW6QKSWbiGd4x9
 dOVhL7u6ZoW4ayCX0L52ZuHoWqH2Fyd7FDABQWfqHbQExkjhTsCaifmth1PR39LWYgj2Zrgx5
 EOvakcR+5UolO
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paguilar.org; 
 s=s1-ionos; t=1767634132; x=1768238932; i=paguilar@paguilar.org;
 bh=kFwcWgjVN5PTmCT53YBlPU4Eq1DEgZOuMNM2TQ9mY2g=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
 Cc:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=01X/lFI1Rqb4OESpi75H3pbV8ae/7clm8jH3F/qLTT+3yIQNum22njwwE+UcPdnZ
 uqjX3N1HdE+NwBKKud0RYfrx9pZK3bZJco4x6tLsBVPRf2skbcxnU75c2QoLd4+Z+
 Z2IIt7RsEMQ5m03W5q5T/9yHqc5w27DzCWDos7yfqLfKbF5BL12zqEdLwhiL/UCYY
 s4IJ6oAOsh++zM/99hKROKKK2woHkxS0gk7PLnKbFF6ZQ6i9cfkkqqtctxUBvA41n
 wa/ty+wvHnU1rVV+2WkL1adW6yAkaeM/f9Plt8ecs39/bi7U3P9aCdGI5j7V94jAy
 zBaT95qZFtalNXQXdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=paguilar.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b=01X/lFI1
Subject: [Buildroot] [RFC] Top-level parallel build without the per-package
 directory option
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgYWxsLAoKSW4gb3JkZXIgdG8gc3BlZWQgdXAgc2lnbmlmaWNhbnRseSB0aGUgYnVpbGRpbmcg
cHJvY2VzcyBhbmQgdXNlIGV4YWN0bHkgCnRoZSBzYW1lIHN0b3JhZ2Ugc3BhY2UgYXMgdGhlIHRy
YWRpdGlvbmFsIGJ1aWxkcyAoaW5zdGVhZCBvZiB1c2luZyB0aGUgCnBlci1wYWNrYWdlIGRpcmVj
dG9yaWVzIG9wdGlvbiksIEkgd3JvdGUgYSBzaW1wbGUgcHJvZ3JhbSB0aGF0IGNhbiBiZSAKZWFz
aWx5IGludGVncmF0ZWQgaW50byBCdWlsZHJvb3QuIFRoaXMgQnVpbGRyb290IHBhcmFsbGVsIGJ1
aWxkZXIgaGFzIApiZWVuIHN1Y2Nlc3NmdWxseSB0ZXN0ZWQgZm9yIGEgd2hpbGUgd2l0aCBtYW55
IGRlZmF1bHQgZGVmY29uZmlncyBhbmQgCmV4dGVuc2l2ZSBicjItZXh0ZXJuYWwgdHJlZXMuCgpU
aGUgaWRlYSBiZWhpbmQgdGhpcyBwcm9ncmFtIGlzIHRvIGJ1aWxkIGFsbCB0aGUgcGFja2FnZXMg
dXNpbmcgYSAKZGlyZWN0ZWQgZ3JhcGjCoG9yZ2FuaXplZCBpbiBsZXZlbHMuIEVhY2ggbm9kZSBv
ZiB0aGUgZ3JhcGggcmVwcmVzZW50cyBhIApwYWNrYWdlIHRvIGJlIGJ1aWx0IGFuZCBlYWNoIGxl
dmVsIGNvbnRhaW5zIGFsbCB0aGUgbm9kZXMgKHBhY2thZ2VzKSAKd2hvc2UgZGVwZW5kZW5jaWVz
IGFyZSBub2RlcyBvZiBoaWdoZXIgbGV2ZWwuIEEgbGVhZiBub2RlIGluIHRoZSBncmFwaCAKbWVh
bnMgdGhhdCB0aGVyZSBhcmUgbm8gb3RoZXIgbm9kZXMgdGhhdCBkZXBlbmQgb24gaXQuClRoZSBn
cmFwaCdzIHJvb3QgaXMgYSBwYWNrYWdlIHRoYXQgZG9lcyBub3QgaGF2ZSBhbnkgZGVwZW5kZW5j
eSBvbiBhbnkgCnBhY2thZ2UgYW5kIHRoaXMgaXMgdGhlIGZpcnN0IGxldmVsLiBUaGUgc2Vjb25k
IGxldmVsIGNvbnRhaW5zIHBhY2thZ2VzIAp3aG9zZSBvbmx5IGRlcGVuZGVuY3kgaXMgdGhlIGdy
YXBoJ3Mgcm9vdDsgdGhlIHRoaXJkIGxldmVsIGNvbnRhaW5zIApwYWNrYWdlcyB3aG9zZSBkZXBl
bmRlbmNpZXMgYXJlwqAgcGFja2FnZXMgZm91bmQgaW4gdGhlIHNlY29uZCBhbmQgZmlyc3QgCmxl
dmVsczsgYW5kIHNvIG9uLgpJbiBvcmRlciB0byBidWlsZCBwYWNrYWdlIEEsIGl0cyBkZXBlbmRl
bmNpZXMgbG9jYXRlZCBpbiBoaWdoZXIgbGV2ZWxzIAptdXN0IGJlIGJ1aWx0IGZpcnN0LiBBcyBz
b29uIGFzIHBhY2thZ2UgQSBpcyBidWlsdCwgcGFja2FnZSBCIHRoYXQgCmRlcGVuZHMgb24gcGFj
a2FnZSBBIGFuZCB0aGVyZWZvcmUgaXMgaW4gYSBsb3dlciBsZXZlbCwgY2FuIGJlIGJ1aWx0LgoK
VGhlIGZldyBzdGVwcyBmb3IgdXNpbmcgaXQgYXJlIHRoZSBmb2xsb3dpbmc6CgotIERvd25sb2Fk
IEJ1aWxkcm9vdCBmcm9tIHRoZSBvZmZpY2lhbCBzaXRlCgotIERvd25sb2FkIHRoZSBwYXJhbGxl
bCBidWlsZGVyOgogwqAgJCBnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL3BhZ3VpbGFyL2Jy
LXBidWlsZGVyLmdpdAoKLSBDb3B5IHRoZSBwYXJhbGxlbCBidWlsZGVyIGluc2lkZSBCdWlsZHJv
b3Q6CiDCoCAkIGNkIGJyLXBidWlsZGVyCiDCoCAkIC4vc2NyaXB0cy9pbnN0YWxsLnNoIC1iIDxi
dWlsZHJvb3RfcGF0aD4KCi0gQ29uZmlndXJlIEJ1aWxkcm9vdDoKIMKgICQgY2QgPGJ1aWxkcm9v
dF9idWlsZF9wYXRoPgogwqAgJCBtYWtlIG1lbnVjb25maWcKCi0gQnVpbGQgdXNpbmcgdGhlIHBh
cmFsbGVsIGJ1aWxkZXI6CiDCoCAkIG1ha2UgcGJ1aWxkZXIKCkZvciBhbiBpbi1kZXB0aCBkZXNj
cmlwdGlvbiBvZiBob3cgaXQgd29ya3MgYW5kIHRvIGdpdmUgaXQgYSB0cnksIApkb3dubG9hZCBp
dCBmcm9tIGhlcmU6Cmh0dHBzOi8vZ2l0aHViLmNvbS9wYWd1aWxhci9ici1wYnVpbGRlcgoKQW55
IGZlZWRiYWNrIGlzIHdlbGNvbWUhCgpUaGFua3MhCgpSZWdhcmRzLAotLQpQZWRybyBBZ3VpbGFy
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
