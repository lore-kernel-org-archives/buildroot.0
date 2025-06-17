Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AE9EC71136
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 15:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DAD460906;
	Tue, 17 Jun 2025 15:43:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8bXHG6PgfnYq; Tue, 17 Jun 2025 15:43:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70DF96087A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70DF96087A;
	Tue, 17 Jun 2025 15:43:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2D0B16B
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 15:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99661406EA
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 15:43:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeIaDKcTsK8T for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 15:43:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=fabien.lehoussel@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A01A2406CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A01A2406CA
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A01A2406CA
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 15:43:38 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-551efd86048so5810010e87.3
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 08:43:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750175016; x=1750779816;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Em3AH4H5IqqXYR4QTXvk0pzVO7jlF5vkUW7WazDc7n8=;
 b=hYlp4OFh5CFjOd/p/lMoHSbP5vfuYo4QN+2LMyajUMuPDtzO73BdHFdPHdn9grujdh
 aFQO7GE6iUZFr2HZWT+tMHqWwSbvjgqSXSIgmljJuvd1xrxFyWQ5HjdUKLRghFf6yz42
 ODOro4vBeJAb04mymNcBdQ6utGKwlp0KNnoaBr04A3FgI324BTywjPxe4H9pa7kUl5TJ
 5QZWPLHtrLPRujGGHJVnAvEdNRoZj9QWkbf2daqMAajTnctNzceg6om/KfBXiogiesiz
 oNJlsGhxD60q7ILxTVxYJwZ20F9351u5VJuWFTiDftG/Ckyj9nt3NRgbD9aqsetWp216
 HgXQ==
X-Gm-Message-State: AOJu0Yy6TQgNzKisZAnlLE/8p4Q1+ZdNgldEhqS7cgIYV8q9cOJ7oTBi
 lagIUE4auwsoSB1e25GaoaEZ0l/j6s9I2cRR0gDKLyyAe+xIhEs3N000tt1QmDqWtcIbk2K6puX
 IhBkfC+TCSVuSTLSXBXJNuwMiW9h+gx5eL/l49ANN0lHkrHnRk6N87/I=
X-Gm-Gg: ASbGncs+wuX1BnV4NMAXYOPuEWY0v08x5ZwOzoxM6cy4EwGMzZSY9eifUrlg3Sr69yC
 DAbsHLCDx2iqHwWu0XEWoyPYG/KlSY08M3MzTTg7VruufRzXR7ENm+NCju5oca33AEWW8mv0Y56
 bvONhbHCXBGDzk4CtGCRikebYsv816rhSSy5GbLp/nsnzX/OtrFdocB425nTWQ35vplWgHdEDww
 lrWCAdewI7S
X-Google-Smtp-Source: AGHT+IHmmI34IssZnQ7Pp4tnd+ZjG20buE+1DS//IsjQdApfWOBC8johN4t2Mhw1dJqyjDaz95D/SqFhH5W/WtP09Y8=
X-Received: by 2002:a05:6512:23a9:b0:553:d14d:73fd with SMTP id
 2adb3069b0e04-553d14d75femr331302e87.43.1750175016352; Tue, 17 Jun 2025
 08:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250613110559.2665663-1-fabien.lehoussel@smile.fr>
 <20250613110559.2665663-3-fabien.lehoussel@smile.fr>
 <77a07764-6c98-4583-91c1-0c9b5384ec22@rnout.be>
In-Reply-To: <77a07764-6c98-4583-91c1-0c9b5384ec22@rnout.be>
Date: Tue, 17 Jun 2025 17:43:25 +0200
X-Gm-Features: AX0GCFtgxPxD_uYIbLzvoHo1nVQ5N1or5gcT_bbaUZ9WUMQT_ZozJ03ajxKCj9Y
Message-ID: <CAKWtHtx_eDMvh9RDs4ecXLFaadYE6Jd-vhUApntL0m22XpT5Fg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org, Thomas Perale <thomas.perale@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1750175016; x=1750779816; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Em3AH4H5IqqXYR4QTXvk0pzVO7jlF5vkUW7WazDc7n8=;
 b=gsr67l2a1ArGVcuLxjGmy7/I/aWp9RMOsyPHb/QYvJ6cLH0w1Ih/uyOV9pB8DcSYdu
 TaEzbzC0O++0CuBZWMKIo0ziZ7xQXm8PLWzAlzFyqw4RLYxigLAzJZ1cdyJmrRj/5ZRh
 okd55fJaUSPRGR3NcWzeo3YD5RdES5qiZTSPI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=gsr67l2a
