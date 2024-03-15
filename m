Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0EEC54E67
	for <buildroot@archiver.kernel.org>; Fri, 15 Mar 2024 19:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 204ED60631;
	Fri, 15 Mar 2024 19:37:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sf1_ET4eIOhW; Fri, 15 Mar 2024 19:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 34FE560F03
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34FE560F03;
	Fri, 15 Mar 2024 19:37:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2EAD1BF307
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DED984179A
 for <buildroot@lists.busybox.net>; Fri, 15 Mar 2024 19:37:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id knAvhp0juPq2 for <buildroot@lists.busybox.net>;
 Fri, 15 Mar 2024 19:37:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82d; helo=mail-qt1-x82d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9BDF14171C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BDF14171C
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9BDF14171C
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 19:37:32 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id
 d75a77b69052e-430b83bab7eso3326441cf.1
 for <buildroot@buildroot.org>; Fri, 15 Mar 2024 12:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710531451; x=1711136251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UOtmzF2Mpf2OxeICcfrtrCQFm6I+n2BBsLnEvKVWdKo=;
 b=DIn17sILv7xMHhYgsjvUAvu3seV9qukGzGdWQQRgzW7RQET3ljrAaJ0ZPGJiqwo03C
 1q36uu1VEaXLsbSYn/kv3v9k1UkARK3Ws7VBMroHMQW1SzWCJLrPOxOuIyy17arv3Eoh
 bg6kjHBXO4QWEsklCiB3E5QKOEr34LEOjOS+GMwdqblLrKB2DBSmqEwyjzImjsxSnGmx
 llTWyPB1dV4iFYHr5nKs/CyYPGFOf7+chRFjdF7f2W89lqZgym9oqf/lA8c603VlD8E0
 Xua/12CDL4L6AEhbCIBIveS65AoGpRdWpciwhX0SQy88KnkVfeYHeqEzhXWdyqBVrb0b
 T0uA==
X-Gm-Message-State: AOJu0YypQm3duyY4y9D0FqhQvgA87v4DSuT2YdsbG74RAXkX0GFUgmfP
 NXXiANMXP+Ec1a5oMexGyM5k6qVh1I3N+lkXPAPuISo7lPlr8cxGoiJBAOc2RAmwe9TYW6GS7S8
 6rnui38z3TbXF6PK9SRGnZSJMTWhetzW+TK9slA==
X-Google-Smtp-Source: AGHT+IG2B3AIYOLQnQ5Fa+EzJU7lXdQryYW8DK/shzdNsXwYIu+Ci6lTIeQhtNAQLPycwsik+Qyk4VhTd8r6aVpdMvw=
X-Received: by 2002:ac8:5942:0:b0:42e:efe1:ebda with SMTP id
 2-20020ac85942000000b0042eefe1ebdamr5468430qtz.53.1710531451232; Fri, 15 Mar
 2024 12:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230911061940.2392419-1-james.hilliard1@gmail.com>
 <089b0e6e-0050-4e8f-b7fb-249209bd33a3@andin.de>
In-Reply-To: <089b0e6e-0050-4e8f-b7fb-249209bd33a3@andin.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 15 Mar 2024 13:37:19 -0600
Message-ID: <CADvTj4pjPgKKOdfj3iDzgjHRHmHKdE6Dau01T+x0fOpkRcJ2Vw@mail.gmail.com>
To: Andreas Naumann <dev@andin.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710531451; x=1711136251; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UOtmzF2Mpf2OxeICcfrtrCQFm6I+n2BBsLnEvKVWdKo=;
 b=Z253fgvs70gzTfH/jGYs//dXt2W/lVqBz6gBujYyiTUSz1TinBEe7AsQOKEQ1Yw2sy
 vzs6ERwXn1EEL2bkD7Ng0PnW1e0W8Y+89mn3drV6ym87Jg6a+R9J5naWtr/MVACIvTCm
 7UZ8lyd5Nza7UiATs88lMTwvLzncRqFi8E6EBoxKdRO+ZqQK4GqCxB8/1dUtYLbaP+Z4
 ISprSgLCR4HuSlnoCky17N/zn8EFb7mxMDZX+i/b/cI3AIUV4ucqdLg/72iNPkptD77A
 30yTxH5h3L7fR5qy/BguoZgPKxudkZopyA6IVkjrYTOp7kMwfTs2uHRoiOe4Rp3vNUJa
 boRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Z253fgvs
