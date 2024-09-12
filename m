Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362FBEEB58D
	for <buildroot@archiver.kernel.org>; Thu, 12 Sep 2024 10:48:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2B65419B6;
	Thu, 12 Sep 2024 10:48:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHzsrMJdkE8d; Thu, 12 Sep 2024 10:48:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 601A341997
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 601A341997;
	Thu, 12 Sep 2024 10:48:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7BDF91BF2A1
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 10:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 781E781DF2
 for <buildroot@lists.busybox.net>; Thu, 12 Sep 2024 10:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0LasvO1kZYJ for <buildroot@lists.busybox.net>;
 Thu, 12 Sep 2024 10:48:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::530; helo=mail-ed1-x530.google.com;
 envelope-from=michael@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 39AA881CEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39AA881CEF
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39AA881CEF
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 10:48:37 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c255e3c327so917459a12.1
 for <buildroot@buildroot.org>; Thu, 12 Sep 2024 03:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726138115; x=1726742915;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oEvR6G1sNvuFBrIIs8JW/vBhZiLC99b7h6GZadPs2Kc=;
 b=eo896Ynst1U7NKRGw0IeojkI9tJRGxtTtOTIYdkurc9i043CNvyq87S9vIH98ygb1h
 FGtGKC8nZtPAmuz7tP8iOTTdWIIP3MuBj4M19ce1ZBltZBPTx8Py7mmA2i7pR9bQ914K
 UVk+oc27fMnbdM7eCXnJKU32f+P8XSIIQM8F6/NY8tOq6ZOyoq+UayDZAhnmc8aPuUPL
 nKQYuzwkR7b6IGq9tJRKkCI1S0O8dIlT2RJq6d52JsN8O1UJFc2wzCfO3hEY9EJspMAh
 MRWxEBVGJJqR8oY5zp8OMIOUQFN4mqENoDj9vl6Y+FvEijVlFtmZ77658MLtbHnvAqDF
 LJ/Q==
X-Gm-Message-State: AOJu0YzyqVA8XvqoXJSDylDa5/w4jBa6D3YVBxxBmQbdKKozyFyy1W6f
 vW/l3LXBr9A9G5r3Bn+B8hdSD1UrKkLypN5ShXOIe0cr6SKfKAX68wKN8RVlfY9bNtfrHDzz1D3
 llV4+GY8+OkRWoDMYOZAihnehUkI39gJrjH1ZwDa4IhpBD7JhOvk=
X-Google-Smtp-Source: AGHT+IGfR92Y8+Rhv2tpVgfaPd43kXuf3zBltTctM6lLvvLhrkN72QIoJmMhj87giS8iQLvwChk7yDxnJxms1hxjJZk=
X-Received: by 2002:a05:6402:1815:b0:5b9:df62:15cd with SMTP id
 4fb4d7f45d1cf-5c413e51610mr1331208a12.32.1726138103587; Thu, 12 Sep 2024
 03:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240903085745.2594893-1-michael@amarulasolutions.com>
 <20240912124441.1893644c@windsurf>
In-Reply-To: <20240912124441.1893644c@windsurf>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Thu, 12 Sep 2024 12:48:09 +0200
Message-ID: <CAOf5uw=3xNnoJh9Mr2X-kYprxB3WTmgvsCHX2ZF8DrFUhMgj_Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726138115; x=1726742915;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oEvR6G1sNvuFBrIIs8JW/vBhZiLC99b7h6GZadPs2Kc=;
 b=MKtejOm8fqboQ7khLhziWOzN4VIkGO52/UUEeV1ja8ADC6mCXKwZIgvPhwnFdKwBfH
 EJlL9KtnxyNSB8KQNorm7PVpJNCCCc4uO2XUlv78bptO2eE/GP0Fnu8XRjd8n0hkvVDt
 gbvn84JMeyxX9XYj8X5gT9HvDRRpPbgXjbKMk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=MKtejOm8
