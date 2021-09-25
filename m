Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5216C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 07:46:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BBFB604D1
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 07:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2BBFB604D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C662484010;
	Sat, 25 Sep 2021 07:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GG7RVZBLw6XU; Sat, 25 Sep 2021 07:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BB7E83FC0;
	Sat, 25 Sep 2021 07:46:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 61C661BF2AA
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 07:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C8BE40147
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 07:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NNUC5wtQH9EZ for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 07:46:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E00C9400DE
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 07:46:27 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y28so50033038lfb.0
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 00:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LV9yHRrbRYyzljdGU/CfR8v0ZhaSbt52WIgZUogEioQ=;
 b=izq61kYgHGVrd1TYtRYcAg35Qxqbnehv8OHZaBS7HmyJd7Qf+MyyyE+87UaV4GyaxE
 BsoFzN6eG4GT4klHAJHZVgpJPvYym2fJb/e8BZjDtsScYjazeuKoaEXcSzMeLxPBeAm/
 xbDCvVy4ODIYU+OFCEeOpeQjZlI6fUn8z/+lMjXp4+a6vG6oC/7at0PekFJYxhilAPKs
 ZpTkQJ1T/QoEo19zje0kslhlrZof0JCf6HHuhaZu3XsLIngx5cFPEV4v/v5yfANhH1DQ
 HH0dOdc7oOFMso0Wk40GGPwOe1rjhORYvmjzDw2xPdOgKzNnv59LTnCCM/ObUyZthA7c
 04Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LV9yHRrbRYyzljdGU/CfR8v0ZhaSbt52WIgZUogEioQ=;
 b=O8xMWjUs/drAzyXriyYpqXPwPE/yEu+lysSsrJzy2rSxEYd65je6wsYc5BRwAYld3a
 qpafRBJhOuARKvoH+GPhoqKno6dk3UhbExrq/PQ58mOs0BUB5uBmLUUHeagDMy1BwBmb
 hJKXHazvxWSaVRey3/3lOP7qDrho21VwU2dopO9lOt2R7Z9B/kJRmSl3RSXm14FRyJ9t
 C7Z5KotgYTFE/tjJg7L47u29I5Feo8Df7QrD95765w2iOXrWhWbFWNcxy14vgTj2fYrc
 MLFhCyekgVuXWnh18b4sW2meMEHWTh4TXnBeroSPyGSy6k9L86N9X+EKbdJ6Ae1aNR57
 OSpA==
X-Gm-Message-State: AOAM5317/7n3sff6xDGAR+zdumSCjfW96WjVuLdY+tjc2hxB0G8e5QsS
 jJ4Eoj4AzQHVeLNtynIbQDZEeo0ZihIyJB1muBk=
X-Google-Smtp-Source: ABdhPJwZJ4+zg4T2/qtt1dsGjAQoG1RAItEpIVrJ1kxx/hRxlDWq6MMEn8ThPo0LtPquoSiHs0VyDj2UE1lx2SofoyI=
X-Received: by 2002:a2e:84d7:: with SMTP id q23mr15606590ljh.108.1632555985465; 
 Sat, 25 Sep 2021 00:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210924213946.2888625-1-fontaine.fabrice@gmail.com>
 <20210925063209.GJ3176@scaer> <20210925064915.GK3176@scaer>
