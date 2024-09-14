Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE054C02185
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BDEF842FC;
	Sat, 14 Sep 2024 09:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TATHK4bebHS0; Sat, 14 Sep 2024 09:00:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A3784475
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0A3784475;
	Sat, 14 Sep 2024 09:00:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A85F81BF2AB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:00:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A290140524
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:00:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mCBEDUi94wpC for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:00:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7CCC340324
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CCC340324
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CCC340324
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:00:46 +0000 (UTC)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-6d9f65f9e3eso14394797b3.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 02:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726304445; x=1726909245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2eXVUezOBbLMGF1eWevvn/okoOawRYkKa7CY/tRW4eU=;
 b=cdCoyNNYUwbsNBBMupziTVJtzGryp2wjF5QtuX4AUCXEYGvEhWr8nkLyIjxxMFwCSW
 +D5gO7J7hOQI84INVp37vY0HPXA3G2JLxkZQzksap5Nb1nkoHOsKyh/1kER02U4Q6sLj
 mzy1s6PPF7rXmamQF1hlvDh0JI8N1eMLXv3HEiXC0Cy/5T/cw9EFceqijYsa7IDswDUx
 lYVCsn7gxoDIMDAE9EiFWpvoLF4AmuJ0vSkgz+LyGVduwJLnVLvJ55biv2mgF+MZGmuT
 MQhtwolA8BcJDZMLmHp/Mh/eQqP4vYh9N4K4spYyfabMdzgzvAioJ5IRt8plkdObQ54l
 JIUg==
X-Gm-Message-State: AOJu0YyMZKeqA/F9IrMt5OmysDy5pmqKEhQYFGn2tTqGp2/8ZKtwzfm3
 vDMM4gS7o5SiRMdTVYSpIA3wNOp/RGJFKqid4qW6l4nOEgF9IHQfp0e2rjWum4rKh7rd8hCBQcl
 Db3G6ga0NJt+jiSd85+35tzNM2gYItDQM7dSRdA==
X-Google-Smtp-Source: AGHT+IGXKfwIHoF8luCRL+w0GOG7aIiRaeo3/RTttShvlczI+SOwYRZITXkezLm2dnqSAYTlXwTMEMVc7k1sltBk07k=
X-Received: by 2002:a05:6902:1890:b0:e16:6b7e:94b5 with SMTP id
 3f1490d57ef6-e1db0101eebmr5047233276.48.1726304445168; Sat, 14 Sep 2024
 02:00:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1725049576.git.yann.morin.1998@free.fr>
 <7fcc043e6719f18885f5a5d731520c76b170e73c.1725049576.git.yann.morin.1998@free.fr>
In-Reply-To: <7fcc043e6719f18885f5a5d731520c76b170e73c.1725049576.git.yann.morin.1998@free.fr>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 14 Sep 2024 11:00:34 +0200
Message-ID: <CABGWkvojrWZto8wuGb8HCo0wNzxuo66sLJUFZ0_HYE1WjAw2rg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1726304445; x=1726909245;
 darn=buildroot.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2eXVUezOBbLMGF1eWevvn/okoOawRYkKa7CY/tRW4eU=;
 b=jvQ9COjOP55OfDcDR+jvM/gYqTZIIzncrkaAp5jp02LqxtqfTPmLDfthWB2tsZhDk+
 nJbsPrVrMZdpBSnlHk/7rjBaw7yE6gKtx12rPfRgXuLc1j+8CwAvmQ65vkRdiHbPmN53
 H6TylJrjVn2DMxl/+7ZS8qEnHRT0vBqev+Aro=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=jvQ9COjO
