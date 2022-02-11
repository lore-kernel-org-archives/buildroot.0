Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CC0C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 08:14:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9DFB8198D;
	Fri, 11 Feb 2022 08:14:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tKJX4w3Yim8T; Fri, 11 Feb 2022 08:14:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F358081516;
	Fri, 11 Feb 2022 08:14:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1DCC41BF86C
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 08:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09F63400FB
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 08:14:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sVLfRQl--zUE for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 08:14:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83465400E6
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 08:14:10 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f23so15005546lfe.5
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 00:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LNFAeZ9U5qJCGbp9WP+tsZyYwJPHsGm3jORkpjnugL0=;
 b=I60PzhFwtGAVzSzEU7befCi7i43UNnLnUkwTN19cMpu/NvvR+VEDc/BbsdOn5AlvxE
 6BjfroLgM1jzY32OFUhRPawJVzE4s/tEBYqeKLWE6+lhfVoumUe8Fw5PexlTtLLX7SIm
 imyzQKu1QZqD1LaQyDruCzbhFQIzbM7di/l29mgKDQsBeSBIGrwm5DVBAympR10j17QI
 J3u/pW9JKXKRqc/LdRhMrLoaHb8p+w1c0A1AhJASzBZ22CdXlLoxc2TEesWcJdZ4tynV
 puShWaZ9veT3KQRpz9tgleroIjXpUX9KgLy+yjVi3Gpb0fVGqB/ec1lGUvMQ9YkswWaA
 B3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LNFAeZ9U5qJCGbp9WP+tsZyYwJPHsGm3jORkpjnugL0=;
 b=4plTFp//7UpKgnBYPLoel2RAYJNtNYHADih4MpzHgQyfj2yW79nE4xxevqqHeb54Lp
 HRGQg0Q+XdL+k9NkwVTzDVrHjp6xoUqjdXEtlWZfhthkokI73XEi36yAbLDEeSVe3UXw
 Vcbcc3GyRxIcgM4zDwZOL/bvxU7mG/SLuIUPKNfjN8IuikvlbGynVXpLhJp/BrT0rCHP
 Nvz3lDmWzIg85qR95fyTS7Ese0i5i9dTK1MOPZAtJ18HxQumrpaev2f1GGaOnj6FjRiY
 PQnPLM9mIytxY1GFkPzYvWJ97DFH8N7iTIN6hPOl80ioIO77Fq2wphehQ1ftNImP7xv9
 B7Wg==
X-Gm-Message-State: AOAM531jhH8eaIGXUTZvxGy2wy5wIFu/gBFXatQ4jA/MZTAw8wOXNb6G
 cO9j1eSckTIhm1lKd8Wy46YOYtxMNvPd7A==
X-Google-Smtp-Source: ABdhPJyFCXcQoQnsicbIA4ItZcwNkVRsPZQem7TiUGDw2CRiJFDZz7NvOSQN9+sgubmD/bKrYIB1ow==
X-Received: by 2002:a05:6512:3c9f:: with SMTP id
 h31mr425439lfv.460.1644567248273; 
 Fri, 11 Feb 2022 00:14:08 -0800 (PST)
Received: from WSE-C0150.beijerelectronics.com ([134.238.48.33])
 by smtp.gmail.com with ESMTPSA id b8sm3042846lfb.22.2022.02.11.00.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 00:14:07 -0800 (PST)
