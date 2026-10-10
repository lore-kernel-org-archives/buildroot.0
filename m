Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781BFCC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44ADC406AB;
	Tue, 13 Oct 2026 17:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S1bDX5nEjpcZ; Tue, 13 Oct 2026 17:55:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 64D5840675
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791914121;
	b=To0HXFUSaCpjHPN9ml3RU5dTFycXKYd6lamTxbDI63wcBm/gTP+tRUhY0OhqQNIAJMLS
	 q3aRy6MM20+sdhuN6rpBnk1+0j2JNCT5gw6Hzer9veipWXTM+DWaWqcipbVUMis0U5XKB
	 0VI6hn/8g8fpOSK8RafsklqNuBNFRkih9sJS2aKYmtaWmJ/pGtB7kCoHNlH2wbHXvULO6
	 QSIrHkbPx+G+/9EfcPl8Brqekyz+ZpHfJ3a0wBcRxQFWZ2gyMMS0B3eb5GAjiBvaKIM/l
	 vCOcntEnZJgF+Lrg3M64ZlRfe6XVn6RdvKb9W/l3We0oR+zTIh0G9hGvgURONI50ugw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791914121;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Yu1xfmzAbKkxBVS9Y/n6G0UT7kbIj4Nplve3hMxPOvQ=;
	b=Bmrkx2bKijBg/PpEpHVfxFbK3elVQWSyTgpzaSkTdQmVRF4p9LPIHy2lip1O7C6+y/9t
	 MPSSa5wvluaarGo48CKE/+cgVTmkZznyyDRyvqJphft/AxQlsWoTWfhzHoWxD6Wj1wlrq
	 y5r8YmkgTmr7xcMl9zH6xx48ejvi9+tpbu0KRJfVvH31sAM8DGK4jEEdgjoxhbHOxPgFN
	 FtZBOwUbpSbG6k9N9Z90nahp44eaUjNt3uRXq79wuSDr/H3e4s31hsiMVB2AWiPERzagK
	 FIEF21Jb797ffNP+vTdEMXOGozd6DE2NwzFbKvoO4WDpaIngxVceGws+ak8sGq0MdLw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791914121;
	bh=Yu1xfmzAbKkxBVS9Y/n6G0UT7kbIj4Nplve3hMxPOvQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EzVHch2q0CxMMQ6DNFBmZX+2InUd9Q3mOjhsaGWZWVvEDMXhvFGZlWCa7JD37Vrdt
	 Yux/pNrmN/BqVi6jCLZ85j5tJYdhnWllm1U3YoMYgbBSmERi8+5wonlbTrb6YKbFNy
	 1g6yKUKbd+xg/JeN498sPgFD2qtG3KMsGmIgpMCQT0G1+TpxZq5M1q96EzmHRLYuCO
	 o2MsLR8TidgnPLsHds8HAC2MOcIfOeBNys1DgAD+udSI8sGK5w+JiiWCHol0rnVmYa
	 Fm7xCS5OvRkZwLN5lSOZ4G6b9zrUiAcZQ4/YjhMHADQII6+kINglXMe5/9v2KmGnAd
	 WDdUobc+lbBKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64D5840675;
	Tue, 13 Oct 2026 17:55:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 65260362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56CD8402DF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NIlBfcTCIQlv for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:55:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 64ABB4002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791914118;
 b=WBFwmGaq2yQVPLi4XS7FIzsAQg8os597Y2DMDBOoxDAlo4or65/KcOeas9MejDFU8Ars
 r/agVXh+sboqIezxBGJgI6kHdDXvJ8OdxwDDmHVzgw5dPCrWB2tlrz3kAo4ly0BZuiKcq
 CH3eZVjMUt4YflY9eEnNtCfVeH04gjO2yr8qqHagUGZRmhEm4+uP+mKRBhF4aXHH0Xvna
 JS6ZG3vfX/BfQk0ejh2pk2AbLFBo8JYpGjcPFjgrwPpKmgCYBmd7VwAepzcXsX9eQvyZi
 5hkm2HhDffwrYgma892iluEG+yWp+oA3lZ3aU97hKei4YuVx2ytag2gse4CC4so5rDA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791914118;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:X-TUID:
 X-Last-TLS-Session-Version:X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=Ox15HIVt3wuRO4ze47xTmXgixU/8GX3pPf2MPxi7Ss4=;
 b=kWjL2fn1gXSyr7LYayRPwPULHgsjOtGWoHcUrqJBW8cAgnvEplWjJvaRlHsPpc0qDEqo
 ea/8m1ZeQP/JpCyvJObefpPvnXayttfW1kfqOCbrP3mswVmyha3FD0LoyynZSV9MdspTB
 i+QvghilUv64VTTZlgUCgpwkRNV7SsMQINBqqMTEhiZCRqT9MNyTZwaqydU0TEs6ZsZah
 NHUH/ktuXVoD/NOKg5glV/24metMa8vmMy6ZlVkVOeu4pdWhx9wpdZNQthstPZH9Q5P+V
 CH2B2GSPAbRnJd4Y72sCOLJ3E0cOneyMQ5+IHwRLjUOPKWMQ+n7R3RaShJ3R/BhW3nQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=exmCnewi; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64ABB4002B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 7062EC653FA
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:56:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BFC6360362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:55:15 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 3B9EA11D71897; Tue, 13 Oct 2026 19:50:45 +0200 (CEST)
Date: Sat, 10 Oct 2026 22:29:06 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Marcin Niestroj <m.niestroj@grinn-global.com>, 
 Rahul Bedarkar <rahulbedarkar89@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, 
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>, 
 Grzegorz Blach <grzegorz@blach.pl>, 
 =?utf-8?B?Sm9zw6k=?= Luis Salvador Rufo <salvador.joseluis@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, 
 Brandon Maier <brandon.maier@collins.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Chen Pei <cp0613@linux.alibaba.com>, Sergio Prado <sergio.prado@e-labworks.com>,
 Alistair Francis <alistair@alistair23.me>, Julien Olivain <ju.o@free.fr>, 
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, Bernd Kuhls <bernd@kuhls.net>,
 Gao Xiang <hsiangkao@aol.com>, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Etienne Carriere <etienne.carriere@foss.st.com>
