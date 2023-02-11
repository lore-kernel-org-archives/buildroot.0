Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEB9C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 09:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 322EF4032A;
	Sat, 11 Feb 2023 09:57:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 322EF4032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nd-j_N01Hqxc; Sat, 11 Feb 2023 09:57:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7022C402FE;
	Sat, 11 Feb 2023 09:57:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7022C402FE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6439C1BF279
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 09:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E30241817
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 09:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E30241817
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id re_ngsaXb--D for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 09:57:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF45B416F3
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF45B416F3
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 09:57:53 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so5750415wmb.2
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 01:57:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z0h/kXOial/oQwPKsO9e6ojWR6bPqh/bIpAHrH9A52Q=;
 b=3zraeNAVXICvKDKDPzELphDLlyxOqo26qb/btE/uMbQdbP1mi1/FaKrI9M+Ai2bUvZ
 OwWjCKGcnH8mN+bEP3fbZQHfwVhv14tb7IFAvVenl+PfC5HMOFntJBjRTlqAeKasY+2H
 SVG2dKYgSphbyzZ1RYOKaBVnQoKE807Xmu/45LCvWC71LI1wXg3XoopzMeeupUoqlW4o
 3oweqSUpAIO7pHlh4bHPV6ufgZxx8IIAOSCubgGc88sewpzdf/E/QPSTxay9GK0lB0W4
 mwX8LmDL3Orw6JF+aa/BiRGgtqD869bpx5IuDZq0GMiRPjiGa4a6g1osm0CIjXgncuEx
 c5OQ==
X-Gm-Message-State: AO0yUKUts+CHLP23S2nfy9GcOOhxY2d60xuoPxQGaXktp3WKIpO0by19
 cNixp49enFDlTCWjzYdghcYUoA==
X-Google-Smtp-Source: AK7set/7AsBZPPV4c1Oqo4kIEhRGloOVRe4DFGTdaovjvluk6xUQCIictjRZ7DkKO+IIp5rO3TDSnA==
X-Received: by 2002:a05:600c:4d26:b0:3df:e730:42fc with SMTP id
 u38-20020a05600c4d2600b003dfe73042fcmr516290wmp.13.1676109471865; 
 Sat, 11 Feb 2023 01:57:51 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a05600c4fc700b003db0ad636d1sm12104475wmq.28.2023.02.11.01.57.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 01:57:51 -0800 (PST)
Message-ID: <f65b7f40-ad25-6d36-b72b-6b1241e87d32@smile.fr>
Date: Sat, 11 Feb 2023 10:57:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>
References: <20230211094202.3816592-1-romain.naour@gmail.com>
 <20230211095135.GD2796@scaer>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230211095135.GD2796@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z0h/kXOial/oQwPKsO9e6ojWR6bPqh/bIpAHrH9A52Q=;
 b=7c5pjFa9/53yrQmGUJ9wwN2x9mg4Muz0h/ZreBvEtG8qbaul+MQP8AWzhr01f9Twrd
 Wh7K68CSeIOvxAyvB8oxIXNneDmw9MzTOFZGRcD0hYLO7VEuPiITwzVS8w404vefr2bu
 K7dWVn/i7F1MYj3IQK3uFiRjSDgdiixzjpJqNMbMTAIKMESrNQfhHqT+I7XAR1BKaroh
 frHlmtJaOvG+HohGM75ddOXjViNZX4EZ29NKUWwg8CPqzfWRcCxjH1GQsLnUS5KOIN1R
 BM62NSRDzPUG5s5p++tcPZVuX7dUZck+w4/LXh9E39/yeDTPzAl+dDICx4m3wf5ucwcN
 j2IQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=7c5pjFa9
