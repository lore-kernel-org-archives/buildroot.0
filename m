Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58317C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 07:39:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB34860F4B
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 07:38:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB34860F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A550980E7C;
	Sun, 15 Aug 2021 07:38:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j9DBzJudDT16; Sun, 15 Aug 2021 07:38:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43EC180E81;
	Sun, 15 Aug 2021 07:38:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 74BAE1BF4DB
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 07:38:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64BB160601
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 07:38:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pyXtEjLrTdUs for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 07:38:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F360605BE
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 07:38:47 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id f2so587326ljn.1
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 00:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oRNAUzU5nSxZBjHYiZaRyz0+3C785E6/WOelo4Df5YA=;
 b=J66df5MJJrt3JXF21rA1VOIbcJhV1IH6Sjr3U7aj55T3ssisLmHQaSyMxvcQT6ca8+
 nyZxdmP3YFeNSugqIOsewfJY92EUML+udClq3p6v4XXnC1uEnNqLc2cesS0xu+L7r0Hr
 iEGwrZFoofBqxUcOaifDcVU/7+6hJ8i32z2QsUVlOCchGlYOinCiqRARwAEgRjrz0Dxz
 EQrkJGvJdaEgvVrmqq6tGwV2v8Dy9PpyVVxG2dM2bDk5oCQ8OOfJMBKQihiXbN6vexuA
 yZdyXlTL6kJtkduMr7xmwvf9Q51IaEkMoBa8hC5k9L27GwEyxNT0GddPokfLTunTrU8O
 6eXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oRNAUzU5nSxZBjHYiZaRyz0+3C785E6/WOelo4Df5YA=;
 b=GA0gDYQ89Wbjzx5KHTRP/C+M3eOJ2JDCd+5wh8OosqgyrRXoQeGQ10gpzyKEmZS9ra
 Mm/izeiEhgujmermt5aoViv1o8tS4PXcRl3i9+qo0PtyV7IwPQ9odrueRokoeek7TNej
 dt1DpxohBLr0i5R7+5laPRS9JFciqbmz7IpQ2m0RM4htppFipQaN9NJeujb7bu321ESY
 labgvWvZLx+LydNOjKwXTqOEMQdWIokBauf4+jnNvr3ku/5uMxbd13PbY5Rw7JFMY9jG
 6zTQbXkI/qswOTJuPu8ITGVhIAGE93x1WCM1R4XCtPL6FhgRqNMDfs11faKLYhtGhcd7
 yYeQ==
X-Gm-Message-State: AOAM530mDRxzFPYF1Dnbv33PIjI0ZDI+ol8STP2Yeq6BLtiQVBksjreI
 EaDoRIPRLsJkxZKyvYsrNLa3MWVoTaNZfbRnVFFfznZH854=
X-Google-Smtp-Source: ABdhPJx2bcJgxnZpToulroqzG6DEkLRj8LXI2K213HlRx2qgmaBek6HlRUx/BrpmHrNkI+zSrmbEh2NueSxDSeNm5Hk=
X-Received: by 2002:a05:651c:39c:: with SMTP id
 e28mr4635044ljp.498.1629013125739; 
 Sun, 15 Aug 2021 00:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210813211648.3483726-1-fontaine.fabrice@gmail.com>
 <20210815092502.7a3ddd67@windsurf>
In-Reply-To: <20210815092502.7a3ddd67@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 15 Aug 2021 09:38:31 +0200
Message-ID: <CAPi7W817dEJ1tONMFBxPFZUmN60PD01npR0MmyK87OkkJmejEA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/fontconfig: fix per-package
 build with NLS
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

