Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1117C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 09:29:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77E2561465
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 09:29:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 77E2561465
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 396DC400D2;
	Sun,  7 Nov 2021 09:29:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GS3v6ajIP1-H; Sun,  7 Nov 2021 09:29:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F38B4013F;
	Sun,  7 Nov 2021 09:29:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 118E61BF317
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 09:29:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8EAE80E8A
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 09:29:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JFkd-fsF0eCn for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 09:29:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7981280DF1
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 09:29:41 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id t11so23355937ljh.6
 for <buildroot@buildroot.org>; Sun, 07 Nov 2021 01:29:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=bizUZYhKA4VeqIEcQpZbneHxBJNKfzh/D42MQTBFgCM=;
 b=ZgZDwjnotR08wKwFjXXbX92X6lkoLBOvJZ+IbYPMwjjYiHL9+BdVJ/oUHq8vq+syFL
 Nsbup9P3zNf9ulMzq0GWusRz9U4n99aqbWWQWKDYnlEXW/NcIOjgNEoYwrWMgztKqXI7
 PSg9gUDiMiYgRUu1VoTo+s49b7ML458Hf2Ggqr+y3iZRGel4l3DWxEGGf5qiMwvxwILY
 KOi2dl68uFZwOEQNOsbw6aUmZn6RBct0olO6XGxQazTbywWvf+oGwZF37YraRRZR2Ogf
 6hHrBInRx8aYqJ2BEYZIMxz5fySYiclfakc0aCV6SJz7TtFr89WogpIvFYyjMRnpj4u4
 pVUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=bizUZYhKA4VeqIEcQpZbneHxBJNKfzh/D42MQTBFgCM=;
 b=BXsp5d32rCimd1vCBCmDt3hOv9hwJaqas43V51CV7FJx2PAVdTDfROwIhXQCYQdGzg
 OehUdb5LkL3TlX803OFznZB6MwwUCrbh8AMjcVimlnCldOtO4/b2CXlqEyITSeJywPq4
 O5igslGIlcQtqFRvrxaN0Ys02t+QOm/6vWYarkKdFgBEnkDN0IsA/x/DvDsfq/fWJU1K
 P6OlzMHklhQYDCR6Qyr893TR38o2tJpBbLYAFMaFJDAfvwvjw1GMIcr/WA4VLg/AONbj
 SL6ypeCk1wQ0kY/ZvkJhUkdeXFXId5NTJ7eWvmdLEVwhRDSCP5WjpxAy+erUaDjNc8sv
 ikFg==
X-Gm-Message-State: AOAM530iVhnYyHG34JBFCgqU/vfmfBvWQG31OtKiNmqNMVMiL0FfXmg3
 QfvjPaAkK/kmIq6nwVRgAI0b+anysIIgjioqxUQ=
X-Google-Smtp-Source: ABdhPJzbIExvEUL9ydlbfp1J8oZL/IrUOGnyKzcfdzfz4UhDW+iYriyBdsnkP8Lq6iGWeTlK2YZa4F+FKo62Y8hcmX4=
X-Received: by 2002:a05:651c:513:: with SMTP id
 o19mr49498174ljp.108.1636277379304; 
 Sun, 07 Nov 2021 01:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20211107084526.2073471-1-bernd.kuhls@t-online.de>
