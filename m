Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB5FC27C5F
	for <buildroot@archiver.kernel.org>; Fri,  7 Jun 2024 07:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C3F840594;
	Fri,  7 Jun 2024 07:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gBcBT-HAF2Jk; Fri,  7 Jun 2024 07:23:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB0AB40514
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB0AB40514;
	Fri,  7 Jun 2024 07:23:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C40D41BF4D6
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 07:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD01B40514
 for <buildroot@lists.busybox.net>; Fri,  7 Jun 2024 07:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q70EuQuSfYDK for <buildroot@lists.busybox.net>;
 Fri,  7 Jun 2024 07:23:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07CF04048F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07CF04048F
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07CF04048F
 for <buildroot@buildroot.org>; Fri,  7 Jun 2024 07:23:43 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4214aa43a66so18216365e9.1
 for <buildroot@buildroot.org>; Fri, 07 Jun 2024 00:23:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717745022; x=1718349822;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RBJKCmJu+d/4hIW5SeyjcLGGUCCxCf4fmIN0OYWMl4E=;
 b=VN0Xv1NpHp97/DyK5LSbaKlvwV1/sjJMQge6GHdob3BaxcC9IfqfY/PtQLhI5YqPEU
 sxTu97UhfZq7ItrU3imZFlMYpJ1cqhesP+lKYWagX71oHlwo4pWWNy11gRY71Z1iDsnQ
 ftzf3xk/oD1trqQp7LpM/RM+bLsb+0ThmHWjXnr4NhHasZRLzSP17TxnJpoTc/07Osak
 xCxLgP4NgPlIBHrvZsP0gGXjJ2NKBmpsyLDUumyTwmmvfcpPiAZbGaxe5CBnTOsdR00s
 J0PI56+LA5GiJ7zIIsw198RN2bMigmWT0XAhOKvUOReDya+yFbaKedQ7Aya5M//0EB7U
 LO8g==
X-Gm-Message-State: AOJu0YylHYOkteoHGEEMp/fro9jnRxoewSkBWp8e41gddQL+xHlGVoxR
 rez2n1kxYuhqK/HEvQvrcb/C7C6WDftlV4jfXhxqjLLGz1Fp5+rA/N6rVTFPbxQobsdyEAGJkja
 Z
X-Google-Smtp-Source: AGHT+IHQoOtLKtLo7swzbWFUcrhKH8+frni9T16htsb5gIkSkQVRmajlLPKSPkRcFHztgVsWyiddzQ==
X-Received: by 2002:a05:600c:3ba9:b0:41f:fca0:8c09 with SMTP id
 5b1f17b1804b1-42164a370a8mr11923875e9.40.1717745021485; 
 Fri, 07 Jun 2024 00:23:41 -0700 (PDT)
