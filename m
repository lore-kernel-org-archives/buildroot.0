Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E81C982D7
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 21:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AF5A40CE5;
	Fri, 18 Sep 2026 21:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V0y3zA4C373o; Fri, 18 Sep 2026 21:40:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 26A8940CE6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789767628;
	b=MT4h3mjlpo456DAZ82JsifGSoiwve3X6nROxAjJYs+z6Jf5zYr6gEBgomC1p2041CF7R
	 y5dtREex2cMl7f6TC13pah/0OKZDAnrHux3bqkWTyq3dTbYUz4Scv7nEJ/J1i9cfDrXLJ
	 7ICOR72WW/0uPUw2tNi6Yw3tiYCcpaa3aGPEg6dYAZlQ9Jy4z6yJ5VLmNi6mtaElNlsKN
	 8yqW4E3G5HxsFhmfSj/jrKoLoaisyjXj1ZWfG8FrTHvNdRT1mgpGC3gBF4ky/xBnTzAWb
	 f5a22KNt+pDTnno044IIypUfPCC3JGI+orVLDpmVUdu0mA8o4TxVLZn0Eys0Mhiz8RQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789767628;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=g7UL9yJapD6In+0ftj9dAJABm6Gqef5QO3uKB3w5Yng=;
	b=CsEE9Cf/LNunsLH6vramsqYKqnYQzYcpyhMhFGP9LSw6EBojF/CcFCjXWvJhUPLLPfYv
	 YBjBFkxvqrpc5neD2qOTTLAvZnjYjqsH6G2UqMnxy4NcJthDeF6jk6e7WsHS0Ro1+miDb
	 vhAS72BzAGvBjocbWiuFejD5SpPftzWxxNX/wiR9ArVkkdLoLrPJmBZCjgMZ+PszS4TTl
	 WM1o+zpnamBIg9TXyn+suAFUqfTXPR3TUMTElK55P/L/vjH7H+izRsYJn9dn5RXLaYLIM
	 5BRi+C+mY8FEv5loBMvhJZ9Vt+IBwG1mLqrTWnESQs4IDxo2OET0+xmntAKCnaDW0xA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789767628;
	bh=g7UL9yJapD6In+0ftj9dAJABm6Gqef5QO3uKB3w5Yng=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mS8DbKMpne4KbY3V5F0fZ6AqORhJVBrRTvl1KbdDSKzMnCVJQf2P80F594jBXZCCj
	 HibbOTEEFanZB1P0vHaRqnfUq8sQqlyqd4/mUidqkCgxwC4jQvH4dw2Nc6/9l2rQbA
	 x1h5uePlCvFBTeLn6Q0qmNsZYnSAws11SeAqrXaHHhIBXpjBk5A78I0Nhwh6pROP0s
	 8Vvd9fwrzYY6FjtbYoupg+f/bzrvhxw4lN2dbUGpdKdPAQAeC4swYA6wEbjSmddyUV
	 7552vqP1DmJdGn6W8HM6WjpmB9tR3rkvgdTwkLbF0nNiIp3AWPHLO5aWQ9EMFDz5Az
	 1z1VMG3VGgQjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26A8940CE6;
	Fri, 18 Sep 2026 21:40:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EC431E9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 349B7400AB
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbpYF4l7jpul for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 21:40:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 8B14D40022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789767624;
 b=cUTdpzAn/btF8bYkArgEvLPOhhlwS+br4j0vp7Lw02vxnXnDvRva4Mp+gQhWwmI3e/Pe
 chk0eaE5T6q65Os35OCjW3qZP/R4sTSvOzs3VGL3ODA60SXqbUkIFG5NYm2PGFEwmFLtW
 KOgQkG3cRwPwTnvEM7kWweemAm2Irujq+v5lpIU37T1M91ZmIkFFqAvOsCjWFL74CAmtC
 kTNAoQiDdClZhrLQlQLjhdgKOwvEZDgnsjEcXc+IY8NwOnO2qwbjaK5xYq+BbUsqveKD/
 YpX8l6ldi41IXurvtQtK56n9dgkuEAYq5KKZ/She76Zhe1IOLxA1+7HQNhpv5OinKSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789767624;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=PuAUEEKNO7G6gS6MfzYrVCTQQAgUhBhcbI5HO2zezMY=;
 b=CuuMCFPGcVh8NUyujrQt23sfR61AtJXommSwj8Pz2D18XyUgWr6WwGKbNh9J9awPi2hv
 3TDyVLlCAzYQAsHAuhyvXQmwidEAU6hdKHDZ5UTygY+ob/RD8KyraTQL0zUX9PeQ5Qj0C
 bKB50EgVXnJ7WOMLfYD2uspkqhfR8+jPSR536IVbQeOLcSTDpylpqQB/+jllj+3ABaM71
 6duQlNSXtfw+4tFTlTYuSOYODLs1tQFSuWtbIxhEfMrWoVY9H4wqQwGjK4C/ohO4iGLgS
 xfEo4g1uoobfj7c4DphTH+gz8jNdda/zkJQzlXTGUPWlnQVC4Qu4xH7sS51FXhTxBCw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=GKl1YvYZ; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B14D40022
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 21:40:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 82F1AC5847C;
 Fri, 18 Sep 2026 21:41:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5B93960649;
 Fri, 18 Sep 2026 21:40:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 25F8C10328ADB; 
 Fri, 18 Sep 2026 23:40:10 +0200 (CEST)
