Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4582CC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 17:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADF2D610B0;
	Tue, 26 Jul 2022 17:41:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADF2D610B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CEMG3KsaN2gj; Tue, 26 Jul 2022 17:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C603060EE4;
	Tue, 26 Jul 2022 17:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C603060EE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8CFD41BF957
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7009560EE4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 17:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7009560EE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1lUiMDraTAD for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 17:41:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C19260EE1
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C19260EE1
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 17:41:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id m17so20858301wrw.7
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 10:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lEZ5fVxZB9BEK+V8IcXqWEZjos/dh5powURA9Oga93A=;
 b=ogwwlXVaoqHWOJR1MP0nZv3u2uavhfNAoUMmRLJlk71yl0V2qtnuQcC6lOsep+3l7t
 OJHHCvhMRgmjy2eUeWxUizVyUtWfNoLTsIRqerdHCbBdeKx8TnZzA62ggfKF90pnEjTE
 y8fwS/OPeRuhegV7B3A4M5QFGKbrZo0mvpIDQR1V2OCDv8eWQ1GYLoNBNpA6H5/YceZq
 rf43M8xOVL4dgOPlman5hPvm8sDd4IZNO3CaIsvwkMnzLz29Fl4HmXw5TND63nKZBURj
 0VDR3bI3of+e191SF2MBjF+vZAqVZOnyNFIlGUkyCE9rVh22P7SfwVQJJZlOgUK4bYOI
 Co4w==
X-Gm-Message-State: AJIora/nJfFem0nj/2CqFwLS51jvJbxI+KRFcrLvdajeZum8weyBo5e3
 wN6NrqsuYPHmQ6NXtNVaAJVN831wiK6gYQ==
X-Google-Smtp-Source: AGRyM1vHhVJzXvjnEtphfthvBtW4lDDd5J5ZhhBvyUXqbWsHRNRiER2m+EgyZx73lRbE7ClU+FGCgw==
X-Received: by 2002:a05:6000:178c:b0:21e:9970:fa7 with SMTP id
 e12-20020a056000178c00b0021e99700fa7mr3780572wrg.133.1658857278325; 
 Tue, 26 Jul 2022 10:41:18 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 be13-20020a05600c1e8d00b003a340fb163csm15829454wmb.8.2022.07.26.10.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 10:41:18 -0700 (PDT)
Message-ID: <d37f0028-7f29-8e6e-54c5-c9e7de548b2c@smile.fr>
Date: Tue, 26 Jul 2022 19:41:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>, buildroot@buildroot.org
References: <20220208162409.496110-1-gwenj@trabucayre.com>
 <20220208162409.496110-2-gwenj@trabucayre.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220208162409.496110-2-gwenj@trabucayre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lEZ5fVxZB9BEK+V8IcXqWEZjos/dh5powURA9Oga93A=;
 b=QLc+jI0qsmMBRpEsjVYEz3C/qMg//IncF7mBBffZgyU91uBmGtHBqMiBI5BEhqanft
 dfjN1EHBR/wm4p9eF+HQe1v80RiCEmS90C/eQ0yrRIGPZCRzOlmc8MBCCCa4Uw4zDU39
 iAR62l/o3dsW9aE1MhIDvXICXbEiSbvkg1xXIYZNcIg4YoPnOnDBFKqK7TSoDmArLOPt
 YSchs4tyMzoi2482hHwUqK88OM8CbUrphJ3Z7AKmSShJdY7t97TnDlS3jcBKtVKgpinj
 lmQYE6xpZcJUgatKxUwrTJbqI33kivAzW8s/i7WPGjTNv5G1JQ20d4VzDZEgRTyOZzhz
 ekGg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=QLc+jI0q
