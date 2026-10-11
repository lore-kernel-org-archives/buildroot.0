Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DB3CA9ECF
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1F1D405B1;
	Sun, 11 Oct 2026 19:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IPdxw-TbWNJ; Sun, 11 Oct 2026 19:37:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EDC0E40599
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791747479;
	b=idVmw7FDnxYiV8EadbqDmj0mvK1PGVIcBK+pOwZvSAoNiHeoO4Ig+t8vwgq7yghox6an
	 UrJStE15e18MNpezHT1BR14DKMP4x2ZnuZDNxO40+0ms+Guf5td1kmnocU1JEzKUWtq/i
	 A35GtMfo5anvmFi+tC+zTrCxKp+PncW/A/b77ssJXhL4bX1LuheIEUrYPbt6H6XE8C8P8
	 gHG7iTuYesuqlTGzzM+hfdHNdzfmcJv2ogLuPAnYnrNTpERUpCNR++Lvx2WaCfSH/XxnK
	 hvmUAvTzi9TGk48/WMEhI2LIz/kmGLLFHDVJ+xtpBZ0fHvRvW6kqc2TcSMIXbzJ4upA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791747479;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=FosCzZJRTyTzYyLHrUKg0VFNcpaJ3ZxpiUS10xCAuJs=;
	b=b8A3EhX3tXA0vTXhufTx5ejqTKi1aWE2nRp/7epwcYBK5okwXQVh+mwQuM+BUYuZGL1w
	 Q3pjYdQ2z6Ops7wZspcFK807xNBxXpa8WJq1QhwCadOuLGj0I+KnAAXBKVNcIzmARuOpI
	 f+gPfo5H6rB2ozpLDiP1DxS/gyuSyGlfDr4Uur5oiJ1hUKyoFkpZ0rMSRcs4eCKmatx3A
	 sp+WjTMut9sJM+NWzl6L8pGKv8PQ93uAwQI+0lBMsE+lZBxPwpIAlzl4DKUMwwd1gb/Yn
	 JtQfejU0ReCjynxmfRuatofKj3dM/xHpOCW331pcPVhHqs+vZ8I9/M0ATlvvPhMGYhA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791747479;
	bh=FosCzZJRTyTzYyLHrUKg0VFNcpaJ3ZxpiUS10xCAuJs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FhnpYOL2VwOtFZlurpO+erdwHxlQqgG5UGxL72ewxU+/jEwDyYiAxgTUUeB5NMu9j
	 55QWOAHpaCiVD8HJpRcUi3SK/hoegyFYlSGyuymmYICVPMui1Fi1lGfuFAIz8HowSx
	 f5Cln27pf6AqO6FtrrFkOzjA2Qa5zxaXL7IWARdPzqwLTZiJMN9fS6oIAe7YEaNU8h
	 bQjT1u5u31H6Fi9JP7kIC7GiEEkagqNfHzzcKNa5Q5ZLPKobyBwrXuUgznU51CefqO
	 4GgKmtKBUuBv0zD9ZJ8MMzkNM6+B7KeosIBMhcYifqsPpw0x++Enb+fo9U19vbNSoH
	 G6xTG6DY3Ef6w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDC0E40599;
	Sun, 11 Oct 2026 19:37:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B6B7111
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71E5380C06
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:37:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZJ-nVxgKNCc for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:37:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 80A6180BDF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791747476;
 b=QVf5z32AZFdBBSNDoyEcoehJQsKQtDFbGoso9MB6n3MoocrsYGWhylHVE2WUNsFordeb
 g26zIQ345d1dCfscpjxlOCBeMF2ag5AFAGCoXpJe7oyy67AT9OGRt67JPW1xtBHLT+vtt
 BCgFItlFj4SYlPRRPa6fl/Ib7QSCcMt1Qy44ajU3jHQf7xKknqx93n6jPtidhokQbSjFl
 +r6dH+VjxnQHHfEptJngv+FpY/5PAe65wiRiqWaTs1hYteK1pmIFG+mbZE6I5u66AAwaw
 61cvuLTpUmvpDbhObM4BXfoXtaDLTvQ5b02prmpRevvkLvb3IgfBVeW0lS1F90+38lw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791747476;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=MxUF9J5Pd7GIPuihGkekohLtRDfJGaGGnKORYlrkrlE=;
 b=hawu6DIAXx+Pnl5rC+CP6z42YWtrAoOwGD4vFGTCTc76t45WTuzb8DQ+tJEv3qJZteRE
 qVieDjCVJRjox1srO0TSzCu0q9bAwcSHzCp2Ge2n1knPr2dALt0XokeSPnMI0oouG1P+9
 asLkJvtVghnjW5vFO81Llq7DimRCDbhw0y15u0h6rwxjhp0GT43Xn6qagXE9hcll8o/Yn
 AyKoukVhwV/mnc1qiHceZ0DLnNTBhmpzylSOpNqouQGpgWHdjPW3WIklbT0I7tKeFLCEt
 wnbJ+7M84Z+2e/WG00jRAMjGAn6s9A1yHAdRtu+15OwiXSUbtxT6+6vu62pC/XTcAXw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Uqa4LKHB; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80A6180BDF
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:37:55 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48b0946c2c2so633529f8f.3
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 12:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791747474; x=1792352274;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=MxUF9J5Pd7GIPuihGkekohLtRDfJGaGGnKORYlrkrlE=;
 b=NO6MFHH3wClted97ZTTIXGNC5Y+yMpK7htw4kMNsVnHRkXO3bGHd285Oq7AQWtHvLu
 2Jyut/cMT5nul4Z5+aY37RkNNbvS03qdMIkygeX6RUtZMypD5twEaJ3tCIWbPzYNgF3A
 +n4SGj7/Gdjb+DQ49P7R5VSow03whKwj2IeExlEGS2DgI5AqvnpjLx55UbrIBrKZ9Jqw
 vl9sYSPYyGBVi9AVeeaI3XHsxhPnaXcTGzRiC+CN2TMytGdGGPYS+QXYXNkUQi9K9RDJ
 dRgi1F6W+Z4SkNq/goUdTHmtAg9nrwm2cd1GZ7qKrSKvY9k4yKRMirRd5ag4udSuwbzB
 sxWg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxGWtK5Oq8EKk9a+nEvZ5AA4zOH3qf3mzYigJkFIUXZQNVznTE9t1i4ME2pVNKN2T8azdt108GcM9M=@buildroot.org
