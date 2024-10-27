Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04922D13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 19:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5B2481010;
	Sun, 27 Oct 2024 19:37:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E6UdvcI-kR56; Sun, 27 Oct 2024 19:37:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5025810DF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5025810DF;
	Sun, 27 Oct 2024 19:37:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EEE6971
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E6A240316
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jzQi4Nca41BX for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 19:37:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F948402E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F948402E8
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F948402E8
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 19:37:28 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43155afca99so31585595e9.1
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 12:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730057846; x=1730662646;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5pb5QyicDd90amcZODiuyXhvRWzILynU7f96prL7iC0=;
 b=AcPYr8WJ3nV5jJ9Obf43BSKhqeCv5l6zuh1ZffOhjbm1EDHlMdMAWLSf6Mzjz8Wegr
 4bfbWAXg8z8qVH3B30URxF4N/vBpnlKH+qOF6Y//x2vWUcwN3wcBNH+zn3zEpo6n2BTh
 L5PfnHBBnc4kKlx8kG6raifGtLHJKqXbxPyHWD27Ow7FQhtRbm1B22ythb8NoKgCWifU
 nUmIgsz0Auhi9sJrK6aZOvXAgraXaJGrvAvcyGUymaL3Iv1txC0/RM/wDd/vBRZd7yLk
 UN0iOZxvRehkIaU9lTlaXKdwEnxwwWwiwu5v2oX1YLC11XnAjQmqBo+LDz1omnKu+9ir
 ySTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhHbj5DjVvqNuTAuBFWFdkKiI+kQyPBEiinkF2AC5NkNhIAvVhKGNzaFVAKhSFwPaJhLgwtLUsCjw=@buildroot.org
X-Gm-Message-State: AOJu0Yw2pnP4eNv0UGoNo0PkpPJLYYJuqlirfJUwqWHuxT5jMw8HUrxU
 ffCxZiC1uQVWiSQVu66RbysJCBTbw3tYJBaK1Q2gu8I34bP4h5ILB3HQK+3g1LLpcBQTkLYb+rC
 N
X-Google-Smtp-Source: AGHT+IFmiB8gM0mtLKoOfWyLr/JynDp/7BXdU69GFDgyEHt/bPlx1N0fT9E8VMl66NGYIpx96Tqq+w==
X-Received: by 2002:a05:600c:1c17:b0:431:57cf:f13d with SMTP id
 5b1f17b1804b1-4319a5604damr46650815e9.3.1730057846235; 
 Sun, 27 Oct 2024 12:37:26 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:949d:5800:e3ef:2d7a:4131:71f?
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360c10asm84419175e9.43.2024.10.27.12.37.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Oct 2024 12:37:26 -0700 (PDT)
Message-ID: <2c078e03-3092-4e26-9414-ddc225af69f5@smile.fr>
Date: Sun, 27 Oct 2024 20:37:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour via buildroot <buildroot@buildroot.org>
References: <20241027093306.2271872-1-romain.naour@smile.fr>
 <20241027183516.42b55f09@windsurf>
Content-Language: en-US
In-Reply-To: <20241027183516.42b55f09@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1730057846; x=1730662646; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5pb5QyicDd90amcZODiuyXhvRWzILynU7f96prL7iC0=;
 b=an9PZQ74cyEar8HRGq+jiyTPGdiu/STtQD/DRScmL/WGislkDxerkc5tppsrVAialE
 boNlcjwVouWC2ihzwhok7dn7JRwGoKB1MtnTqgEWaVogGiDoZz0GjBGusucdOu4F9NXO
 lTQzB8WCr5yNiBAZVWD33Bv4Wzjv/LWhwQO44=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=an9PZQ74
Subject: Re: [Buildroot] [PATCH 1/3] configs/qemu_aarch64_sbsa_defconfig:
 update ATF to v2.11
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

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAyNy8xMC8yMDI0IMOgIDE4OjM1LCBUaG9tYXMgUGV0YXp6
b25pIGEgw6ljcml0wqA6Cj4gSGVsbG8gUm9tYWluLAo+IAo+IE9uIFN1biwgMjcgT2N0IDIwMjQg
MTA6MzM6MDQgKzAxMDAKPiBSb21haW4gTmFvdXIgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1
aWxkcm9vdC5vcmc+IHdyb3RlOgo+IAo+PiAtQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FS
RV9DVVNUT01fR0lUPXkKPj4gLUJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9N
X1JFUE9fVVJMPSJodHRwczovL2dpdGh1Yi5jb20vQVJNLXNvZnR3YXJlL2FybS10cnVzdGVkLWZp
cm13YXJlLmdpdCIKPj4gLUJSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VTVE9NX1JF
UE9fVkVSU0lPTj0idjIuNyIKPj4gK0JSMl9UQVJHRVRfQVJNX1RSVVNURURfRklSTVdBUkVfQ1VT
VE9NX1ZFUlNJT049eQo+PiArQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRV9DVVNUT01f
VkVSU0lPTl9WQUxVRT0idjIuMTEiCj4gCj4gVGhhbmtzIGZvciB0aGUgdXBkYXRlLiBTaG91bGRu
J3QgeW91IHVwZGF0ZQo+IGJvYXJkL3FlbXUvcGF0Y2hlcy9hcm0tdHJ1c3RlZC1maXJtd2FyZS9h
cm0tdHJ1c3RlZC1maXJtd2FyZS5oYXNoID8KPiBZb3VyIGRlZmNvbmZpZyBjdXJyZW50bHkgd29y
a3MgYmVjYXVzZSBib290L2FybS10cnVzdGVkLWZpcm13YXJlLyBoYXMKPiB0aGUgaGFzaCBmb3Ig
djIuMTEsIGJ1dCBhcyBzb29uIGFzIHdlIGJ1bXAgYm9vdC9hcm0tdHJ1c3RlZC1maXJtd2FyZSB0
bwo+IHYyLjEyLCB3ZSB3aWxsIGRyb3AgdGhpcyBoYXNoLCBhbmQgeW91ciBxZW11X2FhcmNoNjRf
c2JzYV9kZWZjb25maWcKPiB3aWxsIGZhaWwgYnVpbGRpbmcuCgpJbmRlZWQsIHRoYW5rcyBmb3Ig
dGhlIHJldmlldy4KCk5vdGU6IHRoZSBhcm0tdHJ1c3RlZC1maXJtd2FyZS12Mi43LWdpdDQudGFy
Lmd6IGhhcyBpcyBzdGlsbCB1c2VkIGJ5CnFlbXVfYXJtX3ZleHByZXNzX3R6X2RlZmNvbmZpZwoK
QmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRoYW5rcyEKPiAKPiBUaG9tYXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