TGUgZGltLiAxNSBhb8O7dCAyMDIxIMOgIDA5OjI1LCBUaG9tYXMgUGV0YXp6b25pCjx0aG9tYXMu
cGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBPbiBGcmksIDEzIEF1ZyAyMDIx
IDIzOjE2OjQ4ICswMjAwCj4gRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gPiBBZGQgVEFSR0VUX05MU19ERVBFTkRFTkNJRVMgYW5kIGhvc3Qt
Z2V0dGV4dCBkZXBlbmRlbmN5IHRvIGF2b2lkIHRoZQo+ID4gZm9sbG93aW5nIGJ1aWxkIGZhaWx1
cmUgd2l0aCBob3N0LWNhaXJvIHJhaXNlZCBiZWNhdXNlIGZvbnRjb25maWcKPiA+IGluc3RhbGxz
IGl0cyBJVFMgZmlsZXMgaW4gdGhlIHdyb25nIGRpcmVjdG9yeSAoaS5lLiBvdXRzaWRlIG9mCj4g
PiBnZXR0ZXh0LXRpbnkgc3ltbGluayk6Cj4gPgo+ID4gbWtkaXIgLXAgL3RtcC9pbnN0YW5jZS0w
L291dHB1dC0xL3Blci1wYWNrYWdlL2hvc3QtY2Fpcm8vaG9zdAo+ID4gcnN5bmMgLWEgLS1saW5r
LWRlc3Q9L3RtcC9pbnN0YW5jZS0wL291dHB1dC0xL3Blci1wYWNrYWdlL2hvc3QtZm9udGNvbmZp
Zy9ob3N0LyAvdG1wL2luc3RhbmNlLTAvb3V0cHV0LTEvcGVyLXBhY2thZ2UvaG9zdC1mb250Y29u
ZmlnL2hvc3QvIC90bXAvaW5zdGFuY2UtMC9vdXRwdXQtMS9wZXItcGFja2FnZS9ob3N0LWNhaXJv
L2hvc3QKPiA+IHJzeW5jIC1hIC0tbGluay1kZXN0PS90bXAvaW5zdGFuY2UtMC9vdXRwdXQtMS9w
ZXItcGFja2FnZS9ob3N0LWZyZWV0eXBlL2hvc3QvIC90bXAvaW5zdGFuY2UtMC9vdXRwdXQtMS9w
ZXItcGFja2FnZS9ob3N0LWZyZWV0eXBlL2hvc3QvIC90bXAvaW5zdGFuY2UtMC9vdXRwdXQtMS9w
ZXItcGFja2FnZS9ob3N0LWNhaXJvL2hvc3QKPiA+IHJzeW5jIC1hIC0tbGluay1kZXN0PS90bXAv
aW5zdGFuY2UtMC9vdXRwdXQtMS9wZXItcGFja2FnZS9ob3N0LWxpYmdsaWIyL2hvc3QvIC90bXAv
aW5zdGFuY2UtMC9vdXRwdXQtMS9wZXItcGFja2FnZS9ob3N0LWxpYmdsaWIyL2hvc3QvIC90bXAv
aW5zdGFuY2UtMC9vdXRwdXQtMS9wZXItcGFja2FnZS9ob3N0LWNhaXJvL2hvc3QKPiA+IGNhbm5v
dCBkZWxldGUgbm9uLWVtcHR5IGRpcmVjdG9yeTogc2hhcmUvZ2V0dGV4dAo+ID4gY291bGQgbm90
IG1ha2Ugd2F5IGZvciBuZXcgc3ltbGluazogc2hhcmUvZ2V0dGV4dAo+ID4KPiA+IEZpeGVzOgo+
ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvMDBlMjk5NThjZWNm
ZmZhNGU5OTRhYjU0OTYzNzExN2RkOGY1NWMzMAo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgcGFj
a2FnZS9mb250Y29uZmlnL2ZvbnRjb25maWcubWsgfCA2ICsrKystLQo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBEbyB5b3UgaGF2ZSBzb21l
IG1vcmUgZGV0YWlscyBhcyB0byB3aHkgdGhpcyBpcyBzcGVjaWZpYyB0byBwZXItcGFja2FnZQo+
IGJ1aWxkcz8KVGhlIGJ1aWxkIGZhaWx1cmUgaXMgb25seSByYWlzZWQgd2l0aCBwZXItcGFja2Fn
ZSBidWlsZCBiZWNhdXNlCnBlci1wYWNrYWdlLXJzeW5jIGZ1bmN0aW9uIGluIHBrZy11dGlscy5t
ayBpcyBub3QgYWJsZSB0byByc3luYwpzaGFyZS9nZXR0ZXh0IGFzIGdldHRleHQgaXMgYSAic3Rh
bmRhcmQiIGRpcmVjdG9yeSBmb3IgZm9udGNvbmZpZyBhbmQKYSBzeW1saW5rIGZvciBvdGhlciBw
YWNrYWdlcyAoZS5nLiBsaWJnbGliMikuCkhvd2V2ZXIsIGV2ZW4gaWYgd2UgZG9uJ3QgaGF2ZSBi
dWlsZCBmYWlsdXJlcywgdGhlIG1pc3NpbmcKZGVwZW5kZW5jaWVzIGNvdWxkIHByb2JhYmx5IHJh
aXNlIHVuZXhwZWN0ZWQgcnVudGltZSBpc3N1ZXMgd2l0aAoibm9ybWFsIiBidWlsZHMuCj4KPiBU
aG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgo+IEVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcKPiBodHRwczovL2Jvb3RsaW4uY29tCkJlc3QgUmVn
YXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDov
L2xpc3RzLmJ1c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
