Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAADDC79FB7
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 14:11:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 851CE60648;
	Wed,  9 Sep 2026 14:11:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0VJpjVU-mX7U; Wed,  9 Sep 2026 14:11:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8FF3F60756
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788963068;
	b=D6Q2ifFggvBfMuPx377vtkCTA75ICrvzHgS8YfgRh6lboPUqH38K9YZSlBi4eUx+GqOh
	 od6hFWF+JGXEKDCM/8tMLP+2TJBivEV5JL6WEDrlxKvScxB5putCpMHWGgnZDr/d7DK1t
	 kTYKkiFj+c8+002I1D9GOVx0h60IHC/5g2RHifcBO7ahnFUIuDhnWdpSGtNc3jrd06pyI
	 gttkzWpXErC2ACS+MfEzSsCUKwKR5VOyRkm+7v1bejJa/C9HoGOfw3/S1ZfyHu1QIMN/0
	 lByI8bWe72CoFZMDbPYMBjKwCobKUDEIEe2RX3oAL2VyVZJ4pVge6I3ZzfvfZfJigBA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788963068;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AYmHPiz29mhEiMveeEqsSV0aBGVFs/jHzWRMOSKw51c=;
	b=X1wKwRuobPP90K97cwgpaAnfzK7a7q32POZnTNLruXCaXc9xQqx3dyq9EwLzdoz8EBH2
	 1E1mLCATripd9Ui7yGV7xOq0PXqebwMfXNydyJiEKw2oqRU41bs1krUEHgxx927/i0w/N
	 Prg0/DNM2cphU3/OqzO+iPhFY9w7njtukdI3Tky/DiDd0DB0541G0WuQD4TsqimANHgfb
	 y2jJXZeSiEaTeE7avz3M+ipB6VCoxb8KC74AkEYre00vakn7moiMBfYiAvi98bC6opjLV
	 9jGN9fJYBvWtlRwZ8pX468/mbnTtz6KznlEIWw4/uRLid+P7i624VPwbW39vwxa618A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788963068;
	bh=AYmHPiz29mhEiMveeEqsSV0aBGVFs/jHzWRMOSKw51c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jn/ski9Xoct62oyUCGUh+M6czwxYPSHP1qHivoxVPCGOeUjasjm9dThUr0Fr2l5d6
	 FQWCh8vhow1Ru1ybyCrFEY5sdtLhBzuGA21YjkY/aAjtQ2/XrGc5lx7ASAPImxzmJp
	 5P+VvCoCDzfFOSS8YeCymDAlJrKiL1pXGULkpsMunu4/HZgdtAzlxolR13YcTiU8TH
	 b+VKsB6S+PPynBdqV0NTR+VOdsN4JyBdq7K78zu1MGpB6hGg4kE5PVc+oZlE4bDU/F
	 3K02Gi0UA7rOhzZZsT8X+8RAcEwMHbCKD6VddU2TB3p2dOs1zL6Z4kfQEXdyEaJ3sv
	 w2NP4UY/seGzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FF3F60756;
	Wed,  9 Sep 2026 14:11:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 957C7755
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BCAD80DA7
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qrrYz7JPTMjF for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 14:11:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5572A80D8F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788963066;
 b=SFefKrHpfW/xKWwzmtgFrpYXCxiaL+H6bxqGoO19qr18CvJCJKz9BEKhT3ddij2ammmo
 4pxKLV59YAMJw/VVvxr5aSWqiHwvJ3HcGxBkOV1YZCJ0ukF2iIoLtyzLe7xl+Sx63TAH8
 9jnvTWsfTmZlklJtovqaK84uCJt283O6KzzT+u5vg94hEi2/KKCpJnbWArmaYI57LTch0
 EpDfyUfZ0D6zjTxHqgup9/h3pnhZw5goanmNDnwlwgQlShVeYH1Gqf9fZ1PuvqEdke72q
 23KPWjlnvFaqeh/USVAjKGyXKg8hJbevvSmtHYx4LsxFG40lf6NNb3QL796oMPxycSg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788963066;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
 bh=51Xz5O+mCX3hMD0iaIcqSerRKygxeFP4aCdvx3Iq7LI=;
 b=SnrwfaIuyeRFey19gtIfSbh+ugotk5vKlLVjgZngXgh7r+so2Qm+f2/KscD8EuCRz6OR
 R86Gq7MMSPPfBHEB0BJGEG51BbjtMTzlvqfxRtCYqCWVUNCBhAW3v7FfmU5ezF+rFzWFn
 fRQQX8/OTANQjVrgI/VR1eVdbR/486EAiUTj+f+z7KF0R14wGP+PxxWUGU+0a/uCb71h/
 VuL5Q2AFnWm+3qJJlQxKWf5h2AFSUwu+dNxj5F99YhgxWyu3WRDJ/FoOL6MKy0OFPUZUW
 CuNAH0b/MneMLr/Op0nMB3O+CnvbI6hmvJXFegsy7FU5Ydf+W56Wwk1X5w09JvLSzSw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=smile.fr; 
 dkim=pass header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=jfbLvZ0A; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5572A80D8F
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 14:11:03 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b91369ef6so2110635e9.1
 for <buildroot@buildroot.org>; Wed, 09 Sep 2026 07:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788963062; x=1789567862;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=51Xz5O+mCX3hMD0iaIcqSerRKygxeFP4aCdvx3Iq7LI=;
 b=Qc0Gm6CbWGcBicDg7jkbuGKVBIqogT4/hY7UKEUehO+DhztidexgO3Bz/uKZPkr1oo
 TDNc1Zrw/EXuEwZKJHKiMs14LTcFB3SnXnVd64kJOaEUQLOOMAfe7Td5BljlfB7dp5O9
 samzyWJ6ftHeAzc/l1ReQPXQUPq0QDfStyJ6x157cuJJHZU0KA7R0v0gbdR9rjTcILKe
 kJ2DwJAU3x9me/GWjOv/6zzd0oTYjf/FMjmDWhQIPA2Daz7nwBsSSImhNpwpNyDSoVH+
 yIC+Avyq4R+dFUYde4H8WnV6fHtM0q6Fo16Wc3m2aIcRc09ycjj5uCa3KLaPR2x2D4A7
 xI8g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxb40FLZgszhVRQp5I42L49QwXfRFBaRjUwFVzg/ggBwnlt0QnpvqPAT7CayKAuMQY2BcyXSM3VuG8=@buildroot.org