In-Reply-To: <20210925064915.GK3176@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 25 Sep 2021 09:45:55 +0200
Message-ID: <CAPi7W83g2aRRRMEQh0uhOY9roYzsVmX-Og3kSC-unocY4+0X+Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/2] package/lvm2: make a standard install
 for host
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCkxlIHNhbS4gMjUgc2VwdC4gMjAyMSDDoCAwODo0OSwgWWFubiBFLiBNT1JJTiA8eWFu
bi5tb3Jpbi4xOTk4QGZyZWUuZnI+IGEgw6ljcml0IDoKPgo+IEZhYnJpY2UsIEFsbCwKPgo+IE9u
IDIwMjEtMDktMjUgMDg6MzIgKzAyMDAsIFlhbm4gRS4gTU9SSU4gc3Bha2UgdGh1c2x5Ogo+ID4g
T24gMjAyMS0wOS0yNCAyMzozOSArMDIwMCwgRmFicmljZSBGb250YWluZSBzcGFrZSB0aHVzbHk6
Cj4gPiA+IE1ha2UgYSBzdGFuZGFyZCBpbnN0YWxsIChpLmUuIHdpdGggcHZjcmVhdGUpIGZvciBo
b3N0IGFzIGl0IGlzIG5lZWRlZAo+ID4gPiBmb3IgbGlidmlydAo+ID4gPgo+ID4gPiBTaWduZWQt
b2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KPiA+
ID4gLS0tCj4gPiA+ICBwYWNrYWdlL2x2bTIvbHZtMi5tayB8IDMgKy0tCj4gPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYg
LS1naXQgYS9wYWNrYWdlL2x2bTIvbHZtMi5tayBiL3BhY2thZ2UvbHZtMi9sdm0yLm1rCj4gPiA+
IGluZGV4IDNhOTRhZWJmZDQuLmQ5MThiNWY1YjYgMTAwNjQ0Cj4gPiA+IC0tLSBhL3BhY2thZ2Uv
bHZtMi9sdm0yLm1rCj4gPiA+ICsrKyBiL3BhY2thZ2UvbHZtMi9sdm0yLm1rCj4gPiA+IEBAIC03
Miw4ICs3Miw3IEBAIEhPU1RfTFZNMl9DT05GX09QVFMgPSBcCj4gPiA+ICAgICAtLWRpc2FibGUt
ZnNhZG0gXAo+ID4gPiAgICAgLS1kaXNhYmxlLXJlYWRsaW5lIFwKPiA+ID4gICAgIC0tZGlzYWJs
ZS1zZWxpbnV4Cj4gPiA+IC1IT1NUX0xWTTJfTUFLRV9PUFRTID0gZGV2aWNlLW1hcHBlcgo+ID4g
PiAtSE9TVF9MVk0yX0lOU1RBTExfT1BUUyA9IGluc3RhbGxfZGV2aWNlLW1hcHBlcgo+ID4gPiAr
SE9TVF9MVk0yX0lOU1RBTExfT1BUUyA9IERFU1RESVI9JChIT1NUX0RJUikgaW5zdGFsbAo+ID4K
PiA+IERFU1RESVIgbXVzdCBub3QgYmUgdXNlZCBmb3IgaG9zdCB2YXJpYW50cy4KPiA+Cj4gPiBJ
bmRlZWQsIHRoZXkgYXJlIGFscmVhZHkgY29uZmlndXJlZCB3aXRoIC0tcHJlZml4PSQoSE9TVF9E
SVIpIDoKPiA+ICAgICBodHRwczovL2dpdC5idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC90cmVlL3Bh
Y2thZ2UvcGtnLWF1dG90b29scy5tayNuMjIzCj4gPgo+ID4gQW5kIERFU1RESVIgaXMgZm9yIG91
dC1vZi10cmVlIGluc3RhbGxhdGlvbiwgYnV0IGZvciBob3N0IHBhY2thZ2VzIHdlIGRvCj4gPiBu
b3QgaW5zdGFsbCBvdXQtb2YtdHJlZSBhcyB0aGVpciBwcmVmaXggaXMgYWxyZWFkeSBjb3JyZWN0
Lgo+ID4gICAgIGh0dHBzOi8vd3d3LmdudS5vcmcvc29mdHdhcmUvYXV0b21ha2UvbWFudWFsL2F1
dG9tYWtlLmh0bWwjREVTVERJUgo+ID4KPiA+IElmIHRoZSBpbnN0YWxsIGZhaWxzIGJlY2F1c2Ug
b2YgdGhpbmdzIGluc3RhbGxlZCBpbiAvZXRjIGFuZCBzdWNoLCB0aGVuCj4gPiBhcHByb3ByaWF0
ZSAtLXN5c2NvbmZkaXI9JChIT1NUX0RJUikvZXRjIGV0IGFsLiBzaG91bGQgYmUgc3BlY2lmaWVk
Cj4gPiBpbnN0ZWFkLiBPciBtYXliZSB3ZSBvbmx5IG5lZWQgJ21ha2UgaW5zdGFsbC1leGVjJyA/
Cj4KPiBsdm0yIGRvZXMgbm90IHN1cHBvcnQgaW5zdGFsbC1leGVjLi4uIDotLwpUaGFua3MgZm9y
IHlvdXIgcmV2aWV3LCBJJ2xsIHNlbmQgYSB2MiB3aGljaCB3aWxsIHVzZSAtLXdpdGgtY29uZmRp
ci4KPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KPgo+IC0tCj4gLi0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0t
LS0tLS0tLS4KPiB8ICBZYW5uIEUuIE1PUklOICB8IFJlYWwtVGltZSBFbWJlZGRlZCB8IC8iXCBB
U0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTogfAo+IHwgKzMzIDY2MiAzNzYgMDU2IHwg
U29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBBSUdOICAgICB8ICBfX18gICAgICAgICAgICAg
ICB8Cj4gfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5T
VCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKPiB8IGh0dHA6Ly95bW9yaW4uaXMtYS1nZWVr
Lm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYgICBjb25zcGlyYWN5LiAgfAo+
ICctLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
