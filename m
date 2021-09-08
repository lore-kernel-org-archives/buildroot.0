Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BB54C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 20:23:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F8B761139
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 20:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F8B761139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9C9240251;
	Wed,  8 Sep 2021 20:22:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QdbwhLOKXSC9; Wed,  8 Sep 2021 20:22:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B67D140265;
	Wed,  8 Sep 2021 20:22:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8A31BF870
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 20:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE4DF83434
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 20:22:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UfxtQ0EYBoqF for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 20:22:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B7A8A833B7
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 20:22:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso2445208wmi.5
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 13:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iQ3WUvAPFky1JhNWeKcIUooJPNc+wkvrIXjM7Dc+RDk=;
 b=eKK9DM6lS8QrC1+twzcXlbCmBIg++y5Jfk1J/TNq9+kUYbg9lyCHYA9wWQ0i6Z9Hg7
 AdbINp9NyE0QpVAt55Rsd0++Pl4DcIluMbA4F88HhUcnKEasqzfvHhwLpmXxwJl/v6BE
 FhpPQfMCaZC+/LEOAexosK6wZc+JNNvrBTTzADq9wTiyBdd/kaeTVAkQp6v9wDNXBC5Y
 KGvTDk29zBWQhD1EtXsMshlJU45N1fNhvgrDDINrye67n3nrreOUUVtXRRYB621OIXCh
 c7rvnnh4y5uw3FMYjj9jGMxZ+94eIJkWNWSLlP3wQxNrKxW1EXfEJp2fetJQ1LbB75xC
 FWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iQ3WUvAPFky1JhNWeKcIUooJPNc+wkvrIXjM7Dc+RDk=;
 b=WFocEx/gpyRfqlKYE3HvNPU+nJLZs/JJfccbI7cfTJ3wV8ByfXtKeJBwpVoNVs2uFO
 PSH1gL52cp1/doAQwflyMKyWOdth2NEvn922XHaDjTPPiv5KqN9EvELWssuMC3Go02Oi
 IAS26bIyhHdLDWxDmtW5VkZU58JlkPZBQU5l6sEFCOy0WPMQWKFwBkMhAo/Z3t8IcVCj
 n6at0KokzP2tUWqfw1aFmvtNrdDz39KeQ6ZsCfgkozca0JvOcUZEgG2PgBT/5ufsPLVl
 ZTHRclbIGVJs7nlFy0+tT12dG2N1g++Ji7hVizSx2umEmWz3e2sZydvGub0rhV7DJKjF
 9e7A==
X-Gm-Message-State: AOAM533G0x+H5gAOSLxuIRpVh0BbhpfCV6I3VGUecBQDTZgrDEXvKjDI
 dsA7naRzzQj7y+2DgFEJroo=
X-Google-Smtp-Source: ABdhPJzN3VScyYSPQ4vastj+ylKZwkBfhbHlbAE6pZx3vBRHZcBApGhMQQe1icnFVKZEzc2eb7JI8g==
X-Received: by 2002:a7b:c745:: with SMTP id w5mr5386916wmk.17.1631132573098;
 Wed, 08 Sep 2021 13:22:53 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce?
 (2a01cb058f8a180022164e4eb697b4ce.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:2216:4e4e:b697:b4ce])
 by smtp.gmail.com with ESMTPSA id u13sm144874wrg.68.2021.09.08.13.22.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Sep 2021 13:22:52 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20210905173446.44137-1-yann.morin.1998@free.fr>
 <20210905174402.GV1053080@scaer>
 <b8b5e5f2-5549-777d-1d94-c93fd21e9d4b@gmail.com>
Message-ID: <cc862f92-fa95-27ff-4643-6fa47e18b80d@gmail.com>
Date: Wed, 8 Sep 2021 22:22:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b8b5e5f2-5549-777d-1d94-c93fd21e9d4b@gmail.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH] package/e2fsprogs: bump version to fix
 regression
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
Cc: Kevin Tomary <kevin.tomary@hotmail.com>, Leon de Rooij <leon@exquisip.nl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

