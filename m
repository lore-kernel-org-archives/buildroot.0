Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020BEC4332F
	for <buildroot@archiver.kernel.org>; Thu, 20 Oct 2022 13:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CDF16FADE;
	Thu, 20 Oct 2022 13:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CDF16FADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F-ORQf7OcECg; Thu, 20 Oct 2022 13:29:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93E806FAC0;
	Thu, 20 Oct 2022 13:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93E806FAC0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 75DD51BF27E
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 13:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AC986FAC0
 for <buildroot@lists.busybox.net>; Thu, 20 Oct 2022 13:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AC986FAC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFVFssSYhIb9 for <buildroot@lists.busybox.net>;
 Thu, 20 Oct 2022 13:29:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBCDD6FAAB
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBCDD6FAAB
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 13:29:30 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id f9so1844403plb.13
 for <buildroot@buildroot.org>; Thu, 20 Oct 2022 06:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Cbt4btpoUFTZSR4HRDY4Hpm3gQ4KTac1V1vyzXSuLnk=;
 b=IDFjqkXD0Z28X56/048OI6kL53A6ymQyb1ggwmhfcBnDULyCwWyOADH3KaPyI/Rbve
 mETvFcZEC9kdEs3aYE6SyWl8mCN5wga2ECSCl/TiXN8CjtT8dPNG+4q1LmU39z9LkPN6
 H8Uea+t3gPFSSHSn3ys/4UcvM/nwpwzQOsBhvq1EAvCCP29VZXC650Qffr4J60UhbBdC
 Hc1vnGpgiPwdGRq5ZbOmfzqKaXGi7IcjbdyhGT89hJTYEU3GLhZiefLR4ItHCo2arK8h
 /S74koIK8EuW6ODR2L8stN6ZrA3QHb2n0K5h39AMW5tiPwsd0T1ncwBtLCwwpe9DwQjm
 LP/g==
X-Gm-Message-State: ACrzQf0b2LdL5LXOEr8aMgTpkhoqg24M2yiyOQlFuxcNhyNZAssfFNOB
 f24+RCjCw9fuRJsYV6677PnR+9vUNu5Ctk+UbMLAaneYHTWYgQ==
X-Google-Smtp-Source: AMsMyM69PBObvXq3AN3eEGoq2mjFZmr/7ZoagLD9dt1SQUwyh6srwBv2g33xxonxdbxhi5B8TGsiOVilF/fwimNmibM=
X-Received: by 2002:a17:902:e552:b0:179:e795:71c5 with SMTP id
 n18-20020a170902e55200b00179e79571c5mr13927285plf.57.1666272570024; Thu, 20
 Oct 2022 06:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <CADvTj4qYnqsAjQMZQHBTdpxgiZ2VoLtewn9uWa1QzPjriT_VZg@mail.gmail.com>
 <A7C2FFDF-A321-49E6-A82C-3DA7C936C65E@benettiengineering.com>
In-Reply-To: <A7C2FFDF-A321-49E6-A82C-3DA7C936C65E@benettiengineering.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 20 Oct 2022 09:29:18 -0400
Message-ID: <CADvTj4rMLacz40pDcGWWE9MrBx-X6yYvrreST83Exa2yRAM_8w@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Cbt4btpoUFTZSR4HRDY4Hpm3gQ4KTac1V1vyzXSuLnk=;
 b=L9eCeieq2HrGf/WqLMipyNDwjEfPZJN2frouuBOLU6zoAzoU6GQwd0ogDl/5A5UD/8
 y3dRE67Wf8odFhHCXBON++A+EgRILz28AVPb9iakG/g55cxHNlXx4rXFQZ8JY8MO8xmK
 Wr0Cto727mJk3ebz1ku0iQLXWeNGSttpk8LNYXOkBXHuo008uJUVY8JQpw8Kb+zzG3jl
 JTy071T4YktIxBQOXtIIMzf/Laqzbt3NGamUYyhEEAERxShFQiCdEGLt4R4z8JIeTzdf
 hLE6HA0hNC8+sWXNyvRtLOM8bIzF099hmUhQGfzN2WPZ/HsCwueA/6QlUyVs5LBOO1cz
 ckrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=L9eCeieq
