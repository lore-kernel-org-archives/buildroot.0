Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78B9CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 16:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 675E04068B;
	Sun, 18 Oct 2026 16:30:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t7_L5puy4GaR; Sun, 18 Oct 2026 16:30:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 882794066D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792341040;
	b=P8ZHs+Yq1RLbiT/cvVw35/TarQe//j1jYBjuJJlwbCKd2xnQWkho2ic/uf2Zr854Wj5V
	 epVmGtHiHsl+zw9gsKpqGtWupC5N5IY6hvKerZaTTQkN+WTmKNcfynRxt4Dgt80SXRIXC
	 0cvnXu+giX8BCLYmzocFx9+NuhARmjb248M6ddkpVbCdeIT5gqEoOMjRsDgUsHP2pjU17
	 k+jQH/zGnb0YDEWqhks/2KSI64YYXMfgMVxjLZcJ7mO87g7SWgqsqQRpWI9kOENtruEWH
	 r9SuqLP4nz1Jn7X7WPj8jOMEO0L1vpZpwLTAvlzuCnddFag5fWnyvePW2FMGbkrproQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792341040;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Cc:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=yNM6huYa65EJ7sZHKMVyKcpBER1vegRu5sWMdd10ZHc=;
	b=Z3Sx82ATlQ9rSLXgN8Aw/57jr5keEUQnI+pa5KzHI0TnfJQIVA+Ob7qDr0Z4AqhqRUQc
	 mw8QF/r3TLzpFum8sUCUAHQErzL0h68FAtwZ5uPaRbIYKysi5aKTZOU4RO3j8UP29oJrn
	 PGnedMPDXOwcX1C7ALxoy9fo1GGUJpnN2m9nnJ/FIixBRAgaYnTNFv67RAQvWlTtbnBnX
	 zE4jrAch0M0FenIqXm+aBs9lLqDXj3OlKgRNjz1C2Ea30vtSTVzZyVz4/5VVToU1OiwIl
	 B35kTZDFSP3u9/BcRdJCLh8BAal0H+xLCaMwQwSD6W+JzRSSZUyTkR3xJo3YJfgXtyQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792341040;
	bh=yNM6huYa65EJ7sZHKMVyKcpBER1vegRu5sWMdd10ZHc=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Qqz2Xy1Z1CqsUn0fcYzNAen6HY9XQNCvUVtaITOVJ5E1PPQ37qQx6Cb+nX5QttDwI
	 ovptAM/CIwviYDh+uYbJ+ES8C4FeInrEEYRvySNfh+lhodCm7keB+qYl7MvFOUImz+
	 p3koocE8j4Asm2swVPl53aAmBoMi8myGQzD7mhUtVfrkO879e0Q1Xzgj5WbcU49p0T
	 d7AC19tOkgv/900DYGqnO1IOwEnCIKBgdaFpx7HY7iMlxcDsenXShIVvo5gwwyIEe7
	 iSq7XTL9Wly/UmcfoR8+WJF1/TIPZ0R7j+n3DYlAxaRp9jIGBulOSuOIMDIYdj3x6U
	 sUKgcWx1QdvPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 882794066D;
	Sun, 18 Oct 2026 16:30:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A941761
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 16:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FAE060617
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 16:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFIezo7hHW-Y for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 16:30:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0709F60614
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792341037;
 b=AWy3Y+hKPUmeWPQ1Gi3pe+i1FiRbaWW2aqWyzqDct4ifZiVUVhC7w/rRROP1fGHuciMI
 3QXW/06ef+BdfO5v6pXik/3A1CasO6R41hGQ25mcQgT3/VeABOQXX1aNkC8TP2qafiRIu
 kBib4UfZNMMNcD2RhHMqSLsuBH0XuezNV0WbF87rxl1hko+u/lCFuTIz9wa8QZr3Gy1tW
 RUiLi7GMDKS8FvDw2FT7tmcGaIalkNlLe4jVxSdMZZy9OjEHATztBSh753veqVf30cAvP
 t28+Qz7JdjFpMdu64/g0+WVp4WOGgbTO6qczmLeIyzB+FwMu+PHmW+ySp+QxgVe78bA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792341037;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=KO9fc+MW+QhSdOVJNEl3+Yf6+17Ke1GfZHJRLpiLuW8=;
 b=N1sL9FopJxUmhjQctffWxyyNDKV7LI0tpuo1kDDfeK+lO1o0wT5GM4t6nPX4iZgcJ9/g
 UYLuzScxDGhFZ4aE6vAKDEFs4UdjNPfi73+31JrnqK6YT3xtLsaXYg0+ZYG0gF7NPzoiR
 nUj1Dto503E+czOpIYtQjtjeGC6BNwGgGFGU/VpWWC+qcDe3RDbbMnjgYLGU8XUim76E7
 KbF3vUrqUs0UMsEjevLo59liLODfEZ7bRY23Kq28+U3hMo7IBnLuyY28P0EZVsOeEaqoD
 QKv9bRr5nNawdckBG4NnnGiTd3D8ManMmLsognRaQJcn2GA4b+iuBMidQ1dnAc4y91g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Ke1sN4TJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::529"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0709F60614
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 16:30:34 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6af9a9451daso1938970a12.0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 09:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792341033; x=1792945833;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KO9fc+MW+QhSdOVJNEl3+Yf6+17Ke1GfZHJRLpiLuW8=;
 b=B9HZwtGgs3gx6YhSPToCYWE+LmBmS8CLL/m/b/Aq6wX9S7KGw4jll2PlB9f44fOKd2
 dKXL0KEW2SLX6HsbCmcseL2IA8uImyqD9CshIUYZ9PX1xBKlIcb2sdmwX6ITRHcdOcJx
 T0bzy9obX6W7G/QOuR0wyV3VVGKqZVR3vLrLqViqjEkSS7lR7MGo2YlNP0eVXLuX7VRu
 4XCeV5pUgzIlvJfBz8T5hKV0UXWo5uynk536OM88YFvW29OneUGZ6Phiex2pc3uD56Pw
 sk4P3/Lt2rop55xgbuM2T+IHIF07f2yxJ+NaMi8m8cxH7DCcJGmJqedayFtpZGYTqOoF
 9CEQ==