Subject: Re: [Buildroot] [PATCH] package/pkg-waf: add missing $
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTEvMDIvMjAyMyDDoCAxMDo1MSwgWWFubiBFLiBNT1JJTiBhIMOpY3JpdMKgOgo+IFJvbWFp
bi4gQWxsLAo+IAo+IE9uIDIwMjMtMDItMTEgMTA6NDIgKzAxMDAsIFJvbWFpbiBOYW91ciBzcGFr
ZSB0aHVzbHk6Cj4+IFdlIHdhbnQgdG8gaGF2ZSAkKEBEKSBleHBhbmRlZCBhdCB0aGUgdGltZSB0
aGUgcmVjaXBlIGlzIHJ1biwgc28gbGlrZQo+PiBhbGwgb3RoZXIgdmFyaWFibGVzLCB3ZSBuZWVk
IHRvICQkLWV4cGFuZCBpdC4KPj4KPj4gRml4ZXM6Cj4+IGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRy
b290Lm9yZy9yZXN1bHRzL2I2Zi9iNmZkM2E4NjZhZjE4MmVkYzc4MzE0OTJhZWNjODMyM2YzNzdi
ODI2Cj4gCj4gVGhhbmtzIGZvciB0aGUgcXVpY2sgZml4LCBidXQgc2UgYmVsb3cuLi4KPiAKPj4g
U2lnbmVkLW9mZi1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPgo+PiBD
YzogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4+IENjOiBQZXRlciBL
b3JzZ2FhcmQgPHBldGVyQGtvcnNnYWFyZC5jb20+Cj4+IC0tLQo+PiAgcGFja2FnZS9wa2ctd2Fm
Lm1rIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3BrZy13YWYubWsgYi9wYWNrYWdlL3BrZy13
YWYubWsKPj4gaW5kZXggMGU3NTIwNzJjOC4uYzNlOTY1YmRmMyAxMDA2NDQKPj4gLS0tIGEvcGFj
a2FnZS9wa2ctd2FmLm1rCj4+ICsrKyBiL3BhY2thZ2UvcGtnLXdhZi5tawo+PiBAQCAtNDIsNyAr
NDIsNyBAQCBkZWZpbmUgaW5uZXItd2FmLXBhY2thZ2UKPj4gICMgb3RoZXJ3aXNlIHdhZiBlcnJv
cnMgb3V0IHdpdGg6Cj4+ICAjIFdhZiBzY3JpcHQgJ1gnIGFuZCBsaWJyYXJ5ICdZJyBkbyBub3Qg
bWF0Y2gKPj4gIGRlZmluZSBXQUZfUEFDS0FHRV9SRU1PVkVfV0FGX0xJQgo+PiAtCSQoUk0pIC1m
ciAkKEBEKS93YWYgJChARCkvd2FmbGliCj4+ICsJJChSTSkgLWZyICQkKEBEKS93YWYgJCQoQEQp
L3dhZmxpYgo+IAo+IFNob3VsZG4ndCB3ZSBiZSB1c2luZyAkJCgkJChQS0cpX1NSQ0RJUikgb3Ig
JCQoJCgyKV9TUkNESVIpIGluc3RlYWQgb2YKPiAkJChARCksIGxpa2UgaXMgdXNlZCBldmVyeXdo
ZXJlIGVsc2UgaW4gdGhlIGZpbGU6Cj4gCj4gICAgIGNkICQkKCQkKFBLRylfU1JDRElSKSAmJiBw
eXRob24zIGNvbmZpZ3VyZSBbLi4uXQo+IAo+ICAgICBjZCAkJCgkJChQS0cpX1NSQ0RJUikgJiYg
cHl0aG9uMyAkJCgkKDIpX1dBRikKPiAKPiAoTm90ZSB0aGF0IGxhc3Qgb25lIHVzZXMgYSBtaXgg
b2YgJCQoUEtHKSBhbmQgJCgyKS4uLikKCkkgZ3Vlc3MgQEQgY29tZSBmcm9tIHRoZSBIT09LIGZy
b20gYXViaW8gYW5kIG1vdmUgdG8gcGtnLXdhZi4KCkl0IHNlZW1zIEBEIGlzIHVzZWQgYXQgc2V2
ZXJhbCBwbGFjZSBpbiBwa2ctPCo+Lm1rIGluZnJhLgoKSSdtIG5vdCBzdXJlIHdoYXQgd2UgcHJl
ZmVyL3Nob3VsZCB1c2UuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gUmVnYXJkcywKPiBZ
YW5uIEUuIE1PUklOLgo+IAo+PiAgZW5kZWYKPj4gIAo+PiAgIyBXZSBuZWVkIGhvc3QtcHl0aG9u
MyB0byBydW4gd2FmCj4+IC0tIAo+PiAyLjM0LjMKPj4KPj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+PiBi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
