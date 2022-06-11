Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72991C43334
	for <buildroot@archiver.kernel.org>; Sat, 11 Jun 2022 17:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1341A844A4;
	Sat, 11 Jun 2022 17:38:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bmRcjfjruGz4; Sat, 11 Jun 2022 17:38:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 224788405D;
	Sat, 11 Jun 2022 17:38:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58EED1BF82C
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 17:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4F017404CA
 for <buildroot@lists.busybox.net>; Sat, 11 Jun 2022 17:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xIwxJf6LQOCA for <buildroot@lists.busybox.net>;
 Sat, 11 Jun 2022 17:38:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C10040448
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 17:38:10 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id fu3so3623620ejc.7
 for <buildroot@buildroot.org>; Sat, 11 Jun 2022 10:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Su/ppJOI8o/7j5hUkprW22tR+j1pXz8N/TqTeUOlX6o=;
 b=E6MAgsLOBrmI/WYalCfT+lDqAaJQNSwSYueVhFdXX9ukMz02SHNh1tS6SjFAu53CW5
 Gz1agxOyNYsoAROhwo+y8CKCttzhVfhiWQahXtSwGfvS99bxWeD5/ccL3V/zNHqb/c05
 /47U6KMtYMmCrDFVc8gHgQQYX7pOfBlBZ2svuUvNVfpFxlhrrq73B0XJKYooy/N0roPD
 R7U2lAv9PgeoJ1BiDNyJmefvBzxAGSdA1N6RTaACW4150YFhixYz3DTtmDKODc77YyRz
 S3rwzs8FHWjhQkZslXDUrRV5COEj5PUxnfIOO8du+Iu8tyTSKY9AyZLKPMvTjPqG+Ekt
 rt0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Su/ppJOI8o/7j5hUkprW22tR+j1pXz8N/TqTeUOlX6o=;
 b=vIZrnpV0EOfTagBCvjdMX6q2CGrPTAsn+UF6jZW3zRrW6vPwfVslam/PID028bnN2G
 ovwgeCLS/RmZOHIetdSXV9izpyroP//Okoy9NKGRvRa96wg/gtXjZX/VKV+tZFMYxWRO
 rV6LQ/JzNJGCtk2FeXRkEiXkpJRXmqxMaM58+Sw9fupdrYGhNJGS8Qv8v72SfdHGx7nT
 hTSXTT32yrMcdzfbIsFzmXieQY+I0CI7p9ts4xSKRd9CE/S8ExkDYqGcJfhyovhFF+2W
 o1GqKFoNnhCe9MKSo/xkL+UvIMpOg86MroYWUaTIEhGC0yMcNX+R54NQVJpAboVIh2kN
 DlJg==
X-Gm-Message-State: AOAM53322o+xUpFZsfGI8K5G6lHagpUdQc+tY5bUDQcKae6axWn6CHkb
 rtyTNRpI2GtdX+l6sxs0lb7J8PiMgtczBA==
X-Google-Smtp-Source: ABdhPJzDrudowLGxLLuN6uDJYkvaZYk2hncQbcMvPM/UwBSm2aFJoiNygXjJECPciMtiyNJZ6yf/Rg==
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id
 fj2-20020a1709069c8200b006dfbaa29f75mr44745232ejc.762.1654969089080; 
 Sat, 11 Jun 2022 10:38:09 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a170906085800b00711c7cca428sm1283327ejd.155.2022.06.11.10.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Jun 2022 10:38:08 -0700 (PDT)
