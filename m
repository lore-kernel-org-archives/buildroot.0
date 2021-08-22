Return-Path: <SRS0=qqE2=NN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA637C4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 21:44:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 589896125F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 21:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 589896125F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1187780D8C;
	Sun, 22 Aug 2021 21:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FrlrhQWtUNie; Sun, 22 Aug 2021 21:43:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A15DB80D94;
	Sun, 22 Aug 2021 21:43:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 707071BF471
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 21:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 606F440301
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 21:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2nwiyWVNPBq6 for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 21:43:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 569BE40300
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 21:43:51 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so9476304wml.3
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 14:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FqaxCMEx2s8C/rzs5nJ7+DZeqzUjIZuzvnTVL8KGDG4=;
 b=p7He6MlrtX9vi2oGgsRUxzZK9MPJ/eTH2AUXsb1InjU3Od33Hh3EfYf8zT4RhP9Akv
 RdIJ4i4NsoXW+Bwvekwfcj12q4aRKhg+0Ea3oFQV2L7gAy4talyFmn77um6+O3jUGVuZ
 dLp9Di+NssrJlv8XYTLcy1+xSPvkKIOpxCuDe5lUn4TjePuJu5Gpvs96r/tmvfNo/Oj4
 z/cCZtorAb7vsbFO0ooIX/LVeig/ndw1nnL9ekshrXghRDeyvdnk87lHi/jU1T1pPcuu
 pxGO2HutVkz9Liaf9nBl0HoGCCWpdxPgt15qpXijolzvyTZTXjicqzeYoFx6vAWp4D9n
 reMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FqaxCMEx2s8C/rzs5nJ7+DZeqzUjIZuzvnTVL8KGDG4=;
 b=XVn39ktbsf72MiNAa5DdgNqgNkWd/m20bj4TijSqt3SOwxwLFk5UjBwRyp4WuEJQLR
 W5VYmaDs+vfpHwG2QyAqYqG/TOAmxGhZ2GcL84p5G/9L5sdpE3nRI6hhwNoB2PbDU8UJ
 sgmrCpw0O1yym3fYN2NdP+ossIck+SIM6PA4O3rOKqeaWnhr8f5nBTLlTRHBQAyvgr7H
 mDqdk20p3jcL0KDKhpoHrHO8qjB9zYQIUJglzqpWTJjYEWrdvgia2obFPcx7J8f2c8Q+
 vbL+Q6W1iEbs8rjv8qXWMeyTuaYWRdTm7i/4lICl/M4YxOSQyDBMPTEruI3ObBaqJ+qJ
 XflA==
X-Gm-Message-State: AOAM530S+tieu28lE7O0JhLGpiwVRuxoa0AomdJfQS0/GV75Bt1VhwWe
 tHPKGdtLMIFxPIthrBqy+SQ=
X-Google-Smtp-Source: ABdhPJwkU7SjY7X+HseKxJi/EybMALobTjye94t+jQmIw41sw569rkAO7rdo/6pHBjQKMAzitmFhZA==
X-Received: by 2002:a1c:2504:: with SMTP id l4mr13511656wml.55.1629668629454; 
 Sun, 22 Aug 2021 14:43:49 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id n10sm12757566wms.3.2021.08.22.14.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 14:43:48 -0700 (PDT)
To: =?UTF-8?Q?Jos=c3=a9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
References: <20210822200519.1757151-1-salvador.joseluis@gmail.com>
 <e25ad303-2283-20c4-5ce6-c893bf38376d@gmail.com>
 <CAH+XeQbHj4sHiUmf3rc1PFHb+BbpLEb4KDbKwkef-7UfDB9=Fg@mail.gmail.com>
 <a6320c62-a68d-6433-9f3b-9e1df87a5c39@gmail.com>
 <CAH+XeQawHERfudB2Hxd8VGpRyckSzQOCjbpGpVg=+bpskzJUsw@mail.gmail.com>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <cb4c98eb-2f52-1d8a-942e-550ad425e767@gmail.com>
Date: Sun, 22 Aug 2021 23:43:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAH+XeQawHERfudB2Hxd8VGpRyckSzQOCjbpGpVg=+bpskzJUsw@mail.gmail.com>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH] package/zfs: Fix cross-platform-compilations
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Philippe Serbruyns <Philippe.Serbruyns@ugent.be>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

