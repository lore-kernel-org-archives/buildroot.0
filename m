Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A55DC369D7
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 13:20:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AFAD830C5;
	Wed, 23 Apr 2025 13:20:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqLFfWdL7uhc; Wed, 23 Apr 2025 13:19:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51117830C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51117830C2;
	Wed, 23 Apr 2025 13:19:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5579B19F
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 13:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3B00561183
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 13:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChD4b2gIFCge for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 13:19:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 315656106D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 315656106D
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 315656106D
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 13:19:55 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-39c1ef4acf2so4222294f8f.0
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 06:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745414394; x=1746019194;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CdKIoKrw9y2EpbcrVu8+qJTjwcxdfpMTXMad68ZjhNk=;
 b=TygtIWo+dfVSoktgaJQdLPfnsoSz0pd6IH7HNwP++dpbSgysCO/v4iqKmkIQc/Sun0
 LnZpZuPycqg2rSh+nRNJyUtKtIJTpiHo25IPDCv3c/M0CzS2mpbY+kEvChXNKpSvwrTn
 XrSloCEFu7htXyQIRmUWOOGtxRQ9ObE2yKuqQmurJNbTPoUA8D+RjPApqrIckc90uXgS
 aw/aXSxWZvkOOD0FOq5+lb34RUiknn6Ip+kXNeLc0byYzWwjCHYQlk0SvNwFetiD3Gqz
 AhLfA8clQ+Ef0mXAcEzmf2zgWfW2TOoGICfnYc7W/sWMYy1hgSXNPeLF2sgCUtQPymI+
 9P3A==
X-Gm-Message-State: AOJu0YxwcJP/4RRFj8lbWIQAkXBjqUTRNyVL0MDzuhVTVcVEZRJ3ewI2
 rk6t3Ufcs1ht8csfN19dzSX+Hkbktr3hBacsiOmtxUTPIJNRdgRbIe79257M5PDNIgI9wF7rQAQ
 k
X-Gm-Gg: ASbGncvIpNZ+EuY2o04Q8Styu/uuO+yO+dP0EEFl05SRfil8Sh7/1Ru/+AuvnzX7NHH
 aUHkQVab2bJDiympMUetangBHAj7282agd2QfPvd4e5/84cy/AEGNZYFLXBmt+8S1cGRMwJwOBa
 bZ4Zgzdb2h4x07lENLe6BUHY456Nqc3l/E0XmFZt4/F+ikaloX4fKukIXdVyegdkrV959F6aWFW
 bFIAUt54dKicaJn6ROcpczpDhkrT6miOoHPxyhm+GrMVElfOFxMDjUOUqKtqkoIc9KirA3tFqrq
 V8Thjp0NdvXCZiL3yPik162yfijjexNZrUEQTdM7S6KFKBj86pud1ijkCbYCO3a6eBIpfxM3/BT
 XzSCEgtpeCIlnUHhB2AW8bgn9cC7N6HiqwPaR
X-Google-Smtp-Source: AGHT+IHtZO+ST/YtkZotWLEj7qUK4EO2fMrdg8lAUu3MztaT9Q1vfkOB7DIAR6C9xGoCX6QiVh5q+A==
X-Received: by 2002:a05:6000:178d:b0:39c:c64e:cf58 with SMTP id
 ffacd0b85a97d-39efbaf20ccmr14900983f8f.55.1745414393648; 
 Wed, 23 Apr 2025 06:19:53 -0700 (PDT)
Received: from debian-hp-1.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d23262sm25494235e9.16.2025.04.23.06.19.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 06:19:53 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Wed, 23 Apr 2025 15:19:28 +0200
Message-ID: <20250423131933.834900-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1745414394; x=1746019194; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CdKIoKrw9y2EpbcrVu8+qJTjwcxdfpMTXMad68ZjhNk=;
 b=Swj9lGvH/WMy1Btzx1iwDlJ/UuBwmdauXBtFRyQO+7GLzWq5is40IdDa15c4D0Kibt
 KJlcvApGaI8Jb1HBk21cb7PwBWkCM0Ts2q1IXNvEB1u5I/IxMqsfp7ejd/8sVYV7fJwu
 cPrVg4svDxOQs5DAzmLpEoQ9EwtsLsXwjyeWazYq2pQmiW0eRzpFi7POwVDHUiGNKWfr
 +0mM3JI+gos/sOvtrjLtTqyPxOZ2agY3n3hFDAdhaoPzCCsMmqo27znkszQA8QaZazg2
 noKqwSx0z33jkkZ7HWlPBEoMQCjuO+/8BP6QlZUqHpttNF/pj5/KfRjatcQhKjMD5cJr
 iW8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Swj9lGvH