X-Gm-Message-State: AFuF++ms4QykbHEjuws5fOOjG5YPc7gm2JGRXdg8mwa/msrcpmAUoONi
 /YyI9QTRkxPx+WyylXykS4G1KWQFNvYiZAiLYi1w6bN9w86zMXu+bSUkSLKaE2yvWtg=
X-Gm-Gg: AYBFou0RUtNzD0YHIQJh45/nfGngav3KJO1+L7o2Y6R+REfuQntIgprTCFbLuUagv6q
 0iTQlGNl+Jtk4+BHhQ99/dFfbYrXrQ5U4PmdWDfoRm51VCXo+9rP5HFX05HKVeGSJYauEeEefnL
 xcGhJLbKGxSPlHtj3qf5o3XQ+xOSm9Tmc3nHDndhVWyeRREgKQWZozwl4/0m8zxJpMZyHwseuHY
 /RiUn+1RcJwb7Db+MUH6bgVCw3+1+T44vlSPUz1MeGBvJz98o856X/BdeiE/hQQRGDTM7OxuOUX
 NTjTtwexSpAhvHRwqcY1X/2j5u40OTuv1QSdc+VAgLiaXLCOoGY94cwNKQx38tXQXyIJqR360y9
 ofuOXZwbrrDfus0VaiSzaNc1BcUW2VkXUtUFDsicEUXrlQjv0qx8CK10sSaP0UVXBeFCD7TjQ/0
 K+rFIfv/DGiWGGbis+CmL2JN4Nht1vWocCFiNB2wgc+q7D9q9Nz8m8vOBrIlZh1dJu94/3fGRtn
 3i6n0TQKIHmMiao99wSqHTHgfkFZjnPN2bVXsMX6X+7EU0colBBvK2mQY2PDKg=