X-Gm-Message-State: AFq9FYL5213/9gkYeCTqREBsseaEaLrgEr8U1n2V0fw6eJKhJOVxsfSF
 uru5BDiB9R36HQWMgpcrlpgAvxo1lgtcjlgKjOpjH4bqlege07r2H2MEHJIad+fbu1U=
X-Gm-Gg: AYBFou23/9WU46U0+0bOSW6T0o0capoQTa4UtE4p4Q3cP+kx9Oh/1z/tl8Z7qVMr59c
 whCXXT73QVWQyxsb7DuqxVO78Mn/exW5L0xWkGIRStpbYto6nn5htjoVP3Nn2ZgtArzs1na/F2u
 7MduOPBhqTo+3ZNyZ88mXV3S2+YUlcwHz6G64WJPF+iJDfRgA068f8Kc9NglO6z/3xE/MmYYNg/
 gNJ5hYxJ2c/0nBAmR6hDtKt/bElGneMHVAteLKLqxRelAlxUAhcgyMEeh9xiE1po4PHIrYoxFbH
 WVySVyUbjUe1o9ZqhY7ZKDk4gKV1zup7KwnqtKcS7EuiE4Q/Oa61SnLqP6hDoWa+zm9CBXXkK96
 z7C7zjRJkxvWa/ikgMfcEN5A5zObhtwzsji377xqAxYjQMmiJrTCxCenWvNOhjzeRJyLYWvdyBc
 zGe1wUdob1yspYkVqciXCUhe8xIcHb57UliET6hQl4grsH+YP1dh9X3dNvT1j3dE4agX3jLPDaT
 Cr6jQhCQ0f+H/uApMCikjC77oLzIdhTtd7O6VpcTtJC4OI=