Date: Fri, 18 Sep 2026 23:40:10 +0200
To: Afshin Pir <Afshin.Pir@gallagher.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>, 
 Joseph Kogut <joseph.kogut@gmail.com>, David Pierret <david.pierret@smile.fr>, 
 Danilo Bargen <mail@dbrgn.ch>, Graeme Smecher <gsmecher@threespeedlogic.com>, 
 Torben Voltmer <mail@t-voltmer.net>, James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>,
 Alexander Shirokov <shirokovalexs@gmail.com>, 
 Sam Voss <sam.voss@gmail.com>, Saeed Kazemi <kazemi.ms@gmail.com>, 
 Alex Michel <alex.michel@wiedemann-group.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>, 
 Christopher Obbard <obbardc@gmail.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Message-ID: <aq2uqSD7ynZ7y32B@windsurf>
References: <20260805022122.417221-1-afshin.pir@gallagher.com>
 <aq03yFO5x8DdU9MG@windsurf>
 <SY8PR01MB9238552908F7113FE349752194872@SY8PR01MB9238.ausprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SY8PR01MB9238552908F7113FE349752194872@SY8PR01MB9238.ausprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] support/download: update rust package
 dependency resolving
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpPbiBGcmksIFNlcCAxOCwgMjAyNiBhdCAwOToyNToyMVBNICswMDAwLCBBZnNoaW4g
UGlyIHdyb3RlOgoKPiAxLSBSZWdhcmRpbmcgeW91ciBjb25jZXJuIGFib3V0IOKAmG1ha2UgbGVn
YWwtaW5mb+KAmSwgSSBiZWxpZXZlIG15IGFwcHJvYWNoIGlzIG5vdAo+IHRvbyBtdWNoIHdvcnNl
IHRoYW4gd2hhdCB3ZSBoYXZlIHJpZ2h0IG5vdy4gQmVjYXVzZSByaWdodCBub3cgd2hlbiB3ZSBy
dW4gYG1ha2UKPiBsZWdhbC1pbmZvYCwgd2Ugd29u4oCZdCBjb2xsZWN0IHRoZSByZWFsIGxpY2Vu
c2VzIGZvciBhbGwgZGVwZW5kZW5jaWVzLgoKTm90IGNvbXBsZXRlbHkgY29ycmVjdC4gSXQgaXMg
dHJ1ZSB0aGF0IHdlIGRvbid0IGxpc3QgaW4gPHBrZz5fTElDRU5TRQp0aGUgbGljZW5zZSBvZiB2
ZW5kb3JlZCBkZXBlbmRlbmNpZXMgYW5kIGluIDxwa2c+X0xJQ0VOU0VfRklMRVMgYWxsCmxpY2Vu
c2UgZmlsZXMgZnJvbSB2ZW5kb3JlZCBkZXBlbmRlbmNpZXMuIEhvd2V2ZXI6CgoxLiBXZSBjb3Vs
ZCBkbyB0aGF0LCBiZWNhdXNlIHRoZSB2ZW5kb3JlZCBkZXBlbmRlbmNpZXMgYXJlIGluIHRoZSB0
YXJiYWxsLgoKMi4gQXQgbGVhc3QgdGhlIHNvdXJjZSBjb2RlIG9mIHRoZSB2ZW5kb3JlZCBkZXBl
bmRlbmNpZXMgaXMgaW4gdGhlCiAgIHRhcmJhbGwgZ2VuZXJhdGVkIGJ5IG1ha2UgbGVnYWwtaW5m
bywgYW5kIHRoYXQgaW5jbHVkZXMgdGhlIGxpY2Vuc2UKICAgZmlsZXMgZm9yIGFsbCB2ZW5kb3Jl
ZCBkZXBlbmRlbmNpZXMuCgpTbyB5ZXMsIHdoYXQgeW91IHByb3Bvc2UgaXMgd29yc2UgdGhhdCB3
aGF0IHdlIGhhdmUgcmlnaHQgbm93OiB5b3VyCmFwcHJvYWNoIGFzIGl0IGlzIGRvZXNuJ3QgZXZl
biBpbmNsdWRlIHRoZSBzb3VyY2UgY29kZSBvZiB2ZW5kb3JlZApkZXBlbmRlbmNpZXMuCgo+IEkg
ZG9u4oCZdCBiZWxpZXZlIHdlIGNvbGxlY3QgTGljZW5jZSBmaWxlcyBmb3IgYWxsIGRlcGVuZGVu
Y2llcyBpbnNpZGUgbGljZW5zZXMKPiBmb2xkZXIgb2YgbGVnYWwtaW5mbyByaWdodCBub3cgYXMg
d2VsbCAoYXQgbGVhc3QgSSBkaWRu4oCZdCBzZWUgYW55dGhpbmcgaW4gdGhlCj4gYnVpbGQgc2Ny
aXB0cyB0byBkbyB0aGF0KS4gQnV0IGZvciB0aGUgc291cmNlcywgaXQgaXMgdHJ1ZSB0aGF0IHdl
IGRvbuKAmXQgaGF2ZQo+IGRlcGVuZGVuY3kgc291cmNlcyBpbnNpZGUgbGVnYWwtaW5mbyBmb2xk
ZXIgd2l0aCBteSBhcHByb2FjaC4gQnV0IGl0IG1heSBiZQo+IHBvc3NpYmxlIHRvIGp1c3QgYWRk
IHRoZSB3aG9sZSBCUl9DQVJHT19IT01FIGZvbGRlciBhcyBhIGNvbXByZXNzZWQgLnRhci5nego+
IGluc2lkZSBsZWdhbC1pbmZvIHNvdXJjZXMgdG8gYWRkcmVzcyB0aGUgaXNzdWUuCgpUaHJvd2lu
ZyB0aGUgZW50aXJlIEJSX0NBUkdPX0hPTUUgbWVhbnMgdGhhdCBpdCB3aWxsIGluY2x1ZGUgdG9u
cyBvZgp1bnJlbGF0ZWQgY3JhdGVzLiBKdXN0IGlmIG9uZSBkYXkgeW91IGJ1aWx0IGEgQ2FyZ28g
cGFja2FnZSBpbgpCdWlsZHJvb3QsIGFsbCBpdHMgY3JhdGVzIHdpbGwgYmUgZm9yZXZlciBpbiBC
Ul9DQVJHT19IT01FLiBJdCBtYWtlcwp0aGUgcmVzdWx0IHF1aXRlIGEgbWVzcyB0aGF0IGlzbid0
IHJlcHJvZHVjaWJsZSBiZXR3ZWVuIG1hY2hpbmVzLCBhbmQKa2VlcHMgb24gZ3Jvd2luZy4KCj4g
Mi0gRm9yIHRoZSBjYWxjdWxhdGluZyBoYXNoIG9mIGFsbCBjb2xsZWN0ZWQgZGVwZW5kZW5jeSBz
b3VyY2VzLCB5b3VyIHBvaW50IGlzCj4gY29tcGxldGVseSBjb3JyZWN0LiBCdXQgY2FyZ28gYWxy
ZWFkeSBrZWVwcyBjaGVja3N1bSBvZiBlYWNoIGRlcGVuZGVuY3kgc291cmNlCj4gZmlsZSBpbnNp
ZGUg4oCYLmNhcmdvLWNoZWNrc3VtLmpzb27igJkgZmlsZSBpbnNpZGUgZmV0Y2hlZCBkZXBlbmRl
bmN5LiBXaGVuZXZlciB0aGUKPiBkZXBlbmRlbmN5IGlzIGdvaW5nIHRvIGJlIGNvbXBpbGVkLCB0
aGlzIGNoZWNrc3VtIGlzIHZhbGlkYXRlZCBhZ2FpbiB3aGljaAo+IHByZXZlbnRzIGRlcGVuZGVu
Y3kgc291cmNlIGNoYW5nZS4gSXQgaXMgdHJ1ZSB0aGF0IHNvbWVvbmUgbWF5IGdvIGFuZCBjaGFu
Z2UKPiBzb3VyY2VzIGFuZCB1cGRhdGUgdGhlIGNoZWNrc3VtIGZpbGUgYWxvbmdzaWRlIGl0LCBi
dXQgdGhpcyBhcHByb2FjaCB3b3JrcyB3aXRoCj4gdGhlIHZlbmRvcmVkIGRlcGVuZGVuY2llcyBh
cyB3ZWxsLgoKQXMgSSBzYWlkIGluIG15IHByZXZpb3VzIHJlcGx5LCB0aGlzIHdhcyBhIHdlYWtl
ciBwb2ludC4gQnV0IGhhdmluZwp0aGUgQnVpbGRyb290IGhhc2ggdmFsaWRhdGUgdGhlIGNvbXBs
ZXRlIHNvdXJjZSBjb2RlIHRoYXQgc2VydmVzIGFzCmJ1aWxkIGlucHV0IGlzIEkgYmVsaWV2ZSBh
IHZlcnkgdmFsdWFibGUgYXNwZWN0IG9mIHRoZSBjdXJyZW50CmFwcHJvYWNoLgoKPiBJIGNvbXBs
ZXRlbHkgYWdyZWUgd2l0aCB5b3VyIHBvaW50cyBvbiB0aGUgZWZmZWN0cyBvZiBteSBhcHByb2Fj
aCwgYnV0IEnigJltIG5vdAo+IHRvbyBzdXJlIGFib3V0IGhvdyBjb25jZXJuaW5nIHRoZXkgYXJl
LgoKVGhlIGZpcnN0IHBvaW50IGlzIG5vdCAiY29uY2VybmluZyIsIGl0IGp1c3QgbWFrZXMgeW91
ciBwcm9wb3NlZAphcHByb2FjaCB1bmZvcnR1bmF0ZWx5IG5vdCBhY2NlcHRhYmxlIGF0IGFsbCwg
SSdtIGFmcmFpZCA6LwoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQg
Q0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRy
YWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
