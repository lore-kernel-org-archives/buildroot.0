Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ADAC43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 06:41:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 788114049E;
	Tue, 28 Jun 2022 06:41:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 788114049E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yd33Hk2q_Ifl; Tue, 28 Jun 2022 06:41:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7673A4048C;
	Tue, 28 Jun 2022 06:41:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7673A4048C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DCB91BF293
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:41:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D45F660C1D
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:41:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D45F660C1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DVe__rJ9e9kO for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 06:41:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9311460C0F
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9311460C0F
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 06:41:27 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-fb6b4da1dfso15892753fac.4
 for <buildroot@buildroot.org>; Mon, 27 Jun 2022 23:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vDKoXkbRQ7LtEqsOdkP/tqT9plCMWf1r36Sn3qxP+CM=;
 b=rCw49Dqbm4OTp7umxvWMnZGiV+ypNn/5MvZhS26L6r1kHSdPX1Ku7ZGO8hxLA3vKQb
 QCO4MFQebF4JdyGlZynxX/kvfsnFG8BIhNUNUcdb69DvjuEzQTs7dnw+TUWobfnzaQS5
 hyT3zZdIRf9gbhRkv3k11aKsdB7mDai6wV9UaiKrhWKAYqFN6P7f5f7xWzV40sigeO7F
 zhCtF/dICraY/JcUUPabacosd5XdFBLXDu6PAPh8mLM+Hk0jc32ei6FpNcfNGcaAS71k
 41YsZAGWUNINl1ZR9Cx/7evUINC2Gweo8Nmc6razgDq0YUQWI9tTMcAL3nymLnt6E31u
 9MsQ==
X-Gm-Message-State: AJIora9oQn0VSDISP/LCcQ5Ns1/8RtJrpCUa3d9ACkQGpMfgc8ksyusP
 e1S8irlZgxhojynGEHyK7tXPlCFigwK7q357q5o=
X-Google-Smtp-Source: AGRyM1sMDNKKuRJwZZKM0wQgYhSO7TB+p7nSC6m3vstQsslLCdpfdM6I2xUojpU6ui09pEuF20j3WjIgSep7nupWbzA=
X-Received: by 2002:a05:6870:514e:b0:105:cdf1:f2b6 with SMTP id
 z14-20020a056870514e00b00105cdf1f2b6mr9455159oak.148.1656398486542; Mon, 27
 Jun 2022 23:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220619173206.812991-1-fontaine.fabrice@gmail.com>
 <87o7ydqq70.fsf@dell.be.48ers.dk>
In-Reply-To: <87o7ydqq70.fsf@dell.be.48ers.dk>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 28 Jun 2022 08:41:15 +0200
Message-ID: <CAPi7W81p6GiaaA1NRNoKXtS=SjNyGkAeZqOyaai-eOeHC-_YtA@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vDKoXkbRQ7LtEqsOdkP/tqT9plCMWf1r36Sn3qxP+CM=;
 b=FJ/4J3dj9W+PGH/3Ir3+QuVs05Azefcvh56WS/l7C1af0dd17SO58iTsiSofVyq2lN
 BMlffujIYJHllvk49Sy9iHmDM+lh8YzI9wQSRCpJFV1CaBA9XryyT3WeGxvLZroe8+mP
 ulm6uag/PcwRr1RaclOhD/RZLt9aBoRt0YuojQYQNTWJrPv22gvg452MKWZ9Q6wFOng+
 UIs5CF/5P9S56czblke0Bc0Wia8i3iudjRLhCfreRKFyISXFG1op4ddhIhpAxvCKVr/6
 dGsqvsmsx9teY3XhvD9mkXjp0A3g+SL5eq+Aq2z+QMP2epoub3w0ISSk1HP6ngGVbAAZ
 1UxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FJ/4J3dj
