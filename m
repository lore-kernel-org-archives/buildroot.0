Return-Path: <SRS0=/mEu=MO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDB3C4338F
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 19:40:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0D7260EB8
	for <buildroot@archiver.kernel.org>; Thu, 22 Jul 2021 19:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0D7260EB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B557140274;
	Thu, 22 Jul 2021 19:40:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id paOQNdF2MMmv; Thu, 22 Jul 2021 19:40:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D59FA4026E;
	Thu, 22 Jul 2021 19:40:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DCA381BF324
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 19:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC2D58300C
 for <buildroot@lists.busybox.net>; Thu, 22 Jul 2021 19:40:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7T1fzduRfvE for <buildroot@lists.busybox.net>;
 Thu, 22 Jul 2021 19:40:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DA0582F9B
 for <buildroot@busybox.net>; Thu, 22 Jul 2021 19:40:05 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id h2so8231737edt.3
 for <buildroot@busybox.net>; Thu, 22 Jul 2021 12:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sahmy2J7ATaafOguJtBW2g5jdn1PBb98lVr+TgVFTT4=;
 b=d3Zd3aT8KMQhknDiq5RYSiosfVDL0LmcyVXuIPm5bApcBaGy1O4K4mDRt2v53TIOQD
 mf4oEdqQNTAqFa05hVj+jpOjBqbJ91w9CmqXj7OW9suUejlElzpYPvNpx3V8J/ZeDtcn
 1Dtm6ZDDe/kf8WzPhm9x16ql2DutyOulXo3908esWDm3cOm4N1GtIhuayuhBfag3ot62
 /k1Zrt4qgriFvsGAN/yFbcgwqpeYhQRLT8shGGuJ42lkWUvUGL08slru+AEtu4ksM01I
 iOWtQdSLJQcgurorbD3o2sOqY0ICw7hz70gcI8UP2dJkg2KqnCzyna3s1DUt53r7Fh7w
 L1Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=sahmy2J7ATaafOguJtBW2g5jdn1PBb98lVr+TgVFTT4=;
 b=PndAwPaLlBkyMFWYwGiYoph7AJjdnt00E7rCrmC76lgQlYBXdzD0Kxd+QW4KH1fHUx
 GcoRkenw6S8u9vCvvxFkOqxqkDjfUkiYCezAnGzKkJ1iBRA1qIKt/aN5fTeV4NUjdfj0
 LtUBFU/cWNGRK+8G+m4F9P1pBo/lv9M1G6sBSaqZ0XSo4zreE5B3PfQP+vNUP2z5euYS
 VnZhaldxB6ePTgSYRY8lIjeQsQlpmJtTQuiU7QkyQ2S9EElyQ1+tZboRKlPGfcgmz2mr
 gs06X4jwCdnbjPmKUxca9pZTwsWCe/suRXvkOafCRdE8J5SKhff+8QY75iKdpSQGlNIT
 NEDg==
X-Gm-Message-State: AOAM533rfz6Y96LI6TEReI+rAqGpWmCQTnue01Jt+1ntouXCjDxHKqRw
 vj4kbphzkZApM4xFnzIEIX9s6DSliM6oXkoC
X-Google-Smtp-Source: ABdhPJy3XH74Auwv7AVK0+YMh6mrcX8lup/ISiT8euw3ZmwaUOSLarajDfKf1/zE78XT9TIK36uKQg==
X-Received: by 2002:a05:6402:26c5:: with SMTP id
 x5mr1366413edd.237.1626982803447; 
 Thu, 22 Jul 2021 12:40:03 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id j21sm12852813edq.76.2021.07.22.12.40.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 12:40:03 -0700 (PDT)
To: Patricia Holden <pholden@nklabs.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210720224806.09e5a5b2@windsurf>
 <BAACA597-C3FC-4275-9931-4D3F619F94EE@nklabs.com>
 <20210721094154.74005093@windsurf>
 <CAJ6EmCd-K+goctCfu5ygE8V1MAMh=C7RgxYmSfhJGQmRCuv=3g@mail.gmail.com>
 <CAJ6EmCfeA3e9-vmCbAUuN-yqPXaAMKci-g-G+OeW5UfrT=Uy_g@mail.gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <01c34092-b6d9-86ad-6cee-c78090e75b3f@mind.be>