Message-ID: <asqe8Y_KIKvapAfP@windsurf>
References: <20260721125337.2537436-1-dario.binacchi@amarulasolutions.com>
 <20260721125337.2537436-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260721125337.2537436-2-dario.binacchi@amarulasolutions.com>
X-TUID: NnlhCFb7oAx6
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 3B9EA11D71897
X-Spamd-Result: default: False [2.89 / 30.00]; SUSPICIOUS_RECIPS(1.50)[];
 DATE_IN_PAST(1.00)[69]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BAYES_HAM(-0.01)[44.54%];
 BCC(0.00)[]; RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 TAGGED_RCPT(0.00)[]; DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MISSING_XM_UA(0.00)[]; MIME_TRACE(0.00)[0:+];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 NEURAL_HAM(-0.00)[-1.000]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_TWELVE(0.00)[21];
 TO_MATCH_ENVRCPT_SOME(0.00)[];
 FREEMAIL_CC(0.00)[buildroot.org,grinn-global.com,gmail.com,vandijck-laurijssen.be,blach.pl,collins.com,bootlin.com,linux.alibaba.com,e-labworks.com,alistair23.me,free.fr,kuhls.net,aol.com,benettiengineering.com,foss.st.com];
 URIBL_BLOCKED(0.00)[bootlin.com:url,amarulasolutions.com:email,localhost:rdns,localhost:helo,gitlab.com:url];
 TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH v4 2/3] package/util-linux: libuuid needs MMU
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCBKdWwgMjEsIDIwMjYgYXQgMDI6NTM6MjlQTSArMDIwMCwgRGFyaW8gQmluYWNjaGkg
d3JvdGU6Cj4gV2hlbiBidWlsZGluZyB1dGlsLWxpbnV4IHdpdGggbGlidXVpZCBlbmFibGVkIG9u
IG5vTU1VIHRhcmdldHMKPiAoZS5nLiwgYm9vdGxpbi1hcm12N20tdWNsaWJjIG9yIGJvb3RsaW4t
bTY4ay01MjA4LXVjbGliYyksIHRoZSBidWlsZAo+IGZhaWxzIHdpdGggdGhlIGZvbGxvd2luZyBl
cnJvcjoKPiAKPiBsaWJ1dWlkL3NyYy9nZW5fdXVpZC5jOiBJbiBmdW5jdGlvbiDigJh1dWlkX2dl
bmVyYXRlX3RpbWVfZ2VuZXJpY+KAmToKPiBsaWJ1dWlkL3NyYy9nZW5fdXVpZC5jOjYyOToxNzog
ZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHB0aHJlYWRfYXRmb3Jr
4oCZOyBkaWQgeW91IG1lYW4g4oCYcHRocmVhZF9qb2lu4oCZPyBbLVdpbXBsaWNpdC1mdW5jdGlv
bi1kZWNsYXJhdGlvbl0KPiAgIDYyOSB8ICAgICAgICAgICAgICAgICBwdGhyZWFkX2F0Zm9yayhO
VUxMLCBOVUxMLCByZXNldF91dWlkZF9jYWNoZSk7Cj4gICAgICAgfCAgICAgICAgICAgICAgICAg
Xn5+fn5+fn5+fn5+fn4KPiAgICAgICB8ICAgICAgICAgICAgICAgICBwdGhyZWFkX2pvaW4KPiAK
PiBUaGlzIGhhcHBlbnMgYmVjYXVzZSBwdGhyZWFkX2F0Zm9yaygpIGlzIG5vdCBhdmFpbGFibGUg
b24gbm9NTVUKPiBjb25maWd1cmF0aW9ucyBhcyByZXBvcnRlZCBieSBjb21taXQgNTlmZTc1NDdh
NDk1ICgicGFja2FnZS9saWJjYXAtbmc6Cj4gZGlzYWJsZSBwdGhyZWFkIHN1cHBvcnQgb24gbm9t
bXUiKS4KPiAKPiBGaXggdGhpcyBieSBhZGRpbmcgYSBkZXBlbmRlbmN5IG9uIEJSMl9VU0VfTU1V
IHRvIGxpYnV1aWQuIEFzIGEKPiBjb25zZXF1ZW5jZSwgYWxzbyBwcm9wYWdhdGUgdGhlIEJSMl9V
U0VfTU1VIGRlcGVuZGVuY3kgdG8gYWxsIHBhY2thZ2VzCj4gc2VsZWN0aW5nIEJSMl9QQUNLQUdF
X1VUSUxfTElOVVhfTElCVVVJRCB0byBwcmV2ZW50ICJ1bm1ldCBkaXJlY3QKPiBkZXBlbmRlbmNp
ZXMiIEtjb25maWcgZXJyb3JzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxk
YXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KPiAKClRoYW5rcywgYnV0IHdlIGlu
c3RlYWQgY29tbWl0dGVkOgoKICBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWls
ZHJvb3QvLS9jb21taXQvZDQyZmE5MTIyNzQ5OTc5ZTRlNDIyNmY4NWVjYTUxN2ZiNjRlYjc4MAoK
VGhvbWFzIFBldGF6em9uaQotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmlu
ZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
