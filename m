Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F479C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C09281322;
	Fri, 25 Sep 2026 14:44:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxuBluX5jPq3; Fri, 25 Sep 2026 14:44:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5652B8133A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347453;
	b=Yfjqnm2K31k3wxM2RwR9jgfOWdXHpnVLla4grIN7Umbk5rSC2fGHwfC7f7SBCAfXazzG
	 DSv1KbLzLCyr/dvN1zPk3cfhPz6u8hBl/GGMyhfjF2FOxpwlLFQzFhbMUw7+oDM8TTLpi
	 Bf451cwNCJzdVNggymIluh/oeOHrIQrih4cIAs7qx45RU920AjjRbCNt0wlZ/+5YwYl8C
	 yc616sLdftFKKUrouYdUrnM3pMlp/lR8o7NmUJQOoz5h6NBepRBrYxdRexgHSvBQb6l7W
	 3bmWd3Bk0rxIhox06uKSP3U3c5xLpgWcyBQGEIuM7YL+nSsDxBURDrpYe/GvcrmYieg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347453;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=afNe67cWuvqAYPPXHVgcreVdx0jC0BEHzf3tdHaWpgY=;
	b=kVsV02cgJrlF2R9gsE0dstF4Dk655NooOx3kUBjxANAK8gn/GhhIsnwow6m7D64QqDHV
	 QTwf5QrXtHyFJKxmmmPgwlGmIDYKVsXNyK811Js72qIA/Q9PXotDErLXiqhOXzaBDuWiJ
	 Ftfd8JAtrG3qiCHxEXQrwgNPCfCP5VVfvDIm6iAQ5quuijSq5aI4oK3Z5e0ybFgp6Rvnj
	 qOzf25sJ/9/P+95IbcJOnk6xAgL80YRm15xlaALhw+tDlfPM8uvpCMaU1337GhLr/xYtk
	 ITPHoGfRYFrlReHFypvgT52B01iE5Vykn3f7ugIyTpWWaoSwmPnxxLXd0H8lF/4p3TQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347453;
	bh=afNe67cWuvqAYPPXHVgcreVdx0jC0BEHzf3tdHaWpgY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KIglnlD0Z52lUG0l2Ff8NTpv9/Y0T78AtHcpHYtZngOItf6e4wQDJRd0xpRmt30Vi
	 i3zfuWr47SiEriLs1TDbPWTD6av1xPjybhGMamyNQW1R1H1HqE+Ha7orBL57dA8fI3
	 HN3TRxZXyBaQ/LnjdRI+G46Sx2UGrqsL80BtTRDXudGKYOCYcS6j81orCGiIW04tZG
	 O9WaDGhG8s6DniX7i4WtTCJo25AZQn2/iS413+prVMhW2V6awUWYt0Cy/bKPAsoq65
	 VigbX4Gdw2AMeY4y1wJKO5u5RQ7d2G/ntCKgmFfwzSxBS9zYB/UXBgiOw7+49EPmV3
	 nw8IE9UEDf6EA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5652B8133A;
	Fri, 25 Sep 2026 14:44:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B546332
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D70081322
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64iwD0dnEm1X for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:44:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 52E1C8131E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347448;
 b=tUIdqtI6oBmf7eGWacYVffrqDB3XviDAs9wgumPvw7wvxiILXf9sAsdnVLak6XQQ5t+m
 1LwQMa2VNXnjBX3zyq2DvyiXlsGN5JFHtz/vNy0g+sFjZ4ux68EVWp28xaIZ8L+YQc2ss
 AisTd9JR9E6+kcqDy6OK3QVHWeQDnlMVKAcx+h60OC/nTqaHbxZt1QV0hPrdhOli3XwDf
 7uf/T0CJncscFlREVw7/2ShiEqmCFe8m7lMEvl2GscoZW0H3C/GPVjLFgjfXbyqAw/f0X
 dNEMHF/A8r2VMklq2eHmyR9Opwd7dzhuKS05IG7gr1FiKqaraRjveFOavIpD/Hm9KMw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347448;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=DP+x82ZKEsCZsSDRv+z0bKuHm4lleOzBoYG5ibG2ArU=;
 b=CFk+5EqXGGT7JTvCzskayxfkss1M/tPj55rs07Y8kv2/DjnszcWFZAeinrgRXgvPUiCl
 8Z8KpGFaRqnFvTkyN43rgBlOp08uxfjv0DdKD074B8Rp5TvIaXI/ZzcTxyx6o7eP1fV0k
 DGL1+z45iDm34I/17sFmdzkKzm6IsOrMbVI2GhSCHtMr0nRcuOiS1sDJ8YcbxCsyiU1+/
 wJQLc4lD8jQrs/dvbNgT2VlqV/2zxvK5aHKLk/+epkYi9t3c76+ukDNweoqmq/HnAGs3G
 5QbWXx2+Hm9k9ukcPNRDpMT5neJ438FiyubPS7k2mEFeBxuYnzMO/L3MhOisjofOAGw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ObfG1Ydv; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 52E1C8131E
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:44:08 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49fe8bf173aso5583225e9.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347446; x=1790952246;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DP+x82ZKEsCZsSDRv+z0bKuHm4lleOzBoYG5ibG2ArU=;
 b=MwRA6iLOYpOth7rR2HlxOHHlMEGgNlBu3tmwfk27JZ3e4uUZCY+2o14gSQnGs+ppkq
 w6yKd2BGy7462LShI1OXpRwX0liqaZSo+sMiSgyv8i/vAp9FPUaR7gHfg67jrA9phbSz
 /aJS5MJOuyQCouK2bYXguoW/UDxgkK4OXhA68axfCp1jmsFM497mjxUZnYnbCuLHSmzN
 9+d6gZj9KHXguAbU4vmzdR9DxzvMDOose4Kj9EfqCntKiLBvVD/p6knWw8qAfOO03niM
 hwoRIyW3bgu3uKEGgoEvCun3jeuaCuYCZU2HcnVH+fGRApFiclcw4CJTuNq+DkWWA5nC
 0Fkg==
