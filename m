Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41C9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 18:25:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C87E5610C8
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 18:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C87E5610C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BCB8606B8;
	Thu, 23 Sep 2021 18:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDZD6E3IYV_D; Thu, 23 Sep 2021 18:25:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8EBF60772;
	Thu, 23 Sep 2021 18:25:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E5FDC1BF389
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 18:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D189683F60
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 18:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9g8yoW1fvLT3 for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 18:25:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5804A83F0C
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 18:25:36 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id bx4so26383866edb.4
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 11:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BTZqqNb2Ol/rh2TVsxZXQkoYqRBOhD/DvKc3w27sZd0=;
 b=hcQ980hLLvwGMWQPKczBiygWYGH+MJeUwnEN4AbMZDRKymdCezQVAAoxAOv7sXQhnH
 Hew1mnNL1xJciHdmqrsFftm3tE2Oo6+ec5sUGrEpTR7oR+tUXGlFQcUDKxwfGWKWbW55
 LdEd7dHhYyx7n3HnQcfPq9SXMF9n+d+CeMSXoZCacf7qIAhM6kps6FBJ+wWAImDxn2bU
 C9M/Im2ZgkRwaKdl62nZEeVE6IP70TkESZBpWXKHokMA8pGXsBgQ7HF9l7ynM0GRu/RD
 reaeXTTqU9SZt6d5SBbtOsP2Mz0gBYqFvNZwo4Q1hRtXBDnv8uO5B6DCBT7yS9+XrdYv
 T8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BTZqqNb2Ol/rh2TVsxZXQkoYqRBOhD/DvKc3w27sZd0=;
 b=YJ7HmiMpTKy/HYU99Zt5bgZFNZp8mR8uhet89E4rw9KFDeUQrKHrlq+TD+OK1X2rtb
 tZCUmNfK79FU2rKzFurZ4D4LPrijjgU+IqcDtQsoVACEypdUsOQP6gG5wKef4AdhTKsg
 3zg9WxRYvzgB4p1n2/ujp5WAWktN22nXikJXKJd0p0jYHMd2c0dRyLEJk5abvehWiVNp
 gt4nkRywAaGeYxptzoDIf81DgjKTg7YdZ7mIo7HIFvO4PnKvNDsgMgUMGYwmLE9iyAbF
 ExywHLzPkNPSWg4vPDp3oKXTjXEpBZD4Qoqf02WfW4cGD6rCQezio7DJ9i6A16qWVNg+
 lP5Q==
X-Gm-Message-State: AOAM532ASPsx+QevkCJwAf31NlBDASACqyI/P2YHAcsOszJbtml+Lsr/
 Mw474BXVYjLlMtxPlegfmX51vw==
X-Google-Smtp-Source: ABdhPJwZG/QZcpVKCvZZb4kfF4GnA++7qyBrCrMUR0cbb+5qA4VY9+urdkjWIIPYpmvobBYINsMfPg==
X-Received: by 2002:a05:6402:3454:: with SMTP id
 l20mr138030edc.83.1632421534331; 
 Thu, 23 Sep 2021 11:25:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d11sm3571514ejo.35.2021.09.23.11.25.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 11:25:34 -0700 (PDT)
Message-ID: <f40b51e0-815d-76dc-f44b-482e9adeaaf5@mind.be>
Date: Thu, 23 Sep 2021 20:25:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210912141140.253778-9-romain.naour@gmail.com>
 <20210922201027.934860-1-arnout@mind.be>
 <074d7a6f-bebc-1b36-f845-34ab5297d707@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <074d7a6f-bebc-1b36-f845-34ab5297d707@gmail.com>
Subject: Re: [Buildroot] [PATCH] .gitlab-ci.yml: update docker image to
 20210922.2200
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