Message-ID: <d459a460-312b-3daf-4b9f-a36974334b6b@mind.be>
Date: Sat, 11 Jun 2022 19:38:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Charles Steinkuehler <charles@steinkuehler.net>, buildroot@buildroot.org
References: <7dfaf383-9700-4b0a-83fb-952c5116e7b0@steinkuehler.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <7dfaf383-9700-4b0a-83fb-952c5116e7b0@steinkuehler.net>
Subject: Re: [Buildroot] Patching Package Dependencies
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBDaGFybGVzLAoKT24gMDkvMDYvMjAyMiAyMzoyMSwgQ2hhcmxlcyBTdGVpbmt1ZWhsZXIg
d3JvdGU6Cj4gSSBhbSB1c2luZyBCdWlsZHJvb3QgKDIwMjIuMDIuMikgd2l0aCBhIGNvdXBsZSBC
UjJfRVhFUk5BTCBkaXJlY3RvcmllcyBhbmQgSSAKPiBuZWVkIHRvIG1vZGlmeSBhIHBhY2thZ2Ug
cHJvdmlkZWQgd2l0aCBCdWlsZHJvb3QgKGF2cmR1ZGUpLsKgIEkgY2FuIGVhc2lseSBwYXRjaCAK
PiB0aGUgY29kZSBieSBhZGRpbmcgYSBwYXRjaCBmaWxlIHRvIG15IEJSMl9FWFRFUk5BTF9GT09f
UEFUSC9wYXRjaGVzIGRpcmVjdG9yeSAKPiB3aGljaCBpcyBhZGRlZCB0byBCUjJfR0xPQkFMX1BB
VENIX0RJUi7CoCBUaGUgcHJvYmxlbSBpcyBteSBjb2RlIGNoYW5nZXMgcmVxdWlyZSAKPiBhIG5l
dyBsaWJyYXJ5IChsaWJncGlvZCkgd2hpY2ggaXMgcGFydCBvZiBteSBjb25maWd1cmF0aW9uIGJ1
dCBpcyBub3QgbGlzdGVkIGFzIAo+IGEgcGFja2FnZSBkZXBlbmRlbmN5IGZvciBhdnJkdWRlIGJ5
IEJ1aWxkcm9vdCwgc28gYnVpbGRzIGZhaWwuCj4gCj4gSXMgdGhlcmUgYSB3YXkgdG8gZXh0ZW5k
IHRoZSBmaWxlcyB1bmRlciBCdWlsZHJvb3QvcGFja2FnZSB1c2luZyBhIEJSMl9FeHRlcm5hbCAK
PiBkaXJlY3Rvcnk/CgogIE9mZmljaWFsbHksIG5vIHRoZXJlIGlzbid0LiBJZiB5b3Ugd2FudCB0
byBvdmVycmlkZSBhbiBleGlzdGluZyBwYWNrYWdlIChvdGhlciAKdGhhbiBwYXRjaGluZyBpdCks
IHRoZSBvbmx5IHRoaW5nIHlvdSBjYW4gZG8gaXMgdG8gY3JlYXRlIGFuIGVudGlyZWx5IG5ldyAK
cGFja2FnZSB3aXRoIGEgZGlmZmVyZW50IG5hbWUuCgogIFRoaXMgaXMganVzdCBhIHRlY2huaWNh
bCBsaW1pdGF0aW9uIGJlY2F1c2UgZXZlcnl0aGluZyBpcyBpbmNsdWRlZCB0b2dldGhlciBpbiAK
b25lIGJpZyBgbWFrZWAgZGF0YWJhc2UsIGFuZCBgbWFrZWAgZG9lc24ndCBoYXZlIGEgd2F5IHRv
IG92ZXJyaWRlIGV2ZXJ5dGhpbmcgCmZyb20gYSBwcmV2aW91c2x5IGluY2x1ZGVkIG1ha2VmaWxl
LiBJbiBhZGRpdGlvbiwgc29tZSBvZiB0aGUgdmFyaWFibGVzIGFyZSB1c2VkIAppbW1lZGlhdGVs
eSB0byBkZWZpbmUgZGVwZW5kZW5jaWVzLCBzbyBpZiB5b3Ugd291bGQgb3ZlcnJpZGUgdGhlbSBp
biB0aGUgCmV4dGVybmFsLCB0aGF0IGRvZXNuJ3QgaGF2ZSB0aGUgZGVzaXJlZCBlZmZlY3QuIFRo
aXMgaXMgdGhlIGNhc2UgZm9yIF9WRVJTSU9OIAphbmQgX0RFUEVOREVOQ0lFUy4gU28geW91J3Jl
IG91dCBvZiBsdWNrLgoKICBUaGVyZSBpcyBvbmUgaGFjayB5b3UgY291bGQgdG8sIGFuZCB0aGF0
IGlzIHRvIGFidXNlIGxvY2FsLm1rICh0aGUgCkJSMl9QQUNLQUdFX09WRVJSSURFX0ZJTEUsIG5v
cm1hbGx5IHVzZWQgZm9yIHNldHRpbmcgT1ZFUlJJREVfU1JDRElSKS4gVGhpcyBmaWxlIAppcyBy
ZWFkIGJlZm9yZSB0aGUgcGFja2FnZSBtYWtlZmlsZS4gT2YgY291cnNlLCBhdnJkdWRlLm1rIGFs
cmVhZHkgZGVmaW5lcyAKQVZSRFVERV9ERVBFTkRFTkNJRVMsIHNvIGlmIHlvdSdkIHNldCBzb21l
dGhpbmcgaW4gbG9jYWwubWssIGl0IHdvdWxkIGp1c3QgZ2V0IApsb3N0LiBCdXQgeW91IGNvdWxk
IChhZ2FpbikgYWJ1c2UgQVZSRFVERV9FWFRSQUNUX0RFUEVOREVOQ0lFUyB3aGljaCBpcyBub3Qg
c2V0IApieSBhdnJkdWRlLm1rLgoKICBIb3dldmVyLCBzaW5jZSBubyBwYWNrYWdlIGRlcGVuZHMg
b24gYXZyZHVkZSwgaXQncyBtdWNoIHNpbXBsZXIgYW5kIGNsZWFuZXIgdG8gCnNpbXBseSBhZGQg
YSBuZXcgcGFja2FnZSBteWF2cmR1ZGUgdG8geW91ciBleHRlcm5hbC4KCiAgUmVnYXJkcywKICBB
cm5vdXQKCgo+IAo+IEFsdGVybmF0ZWx5LCBpcyBkZWZpbmluZyBhIHBhY2thZ2UgaW4gbXkgQlIy
X0V4dGVybmFsIGRpcmVjdG9yeSB3aXRoIHRoZSBzYW1lIAo+IG5hbWUgYXMgYW4gb2ZmaWNpYWwg
QnVpbGRyb290IHBhY2thZ2UgYWxsb3dlZC9yZWNvbW1lbmRlZD8KPiAKPiAuLi5vciBhcmUgdGhl
cmUgYW55IG90aGVyIHN1Z2dlc3Rpb25zIGZvciBtb2RpZnlpbmcgYSBCdWlsZHJvb3QgcGFja2Fn
ZSB3aXRob3V0IAo+IG1ha2luZyBhIGxvY2FsIGJyYW5jaCBhbmQgYXBwbHlpbmcgbXkgbmVlZGVk
IGNoYW5nZXM/Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