TGUgMjIvMDgvMjAyMSDDoCAyMzoyNywgSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIGEgw6ljcml0
wqA6Cj4gSGVsbG8gUm9tYWluIE5hb3VyLAo+IAo+IEVsIGRvbSwgMjIgYWdvIDIwMjEgYSBsYXMg
MjI6NTIsIFJvbWFpbiBOYW91ciAoPHJvbWFpbi5uYW91ckBnbWFpbC5jb20KPiA8bWFpbHRvOnJv
bWFpbi5uYW91ckBnbWFpbC5jb20+PikgZXNjcmliacOzOgo+IAo+ICAgICBIZWxsbyBKb3PDqSBM
dWlzLAo+IAo+ICAgICBMZSAyMi8wOC8yMDIxIMOgIDIyOjM4LCBKb3PDqSBMdWlzIFNhbHZhZG9y
IFJ1Zm8gYSDDqWNyaXTCoDoKPiAgICAgPiBIZWxsbyBSb21haW4sCj4gICAgID4KPiAgICAgPiBF
bCBkb20sIDIyIGFnbyAyMDIxIGEgbGFzIDIyOjI3LCBSb21haW4gTmFvdXIgKDxyb21haW4ubmFv
dXJAZ21haWwuY29tCj4gICAgIDxtYWlsdG86cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4KPiAgICAg
PiA8bWFpbHRvOnJvbWFpbi5uYW91ckBnbWFpbC5jb20gPG1haWx0bzpyb21haW4ubmFvdXJAZ21h
aWwuY29tPj4+KSBlc2NyaWJpw7M6Cj4gICAgID4KPiAgICAgPsKgIMKgIMKgSGVsbG8gSm9zw6kg
THVpcywKPiAgICAgPgo+ICAgICA+wqAgwqAgwqBMZSAyMi8wOC8yMDIxIMOgIDIyOjA1LCBKb3PD
qSBMdWlzIFNhbHZhZG9yIFJ1Zm8gYSDDqWNyaXTCoDoKPiAgICAgPsKgIMKgIMKgPiBUaGlzIHBh
dGNoIGZpeGVzIHRoZSBgbWFrZWAgZXhlY3V0ZWQgZnJvbSB0aGUgYGtlcm5lbC5tNGAgaW4KPiAg
ICAgPsKgIMKgIMKgPiBjcm9zcy1wbGF0Zm9ybS1jb21waWxhdGlvbnMgZW52aXJvbm1lbnRzOgo+
ICAgICA+wqAgwqAgwqA+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9ibG9iL3pmcy0y
LjAuNS9jb25maWcva2VybmVsLm00I0w1ODgKPiAgICAgPGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVu
emZzL3pmcy9ibG9iL3pmcy0yLjAuNS9jb25maWcva2VybmVsLm00I0w1ODg+Cj4gICAgID7CoCDC
oCDCoDxodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvYmxvYi96ZnMtMi4wLjUvY29uZmln
L2tlcm5lbC5tNCNMNTg4Cj4gICAgIDxodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvYmxv
Yi96ZnMtMi4wLjUvY29uZmlnL2tlcm5lbC5tNCNMNTg4Pj4KPiAgICAgPsKgIMKgIMKgPgo+ICAg
ICA+wqAgwqAgwqA+IFNpZ25lZC1vZmYtYnk6IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2Fs
dmFkb3Iuam9zZWx1aXNAZ21haWwuY29tCj4gICAgIDxtYWlsdG86c2FsdmFkb3Iuam9zZWx1aXNA
Z21haWwuY29tPgo+ICAgICA+wqAgwqAgwqA8bWFpbHRvOnNhbHZhZG9yLmpvc2VsdWlzQGdtYWls
LmNvbSA8bWFpbHRvOnNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4+Pgo+ICAgICA+wqAgwqAg
wqA+IC0tLQo+ICAgICA+wqAgwqAgwqA+IEhlbGxvIGFsbC4KPiAgICAgPsKgIMKgIMKgPgo+ICAg
ICA+wqAgwqAgwqA+IEBSb21haW4gTmFvdXIsIHRoaXMgcGF0Y2ggd2lsbCBmaXggdGhlIGJ1aWxk
cm9vdCBnaXRsYWIgQ0kuCj4gICAgID4KPiAgICAgPsKgIMKgIMKgSW5kZWVkIGl0IGZpeCB0aGUg
aXNzdWUhCj4gICAgID4KPiAgICAgPsKgIMKgIMKgVGVzdGVkLWJ5OiBSb21haW4gTmFvdXIgPHJv
bWFpbi5uYW91ckBnbWFpbC5jb20KPiAgICAgPG1haWx0bzpyb21haW4ubmFvdXJAZ21haWwuY29t
PiA8bWFpbHRvOnJvbWFpbi5uYW91ckBnbWFpbC5jb20KPiAgICAgPG1haWx0bzpyb21haW4ubmFv
dXJAZ21haWwuY29tPj4+Cj4gICAgID4KPiAgICAgPsKgIMKgIMKgPgo+ICAgICA+wqAgwqAgwqA+
IEBQaGlsaXBwZSBTZXJicnV5bnMswqB0aGlzIHBhdGNoIHdpbGwgZml4IHlvdXIgaXNzdWUgd2l0
aCB5b3VyIHJwaTQuCj4gICAgID7CoCDCoCDCoD4KPiAgICAgPsKgIMKgIMKgPsKgIHBhY2thZ2Uv
emZzL3pmcy5tayA8aHR0cDovL3pmcy5taz4gPGh0dHA6Ly96ZnMubWsgPGh0dHA6Ly96ZnMubWs+
Pgo+ICAgICB8IDEzICsrKysrKysrKysrKysKPiAgICAgPsKgIMKgIMKgPsKgIDEgZmlsZSBjaGFu
Z2VkLCAxMyBpbnNlcnRpb25zKCspCj4gICAgID7CoCDCoCDCoD4KPiAgICAgPsKgIMKgIMKgPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMvemZzLm1rIDxodHRwOi8vemZzLm1rPiA8aHR0cDovL3pm
cy5tawo+ICAgICA8aHR0cDovL3pmcy5taz4+IGIvcGFja2FnZS96ZnMvemZzLm1rIDxodHRwOi8v
emZzLm1rPgo+ICAgICA+wqAgwqAgwqA8aHR0cDovL3pmcy5tayA8aHR0cDovL3pmcy5taz4+Cj4g
ICAgID7CoCDCoCDCoD4gaW5kZXggM2IxYWZiNDE5YS4uMjQwNjRjYmE4MiAxMDA2NDQKPiAgICAg
PsKgIMKgIMKgPiAtLS0gYS9wYWNrYWdlL3pmcy96ZnMubWsgPGh0dHA6Ly96ZnMubWs+IDxodHRw
Oi8vemZzLm1rIDxodHRwOi8vemZzLm1rPj4KPiAgICAgPsKgIMKgIMKgPiArKysgYi9wYWNrYWdl
L3pmcy96ZnMubWsgPGh0dHA6Ly96ZnMubWs+IDxodHRwOi8vemZzLm1rIDxodHRwOi8vemZzLm1r
Pj4KPiAgICAgPsKgIMKgIMKgPiBAQCAtMTMsNiArMTMsMTkgQEAgWkZTX0NQRV9JRF9QUk9EVUNU
ID0gb3Blbnpmcwo+ICAgICA+wqAgwqAgwqA+wqAKPiAgICAgPsKgIMKgIMKgPsKgIFpGU19BVVRP
UkVDT05GID0gWUVTCj4gICAgID7CoCDCoCDCoD7CoAo+ICAgICA+wqAgwqAgwqA+ICsjIGNyb3Nz
IGNvbXBpbGUgZW52aXJvbm1lbnQgZm9yIGxpbnV4IGtlcm5lbCBtb2R1bGUKPiAgICAgPsKgIMKg
IMKgPiArWkZTX01BS0VfRU5WID0gXAo+ICAgICA+wqAgwqAgwqA+ICvCoCDCoCDCoEhPU1RDQz0i
JChIT1NUQ0MpICQoSE9TVF9DRkxBR1MpICQoSE9TVF9MREZMQUdTKSIgXAo+ICAgICA+wqAgwqAg
wqA+ICvCoCDCoCDCoEFSQ0g9JChLRVJORUxfQVJDSCkgXAo+ICAgICA+wqAgwqAgwqA+ICvCoCDC
oCDCoENST1NTX0NPTVBJTEU9IiQoVEFSR0VUX0NST1NTKSIgXAo+ICAgICA+wqAgwqAgwqA+ICvC
oCDCoCDCoERFUE1PRD0kKEhPU1RfRElSKS9zYmluL2RlcG1vZAo+ICAgICA+Cj4gICAgID7CoCDC
oCDCoFlvdSBjYW4gcmVwbGFjZSBhbGwgNCBsaW5lcyB3aXRoICQoTElOVVhfTUFLRV9GTEFHUykg
aGVyZSBpbnN0ZWFkLgo+ICAgICA+Cj4gICAgID4gU29ycnksIHlvdSBjYW4gbm90LsKgTElOVVhf
TUFLRV9GTEFHUyBpbmNsdWRlc8KgSU5TVEFMTF9NT0RfUEFUSCwgYW5kIG11c3QgYmUKPiAgICAg
PiBlbXB0eSBmb3Iga2VybmVsIG1vZHVsZXMuIElmIHdlIHVzZSBMSU5VWF9NQUtFX0ZMQUdTLCB0
aGUgbW9kdWxlIG91dHB1dAo+ICAgICB3aWxsIGJlCj4gICAgID4gVEFSR0VUX0RJUi9JTlNUQUxM
X01PRF9QQVRILCBhcyB5b3UgY2FuIHNlZSBpbiBwa2ctZ2VuZXJpYy5tawo+ICAgICA8aHR0cDov
L3BrZy1nZW5lcmljLm1rPgo+ICAgICA+IDxodHRwOi8vcGtnLWdlbmVyaWMubWsgPGh0dHA6Ly9w
a2ctZ2VuZXJpYy5taz4+IGF0IGxpbmUgNzcuIEkgYWxyZWFkeSBsb3N0Cj4gICAgIH4xLTJoIGJl
Y2F1c2Ugb2YgdGhpcyA6LSguCj4gCj4gICAgIFRoaXMgY2hlY2sgYWxsb3cgdG8gZGV0ZWN0IGlz
c3VlcyBvbiBhIGJ1aWxkIHN5c3RlbS4KPiAgICAgT3RoZXIgcGFja2FnZXMgYnVpbGRpbmcgYW4g
b3V0IG9mIHRyZWUga2VybmVsIG1vZHVsZSBpcyBhYmxlIHRvIHVzZQo+ICAgICBMSU5VWF9NQUtF
X0ZMQUdTIChleGNlcHQgbGludXgtZnVzaW9uKS4KPiAKPiAgICAgPiDCoAo+ICAgICA+IFRoZSBh
bHRlcm5hdGl2ZSB0byB1c2luZyAkKExJTlVYX01BS0VfRkxBR1MpIGlzIGVtcHR5IHRoZcKgSU5T
VEFMTF9NT0RfUEFUSCBhcwo+ICAgICA+IGZvbGxvd3M6Cj4gICAgID4gWkZTX01BS0VfRU5WID0g
XAo+ICAgICA+IMKgIMKgIMKgJChMSU5VWF9NQUtFX0ZMQUdTKSBcCj4gICAgID4gwqAgwqAgwqBJ
TlNUQUxMX01PRF9QQVRIPQo+ICAgICA+Cj4gICAgID4gV2hhdCBkbyB5b3UgcHJlZmVyPwo+IAo+
ICAgICBJZiBwb3NzaWJsZSwgYSB6ZnMgcGF0Y2guCj4gCj4gSGVyZSBpcyB0aGUgInByb2JsZW0i
Ogo+IAo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9ibG9iL3pmcy0yLjAuNS9tb2R1
bGUvTWFrZWZpbGUuaW4jTDc5Cj4gPGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9ibG9i
L3pmcy0yLjAuNS9tb2R1bGUvTWFrZWZpbGUuaW4jTDc5Pgo+PiBJTlNUQUxMX01PRF9QQVRIPSQo
REVTVERJUikkKElOU1RBTExfTU9EX1BBVEgpCgpUaGlzIGlzIHRoZSBwcm9ibGVtLiBJIGd1ZXNz
IHlvdSBoYXZlIHRvIHJlbW92ZSBERVNURElSIHdoZW4gdXNlZCB3aXRoCklOU1RBTExfTU9EX1BB
VEguCgo+IAo+IGFuZAo+IAo+IGh0dHBzOi8vZ2l0LmJ1aWxkcm9vdC5uZXQvYnVpbGRyb290L3Ry
ZWUvcGFja2FnZS9wa2ctZ2VuZXJpYy5taz9oPTIwMjEuMDgtcmMyI243NyA8aHR0cHM6Ly9naXQu
YnVpbGRyb290Lm5ldC9idWlsZHJvb3QvdHJlZS9wYWNrYWdlL3BrZy1nZW5lcmljLm1rP2g9MjAy
MS4wOC1yYzIjbjc3Pgo+PsKgJChpZiAkKGZpbHRlciBlbmQsJCgxKSksJChjYWxsIHN0ZXBfY2hl
Y2tfYnVpbGRfZGlyX29uZSwkKDMpLCQoVEFSR0VUX0RJUikvJChPKSkpKQo+IAo+IEJ1aWxkcm9v
dCBhbHJlYWR5IGRvZXMgdGhhdCwgc28gd2hlbiBgbWFrZSBtb2R1bGVzX2luc3RhbGxgIGlzIGV4
ZWN1dGVkLCB0aGUKPiBvdXRwdXQgbW9kdWxlcyBkaXJlY3Rvcnkgd2lsbCBiZSBUQVJHRVRfRElS
L1RBUkdFVF9ESVIvSU5TVEFMTF9NT0RfUEFUSC4KPiAKPiBJIGhhdmUgbm8gaWRlYSB3aG8gaXPC
oHRoZSBvbmUgdGhhdCBtdXN0IGNoYW5nZSBpdHMgYmVoYXZpb3IuIDotKAo+IEFueSBzdWdnZXN0
aW9ucyBvbiBob3cgdG8gcHJvY2VlZD8KPiAKPiBNYXliZSBJIGNhbiB1bmV4cG9ydCBERVNURElS
IGJlZm9yZSBgbWFrZSBtb2R1bGVzX2luc3RhbGxgLi4uCgpZZXMsIERFU1RESVIgaXMgc29tZXRp
bWUgbWlzcyB1c2VkIChzZWUgYnVpbGRyb290IGdpdGxvZyBmb3IgZXhhbXBsZSkuCgpJdCdzIGEg
YnVnIGlmIERFU1RESVIgYW5kIElOU1RBTExfTU9EX1BBVEggYXJlIHVzZWQgdG9nZXRoZXI6Cgpo
dHRwczovL3d3dy5nbnUub3JnL3ByZXAvc3RhbmRhcmRzL2h0bWxfbm9kZS9ERVNURElSLmh0bWwK
Cmh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvZG9jL0RvY3VtZW50YXRpb24va2J1aWxkL21vZHVsZXMu
dHh0IChJTlNUQUxMX01PRF9QQVRIKQoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IEF0dGFj
aGVkIGFsdGVybmF0aXZlIHBhdGNoIHdpdGggTElOVVhfTUFLRV9GTEFHUyBhbmQgZW1wdHkgSU5T
VEFMTF9NT0RfUEFUSC4KPiAKPiAKPiAgICAgT3RoZXJ3aXNlIEkgd291bGQgc3VnZ2VzdCB0byBh
ZGQgYSBjb21tZW50IGFib3V0IHRoZSByZWFzb24gd2h5IExJTlVYX01BS0VfRkxBR1MKPiAgICAg
Y2FuJ3QgYmUgdXNlZC4KPiAKPiAgICAgQmVzdCByZWdhcmRzLAo+ICAgICBSb21haW4KPiAKPiAK
PiAgICAgPgo+ICAgICA+Cj4gICAgID7CoCDCoCDCoD4gKyMgYC4vY29uZmlndXJlYCB3aWxsIGV4
ZWN1dGUgYSBgbWFrZSBtb2R1bGVzYCB0ZXN0IGNhc2UKPiAgICAgPsKgIMKgIMKgPiArWkZTX0NP
TkZfRU5WID0gXAo+ICAgICA+wqAgwqAgwqA+ICvCoCDCoCDCoEhPU1RDQz0iJChIT1NUQ0MpICQo
SE9TVF9DRkxBR1MpICQoSE9TVF9MREZMQUdTKSIgXAo+ICAgICA+wqAgwqAgwqA+ICvCoCDCoCDC
oEFSQ0g9JChLRVJORUxfQVJDSCkgXAo+ICAgICA+wqAgwqAgwqA+ICvCoCDCoCDCoENST1NTX0NP
TVBJTEU9IiQoVEFSR0VUX0NST1NTKSIgXAo+ICAgICA+wqAgwqAgwqA+ICvCoCDCoCDCoERFUE1P
RD0kKEhPU1RfRElSKS9zYmluL2RlcG1vZAo+ICAgICA+Cj4gICAgID7CoCDCoCDCoFNhbWUgaGVy
ZS4KPiAgICAgPgo+ICAgICA+Cj4gICAgID4KPiAgICAgPsKgIMKgIMKgPiArCj4gICAgID7CoCDC
oCDCoD7CoCBaRlNfREVQRU5ERU5DSUVTID0gbGliYWlvIG9wZW5zc2wgdWRldiB1dGlsLWxpbnV4
IHpsaWIKPiAgICAgPsKgIMKgIMKgPsKgCj4gICAgID7CoCDCoCDCoD7CoCAjIHN5c3Zpbml0IGlu
c3RhbGxzIG9ubHkgYSBjb21tZW50ZWQtb3V0IG1vZHVsZXMtbG9hZC5kLyBjb25maWcgZmlsZQo+
ICAgICA+wqAgwqAgwqA+Cj4gICAgID4KPiAKPiAKPiBHcmVldGluZ3MhwqAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
