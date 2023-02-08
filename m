Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F35C05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BD8AD40C20;
	Wed,  8 Feb 2023 15:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD8AD40C20
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mPrQtqok4Vl3; Wed,  8 Feb 2023 15:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7F4840C16;
	Wed,  8 Feb 2023 15:26:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7F4840C16
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E92EB1BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D17BF40C16
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D17BF40C16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D1hx3t3Uv3Aq for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:26:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 107C4403D6
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 107C4403D6
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:26:19 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id r18so17864wmq.5
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 07:26:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OR3ER4U6TAjCLVvvNxKjuXmJKKXpkC//8o3HATDGzJs=;
 b=HShmU0i3BgudPCcVOvM7/QxPeRZluo2mvNnpD0becd9PI3kVrRKMMas3RCPsTlPPrj
 j1c6IdaFeuHgKdGYWKLObppiCiBZAD6C2s1LktMO4sM6cKqhOxpZtIS3jCaBGI0bBgfJ
 sOnEx8qjjpVd6DoylOePeE653MEpPm6OHO+Sjo3bD/19bDFvfhkdj6XMzyViv+hNmPJB
 63zByEz3Vw/tgDpdg7BPzFR8xoLLgeqNM+gib7uP0JEAHrqBfiP9DJPR+/C2UbrRI1gr
 EKvHoUBtH/bqzmQgbwDY+upEgC1nb+XwPOJlYwqnOT7AOe/ejsTXclW8cMLnewIOpxpD
 lTDw==
X-Gm-Message-State: AO0yUKVnqmWn6/z2YSPF8scnjTd1RvZCXphZfDStxXIs/BjA2KcH3uik
 /ZMk3Lu54AY0GVNjH+9ZJXpXiLwcWMElrbBU
X-Google-Smtp-Source: AK7set8wv7EUVjBfzzjnCvpHlUFHHJqXMGlwyRPt+LbAy0OfgoLIqEjlHlRwALxXQDSEjTj3RNJqCA==
X-Received: by 2002:a05:600c:a697:b0:3dd:1ac2:989 with SMTP id
 ip23-20020a05600ca69700b003dd1ac20989mr1913010wmb.39.1675869978306; 
 Wed, 08 Feb 2023 07:26:18 -0800 (PST)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c2cc800b003dfefe115b9sm2469837wmc.0.2023.02.08.07.26.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Feb 2023 07:26:17 -0800 (PST)
Message-ID: <7979c25c-5cdc-2335-81dd-26b27ced5a5a@smile.fr>
Date: Wed, 8 Feb 2023 16:26:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Lang Daniel <d.lang@abatec.at>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <VI1P190MB049347BD3CCF4F482FFA9D8A9F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <VI1P190MB049347BD3CCF4F482FFA9D8A9F319@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OR3ER4U6TAjCLVvvNxKjuXmJKKXpkC//8o3HATDGzJs=;
 b=gyKZvfkpkaC4WFVMAzpSoMtVy7X0eEGGvnlH8Rk4NOPmAIbO3h911b5P0qLvy/dLnI
 72oQdd0xDI1EbeaY3OpATei07wAOQBt1ADaT7wRRJsZu1hmE/AT0RMOx4SBSpIm9OXLP
 7hzNZd/ojnMVU8QgQ4xQTe9AMhdnPfW7pBNRhwrA/BO9JlroK7RYFPy95bTfMQ8GxifJ
 RVkzZ7QJcFohXu601MCfHPRsXTeXrmfUHh5wZzDKbBhtR4W2wHOCw2+72+kVeU21cuGZ
 7D3o4kftMBtgWPVUN183PUhRs6wg6mNxhmpD8Kxc0KBpijzbRpEZoyxZ7Oc97wa21lvE
 5/RA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=gyKZvfkp
Subject: Re: [Buildroot] [PATCH v2 11/11] DEVELOPERS: add Daniel Lang for
 llvm-project
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpMZSAyNS8xMC8yMDIyIMOgIDA4OjE0LCBMYW5nIERhbmllbCB2aWEgYnVpbGRyb290
IGEgw6ljcml0wqA6Cj4gRnJvbSA3MDk4OThkNDJmMTE1YTU0MDNmNTRkM2ZiMGRkMDRlMWQ1ZWUw
ODdkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQo+IEZyb206IERhbmllbCBMYW5nIDxkLmxhbmdA
YWJhdGVjLmF0Pgo+IERhdGU6IFdlZCwgMjggU2VwIDIwMjIgMTY6MDI6MzggKzAyMDAKPiBTdWJq
ZWN0OiBbUEFUQ0ggdjIgMTEvMTFdIERFVkVMT1BFUlM6IGFkZCBEYW5pZWwgTGFuZyBmb3IgbGx2
bS1wcm9qZWN0CgpUaGFua3MgZm9yIHRoaXMgdmVyc2lvbiBidW1wLgoKRGlkIHlvdSBrbm93IHRo
ZXJlIGlzIGEgQ2xhbmcgKyBjb21waWxlclJUIHRlc3QgaW4gdGhlIEJ1aWxkcm9vdCB0ZXN0c3Vp
dGU/CgpIYXZlIHlvdSBjaGVjayBpZiB0aGUgdGVzdCBzdWNjZWVkIHdpdGggeW91ciBzZXJpZXMg
YXBwbGllZD8KCi4vc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyAtayAtZCBkbC8gLW8gdGVzdHN1
aXRlCnRlc3RzLnBhY2thZ2UudGVzdF9jbGFuZy5UZXN0Q2xhbmdDb21waWxlclJUCgpBY2tlZC1i
eTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpCZXN0IHJlZ2FyZHMsClJv
bWFpbgoKCj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIExhbmcgPGQubGFuZ0BhYmF0ZWMuYXQ+
Cj4gLS0tCj4gQ2hhbmdlcyB2MSAtPiB2MjoKPiAtIE5vIGNoYW5nZXMKPiAtLS0KPiAgREVWRUxP
UEVSUyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0t
Z2l0IGEvREVWRUxPUEVSUyBiL0RFVkVMT1BFUlMKPiBpbmRleCA2ZGJmNGZlN2E1Li4xOWQ1ODQw
MTVmIDEwMDY0NAo+IC0tLSBhL0RFVkVMT1BFUlMKPiArKysgYi9ERVZFTE9QRVJTCj4gQEAgLTYz
Myw2ICs2MzMsNyBAQCBGOglwYWNrYWdlL2RhY2Fwby8KPiAgTjoJRGFuaWVsIExhbmcgPGQubGFu
Z0BhYmF0ZWMuYXQ+Cj4gIEY6CXBhY2thZ2UvZGJ1cy1jeHgvCj4gIEY6CXBhY2thZ2UvcGFoby1t
cXR0LWNwcC8KPiArRjoJcGFja2FnZS9sbHZtLXByb2plY3QvCj4gIAo+ICBOOglEYW1pZW4gTGFu
c29uIDxkYW1pZW5Aa2FsLWhvc3QuY29tPgo+ICBGOglwYWNrYWdlL2xpYnZkcGF1LwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
