Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DF9C71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 15:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8373E80808;
	Tue, 17 Jun 2025 15:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wS1uNz3tT_sc; Tue, 17 Jun 2025 15:37:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 404A980786
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 404A980786;
	Tue, 17 Jun 2025 15:37:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BE7316B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 15:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D3BA806CA
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 15:37:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ne4oXszItSqj for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 15:37:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B42C80329
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B42C80329
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B42C80329
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 15:37:34 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-553b82f3767so3545287e87.3
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 08:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750174652; x=1750779452;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/XyvWx9Qz/Csma/ILaHCNw2VXnxC1Eoy9hO0kE9QJnE=;
 b=AGuYG39fR8uGWYodaoAqyoaAmK4GP22W1Vf3eNTr88fq4Z41d5f4CmOawQ3K711bfH
 30sZbk6hdOvI1/+wkDJpgSfCPRMwzh2ixYgMQ/4wPt6hGZBB7MVO88MC6eMzI7t+X3L9
 rZcmRCYR7iCX6WburqJQsTHrCKsijBRJGoVvKF3sLjBs+ViBbLzn7ex91HmpRdRfht3L
 FYH714RK3UDAccuVSRdgjwfNjy7PWdnbafOozIAhJV4Lm1J3d4/K7hxi5Vq7AEnqylYp
 c5A08tPxro33o8t+Q8emiTAkllCIn6ykGoaxDpa1ezkbqjFSn/1pOBi5FBUzx1nH4Fvd
 VE6Q==
X-Gm-Message-State: AOJu0Yzcphfz51BapoS4/NvM6rxUlsPHDZylMF+REnOEcKuVExvqYClP
 mTlF+Bqz8kcKIh4hrUO0rzoTIJhA5Jroo6eGsfpgFFt9RpETpalJsYmdiW70c8CdAfn5mpuVI3Q
 MYqHELfc+s136kIQGqLcTIzZkCjKzfo6MbTbQ0Tdo3w3Ou4StHJUWq6e2dw==
X-Gm-Gg: ASbGncuZ42wp6tWG1R7w+gJSA3brDolefX007qyP/xgZbOTXyuATW+Iosxgza9ptpeN
 Uf0AdbVBG050h4FIkip8XiV1SJ3E+E9KIsamJErJ54UhRqmGYpFWAye4LzMxhc5szNbM2kf59IV
 hYYhQInu283fp/hN3liINMTNrZTtCLsysjNtULZAQzvC9VjI7ibNVIeEk5jRMZHzfRk08PIeMZz
 zDOF8B2lnlw
X-Google-Smtp-Source: AGHT+IHLYqpBDd9PSnvct3kjK0qIz0YW7daVGZgi7awdCo9XMl+MQXtHR68ZMFJmrXPRz0Cwe2vVd7ZAbOlhuU9c+bE=
X-Received: by 2002:a05:6512:284:b0:553:c9fb:5bad with SMTP id
 2adb3069b0e04-553c9fb5e21mr828020e87.1.1750174651791; Tue, 17 Jun 2025
 08:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
 <20250613110559.2665663-6-fabien.lehoussel@smile.fr>
 <d85a9587-a1f0-4bdd-876d-939160102746@rnout.be>
In-Reply-To: <d85a9587-a1f0-4bdd-876d-939160102746@rnout.be>
Date: Tue, 17 Jun 2025 17:37:21 +0200
X-Gm-Features: AX0GCFudfr3ivJkz2st8l7k3pFG8PJVBzuao3IluXI-aIqSHPB2zj2V0Xz_6yJg
Message-ID: <CAKWtHtzkXBu-n_0uAVKRF+ZEc1gBxcRqW=Y-wxpO7A0uax5Edg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1750174652; x=1750779452; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/XyvWx9Qz/Csma/ILaHCNw2VXnxC1Eoy9hO0kE9QJnE=;
 b=lJWyukaebw7QW1X99iQVvK9ZpimfutRXdLvXFLn3kCL/Ogv+d1H5JDJ+gxxlCr+yr7
 ddaknK7By8+XtBOagUswKAXRJzG70G5hS73YYQl/xm6perZRu68IFt/H8mXUOw6o0uBe
 fZd6FAQ+n/VjCJBY6YAfeUG00ZAR6iHc+wAdo=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=lJWyukae