SGVsbG8gWWFubiwgQWxsLAoKTGUgMDgvMDkvMjAyMSDDoCAyMTo1NCwgUm9tYWluIE5hb3VyIGEg
w6ljcml0wqA6Cj4gSGVsbG8gWWFubiwgQWxsLAo+IAo+IExlIDA1LzA5LzIwMjEgw6AgMTk6NDQs
IFlhbm4gRS4gTU9SSU4gYSDDqWNyaXTCoDoKPj4gQWxsLAo+Pgo+PiBPbiAyMDIxLTA5LTA1IDE5
OjM0ICswMjAwLCBZYW5uIEUuIE1PUklOIHNwYWtlIHRodXNseToKPj4+IFZlcnNpb24gMS40Ni4z
IGhhZCBhIHJlZ3Jlc3Npb24sIHdoaWNoIG1lYW50IHRoZSBmaWxlIHRoYXQgd291bGQgc3RvcmUK
Pj4+IHRoZSBmaWxlc3lzdGVtIGltYWdlIGhhZCB0byBwcmUtZXhpc3QsIG9yIG1rZnMuZXh0MiB3
b3VsZCBmYWlsIHRvCj4+PiBnZW5lcmF0ZSB0aGUgZmlsZXN5c3RlbToKPj4+Cj4+PiAgICAgbWtm
cy5leHQ0OiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5IHdoaWxlIHRyeWluZyB0byBkZXRlcm1p
bmUKPj4+ICAgICBmaWxlc3lzdGVtIHNpemUKPj4+Cj4+PiBUaGUgcmVncmVzc2lvbiB3YXMgZml4
ZWQgdXBzdHJlYW0sIGFuZCBpcyBub3cgcGFydCBvZiB0aGUgMS40Ni40Cj4+PiByZWxlYXNlLCBz
byBidW1wIHRvIHRoYXQgcmVsZWFzZS4KPj4+Cj4+PiBGaXhlczogIzE0MTk2Cj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+Cj4+PiBS
ZXBvcnRlZC1ieTogS2V2aW4gVG9tYXJ5IDxrZXZpbi50b21hcnlAaG90bWFpbC5jb20+Cj4+PiBS
ZXBvcnRlZC1ieTogTGVvbiBkZSBSb29paiA8bGVvbkBleHF1aXNpcC5ubD4KPiAKPiBUaGVyZSBp
cyBhbm90aGVyIHJlZ3Jlc3Npb24gd2l0aCBlMmZzcHJvZyAxLjQ2LjQ6Cj4gCj4gaHR0cHM6Ly9n
aXRsYWIuY29tL2t1YnU5My9idWlsZHJvb3QvLS9qb2JzLzE1Njg2NzI5NDAKPiAKPiBXaXRoIHRo
ZSBmaXggYmFja3BvcnRlZCB0byAxLjQ2LjMgdGhlIGV4dDQgdGVzdCBpcyBvay4KPiAKPiBodHRw
czovL2dpdGh1Yi5jb20vdHl0c28vZTJmc3Byb2dzL2NvbW1pdC81MzQ2NDY1NGJkMzNlNThlM2Zm
ZjA3OWYzNDI2MWI4MjNkODM5ZjNiCgpBY3R1YWxseSB0aGVyZSBpcyBubyByZWdyZXNzaW9uLCBl
MmZzcHJvZ3MgZGVwcmVjYXRlZCBmaWxlc3lzdGVtcyB3aXRoIDEyOC1ieXRlCmlub2Rlcy4gTm93
IG1rZnMuZXh0NCB1c2UgMjU2LWJ5dGUgaW5vZGVzIGV2ZW4gZm9yIHNtYWxsIGZpbGVzeXN0ZW1z
LgoKaHR0cHM6Ly9naXRodWIuY29tL3R5dHNvL2UyZnNwcm9ncy9jb21taXQvYTIzYjUwY2RiNTVj
YjgyNmI4NzQ1Y2JjMzc0MjljOTNmN2I2MGM2NgoKV2UgaGF2ZSB0byB1cGRhdGUgb3VyIHRlc3Qu
CgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4gQmVzdCByZWdhcmRzLAo+IFJvbWFpbgo+IAo+
IAo+Pj4KPj4+IC0tLQo+Pj4gRm9yIHRoZSBzdGFibGUgYnJhbmNoIDIwMjEuMDgueCwgSSdsbCBz
ZW5kIGEgZGlmZmVyZW50IHBhdGNoLCB0aGF0IGp1c3QKPj4+IGJhY2twb3J0cyB0aGUgdXBzdHJl
YW0gZml4Lgo+Pgo+PiBJbiBmYWN0LCAyMDIxLjA4IHN0aWxsIGhhcyBlMmZzcHJvZ3MgMS40Ni4y
LCB3aGljaCBpcyBub3QgYWZmZWN0ZWQ7IHNvLAo+PiBubyBiYWNrcG9ydHMgbmVlZGVkLgo+Pgo+
PiBSZWdhcmRzLAo+PiBZYW5uIEUuIE1PUklOLgo+Pgo+Pj4gLS0tCj4+PiAgcGFja2FnZS9lMmZz
cHJvZ3MvZTJmc3Byb2dzLmhhc2ggfCAyICstCj4+PiAgcGFja2FnZS9lMmZzcHJvZ3MvZTJmc3By
b2dzLm1rICAgfCAyICstCj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZTJmc3Byb2dzL2UyZnNw
cm9ncy5oYXNoIGIvcGFja2FnZS9lMmZzcHJvZ3MvZTJmc3Byb2dzLmhhc2gKPj4+IGluZGV4IDM2
NjE4MDExOTkuLjYzYzdjOTkyOWYgMTAwNjQ0Cj4+PiAtLS0gYS9wYWNrYWdlL2UyZnNwcm9ncy9l
MmZzcHJvZ3MuaGFzaAo+Pj4gKysrIGIvcGFja2FnZS9lMmZzcHJvZ3MvZTJmc3Byb2dzLmhhc2gK
Pj4+IEBAIC0xLDUgKzEsNSBAQAo+Pj4gICMgRnJvbSBodHRwczovL21pcnJvcnMuZWRnZS5rZXJu
ZWwub3JnL3B1Yi9saW51eC9rZXJuZWwvcGVvcGxlL3R5dHNvL2UyZnNwcm9ncy92MS40Ni4zL3No
YTI1NnN1bXMuYXNjCj4+PiAtc2hhMjU2ICA4NmQxNTgwZmFjZGQ0OWYyZTBlNmIwMjdlMjZiMWU2
YzQ4YWY1Mzg3NjJkYzQwYWVlZDJhODcxNTNjMWYxMWI3ICBlMmZzcHJvZ3MtMS40Ni4zLnRhci54
ego+Pj4gK3NoYTI1NiAgYjExMDQyNTMzYzFiMWRjZjE3NTEyZjBkYTQ4ZTA1YjBjNTczZGFkYTFk
ZDhiNzYyODY0ZDEwZjRkYzM5OTcxMyAgZTJmc3Byb2dzLTEuNDYuNC50YXIueHoKPj4+ICAjIExv
Y2FsbHkgY2FsY3VsYXRlZAo+Pj4gIHNoYTI1NiAgNWRhNWVmMTUzZTU1OWMxZDk5MGQ0YzNlZWRi
ZWRkNDQ0MmRiODkyZDM3ZWFlMWYzNWZmZjA2OWRlOGVjOTAyMCAgTk9USUNFCj4+PiAgc2hhMjU2
ICAwMzI5ODliNTA4ZjFhNzJlYmVlNWIzNDE3ZTU1ZDA2ZDQ3M2Y5ZWUyMDNlNDVhYjExODY0YTdl
NDljZGVjNjNkICBsaWIvc3MvbWl0LXNpcGItY29weXJpZ2h0LmgKPj4+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2UyZnNwcm9ncy9lMmZzcHJvZ3MubWsgYi9wYWNrYWdlL2UyZnNwcm9ncy9lMmZzcHJv
Z3MubWsKPj4+IGluZGV4IDU1MjhlY2JjMzQuLmNhODkxMDY2YTIgMTAwNjQ0Cj4+PiAtLS0gYS9w
YWNrYWdlL2UyZnNwcm9ncy9lMmZzcHJvZ3MubWsKPj4+ICsrKyBiL3BhY2thZ2UvZTJmc3Byb2dz
L2UyZnNwcm9ncy5tawo+Pj4gQEAgLTQsNyArNCw3IEBACj4+PiAgIwo+Pj4gICMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjCj4+PiAgCj4+PiAtRTJGU1BST0dTX1ZFUlNJT04gPSAxLjQ2LjMKPj4+ICtF
MkZTUFJPR1NfVkVSU0lPTiA9IDEuNDYuNAo+Pj4gIEUyRlNQUk9HU19TT1VSQ0UgPSBlMmZzcHJv
Z3MtJChFMkZTUFJPR1NfVkVSU0lPTikudGFyLnh6Cj4+PiAgRTJGU1BST0dTX1NJVEUgPSAkKEJS
Ml9LRVJORUxfTUlSUk9SKS9saW51eC9rZXJuZWwvcGVvcGxlL3R5dHNvL2UyZnNwcm9ncy92JChF
MkZTUFJPR1NfVkVSU0lPTikKPj4+ICBFMkZTUFJPR1NfTElDRU5TRSA9IEdQTC0yLjAsIE1JVC1s
aWtlIHdpdGggYWR2ZXJ0aXNpbmcgY2xhdXNlIChsaWJzcyBhbmQgbGliZXQpCj4+PiAtLSAKPj4+
IDIuMjUuMQo+Pj4KPj4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGxpc3RzLmJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