Subject: Re: [Buildroot] [PATCH 1/1] package/upower: bump to version 0.99.19
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgbWFyLiAyOCBqdWluIDIwMjIgw6AgMDg6MDQsIFBldGVyIEtvcnNnYWFyZCA8cGV0ZXJAa29y
c2dhYXJkLmNvbT4gYSDDqWNyaXQgOgo+Cj4gPj4+Pj4gIkZhYnJpY2UiID09IEZhYnJpY2UgRm9u
dGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPiB3cml0ZXM6Cj4KPiAgPiAtIFN3aXRj
aCBzaXRlIHRvIGdldCBsYXRlc3QgcmVsZWFzZQo+ICA+IC0gU3dpdGNoIHRvIG1lc29uLXBhY2th
Z2UgKGF1dG90b29scyBkcm9wcGVkIHNpbmNlIHZlcnNpb24gMC45OS4xNCkKPiAgPiAtIGxpYnVz
YiBpcyBub3QgYSBkZXBlbmRlbmN5IHNpbmNlCj4gID4gICBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvdXBvd2VyL3Vwb3dlci8tL2NvbW1pdC82NDU4MjI1NmE4Yzc1MTI3YzNkZTIzZjU1
NDJjODQ2N2UyZTk0ODRhCj4gID4gLSBVcGRhdGUgaW5kZW50YXRpb24gaW4gaGFzaCBmaWxlICh0
d28gc3BhY2VzKQo+Cj4gID4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3Vwb3dlci91
cG93ZXIvLS9ibG9iL3YwLjk5LjE5L05FV1MKPgo+ICA+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2Ug
Rm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ICA+IC0tLQo+ICA+ICBwYWNr
YWdlL3Vwb3dlci9Db25maWcuaW4gICB8ICA5ICsrKy0tLS0tLQo+ICA+ICBwYWNrYWdlL3Vwb3dl
ci91cG93ZXIuaGFzaCB8ICA0ICsrLS0KPiAgPiAgcGFja2FnZS91cG93ZXIvdXBvd2VyLm1rICAg
fCAyMCArKysrKysrKysrKystLS0tLS0tLQo+ICA+ICAzIGZpbGVzIGNoYW5nZWQsIDE3IGluc2Vy
dGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Cj4gID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvdXBv
d2VyL0NvbmZpZy5pbiBiL3BhY2thZ2UvdXBvd2VyL0NvbmZpZy5pbgo+ICA+IGluZGV4IDYxMmEy
Yjc0YjkuLmUyYmNkZDEyYzMgMTAwNjQ0Cj4gID4gLS0tIGEvcGFja2FnZS91cG93ZXIvQ29uZmln
LmluCj4gID4gKysrIGIvcGFja2FnZS91cG93ZXIvQ29uZmlnLmluCj4gID4gQEAgLTEsMTIgKzEs
MTAgQEAKPiAgPiAgY29uZmlnIEJSMl9QQUNLQUdFX1VQT1dFUgo+ICA+ICAgICAgYm9vbCAidXBv
d2VyIgo+ICA+ICAgICAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IQVNfVURFVgo+ICA+IC0gICAg
ZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgbGliZ3VkZXYsIGxpYnVzYgo+
ICA+IC0gICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzkgIyBsaWJ1
c2IKPgo+IHRoZXJtYWxkIHNlbGVjdHMgdXBvd2VyLCBidXQgeW91IGZvcmdvdCB0byBkcm9wIHRo
ZSBnY2MgZGVwZW5kZW5jeSBmcm9tCj4gdGhlcm1hbGQuCj4KPiAgPiAtVVBPV0VSX0NPTkZfT1BU
UyA9IC0tZGlzYWJsZS1tYW4tcGFnZXMgLS1kaXNhYmxlLXRlc3RzCj4gID4gK1VQT1dFUl9DT05G
X09QVFMgPSBcCj4gID4gKyAgICAtRGd0ay1kb2M9ZmFsc2UgXAo+ICA+ICsgICAgLURtYW49ZmFs
c2UgXAo+ICA+ICsgICAgLURzeXN0ZW1kc3lzdGVtdW5pdGRpcj0vdXNyL2xpYi9zeXN0ZW1kL3N5
c3RlbSBcCj4gID4gKyAgICAtRHVkZXZod2RiZGlyPS9saWIvdWRldi9od2RiLmQgXAo+ICA+ICsg
ICAgLUR1ZGV2cnVsZXNkaXI9L2xpYi91ZGV2L3J1bGVzLmQKPgo+IE5vIGZsYWcgdG8gZGlzYWJs
ZSB0ZXN0cz8KCkluZGVlZCwgdXBfc2VsZl90ZXN0IGlzIG5vdyB1bmNvbmRpdGlvbmFsbHkgYnVp
bHQuIFNob3VsZCBJIHNlbmQgYSBQUgp0byB1cHN0cmVhbT8KCj4KPiBDb21taXR0ZWQgd2l0aCB0
aGUgZGVwZW5kZW5jaWVzIG9mIHRoZXJtYWxkIGZpeGVkLCB0aGFua3MuCj4KPiAtLQo+IEJ5ZSwg
UGV0ZXIgS29yc2dhYXJkCgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
