Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90DFC4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 23:21:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DDB460DFA;
	Sat, 15 Oct 2022 23:21:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DDB460DFA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id g4RaNLmaD7or; Sat, 15 Oct 2022 23:21:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6899560DF6;
	Sat, 15 Oct 2022 23:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6899560DF6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 292771BF3FF
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04204408C0
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 23:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04204408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OLpUhHi0bQyz for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 23:21:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A9B640291
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A9B640291
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 23:21:27 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 t10-20020a17090a4e4a00b0020af4bcae10so7898684pjl.3
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 16:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R2+aqlCL+O8uxGq1+cC/BeWLC/4NGKj0bSkt9JSzhIE=;
 b=yjl0zCUlEJQqxx+CyJHU+gf0OBPlyxHlciEJVOzbzk0eCMrwauiehmaT6Ko4u2GfXO
 HumFEcAe6ig5Pjsig40oYx693u+OlbRd+l96qX+eCSkYYoCb7+uxvycL8JCHyl0WZPF2
 nCbEyTj5K7ajJ5s5+yRqbAMTJ1cqY2u58TYkunK1LFNjRU4HsNZWoYin2OwQKgJ39pxl
 pWv84VZIC0sw2SmKwjAJF3CA/JjAT9gqYiSYuvBGtzacTYlr8Kgya7mGMs43oErYDqTQ
 RONeigJm8WKCSNeqP0e1KxxZKgyEooSEwzGCeKZ6MOQDUpnG/ts371CxRErlWYZd0Qhy
 MYpA==
X-Gm-Message-State: ACrzQf20d2na+pTGrrFP8oN0vJbCMsobF1R5MMX0H9xHHft7UXHbzGlC
 bc+aAqQ8drpQW2s/8lNIaJI0BWWUCYiL/oLGgWw=
X-Google-Smtp-Source: AMsMyM7Xbzy530gkeXeOLBx9EdMIDlBR3lUtjI7okb/fhd3QeFOT22SqnRRUmKMAFs9nCS/JDWz4m46x0iG1/DI/8Sw=
X-Received: by 2002:a17:90b:1643:b0:20c:c7c7:d598 with SMTP id
 il3-20020a17090b164300b0020cc7c7d598mr25423345pjb.97.1665876087300; Sat, 15
 Oct 2022 16:21:27 -0700 (PDT)
MIME-Version: 1.0
References: <20221015005813.4055238-1-james.hilliard1@gmail.com>
 <CAPi7W828RqJOB3wUx3y68PFHE+M+pt5Ohck+-E-YzPim-C54eQ@mail.gmail.com>
In-Reply-To: <CAPi7W828RqJOB3wUx3y68PFHE+M+pt5Ohck+-E-YzPim-C54eQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 15 Oct 2022 19:21:15 -0400
Message-ID: <CADvTj4p15dWwuUN0rz4D5_tQi+UzuTdoFq76ewYh00xaULhp8A@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R2+aqlCL+O8uxGq1+cC/BeWLC/4NGKj0bSkt9JSzhIE=;
 b=pa0F7erK/1umgkobs5kbgYxKHco96WpnirIby8jNBFMGr1uR36x3ZWj2DHSabz7Gln
 nF1DH9TOxEWb8nPDs+S+J7OxNGMu0ZUcLj8Y3pd5IBzuNAR1xit1zW4oMFwYB5ABVsJf
 LyNK6g+jROendtFXLMsnrz1Ha0ctsYRRL0XX13t1TYcptKKeKPiqxglMomkEmwEqtWFa
 pOckuZIOVEAsdwhHFRJpN7RrqUgMwDE+Z0byzmjrM+wZV1SV+0h9Hr6Ye54uWackln4R
 iepkrDPmxBZ690eXBrdDQ1wyRloBt7nWpF/YayHGMZn5BXQeGjEHT8pP9LF4wW5/YYWr
 2QQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pa0F7erK