X-Gm-Message-State: AFuF++nowkmMLMcwwHOh3ns25NJpEl2oofGNeK8nSC1NeZGy7z+reSLk
 o8tUW2jv1TtNXlKGYhchzozIa6VJsdQhBsaClPAoKfql5UbIcnmqDRFcdBhqYo7AWG2XsqkzKi+
 AWJTKhkIELw==
X-Gm-Gg: AYBFou1FuovYFmE1ZvKqX3yEnjUC/ziDZ4fWLYcm11Dp0YddD26DNGIy3MfBAObud4q
 Bk3eTvYJXmBcS+yz2jf6WePdZc3qDfu3JTRJv7cuPlwpdMWb7CQ6ctl2DtH/wQvwiTcdrTbSgcp
 hCi0qxI5lA19gjXINQ0S0rsHf5B9fPQN2cajghFSWqrcO/zaXiFi+ff1JzAMA7DB0IZ7tD64rb2
 0stQiTh3R4Gu4Nb1xm34bsRzCzFAWVOt9d52F8GljkNF5koCTJ1ndNADj6OOxO8KAVUsOKEwbet
 y1WWMuL/07jydk8JgSPjsoyEfZixastpUqmNiErUOVbH/AtbDx9pUbnl9VGDtEsHC/tX2DbYOZs
 Xjk4xPAdXI2q6tG31p++zwXWRW/PKpYQM4VpUrQLkU68xZLQgmWpG9v0dULxytXqmyIW+JXKmvS
 NKPewJjs6b+L0ywH8HcTcyh5WcBfNoeIjtRISxY+oqwO3rtJQGYHmSLoHbm6jxmA8yzhFhDayhs
 B6GDNDgKEd8A5w9aV/ObmREPencKbq8KOUO8e0iTCx8NmaFRfjN
X-Received: by 2002:a05:600c:620b:b0:49e:6683:d23c with SMTP id
 5b1f17b1804b1-49fe667f0bfmr108402055e9.0.1790347446199; 
 Fri, 25 Sep 2026 07:44:06 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4887a64ef3asm7799509f8f.30.2026.09.25.07.44.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:44:05 -0700 (PDT)
