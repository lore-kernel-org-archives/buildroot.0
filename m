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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93AFAC4338F
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 20:52:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25D5D6120C
	for <buildroot@archiver.kernel.org>; Sun, 22 Aug 2021 20:52:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25D5D6120C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3B63606BB;
	Sun, 22 Aug 2021 20:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pp_wUM68Ni-j; Sun, 22 Aug 2021 20:52:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3768F606C6;
	Sun, 22 Aug 2021 20:52:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 168521BF44C
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 20:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 064CE606C6
 for <buildroot@lists.busybox.net>; Sun, 22 Aug 2021 20:52:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gISRipb8-xLA for <buildroot@lists.busybox.net>;
 Sun, 22 Aug 2021 20:52:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 292A3606BB
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 20:52:04 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id q10so23129159wro.2
 for <buildroot@buildroot.org>; Sun, 22 Aug 2021 13:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fh9432KbcnE6Ci0wAbeoccpfeR+UHi8WqPHgOuEdCnU=;
 b=NuH0hl5ugwvWDifwyTjRCFo5hiaKVYG+vuTjqwR9rxBV3jPNhHRpjyXfwPc/NSieZK
 MD4juOWdrk5y43wRcMe0uS/f/p/6LNoO9+JU4QqckHqfzPL89XvQr/0iXuzDJXqFOWMd
 0Qw63i7156hew2S6Q5Tq6mdKck7pZmd0JAicsmy7IFW0dPSroXvRYicmlwhDE6onIhN4
 w1iC+QF3NiY9W5umfSv+JFY52FxeCwQlMcaumC/iPtm5GC6h7gOYjGOjSO4jz3VStmPW
 Mg5FyqgragylAbMknJhcvf7/9EqlcQp5YKAVGXzwIFmyXs0UkCnqAZV776XLddWMZ+Lm
 9JPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fh9432KbcnE6Ci0wAbeoccpfeR+UHi8WqPHgOuEdCnU=;
 b=iaDNI5BcE6whLOq7gLUAvFA/gQw6SmhdHcLX2xCdW+lgLr7OjNKvjUb9k4wrh4QlrC
 U8BcoMOyNuG7CkxjIh7i6PZ6E1EqJgmwR7n4JU3MW/RMvsNR6xd4ZnFjWRa8B11Ldyk8
 QJ21jusPjVyuaU0Vi44oWDY+krWXX0r19G1pa+767Demsr/B8nOZ3DS5j1kQ3rpJ6ObJ
 0oVRy3Hbzo6Ezb3HDLvetFCAdS8GHb2VmxF158INWJcPCmJ+m5MtjO6SuLfGz1NhDVhA
 jneJOgeS32UokHW1tZ7UvfaPMgFA/uHexcnaCbZVsevLfViQe/pTUzrBgH2WYo2XkKQS
 v6Rg==
X-Gm-Message-State: AOAM533dUsC32lTijTtosbsLy0o5HpyzIFyCA2B1XBu4Dcew5t7AOa7I
 IVS3+ozBgMPw0jQLetfQKhQ=
X-Google-Smtp-Source: ABdhPJyizWtcYBUx83fuN+3SxMfuaf1uHeAlD70k7LHMrnuQTfaztx9wXobbjAxmz9hUGAIzYbOjEw==
X-Received: by 2002:a05:6000:2c3:: with SMTP id
 o3mr10006792wry.133.1629665522336; 
 Sun, 22 Aug 2021 13:52:02 -0700 (PDT)
Received: from ?IPv6:2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91?
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id q10sm10993940wmq.12.2021.08.22.13.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 13:52:01 -0700 (PDT)
To: =?UTF-8?Q?Jos=c3=a9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
References: <20210822200519.1757151-1-salvador.joseluis@gmail.com>
 <e25ad303-2283-20c4-5ce6-c893bf38376d@gmail.com>
 <CAH+XeQbHj4sHiUmf3rc1PFHb+BbpLEb4KDbKwkef-7UfDB9=Fg@mail.gmail.com>
From: Romain Naour <romain.naour@gmail.com>
Message-ID: <a6320c62-a68d-6433-9f3b-9e1df87a5c39@gmail.com>
Date: Sun, 22 Aug 2021 22:52:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAH+XeQbHj4sHiUmf3rc1PFHb+BbpLEb4KDbKwkef-7UfDB9=Fg@mail.gmail.com>
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