Subject: Re: [Buildroot] [PATCH 1/1] package/bearssl: disable parallel build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gU2F0LCBPY3QgMTUsIDIwMjIgYXQgNjoxNCBQTSBGYWJyaWNlIEZvbnRhaW5lCjxmb250YWlu
ZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBKYW1lcywKPgo+IExlIHNhbS4gMTUg
b2N0LiAyMDIyIMOgIDAyOjU4LCBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWls
LmNvbT4gYSDDqWNyaXQgOgo+Pgo+PiBUaGUgYmVhcnNzbCBwYWNrYWdlIGlzIG5vdCBjb21wYXRp
YmxlIHdpdGggcGFyYWxsZWwgYnVpbGRzLgo+Cj4KPiBiZWFyc3NsIHdhcyBidWlsZGluZyBwZXJm
ZWN0bHkgZmluZSB1cCB1bnRpbCBub3cgYW5kIGl0IHNlZW1zIHRoZXJlIGFyZSBhIGxvdCBvZiBw
YWNrYWdlcyB0aGF0IGFyZSBhZmZlY3RlZCBieSBwYXJhbGxlbCBidWlsZCBpc3N1ZXMgKGUuZy4g
ZG1yYWlkLCBtdXNlcGFjaywgc2xhbmcsIGV0YykuCgpTb21lIHBhcmFsbGVsIGJ1aWxkIGJ1Z3Mg
ZG9uJ3QgcmVwcm9kdWNlIHJlbGlhYmx5IGR1ZSB0byB0aW1pbmcsIEkgbWFkZSBhIGNoYW5nZQp0
byBteSBhdXRvYnVpbGRlcnMgd2hpY2ggbWFzc2l2ZWx5IGluY3JlYXNlcyB0aGUgY2hhbmNlIG9m
IHRyaWdnZXJpbmcKYnVpbGQgZmFpbHVyZXMKaW4gcGFja2FnZXMgd2hpY2ggaGF2ZSBkZXBlbmRl
bmN5IGdyYXBoIGJ1Z3MuIFRoaXMgdHJpZ2dlcnMgYnVpbGQgYnVpbGQgZmFpbHVyZXMKaW4gLWox
IGJ1aWxkcyB3aGljaCB3b3VsZCBvdGhlcndpc2Ugb25seSBhcHBlYXIgd2hlbiBydW5uaW5nIHBh
cmFsbGVsIGJ1aWxkcyhteQphdXRvYnVpbGRlcnMgYXJlIGdlbmVyYWxseSBydW5uaW5nIHdpdGgg
LWoxIHRvIG1ha2UgdGhlIGxvZ3MgbW9yZSByZWFkYWJsZSkuCgo+IERpZCB3ZSBjaGFuZ2Ugc29t
ZXRoaW5nIHJlY2VudGx5IG9uIHRoZSBhdXRvYnVpbGRlcnM/CgpZZXMsIGFsbCBteSBhdXRvYnVp
bGRlcnMgd2VyZSByZWNlbnRseSBjaGFuZ2VkIHRvIHVzZSBtYWtlIG1hc3Rlcih3aWxsIGJlCm1h
a2UgdmVyc2lvbiA0LjQgb25jZSByZWxlYXNlZCkgd2l0aCB0b3AgbGV2ZWwgLS1zaHVmZmxlPXJh
bmRvbS4KCkRldGFpbHM6Cmh0dHBzOi8vZ2l0aHViLmNvbS9taXJyb3IvbWFrZS9ibG9iLzNlMjBl
Mzc2YjdhYTI2ZmE0M2Y4MWYyMzMyM2M3MTdjNGNhZTFiZmIvTkVXUyNMMTIzLUwxMjgKaHR0cHM6
Ly90cm9maS5naXRodWIuaW8vcG9zdHMvMjM4LW5ldy1tYWtlLXNodWZmbGUtbW9kZS5odG1sCmh0
dHA6Ly90cm9maS5naXRodWIuaW8vcG9zdHMvMjQ5LWFuLXVwZGF0ZS1vbi1tYWtlLXNodWZmbGUu
aHRtbAoKTm90ZSB0aGF0IE1BS0UxIGlzIGN1cnJlbnRseSBicm9rZW4gaXRzZWxmIHdpdGhvdXQg
dGhpcyB3aGVuIHVzaW5nIHNodWZmbGUgbW9kZToKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9y
Zy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMTAxNTAwNTYxMS40MDU0OTMzLTEtamFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbS8KCj4KPj4KPj4KPj4gRml4ZXM6Cj4+ICAtIGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzVlMS81ZTFiNzJkYjIwNmIyZDE3ZmE1Y2UzNzhh
NzBmZGMyZjNmNWJmNzczCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1l
cy5oaWxsaWFyZDFAZ21haWwuY29tPgo+PiAtLS0KPj4gIHBhY2thZ2UvYmVhcnNzbC9iZWFyc3Ns
Lm1rIHwgMiArLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2JlYXJzc2wvYmVhcnNzbC5tayBiL3BhY2th
Z2UvYmVhcnNzbC9iZWFyc3NsLm1rCj4+IGluZGV4IGZmNWY0ZTg3YjcuLmMyYTU3NjBhZjUgMTAw
NjQ0Cj4+IC0tLSBhL3BhY2thZ2UvYmVhcnNzbC9iZWFyc3NsLm1rCj4+ICsrKyBiL3BhY2thZ2Uv
YmVhcnNzbC9iZWFyc3NsLm1rCj4+IEBAIC0yNCw3ICsyNCw3IEBAIEJFQVJTU0xfVEFSR0VUUyAr
PSBsaWIKPj4gIGVuZGlmCj4+Cj4+ICBkZWZpbmUgQkVBUlNTTF9CVUlMRF9DTURTCj4+IC0gICAg
ICAgJChUQVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgJChCRUFSU1NMX01BS0VfT1BUUykgLUMgJChA
RCkgXAo+PiArICAgICAgICQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UxKSAkKEJFQVJTU0xfTUFL
RV9PUFRTKSAtQyAkKEBEKSBcCj4+ICAgICAgICAgICAgICAgICAkKEJFQVJTU0xfVEFSR0VUUykK
Pj4gIGVuZGVmCj4+Cj4+IC0tCj4+IDIuMzQuMQo+Pgo+IEJlc3QgUmVnYXJkcywKPgo+IEZhYnJp
Y2UKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