X-Gm-Message-State: AFq9FYLszu5YazSHFwehF0VmR7Nlmfnw+JkusgwchO+w1TALKyvgV/K9
 3k1kEw/hPUH3XyEdKZccL+tdPlneimWzGRlN3SCbG3QlXhIQfVAiLMD9qa69rkIU6z0=
X-Gm-Gg: AYBFou3RJMrv2GKgJHF+YJ8S0MZ3E0hF2hX56G7vCPX0BCoX4jgmm06WtjLOA99JGSW
 PSkW356Ap2BejhISQTHyO6+75iVgaWDnStPnQdmh0DRyi4z4r13PFJNXv13aIKuC5PhAswp3iz3
 MRKtnfxTj0qwW1tJ4RvJha2pigtK1GAShAFx1BdLAdgjF9q5oGUtlZpmEEv/3ML9wsvtL8BFLJg
 G1XFAw5qXDjoqWlxL4QpEWpPxKi1vM1OtKkddESNc/hrwRsn9jZP1hFDATDCFxIheC7CM1+RjuC
 GC9igFrYMfT6lcQomoezRNmEM6Lzr/WMrRvZTFG2JzxdK1KuOSDNgfqPGOaCfN6ZRl1XPls5VDI
 1dDBfijt/y2ObnheIQ4UbUyhn5QoOg10e7H9gHRkXBShHxrPNzD2rvX7cvMxEVhYeD/HBqm2goJ
 p8vs+rULyWrYo5O9DHBVW7XggW6o3P7363HyoqH/TYjxVqjJ4d3vcv0zsuR4rlt9om1QR4Vz+jV
 kiC6dVmVyEVAhREDK7eiYzmXETiV3Qi4RqZg45oqwCmxbePAG0WhKLxb1rWWR/P8Pfl
X-Received: by 2002:a05:6402:2114:b0:6ae:a675:62dd with SMTP id
 4fb4d7f45d1cf-6b3a81d690dmr3269951a12.42.1792341032862; 
 Sun, 18 Oct 2026 09:30:32 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b38a1b285esm2844025a12.8.2026.10.18.09.30.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Oct 2026 09:30:32 -0700 (PDT)
Message-ID: <5a67d18f-24f5-4426-9a55-82bdef6f13f3@mind.be>
Date: Sun, 18 Oct 2026 18:30:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
 <20261011191210.GA129909@pevik>
 <734360bc-1e66-4584-b04f-f5405af3be1b@mind.be>
 <20261016212923.GA331129@pevik>
