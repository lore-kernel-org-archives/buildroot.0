Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE30BC4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 22:04:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59F6C60F39
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 22:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59F6C60F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2ACCC40136;
	Fri, 20 Aug 2021 22:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wITSyzOKSQ05; Fri, 20 Aug 2021 22:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A35BC40173;
	Fri, 20 Aug 2021 22:04:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3902A1BF853
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 22:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2847140136
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 22:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3xtZQ2pGluyW for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 22:04:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 449E24080D
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 22:04:27 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id y6so19479946lje.2
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 15:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PkNSYR7rBp5Bdb4lCA2IZCSEtaJEV67+5fkID6v9Hi4=;
 b=Y76I4ofYN3biSBW86mCaFNCdVgfftRM0LKeVLj9bDnyLK+Xy5XInpnPaTfHC9Ugk59
 myq8RmsjSLp3/9BZE/i9EdznzWDD4PCaUonUqJKCZpjmuDdDGFwc3/TB5b6T2jiGXqOz
 ntU9PvCX2NLK1E8z3rUOE7NHfWhEIkRYxOVbgkUTc/mwSI+QDxbm27jQeI5YRgf4WxM+
 dFwm/D90V1XHzjQqyiqM9gEPsAcW10/diCs+TV1ZPI3I52Y4Gp1ztLzCQ04n9onPQgjb
 oflXn9/3e69K5hQZ4fSDE1FlcbYWPi24GAu1l8NQGAI7i9zMDM8Kw1De8iuAW6bv5HuD
 +ykA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PkNSYR7rBp5Bdb4lCA2IZCSEtaJEV67+5fkID6v9Hi4=;
 b=KzEAj2RC2vMX+9sOeHHwr1mgG4NinMHraqFonjJQOPQdwidp59L5haW1KAoobBkUBS
 giF/3/YB411/93bspKpmRj10j0igZlZkA29f5zZzCdUY0U6CqMdgsxY/3Renn7N2hXMd
 lnwM7wocNh4i/JGD6WK+RUXef9Q103qLsmU6UalVbYi1lxxMTS0EL6B78xExZqSVoofv
 T2NAXy3NHzZyVpZgbMzIKtvcRwpu+ACuwZ6HVDGih9YNPB3crtyFNtwZhUBDkTqD/I9x
 oNdEDigDpq9GNPRxmtP451H9/747n63zTPtCUU1pt0fFYZNsClWYaUk7N+DlBuyOb3i3
 nlQA==
X-Gm-Message-State: AOAM53235f+hk9+IkdUunErOC5MtZwXrnR3FefwhwEzJPNtORyyTYkTV
 KJS+pJQC8Q7jm9m9l3TYC6szwNH8VHlEACccPvg=
X-Google-Smtp-Source: ABdhPJwgkP0u8cV36IxwiHIwMoPGPAf9kQtePBWM090UP/ccxcymGMVQbot/Qq5TgjZbN7MJslGcTfo57VOLYsaQpuA=
X-Received: by 2002:a05:651c:39c:: with SMTP id
 e28mr17400732ljp.498.1629497065070; 
 Fri, 20 Aug 2021 15:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210820133232.40519-1-matthew.weber@collins.com>
 <20210820232258.144f2fda@windsurf>
In-Reply-To: <20210820232258.144f2fda@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 21 Aug 2021 00:04:13 +0200
Message-ID: <CAPi7W80hhWfcYs_phKRpbfGWndzE62Ud6Km91YbR=iafUDBHiQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] package/kvm-unit-tests: disable SSP
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
Cc: Matthew Weber via buildroot <buildroot@busybox.net>,
 Matthew Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