Subject: Re: [Buildroot] [PATCH 2/3] system: classify init systems
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgWWFubiwKCk9uIEZyaSwgQXVnIDMwLCAyMDI0IGF0IDEwOjI24oCvUE0gWWFubiBFLiBNT1JJ
TiA8eWFubi5tb3Jpbi4xOTk4QGZyZWUuZnI+IHdyb3RlOgo+Cj4gV2UncmUgZ29pbmcgdG8gYWRk
IG1vcmUgaW5pdCBzeXN0ZW1zLCBhbmQgc29tZSBoYXZlIGEgdmVyeSBzcGVjaWFsCj4gcHVycG9z
ZSwgc28gd2UgZG8gbm90IHdhbnQgdG8gbWl4IHRoZW0gd2l0aCB0aGUgbXVuZGFuZSBwbGF0aXR1
ZGUgb2YKPiBleGlzdGluZyBpbml0IHN5c3RlbXMuCj4KPiBBZGQgY29tbWVudHMgdG8gc2VwYXJh
dGUgdGhlIHR3by4KPgo+IE5vdGUgdGhhdCB0aGUgbGlzdCB3b3VsZCBhbHJlYWR5IGNvbnRhaW4g
Y29tbWVudHMsIHdoZW4gYSBicjItZXh0ZXJuYWwKPiB0cmVlIHByb3ZpZGVzIGFuIGluaXQgc3lz
dGVtLCBzbyB0aG9zZSBuZXcgY29tbWVudHMgd291bGQgbm90IGJlIHRvdGFsbHkKPiB3ZWlyZC1s
b29raW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogWWFubiBFLiBNT1JJTiA8eWFubi5tb3Jpbi4xOTk4
QGZyZWUuZnI+Cj4gQ2M6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29s
dXRpb25zLmNvbT4KPiBDYzogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290
bGluLmNvbT4KPiAtLS0KPiAgc3lzdGVtL0NvbmZpZy5pbiB8IDQgKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvc3lzdGVtL0NvbmZpZy5pbiBi
L3N5c3RlbS9Db25maWcuaW4KPiBpbmRleCBjNzEwYjM4ZTc0Li4xOGNjMzlhZDk0IDEwMDY0NAo+
IC0tLSBhL3N5c3RlbS9Db25maWcuaW4KPiArKysgYi9zeXN0ZW0vQ29uZmlnLmluCj4gQEAgLTg3
LDYgKzg3LDggQEAgY2hvaWNlCj4gICAgICAgICBwcm9tcHQgIkluaXQgc3lzdGVtIgo+ICAgICAg
ICAgZGVmYXVsdCBCUjJfSU5JVF9CVVNZQk9YCj4KPiArY29tbWVudCAiR2VuZXJhbCBwdXJwb3Nl
Igo+ICsKPiAgY29uZmlnIEJSMl9JTklUX0JVU1lCT1gKPiAgICAgICAgIGJvb2wgIkJ1c3lCb3gi
Cj4gICAgICAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfQlVTWUJPWAo+IEBAIC0xNDUsNiArMTQ3LDgg
QEAgY29tbWVudCAic3lzdGVtZCBoaWdobHkgcmVjb21tZW5kcyBMaW51eCA+PSA0LjE1Igo+ICAg
ICAgICAgZGVwZW5kcyBvbiBCUjJfSU5JVF9TWVNURU1ECj4gICAgICAgICBkZXBlbmRzIG9uICFC
UjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfNF8xNQo+Cj4gK2NvbW1lbnQgIlNwZWNpYWwg
cHVycG9zZSAocmVhZCBoZWxwKSIKPiArCj4gIGNvbmZpZyBCUjJfSU5JVF9OT05FCj4gICAgICAg
ICBib29sICJDdXN0b20gKG5vbmUpIgo+ICAgICAgICAgc2VsZWN0IEJSMl9QQUNLQUdFX1NLRUxF
VE9OX0lOSVRfTk9ORSBpZiBCUjJfUk9PVEZTX1NLRUxFVE9OX0RFRkFVTFQKPiAtLQo+IDIuNDYu
MAo+CgpSZXZpZXdlZC1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFz
b2x1dGlvbnMuY29tPgoKUmVnYXJkcywKRGFyaW8KLS0gCgpEYXJpbyBCaW5hY2NoaQoKU2VuaW9y
IEVtYmVkZGVkIExpbnV4IERldmVsb3BlcgoKZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9u
cy5jb20KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KCgpBbWFydWxhIFNvbHV0
aW9ucyBTUkwKClZpYSBMZSBDYW5ldmFyZSAzMCwgMzExMDAgVHJldmlzbywgVmVuZXRvLCBJVAoK
VC4gKzM5IDA0MiAyNDMgNTMxMAppbmZvQGFtYXJ1bGFzb2x1dGlvbnMuY29tCgp3d3cuYW1hcnVs
YXNvbHV0aW9ucy5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