X-Received: by 2002:a05:600c:8a09:10b0:49c:d52e:d0ea with SMTP id
 5b1f17b1804b1-49d258da8f3mr24747615e9.4.1788963061764; 
 Wed, 09 Sep 2026 07:11:01 -0700 (PDT)
Received: from [10.5.90.78]
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf770fcf5sm467906945e9.6.2026.09.09.07.11.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Sep 2026 07:11:01 -0700 (PDT)
Message-ID: <52fd10b4-c30a-4ea0-9cab-056624a446d5@smile.fr>
Date: Wed, 9 Sep 2026 16:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@gmail.com>
References: <20260906233048.692559-1-bernd@kuhls.net>
 <20260906233048.692559-3-bernd@kuhls.net>
Content-Language: fr
In-Reply-To: <20260906233048.692559-3-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 3/6] package/mesa3d: crocus Gallium driver
 needs precomp-compiler
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQmVybmQsIEFsbCwKCkxlIDA3LzA5LzIwMjYgw6AgMDE6MzAsIEJlcm5kIEt1aGxzIGEg
w6ljcml0wqA6Cj4gQnVpbGRyb290IGNvbW1pdCA1OWVkMTEzN2U5YmI4YzAxNTdiZTNkYzkxYTFj
YzQ2MjIxMWRkM2M3IGJ1bXBlZCB0aGUKPiBwYWNrYWdlIHRvIDI2LjAuMCB3aGljaCBhZGRlZCB1
cHN0cmVhbSBjb21taXQKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNh
Ly0vY29tbWl0L2I3MmQzNDdkMWMzYjllODI5OTcxZmJkYWJmOTkzYjY4Nzc2MDgzYzEKPiByZXF1
aXJpbmcgdGhlIHByZWNvbXAtY29tcGlsZXIgZm9yIHRoZSBjcm9jdXMgZHJpdmVyLgo+IAo+IEFk
ZCB0aGUgbmVjZXNzYXJ5IGRlcGVuZGVuY2llcyB0byBmaXggYSBjb25maWd1cmUgZXJyb3I6Cj4g
Cj4gLi4vb3V0cHV0LTEvYnVpbGQvbWVzYTNkLTI2LjEuOC9tZXNvbi5idWlsZDo5NDU6MzogRVJS
T1I6Cj4gIEZlYXR1cmUgbGx2bSBjYW5ub3QgYmUgZGlzYWJsZWQ6IENMQyByZXF1aXJlcyBMTFZN
Cj4gCj4gY2F1c2VkIGJ5Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21lc2EvbWVz
YS8tL2Jsb2IvbWVzYS0yNi4xLjgvbWVzb24uYnVpbGQ/cmVmX3R5cGU9dGFncyNMOTQ1Cj4gCj4g
d2hpY2ggY2hlY2tzIHRoZSB2YWx1ZSBpbiB0aGUgdmFyaWFibGUgd2l0aF9jbGMuCj4gCj4gV2hl
biB0aGUgcHJlY29tcC1jb21waWxlciBpcyBub3QgcHJvdmlkZWQgYnkgaG9zdC1tZXNhM2QgdGhl
IG1lc29uCj4gY29uZmlndXJlIG9wdGlvbiBtZXNhLWNsYyBkb2VzIG5vdCBjb250YWluICdzeXN0
ZW0nIGNhdXNpbmcKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0v
YmxvYi9tZXNhLTI2LjEuOC9tZXNvbi5idWlsZD9yZWZfdHlwZT10YWdzI0w5MzkKPiB0aGUgdmFy
aWFibGUgd2l0aF9jbGMgdG8gYmUgZmlsbGVkLCBhbW9uZyBvdGhlcnMsIHdpdGggdGhlIGNvbnRl
bnQgb2Ygd2l0aF9kcml2ZXJfdXNpbmdfY2w6Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL21lc2EvbWVzYS8tL2Jsb2IvbWVzYS0yNi4xLjgvbWVzb24uYnVpbGQ/cmVmX3R5cGU9dGFn
cyNMOTM5Cj4gCj4gd2hpY2ggY29udGFpbnMgJ3RydWUnIHdoZW4gdGhlIGNyb2N1cyBkcml2ZXIg
aXMgZW5hYmxlZDoKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbWVzYS9tZXNhLy0v
YmxvYi9tZXNhLTI2LjEuOC9tZXNvbi5idWlsZD9yZWZfdHlwZT10YWdzI0w5MjUKPiAKPiBTbyB3
ZSBuZWVkIHRvIHByb3ZpZGUgdGhlIHByZWNvbXAtY29tcGlsZXIgYWxzbyBmb3IgdGhlIGNyb2N1
cyBkcml2ZXIuCgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUu
ZnI+CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKPiAKPiBGaXhlczoKPiBodHRwczovL2F1dG9idWls
ZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvYmFhNzE4ZTE0MDI2NGE5YWE2NGMzYThmNDExNGNhMWIw
NWY3NDBlMy8KPiAKPiBTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0
Pgo+IC0tLQo+ICBwYWNrYWdlL21lc2EzZC9Db25maWcuaW4gfCA4ICsrKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tZXNh
M2QvQ29uZmlnLmluIGIvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCj4gaW5kZXggZmVlZDZiNjhm
ZS4uZTE4ZDI1ZWI4ZSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KPiAr
KysgYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KPiBAQCAtMTEwLDEwICsxMTAsMTggQEAgY29t
bWVudCAiR2FsbGl1bSBkcml2ZXJzIgo+ICBjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0dBTExJ
VU1fRFJJVkVSX0NST0NVUwo+ICAJYm9vbCAiR2FsbGl1bSBjcm9jdXMgZHJpdmVyIgo+ICAJZGVw
ZW5kcyBvbiBCUjJfaTM4NiB8fCBCUjJfeDg2XzY0Cj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X0xMVk1fQVJDSF9TVVBQT1JUUyAjIGhvc3QtbGx2bQo+ICsJZGVwZW5kcyBvbiBCUjJfSE9TVF9H
Q0NfQVRfTEVBU1RfNyAjIGhvc3QtbGx2bQo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9H
QUxMSVVNX0RSSVZFUgo+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9ORUVEU19QUkVDT01Q
X0NPTVBJTEVSCj4gKwlzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX1JVU1RJQ0xfU1VQUE9SVEVE
X0RSSVZFUgo+ICAJaGVscAo+ICAJICBNZXNhIGRyaXZlciBmb3IgZ2VuNC03IEludGVsIEdQVXMu
Cj4gIAo+ICtjb21tZW50ICJjcm9jdXMgZHJpdmVyIG5lZWRzIGhvc3QgZ2NjID49IDciCj4gKwlk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xMVk1fQVJDSF9TVVBQT1JUUwo+ICsJZGVwZW5kcyBvbiAh
QlIyX0hPU1RfR0NDX0FUX0xFQVNUXzcKPiArCj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0Rf
R0FMTElVTV9EUklWRVJfRVROQVZJVgo+ICAJYm9vbCAiR2FsbGl1bSBFdG5hdml2IGRyaXZlciIK
PiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ180IHx8ICFCUjJfUEFDS0FHRV9Y
T1JHNyAjIGxpYnhzaG1mZW5jZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
