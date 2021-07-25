Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78836C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:14:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0EFE60F3A
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 15:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0EFE60F3A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1E5140137;
	Sun, 25 Jul 2021 15:14:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPB93HmoSatT; Sun, 25 Jul 2021 15:14:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 012B540147;
	Sun, 25 Jul 2021 15:14:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 659751BF41F
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 558DB83096
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 15:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xXmmBZ5hQKp3 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 15:14:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4B618308A
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 15:14:10 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gt31so11873578ejc.12
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 08:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:cc:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=417m5dlRFa1AOjNYZRBI6wQ/Uo5CsFeFZ4wn1vMkSg0=;
 b=HVE4sEYTg4v3VIjsx1iTFzWBQ/q9ML2ho5mf4P2P3qa3/WBDLon36khkdzuhMb4SVd
 wHMZYTPEbCBQTuUxqY/8VVQxTZ/wQG01hp56Q0WvARR1H9BNgLLmcpNo46PNlR8hdpqk
 5/iz4OHa3njDwBBbJsUn2WCiAczs8u3KT0OnRhJjPzOwQvzioXdhrGwO1O8ERY2eHXTQ
 qCye02xH9/byF0nbQWSW1vXhimETexc+HwyY7s/dvAr8paTQSRgW7oNMZxrI91fdHQyG
 cIkYHX7sT3BZ+hIPncu4v4Uh+/ee8U1quaCpzg/iKG3zUHoDC41iiW4qIZ0k0Ht1inOa
 2kpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=417m5dlRFa1AOjNYZRBI6wQ/Uo5CsFeFZ4wn1vMkSg0=;
 b=lHhb0PltJbFnaMk8a8nNis4tYlOnNS1SnT7eJpxv1CVbavxoqBw5ljnvmxvEvzutvT
 fENb/JrMuhL8MgOdeKgJeCQZ9xt4/a1SxFGIPTI2dJRvvcWziScBH0N+ewC+SmLyHrXN
 e0yIYJEZZo/gBKDVAeiCOoJjha5Mjo9SG2TekPnuCDirfjVF9uU9MwIUYyszUkbEj8oJ
 xx273TxOnIz+jlY9OFxWI347pnQJwpaYKbfhPmYQkaJbpgwiwMTLX8ArDCMynPljLdwp
 +m0V2kpgVhJ5jMCq8O7/o3fD51zGuKbaBMzreL07W3GV0087bUalHdbmMYOymL5CretO
 UaCA==
X-Gm-Message-State: AOAM5329KcRTRBOBEaOdB6H4/JeSaVDemiVuusZXxRR76WFvPEVb2fe1
 Shv8voZSlRiQj11q7BRVegXn3Q==
X-Google-Smtp-Source: ABdhPJyUceqrBIZNwOs2perZGfM8tCE1D5qkaRGsLJoxIUtWiTqYYCz9yw3tssJpcfPghOGCwwevHg==
X-Received: by 2002:aa7:dd8d:: with SMTP id g13mr16725215edv.336.1627226048571; 
 Sun, 25 Jul 2021 08:14:08 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d19sm17668880eds.54.2021.07.25.08.14.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 08:14:08 -0700 (PDT)
