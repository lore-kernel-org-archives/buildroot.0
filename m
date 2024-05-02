Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67ACC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 08:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3350405E8;
	Thu,  2 May 2024 08:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xdR07e5rHcGT; Thu,  2 May 2024 08:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E4A4404D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E4A4404D5;
	Thu,  2 May 2024 08:16:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 368151BF47A
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2283060E2B
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 08:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IxD7eqqHqIs for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 08:16:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F246D60E2E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F246D60E2E
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F246D60E2E
 for <buildroot@buildroot.org>; Thu,  2 May 2024 08:16:06 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-51f300b318cso304503e87.3
 for <buildroot@buildroot.org>; Thu, 02 May 2024 01:16:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714637765; x=1715242565;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eOmv80eR9FxHDAcaQdpI3naUp8OfRfed0Zc+tzEt4sY=;
 b=U+SKAob7YWtJvcNqMI3aALU2rrhfvOHtiIZJKdqq6ZPbnt2cZZmlJPIYideee/M2Yk
 skW2s7fyLLrXvCrGXQZPGPfo67eekTldXdl39o5MoGvPZJfdcFOKsnVaeZAk+Cg/Deg3
 2SM4sfHb+qAYc5rJmcUN27e0zGGHdmIdNPxQMSmqiMb3KHFDF3fbbi+ToVzki478iPVB
 FUjNErqcjBDC609NU0MMv/kgVGjI4DNrU9pU6+QoNrP1VM2a/uzWN7XWHIRVZ3zEY+E0
 HCihcWqu486SpKgfBaf0QxAORXlH2L2vL0RGWYSO09eF1a1gmGry/Z/Y/IAHvCRtLD/w
 Cjwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRyHNh5mXHMQPhyzfbPS6Wb3RNqYbPf63X5gdwBuGsx7oppIwO5IOAtC56CGzvrBTY3U4n9yy2DIRRzmBz6Vz+YyxtVQUPgQ==
X-Gm-Message-State: AOJu0YwOYGmQTKfgcK6HTg3C6o9s0H2+BTVV+k94D039hqK2NFoUXYqW
 DvjfhWS5YVSvD1s5XmpRvDxOY8Y/JnUdJNAhdK+fxURRfkAyTQvfiI1oGRBIlGqncXLU3e6x4Dc
 v4vZQYq4wIJGxisqy0mfkk3RtXxw=
X-Google-Smtp-Source: AGHT+IFWKp40h4TgkfWkEpQiddhskjd3cNANKyOFSMz+1MJb2ZwQyF2vFmDpaaRKE0liaUu8TSe2gomfOclBu8ocClY=
X-Received: by 2002:a05:6512:1112:b0:51a:c2ec:72f9 with SMTP id
 l18-20020a056512111200b0051ac2ec72f9mr3627643lfg.49.1714637764398; Thu, 02
 May 2024 01:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <20240420185853.4134260-1-thomas@devoogdt.com>
 <20240502095605.32987057@windsurf>
In-Reply-To: <20240502095605.32987057@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 2 May 2024 10:15:53 +0200
Message-ID: <CAPi7W838wL-EiUvd6ShK7=__WbCBKu2SNVj3S8aCYPa9f3dY4g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714637765; x=1715242565; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eOmv80eR9FxHDAcaQdpI3naUp8OfRfed0Zc+tzEt4sY=;
 b=REqsYZAVyhGt8UaKR9E3AprZTeKJ8ygMOPAv85ZRFtYEFQ5zhWLEjgqFRe3ZYtPQD0
 2RrSbGCshmmxft7niBDduIjwY2+nIhZP5HjBiHSqJbCGmQwzKNNxqmPppR516A+JROtu
 NR0qiDXut6PzLMK9zjEHuzdbn32Bm7RUa+wZBuryjv3P7NpOEQ1UnfjOcY2YkZBFqG3L
 xXoDReCTaiY4xk3dRb9FXVe74Pw6Q9JMXdEUPKd8JbKoijKNY6FSyatvW97lhx9x1qcF
 XMBLd60/KZV1UauidXYoAtpbOReXto8FhkkW9qLP4q7A9ZgunFyxlZ2vgOZYI4+gqsHH
 mvOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=REqsYZAV