Subject: Re: [Buildroot] [PATCH 6/7] utils/generate-cyclonedx: add source
 field to CVE entries
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fabien LEHOUSSEL via buildroot <buildroot@buildroot.org>
Reply-To: Fabien LEHOUSSEL <fabien.lehoussel@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbHVuLiAxNiBqdWluIDIwMjUgw6AgMjI6MzAsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5v
dXRAcm5vdXQuYmU+IGEgw6ljcml0IDoKPgo+Cj4KPiBPbiAxMy8wNi8yMDI1IDEzOjA1LCBGYWJp
ZW4gTGVob3Vzc2VsIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gPiBBZGRzIHRoZSByZXF1aXJlZCBz
b3VyY2UgZmllbGQgdG8gQ1ZFIGVudHJpZXMgaW4gdGhlIGdlbmVyYXRlZCBTQk9NLgo+Cj4gICBB
RkFJQ1MgdGhlcmUgYXJlIG5vIHJlcXVpcmVkIGZpZWxkcyBhdCBhbGwgaW4gdGhlIHNjaGVtYSBk
ZWZpbml0aW9uIG9mCj4gdnVsbmVyYWJpbGl0eS4KPgo+ID4gVGhpcyBmaWVsZCBpcyBtYW5kYXRv
cnkgZm9yIGNvbXBhdGliaWxpdHkgd2l0aCBEZXBlbmRlbmN5VHJhY2sgYW5kCj4KPiAgIEkga25v
dyB0aGF0IFRIb21hcyBoYXMgYmVlbiB1c2luZyBEVCB3aXRob3V0IHRoaXMgZmllbGQsIHNvIGl0
IGNhbid0IGJlIHZlcnkKPiBtYW5kYXRvcnkuCj4KPiAgIFRoYXQgc2FpZCwgaXQncyBhIGdvb2Qg
aWRlYSB0byBhZGQgaXQhCj4KPiA+IG90aGVyIHZ1bG5lcmFiaWxpdHkgdHJhY2tpbmcgdG9vbHMs
IGVuc3VyaW5nIHByb3BlciBpbnRlZ3JhdGlvbiB3aXRoCj4gPiBzZWN1cml0eSBzY2FubmluZyB3
b3JrZmxvd3MuCj4gPgo+ID4gVGhlIGdlbmVyYXRlZCBTQk9NIGhhcyBiZWVuIHZhbGlkYXRlZCB3
aXRoIHNib20tdXRpbGl0eQo+ID4gKGh0dHBzOi8vZ2l0aHViLmNvbS9DeWNsb25lRFgvc2JvbS11
dGlsaXR5KSBhbmQgRGVwZW5kZW5jeVRyYWNrCj4gPiAoaHR0cHM6Ly9kZXBlbmRlbmN5dHJhY2su
b3JnLykgdG8gZW5zdXJlIGZ1bGwgY29tcGF0aWJpbGl0eS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5
OiBGYWJpZW4gTGVob3Vzc2VsIDxmYWJpZW4ubGVob3Vzc2VsQHNtaWxlLmZyPgo+ID4gLS0tCj4g
PiAgIHV0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeCB8IDQgKysrKwo+ID4gICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3V0aWxzL2dlbmVyYXRlLWN5
Y2xvbmVkeCBiL3V0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeAo+ID4gaW5kZXggMWNiZWNhMDFhZC4u
MzBjMGQ0ODg1NyAxMDA3NTUKPiA+IC0tLSBhL3V0aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeAo+ID4g
KysrIGIvdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4Cj4gPiBAQCAtMjI5LDYgKzIyOSwxMCBAQCBk
ZWYgY3ljbG9uZWR4X3Z1bG5lcmFiaWxpdGllcyhzaG93X2luZm9fZGljdCk6Cj4gPgo+ID4gICAg
ICAgcmV0dXJuIFt7Cj4gPiAgICAgICAgICAgImlkIjogY3ZlLAo+ID4gKyAgICAgICAgInNvdXJj
ZSI6IHsKPiA+ICsgICAgICAgICAgICAibmFtZSI6ICJOVkQiLAo+Cj4gICBJbiB0aGUgZnV0dXJl
IEknZCBwcmVmZXIgaWYgQnVpbGRyb290J3MgU0JvTSB3b3VsZCBzdXBwb3J0IG90aGVyIHNvdXJj
ZXMgb2YKPiB2dWxuZXJhYmlsaXRpZXMgYXMgd2VsbC4gU2luY2UgdGhpcyBpcyBhYm91dCB0aGUg
X2V4Y2x1c2lvbnNfLCBub3QgYWJvdXQgdGhlCj4gdnVsbmVyYWJpbGl0aWVzIHRoZW1zZWx2ZXMs
IHRoYXQgbWVhbnMgdGhhdCBpbiB0aGUgZnV0dXJlIHdlJ2xsIHdhbnQgdG8gYWxzbwo+IGhhdmUg
b3RoZXIgc291cmNlcy4gSW4gcGFydGljdWxhciwgY3ZlLm9yZyBoYXMgdmVyc2lvbiBhbm5vdGF0
aW9ucyB0aGF0IGNvbWUKPiBmcm9tIHRoZSBDTkEgaXRzZWxmLCB3aGljaCB0ZW5kIHRvIGJlIG1v
cmUgYWNjdXJhdGUgdGhhbiB0aGUgQ1BFIHN0dWZmIHRoYXQgTlZECj4gYWRkcy4gQnV0IHRoYXQg
bWVhbnMgd2Ugd2lsbCBuZWVkIHRvIGFkZCBleGNsdXNpb25zIGZvciBDVkVzIHRoYXQgY2FuIGJl
IGZvdW5kCj4gaW4gY3ZlLm9yZyBidXQgdGhhdCBoYXZlIGJlZW4gcGF0Y2hlZCBvdXQgaW4gQnVp
bGRyb290Lgo+Cj4gICBJIGRvbid0IHNlZSBhIGdvb2Qgd2F5IHRvIHNvbHZlIHRoaXMgaG93ZXZl
ciwgc28gZm9yIG5vdywgYXNzdW1pbmcgTlZEIGlzCj4gc3VmZmljaWVudC4KPgo+Cj4gPiArICAg
ICAgICAgICAgInVybCI6ICJodHRwczovL252ZC5uaXN0Lmdvdi8iCj4KPiAgIFRoaXMgc2hvdWxk
IGJlIHRoZSBfZnVsbF8gVVJMIC0gdGhlIHNwZWMgc2F5czoKPgo+ID4gICAgICAgICAgICJkZXNj
cmlwdGlvbiI6ICJUaGUgdXJsIG9mIHRoZSB2dWxuZXJhYmlsaXR5IGRvY3VtZW50YXRpb24gYXMg
cHJvdmlkZWQgYnkgdGhlIHNvdXJjZS4iLAo+ID4gICAgICAgICAgICJleGFtcGxlcyI6IFsKPiA+
ICAgICAgICAgICAgICJodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyMS0z
OTE4MiIKPiA+ICAgICAgICAgICBdCgpPaywgSSB3aWxsIGFkZCB0aGUgY29tcGxldGUgVVJMIGlu
IHRoZSB2MiBvZiB0aGUgcGF0Y2ggc2V0CgpGYWJpZW4KCj4KPiAgIFJlZ2FyZHMsCj4gICBBcm5v
dXQKPgo+ID4gKyAgICAgICAgfSwKPiA+ICAgICAgICAgICAiYW5hbHlzaXMiOiB7Cj4gPiAgICAg
ICAgICAgICAgICJzdGF0ZSI6ICJpbl90cmlhZ2UiLAo+ID4gICAgICAgICAgICAgICAiZGV0YWls
IjogZiJUaGUgQ1ZFICd7Y3ZlfScgaGFzIGJlZW4gbWFya2VkIGFzIGlnbm9yZWQgYnkgQnVpbGRy
b290Igo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