To: David Owens <david.owens@rockwellcollins.com>, buildroot@buildroot.org
References: <20200210205637.125367-1-david.owens@rockwellcollins.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <8b437e23-8583-c7c7-80bd-a467ce582bf6@mind.be>
Date: Sun, 25 Jul 2021 17:14:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20200210205637.125367-1-david.owens@rockwellcollins.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH v2] package/faketime: add target variant
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
Cc: Matthew Weber <matthew.weber@rockwellcollins.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAxMC8wMi8yMDIwIDIxOjU2LCBEYXZpZCBPd2VucyB3cm90ZToKPiBBZGQgZmFrZXRpbWUg
c3VwcG9ydCBmb3IgdGFyZ2V0IGJ1aWxkcy4gIEZha2Ugc3RhdCBzdXBwb3J0IGlzIGRpc2FibGVk
Cj4gb24gdGFyZ2V0cyB1c2luZyBnbGliYyB0byBwcmV2ZW50IHN5bWJvbCBjb2xsaXNpb25zIGZv
ciB0aGUgc3RhdDY0Cj4gZmFtaWx5IG9mIGZ1bmN0aW9ucy4KPiAKPiBUaGUgaW5jbHVkZWQgcGF0
Y2ggZmlsZSB3YXMgYWNjZXB0ZWQgYnkgdGhlIGZha2V0aW1lIGF1dGhvciBidXQgaGFzIHlldAo+
IHRvIGJlIGludGVncmF0ZWQgaW50byBhIHRhZ2dlZCByZWxlYXNlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IERhdmlkIE93ZW5zIDxkYXZpZC5vd2Vuc0Byb2Nrd2VsbGNvbGxpbnMuY29tPgoKIEkgd2Fz
IChmaW5hbGx5KSBnb2luZyB0byBhcHBseSwgYnV0IGl0IGRvZXNuJ3QgYnVpbHQgYW55IG1vcmUg
Oi0oCgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9mYWtldGltZS8wMDAxLVdyYXAtdXNlcl9wZXJf
dGlja19pbmNfc2V0X2JhY2t1cC1kZWNsYXJhdGlvbi1pbi1pZmQucGF0Y2ggYi9wYWNrYWdlL2Zh
a2V0aW1lLzAwMDEtV3JhcC11c2VyX3Blcl90aWNrX2luY19zZXRfYmFja3VwLWRlY2xhcmF0aW9u
LWluLWlmZC5wYXRjaAoKIFRoaXMgcGF0Y2ggd2FzIG1lcmdlZCB1cHN0cmVhbSBhbmQgd2UgYnVt
cGVkIHRoZSB2ZXJzaW9uLCBzbyBpdCdzIG5vIGxvbmdlciBuZWVkZWQuCgogSG93ZXZlci4uLgoK
W3NuaXBdCj4gK2lmZXEgKCQoQlIyX1RPT0xDSEFJTl9VU0VTX0dMSUJDKSx5KQo+ICtGQUtFVElN
RV9DRkxBR1M9Ii1VRkFLRV9TVEFUIgoKIC4uLiBJdCBzdGlsbCBmYWlscyB0byBidWlsZCB3aXRo
IC1VRkFLRV9TVEFULiBUaGlzIHRpbWUgd2l0aCBlcnJvcnMgbGlrZQoKbGliZmFrZXRpbWUuYzog
SW4gZnVuY3Rpb24g4oCYdXRpbWXigJk6CmxpYmZha2V0aW1lLmM6MTEzMzo3OiBlcnJvcjog4oCY
ZmFrZV91dGltZV9kaXNhYmxlZOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcwpmdW5j
dGlvbikKIDExMzMgfCAgIGlmIChmYWtlX3V0aW1lX2Rpc2FibGVkKQogICAgICB8ICAgICAgIF5+
fn5+fn5+fn5+fn5+fn5+fn4KCgogU28gdGhpcyB0aW1lLCB0aGUgc2FtZSBraW5kIG9mIHBhdGNo
IHNob3VsZCBiZSBkb25lIGZvciBmYWtlX3V0aW1lX2Rpc2FibGVkLgoKIEdpdmVuIHRoYXQgdXBz
dHJlYW0gZG9lc24ndCBzZWVtIHRvIGJlIG1haW50YWluaW5nIC1VRkFLRV9TVEFUIHZlcnkgd2Vs
bCwKd291bGRuJ3QgaXQgYmUgYW4gb3B0aW9uIHRvIGp1c3QgbWFrZSBpdCB3b3JrIGZvciBzdGF0
NjQ/CgogQWxzbywgdGhpcyBzaG91bGQgaGF2ZSBiZWVuOgoKRkFLRVRJTUVfQ0ZMQUdTID0gJChU
QVJHRVRfQ0ZMQUdTKQoKaWZlcSAoJChCUjJfVE9PTENIQUlOX1VTRVNfR0xJQkMpLHkpCkZBS0VU
SU1FX0NGTEFHUyArPSAtVUZBS0VfU1RBVAplbmRpZgoKKG5vdGUgdGhlIHNwYWNlcyBhcm91bmQg
Jz0nKQoKCj4gK2VuZGlmCj4gKwo+ICtkZWZpbmUgRkFLRVRJTUVfQlVJTERfQ01EUwo+ICsJJChU
QVJHRVRfQ09ORklHVVJFX09QVFMpICQoTUFLRSkgLUMgJChARCkgUFJFRklYPSQoVEFSR0VUX0RJ
UikgXAo+ICsJCUZBS0VUSU1FX0NPTVBJTEVfQ0ZMQUdTPSQoRkFLRVRJTUVfQ0ZMQUdTKQoKIEFu
ZCB0aGUgcXVvdGVzIHNob3VsZCBiZSBhZGRlZCBoZXJlLgoKCiBSZWdhcmRzLAogQXJub3V0Cgo+
ICtlbmRlZgo+ICsKPiArZGVmaW5lIEZBS0VUSU1FX0lOU1RBTExfVEFSR0VUX0NNRFMKPiArCSQo
VEFSR0VUX0NPTkZJR1VSRV9PUFRTKSAkKE1BS0UpIC1DICQoQEQpIFBSRUZJWD0kKFRBUkdFVF9E
SVIpIGluc3RhbGwKPiArZW5kZWYKPiArCj4gIGRlZmluZSBIT1NUX0ZBS0VUSU1FX0JVSUxEX0NN
RFMKPiAgCSQoSE9TVF9DT05GSUdVUkVfT1BUUykgJChNQUtFKSAtQyAkKEBEKSBQUkVGSVg9JChI
T1NUX0RJUikKPiAgZW5kZWYKPiBAQCAtMTcsNCArMzAsNSBAQCBkZWZpbmUgSE9TVF9GQUtFVElN
RV9JTlNUQUxMX0NNRFMKPiAgCSQoSE9TVF9DT05GSUdVUkVfT1BUUykgJChNQUtFKSAtQyAkKEBE
KSBQUkVGSVg9JChIT1NUX0RJUikgaW5zdGFsbAo+ICBlbmRlZgo+ICAKPiArJChldmFsICQoZ2Vu
ZXJpYy1wYWNrYWdlKSkKPiAgJChldmFsICQoaG9zdC1nZW5lcmljLXBhY2thZ2UpKQo+IApfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8vbGlzdHMuYnVzeWJveC5uZXQv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