SGVsbG8gSm9zw6kgTHVpcywKCkxlIDIyLzA4LzIwMjEgw6AgMjI6MzgsIEpvc8OpIEx1aXMgU2Fs
dmFkb3IgUnVmbyBhIMOpY3JpdMKgOgo+IEhlbGxvIFJvbWFpbiwKPiAKPiBFbCBkb20sIDIyIGFn
byAyMDIxIGEgbGFzIDIyOjI3LCBSb21haW4gTmFvdXIgKDxyb21haW4ubmFvdXJAZ21haWwuY29t
Cj4gPG1haWx0bzpyb21haW4ubmFvdXJAZ21haWwuY29tPj4pIGVzY3JpYmnDszoKPiAKPiAgICAg
SGVsbG8gSm9zw6kgTHVpcywKPiAKPiAgICAgTGUgMjIvMDgvMjAyMSDDoCAyMjowNSwgSm9zw6kg
THVpcyBTYWx2YWRvciBSdWZvIGEgw6ljcml0wqA6Cj4gICAgID4gVGhpcyBwYXRjaCBmaXhlcyB0
aGUgYG1ha2VgIGV4ZWN1dGVkIGZyb20gdGhlIGBrZXJuZWwubTRgIGluCj4gICAgID4gY3Jvc3Mt
cGxhdGZvcm0tY29tcGlsYXRpb25zIGVudmlyb25tZW50czoKPiAgICAgPiBodHRwczovL2dpdGh1
Yi5jb20vb3Blbnpmcy96ZnMvYmxvYi96ZnMtMi4wLjUvY29uZmlnL2tlcm5lbC5tNCNMNTg4Cj4g
ICAgIDxodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvYmxvYi96ZnMtMi4wLjUvY29uZmln
L2tlcm5lbC5tNCNMNTg4Pgo+ICAgICA+Cj4gICAgID4gU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVp
cyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20KPiAgICAgPG1haWx0
bzpzYWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Pgo+ICAgICA+IC0tLQo+ICAgICA+IEhlbGxv
IGFsbC4KPiAgICAgPgo+ICAgICA+IEBSb21haW4gTmFvdXIsIHRoaXMgcGF0Y2ggd2lsbCBmaXgg
dGhlIGJ1aWxkcm9vdCBnaXRsYWIgQ0kuCj4gCj4gICAgIEluZGVlZCBpdCBmaXggdGhlIGlzc3Vl
IQo+IAo+ICAgICBUZXN0ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNv
bSA8bWFpbHRvOnJvbWFpbi5uYW91ckBnbWFpbC5jb20+Pgo+IAo+ICAgICA+Cj4gICAgID4gQFBo
aWxpcHBlIFNlcmJydXlucyzCoHRoaXMgcGF0Y2ggd2lsbCBmaXggeW91ciBpc3N1ZSB3aXRoIHlv
dXIgcnBpNC4KPiAgICAgPgo+ICAgICA+wqAgcGFja2FnZS96ZnMvemZzLm1rIDxodHRwOi8vemZz
Lm1rPiB8IDEzICsrKysrKysrKysrKysKPiAgICAgPsKgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNl
cnRpb25zKCspCj4gICAgID4KPiAgICAgPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS96ZnMvemZzLm1r
IDxodHRwOi8vemZzLm1rPiBiL3BhY2thZ2UvemZzL3pmcy5tawo+ICAgICA8aHR0cDovL3pmcy5t
az4KPiAgICAgPiBpbmRleCAzYjFhZmI0MTlhLi4yNDA2NGNiYTgyIDEwMDY0NAo+ICAgICA+IC0t
LSBhL3BhY2thZ2UvemZzL3pmcy5tayA8aHR0cDovL3pmcy5taz4KPiAgICAgPiArKysgYi9wYWNr
YWdlL3pmcy96ZnMubWsgPGh0dHA6Ly96ZnMubWs+Cj4gICAgID4gQEAgLTEzLDYgKzEzLDE5IEBA
IFpGU19DUEVfSURfUFJPRFVDVCA9IG9wZW56ZnMKPiAgICAgPsKgCj4gICAgID7CoCBaRlNfQVVU
T1JFQ09ORiA9IFlFUwo+ICAgICA+wqAKPiAgICAgPiArIyBjcm9zcyBjb21waWxlIGVudmlyb25t
ZW50IGZvciBsaW51eCBrZXJuZWwgbW9kdWxlCj4gICAgID4gK1pGU19NQUtFX0VOViA9IFwKPiAg
ICAgPiArwqAgwqAgwqBIT1NUQ0M9IiQoSE9TVENDKSAkKEhPU1RfQ0ZMQUdTKSAkKEhPU1RfTERG
TEFHUykiIFwKPiAgICAgPiArwqAgwqAgwqBBUkNIPSQoS0VSTkVMX0FSQ0gpIFwKPiAgICAgPiAr
wqAgwqAgwqBDUk9TU19DT01QSUxFPSIkKFRBUkdFVF9DUk9TUykiIFwKPiAgICAgPiArwqAgwqAg
wqBERVBNT0Q9JChIT1NUX0RJUikvc2Jpbi9kZXBtb2QKPiAKPiAgICAgWW91IGNhbiByZXBsYWNl
IGFsbCA0IGxpbmVzIHdpdGggJChMSU5VWF9NQUtFX0ZMQUdTKSBoZXJlIGluc3RlYWQuCj4gCj4g
U29ycnksIHlvdSBjYW4gbm90LsKgTElOVVhfTUFLRV9GTEFHUyBpbmNsdWRlc8KgSU5TVEFMTF9N
T0RfUEFUSCwgYW5kIG11c3QgYmUKPiBlbXB0eSBmb3Iga2VybmVsIG1vZHVsZXMuIElmIHdlIHVz
ZSBMSU5VWF9NQUtFX0ZMQUdTLCB0aGUgbW9kdWxlIG91dHB1dCB3aWxsIGJlCj4gVEFSR0VUX0RJ
Ui9JTlNUQUxMX01PRF9QQVRILCBhcyB5b3UgY2FuIHNlZSBpbiBwa2ctZ2VuZXJpYy5tawo+IDxo
dHRwOi8vcGtnLWdlbmVyaWMubWs+IGF0IGxpbmUgNzcuIEkgYWxyZWFkeSBsb3N0IH4xLTJoIGJl
Y2F1c2Ugb2YgdGhpcyA6LSguCgpUaGlzIGNoZWNrIGFsbG93IHRvIGRldGVjdCBpc3N1ZXMgb24g
YSBidWlsZCBzeXN0ZW0uCk90aGVyIHBhY2thZ2VzIGJ1aWxkaW5nIGFuIG91dCBvZiB0cmVlIGtl
cm5lbCBtb2R1bGUgaXMgYWJsZSB0byB1c2UKTElOVVhfTUFLRV9GTEFHUyAoZXhjZXB0IGxpbnV4
LWZ1c2lvbikuCgo+IMKgCj4gVGhlIGFsdGVybmF0aXZlIHRvIHVzaW5nICQoTElOVVhfTUFLRV9G
TEFHUykgaXMgZW1wdHkgdGhlwqBJTlNUQUxMX01PRF9QQVRIIGFzCj4gZm9sbG93czoKPiBaRlNf
TUFLRV9FTlYgPSBcCj4gwqAgwqAgwqAkKExJTlVYX01BS0VfRkxBR1MpIFwKPiDCoCDCoCDCoElO
U1RBTExfTU9EX1BBVEg9Cj4gCj4gV2hhdCBkbyB5b3UgcHJlZmVyPwoKSWYgcG9zc2libGUsIGEg
emZzIHBhdGNoLgoKT3RoZXJ3aXNlIEkgd291bGQgc3VnZ2VzdCB0byBhZGQgYSBjb21tZW50IGFi
b3V0IHRoZSByZWFzb24gd2h5IExJTlVYX01BS0VfRkxBR1MKY2FuJ3QgYmUgdXNlZC4KCkJlc3Qg
cmVnYXJkcywKUm9tYWluCgoKPiAKPiAKPiAgICAgPiArIyBgLi9jb25maWd1cmVgIHdpbGwgZXhl
Y3V0ZSBhIGBtYWtlIG1vZHVsZXNgIHRlc3QgY2FzZQo+ICAgICA+ICtaRlNfQ09ORl9FTlYgPSBc
Cj4gICAgID4gK8KgIMKgIMKgSE9TVENDPSIkKEhPU1RDQykgJChIT1NUX0NGTEFHUykgJChIT1NU
X0xERkxBR1MpIiBcCj4gICAgID4gK8KgIMKgIMKgQVJDSD0kKEtFUk5FTF9BUkNIKSBcCj4gICAg
ID4gK8KgIMKgIMKgQ1JPU1NfQ09NUElMRT0iJChUQVJHRVRfQ1JPU1MpIiBcCj4gICAgID4gK8Kg
IMKgIMKgREVQTU9EPSQoSE9TVF9ESVIpL3NiaW4vZGVwbW9kCj4gCj4gICAgIFNhbWUgaGVyZS4K
PiAKPiAKPiAKPiAgICAgPiArCj4gICAgID7CoCBaRlNfREVQRU5ERU5DSUVTID0gbGliYWlvIG9w
ZW5zc2wgdWRldiB1dGlsLWxpbnV4IHpsaWIKPiAgICAgPsKgCj4gICAgID7CoCAjIHN5c3Zpbml0
IGluc3RhbGxzIG9ubHkgYSBjb21tZW50ZWQtb3V0IG1vZHVsZXMtbG9hZC5kLyBjb25maWcgZmls
ZQo+ICAgICA+Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidXN5Ym94Lm5ldApodHRwOi8v
bGlzdHMuYnVzeWJveC5uZXQvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
