Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6E9CF6BE4
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 02:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B603408F7;
	Wed,  7 Jan 2026 02:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwPn5VpKjSER; Wed,  7 Jan 2026 02:06:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92D9C408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767751614;
	bh=J+7Qi2LY8cFdy6AppMvsKnEuSyDdaA3YQ7bKayN/kW8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nGbTViHl1iHmsqmnTQoQhhwL7WaHjbeCkQhLkToJBVVhrIE2zoihylS0Q8Vl4BcfO
	 0jXqg334876y1R/T6KDsnr3gDXgk/ozMNJqRTjJmyRfCObUCpcvHjxoQhNImQ/329l
	 EBdD9Uf0pFlmDYLLE8TBzfNX16lwyWiwZf/GmX8+089v2b6Xkj+04nm/0glK/vXyhZ
	 WPpCZJA/pa4JV6XGQHhTwWOJBqkb98t5CaBLWhL4+1x8PucGjZiBSyzCWAxLjNw/in
	 7NzSgrot6GKqyTuXHKsTRMlnzLU2wSSwQwDtyr9/dhicKL1gpJmkHS9TMH8YUVmjTU
	 rO61MIPxt4Pxg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92D9C408FF;
	Wed,  7 Jan 2026 02:06:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 134C8249
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 02:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10667812D4
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 02:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTopBUOMu_Ik for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 02:06:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1758D8122B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1758D8122B
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1758D8122B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 02:06:51 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-59b7073f61dso182435e87.2
 for <buildroot@buildroot.org>; Tue, 06 Jan 2026 18:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767751610; x=1768356410;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WmwIDdvGda9JlLo7EeCOTSDsIF+McuxXDmvlj98+u8I=;
 b=RS3GjCqy3O8OCfPp0aJNGgC0wKeoWO6VEJ5PMPjWL52UyNCcUs4vlSfqSpZm6rSsIJ
 od0Yu+1IidNTEMC0AKFfWSY0o0Hv8/nxzn8Q3Mk2sW6bIOMcCIQxcV53XuR74DuP2Gd9
 X0mvkjpPY1soyc5S6AlBLW55HtNZk/4bpLGwZCNDwxsbAi7kbtwlBBTsRVlHoKuUbjGh
 QuQ7DgNzo6oyze5aVZXYg+uJFWPFbXXhTe2JtWhnV4bg65oSr/XrqsmEpUTpIKVGucVh
 Y5PgMN7hRD+2S/YUwQ8llOdabsRQsseSVlglNwmdM1mfyDo6KJjjLXqI3tsVqAGvFrn/
 lHcg==
X-Gm-Message-State: AOJu0Yzf9KgdzsWLEnKSx/ri0fUa8O5zRCwqqK91Hf8FSF/rVqHxxtr1
 hZN+eo6wQNCGtgEJ9AlDTKASn2x5QXsTBB5VqhjLjfTyN3BllUY5cNQNvQo8yQ6Q68PvXsGjgF+
 38k/PIySqF9NENwkiSxSIjDk9eK3gkP4=
X-Gm-Gg: AY/fxX4khKGRersImR4diMDoXwDWxvIwf9MsX2YxuzgByG7OoEXFROvn0iWS/B4Ah2O
 /KtXMhQPUCACfNMTAieRPnRXEiZS/XloS+0/fQvt2M9vW4maC73SD8jpEIHF4yrSsl5NfYBmX1Q
 oV1T4xIToutbLdY7YI6QuCe4Igi6ftO1hudSlXfeNQF3Birm0M1MPB7C4sOApDbS+hvhC7csq4n
 YgaHi1wnpEgRTDVpH+yZ83GV5a4dlvspqVLShgrpfot22nxHGNlqNGN4y8M4y1fjyYwfLoI9Y4F
 x4TJp834BJXs4DXKHc3D2YDjpB8=
X-Google-Smtp-Source: AGHT+IE3isxHHrKAsTqvZafyqkoeRUaCr0GBuQIHGOPMtaQLrUcOC4rs49pXEnPCQo7dJJRWs8BhJnL1eZIp5X38D5w=
X-Received: by 2002:a05:6512:230b:b0:59a:107a:459a with SMTP id
 2adb3069b0e04-59b6f054464mr216141e87.44.1767751609275; Tue, 06 Jan 2026
 18:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20251227212244.3098285-1-festevam@gmail.com>
 <20260106220704.3283de69@windsurf>
