Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A1CC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F36381EBB;
	Tue,  6 Feb 2024 17:32:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eaSUwH4nlXJl; Tue,  6 Feb 2024 17:32:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF269824DF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF269824DF;
	Tue,  6 Feb 2024 17:32:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D9661BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0AE6F824DF
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:32:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Af0smZ_P1EIy for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:32:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A626081EBB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A626081EBB
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A626081EBB
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:32:39 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33adec41b55so3709209f8f.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 09:32:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707240757; x=1707845557;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xtvmHUdNyZzzrwy/dRVz9+frn23YPxUao94mb/3eltI=;
 b=G69OGbNhI9RnMjBXoRz7nZ41AcQGMeD7C4IssewVyYH7E33b0v9kxn28JmFeI1wqfY
 Q28FtvVPtxBD3jlIcUdPsHLt8Yfo9n3x3Uy0SMgdEPgzW1Yc476ghDBecF66THrLL4XZ
 RL6lL73lxTSzXw+hFTr3/5Hl9jv9lTxLddXhlnWfRvl+taTf/wTvQQlN3Tw2GSR+l6zh
 asSuJEXxaB8/Sc+z6alU67xSCYWbMIfuvUm7XDQCnICQgFsAz6Jw4N+e1f/Ri2K5i6ow
 i/crMsECqjCUGkRxQQFUBprT1C+EqmxVG4ShfJDp67PsxUzoUCOpbsC9bPvWDUOcsBr8
 4DeQ==
X-Gm-Message-State: AOJu0YzuScwxcSTYsmPySFfy6GJqz0l00q12BKuQYF94bGES0nCnpeON
 iL054EE7RAB9134pkZ9BKFW5XbsAT26pwO0DZF1kdiUyOyQmjb3AJYEC19AuUttamnSovSPI29s
 UdiA=
X-Google-Smtp-Source: AGHT+IH0xuMq/JXQJ00qS9UOAc8Xj9Y5U5RftZOarAPx330Q0o+lz9UVQ2jVf+zaPP2WHmJaRdB70w==
X-Received: by 2002:a5d:64ca:0:b0:33b:48fb:5f97 with SMTP id
 f10-20020a5d64ca000000b0033b48fb5f97mr1655165wri.42.1707240757558; 
 Tue, 06 Feb 2024 09:32:37 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVuCaWh3BQ2yaCU/rDAMFowLOPZLV7iLcTv2s9iuiRowh6QZ2nKsRPWVOlusX0ISGhJT6NAj7MoCgiVfLLbtfLa/zmOvmgCbg==
Received: from [192.168.17.126] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a5d6685000000b0033ae54cdd97sm2539166wru.100.2024.02.06.09.32.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 09:32:37 -0800 (PST)
Message-ID: <2be6d0df-6165-4da9-b69c-ad0deb5444be@smile.fr>
Date: Tue, 6 Feb 2024 18:32:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240106101202.495801-1-fontaine.fabrice@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20240106101202.495801-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707240757; x=1707845557;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xtvmHUdNyZzzrwy/dRVz9+frn23YPxUao94mb/3eltI=;
 b=QzFR368BAEZ185GpU7LI5blZIqujC4DEfMrSXgj0Z6zsebx91CGaGivSn/2IHod1ya
 8tWJrrXbg7lxLa8mdp7C5FrZnEDMkqOQ58QHnNObWErWgLrCG6Ak8saWMzZAmHBRd6KJ
 RhL884aERj3n0VjSmL+n2c1SXbehzNoqZMfXwl0bHZzTnrUlC6AtvASh75s8MkOkxSPy
 OTofHBAnyOFci5bB9olC9FnKOsG4g2bo+rNJLfUUp5/e5rprBm7g26/iLFxD17SJPqLJ
 6Z+I1Bw5oC8nwdZk95WlBWpDm33S/pE6ruVQyRZ2GjWWYzzzhMvObJuxz0PZh5Pr2lBQ
 PJyA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=QzFR368B