Subject: Re: [Buildroot] [PATCH v1 1/8] package/libsoup3: fix reference to
 atomic
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgamV1LiAyIG1haSAyMDI0IMOgIDA5OjU2LCBUaG9tYXMgUGV0YXp6
b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiBhIMOpY3JpdCA6Cj4KPiBIZWxsbywK
Pgo+IE9uIFNhdCwgMjAgQXByIDIwMjQgMjA6NTg6NDYgKzAyMDAKPiBUaG9tYXMgRGV2b29nZHQg
PHRob21hc0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+Cj4gPiBndGhyZWFkLXBvc2l4LmM6KC50ZXh0
KzB4MTM3Yyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYXRvbWljX2NvbXBhcmVfZXhjaGFu
Z2VfNCcKPiA+IGNvbGxlY3QyOiBlcnJvcjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1cwo+ID4K
PiA+IEZpeGVzOgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMv
NGZiOWY0YzQ5Nzc3ZGRlM2FiYzMwYmI5ZjMyNDgxNmQzZWQ4NzU2Nwo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzQGRldm9vZ2R0LmNvbT4KPgo+IEkgdGhpbmsg
dGhpcyB3aG9sZSBwYXRjaCBzZXJpZXMgaXMgbm90IHRoZSByaWdodCB3YXkgdG8gZml4IHRoZQo+
IHByb2JsZW0uIEluZGVlZCwgd2hhdCdzIHVzaW5nIGxpYmF0b21pYyBoZXJlIGlzIGxpYmdsaWIy
LCBhbmQgd2l0aCB5b3VyCj4gc29sdXRpb24sIHlvdSBoYXZlIHRvIGNoYXNlIGRvd24gKmFsbCog
cmV2ZXJzZSBkZXBlbmRlbmNpZXMgb2YgbGliZ2xpYjIuCj4KPiBJbnN0ZWFkLCB3aGF0IEknZCBs
aWtlIHRvIHNlZSBpcyB0aGF0IHRoZSBnbGliLTIuMC5wYyAocGtnLWNvbmZpZykgZmlsZQo+IGdl
dHMgdXBkYXRlZCB0byBpbmNsdWRlIC1sYXRvbWljIGluIHRoZSBMaWJzLnByaXZhdGUgZmxhZ3Ms
IHNvIHRoYXQgaXQKPiBnZXRzIGF1dG9tYXRpY2FsbHkgcGlja2VkIHVwIGJ5IGFsbCByZXZlcnNl
IGRlcGVuZGVuY2llcyBvZiBsaWJnbGliMgo+IHdoZW4gdGhleSBhcmUgc3RhdGljIGxpbmtpbmcu
Cj4KPiBUaGlzIGFsc28gYnJpbmdzIHRoZSBhZHZhbnRhZ2UgdGhhdCB5b3UncmUgbm90IGxpbmtp
bmcgc2F5IGxpYnNvdXAzCj4gZGlyZWN0bHkgd2l0aCBsaWJhdG9taWMsIGxpa2UgeW91J3JlIGRv
aW5nIHdpdGggeW91ciBwYXRjaC4gSW5zdGVhZCwgaW4KPiBhIGR5bmFtaWMgbGlua2luZyBjYXNl
LCB3ZSBrZWVwIG9uIGhhdmluZyBsaWJzb3VwMyBsaW5rZWQganVzdCB3aXRoCj4gbGliZ2xpYjIs
IGFuZCBsaWJnbGliMiBsaW5rZWQgd2l0aCBsaWJhdG9taWMuIEl0J3Mgb25seSBpbiB0aGUgc3Rh
dGljCj4gbGlua2luZyBjYXNlIHRoYXQgd2hlbiB3ZSdyZSBidWlsZGluZyBhIGZpbmFsIGV4ZWN1
dGFibGUgdGhhdCB1c2VzCj4gbGlic291cDMsIHdlIG5lZWQgdG8gYWxzbyBicmluZyBsaWJhdG9t
aWMuYSBpbnRvIHRoZSBtaXguCj4KPiBDb3VsZCB5b3UgaGF2ZSBhIGxvb2sgYXQgZml4aW5nIGds
aWItMi4wLnBjIGluc3RlYWQ/CgpUaGlzIHBhdGNoIGlzIGF2YWlsYWJsZSBzaW5jZSBTZXB0ZW1i
ZXIgMjAyMzoKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9w
YXRjaC8yMDIzMDkxNzE4NTExNi4xODI4MTAtMS1mb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbS8K
Cj4KPiBUaGFua3MhCj4KPiBUaG9tYXMKPiAtLQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVy
IGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
IGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KCkJlc3QgUmVnYXJkcywKCkZhYnJp
Y2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