Subject: [Buildroot] [RFC PATCH 0/2] support/scripts/pkg-stats: add support
 for version prefixes
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SSBzdGFydGVkIHRoaXMgc2VyaWVzIGFzIGFuIGF0dGVtcHQgYXQgc29sdmluZyBwa2ctc3RhdHMn
IGlzc3VlIHdpdGgKcGFja2FnZXMgdXNpbmcgdmVyc2lvbiBwcmVmaXhlcy4KQ3VycmVudGx5IHBr
Zy1zdGF0cyByZXBvcnRzIHRoZXNlIHBhY2thZ2VzIGFzIG91dGRhdGVkLCBldmVuIHdoZW4gdGhl
eQphY3R1YWxseSBhcmUgdXAgdG8gZGF0ZS4KCkluIHRoZSBtZWFudGltZSBJIHJlYWxpemVkIHRo
YXQgYSBkaWZmZXJlbnQgYXBwcm9hY2ggd2FzIHRha2VuIGluIDIwMTkKKHNlZSBbMV0pLCBzbyBp
dCdzIHByb2JhYmx5IGEgZ29vZCBpZGVhIHRvIGZvbGxvdyB0aGF0IHJvdXRlCmluc3RlYWQuIEkn
bSBzdGlsbCBzZW5kaW5nIHRoZSBzZXJpZXMgaW4gY2FzZSBpbiBjYW4gYmUgb2YgYW55IHVzZSBp
bgp0aGUgZnV0dXJlIG9yIHNlcnZlIGFzIGEgYmFzaXMgZm9yIG5ldyBkaXNjdXNzaW9ucy4KCkEg
bmV3IHBlci1wYWNrYWdlIHZhcmlhYmxlIGlzIGludHJvZHVjZWQgdG8gY29uZmlndXJlIHRoZSBw
cmVmaXggZm9yCmVhY2ggcGFja2FnZSwgYW5kIGEgc2Vjb25kIGNvbW1pdCBjb25maWd1cmVzIGl0
IGZvciBldmVyeSBwYWNrYWdlcwp0aGF0IHVzZXMgJ3YnIGFzIGEgcHJlZml4LgoKVGhpcyBhcHBy
b2FjaCBpcyBub3QgaWRlYWwgYXMgaXQgcmVxdWlyZXMgYSBuZXcgcGVyLXBhY2thZ2UgdmFyaWFi
bGUKdG8gYmUgaW50cm9kdWNlZCwgYnV0IGl0IGdpdmVzIHVzIHRoZSBmbGV4aWJpbGl0eSB0byBj
b25maWd1cmUKZGlmZmVyZW50IHByZWZpeGVzIGZvciBkaWZmZXJlbnQgcGFja2FnZXMgaWYgbmVl
ZGVkIHdoaWxlIGF2b2lkaW5nIHRoZQp0d28gY29waWVzIGluIERMX0RJUiBtZW50aW9uZWQgaW4g
WzJdLgoKWzFdOiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvcGlwZXJtYWlsL2J1aWxkcm9v
dC8yMDE5LUp1bmUvNjE3MjE3Lmh0bWwKWzJdOiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
cGlwZXJtYWlsL2J1aWxkcm9vdC8yMDE5LUp1bmUvNjE3NTc1Lmh0bWwKClJhcGhhw6tsIE3DqWxv
dHRlICgyKToKICBzdXBwb3J0L3NjcmlwdHMvcGtnLXN0YXRzOiBhZGQgc3VwcG9ydCBmb3IgdmVy
c2lvbiBwcmVmaXhlcwogIHBhY2thZ2U6IGFkZCAqX1ZFUlNJT05fUFJFRklYIHRvIHBhY2thZ2Vz
IHVzaW5nIHByZWZpeCAndicKCiBkb2NzL21hbnVhbC9hZGRpbmctcGFja2FnZXMtZ2VuZXJpYy5h
ZG9jICAgICAgICAgfCAgNSArKysrKwogcGFja2FnZS9hYXJkdmFyay1kbnMvYWFyZHZhcmstZG5z
Lm1rICAgICAgICAgICAgIHwgIDEgKwogLi4uL2FtYXpvbi1lY3ItY3JlZGVudGlhbC1oZWxwZXIu
bWsgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9iY2MvYmNjLm1rICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9icGZ0b29sL2JwZnRvb2wubWsgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9icmlja2QvYnJpY2tkLm1rICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9jdXRla2V5Ym9hcmQvY3V0ZWtleWJvYXJk
Lm1rICAgICAgICAgICAgIHwgIDEgKwogLi4uL2RvY2tlci1jcmVkZW50aWFsLWdjci5tayAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9lbWJpZ2dlbi1kaXNrL2VtYmlnZ2VuLWRp
c2subWsgICAgICAgICAgIHwgIDEgKwogLi4uL2dzdHJlYW1lcjEvZ3N0MS1pbnRlcnBpcGUvZ3N0
MS1pbnRlcnBpcGUubWsgIHwgIDEgKwogcGFja2FnZS9nc3RyZWFtZXIxL2dzdDEtc2hhcmsvZ3N0
MS1zaGFyay5tayAgICAgIHwgIDEgKwogcGFja2FnZS9saWJjYW1lcmEvbGliY2FtZXJhLm1rICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9uZXRhdmFyay9uZXRhdmFyay5tayAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9vZ3JlL29ncmUubWsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9vcGVuNjI1NDEvb3BlbjYyNTQxLm1rICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9wb2RtYW4vcG9kbWFuLm1rICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9weXRob24td2ViMnB5L3B5dGhvbi13ZWIy
cHkubWsgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9zaWduYWwtZXN0aW1hdG9yL3NpZ25hbC1l
c3RpbWF0b3IubWsgICAgIHwgIDEgKwogLi4uL3NwaXJ2LWxsdm0tdHJhbnNsYXRvci5tayAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS90bC1leHBlY3RlZC90bC1leHBlY3RlZC5t
ayAgICAgICAgICAgICAgIHwgIDEgKwogc3VwcG9ydC9zY3JpcHRzL3BrZy1zdGF0cyAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMTYgKysrKysrKysrKysrKystLQogMjEgZmlsZXMgY2hhbmdlZCwg
MzggaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjQ5LjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
