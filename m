Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE86C3DA64
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 12:04:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C478140DC5;
	Wed, 31 Jul 2024 12:04:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 465xItURjmeX; Wed, 31 Jul 2024 12:04:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D888E40DDE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D888E40DDE;
	Wed, 31 Jul 2024 12:04:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8809F1BF23C
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 12:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82F8C60EEF
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 12:04:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hgyFNYaim9fl for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 12:04:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22e; helo=mail-lj1-x22e.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 73C9560ED4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73C9560ED4
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 73C9560ED4
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 12:04:36 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2eeb1ba040aso93776681fa.1
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 05:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722427474; x=1723032274;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HXt61kR67v/fji+dpHKqXJwgZqSZfp7PY2JCSvbG0iE=;
 b=iHyQb0ofVme/T7FkHikKUhM2G375s8R0VCO/oY8COy4FQ6qc/X7JOHU++ij7lFUnOx
 0ZQuFl7U0eDrXvxntH29DJ98n72k3xla55f5XEXyqBQZ0ezGf5teSdnXGc3+fMs4XuF1
 BQgODlZZyYPrPtSV25LJtAduJggVIAtvdWMM6HkQ+ssWDby7TWZc/+rf6F0fvODIb15O
 l+sLzc8+zaOZ+6BZSV45xBIyLLxn0yQgLNCONh8MobpzRDeJCQZ7I4vetdNuFWehBQAu
 SwWf+QmJRPxoEdUAHGKKheGTJeUupuAdYUIKwdsw8fUkLvzRw2R70P4Yn95NAaCmi+EL
 3HUg==
X-Gm-Message-State: AOJu0YwQzUtq3A5ahBoUXLbTIi9Y6eY1dKUrhbrCsp87Li1ilB4jGrCv
 KX14jFR1k+BW3wxEVwGaq3Mq5lnaYpvsUKtg2uXQ/eqmGcISEVqYpuaqXVJfJh056g==
X-Google-Smtp-Source: AGHT+IHF8LTYCXfR9mQ9rgmkqVi+/bCh9PvZWT0blZxFvBx7n3RCk+qr+qdz6p0ZpEvUNFFAI+eIAw==
X-Received: by 2002:a2e:2e06:0:b0:2ef:2344:deec with SMTP id
 38308e7fff4ca-2f12ee6a274mr89258651fa.45.1722427473468; 
 Wed, 31 Jul 2024 05:04:33 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bac614esm18467015e9.24.2024.07.31.05.04.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 05:04:33 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 14:04:26 +0200
Message-ID: <20240731120426.307069-3-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240731120426.307069-1-gael.portay@rtone.fr>
References: <20240731120426.307069-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722427474; x=1723032274; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HXt61kR67v/fji+dpHKqXJwgZqSZfp7PY2JCSvbG0iE=;
 b=fR/2ZmARuTKstkfzvJLN/bkbYkB76UIketMeWgdmaDf7Yv3ST+zD8C0j7yMFlhJAbf
 nRDpCHcgc008w/jAUECSpGppEi4Tz8UXVUZ9Zc3LozEQsDy3tHd0myJzbObXuKp9uiCh
 lJTTvQvIxunnSIJbl3QCKs6wXxxfTzh04jYJZDGnQMeius9/w4fP0T1jf7+JEVtti9UP
 fVm2R1IX4Wni+Z0zlNNzptOEPjhm4wXT9O5BmlluDzD8iPKZJZ5GUvJYhDR5pQoFN1qE
 fjJm1KleBQFmRPzY7eY9aTv2XQufLoxMCfAuWEG+bmeSMSHCmXVuksgKbE+Og9RPdzuL
 1abQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=fR/2ZmAR
Subject: [Buildroot] [PATCH v3 2/2] package/rpi-userland: package is
 deprecated
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBhY2thZ2UgcnBpLXVzZXJsYW5kIGhhcyBiZWVuIG1hcmtlZCBhcyBhbmNpZW50IGFuZCBk
ZXByZWNhdGVkWzFdLgoKVGhpcyBhZGRzIHRoZSBtZXNzYWdlIGluIGl0cyBoZWxwLgoKWzFdOiBo
dHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvdXNlcmxhbmQvY29tbWl0Lzk2YTczMzRhZTlk
NWZjOWRiN2FjOTJlNTk4NTIzNzdkZjYzZjE4NDgKClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRB
WSA8Z2FlbC5wb3J0YXlAcnRvbmUuZnI+Ci0tLQogcGFja2FnZS9ycGktdXNlcmxhbmQvQ29uZmln
LmluIHwgMTEgKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktdXNlcmxhbmQvQ29uZmlnLmluIGIvcGFja2FnZS9ycGkt
dXNlcmxhbmQvQ29uZmlnLmluCmluZGV4IDQyMTliZGI5YzQuLmMzOWViNDU5OGYgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvcnBpLXVzZXJsYW5kL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL3JwaS11c2Vy
bGFuZC9Db25maWcuaW4KQEAgLTE2LDYgKzE2LDE3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9SUElf
VVNFUkxBTkQKIAkgIG1tYWwsIEdMRVN2MiwgdmNvcywgb3Blbm1heGlsLCB2Y2hpcV9hcm0sIGJj
bV9ob3N0LCBXRkMsCiAJICBPcGVuVkcuCiAKKwkgIEltcG9ydGFudDogVGhlIHBhY2thZ2UgaXMg
YW5jaWVudCBhbmQgZGVwcmVjYXRlZC4KKworCSAgSXQgbGFyZ2VseSBjb250YWlucyBjb2RlIHVz
aW5nIHByb3ByaWV0YXJ5IEFQSXMgdG8gaW50ZXJmYWNlCisJICB0byB0aGUgVmlkZW9Db3JlIGZp
cm13YXJlLiBJdCBoYXMgc2luY2UgbW92ZWQgdG8gc3RhbmRhcmQKKwkgIGxpbnV4IEFQSXMuCisK
KwkgIFY0TDIsIERSTS9LTVMgYW5kIE1lc2EgYXJlIHRoZSBBUElzIHlvdSBzaG91bGQgYmUgdXNp
bmcuCisKKwkgIFRoZSBmZXcgdXNlZnVsIHRvb2xzIGZyb20gaGVyZSAoZHRvdmVybGF5LCBkdG1l
cmdlLAorCSAgdmNtYWlsYm94LCB2Y2dlbmNtZCkgaGF2ZSBiZWVuIG1vdmVkIHRvIHRoZSBwYWNr
YWdlIHJwaS11dGlscy4KKwogCSAgaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL3VzZXJs
YW5kLwogCiBpZiBCUjJfUEFDS0FHRV9SUElfVVNFUkxBTkQgJiYgQlIyX2FybQotLSAKMi40Ni4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
