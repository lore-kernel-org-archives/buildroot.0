Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81835C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 20:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1946381764;
	Tue, 26 Jul 2022 20:39:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1946381764
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZO_QcMuFFWiG; Tue, 26 Jul 2022 20:39:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCDD81756;
	Tue, 26 Jul 2022 20:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BCDD81756
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0FCD31BF3EF
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:39:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAA35606A9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 20:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAA35606A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRfsizTv_kg9 for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 20:39:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92AC16063B
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92AC16063B
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 20:39:38 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d8so21570799wrp.6
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:39:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6Aro6RRZEcIm8tl1UAV9p+lir8fPnkPVjrseQQQT12M=;
 b=xcTLwgFSOLt6kjkuK0N1RGUgPieHEoI5yphd+NrU/dekbFW3IPoiXUBwXFbYy8xX8U
 HwbqqKwVUKY70m4M42403E+lYqDxx8xH+TlfhZC/8Q0Kk6Mh8BwVGj7QzyG+jUifbuou
 CIbXkgAPsAW7pQfp4aY7UlldVrTaIPKFdPr0rSF1ZQsxtB5X5E1a/tH7q6+Qh1/k785c
 MveiHzV8NwUlKnxrDVGwY0Go5S6xY8pI/TABkYMWi7b+x6mMxsOH6td8fgORdtcaPRKz
 PGIzAtOVBwT1wViXAUS2SMwEfg1JbVlDf5HfjA8ji/82oNTj0q1Pwm8PRNOQg8G3VJ9W
 hhAQ==
X-Gm-Message-State: AJIora/a7lPFOVFwUBDCdK9ZYk5Ki7PgeX4KCNr8iQeawhbzfIM+luGe
 9q8OyqkjSg44wgPnjtoBU8EO/A==
X-Google-Smtp-Source: AGRyM1s/5RzU5MUeefz3umlae5eY7UlTXjFhIyUHPtYT3fgQxIlh/aXkgkYAMP3JxJ3BPS0WmwjWbA==
X-Received: by 2002:a05:6000:a0c:b0:21d:a699:d54e with SMTP id
 co12-20020a0560000a0c00b0021da699d54emr11381257wrb.605.1658867976731; 
 Tue, 26 Jul 2022 13:39:36 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:86bb:8231:62d7:1874?
 ([2a01:cb19:8acf:5600:86bb:8231:62d7:1874])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a05600c19cd00b003a2e1883a27sm31097wmq.18.2022.07.26.13.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Jul 2022 13:39:36 -0700 (PDT)
Message-ID: <c81db359-0722-44aa-05fb-c0f86fce0f54@smile.fr>
Date: Tue, 26 Jul 2022 22:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
References: <20220116175320.453041-1-gilles.talis@gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220116175320.453041-1-gilles.talis@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=6Aro6RRZEcIm8tl1UAV9p+lir8fPnkPVjrseQQQT12M=;
 b=ZRqQQFevNgqOJTvZtZ2f/U1DaIT3n64Kmw7TjkhUtC8PsDy6GSuU/Vt1Ncak3WFO7V
 G48aPIf7N0iPqbmxOWDKeidtFWn9Quu48pPAzpiUbR82wwKT7+lB3MDl0DZ0xezQwHwC
 1DCHZ1Rto5xRokZu9KDh5LFmyJ7T/UfQo/Fx7U3E/49xaEgJFDcLwQmPiuRG4/3Vi9hf
 sH0Ome5Ml2Ppj8CsGVQ/20OYJL5VxNdjiD2pxKonGoA0riOeyS/HNR/nwCX8H98IuS26
 C1l7taf4amjABseTmBdFpHOf9Zo6t/Y217caNRasOZGkU4CEVywISuSoX90/O9dUCtMe
 H8yQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
 header.i=@smile-fr.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=ZRqQQFev