Subject: Re: [Buildroot] [PATCH 3/7] utils/generate-cyclonedx: move metadata
 section to top level
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

TGUgbHVuLiAxNiBqdWluIDIwMjUgw6AgMjE6NTEsIEFybm91dCBWYW5kZWNhcHBlbGxlIDxhcm5v
dXRAcm5vdXQuYmU+IGEgw6ljcml0IDoKPgo+Cj4KPiBPbiAxMy8wNi8yMDI1IDEzOjA1LCBGYWJp
ZW4gTGVob3Vzc2VsIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJp
ZW4gTGVob3Vzc2VsIDxmYWJpZW4ubGVob3Vzc2VsQHNtaWxlLmZyPgo+ID4gLS0tCj4gPiAgIHV0
aWxzL2dlbmVyYXRlLWN5Y2xvbmVkeCB8IDE2ICsrKysrKysrLS0tLS0tLS0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4IGIvdXRpbHMvZ2VuZXJhdGUtY3ljbG9uZWR4
Cj4gPiBpbmRleCAyYzIzNGUxYTQ1Li5hMDY5ZjQ2N2I2IDEwMDc1NQo+ID4gLS0tIGEvdXRpbHMv
Z2VuZXJhdGUtY3ljbG9uZWR4Cj4gPiArKysgYi91dGlscy9nZW5lcmF0ZS1jeWNsb25lZHgKPiA+
IEBAIC0zMDEsNiArMzAxLDE0IEBAIGRlZiBtYWluKCk6Cj4gPiAgICAgICAgICAgImJvbUZvcm1h
dCI6ICJDeWNsb25lRFgiLAo+ID4gICAgICAgICAgICIkc2NoZW1hIjogZiJodHRwOi8vY3ljbG9u
ZWR4Lm9yZy9zY2hlbWEvYm9tLXtDWUNMT05FRFhfVkVSU0lPTn0uc2NoZW1hLmpzb24iLAo+ID4g
ICAgICAgICAgICJzcGVjVmVyc2lvbiI6IGYie0NZQ0xPTkVEWF9WRVJTSU9OfSIsCj4gPiArICAg
ICAgICAibWV0YWRhdGEiOiB7Cj4gPiArICAgICAgICAgICAgImNvbXBvbmVudCI6IHsKPiA+ICsg
ICAgICAgICAgICAgICAgImJvbS1yZWYiOiAiYnVpbGRyb290IiwKPiA+ICsgICAgICAgICAgICAg
ICAgIm5hbWUiOiAiYnVpbGRyb290IiwKPiA+ICsgICAgICAgICAgICAgICAgInR5cGUiOiAiZmly
bXdhcmUiLAo+ID4gKyAgICAgICAgICAgICAgICAidmVyc2lvbiI6IGYie0JSMl9WRVJTSU9OX0ZV
TEx9IiwKPiA+ICsgICAgICAgICAgICB9LAo+ID4gKyAgICAgICAgfSwKPgo+ICAgSSBkb24ndCB1
bmRlcnN0YW5kIHRoZSByZWFzb24gZm9yIHRoaXMgY2hhbmdlLi4uIEknbSBub3Qgc2F5aW5nIHRo
YXQgdGhlCj4gb3JkZXJpbmcgY291bGRuJ3QgYmUgaW1wcm92ZWQsIGJ1dCB0aGVuIGl0IHNob3Vs
ZCBiZSBhIGxvZ2ljYWwgY2hvaWNlLiBUaGlzIG5ldwo+IG9yZGVyaW5nIGlzIG5vdCBhbHBoYWJl
dGljYWwsIGFuZCBhbHNvIGRvZXNuJ3QgZm9sbG93aW5nIHRoZSBvcmRlcmluZyBvZiB0aGUKPiBz
cGVjIChvciBhdCBsZWFzdCwgbm90IGNvbXBsZXRlbHksIGJlY2F1c2UgdGhlIHNjaGVtYSBwdXRz
IHRoZSAkc2NoZW1hIHByb3BlcnR5Cj4gZmlyc3QpLiBBY3R1YWxseSwgdGhhdCB3YXMgcHJvYmFi
bHkgdGhlIGlkZWEsIHRvIGZvbGxvdyB0aGUgb3JkZXJpbmcgb2YgdGhlCj4gc3BlYywgYnV0IHRo
ZW4gcGxlYXNlIHNheSBzbyBpbiB0aGUgY29tbWl0IG1lc3NhZ2UsIGFuZCBkbyBpdCBmb3IgYWxs
Cj4gcHJvcGVydGllcy4gUGVyaGFwcyBhbHNvIGNoZWNrIGlmIHRoZSBvdGhlciBwcm9wZXJ0aWVz
IGFyZSBvcmRlcmVkIGNvcnJlY3RseS4KPgo+ICAgUmVnYXJkcywKPiAgIEFybm91dAoKVGhlIGlu
dGVudGlvbiB3YXMgdG8gbWFrZSB0aGUgU0JPTSBtb3JlIHJlYWRhYmxlIGJ5IHBsYWNpbmcgdGhl
Cm1ldGFkYXRhIHNlY3Rpb24gYXQgdGhlIHRvcCBvZiB0aGUgZmlsZSwgbWFraW5nIGl0IGVhc2ll
ciB0byBxdWlja2x5CmlkZW50aWZ5IGJhc2ljIGluZm9ybWF0aW9uLgpUaGlzIGlzIHBhcnRpY3Vs
YXJseSB1c2VmdWwgaW4gY29uanVuY3Rpb24gd2l0aCBteSBuZXh0IHBhdGNoIHRoYXQKYWRkcyBw
cm9qZWN0IG5hbWUgYW5kIHZlcnNpb24gY3VzdG9taXphdGlvbiBvcHRpb25zLgoKSSB3aWxsIHVw
ZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UgaW4gdjIgdG8gY2xhcmlmeS4KCgpGYWJpZW4KCj4gPiAg
ICAgICAgICAgImNvbXBvbmVudHMiOiBbCj4gPiAgICAgICAgICAgICAgIGN5Y2xvbmVkeF9jb21w
b25lbnQobmFtZSwgY29tcCkgZm9yIG5hbWUsIGNvbXAgaW4gZmlsdGVyZWRfc2hvd19pbmZvX2Rp
Y3QuaXRlbXMoKQo+ID4gICAgICAgICAgIF0sCj4gPiBAQCAtMzEwLDE0ICszMTgsNiBAQCBkZWYg
bWFpbigpOgo+ID4gICAgICAgICAgICAgICAgIGZvciByZWYgaW4gZmlsdGVyZWRfc2hvd19pbmZv
X2RpY3RdLAo+ID4gICAgICAgICAgIF0sCj4gPiAgICAgICAgICAgInZ1bG5lcmFiaWxpdGllcyI6
IGN5Y2xvbmVkeF92dWxuZXJhYmlsaXRpZXMoc2hvd19pbmZvX2RpY3QpLAo+ID4gLSAgICAgICAg
Im1ldGFkYXRhIjogewo+ID4gLSAgICAgICAgICAgICJjb21wb25lbnQiOiB7Cj4gPiAtICAgICAg
ICAgICAgICAgICJib20tcmVmIjogImJ1aWxkcm9vdCIsCj4gPiAtICAgICAgICAgICAgICAgICJu
YW1lIjogImJ1aWxkcm9vdCIsCj4gPiAtICAgICAgICAgICAgICAgICJ0eXBlIjogImZpcm13YXJl
IiwKPiA+IC0gICAgICAgICAgICAgICAgInZlcnNpb24iOiBmIntCUjJfVkVSU0lPTl9GVUxMfSIs
Cj4gPiAtICAgICAgICAgICAgfSwKPiA+IC0gICAgICAgIH0sCj4gPiAgICAgICB9Cj4gPgo+ID4g
ICAgICAgYXJncy5vdXRfZmlsZS53cml0ZShqc29uLmR1bXBzKGN5Y2xvbmVkeF9kaWN0LCBpbmRl
bnQ9MikpCj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
