Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F49EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 07:36:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89699612FE;
	Thu, 13 Jul 2023 07:36:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89699612FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gP_k6nE9F9rY; Thu, 13 Jul 2023 07:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3D63612F0;
	Thu, 13 Jul 2023 07:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3D63612F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6B5B11BF397
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43D69612F0
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:36:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43D69612F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gss_Hh00AxHZ for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 07:36:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12A25611A4
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12A25611A4
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 07:36:36 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b734aea34aso5319331fa.0
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 00:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689233794; x=1691825794;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EAID1osQlSTED8poufbiCFILdo5tg35OxYs6h5JhMSk=;
 b=R1UEZrOGzgTKjynh6+k9ZsMtnoLDiXyXJbigV4kyaf/c0qdv2eoZmXLUaui2EU+CVE
 LKGcMw1Rj56dbaBsOxSLRFKjzToCg9KueHloQ+kKTge8bl2EPs3i0byPqceGVwFxPEhG
 NGTZ7VVWGQcg0hLVIfhTfWNHFyBqCawT4RKC+Og63JBIs2cklHv2g6uUK/y++9AmOD+V
 B3qGAHGXB6ZCQnrU0T/UVcwsqam2Ua8NBlQZ2FF483Xw/sHBmuAwWi91AWrUzhJeIihu
 CjHPJ+wOfEeMPNrXpchoJnTeS5PkCratkWCrAqBXiZkmUJoz/HAdlBXA7gtRDL6klINk
 b6kQ==
X-Gm-Message-State: ABy/qLagYHHN/1GRXN+z2iImSfUkfmtw8qmYi0oq5KGOgylmueZHqaMK
 Uy3H6Og2MsiO6Dwdd9m8ZyrXAA==
X-Google-Smtp-Source: APBJJlHagtkXIW1ULlHJFUBqNqe+Se54iSAPb9saM/pxtsgEItay3jeBQEEcTbcN35VoKgXk8M7zwg==
X-Received: by 2002:a2e:8189:0:b0:2b6:d700:fbdd with SMTP id
 e9-20020a2e8189000000b002b6d700fbddmr678454ljg.15.1689233793988; 
 Thu, 13 Jul 2023 00:36:33 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 q10-20020adfdfca000000b003144b95e1ecsm7040499wrn.93.2023.07.13.00.36.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 00:36:33 -0700 (PDT)
Message-ID: <18ad1be4-69f1-382b-47f2-a7b7ceab8610@smile.fr>
Date: Thu, 13 Jul 2023 09:36:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: fr
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20230609174955.409551-1-romain.naour@gmail.com>
 <20230712214357.2e04f24d@windsurf> <20230712214613.32816a8f@windsurf>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20230712214613.32816a8f@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1689233794; x=1691825794;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EAID1osQlSTED8poufbiCFILdo5tg35OxYs6h5JhMSk=;
 b=5doK9kHMvJLz7GsSfwL0vkr+uyK/LwQCsbG/x9QRV8NNl8ac4MoQ2ePwcG3ZnLfiAg
 /cJrrSaSiCdB32U2P0tPfSpH8LrFCU8dUqi4sp9WMzY51KgyA1NdpKJw2IEc4khuonEb
 8qR3rw8tjoJ+dJWr90uPcsdTiK6oo46nGYlfV9xvnr4qawC+9ynKriu51F+N+hU7GNmi
 BJxvQV2iJK6g3Qe1/lBm4oZkuG/K5BoPUhO/8b7O35ONGk4hKe64W6oOMbyVKcd6BJ6o
 z/P+ZgLyGNXjYCc2P2ClRMI01qC73RhHl1Xxe9segRF0obK/qSaCkwlJOLkohjE1RhHM
 h9pQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=5doK9kHM