In-Reply-To: <20211107084526.2073471-1-bernd.kuhls@t-online.de>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 7 Nov 2021 10:27:41 +0100
Message-ID: <CAPi7W802_+j+GG7JVn8mQ5iudvdc9Us5jGKRLo9CbkeqaCE-3Q@mail.gmail.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/boinc: needs at least gcc 4.8
 for c++11 features
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQmVybmQsCgpMZSBkaW0uIDcgbm92LiAyMDIxIMOgIDA5OjQ1LCBCZXJuZCBLdWhscyA8YmVy
bmQua3VobHNAdC1vbmxpbmUuZGU+IGEgw6ljcml0IDoKPgo+IEZpeGVzOgo+IGh0dHA6Ly9hdXRv
YnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2VkMy9lZDM2NTZmNDQzMzY0ZjAxODk1NjAwZjMz
MjgxNmQyMGUzNDBmMzE1Lwo+Cj4gaG9zdGluZm9fdW5peC5jcHA6MTY5NTozNzogZXJyb3I6IHJh
bmdlLWJhc2VkICdmb3InIGxvb3BzIGFyZSBub3QgYWxsb3dlZCBpbiBDKys5OCBtb2RlCj4gICAg
ICAgICAgZm9yIChjb25zdCBzdHJpbmcgJmlnbm9yZSA6IGlnbm9yZV9saXN0KSB7Cj4KPiBBZGRp
bmcgLXN0ZD1jKysxMSB0byBDWFhGTEFHUyBpcyBkb25lIGluIF9NQUtFX09QVFMgZHVlIHRvIHRo
ZSBNYWtlZmlsZXMKPiBub3QgcGFzc2luZyBDWFhGTEFHUyBmcm9tIF9DT05WX0VOViBkb3duIHRv
IGNsaWVudC9NYWtlZmlsZS4KVGhhbmtzIGZvciBmaXhpbmcgdGhpcyBidWlsZCBmYWlsdXJlLCBJ
IHdvdWxkIGFkdmlzZSB0byB1cGRhdGUgdGhlCmNvbW1pdCBsb2cgdG8gc3BlY2lmeSB0aGF0CnRo
aXMgaXMgbmVlZGVkIHNpbmNlIGJ1bXAgdG8gdmVyc2lvbiA3LjE4LjEgaW4gY29tbWl0CmZlNzlm
YmEzZmQ1MmNkNjQ0NWM1YTFkOTA2MjljOTQ2MDVjOTM1MTkgYW5kCmh0dHBzOi8vZ2l0aHViLmNv
bS9CT0lOQy9ib2luYy9jb21taXQvZWQ3MDM2OWMwOTE5MjNhZGRmNWE4ZDY0YmVkOTJjMDQxN2U5
MWUwNzoKPgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGlu
ZS5kZT4KPiAtLS0KPiAgcGFja2FnZS9ib2luYy9Db25maWcuaW4gfCA0ICsrKy0KPiAgcGFja2Fn
ZS9ib2luYy9ib2luYy5tayAgfCAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ib2luYy9Db25maWcu
aW4gYi9wYWNrYWdlL2JvaW5jL0NvbmZpZy5pbgo+IGluZGV4IDUyMzkwMTlhNTcuLjcyZDU0NDAx
MzEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9ib2luYy9Db25maWcuaW4KPiArKysgYi9wYWNrYWdl
L2JvaW5jL0NvbmZpZy5pbgo+IEBAIC0yLDYgKzIsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfQk9J
TkMKPiAgICAgICAgIGJvb2wgImJvaW5jIgo+ICAgICAgICAgZGVwZW5kcyBvbiBCUjJfVVNFX01N
VSAjIGZvcmsoKQo+ICAgICAgICAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTICMgZGxmY24u
aAo+ICsgICAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzggIyBD
KysxMQo+ICAgICAgICAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTCj4gICAg
ICAgICBkZXBlbmRzIG9uIEJSMl9JTlNUQUxMX0xJQlNURENQUAo+ICAgICAgICAgc2VsZWN0IEJS
Ml9QQUNLQUdFX0xJQkNVUkwKPiBAQCAtMTYsNyArMTcsOCBAQCBjb25maWcgQlIyX1BBQ0tBR0Vf
Qk9JTkMKPgo+ICAgICAgICAgICBodHRwczovL2JvaW5jLmJlcmtlbGV5LmVkdQo+Cj4gLWNvbW1l
bnQgImJvaW5jIG5lZWRzIGEgdG9vbGNoYWluIHcvIGR5bmFtaWMgbGlicmFyeSwgQysrLCB0aHJl
YWRzIgo+ICtjb21tZW50ICJib2luYyBuZWVkcyBhIHRvb2xjaGFpbiB3LyBkeW5hbWljIGxpYnJh
cnksIEMrKywgdGhyZWFkcywgZ2NjID49IDQuOCIKPiAgICAgICAgIGRlcGVuZHMgb24gQlIyX1VT
RV9NTVUKPiAgICAgICAgIGRlcGVuZHMgb24gQlIyX1NUQVRJQ19MSUJTIHx8ICFCUjJfSU5TVEFM
TF9MSUJTVERDUFAgXAo+ICsgICAgICAgICAgICAgICB8fCAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRf
TEVBU1RfNF84IFwKPiAgICAgICAgICAgICAgICAgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVB
RFMKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ib2luYy9ib2luYy5tayBiL3BhY2thZ2UvYm9pbmMv
Ym9pbmMubWsKPiBpbmRleCA1NjdmZmM5MjNjLi43Zjc4YzQyN2VhIDEwMDY0NAo+IC0tLSBhL3Bh
Y2thZ2UvYm9pbmMvYm9pbmMubWsKPiArKysgYi9wYWNrYWdlL2JvaW5jL2JvaW5jLm1rCj4gQEAg
LTQ1LDYgKzQ1LDggQEAgZWxzZQo+ICBCT0lOQ19DT05GX09QVFMgKz0gLS1kaXNhYmxlLWZjZ2kK
PiAgZW5kaWYKPgo+ICtCT0lOQ19NQUtFX09QVFMgPSBDWFhGTEFHUz0iJChUQVJHRVRfQ1hYRkxB
R1MpIC1zdGQ9YysrMTEiCj4gKwo+ICAjIFJlbW92ZSBib2luYy1jbGllbnQgYmVjYXVzZSBpdCBp
cyBpbmNvbXBhdGlibGUgd2l0aCBidWlsZHJvb3QKPiAgZGVmaW5lIEJPSU5DX1JFTU9WRV9VTk5F
RURFRF9GSUxFCj4gICAgICAgICAkKFJNKSAkKFRBUkdFVF9ESVIpL2V0Yy9pbml0LmQvYm9pbmMt
Y2xpZW50Cj4gLS0KPiAyLjMwLjIKPgpCZXN0IFJlZ2FyZHMsCgpGYWJyaWNlCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
