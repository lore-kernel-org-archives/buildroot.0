Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD45C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 17:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3713A4049C;
	Sat, 20 Aug 2022 17:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3713A4049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yw207UgYUPOZ; Sat, 20 Aug 2022 17:36:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5408B402F3;
	Sat, 20 Aug 2022 17:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5408B402F3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 592961BF2B7
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 17:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32AF241697
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 17:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32AF241697
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fNQb6eLUui0U for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 17:36:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31829416ED
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 31829416ED
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 17:36:03 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-11c5505dba2so8462808fac.13
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 10:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=NM8hXqKHcSjy6cXTxk33B37I9i7SJRG88nP1Sg3q6Tw=;
 b=8DZ5vonV+o4JWHNlmIVxJtZKHousnR1f4IZozWsXW96ySlz//bYz7SVH7yv2s4IcE8
 LlkbbjXDfRDXe/hijQXtPiugmgixVfri0I9iNdFRY4OE5sLYQp/CSOsG+RrUY4subRfI
 tIRvB8YwT+XymnOhBhhKcjTr06WzxiUC6YTSCIbrUyRJgrKrEb6rT1kWHJP9OzTZdeoz
 G9N6gZiiI9edr16zuz0HvW5b7s8oyLVNQgIz0iK4trPcS+tDJAOdo+D3rb6B5IO9SdpW
 +eHTVoc1dTuPwLq2oaaZBOlyE45r/CZrrF/vuchURsYFis8Elw+CXW8vR/+km5+YU30g
 27/w==
X-Gm-Message-State: ACgBeo01tkefEXKTmzvnhprY8+cSiJ+DW+pyhRsQaveuHNwHmrR5PeU4
 +0yxx9Aexgeqa037i4cA8K7JdUGafHV53i3PvIaGsLjx08U=
X-Google-Smtp-Source: AA6agR5Hgs3WMsRRQVsi2/uEz8rqGiBUkldUbA+0XbIQf4JzJfIYtg6WXFr3QkupM0fU9Mz/rfODYzayW34c3cOPoRg=
X-Received: by 2002:a05:6870:4799:b0:f1:46f8:6ea4 with SMTP id
 c25-20020a056870479900b000f146f86ea4mr6385847oaq.223.1661016961941; Sat, 20
 Aug 2022 10:36:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAEXMXLT9gkCfFjEyR6=H6qaQ29wbLCJe=6cne9Kmw84KkbdfkQ@mail.gmail.com>
In-Reply-To: <CAEXMXLT9gkCfFjEyR6=H6qaQ29wbLCJe=6cne9Kmw84KkbdfkQ@mail.gmail.com>
From: =?UTF-8?Q?Nuno_Gon=C3=A7alves?= <nunojpg@gmail.com>
Date: Sat, 20 Aug 2022 18:35:50 +0100
Message-ID: <CAEXMXLSj4tsDDdHcidQo+kFy61TiB00GMfp9SSuewu5eMnA+wQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=NM8hXqKHcSjy6cXTxk33B37I9i7SJRG88nP1Sg3q6Tw=;
 b=b3fLs+VxSvucaNz5fRVhCYhYqMMrtuFcoU+Ed4LURLHfYf18VX5EvhLwtmE/lJZmuq
 nJV9uj50uvJo8GP6c39mE237Bp+lj0IFIo7mPl/VoVL9aiWI3mXOMIDOvLYuEv7C2M9n
 bNi8UlW8bCyXA4HjsraXSa4J6+pKqD7zk8lOGamx+UmGjsAexosvQcyRMPjABrG0d3zb
 PyxmtZ+QzqgkqF3saMKAGSIeVcvwMn+9APZ33zp96tPCLMzXPgpwig5g6v9cK3TIU49Y
 Sg+ZXIot262xX1fmYaBPLOL+7G6i2LftWRa41dwYHI30iXySyZDv9rc0XAbzlmenjWgn
 TLow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=b3fLs+Vx
Subject: [Buildroot] [PATCH] package/rpi-userland: support ARM64 build
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

U2lnbmVkLW9mZi1ieTogTnVubyBHb27Dp2FsdmVzIDxudW5vanBnQGdtYWlsLmNvbT4KLS0tCiBw
YWNrYWdlL3JwaS11c2VybGFuZC9Db25maWcuaW4gICAgICAgfCAyICstCiBwYWNrYWdlL3JwaS11
c2VybGFuZC9ycGktdXNlcmxhbmQubWsgfCA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktdXNlcmxh
bmQvQ29uZmlnLmluIGIvcGFja2FnZS9ycGktdXNlcmxhbmQvQ29uZmlnLmluCmluZGV4IDM0MmZh
ZjI2ZTMuLjgwOWVjNmE2YTIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcnBpLXVzZXJsYW5kL0NvbmZp
Zy5pbgorKysgYi9wYWNrYWdlL3JwaS11c2VybGFuZC9Db25maWcuaW4KQEAgLTEsNiArMSw2IEBA
CiBjb25maWcgQlIyX1BBQ0tBR0VfUlBJX1VTRVJMQU5ECiAgYm9vbCAicnBpLXVzZXJsYW5kIgot
IGRlcGVuZHMgb24gQlIyX2FybQorIGRlcGVuZHMgb24gQlIyX2FybSB8fCBCUjJfYWFyY2g2NAog
IGRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQCiAgZGVwZW5kcyBvbiBCUjJfVE9PTENI
QUlOX0hBU19USFJFQURTCiAgZGVwZW5kcyBvbiAhQlIyX1NUQVRJQ19MSUJTCmRpZmYgLS1naXQg
YS9wYWNrYWdlL3JwaS11c2VybGFuZC9ycGktdXNlcmxhbmQubWsKYi9wYWNrYWdlL3JwaS11c2Vy
bGFuZC9ycGktdXNlcmxhbmQubWsKaW5kZXggMTIwNDE5NmUxOS4uNGVhNTFmYTdmNSAxMDA2NDQK
LS0tIGEvcGFja2FnZS9ycGktdXNlcmxhbmQvcnBpLXVzZXJsYW5kLm1rCisrKyBiL3BhY2thZ2Uv
cnBpLXVzZXJsYW5kL3JwaS11c2VybGFuZC5tawpAQCAtMTcsNiArMTcsMTAgQEAgaWZlcSAoJChC
UjJfUEFDS0FHRV9MSUJFWEVDSU5GTykseSkKIFJQSV9VU0VSTEFORF9ERVBFTkRFTkNJRVMgKz0g
bGliZXhlY2luZm8KIGVuZGlmCgoraWZlcSAoJChCUjJfYWFyY2g2NCkseSkKK1JQSV9VU0VSTEFO
RF9DT05GX09QVFMgKz0gLURBUk02ND0xCitlbmRpZgorCiBpZmVxICgkKEJSMl9QQUNLQUdFX1JQ
SV9VU0VSTEFORF9IRUxMTykseSkKCiBSUElfVVNFUkxBTkRfQ09ORl9PUFRTICs9IC1EQUxMX0FQ
UFM9T04KLS0KMi4zNy4yCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