X-Received: by 2002:a05:6000:26c5:b0:48c:7ab9:99cc with SMTP id
 ffacd0b85a97d-48dbacf9da3mr13352083f8f.52.1791747470924; 
 Sun, 11 Oct 2026 12:37:50 -0700 (PDT)
Received: from [10.20.174.153] (ptr-94-109-186-101.dyn.orange.be.
 [94.109.186.101]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9ac025esm15962619f8f.38.2026.10.11.12.37.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Oct 2026 12:37:50 -0700 (PDT)
Message-ID: <261e90f3-369b-432e-aa95-7760d9d487e5@mind.be>
Date: Sun, 11 Oct 2026 21:37:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@rnout.be>, Baruch Siach <baruch@tkos.co.il>, 
 Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: ju.o@free.fr, thomas.petazzoni@bootlin.com, git@jdknight.me,
 thomas.perale@mind.be
References: <20261010201508.963412-1-titouan.christophe@mind.be>
 <20261010201508.963412-4-titouan.christophe@mind.be>
 <877bjo425e.fsf@tarshish> <e6aa6ef2-a36f-41a0-9183-50e6bf836f68@rnout.be>
Content-Language: en-US
In-Reply-To: <e6aa6ef2-a36f-41a0-9183-50e6bf836f68@rnout.be>
Subject: Re: [Buildroot] [PATCH 3/3] configs: update defconfigs with custom
 versions to BR2_LINUX_KERNEL_LATEST_X_Y
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gMTEvMTAvMjYgMjE6MjksIEFybm91dCBWYW5kZWNhcHBlbGxlIHdyb3Rl
OgotLS0gU05JUCAtLS0KPgo+IMKgTm93IHRoYXQgSSd2ZSB3cml0dGVuIGFsbCBvZiB0aGlzIGRv
d24sIEknbSBub3Qgc28gc3VyZSBpZiB0aGlzIGlzIGEgCj4gZ29vZCBpZGVhIGFmdGVyIGFsbC4g
VGhlIGFyZ3VtZW50cyBpbiBmYXZvdXIgYXJlIGZhaXJseSB0aGluLCAKPiBlc3BlY2lhbGx5IHNp
bmNlIGl0J3MgcmF0aGVyIGVhc3kgZm9yIGEgdXNlciB0byBzd2l0Y2ggdG8gb25lIG9mIHRoZSAK
PiBzdGFibGUga2VybmVscy4KCk9uZSBhcmd1bWVudCB0aGF0IEkgYmVsaWV2ZSBzdHJlbmd0aGVu
IHRoZSBjYXNlIGZvciB0aGlzIHBhdGNoIGlzIHRoYXQgCmhhdmluZyB0aGlzIG1lY2hhbmlzbSBp
biBwbGFjZSBmb3IgTFRTIGJyYW5jaGVzIHdvdWxkIHJlYWxseSBoZWxwIGluIAprZWVwaW5nIGJv
YXJkcyB1cCB0byBkYXRlIHJlZ2FyZGluZyBzZWN1cml0eSBmaXhlcyBpbiB0aGUga2VybmVsLCB3
aGljaCAKYXJlIHByb2hpYml0aXZlbHkgY29tcGxpY2F0ZWQgdG8gYmFja3BvcnQgb3RoZXJ3aXNl
LiBCdXQgb2YgY291cnNlIEknbSAKcmVhbGx5IGJpYXNlZCBoZXJlLgoKPgo+IMKgSSBkbyB0aGlu
ayB3ZSBzaG91bGQgYXQgbGVhc3QgZG8gdGhpcyBmb3IgdGhlIHFlbXUgZmFtaWx5IC0gYnV0IHRo
b3NlIAo+IGRvIGdldCB0ZXN0ZWQgb2YgY291cnNlLgo+Cj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0
CgpUaXRvdWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