Received: from [192.168.6.174] (213.211.177.222.static.edpnet.net.
 [213.211.177.222]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c19d52dsm45326065e9.8.2024.06.07.00.23.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 00:23:41 -0700 (PDT)
Message-ID: <766edac4-2cd3-427b-9356-fdb72a6eb0ff@mind.be>
Date: Fri, 7 Jun 2024 09:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
References: <20240606185627.F334387C00@busybox.osuosl.org>
 <CA+R_deruBAg+M356X420td6qnhewMF5N8dPtjohV4OcQ9hGU8w@mail.gmail.com>
Content-Language: en-GB
In-Reply-To: <CA+R_deruBAg+M356X420td6qnhewMF5N8dPtjohV4OcQ9hGU8w@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717745022; x=1718349822; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RBJKCmJu+d/4hIW5SeyjcLGGUCCxCf4fmIN0OYWMl4E=;
 b=bbpy8Wx13KL0LbkAsTn99SY/zZU2BQC/OpT5Wz0YxWfQ7qdzR0QMsT+2W8/LZAQkUF
 7d2e+mgs1FY67v9T5elMELYphUY5noFWdjvb0vWIkqQP//fiTydHArb6pF8gGOedHQua
 WEfWqX8Sd3o2581yYT+nrG+BP0mTa+SY4dpeyJWYtCdpIkaUDXPn+LU2doLXXt9yztQP
 7MAdvDecmIrL9hnfbSxsW0RdiPS/zMH5vRBiUPI4rBo5wxaTV5K8DQYxSgfUnMBQixB0
 U1n7mGpdk3KJZZoxRykVxoETZ4vR7OpJaYT5Z+syh4XmHWeUDUKe9kUnCFSp4B0xOyMS
 Xiag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=bbpy8Wx1
Subject: Re: [Buildroot] [git commit] package/qt6base: avoid enabling both
 desktop and es2 opengl
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wNi8yMDI0IDIyOjA3LCBSb3kgS29sbGVuIFN2ZW5kc2VuIHdyb3RlOgo+IEhpIEFy
bm91dCwKPiAKPiBUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2suIEknbGxsIHRyeSB0byBzaW1wbGlm
eSBteSBjb21taXQgbWVzc2FnZXMuCgogIE5vIG5vIG5vLCB0aGUgY29tbWl0IG1lc3NhZ2Ugd2Fz
IGdyZWF0ISBJdCdzIGp1c3QgdGhlIGRlZmNvbmZpZyB0aGF0IHdhcyBhIGJpdCAKYmlnIChuYWQg
dGhlcmVmb3JlIHRha2VzIGEgbG9uZyB0aW1lIHRvIGJ1aWxkKSAtIHlvdSBjYW4gZ2V0IHRoZSBz
YW1lIGJ1aWxkIAplcnJvciB3aXRob3V0IGtlcm5lbCBvciB1Ym9vdCBvciBnZW5pbWFnZSBvciBh
bnl0aGluZyBsaWtlIHRoYXQuCgogIFJlZ2FyZHMsCiAgQXJub3V0Cgo+IAo+IEJlc3QgcmVnYXJk
cywKPiBSb3kKPiAKPiB0b3IuIDYuIGp1bmkgMjAyNCBrbC4gMjA6NTYgc2tyZXYgQXJub3V0IFZh
bmRlY2FwcGVsbGUgdmlhIGJ1aWxkcm9vdCAKPiA8YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcgPG1h
aWx0bzpidWlsZHJvb3RAYnVpbGRyb290Lm9yZz4+Ogo+IAo+ICAgICBjb21taXQ6Cj4gICAgIGh0
dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9ZTRiODM4MDUwM2E0
YWU3ODU2NDEzM2QxYmU5NGFiNTRjZmUxMDhlNCA8aHR0cHM6Ly9naXQuYnVpbGRyb290Lm5ldC9i
dWlsZHJvb3QvY29tbWl0Lz9pZD1lNGI4MzgwNTAzYTRhZTc4NTY0MTMzZDFiZTk0YWI1NGNmZTEw
OGU0Pgo+ICAgICBicmFuY2g6IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L2Nv
bW1pdC8/aWQ9cmVmcy9oZWFkcy9tYXN0ZXIKPiAgICAgPGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5u
ZXQvYnVpbGRyb290L2NvbW1pdC8/aWQ9cmVmcy9oZWFkcy9tYXN0ZXI+Cj4gCj4gICAgIEZpeGVz
IHRoZSBmb2xsb3dpbmcgZXJyb3I6Cj4gCj4gICAgIEVSUk9SOiBGZWF0dXJlICJvcGVuZ2xlczIi
OiBGb3JjaW5nIHRvICJPTiIgYnJlYWtzIGl0cyBjb25kaXRpb246Cj4gICAgICDCoCDCoCBOT1Qg
V0lOMzIgQU5EIE5PVCBXQVRDSE9TIEFORCBOT1QgUVRfRkVBVFVSRV9vcGVuZ2xfZGVza3RvcCBB
TkQKPiAgICAgR0xFU3YyX0ZPVU5ECj4gICAgIENvbmRpdGlvbiB2YWx1ZXMgZHVtcDoKPiAgICAg
IMKgIMKgIFdJTjMyID0gIiIKPiAgICAgIMKgIMKgIFdBVENIT1MgPSAiMCIKPiAgICAgIMKgIMKg
IFFUX0ZFQVRVUkVfb3BlbmdsX2Rlc2t0b3AgPSAiT04iCj4gICAgICDCoCDCoCBHTEVTdjJfRk9V
TkQgPSAiVFJVRSIKPiAKPiAgICAgQ01ha2UgRXJyb3IgYXQgY21ha2UvUXRCdWlsZEluZm9ybWF0
aW9uLmNtYWtlOjIwOSAobWVzc2FnZSk6Cj4gICAgICDCoCBDaGVjayB0aGUgY29uZmlndXJhdGlv
biBtZXNzYWdlcyBmb3IgYW4gZXJyb3IgdGhhdCBoYXMgb2NjdXJyZWQuCj4gICAgIENhbGwgU3Rh
Y2sgKG1vc3QgcmVjZW50IGNhbGwgZmlyc3QpOgo+ICAgICAgwqAgY21ha2UvUXRCdWlsZEluZm9y
bWF0aW9uLmNtYWtlOjM5IChxdF9jb25maWd1cmVfcHJpbnRfc3VtbWFyeSkKPiAgICAgIMKgIGNt
YWtlL1F0QnVpbGRSZXBvSGVscGVycy5jbWFrZTozMzIgKHF0X3ByaW50X2ZlYXR1cmVfc3VtbWFy
eSkKPiAgICAgIMKgIENNYWtlTGlzdHMudHh0OjIwOCAocXRfYnVpbGRfcmVwb19lbmQpCj4gCj4g
ICAgIFRvIHJlY3JlYXRlIHRoZSBlcnJvciwgdXNlIHRoZSBmb2xsb3dpbmcgZGVmY29uZmlnIChi
YXNlZCBvbgo+ICAgICBmcmVlc2NhbGVfaW14OG1tZXZrX2RlZmNvbmZpZyk6Cj4gCj4gICAgIEJS
Ml9hYXJjaDY0PXkKPiAgICAgQlIyX0FSTV9GUFVfVkZQVjM9eQo+ICAgICBCUjJfUEFDS0FHRV9I
T1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTA9eQo+ICAgICBCUjJfVE9PTENIQUlOX0JVSUxE
Uk9PVF9DWFg9eQo+ICAgICBCUjJfR0xPQkFMX1BBVENIX0RJUj0iYm9hcmQvZnJlZXNjYWxlL2Nv
bW1vbi9wYXRjaGVzIgo+ICAgICBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9SVD0idHR5bXhj
MSIKPiAgICAgQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvZnJlZXNjYWxlL2Nv
bW1vbi9pbXgvaW14OC1ib290bG9hZGVyLXByZXBhcmUuc2ggYm9hcmQvZnJlZXNjYWxlL2NvbW1v
bi9pbXgvcG9zdC1pbWFnZS5zaCIKPiAgICAgQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSIk
e1VCT09UX0RJUn0vYXJjaC9hcm0vZHRzL2lteDhtbS1ldmsuZHRiIgo+ICAgICBCUjJfTElOVVhf
S0VSTkVMPXkKPiAgICAgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTD15Cj4gICAgIEJS
Ml9MSU5VWF9LRVJORUxfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbAo+ICAgICBnaXRo
dWIsbnhwLWlteCxsaW51eC1pbXgsbGYtNS4xMC55LTEuMC4wKS9saW51eC1pbXgtbGYtNS4xMC55
LTEuMC4wLnRhci5neiIKPiAgICAgQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9ImlteF92OCIK
PiAgICAgQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15Cj4gICAgIEJSMl9MSU5VWF9LRVJO
RUxfSU5UUkVFX0RUU19OQU1FPSJmcmVlc2NhbGUvaW14OG1tLWV2awo+ICAgICBmcmVlc2NhbGUv
aW14OG1tLWV2ay1yZXZiLXFjYS13aWZpIgo+ICAgICBCUjJfTElOVVhfS0VSTkVMX05FRURTX0hP
U1RfT1BFTlNTTD15Cj4gICAgIEJSMl9QQUNLQUdFX1FUNj15Cj4gICAgIEJSMl9QQUNLQUdFX1FU
NkJBU0VfR1VJPXkKPiAgICAgQlIyX1BBQ0tBR0VfUVQ2QkFTRV9PUEVOR0w9eQo+ICAgICBCUjJf
UEFDS0FHRV9GUkVFU0NBTEVfSU1YPXkKPiAgICAgQlIyX1BBQ0tBR0VfRlJFRVNDQUxFX0lNWF9Q
TEFURk9STV9JTVg4TU09eQo+ICAgICBCUjJfUEFDS0FHRV9GSVJNV0FSRV9JTVg9eQo+ICAgICBC
UjJfUEFDS0FHRV9JTVhfR1BVX1ZJVj15Cj4gICAgIEJSMl9QQUNLQUdFX0tFUk5FTF9NT0RVTEVf
SU1YX0dQVV9WSVY9eQo+ICAgICBCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKPiAgICAgQlIyX1RB
UkdFVF9ST09URlNfRVhUMl80PXkKPiAgICAgQlIyX1RBUkdFVF9ST09URlNfRVhUMl9TSVpFPSIy
NTZNIgo+ICAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJFPXkKPiAgICAgQlIyX1RB
UkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01fVEFSQkFMTD15Cj4gICAgIEJSMl9UQVJH
RVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2FsbAo+
ICAgICBnaXRodWIsbnhwLWlteCxpbXgtYXRmLGxmLTUuMTAueS0xLjAuMCkvaW14LWF0Zi1sZi01
LjEwLnktMS4wLjAudGFyLmd6Igo+ICAgICBCUjJfVEFSR0VUX0FSTV9UUlVTVEVEX0ZJUk1XQVJF
X1BMQVRGT1JNPSJpbXg4bW0iCj4gICAgIEJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVf
QkwzMT15Cj4gICAgIEJSMl9UQVJHRVRfVUJPT1Q9eQo+ICAgICBCUjJfVEFSR0VUX1VCT09UX0JV
SUxEX1NZU1RFTV9LQ09ORklHPXkKPiAgICAgQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVEFSQkFM
TD15Cj4gICAgIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1RBUkJBTExfTE9DQVRJT049IiQoY2Fs
bAo+ICAgICBnaXRodWIsbnhwLWlteCx1Ym9vdC1pbXgsbGYtNS4xMC55LTEuMC4wKS91Ym9vdC1p
bXgtbGYtNS4xMC55LTEuMC4wLnRhci5neiIKPiAgICAgQlIyX1RBUkdFVF9VQk9PVF9CT0FSRF9E
RUZDT05GSUc9ImlteDhtbV9ldmsiCj4gICAgIEJSMl9UQVJHRVRfVUJPT1RfTkVFRFNfRFRDPXkK
PiAgICAgQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRfQ1VTVE9NPXkKPiAgICAgQlIyX1RBUkdFVF9V
Qk9PVF9GT1JNQVRfQ1VTVE9NX05BTUU9InUtYm9vdC1ub2R0Yi5iaW4iCj4gICAgIEJSMl9UQVJH
RVRfVUJPT1RfU1BMPXkKPiAgICAgQlIyX1BBQ0tBR0VfSE9TVF9ET1NGU1RPT0xTPXkKPiAgICAg
QlIyX1BBQ0tBR0VfSE9TVF9HRU5JTUFHRT15Cj4gICAgIEJSMl9QQUNLQUdFX0hPU1RfSU1YX01L
SU1BR0U9eQo+ICAgICBCUjJfUEFDS0FHRV9IT1NUX01UT09MUz15Cj4gICAgIEJSMl9QQUNLQUdF
X0hPU1RfVUJPT1RfVE9PTFM9eQo+ICAgICBCUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xTX0ZJ
VF9TVVBQT1JUPXkKPiAKPiAgICAgU2lnbmVkLW9mZi1ieTogUm95IEtvbGxlbiBTdmVuZHNlbiA8
cm95LmtvbGxlbi5zdmVuZHNlbkBha2Vyc29sdXRpb25zLmNvbQo+ICAgICA8bWFpbHRvOnJveS5r
b2xsZW4uc3ZlbmRzZW5AYWtlcnNvbHV0aW9ucy5jb20+Pgo+ICAgICBTaWduZWQtb2ZmLWJ5OiBB
cm5vdXQgVmFuZGVjYXBwZWxsZSA8YXJub3V0QG1pbmQuYmUgPG1haWx0bzphcm5vdXRAbWluZC5i
ZT4+Cj4gICAgIC0tLQo+ICAgICAgwqBwYWNrYWdlL3F0Ni9xdDZiYXNlL3F0NmJhc2UubWsgPGh0
dHA6Ly9xdDZiYXNlLm1rPiB8IDkgKysrKysrKy0tCj4gICAgICDCoDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gICAgIGRpZmYgLS1naXQgYS9wYWNr
YWdlL3F0Ni9xdDZiYXNlL3F0NmJhc2UubWsgPGh0dHA6Ly9xdDZiYXNlLm1rPgo+ICAgICBiL3Bh
Y2thZ2UvcXQ2L3F0NmJhc2UvcXQ2YmFzZS5tayA8aHR0cDovL3F0NmJhc2UubWs+Cj4gICAgIGlu
ZGV4IDY4NTc3MjVlZjUuLjIxMTgwOGQyYWYgMTAwNjQ0Cj4gICAgIC0tLSBhL3BhY2thZ2UvcXQ2
L3F0NmJhc2UvcXQ2YmFzZS5tayA8aHR0cDovL3F0NmJhc2UubWs+Cj4gICAgICsrKyBiL3BhY2th
Z2UvcXQ2L3F0NmJhc2UvcXQ2YmFzZS5tayA8aHR0cDovL3F0NmJhc2UubWs+Cj4gICAgIEBAIC0y
NTksMTAgKzI1OSwxNSBAQCBRVDZCQVNFX0NPTkZfT1BUUyArPSAtREZFQVRVUkVfZWdsZnM9T0ZG
Cj4gICAgICDCoGVuZGlmCj4gCj4gICAgICDCoGlmZXEgKCQoQlIyX1BBQ0tBR0VfUVQ2QkFTRV9P
UEVOR0xfREVTS1RPUCkseSkKPiAgICAgLVFUNkJBU0VfQ09ORl9PUFRTICs9IC1ERkVBVFVSRV9v
cGVuZ2w9T04gLURGRUFUVVJFX29wZW5nbF9kZXNrdG9wPU9OCj4gICAgICtRVDZCQVNFX0NPTkZf
T1BUUyArPSBcCj4gICAgICvCoCDCoCDCoCDCoC1ERkVBVFVSRV9vcGVuZ2w9T04gXAo+ICAgICAr
wqAgwqAgwqAgwqAtREZFQVRVUkVfb3BlbmdsX2Rlc2t0b3A9T04KPiAgICAgIMKgUVQ2QkFTRV9E
RVBFTkRFTkNJRVMgKz0gbGliZ2wKPiAgICAgIMKgZWxzZSBpZmVxICgkKEJSMl9QQUNLQUdFX1FU
NkJBU0VfT1BFTkdMX0VTMikseSkKPiAgICAgLVFUNkJBU0VfQ09ORl9PUFRTICs9IC1ERkVBVFVS
RV9vcGVuZ2w9T04gLURGRUFUVVJFX29wZW5nbGVzMj1PTgo+ICAgICArUVQ2QkFTRV9DT05GX09Q
VFMgKz0gXAo+ICAgICArwqAgwqAgwqAgwqAtREZFQVRVUkVfb3BlbmdsPU9OIFwKPiAgICAgK8Kg
IMKgIMKgIMKgLURGRUFUVVJFX29wZW5nbGVzMj1PTiBcCj4gICAgICvCoCDCoCDCoCDCoC1ERkVB
VFVSRV9vcGVuZ2xfZGVza3RvcD1PRkYKPiAgICAgIMKgUVQ2QkFTRV9ERVBFTkRFTkNJRVMgKz0g
bGliZ2xlcwo+ICAgICAgwqBlbHNlCj4gICAgICDCoFFUNkJBU0VfQ09ORl9PUFRTICs9IC1ERkVB
VFVSRV9vcGVuZ2w9T0ZGIC1ESU5QVVRfb3BlbmdsPW5vCj4gICAgIF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gICAgIGJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKPiAgICAgYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcgPG1haWx0bzpidWlsZHJvb3RAYnVpbGRy
b290Lm9yZz4KPiAgICAgaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cj4gICAgIDxodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3Q+Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