Subject: Re: [Buildroot] [PATCH 1/2] package/opencl-clhpp: new package
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gR2lsbGVzLAoKTGUgMTYvMDEvMjAyMiDDoCAxODo1MywgR2lsbGVzIFRhbGlzIGEgw6lj
cml0wqA6Cj4gb3BlbmNsLWNsaHBwIGFyZSB0aGUgT3BlbkNMIEFQSSBDKysgYmluZGluZ3MKPiAK
PiBTaWduZWQtb2ZmLWJ5OiBHaWxsZXMgVGFsaXMgPGdpbGxlcy50YWxpc0BnbWFpbC5jb20+Cj4g
LS0tCj4gIERFVkVMT1BFUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBw
YWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPiAgcGFja2FnZS9v
cGVuY2wtY2xocHAvQ29uZmlnLmluICAgICAgICAgfCAxMCArKysrKysrKysrCj4gIHBhY2thZ2Uv
b3BlbmNsLWNsaHBwL29wZW5jbC1jbGhwcC5oYXNoIHwgIDMgKysrCj4gIHBhY2thZ2Uvb3BlbmNs
LWNsaHBwL29wZW5jbC1jbGhwcC5tayAgIHwgMTYgKysrKysrKysrKysrKysrKwo+ICA1IGZpbGVz
IGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
b3BlbmNsLWNsaHBwL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVu
Y2wtY2xocHAvb3BlbmNsLWNsaHBwLmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
b3BlbmNsLWNsaHBwL29wZW5jbC1jbGhwcC5tawo+IAo+IGRpZmYgLS1naXQgYS9ERVZFTE9QRVJT
IGIvREVWRUxPUEVSUwo+IGluZGV4IGE5MWUyZGZjZGUuLjQ4M2FmYTQ5MzIgMTAwNjQ0Cj4gLS0t
IGEvREVWRUxPUEVSUwo+ICsrKyBiL0RFVkVMT1BFUlMKPiBAQCAtMTA4NCw2ICsxMDg0LDcgQEAg
RjoJcGFja2FnZS9saWJlWG9zaXAyLwo+ICBGOglwYWNrYWdlL2xpYm9sbS8KPiAgRjoJcGFja2Fn
ZS9saWJvc2lwMi8KPiAgRjoJcGFja2FnZS9vY3JhZC8KPiArRjoJcGFja2FnZS9vcGVuY2wtY2xo
cHAvCj4gIEY6CXBhY2thZ2Uvb3B1c2ZpbGUvCj4gIEY6CXBhY2thZ2UvcmVzdGNsaWVudC1jcHAv
Cj4gIEY6CXBhY2thZ2UvdGVzc2VyYWN0LW9jci8KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9Db25m
aWcuaW4gYi9wYWNrYWdlL0NvbmZpZy5pbgo+IGluZGV4IDRkZjE0NzRiOTEuLjA4ZWIzYWQ4MDkg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9Db25maWcuaW4KPiArKysgYi9wYWNrYWdlL0NvbmZpZy5p
bgo+IEBAIC0xNTY0LDYgKzE1NjQsNyBAQCBtZW51ICJHcmFwaGljcyIKPiAgCXNvdXJjZSAicGFj
a2FnZS9saWJ2aXBzL0NvbmZpZy5pbiIKPiAgCXNvdXJjZSAicGFja2FnZS9saWJ3cGUvQ29uZmln
LmluIgo+ICAJc291cmNlICJwYWNrYWdlL21lbnUtY2FjaGUvQ29uZmlnLmluIgo+ICsJc291cmNl
ICJwYWNrYWdlL29wZW5jbC1jbGhwcC9Db25maWcuaW4iCgpJcyBvcGVuY2wgaGVhZGVycyBzaG91
bGQgcmVhbGx5IGJlbG9uZyB0byAiR3JhcGhpY3MiIGxpYnJhcnkgbWVudT8KCm1heWJlICJIYXJk
d2FyZSBoYW5kbGluZyIgb3IgaW4gbGFzdCByZXNvcnQgIm90aGVyIj8KCj4gIAlzb3VyY2UgInBh
Y2thZ2Uvb3BlbmN2My9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2Uvb3BlbmN2NC9Db25m
aWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2Uvb3BlbmdsL0NvbmZpZy5pbiIKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9vcGVuY2wtY2xocHAvQ29uZmlnLmluIGIvcGFja2FnZS9vcGVuY2wtY2xocHAv
Q29uZmlnLmluCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4xMjA0
NWJlMDU1Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2Uvb3BlbmNsLWNsaHBwL0NvbmZp
Zy5pbgo+IEBAIC0wLDAgKzEsMTAgQEAKPiArY29uZmlnIEJSMl9QQUNLQUdFX09QRU5DTF9DTEhQ
UAo+ICsJYm9vbCAib3BlbmNsLWNsaHBwIgo+ICsJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJT
VERDUFAKClRoZSBDTWFrZSBidWlsZCBzeXN0ZW0gcmVxdWlyZXMgYSBDKysxMSBjb21waWxlciwg
c28gYSBnY2MgNC44IG9yIG5ld2VyIGlzIHJlcXVpcmVkLgoKCj4gKwloZWxwCj4gKwkgIG9wZW5j
bC1jbGhwcCBhcmUgdGhlIE9wZW5DTCBBUEkgQysrIGJpbmRpbmdzCj4gKwo+ICsJICBodHRwOi8v
Z2l0aHViLmtocm9ub3Mub3JnL09wZW5DTC1DTEhQUC8KPiArCj4gK2NvbW1lbnQgIm9wZW5jbC1j
bGhwcCBuZWVkcyBhIHRvb2xjaGFpbiB3LyBDKysiCj4gKwlkZXBlbmRzIG9uICFCUjJfSU5TVEFM
TF9MSUJTVERDUFAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuY2wtY2xocHAvb3BlbmNsLWNs
aHBwLmhhc2ggYi9wYWNrYWdlL29wZW5jbC1jbGhwcC9vcGVuY2wtY2xocHAuaGFzaAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uMjdiMjdjZDgwYwo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9wYWNrYWdlL29wZW5jbC1jbGhwcC9vcGVuY2wtY2xocHAuaGFzaAo+IEBA
IC0wLDAgKzEsMyBAQAo+ICsjIExvY2FsbHkgQ29tcHV0ZWQKPiArc2hhMjU2ICA4Njk0NTYwMzJl
NjA3ODdlZWQ5ZmNlYWVhZjZjNmNiNDQ1MmJjMGZmOTdlMGY1YTI3MTUxMDE0NWExYzhmNGQ0ICBv
cGVuY2wtY2xocHAtMi4wLjE2LnRhci5nego+ICtzaGEyNTYgIGNmYzc3NDliOTZmNjNiZDMxYzNj
NDJiNWM0NzFiZjc1NjgxNDA1M2U4NDdjMTBmM2ViMDAzNDE3YmM1MjNkMzAgIExJQ0VOU0UudHh0
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BlbmNsLWNsaHBwL29wZW5jbC1jbGhwcC5tayBiL3Bh
Y2thZ2Uvb3BlbmNsLWNsaHBwL29wZW5jbC1jbGhwcC5tawo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0
Cj4gaW5kZXggMDAwMDAwMDAwMC4uNjEwY2Q0NWI2Mgo+IC0tLSAvZGV2L251bGwKPiArKysgYi9w
YWNrYWdlL29wZW5jbC1jbGhwcC9vcGVuY2wtY2xocHAubWsKPiBAQCAtMCwwICsxLDE2IEBACj4g
KyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCj4gKyMKPiArIyBvcGVuY2wtY2xocHAKPiArIwo+ICsj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsKPiArT1BFTkNMX0NMSFBQX1ZFUlNJT04gPSAyLjAu
MTYKPiArT1BFTkNMX0NMSFBQX1NJVEUgPSAkKGNhbGwgZ2l0aHViLEtocm9ub3NHcm91cCxPcGVu
Q0wtQ0xIUFAsdiQoT1BFTkNMX0NMSFBQX1ZFUlNJT04pKQo+ICtPUEVOQ0xfQ0xIUFBfTElDRU5T
RSA9IEFwYWNoZS0yLjAKPiArT1BFTkNMX0NMSFBQX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLnR4
dAo+ICtPUEVOQ0xfQ0xIUFBfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gKwo+ICsjIE9wZW5DTF9D
TEhQUCBpcyBhIGhlYWRlci1vbmx5IGxpYnJhcnkKPiArT1BFTkNMX0NMSFBQX0lOU1RBTExfVEFS
R0VUID0gTk8KPiArCj4gKyQoZXZhbCAkKGNtYWtlLXBhY2thZ2UpKQoKU2luY2Ugd2Ugb25seSBi
dWlsZCB0d28gaGVhZGVycyBmaWxlcywgaXMgdGhlIGNtYWtlIGluZnJhIHJlYWxseSByZXF1aXJl
ZD8KCkluc3RhbGwgdGhlIHByb2plY3QuLi4KLS0gSW5zdGFsbCBjb25maWd1cmF0aW9uOiAiUmVs
ZWFzZSIKLS0gSW5zdGFsbGluZzogb3V0cHV0L2hvc3QvYWFyY2g2NC1idWlsZHJvb3QtbGludXgt
Z251L3N5c3Jvb3QvdXNyL2luY2x1ZGUvQ0wKLS0gSW5zdGFsbGluZzoKb3V0cHV0L2hvc3QvYWFy
Y2g2NC1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3QvdXNyL2luY2x1ZGUvQ0wvb3BlbmNsLmhw
cAotLSBJbnN0YWxsaW5nOgpvdXRwdXQvaG9zdC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUv
c3lzcm9vdC91c3IvaW5jbHVkZS9DTC9jbDIuaHBwCgoKQmVzdCByZWdhcmRzLApSb21haW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