To: buildroot@buildroot.org,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:43:59 +0200
Message-ID: <20260925144404.4095543-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260907-fix_openscap-v2-2-28f8f6ee3248@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] support/testing: add tests for
 openscap
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gQWRkIGJhc2ljIHRlc3RzIGZvciBvcGVuc2NhcCwgZW5zdXJpbmcgdGhh
dCBpdCBidWlsZHMgYW5kIHJ1bnMgYSBtaW5pbWFsCj4gY29tbWFuZCB3aXRoIGRpZmZlcmVudCBj
cnlwdG9ncmFwaGljIGJhY2tlbmRzOgo+IC0gbGliZ2NyeXB0Cj4gLSBsaWJuc3MKPiAtIG5vIGNy
eXB0byBiYWNrZW5kCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMu
bG90aG9yZUBib290bGluLmNvbT4KCkFwcGxpZWQgdG8gMjAyNi4wOC54LiBUaGFua3MKCj4gLS0t
Cj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfb3BlbnNjYXAucHkgICAgIHwg
NjMgKysrKysrKysrKysrKysrKysrKysrKwo+ICAuLi4vcm9vdGZzLW92ZXJsYXkvcm9vdC9iZW5j
aG1hcmsueG1sICAgICAgICAgICAgICB8ICA1ICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNjggaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2Fn
ZS90ZXN0X29wZW5zY2FwLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9v
cGVuc2NhcC5weQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi4w
ODUyN2QyOGFhNGQKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3Rz
L3BhY2thZ2UvdGVzdF9vcGVuc2NhcC5weQo+IEBAIC0wLDAgKzEsNjMgQEAKPiAraW1wb3J0IG9z
Cj4gKwo+ICtpbXBvcnQgaW5mcmEuYmFzZXRlc3QKPiArCj4gKwo+ICtjbGFzcyBUZXN0T3BlblND
QVBCYXNlKGluZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4gKyAgICBjb25maWcgPSAiIiIKPiArICAg
ICAgICBCUjJfYXJtPXkKPiArICAgICAgICBCUjJfY29ydGV4X2E4PXkKPiArICAgICAgICBCUjJf
QVJNX0VBQklIRj15Cj4gKyAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTD15Cj4gKyAgICAg
ICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9CT09UTElOPXkKPiArICAgICAgICBCUjJfVE9PTENI
QUlOX0VYVEVSTkFMX0JPT1RMSU5fQVJNVjdfRUFCSUhGX0dMSUJDX1NUQUJMRT15Cj4gKyAgICAg
ICAgQlIyX1BBQ0tBR0VfT1BFTlNDQVA9eQo+ICsgICAgICAgIEJSMl9ST09URlNfT1ZFUkxBWT0i
e30iCj4gKyAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfQ1BJTz15Cj4gKyAgICAgICAgIyBCUjJf
VEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAo+ICsgICAgICAgICIiIi5mb3JtYXQoCj4gKyAg
ICAgICAgICAgICAgICBpbmZyYS5maWxlcGF0aCgidGVzdHMvcGFja2FnZS90ZXN0X29wZW5zY2Fw
L3Jvb3Rmcy1vdmVybGF5IikpCj4gKwo+ICsgICAgZGVmIHRlc3RfcnVuKHNlbGYpOgo+ICsgICAg
ICAgIGNwaW9fZmlsZSA9IG9zLnBhdGguam9pbihzZWxmLmJ1aWxkZGlyLCAiaW1hZ2VzIiwgInJv
b3Rmcy5jcGlvIikKPiArICAgICAgICBzZWxmLmVtdWxhdG9yLmJvb3QoCj4gKyAgICAgICAgICAg
IGFyY2g9ImFybXY3IiwKPiArICAgICAgICAgICAga2VybmVsPSJidWlsdGluIiwKPiArICAgICAg
ICAgICAgb3B0aW9ucz1bIi1tIiwgIjUxMk0iLCAiLWluaXRyZCIsIGNwaW9fZmlsZV0sCj4gKyAg
ICAgICAgKQo+ICsgICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQo+ICsKPiArICAgICAgICBv
dXQsIHJldCA9IHNlbGYuZW11bGF0b3IucnVuKCJvc2NhcCAtLXZlcnNpb24iKQo+ICsgICAgICAg
IHNlbGYuYXNzZXJ0RXF1YWwocmV0LCAwKQo+ICsKPiArICAgICAgICBvdXQsIHJldCA9IHNlbGYu
ZW11bGF0b3IucnVuKCJvc2NhcCBpbmZvIC9yb290L2JlbmNobWFyay54bWwiKQo+ICsgICAgICAg
IHNlbGYuYXNzZXJ0RXF1YWwocmV0LCAwKQo+ICsgICAgICAgIHNlbGYuYXNzZXJ0SW4oIkRvY3Vt
ZW50IHR5cGU6IFhDQ0RGIENoZWNrbGlzdCIsICJcbiIuam9pbihvdXQpKQo+ICsKPiArCj4gK2Ns
YXNzIFRlc3RPcGVuU0NBUEdjcnlwdChUZXN0T3BlblNDQVBCYXNlKToKPiArICAgICIiIlRlc3Qg
b3BlbnNjYXAgdXNpbmcgdGhlIGdjcnlwdCBjcnlwdG8gYmFja2VuZC4iIiIKPiArCj4gKyAgICBj
b25maWcgPSAoCj4gKyAgICAgICAgVGVzdE9wZW5TQ0FQQmFzZS5jb25maWcKPiArICAgICAgICAr
ICIiIgo+ICsgICAgICAgIEJSMl9QQUNLQUdFX0xJQkdDUllQVD15Cj4gKyAgICAgICAgIiIiCj4g
KyAgICApCj4gKwo+ICsKPiArY2xhc3MgVGVzdE9wZW5TQ0FQTnNzKFRlc3RPcGVuU0NBUEJhc2Up
Ogo+ICsgICAgIiIiVGVzdCBvcGVuc2NhcCB1c2luZyB0aGUgbnNzIGNyeXB0byBiYWNrZW5kLiIi
Igo+ICsKPiArICAgIGNvbmZpZyA9ICgKPiArICAgICAgICBUZXN0T3BlblNDQVBCYXNlLmNvbmZp
Zwo+ICsgICAgICAgICsgIiIiCj4gKyAgICAgICAgQlIyX1BBQ0tBR0VfTElCTlNTPXkKPiArICAg
ICAgICAiIiIKPiArICAgICkKPiArCj4gKwo+ICtjbGFzcyBUZXN0T3BlblNDQVBOb0NyeXB0byhU
ZXN0T3BlblNDQVBCYXNlKToKPiArICAgICIiIlRlc3Qgb3BlbnNjYXAgd2l0aG91dCBhbnkgY3J5
cHRvIGJhY2tlbmQuIiIiCj4gKwo+ICsgICAgY29uZmlnID0gVGVzdE9wZW5TQ0FQQmFzZS5jb25m
aWcKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9vcGVu
c2NhcC9yb290ZnMtb3ZlcmxheS9yb290L2JlbmNobWFyay54bWwgYi9zdXBwb3J0L3Rlc3Rpbmcv
dGVzdHMvcGFja2FnZS90ZXN0X29wZW5zY2FwL3Jvb3Rmcy1vdmVybGF5L3Jvb3QvYmVuY2htYXJr
LnhtbAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5hYWMwZjFl
MGZhOWEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9vcGVuc2NhcC9yb290ZnMtb3ZlcmxheS9yb290L2JlbmNobWFyay54bWwKPiBAQCAt
MCwwICsxLDUgQEAKPiArPD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPiAr
PHhjY2RmOkJlbmNobWFyayB4bWxuczp4Y2NkZj0iaHR0cDovL2NoZWNrbGlzdHMubmlzdC5nb3Yv
eGNjZGYvMS4yIiBpZD0ieGNjZGZfb3JnLmJ1aWxkcm9vdC5iZW5jaG1hcmsiPgo+ICsgIDx4Y2Nk
ZjpzdGF0dXM+YWNjZXB0ZWQ8L3hjY2RmOnN0YXR1cz4KPiArICA8eGNjZGY6dmVyc2lvbj4xLjA8
L3hjY2RmOnZlcnNpb24+Cj4gKzwveGNjZGY6QmVuY2htYXJrPgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