SGVsbG8sCgpMZSB2ZW4uIDIwIGFvw7t0IDIwMjEgw6AgMjM6MjMsIFRob21hcyBQZXRhenpvbmkK
PHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IEhlbGxvIE1hdHQs
Cj4KPiBPbiBGcmksIDIwIEF1ZyAyMDIxIDA4OjMyOjMyIC0wNTAwCj4gTWF0dGhldyBXZWJlciB2
aWEgYnVpbGRyb290IDxidWlsZHJvb3RAYnVzeWJveC5uZXQ+IHdyb3RlOgo+Cj4gPiBrdm0tdW5p
dC10ZXN0cyBzaG91bGRuJ3QgdXNlIHN0YWNrLXByb3RlY3RvciBhcyB0aGUgdGVzdCBzdWl0ZSBp
cwo+ID4gYnVpbGRpbmcgZnJlZSBzdGFuZGluZyBiaW5hcmllcyB0byB0ZXN0IFFFTVUuIFRoZXJl
IGlzIG5vIGd1YXJhbnRlZQo+ID4gdGhhdCBHQ0MgaGFzIHNldCBhIHNwZWMgdG8gZmlsdGVyIG91
dCBzdGFjayBwcm90ZWN0b3IgZW5hYmxpbmcgd2l0aAo+ID4gLWZmcmVlc3RhbmRpbmcgc28gZGlz
YWJsaW5nIGV4cGxpY2l0bHkgdG8gcHJldmVudCBhIHNlcmllcyBvZiBidWlsZAo+ID4gZmFpbHVy
ZXMuCj4gPgo+ID4gRml4ZXM6Cj4gPiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVz
dWx0cy83ODAvNzgwYzhjNzBlYTcwMTUxMTM3MTRjYmQzODQxZDk2YjA4YmQyZjJhYS8KPiA+Cj4g
PiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IFdlYmVyIDxtYXR0aGV3LndlYmVyQGNvbGxpbnMuY29t
Pgo+ID4gLS0tCj4gPiAgcGFja2FnZS9rdm0tdW5pdC10ZXN0cy9rdm0tdW5pdC10ZXN0cy5tayB8
IDEzICsrKysrKy0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQo+Cj4gVGhhbmtzLCBidXQgeW91ciBwYXRjaCBkb2Vzbid0IGFwcGx5IHRv
IHRoZSBtYXN0ZXIgYnJhbmNoLCBhbmQgaXQgbWFrZXMKPiBtZSB0aGluayB3ZSdyZSBwaWxpbmcg
dXAgd29yay1hcm91bmRzIG9uIHdvcmstYXJvdW5kcy4KPgo+IEluZGVlZCwgdGhlIHBhc3Npbmcg
b2YgLWZuby1zdGFjay1wcm90ZWN0b3IgaW4gRVhUUkFfQ0ZMQUdTIGhhcyBiZWVuCj4gcmVtb3Zl
ZCBpbiBtYXN0ZXIgYXMgb2YgY29tbWl0Cj4gZDE4MzE0NmI1YzdhMWE4ZDFhM2M4MjhiZDNiNmQw
NjYwZDk3ZWZjMCwgd2hpY2ggaXRzZWxmIHNheXMgaXQgaXMgbm8KPiBsb25nZXIgbmVlZGVkIHNp
bmNlIGNvbW1pdCAwNzg4ZTkyMWY5NjFlMzZhNTBhOTRmOGJiOThmN2ViNzViMzEyMjQ1Lgo+Cj4g
SG93ZXZlciwgaXQgc2VlbXMgbGlrZSBkZXNwaXRlCj4gMDc4OGU5MjFmOTYxZTM2YTUwYTk0Zjhi
Yjk4ZjdlYjc1YjMxMjI0NSwgU1NQIGlzIHN0aWxsIGJlaW5nIHVzZWQuCj4KPiBNYXR0LCBGYWJy
aWNlLCBjb3VsZCB5b3UgcmV2aWV3IHRoZSBzaXR1YXRpb24gYW5kIHNlZSB3aGF0IGlzIHRoZQo+
IGNvcnJlY3QgZml4IG1vdmluZyBmb3J3YXJkID8KVGhlIGxpbmsgb24gdGhlIGF1dG9idWlsZGVy
IGZhaWx1cmUgaXMgZnJvbSBGZWJydWFyeSAyMDIwIGFuZCBJJ20gbm90CmFibGUgdG8gZmluZCBh
IGJ1aWxkIGZhaWx1cmUgZHVlIHRvIFNTUCBpbiB0aGUgbGF0ZXN0IGRheXMgc28gSSBhc3N1bWUK
dGhhdCB0aGlzIHBhdGNoIGlzIG5vdCBuZWVkZWQuCj4KPiBUaGFua3MhCj4KPiBUaG9tYXMKPiAt
LQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4gaHR0cHM6Ly9ib290bGluLmNvbQpCZXN0
IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1c3lib3gubmV0Cmh0
dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