Subject: Re: [Buildroot] [PATCH] package/libnss: disable parallel build with
 Make 4.4
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCBPY3QgMjAsIDIwMjIgYXQgMjo1MyBBTSBHaXVsaW8gQmVuZXR0aQo8Z2l1bGlvLmJl
bmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+ID4g
SWwgZ2lvcm5vIDIwIG90dCAyMDIyLCBhbGxlIG9yZSAwMjoyMywgSmFtZXMgSGlsbGlhcmQgPGph
bWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+IGhhIHNjcml0dG86Cj4gPgo+ID4g77u/T24gV2VkLCBP
Y3QgMTksIDIwMjIgYXQgNzozNiBQTSBKYW1lcyBIaWxsaWFyZAo+ID4gPGphbWVzLmhpbGxpYXJk
MUBnbWFpbC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4+IE9uIFdlZCwgT2N0IDE5LCAyMDIyIGF0IDM6
NTUgUE0gR2l1bGlvIEJlbmV0dGkKPiA+Pj4gPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVl
cmluZy5jb20+IHdyb3RlOgo+ID4+Pgo+ID4+PiBGaXhlczoKPiA+Pj4gaHR0cDovL2F1dG9idWls
ZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvNDMzLzQzMzVkMGQ4NDU0MDM1YThmNzQ2NDViYThkNmMy
MzI5YWIyZTU0ODAvCj4gPj4KPiA+PiBIbW0sIHRoaXMgbG9va3MgbGlrZSBhIGJ1ZyBpbiB0aGUg
bGlibnNzIG1ha2VmaWxlLCB3aGF0IHdhcyB0aGUgZmFpbHVyZQo+ID4+IHNlZW4gd2l0aCBtYWtl
IDQuMyBoZXJlOgo+ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDIyMDEw
MTIxMDk1Mi4yMTQ4MjU2LTEtZ2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbS8K
PiA+Cj4gPiBUaGlzIHBhdGNoIGFsc28gZG9lcyBub3QgZml4IHRoZSBidWlsZCB3aXRoIG1ha2Ug
NC40KG1ha2UgZnJvbSBtYXN0ZXIgYnJhbmNoKQo+ID4gZnJvbSBteSB0ZXN0aW5nLgo+ID4KPiA+
IEV2ZW4gd2l0aG91dCBzaHVmZmxlIG1vZGUgZW5hYmxlZCB0aGUgYnVpbGQgYXBwZWFycyB0byBh
bHdheXMgZmFpbC4KPgo+IFRoYW5rIHlvdSBmb3IgdGVzdGluZywgSSBoYXZlIGZvcmdvdHRlbiBl
eGFjdGx5IHRvIGFzayB5b3UgdG8gZG8gaXQgOi0pIHNpbmNlIGFsbW9zdCBhbGwgdGhlIGZhaWx1
cmVzIGNvbWVzIGZyb20geW91ciBhc2FoaS1taW5pIHRoYXQgSSByZW1lbWJlciB0byBoYXZlIE1h
a2UgNC40LgoKSSdtIHJ1bm5pbmcgbWFrZSBtYXN0ZXIgYnJhbmNoIG9uIGFsbCBteSBhdXRvYnVp
bGRlcnMgYXQgdGhlIG1vbWVudCwKdGhlIGZhaWx1cmVzIGFyZW4ndCBsaW1pdGVkIHRvIGFzYWhp
LW1pbmk6Cmh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC8/cmVhc29uPWxpYm5zcy0zLjg0
Cgo+Cj4gU28gSSB0cnkgdG8gcmVwcm9kdWNlIHRoZSBidWcgaGVyZSBhdCBtZSBhbmQgZmluZCBv
dXQgYSBmaXguCgpVc2UgbWFrZSBtYXN0ZXIgYnJhbmNoIGZyb20gaGVyZSBmb3IgdGVzdGluZzoK
Z2l0IGNsb25lIGh0dHBzOi8vZ2l0LnNhdmFubmFoLmdudS5vcmcvZ2l0L21ha2UuZ2l0Cgo+Cj4g
VGhhbmtzIGFnYWluCj4KPiBCZXN0IHJlZ2FyZHMKPiBHaXVsaW8KPgo+ID4KPiA+Pgo+ID4+Pgo+
ID4+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0
aWVuZ2luZWVyaW5nLmNvbT4KPiA+Pj4gLS0tCj4gPj4+IHBhY2thZ2UvbGlibnNzL2xpYm5zcy5t
ayB8IDQgKystLQo+ID4+PiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQo+ID4+Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJuc3MvbGlibnNzLm1r
IGIvcGFja2FnZS9saWJuc3MvbGlibnNzLm1rCj4gPj4+IGluZGV4IDA0MWIyY2ZjNTYuLmE2MTMw
MDZmNzAgMTAwNjQ0Cj4gPj4+IC0tLSBhL3BhY2thZ2UvbGlibnNzL2xpYm5zcy5tawo+ID4+PiAr
KysgYi9wYWNrYWdlL2xpYm5zcy9saWJuc3MubWsKPiA+Pj4gQEAgLTE1LDggKzE1LDggQEAgTElC
TlNTX0xJQ0VOU0VfRklMRVMgPSBuc3MvQ09QWUlORwo+ID4+PiBMSUJOU1NfQ1BFX0lEX1ZFTkRP
UiA9IG1vemlsbGEKPiA+Pj4gTElCTlNTX0NQRV9JRF9QUk9EVUNUID0gbnNzCj4gPj4+Cj4gPj4+
IC0jIERvbid0IHBhcmFsbGVsIGJ1aWxkIGlmIG1ha2UgdmVyc2lvbiA9IDQuMwo+ID4+PiAtaWZu
ZXEgKCQoZmlsdGVyICQoUlVOTklOR19NQUtFX1ZFUlNJT04pLDQuMyksKQo+ID4+PiArIyBEb24n
dCBwYXJhbGxlbCBidWlsZCBpZiBtYWtlIHZlcnNpb24gPSA0LjMgb3IgNC40Cj4gPj4+ICtpZm5l
cSAoJChmaWx0ZXIgJChSVU5OSU5HX01BS0VfVkVSU0lPTiksNC4zIDQuNCksKQo+ID4+PiBMSUJO
U1NfTUFLRSA9ICQoTUFLRTEpCj4gPj4+IGVsc2UKPiA+Pj4gTElCTlNTX01BS0UgPSAkKE1BS0Up
Cj4gPj4+IC0tCj4gPj4+IDIuMzQuMQo+ID4+Pgo+ID4+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
Pj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