Subject: Re: [Buildroot] [PATCH 1/4] support/testing: add python-mako
 runtime test
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLCBBbGwsCgpMZSAxMi8wNy8yMDIzIMOgIDIxOjQ2LCBUaG9tYXMgUGV0YXp6
b25pIHZpYSBidWlsZHJvb3QgYSDDqWNyaXTCoDoKPiBPbiBXZWQsIDEyIEp1bCAyMDIzIDIxOjQz
OjU3ICswMjAwCj4gVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNv
bT4gd3JvdGU6Cj4gCj4+IEkgbWlnaHQgbm90IGhhdmUgZ3Jhc3BlZCB0aGUgZnVsbCBzY2FsZSBv
ZiB0aGUgaXNzdWUsIGJ1dCBteSBmZWVsaW5nIGlzCj4+IHRoYXQ6Cj4+Cj4+IC0gcHl0aG9uLW1h
a28gbmVlZHMgbWFya3Vwc2FmZSB1bmNvbmRpdGlvbmFsbHksIGFzIGRlbW9uc3RyYXRlZCBieSB5
b3VyCj4+ICAgdGVzdCBUZXN0UHl0aG9uUHkzTWFrby4gU28gcHl0aG9uLW1ha28gc2hvdWxkIHVu
Y29uZGl0aW9uYWxseSBzZWxlY3QKPj4gICBCUjJfUEFDS0FHRV9QWVRIT05fTUFSS1VQU0FGRQo+
Pgo+PiAtIHB5dGhvbi1tYWtvIG9ubHkgbmVlZHMgcHlnbWVudHMvYmFiZWwgYXMgb3B0aW9uYWwg
ZGVwZW5kZW5jaWVzIHNvCj4+ICAgeW91ciBwYXRjaGVzIDIvNCBhbmQgMy80IGFyZSBmaW5lCj4+
Cj4+IC0gaW4gb3JkZXIgdG8gZml4IGJ1ZyAjMTU2MjgsIHdlIG5lZWQgdG8gZW5zdXJlIHRoYXQg
dGhlIHBpZ2xpdCBwYWNrYWdlCj4+ICAgc2VsZWN0cyBCUjJfUEFDS0FHRV9QWVRIT05fTUFLT19F
WFRfUFlHTUVOVFBMVUdJTiwgc28gdGhhdAo+PiAgIHB5dGhvbi1tYWtvIGlzIGluc3RhbGxlZCB3
aXRoIHB5Z21lbnRzIHN1cHBvcnQKPj4KPj4gRG9lcyB0aGF0IG1ha2Ugc2Vuc2UgPwo+IAo+IEkg
Z290IGl0IHdyb25nLCB5b3VyIGJhc2ljIHRlc3Qgc2hvd3MgdGhhdCBib3RoIHB5Z21lbnRzIGFu
ZCBtYXJrdXBzYWZlCj4gYXJlIG5lZWRlZCBmb3IgYSBiYXNpYyB1c2FnZSBvZiBweXRob24tbWFr
bzoKPiAKPiAkIC4vc3VwcG9ydC90ZXN0aW5nL3J1bi10ZXN0cyAtbyAuLi9vdXRwdXRzLyAtayB0
ZXN0cy5wYWNrYWdlLnRlc3RfcHl0aG9uX21ha28uVGVzdFB5dGhvblB5M01ha28KPiAyMTozMjow
NCBUZXN0UHl0aG9uUHkzTWFrbyAgICAgICAgICAgICAgICAgICAgICAgIFN0YXJ0aW5nCj4gMjE6
MzI6MDQgVGVzdFB5dGhvblB5M01ha28gICAgICAgICAgICAgICAgICAgICAgICBCdWlsZGluZwo+
IDIxOjM0OjU1IFRlc3RQeXRob25QeTNNYWtvICAgICAgICAgICAgICAgICAgICAgICAgQnVpbGRp
bmcgZG9uZQo+IDIxOjM1OjAxIFRlc3RQeXRob25QeTNNYWtvICAgICAgICAgICAgICAgICAgICAg
ICAgQ2xlYW5pbmcgdXAKPiBGCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQo+IEZBSUw6IHRlc3RfcnVuICh0ZXN0
cy5wYWNrYWdlLnRlc3RfcHl0aG9uX21ha28uVGVzdFB5dGhvblB5M01ha28pCj4gLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQo+IFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKPiAgIEZpbGUgIi9ob21l
L3Rob21hcy9idWlsZHJvb3QvYnVpbGRyb290L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdl
L3Rlc3RfcHl0aG9uLnB5IiwgbGluZSAxMzcsIGluIHRlc3RfcnVuCj4gICAgIHNlbGYucnVuX3Nh
bXBsZV9zY3JpcHRzKCkKPiAgIEZpbGUgIi9ob21lL3Rob21hcy9idWlsZHJvb3QvYnVpbGRyb290
L3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uLnB5IiwgbGluZSAxMzIs
IGluIHJ1bl9zYW1wbGVfc2NyaXB0cwo+ICAgICBzZWxmLmFzc2VydFJ1bk9rKGNtZCwgdGltZW91
dD1zZWxmLnRpbWVvdXQpCj4gICBGaWxlICIvaG9tZS90aG9tYXMvYnVpbGRyb290L2J1aWxkcm9v
dC9zdXBwb3J0L3Rlc3RpbmcvaW5mcmEvYmFzZXRlc3QucHkiLCBsaW5lIDk1LCBpbiBhc3NlcnRS
dW5Pawo+ICAgICBzZWxmLmFzc2VydEVxdWFsKAo+IEFzc2VydGlvbkVycm9yOiAxICE9IDAgOiAK
PiBGYWlsZWQgdG8gcnVuOiBweXRob24gc2FtcGxlX3B5dGhvbl9tYWtvLnB5Cj4gb3V0cHV0IHdh
czoKPiAgIFRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToKPiAgICAgRmlsZSAiL3Vz
ci9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL21ha28vZXhjZXB0aW9ucy5weSIsIGxpbmUg
Mjg3LCBpbiBfaW5zdGFsbF9oaWdobGlnaHRpbmcKPiAgICAgRmlsZSAiL3Vzci9saWIvcHl0aG9u
My4xMS9zaXRlLXBhY2thZ2VzL21ha28vZXhjZXB0aW9ucy5weSIsIGxpbmUgMjcxLCBpbiBfaW5z
dGFsbF9weWdtZW50cwo+ICAgICBGaWxlICIvdXNyL2xpYi9weXRob24zLjExL3NpdGUtcGFja2Fn
ZXMvbWFrby9leHQvcHlnbWVudHBsdWdpbi5weSIsIGxpbmUgNywgaW4gPG1vZHVsZT4KPiAgIE1v
ZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAncHlnbWVudHMnCj4gICAKPiAgIER1
cmluZyBoYW5kbGluZyBvZiB0aGUgYWJvdmUgZXhjZXB0aW9uLCBhbm90aGVyIGV4Y2VwdGlvbiBv
Y2N1cnJlZDoKPiAgIAo+ICAgVHJhY2ViYWNrIChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOgo+ICAg
ICBGaWxlICIvcm9vdC9zYW1wbGVfcHl0aG9uX21ha28ucHkiLCBsaW5lIDEsIGluIDxtb2R1bGU+
Cj4gICAgICAgZnJvbSBtYWtvIGltcG9ydCBydW50aW1lCj4gICAgIEZpbGUgIi91c3IvbGliL3B5
dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcy9tYWtvL3J1bnRpbWUucHkiLCBsaW5lIDE1LCBpbiA8bW9k
dWxlPgo+ICAgICBGaWxlICIvdXNyL2xpYi9weXRob24zLjExL3NpdGUtcGFja2FnZXMvbWFrby9l
eGNlcHRpb25zLnB5IiwgbGluZSAyOTIsIGluIDxtb2R1bGU+Cj4gICAgIEZpbGUgIi91c3IvbGli
L3B5dGhvbjMuMTEvc2l0ZS1wYWNrYWdlcy9tYWtvL2V4Y2VwdGlvbnMucHkiLCBsaW5lIDI4OSwg
aW4gX2luc3RhbGxfaGlnaGxpZ2h0aW5nCj4gICAgIEZpbGUgIi91c3IvbGliL3B5dGhvbjMuMTEv
c2l0ZS1wYWNrYWdlcy9tYWtvL2V4Y2VwdGlvbnMucHkiLCBsaW5lIDI3NywgaW4gX2luc3RhbGxf
ZmFsbGJhY2sKPiAgICAgRmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMS9zaXRlLXBhY2thZ2VzL21h
a28vZmlsdGVycy5weSIsIGxpbmUgMTQsIGluIDxtb2R1bGU+Cj4gICBNb2R1bGVOb3RGb3VuZEVy
cm9yOiBObyBtb2R1bGUgbmFtZWQgJ21hcmt1cHNhZmUnCj4gCj4gLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+IFJh
biAxIHRlc3QgaW4gMTc3LjE1N3MKPiAKPiBGQUlMRUQgKGZhaWx1cmVzPTEpCj4gCj4gU28gdG8g
bWUgaXQgbG9va3MgbGlrZSB0aGUgcGF0Y2ggZnJvbSBTZWJhc3RpYW4gaXMgY29ycmVjdCwgYW5k
Cj4gdGhlcmVmb3JlIHlvdXIgUEFUQ0ggMi80IGFkZGluZyBhbiBvcHRpb24gdG8gZW5hYmxlIHB5
Z21lbnRzIHN1cHBvcnQKPiBkb2VzIG5vdCBtYWtlIHNlbnNlIGJlY2F1c2UgcHlnbWVudHMgaXMg
bmVlZGVkIHVuY29uZGl0aW9uYWxseSBieQo+IHB5dGhvbi1tYWtvLgo+IAo+IFRob3VnaHRzPwoK
QWN0dWFsbHkgdGhlIHBhdGNoIGZyb20gU2ViYXN0aWFuIHNob3VsZCBiZSBwYXJ0IG9mIHRoaXMg
c2VyaWVzIGJ1dCB3aXRob3V0CnNlbGVjdGluZyBweWdtZW50cy4KCkl0J3MgdW5jbGVhciBmb3Ig
bWUgaWYgcHlnbWVudHMgYW5kIGJhYmVsIGFyZSByZWFsbHkgbWFuZGF0b3J5IHJ1bnRpbWUKZGVw
ZW5kZW5jaWVzIG9mIG1ha28uIEluZGVlZCwgcHlnbWVudHMgYW5kIGJhYmVsIGFyZSB1c2VkIGJ5
ICJtYWtvIGV4dGVuc2lvbiIKYW5kIG1heSBub3QgYmUgdXNlZCBhdCBhbGwgd2hlbiB1c2luZyBw
eXRob24tbWFrby4KCkRvIHdlIHJlYWxseSB3YW50IHRvIGhhbmRsZSBzdWNoICJtYWtvIGV4dGVu
c2lvbiIgPwoKT3RoZXJ3aXNlLCBJJ20gZmluZSB0byBhZGQgdGhlbSBhcyBydW50aW1lIGRlcGVu
ZGVuY2llcyBvZiBtYWtvLgoKQmVzdCByZWdhcmRzLApSb21haW4KCj4gCj4gVGhvbWFzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