CgpPbiAyMi8wOS8yMDIxIDIzOjQ1LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGkgQXJub3V0LAo+
IAo+IExlIDIyLzA5LzIwMjEgw6AgMjI6MTAsIEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNp
dW0vTWluZCkgYSDDqWNyaXTCoDoKPj4gQ29tbWl0IDcxYjgzMjI3MTI4YmU2MmMxNjkzMTNlODVi
YjhmMzM5Zjk3N2FkNjcgdXBkYXRlZCB0aGUgRG9ja2VyZmlsZQo+PiB0byBiZSB1c2VkIGluIENJ
IHRlc3RzLiBJbiBvcmRlciB0byBhY3R1YWxseSB1c2UgdGhpcyBuZXcgZG9ja2VyIGltYWdlLAo+
PiB1cGRhdGUgLmdpdGxhYi1jaS55bWwgdG8gcG9pbnQgdG8gdGhlIGRvY2tlciBpbWFnZSB0aGF0
IHdhcyBjcmVhdGVkIHdpdGgKPj4gdGhlIHVwZGF0ZWQgRG9ja2VyZmlsZS4KPj4KPj4gU2lnbmVk
LW9mZi1ieTogQXJub3V0IFZhbmRlY2FwcGVsbGUgKEVzc2Vuc2l1bS9NaW5kKSA8YXJub3V0QG1p
bmQuYmU+Cj4gCj4gVGhlcmUgYXJlIHNvbWUgbmV3IGlzc3VlcyBzaW5jZSBsYXN0IHRpbWUgSSB0
ZXN0ZWQ6Cj4gCj4gV2l0aG91dCBweXRob24gaW5zdGFsbGVkLCBzeXNsaW51eCBkb2Vzbid0IGJ1
aWxkLgo+IAo+IFRlc3RTeXNMaW51eFg4NkVGSS9idWlsZC9zeXNsaW51eC02LjAzL2NvbTMyL2Nt
ZW51L21lbnVnZW4ucHkgWy4uLl0KPiBtYWtlWzZdOiBweXRob246IE5vIHN1Y2ggZmlsZSBvciBk
aXJlY3RvcnkKPiAKPiBodHRwczovL2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL2pvYnMv
MTYxNDQ0Njc2NgoKICBGb3IgdGhhdCwgd2UganVzdCBuZWVkIHRoZSBweXRob24taXMtcHl0aG9u
MyBwYWNrYWdlIChvciB3aGF0ZXZlciBpdCdzIApjYWxsZWQpLiBPciwgYmV0dGVyIHlldCwgbGV0
IHN5c2xpbnV4IGRlcGVuZCBvbiBob3N0LXB5dGhvbjMuCgoKPiBUaGVyZSBpcyBhIG5ldyBpc3N1
ZSB3aXRoIHB5dGhvbi1hdHRycyB0ZXN0IHdoZW4gcHl0aG9uMiBpcyBub3QgaW5zdGFsbGVkOgo+
IGh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vam9icy8xNjE0NDQ2OTQzCj4g
aHR0cHM6Ly9naXRsYWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9qb2JzLzE2MTQ0NDY5MzkKCiAg
SSBzdXNwZWN0IHRoYXQgdGhhdCdzIGp1c3QgYmVjYXVzZSBweXRob24tYXR0cnMgbm8gbG9uZ2Vy
IHN1cHBvcnRzIHB5dGhvbjIuIEl0IApoYXBwZW5zIG9uIHRoZSBhdXRvYnVpbGRlcnMgYXMgd2Vs
bDoKCmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzE3NS8xNzVjMmRkODJk
ZDMwNWVkODhiNGQxNzgwYmQ4YzUyZTRmNjUxZGU1LwoKICBBbmQgSSBoYXZlIHRoZSBzYW1lIGZh
aWx1cmUgd2hlbiBJIGJ1aWxkIG9uIG15IGxhcHRvcCwgd2hpY2ggZG9lcyBoYXZlIHB5dGhvbjIg
Cmluc3RhbGxlZCAodGhvdWdoIC91c3IvYmluL3B5dGhvbiBpcyBweXRob24zKS4KCgo+IFN0cmFu
Z2UgcHl0aG9uIGlzc3VlIHdpdGggcmVmcG9saWN5LTIuMjAyMTA5MDggYnVpbGQ6Cj4gaHR0cHM6
Ly9naXRsYWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9qb2JzLzE2MTQ0NDY4MjYvCgogIEFyZSB5
b3Ugc3VyZSBpdCBpcyByZWxhdGVkIHRvIHB5dGhvbj8gSSBhbHNvIGdldCB0aGUgc2FtZSBlcnJv
ciB3aGVuIEkgYnVpbGQgCml0IGxvY2FsbHkgb24gbXkgbGFwdG9wLgoKCiAgUmVnYXJkcywKICBB
cm5vdXQKCj4gCj4gCj4gQnV0IHRoZSBpc3N1ZSBJIGhhZCB3aXRoIFRlc3RDaGVja1BhY2thZ2Ug
aXMgZml4ZWQgd2l0aCB0aGUgcmVjZW50IHN3aXRjaCB0bwo+IHB5dGhvbjMuCj4gCj4gaHR0cHM6
Ly9naXRsYWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9qb2JzLzE2MTQ0NDcyMzYKPiAKPiBXaXRo
IGFsbCBpc3N1ZXMgZml4ZWQ6Cj4gICAgQWNrZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5h
b3VyQGdtYWlsLmNvbT4KPiAgICBUZXN0ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3Vy
QGdtYWlsLmNvbT4KPiAKPiBCZXN0IHJlZ2FyZHMsCj4gUm9tYWluCj4gCj4+IC0tLQo+PiAgIC5n
aXRsYWItY2kueW1sIHwgMiArLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55bWwgYi8uZ2l0bGFi
LWNpLnltbAo+PiBpbmRleCBiZjlmMmRjYTZjLi4xNTBiOGVhYzFhIDEwMDY0NAo+PiAtLS0gYS8u
Z2l0bGFiLWNpLnltbAo+PiArKysgYi8uZ2l0bGFiLWNpLnltbAo+PiBAQCAtMSw3ICsxLDcgQEAK
Pj4gICAjIENvbmZpZ3VyYXRpb24gZm9yIEdpdGxhYi1DSS4KPj4gICAjIEJ1aWxkcyBhcHBlYXIg
b24gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290L3BpcGVsaW5lcwo+
PiAgIAo+PiAtaW1hZ2U6IGJ1aWxkcm9vdC9iYXNlOjIwMjAwODE0LjIyMjgKPj4gK2ltYWdlOiBi
dWlsZHJvb3QvYmFzZToyMDIxMDkyMi4yMjAwCj4+ICAgCj4+ICAgc3RhZ2VzOgo+PiAgICAgLSBn
ZW5lcmF0ZS1naXRsYWItY2kKPj4KPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