Date: Thu, 22 Jul 2021 21:40:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAJ6EmCfeA3e9-vmCbAUuN-yqPXaAMKci-g-G+OeW5UfrT=Uy_g@mail.gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] Question about pkg-config pc files
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAyMi8wNy8yMDIxIDE5OjM2LCBQYXRyaWNpYSBIb2xkZW4gd3JvdGU6Cj4gSGkgVGhvbWFz
LAo+IAo+IFRoZSBzYWdhIGNvbnRpbnVlcy7CoCBJIGZvdW5kIHRoYXQgbXVsdGltZWRpYSBpcyBu
b3QgYWRkZWQKPiBiZWNhdXNlwqBCUjJfUEFDS0FHRV9RVDVfR0xfQVZBSUxBQkxFIGlzIG5vdCBz
ZXQuwqAgSW4gb3JkZXIgdG8gY29uZmlndXJlIFFUCj4gT3BlbkdMLCBJIGVuYWJsZWQgdGktZ2Z4
IHNpbmNlIG91ciBib2FyZCBpcyBhIGJlYWdsZWJvbmUteDE1LgoKIE5vdCB0aGF0IEkndmUgZXZl
ciB1c2VkIHRoaXMgYm9hcmQsIGJ1dCBBRkFJSyBmb3IgQU01N3h4IHlvdSBzaG91bGQgdXNlIHRp
LXNneCwKbm90IHRpLWdmeC4KCiBSZWdhcmRzLAogQXJub3V0CgoKPsKgIE5vdyBJIGNhbid0IGdl
dAo+IHBhc3QgYnVpbGRpbmcgdGktZ2Z4LsKgIEkgaGF2ZSBhIGxvY2FsIHNvdXJjZSBkaXJlY3Rv
cnkgZm9yIHRoZSBrZXJuZWwsIHNpbmNlIHdlCj4gaGFkIHRvIGFkZCBvdXIgb3duIGRyaXZlcnMg
Zm9yIHNvbWUgcHJvcHJpZXRhcnkgZGV2aWNlcyBvbiB0aGUgZGVzaWduIGJhc2VkIG9uCj4gYmVh
Z2xlYm9uZSBYMTUuwqAgSSBhbHNvIHVzZSB0aGUgbG9jYWwgc291cmNlIGRpcmVjdG9yeSB0byBn
ZW5lcmF0ZQo+IGxpbnV4LWhlYWRlcnMuwqAgV2UgYmFzZWQgdGhlIGtlcm5lbCBmcm9tIFRJJ3Mg
U0RLLsKgIEkgY2hlY2tlZCB0aGUga2VybmVsIGNvbmZpZywKPiBmYmRldiBvbWFwIGlzIHNlbGVj
dGVkLsKgIEJ1dCBJIGdldCB0aGUgZm9sbG93aW5nIGVycm9yOgo+IAo+IMKgQ0MgW01dCj4gwqAv
aG9tZS9wYXRyaWNhaG9sZGVuL3dpbGxpYW1zb24vYnVpbGQwNzA2MjAyMS9Qcm8zLUxpbnV4L2J1
aWxkcm9vdC0yMDIwLjAyL291dHB1dC9idWlsZC90aS1nZngtNV8wMV8wMV8wMi9HRlhfTGludXhf
S00vc2VydmljZXM0L3NydmttL2NvbW1vbi9wdnJzcnYubwo+IMKgIENDIFtNXQo+IMKgL2hvbWUv
cGF0cmljYWhvbGRlbi93aWxsaWFtc29uL2J1aWxkMDcwNjIwMjEvUHJvMy1MaW51eC9idWlsZHJv
b3QtMjAyMC4wMi9vdXRwdXQvYnVpbGQvdGktZ2Z4LTVfMDFfMDFfMDIvR0ZYX0xpbnV4X0tNL3Nl
cnZpY2VzNC9zcnZrbS9jb21tb24vaGFuZGxlLm8KPiAvaG9tZS9wYXRyaWNhaG9sZGVuL3dpbGxp
YW1zb24vYnVpbGQwNzA2MjAyMS9Qcm8zLUxpbnV4L2J1aWxkcm9vdC0yMDIwLjAyL291dHB1dC9i
dWlsZC90aS1nZngtNV8wMV8wMV8wMi9HRlhfTGludXhfS00vc2VydmljZXM0LzNyZHBhcnR5L2Rj
X29tYXBmYjNfbGludXgvb21hcGxmYl9saW51eC5jOjEzMzoxMDoKPiBmYXRhbCBlcnJvcjogb21h
cGZiL29tYXBmYi5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gwqAgMTMzIHwgI2luY2x1
ZGUgPG9tYXBmYi9vbWFwZmIuaD4KPiDCoCDCoCDCoCB8IMKgIMKgIMKgIMKgIMKgXn5+fn5+fn5+
fn5+fn5+fn4KPiAKPiAKPiBUaGUgZmlsZSAib21hcGZiLmgiIGlzIGluwqBkcml2ZXJzL3ZpZGVv
L2ZiZGV2L29tYXAyL29tYXBmYiwgYnV0IGZvciBzb21lIHJlYXNvbgo+IHRoZSB0aS1nZnggcGFj
a2FnZSBkb2VzIG5vdCBmaW5kIGl0LsKgIFdlIGFyZSB1c2luZyBidWlsZHJvb3QtMjAyMC0yMC4w
Mi4xMi4KPiAKPiBJIGRpZCBub3Qgc2VlIHRoaXMgZXJyb3IgaW4gdGhlIGJ1aWxkcm9vdCBpc3N1
ZXMsIEkgYW0gd29uZGVyaW5nIHdoeSBpdCBpcwo+IGNhdXNpbmcgcHJvYmxlbXMuwqAgTXkgb25s
eSBndWVzcyBpcyB0aGF0IGl0IG1heSBoYXZlIHNvbWV0aGluZyB0byBkbyB3aXRoIHRoZQo+IGZh
Y3QgdGhhdCBJIGhhdmUgYSBsb2NhbCBrZXJuZWwgc291cmNlIGRpcmVjdG9yeS4KCltzbmlwXQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5u
ZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