In-Reply-To: <20260106220704.3283de69@windsurf>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 6 Jan 2026 23:06:38 -0300
X-Gm-Features: AQt7F2rk6dNuBgxhCG1UsC1PnEP8puNrkyl6_aTavGal1NF4MwjhN5W1vOU-UoE
Message-ID: <CAOMZO5B=YqjBzNVgoEug-hHT6U8MuSYJHqoKyyP3EuGVP3nMhQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767751610; x=1768356410; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WmwIDdvGda9JlLo7EeCOTSDsIF+McuxXDmvlj98+u8I=;
 b=iX7OeHejvdOHdo2vJHXm6sTpNM6qRWjh4F/9bIpqTM7pXKLEbfhTpzDTcYzmJupEhM
 kyhSWPkLOMWo5GnyZ2jlriMWvdKVZtVEmH9qJVqJbVro59h9RohvWl7fcsWg1HsQLGOM
 urW653YJFmETU/twAB7DV+wQ2kYZDihhQIgWVVgvdp9Dq2zcbzxEjjFWr82KugmEF+FR
 Q14UW/o/2RvGfx/SDdVuTMRue9QvYljvALU35/I1PpCmO0le+msgxZnWBUo80Xk+ed4K
 sQXvxBH4lgRAowv10euSjwMFrGPPotjwA3bVHIKJBIgCATd/nYdFlWTw6r7HwuhPBfc1
 Vc6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=iX7OeHej
Subject: Re: [Buildroot] [PATCH] package/crucible: disable cgo to fix 32-bit
 build failures
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

SGkgVGhvbWFzLAoKT24gVHVlLCBKYW4gNiwgMjAyNiBhdCA2OjA34oCvUE0gVGhvbWFzIFBldGF6
em9uaQo8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4gd3JvdGU6Cgo+IEluIGNvbW1pdCBs
b2dzLCB3ZSBsaWtlIHRvIGhhdmUgc29tZSBkZXRhaWxzIG9uIHdoYXQgaW5pdGlhbGx5Cj4gaW50
cm9kdWNlZCB0aGUgcHJvYmxlbSwgc28gdGhhdCB3ZSBjYW4gdW5kZXJzdGFuZCB3aGV0aGVyIHRo
ZSBwYXRjaCBpcwo+IGEgZml4IHRoYXQgc2hvdWxkIGJlIGJhY2twb3J0ZWQgdG8gb3VyIExUUyBy
ZWxlYXNlLiBJZGVhbGx5IGEgcG9pbnRlcgo+IHRvIHRoZSBCdWlsZHJvb3QgY29tbWl0IGludHJv
ZHVjaW5nIHRoZSBwcm9ibGVtLiBJZiBub3QsIGF0IGxlYXN0IHNvbWUKPiBpbmRpY2F0aW9uIHRo
YXQgdGhlIHByb2JsZW0gZXhpc3RzIHNpbmNlIDxzb21lIHRpbWU+ICh0byBiZSBzcGVjaWZpZWQs
Cj4gd2l0aCBhbiBvbGQgYXV0b2J1aWxkZXIgZmFpbHVyZSkuIEluIG91ciBjYXNlLCB3ZSdyZSBt
b3N0bHkgaW50ZXJlc3RlZAo+IGluIHVuZGVyc3RhbmRpbmcgd2hldGhlciB0aGF0IGZpeCBzaG91
bGQgYmUgYmFja3BvcnRlZCB0byBCdWlsZHJvb3QKPiAyMDI1LjAyLnguIFNvIGlmIHRoZSBwcm9i
bGVtIGFscmVhZHkgZXhpc3RlZCBwcmlvciB0byBGZWJydWFyeSAyMDI1LCB3ZQo+IHdpbGwgd2Fu
dCB0byBiYWNrcG9ydCBpdC4KClRoaXMgZmFpbHVyZSBoYXMgYmVlbiBwcmVzZW50IHNpbmNlIHRo
ZSBpbnRyb2R1Y3Rpb24gb2YgdGhlIGNydWNpYmxlCnN1cHBvcnQgaW4gQnVpbGRyb290LgoKSXQg
aXMgT0sgdG8gYmFja3BvcnQgdGhpcyBmaXggdG8gb2xkZXIgcmVsZWFzZXMuCgpUaGFua3MKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