Content-Language: en-US
In-Reply-To: <20261016212923.GA331129@pevik>
Subject: Re: [Buildroot] [PATCH 0/7] Update kconfig inrastructure to Linux
 7.2.9
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
Cc: ps.report@gmx.net, yann.morin@orange.com, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ciwKCkZpcnN0IG9mIGFsbCwgdGhhbmsgeW91IGZvciBoYXZpbmcgbG9va2VkIGlu
dG8gdGhpcyBzZXJpZXMgIQoKT24gMTYvMTAvMjYgMjM6MjksIFBldHIgVm9yZWwgd3JvdGU6Cj4g
VGhhbmsgeW91ISBGWUkgTm93IHJlYmFzaW5nIHRvIGN1cnJlbnQgbWFzdGVyIHJlcXVpcmVzIHJl
c29sdmUgYW5vdGhlciBjb25mbGljdCBkdWUKPiA1MTc3Y2Y5YzJmICgicGFja2FnZS9vcGVuc3Ns
OiBtb3ZlIGxpYm9wZW5zc2wvbGlicmVzc2wgb3B0aW9ucyBvdXQgb2YgdGhlIGNob2ljZSIpCj4g
KE5vdCBkaWZmaWN1bHQgdG8gc29sdmUsIGJ1dCBpZiB5b3UgcmViYXNlIHlvdSBtYWtlIGl0IGVh
c2llciBmb3IgcmV2aWV3ZXJzLikKSSByZWJhc2VkIG9uIHRvcCBvZiBsYXRlc3QgbWFzdGVyLCBy
ZXNvbHZpbmcgdGhlIGNvbmZsaWN0LCBhbmQgcHVzaGVkIHRvIApodHRwczovL2dpdGxhYi5jb20v
ZXNzZW5zaXVtLW1pbmQvYnVpbGRyb290Ly0vY29tbWl0cy9idW1wLWtjb25maWcKCj4KPiBTbGln
aHRseSBwcm9ibGVtYXRpYyBpcyB0aGF0IG91dHB1dC8gZm9ybWF0IGNoYW5nZWQuIFRoZXJlZm9y
ZQo+IHdpdGhvdXQgJ3JtIC1yZiBvdXRwdXQnIG1ha2UgY29uZmlnIGZhaWxzOgo+Cj4gJCBtYWtl
IGRlZmNvbmZpZwo+IENvbmZpZy5pbjoyMzogY2FuJ3Qgb3BlbiBmaWxlICIoQkFTRV9ESVIpLy5i
cjItZXh0ZXJuYWwuaW4ucGF0aHMiCj4gbWFrZVsxXTogKioqIFtNYWtlZmlsZToxMDUwOiBkZWZj
b25maWddIEVycm9yIDEKPiBtYWtlOiAqKiogW01ha2VmaWxlOjgzOiBfYWxsXSBFcnJvciAyCj4K
PiBPYnZpb3VzbHkgdGhpcyBwYXJ0IGluIENvbmZpZy5pbiBpcyB3cm9uZzoKPgo+ICMgYnIyLWV4
dGVybmFsIHBhdGhzIGRlZmluaXRpb25zCj4gc291cmNlICIkKEJBU0VfRElSKS8uYnIyLWV4dGVy
bmFsLmluLnBhdGhzIgo+Cj4gYmlzZWN0aW5nIHNob3dzIHRoZSBmaXJzdCBiYWQgY29tbWl0Cj4g
MTIxZDNlNjgwMCAoIiovQ29uZmlnLmluOiB1c2UgdGhlIG5ldyAkKFZBUikgc3ludGF4IikKPgo+
IFdpdGggcmVtb3Zpbmcgb3V0cHV0IGRpcmVjdG9yeSBmaXJzdCBldmVyeXRoaW5nIHdvcmtzLgpB
Y3R1YWxseSwgb25seSBvdXRwdXQvYnVpbGQvYnVpbGRyb290LWNvbmZpZyBuZWVkcyB0byBiZSBy
ZW1vdmVkOgoKIMKgIMKgICQgbWFrZSBkZWZjb25maWcKIMKgIMKgIENvbmZpZy5pbjoyMzogY2Fu
J3Qgb3BlbiBmaWxlICIoQkFTRV9ESVIpLy5icjItZXh0ZXJuYWwuaW4ucGF0aHMiCiDCoCDCoCBt
YWtlOiAqKiogW01ha2VmaWxlOjEwNTA6IGRlZmNvbmZpZ10gRXJyb3IgMQoKIMKgIMKgICQgcm0g
LXIgb3V0cHV0L2J1aWxkL2J1aWxkcm9vdC1jb25maWcKIMKgIMKgICQgbWFrZSBkZWZjb25maWcK
IMKgIMKgIFsuLi5dCiDCoCDCoCAjCiDCoCDCoCAjIGNvbmZpZ3VyYXRpb24gd3JpdHRlbiB0byAv
aG9tZS90aXRvdS9Db2RlL2J1aWxkcm9vdC8uY29uZmlnCiDCoCDCoCAjCgpTbyB0aGVyZSBpcyBw
cm9iYWJseSBzb21lIGluY29ycmVjdCBidWlsZCBkZXBlbmRlbmN5IChrY29uZmlnIHNvdXJjZSAt
PiAKYmluYXJpZXMpLgpJIHdpbGwgbG9vayBpbnRvIHRoaXMuCgo+ICQgcm0gLXJmIG91dHB1dC8K
PiAkIG1ha2UgZGVmY29uZmlnCj4gLi4uCj4gIwo+ICMgTm8gY2hhbmdlIHRvIC4uLmJ1aWxkcm9v
dC8uY29uZmlnCj4gIwoKVGhlcmUgKmFyZSogc29tZSBjaGFuZ2VzIHRob3VnaCAhClRoaXMgaXMg
YmVjYXVzZSBvZiB1cHN0cmVhbSBjb21taXQgYWZmMTFjZDk4MyBbMV0uIEJlZm9yZSB0aGlzIHNl
cmllcyBpbiAKQnVpbGRyb290IHRoZXJlIHdhcyBvbmx5IHRoZSB0aXRsZSBvZiBhIG1lbnUgaW4g
LmNvbmZpZywgbm93IHRoZXJlIGlzIGFuIAplbmQgbWFya2VyIGFzIHdlbGwuClNlZSB0aGlzIGV4
YW1wbGU6CgogwqAgwqAgwqAjCiDCoCDCoCDCoCMgRGF0YWJhc2UKIMKgIMKgIEBAIC0xODI5LDYg
KzE4NTUsNyBAQAogwqAgwqAgwqAjIHNxbGl0ZWNwcCBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKyss
IHRocmVhZHMsIGdjYyA+PSA0LjkKIMKgIMKgIMKgIwogwqAgwqAgwqAjIEJSMl9QQUNLQUdFX1VO
SVhPREJDIGlzIG5vdCBzZXQKIMKgIMKgICsjIGVuZCBvZiBEYXRhYmFzZQoKSSBjaGVja2VkIHRo
YXQgdGhpcyBpcyB0aGUgb25seSBjaGFuZ2UgaW4gLmNvbmZpZyBvdXRwdXQ6CgogwqAgwqAgZGlm
ZiAtdSAuY29uZmlnLm9sZCAuY29uZmlnIHwgZ3JlcCAtRSAnXlsrLV0nIHwgZ3JlcCAtdiAnIyBl
bmQgb2YnCiDCoCDCoCAtLS0gLmNvbmZpZy5vbGQgMjAyNi0xMC0xOCAxNzoyMTo1NC40OTUwMDc0
OTUgKzAyMDAKIMKgIMKgICsrKyAuY29uZmlnIDIwMjYtMTAtMTggMTc6NDQ6MTMuOTcwMDI3NTk0
ICswMjAwCiDCoCDCoCAtIyBCdWlsZHJvb3QgMjAyNi4wOC0xMDQyLWcyNzlmNGI2MjM3IENvbmZp
Z3VyYXRpb24KIMKgIMKgICsjIEJ1aWxkcm9vdCAyMDI2LjA4LTEwNDgtZzU1ZmZiNjllMTIgQ29u
ZmlndXJhdGlvbgoKQmVzdCByZWdhcmRzLApUaXRvdWFuCgpbMV0gYWZmMTFjZDk4MyAoImtjb25m
aWc6IFRlcm1pbmF0ZSBtZW51IGJsb2NrcyB3aXRoIGEgY29tbWVudCBpbiB0aGUgCmdlbmVyYXRl
ZCBjb25maWciKQpodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dp
dC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0L3NjcmlwdHMva2NvbmZpZz9pZD1hZmYxMWNkOTgz
ZWMwODUwNjUxZWU5YjFjMmE4OGIzMzM1OGNiMmYyIAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