Subject: Re: [Buildroot] [PATCH 1/1] package/ncmpc: don't set NLS
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAwNi8wMS8yMDI0IMOgIDExOjEyLCBGYWJyaWNlIEZvbnRhaW5lIGEgw6ljcml0
wqA6Cj4gbmNtcGMgaXMgYWJsZSB0byBhdXRvbWF0aWNhbGx5IGRldGVjdCBOTFMgc3VwcG9ydCBz
aW5jZSB2ZXJzaW9uIDAuNDcgYW5kCj4gaHR0cHM6Ly9naXRodWIuY29tL011c2ljUGxheWVyRGFl
bW9uL25jbXBjL2NvbW1pdC9jMjY0ZGIwNGRkMzBhZjMwMWU3ZDg1YzlkMTQ1YmIxZjFhZTNmZWEz
Cj4gc28gbGV0IGl0IGhhbmRsZSBhdXRvbWF0aWNhbGx5IHRvIGF2b2lkIHRoZSBmb2xsb3dpbmcg
YnVpbGQgZmFpbHVyZSB3aXRoCj4gYSBib290bGluIHRvb2xjaGFpbiB3aGljaCBlbWJlZHMgYSBn
ZXR0ZXh0IGRlZmluaXRpb24gaW4gbGliaW50bC5oIHdoaWNoCj4gd2lsbCBjbGFzaCB3aXRoIHRo
ZSBmYWtlIGdldHRleHQgZGVmaW5pdGlvbiBwcm92aWRlZCBieSBuY21wYyBzaW5jZQo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9NdXNpY1BsYXllckRhZW1vbi9uY21wYy9jb21taXQvOTVhZjI3YWIyZDNj
ZWI5ZGYyNmViYjRlMGQ5MzZlMzkyYTg0YzE1MzoKPiAKPiBJbiBmaWxlIGluY2x1ZGVkIGZyb20g
Li4vc3JjL3NhdmVfcGxheWxpc3QuY3h4Ojg6Cj4gL2hvbWUvYnVpbGRyb290L2F1dG9idWlsZC9p
bnN0YW5jZS0yL291dHB1dC0xL2hvc3Qvb3Ixay1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3Qv
dXNyL2luY2x1ZGUvbGliaW50bC5oOjM5OjE0OiBlcnJvcjogZXhwZWN0ZWQgdW5xdWFsaWZpZWQt
aWQgYmVmb3JlICdjb25zdCcKPiAgICAzOSB8IGV4dGVybiBjaGFyICpnZXR0ZXh0IChjb25zdCBj
aGFyICpfX21zZ2lkKQo+ICAgICAgIHwgICAgICAgICAgICAgIF5+fn5+fn4KPiAvaG9tZS9idWls
ZHJvb3QvYXV0b2J1aWxkL2luc3RhbmNlLTIvb3V0cHV0LTEvaG9zdC9vcjFrLWJ1aWxkcm9vdC1s
aW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9saWJpbnRsLmg6Mzk6MTQ6IGVycm9yOiBleHBl
Y3RlZCAnKScgYmVmb3JlICdjb25zdCcKPiAuLi9zcmMvaTE4bi5oOjIyOjIwOiBub3RlOiB0byBt
YXRjaCB0aGlzICcoJwo+ICAgIDIyIHwgI2RlZmluZSBnZXR0ZXh0KHgpICh4KQo+ICAgICAgIHwg
ICAgICAgICAgICAgICAgICAgIF4KPiAKPiBJbmRlZWQsIGV2ZW4gaWYgTkxTIGlzIGRpc2FibGVk
IGJ5IHRoZSB1c2VyLCBsaWJpbnRsLmggd2lsbCBiZSBpbmNsdWRlZAo+IGJ5Cj4gL2hvbWUvZmFi
cmljZS9idWlsZHJvb3Qvb3V0cHV0L2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vb3Ixay1idWlsZHJv
b3QtbGludXgtZ251L2luY2x1ZGUvYysrLzEzLjIuMC9vcjFrLWJ1aWxkcm9vdC1saW51eC1nbnUv
Yml0cy9tZXNzYWdlc19tZW1iZXJzLmgKPiB0aG91Z2ggaW5jbHVkZSA8Y2hyb25vPgoKV2UgdXN1
YWxseSB3YW50IHRvIGV4cGxpY2l0bHkgaGFuZGxlIHN1Y2ggb3B0aW9uIGZyb20gQnVpbGRyb290
IHBhY2thZ2UgdG8gbm90CnJlbHkgb24gYXV0b21hdGljIGRldGVjdGlvbiAoYXMgY3VycmVudGx5
IGRvbmUpLgoKSXQgbG9vayBsaWtlIG1vcmUgYSBidWcgaW4gbmNtcGMgYnVpbGQgc3lzdGVtPwoK
QmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IEZpeGVzOgo+ICAtIGh0dHA6Ly9hdXRvYnVpbGQu
YnVpbGRyb290Lm9yZy9yZXN1bHRzL2M4NjBlNjQ5MDlkZDNiN2ZhMDMzZGIwOTcwZTFjZmMxMzc2
YzRlYzUKPiAgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8zNmVhYjU1
NmZhYzgwMTI0NzU1YmZmNDExMGFmM2U0M2ZlNmVkZDc4Cj4gCj4gU2lnbmVkLW9mZi1ieTogRmFi
cmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Cj4gLS0tCj4gIHBhY2th
Z2UvbmNtcGMvbmNtcGMubWsgfCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbmNtcGMvbmNtcGMu
bWsgYi9wYWNrYWdlL25jbXBjL25jbXBjLm1rCj4gaW5kZXggYmM4YTYyZGFlYS4uMDk2NTk4MWYy
MyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL25jbXBjL25jbXBjLm1rCj4gKysrIGIvcGFja2FnZS9u
Y21wYy9uY21wYy5tawo+IEBAIC0yMCw4ICsyMCw3IEBAIE5DTVBDX0NQRV9JRF9WRU5ET1IgPSBu
Y21wY19wcm9qZWN0Cj4gIAo+ICBOQ01QQ19DT05GX09QVFMgPSBcCj4gIAktRGN1cnNlcz1uY3Vy
c2VzIFwKPiAtCS1EZG9jdW1lbnRhdGlvbj1kaXNhYmxlZCBcCj4gLQkkKGlmICQoQlIyX1NZU1RF
TV9FTkFCTEVfTkxTKSwtRG5scz1lbmFibGVkLC1EbmxzPWRpc2FibGVkKQo+ICsJLURkb2N1bWVu
dGF0aW9uPWRpc2FibGVkCj4gIAo+ICBpZmVxICgkKEJSMl9QQUNLQUdFX0xJUkNfVE9PTFMpLHkp
Cj4gIE5DTVBDX0RFUEVOREVOQ0lFUyArPSBsaXJjLXRvb2xzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