Subject: Re: [Buildroot] [PATCH 1/1] boot/uboot: add support for
 u-boot-initial-env install
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

T24gRnJpLCBNYXIgMTUsIDIwMjQgYXQgNDozOOKAr0FNIEFuZHJlYXMgTmF1bWFubiA8ZGV2QGFu
ZGluLmRlPiB3cm90ZToKPgo+IEhpIEphbWVzLCBhbGwsCj4KPgo+IEFtIDExLjA5LjIzIHVtIDA4
OjE5IHNjaHJpZWIgSmFtZXMgSGlsbGlhcmQ6Cj4gPiBUaGlzIGZpbGUgaXMgbmVlZGVkIGJ5IGxp
YnVib290ZW52IGZvciBmd19wcmludGVudi9md19zZXRlbnYgYW5kCj4gPiBsaWJyYXJ5IEFQSSdz
IHRvIGZ1bmN0aW9uIHdoZW4gdGhlIGVudmlyb25tZW50IGlzIGVtcHR5Lgo+ID4KPiA+IFNlZSBk
ZXRhaWxzOgo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3NiYWJpYy9saWJ1Ym9vdGVudi90cmVlL3Yw
LjMuNCNyZXBsYWNlbWVudC1vbGQtdG9vbHMKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBI
aWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gICBib290L3Vi
b290L0NvbmZpZy5pbiB8IDcgKysrKysrKwo+ID4gICBib290L3Vib290L3Vib290Lm1rICB8IDgg
KysrKysrKysKPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspCj4KPiBBbm90
aGVyIHNvbHV0aW9uIGNvdWxkIGJlIHRvIGF1dG9tYXRpY2FsbHkgaW5zdGFsbCBpdCBpZiBsaWJ1
Ym9vdGVudiBpcwo+IHNlbGVjdGVkLiBCdXQgdGhhdCBtaWdodCBiZSBhIGJpdCB1bmZvcmVzZWFi
bGUgbWFnaWMuIE5vdCBzdXJlIGlmIHRoaXMKPiBpcyB3YW50ZWQuCj4gVG8gbWUgaXQncyBnb29k
IGFzIGlzLgoKWWVhaCwgSSBmaWd1cmVkIGl0IHdhcyBhIGJldHRlciBpZGVhIHRvIGp1c3Qga2Vl
cCBpdCBzZXBhcmF0ZSBmb3Igbm93IGluIGNhc2UKc29tZW9uZSBpcyBnZW5lcmF0aW5nIHUtYm9v
dC1pbml0aWFsLWVudiBvdXQgb2YgdHJlZSBvciBzb21lIG90aGVyIHdheS4KCj4KPiBSZXZpZXdl
ZC1ieTogQW5kcmVhcyBOYXVtYW5uIDxhbmF1bWFubkB1bHRyYXRyb25pay5kZT4KPiBUZXN0ZWQt
Ynk6IEFuZHJlYXMgTmF1bWFubiA8YW5hdW1hbm5AdWx0cmF0cm9uaWsuZGU+Cj4gW2NvbXBpbGUt
dGltZSB0ZXN0ZWQgd2l0aCB3YW5kYm9hcmRfZGVmY29uZmlnXQo+Cj4KPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvYm9vdC91Ym9vdC9Db25maWcuaW4gYi9ib290L3Vib290L0NvbmZpZy5pbgo+ID4gaW5k
ZXggMjFmMTlkYjg5MC4uZDdmMjkxMmViYyAxMDA2NDQKPiA+IC0tLSBhL2Jvb3QvdWJvb3QvQ29u
ZmlnLmluCj4gPiArKysgYi9ib290L3Vib290L0NvbmZpZy5pbgo+ID4gQEAgLTUwNiw2ICs1MDYs
MTMgQEAgY29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfU1BMX05BTUUKPiA+ICAgICAgICAgYW5kIFRQ
TCBuYW1lIGlzIHRwbC91LWJvb3QtdHBsLmJpbiBidXQgbm90IGFsd2F5cy4gU1BMIG5hbWUgaXMK
PiA+ICAgICAgICAgTUxPIG9uIE9NQVAgYW5kIFNQTCBvbiBpLk1YNiBmb3IgZXhhbXBsZS4KPiA+
Cj4gPiArY29uZmlnIEJSMl9UQVJHRVRfVUJPT1RfSU5JVElBTF9FTlYKPiA+ICsgICAgIGJvb2wg
Ikluc3RhbGwgdS1ib290LWluaXRpYWwtZW52Igo+ID4gKyAgICAgaGVscAo+ID4gKyAgICAgICBJ
bnN0YWxsIHRoZSBVLUJvb3QgdS1ib290LWluaXRpYWwtZW52IG9uIHRoZSB0YXJnZXQuCj4gPiAr
Cj4gPiArICAgICAgIFRoaXMgZmlsZSBpcyB0eXBpY2FsbHkgcmVxdWlyZWQgYnkgbGlidWJvb3Rl
bnYuCj4gPiArCj4gPiAgIGNvbmZpZyBCUjJfVEFSR0VUX1VCT09UX1pZTlFNUAo+ID4gICAgICAg
Ym9vbCAiQm9vdCBvbiB0aGUgWGlsaW54IFp5bnFNUCBTb0NzIgo+ID4gICAgICAgZGVwZW5kcyBv
biBCUjJfYWFyY2g2NAo+ID4gZGlmZiAtLWdpdCBhL2Jvb3QvdWJvb3QvdWJvb3QubWsgYi9ib290
L3Vib290L3Vib290Lm1rCj4gPiBpbmRleCBkZGE2MDZhODgwLi40OTFmNjU0Y2VjIDEwMDY0NAo+
ID4gLS0tIGEvYm9vdC91Ym9vdC91Ym9vdC5tawo+ID4gKysrIGIvYm9vdC91Ym9vdC91Ym9vdC5t
awo+ID4gQEAgLTEzOCw2ICsxMzgsMTQgQEAgVUJPT1RfTUFLRV9UQVJHRVQgKz0gdS1ib290LnN0
bTMyCj4gPiAgIGVuZGlmCj4gPiAgIGVuZGlmCj4gPgo+ID4gK2lmZXEgKCQoQlIyX1RBUkdFVF9V
Qk9PVF9JTklUSUFMX0VOVikseSkKPiA+ICtVQk9PVF9NQUtFX1RBUkdFVCArPSB1LWJvb3QtaW5p
dGlhbC1lbnYKPiA+ICtkZWZpbmUgVUJPT1RfSU5TVEFMTF9VQk9PVF9JTklUSUFMX0VOVgo+ID4g
KyAgICAgJChJTlNUQUxMKSAtRCAtbSAwNjQ0ICQoQEQpL3UtYm9vdC1pbml0aWFsLWVudiAkKFRB
UkdFVF9ESVIpL2V0Yy91LWJvb3QtaW5pdGlhbC1lbnYKPiA+ICtlbmRlZgo+ID4gK1VCT09UX1BP
U1RfSU5TVEFMTF9UQVJHRVRfSE9PS1MgKz0gVUJPT1RfSU5TVEFMTF9VQk9PVF9JTklUSUFMX0VO
Vgo+ID4gK2VuZGlmCj4gPiArCj4gPiAgIGlmZXEgKCQoQlIyX1RBUkdFVF9VQk9PVF9GT1JNQVRf
Q1VTVE9NKSx5KQo+ID4gICBVQk9PVF9CSU5TICs9ICQoY2FsbCBxc3RyaXAsJChCUjJfVEFSR0VU
X1VCT09UX0ZPUk1BVF9DVVNUT01fTkFNRSkpCj4gPiAgIGVuZGlmCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