Subject: Re: [Buildroot] [PATCH V2 1/2] scripts/cve: Avoid to do a complete
 clone of cve git repository
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
Cc: linux-amarula@amarulasolutions.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzCgpPbiBUaHUsIFNlcCAxMiwgMjAyNCBhdCAxMjo0NOKAr1BNIFRob21hcyBQZXRh
enpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGVsbG8gTWlj
aGFlbCwKPgo+IE9uIFR1ZSwgIDMgU2VwIDIwMjQgMTA6NTc6NDQgKzAyMDAKPiBNaWNoYWVsIFRy
aW1hcmNoaSA8bWljaGFlbEBhbWFydWxhc29sdXRpb25zLmNvbT4gd3JvdGU6Cj4KPiA+IEp1c3Qg
YSBzaW1wbGUgY2xvbmUgYW5kIHB1bGwgd2l0aCAtLWRlcHRoIDEgc2hvdWxkIGJlIGVub3VnaCB0
byBwYXJzZSB0aGUKPiA+IGN2ZSBhbmQgZ2VuZXJhdGUgdGhlIHBrZy1zdGF0cyByZXBvcnQuCj4g
Pgo+ID4gRnJvbSBhIGZ1bGwgY2xvbmUgYW5kIGEgZGVwdGgtMSBjbG9uZSwgYW5kIHRoZSBzaXpl
IGRlbHRhIGlzIDIuOUdpQiB2cy4gMi4yR2lCLgo+ID4gVGhlIGRvd25sb2FkIHNpemUgZG9lcyBj
aGFuZ2U6IGZyb20gOTgzLjU1TWlCIGRvd24gdG8gMjcwLjc4TWlCLgo+ID4gaXQncyBhIG5ldCB0
aW1lIHdpbiB0b286IDJtMTdzIHZzIDFtaW43cyAob24gYSAxMDBNYnBzIGxpbmspLgo+ID4KPiA+
IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgVHJpbWFyY2hpIDxtaWNoYWVsQGFtYXJ1bGFzb2x1dGlv
bnMuY29tPgo+ID4gLS0tCj4gPiBWMS0+VjI6Cj4gPiAgICAgLSBBZGQgc3RhdGlzdGljcyBmcm9t
IFlhbm4gRS4gTW9yaW4KPiA+ICAgICAtIFVzZSBnaXQgcHVsbCAtLWRlcHRoIDEgZm9yIHVwZGF0
ZSB0aGUgcmVwbwo+Cj4gSSBhbSBzb3JyeSwgYnV0IEkgaGFkIHRvIHJldmVydCB0aGlzIGNvbW1p
dC4uLiBhcyBpdCBkb2Vzbid0IHdvcms6Cj4KPiBVcGRhdGluZyBmcm9tIGh0dHBzOi8vZ2l0aHVi
LmNvbS9ma2llLWNhZC9udmQtanNvbi1kYXRhLWZlZWRzLwo+IFRyYWNlYmFjayAobW9zdCByZWNl
bnQgY2FsbCBsYXN0KToKPiAgIEZpbGUgIi9ob21lL2J1aWxkcm9vdC9idWlsZHJvb3Qtc3RhdHMv
Li9zdXBwb3J0L3NjcmlwdHMvcGtnLXN0YXRzIiwgbGluZSAxMzQ2LCBpbiA8bW9kdWxlPgo+ICAg
ICBfX21haW5fXygpCj4gICBGaWxlICIvaG9tZS9idWlsZHJvb3QvYnVpbGRyb290LXN0YXRzLy4v
c3VwcG9ydC9zY3JpcHRzL3BrZy1zdGF0cyIsIGxpbmUgMTMzNSwgaW4gX19tYWluX18KPiAgICAg
Y2hlY2tfcGFja2FnZV9jdmVzKGFyZ3MubnZkX3BhdGgsIHBhY2thZ2VzKQo+ICAgRmlsZSAiL2hv
bWUvYnVpbGRyb290L2J1aWxkcm9vdC1zdGF0cy8uL3N1cHBvcnQvc2NyaXB0cy9wa2ctc3RhdHMi
LCBsaW5lIDY2MCwgaW4gY2hlY2tfcGFja2FnZV9jdmVzCj4gICAgIGZvciBjdmUgaW4gY3ZlY2hl
Y2suQ1ZFLnJlYWRfbnZkX2RpcihudmRfcGF0aCk6Cj4gICBGaWxlICIvaG9tZS9idWlsZHJvb3Qv
YnVpbGRyb290LXN0YXRzL3N1cHBvcnQvc2NyaXB0cy9jdmUucHkiLCBsaW5lIDEwNSwgaW4gcmVh
ZF9udmRfZGlyCj4gICAgIENWRS5kb3dubG9hZF9udmQobnZkX2dpdF9kaXIpCj4gICBGaWxlICIv
aG9tZS9idWlsZHJvb3QvYnVpbGRyb290LXN0YXRzL3N1cHBvcnQvc2NyaXB0cy9jdmUucHkiLCBs
aW5lIDc0LCBpbiBkb3dubG9hZF9udmQKPiAgICAgc3VicHJvY2Vzcy5jaGVja19jYWxsKAo+ICAg
RmlsZSAiL3Vzci9saWIvcHl0aG9uMy4xMS9zdWJwcm9jZXNzLnB5IiwgbGluZSA0MTMsIGluIGNo
ZWNrX2NhbGwKPiAgICAgcmFpc2UgQ2FsbGVkUHJvY2Vzc0Vycm9yKHJldGNvZGUsIGNtZCkKPiBz
dWJwcm9jZXNzLkNhbGxlZFByb2Nlc3NFcnJvcjogQ29tbWFuZCAnWydnaXQnLCAncHVsbCcsICct
LWRlcHRoJywgJzEnXScgcmV0dXJuZWQgbm9uLXplcm8gZXhpdCBzdGF0dXMgMTI4Lgo+Cj4gaWYg
SSBnbyB0byB0aGUgbWFjaGluZSBpbiBxdWVzdGlvbjoKPgo+IGJ1aWxkcm9vdEBidWlsZHJvb3Q6
fi9udmQvZ2l0JCBnaXQgcHVsbCAtLWRlcHRoIDEKPiByZW1vdGU6IEVudW1lcmF0aW5nIG9iamVj
dHM6IDE2NCwgZG9uZS4KPiByZW1vdGU6IENvdW50aW5nIG9iamVjdHM6IDEwMCUgKDE0MC8xNDAp
LCBkb25lLgo+IHJlbW90ZTogQ29tcHJlc3Npbmcgb2JqZWN0czogMTAwJSAoMjcvMjcpLCBkb25l
Lgo+IHJlbW90ZTogVG90YWwgNjMgKGRlbHRhIDU0KSwgcmV1c2VkIDQ0IChkZWx0YSAzNiksIHBh
Y2stcmV1c2VkIDAgKGZyb20gMCkKPiBVbnBhY2tpbmcgb2JqZWN0czogMTAwJSAoNjMvNjMpLCAx
OC4xNSBLaUIgfCAyNi4wMCBLaUIvcywgZG9uZS4KPiBGcm9tIGh0dHBzOi8vZ2l0aHViLmNvbS9m
a2llLWNhZC9udmQtanNvbi1kYXRhLWZlZWRzCj4gICsgNTFiMDkxYTZhNC4uLjdiNjkyMzU5NzYg
bWFpbiAgICAgICAtPiBvcmlnaW4vbWFpbiAgKGZvcmNlZCB1cGRhdGUpCj4gaGludDogWW91IGhh
dmUgZGl2ZXJnZW50IGJyYW5jaGVzIGFuZCBuZWVkIHRvIHNwZWNpZnkgaG93IHRvIHJlY29uY2ls
ZSB0aGVtLgo+IGhpbnQ6IFlvdSBjYW4gZG8gc28gYnkgcnVubmluZyBvbmUgb2YgdGhlIGZvbGxv
d2luZyBjb21tYW5kcyBzb21ldGltZSBiZWZvcmUKPiBoaW50OiB5b3VyIG5leHQgcHVsbDoKPiBo
aW50Ogo+IGhpbnQ6ICAgZ2l0IGNvbmZpZyBwdWxsLnJlYmFzZSBmYWxzZSAgIyBtZXJnZQo+IGhp
bnQ6ICAgZ2l0IGNvbmZpZyBwdWxsLnJlYmFzZSB0cnVlICAgIyByZWJhc2UKPiBoaW50OiAgIGdp
dCBjb25maWcgcHVsbC5mZiBvbmx5ICAgICAgICMgZmFzdC1mb3J3YXJkIG9ubHkKPiBoaW50Ogo+
IGhpbnQ6IFlvdSBjYW4gcmVwbGFjZSAiZ2l0IGNvbmZpZyIgd2l0aCAiZ2l0IGNvbmZpZyAtLWds
b2JhbCIgdG8gc2V0IGEgZGVmYXVsdAo+IGhpbnQ6IHByZWZlcmVuY2UgZm9yIGFsbCByZXBvc2l0
b3JpZXMuIFlvdSBjYW4gYWxzbyBwYXNzIC0tcmViYXNlLCAtLW5vLXJlYmFzZSwKPiBoaW50OiBv
ciAtLWZmLW9ubHkgb24gdGhlIGNvbW1hbmQgbGluZSB0byBvdmVycmlkZSB0aGUgY29uZmlndXJl
ZCBkZWZhdWx0IHBlcgo+IGhpbnQ6IGludm9jYXRpb24uCj4gZmF0YWw6IE5lZWQgdG8gc3BlY2lm
eSBob3cgdG8gcmVjb25jaWxlIGRpdmVyZ2VudCBicmFuY2hlcy4KPgo+IEkgaGFkIGFscmVhZHkg
ZG9uZSBhIGdpdCByZXNldCAtLWhhcmQsIGFuZCBzZWUgaWYgaXQgd2FzIGp1c3QgYQo+IG9uZS10
aW1lIGlzc3VlLCBidXQgbm9wZS4gU28gdGhlcmUncyBzb21ldGhpbmcgdGhhdCBkb2Vzbid0IHdv
cmsgaGVyZS4KPgo+IEluIGNhc2UgdGhhdCBtYXR0ZXJzLCB0aGlzIG1hY2hpbmUgaGFzOgo+Cj4g
JCBnaXQgLS12ZXJzaW9uCj4gZ2l0IHZlcnNpb24gMi4zOS4yCj4KClllcyBzb3JyeSwgSSBhbHdh
eXMgdXNlIHRvb2xzIHRoYXQgYXJlIHRoZSBsYXRlc3QsICBnaXQgdmVyc2lvbiAyLjQzLjAKCk1h
a2Ugc2Vuc2UuIEkgd2lsbCBjcmVhdGUgYSBiZXR0ZXIgc2V0dXAgZm9yIG1lCgoKTWljaGFlbAoK
PiBCZXN0IHJlZ2FyZHMsCj4KPiBUaG9tYXMgUGV0YXp6b25pCj4gLS0KPiBUaG9tYXMgUGV0YXp6
b25pLCBDVE8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
Cj4gaHR0cHM6Ly9ib290bGluLmNvbQoKCgotLSAKTWljaGFlbCBOYXp6YXJlbm8gVHJpbWFyY2hp
CkNvLUZvdW5kZXIgJiBDaGllZiBFeGVjdXRpdmUgT2ZmaWNlcgpNLiArMzkgMzQ3IDkxMyAyMTcw
Cm1pY2hhZWxAYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwoKQW1hcnVsYSBTb2x1dGlvbnMgQlYKSm9vcCBHZWVzaW5rd2VnIDEyNSwgMTExNCBB
QiwgQW1zdGVyZGFtLCBOTApULiArMzEgKDApODUgMTExIDkxNzIKaW5mb0BhbWFydWxhc29sdXRp
b25zLmNvbQp3d3cuYW1hcnVsYXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