From: =?UTF-8?q?J=C3=B6rgen=20Sigvardsson?= <jorgen.sigvardsson@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Feb 2022 09:13:57 +0100
Message-Id: <20220211081357.40439-1-jorgen.sigvardsson@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: option for building
 with LWS_WITH_ZIP_FOPS
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
Cc: =?UTF-8?q?J=C3=B6rgen=20Sigvardsson?= <jorgen.sigvardsson@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSsO2cmdlbiBTaWd2YXJkc3NvbiA8am9yZ2VuLnNpZ3ZhcmRzc29uQGdt
YWlsLmNvbT4KLS0tCiBwYWNrYWdlL2xpYndlYnNvY2tldHMvQ29uZmlnLmluICAgICAgICB8IDE0
ICsrKysrKysrKysrKysrCiBwYWNrYWdlL2xpYndlYnNvY2tldHMvbGlid2Vic29ja2V0cy5tayB8
ICA0ICsrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L3BhY2thZ2UvbGlid2Vic29ja2V0cy9Db25maWcuaW4gYi9wYWNrYWdlL2xpYndlYnNvY2tldHMv
Q29uZmlnLmluCmluZGV4IGQ3YjUyOWNhZmQuLjhkYjFkOGI5NzUgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvbGlid2Vic29ja2V0cy9Db25maWcuaW4KKysrIGIvcGFja2FnZS9saWJ3ZWJzb2NrZXRzL0Nv
bmZpZy5pbgpAQCAtOSw1ICs5LDE5IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJXRUJTT0NLRVRT
CiAKIAkgIGh0dHBzOi8vbGlid2Vic29ja2V0cy5vcmcvCiAKK2lmIEJSMl9QQUNLQUdFX0xJQldF
QlNPQ0tFVFMKKworY29uZmlnIEJSMl9QQUNLQUdFX0xJQldFQlNPQ0tFVFNfWklQX0ZPUFMKKwli
b29sICJlbmFibGUgc2VydmluZyBmaWxlcyBmcm9tIHppcCBhcmNoaXZlcyIKKwlkZWZhdWx0IHkK
KwloZWxwCisJICBCeSBlbmFibGluZyB0aGlzIGZsYWcsIGZpbGVzIGNhbiBiZSBzZXJ2ZWQgZnJv
bSBhIChwcmVmZXJhYmx5CisJICB1bmNvbXByZXNzZWQpIHppcCBmaWxlLiBGdXJ0aGVybW9yZSwg
dGhlIGNvbnRhaW5lZCBmaWxlcyBjYW4KKwkgIGJlIGd6aXBwZWQuIEd6aXBwZWQgZmlsZXMgbWF5
IGJlIGRlbGl2ZXJlZCBhcy1pcyAobm8gZGVmbGF0aW9uCisJICBuZWVkZWQpIHRvIGNsaWVudHMg
dGhhdCBhY2NlcHQgZ3ppcHBlZCBlbmNvZGVkIGNvbnRlbnRzIChhbGwKKwkgIG1vZGVybiBicm93
c2VycyBkbyB0aGF0KS4KKworZW5kaWYKKwogY29tbWVudCAibGlid2Vic29ja2V0cyBuZWVkcyBh
IHRvb2xjaGFpbiB3LyBkeW5hbWljIGxpYnJhcnkiCiAJZGVwZW5kcyBvbiBCUjJfU1RBVElDX0xJ
QlMKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlid2Vic29ja2V0cy9saWJ3ZWJzb2NrZXRzLm1rIGIv
cGFja2FnZS9saWJ3ZWJzb2NrZXRzL2xpYndlYnNvY2tldHMubWsKaW5kZXggYzI1Njg2ZDM4NS4u
YTYyZjFjNzBkOSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJ3ZWJzb2NrZXRzL2xpYndlYnNvY2tl
dHMubWsKKysrIGIvcGFja2FnZS9saWJ3ZWJzb2NrZXRzL2xpYndlYnNvY2tldHMubWsKQEAgLTcz
LDQgKzczLDggQEAgaWZlcSAoJChCUjJfU0hBUkVEX0xJQlMpLHkpCiBMSUJXRUJTT0NLRVRTX0NP
TkZfT1BUUyArPSAtRExXU19XSVRIX1NUQVRJQz1PRkYKIGVuZGlmCiAKK2lmZXEgKCQoQlIyX1BB
Q0tBR0VfTElCV0VCU09DS0VUU19aSVBfRk9QUykseSkKK0xJQldFQlNPQ0tFVFNfQ09ORl9PUFRT
ICs9IC1ETFdTX1dJVEhfWklQX0ZPUFM9T04KK2VuZGlmCisKICQoZXZhbCAkKGNtYWtlLXBhY2th
Z2UpKQotLSAKMi4zMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