Subject: Re: [Buildroot] [PATCH 2/2] package/gnuradio: move to package/volk
 instead of using the internal one
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR3dlbmhhZWwsCgpMZSAwOC8wMi8yMDIyIMOgIDE3OjI0LCBHd2VuaGFlbCBHb2F2ZWMt
TWVyb3UgYSDDqWNyaXTCoDoKPiBGcm9tOiBHd2VuaGFlbCBHb2F2ZWMtTWVyb3UgPGd3ZW5oYWVs
LmdvYXZlYy1tZXJvdUB0cmFidWNheXJlLmNvbT4KPiAKPiBVbnRpbCByZWNlbnQgcmVsZWFzZXMg
R05VUmFkaW8gd2FzIHNoaXBwZWQgd2l0aCB2b2xrIGFzIGEgc3VibW9kdWxlLiBXaXRoIDMuOQo+
IGFuZCAzLjEwIHRoaXMgaXMgbm8gbW9yZSB0cnVlIGFuZCByZXF1aXJlcyBidWlsZGluZyB2b2xr
IGJlZm9yZSBHTlVSYWRpby4KCkN1cnJlbnRseSBCdWlsZHJvb3Qgc3RpbGwgcHJvdmlkZSBnbnVy
YWRpbyAzLjgsIGFkZGluZyB2b2xrIGRlcGVuZGVuY3kgaGVyZSBpcyBhCnByZWxpbWluYXJ5IHdv
cmsgYmVmb3JlIGJ1bXBpbmcgZ251cmFkaW8gdG8gYSBuZXdlciB2ZXJzaW9uLgoKPiAKPiBUaGlz
IHBhdGNoIGRpc2FibGUgaW50ZXJuYWwncyB2b2xrLCBhbmQgYWRkIGEgZGVwZW5kZW5jeSB0byB0
aGUgY29ycmVzcG9uZGluZwo+IHBhY2thZ2UsIHRvIHVzZSBpbmNvbmRpdGlvbm5hbHkgdGhlIG9u
ZSBidWlsZCBieSBidWlsZHJvb3QgCj4gCj4gU2lnbmVkLW9mZi1ieTogR3dlbmhhZWwgR29hdmVj
LU1lcm91IDxnd2VuaGFlbC5nb2F2ZWMtbWVyb3VAdHJhYnVjYXlyZS5jb20+Cj4gLS0tCj4gIHBh
Y2thZ2UvZ251cmFkaW8vQ29uZmlnLmluICAgfCAxICsKPiAgcGFja2FnZS9nbnVyYWRpby9nbnVy
YWRpby5tayB8IDQgKysrLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dudXJhZGlvL0NvbmZpZy5pbiBi
L3BhY2thZ2UvZ251cmFkaW8vQ29uZmlnLmluCj4gaW5kZXggMTg5NmQxMzI2YS4uMTAzMTc1OTQ2
YyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dudXJhZGlvL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2th
Z2UvZ251cmFkaW8vQ29uZmlnLmluCj4gQEAgLTI4LDYgKzI4LDcgQEAgY29uZmlnIEJSMl9QQUNL
QUdFX0dOVVJBRElPCj4gIAlzZWxlY3QgQlIyX1BBQ0tBR0VfQk9PU1RfVEhSRUFECj4gIAlzZWxl
Y3QgQlIyX1BBQ0tBR0VfTE9HNENQUAo+ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0dNUAo+ICsJc2Vs
ZWN0IEJSMl9QQUNLQUdFX1ZPTEsKCk1heWJlIHlvdSBjb3VsZCB1cGRhdGUgdGhlIGNvbW1lbnQg
b24gd2NoYXIgZGVwZW5kZW5jeToKCmRlcGVuZHMgb24gQlIyX1VTRV9XQ0hBUiAjIGJvb3N0LCB2
b2xrCgpSZXZpZXdlZC1ieTogUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAc21pbGUuZnI+CgpC
ZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gIAloZWxwCj4gIAkgIEdOVSBSYWRpbyBpcyBhIGZyZWUg
JiBvcGVuLXNvdXJjZSBzb2Z0d2FyZSBkZXZlbG9wbWVudAo+ICAJICB0b29sa2l0IHRoYXQgcHJv
dmlkZXMgc2lnbmFsIHByb2Nlc3NpbmcgYmxvY2tzIHRvIGltcGxlbWVudAo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL2dudXJhZGlvL2dudXJhZGlvLm1rIGIvcGFja2FnZS9nbnVyYWRpby9nbnVyYWRp
by5tawo+IGluZGV4IDQxN2E1MWUwNjcuLmVkNzA2MGI4NWMgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9nbnVyYWRpby9nbnVyYWRpby5tawo+ICsrKyBiL3BhY2thZ2UvZ251cmFkaW8vZ251cmFkaW8u
bWsKPiBAQCAtMTksMTMgKzE5LDE1IEBAIEdOVVJBRElPX0RFUEVOREVOQ0lFUyA9IFwKPiAgCWhv
c3Qtc3dpZyBcCj4gIAlib29zdCBcCj4gIAlsb2c0Y3BwIFwKPiAtCWdtcAo+ICsJZ21wIFwKPiAr
CXZvbGsKPiAgCj4gIEdOVVJBRElPX0NPTkZfT1BUUyA9IFwKPiAgCS1EUFlUSE9OX0VYRUNVVEFC
TEU9JChIT1NUX0RJUikvYmluL3B5dGhvbjMgXAo+ICAJLURFTkFCTEVfREVGQVVMVD1PRkYgXAo+
ICAJLURFTkFCTEVfVk9MSz1PTiBcCj4gIAktREVOQUJMRV9HTlVSQURJT19SVU5USU1FPU9OIFwK
PiArCS1ERU5BQkxFX0lOVEVSTkFMX1ZPTEs9T0ZGIFwKPiAgCS1ERU5BQkxFX1RFU1RJTkc9T0ZG
IFwKPiAgCS1EWE1MVE9fRVhFQ1VUQUJMRT1OT1RGT1VORAo+ICAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
