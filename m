Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98C8C4167B
	for <buildroot@archiver.kernel.org>; Fri,  1 Dec 2023 07:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2666360BD5;
	Fri,  1 Dec 2023 07:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2666360BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3XyYNn_PgWDV; Fri,  1 Dec 2023 07:33:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7780660B68;
	Fri,  1 Dec 2023 07:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7780660B68
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41C831BF318
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 07:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 274D241913
 for <buildroot@lists.busybox.net>; Fri,  1 Dec 2023 07:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 274D241913
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XTDa6l-60d62 for <buildroot@lists.busybox.net>;
 Fri,  1 Dec 2023 07:33:48 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 313754190E
 for <buildroot@buildroot.org>; Fri,  1 Dec 2023 07:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 313754190E
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-50bbef0e5d5so2493216e87.1
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 23:33:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701416026; x=1702020826;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+gCNa8drLgpC4Dvq/nNfgaBbTMVCE3mEeBgDz/0CHiI=;
 b=KgiosXkrMVxl8KQ8kZUPt0nV3kUTkktXEpBbZXGvuI8f2HjjlIracnnqm2gPH4jXbw
 qpJkCdX/DLIm6rugsKwfOlNv2uN8lzV7JsvRd2y99P0gLufY/WH7wmz6sjc7+cYBhXOv
 Et1IxTWi/S/yXAr1wyVl5QJEtw36av6dg5Nny+t1qaTgGWC71gp/lNcGhJr3ATv5KelR
 Pmf7vUT0OLQliSkmq5igMRU3LdddvuuX4XrUmFHYOtkZKBVgEPYBt55eax/PyCchaNCU
 nMCxq7fCI5h6VjDXpl2beVVsqX3So5KAzezsyh3xi/0c+ScoOCwRjB9pNsQcaGH3YerH
 T7EA==
X-Gm-Message-State: AOJu0YwzheoorPxx9hXhp/6KOzD5g5Hj6kln+Zm2PGiIwR5+t9rcQgqe
 W6JYkeK8qOcnS/qwYuOdwfgi9RDehwqMqg==
X-Google-Smtp-Source: AGHT+IFV9rFKDJpQH1IGNwSFiV1TNzym6V/qzP7VFPemx+taCwbGxjJH6lVYvSwzMmNPUHxzLNfx6A==
X-Received: by 2002:a05:6512:3a85:b0:50b:ccc2:e213 with SMTP id
 q5-20020a0565123a8500b0050bccc2e213mr619111lfu.17.1701416025532; 
 Thu, 30 Nov 2023 23:33:45 -0800 (PST)
Received: from cuervo.intranet.jlsalvador.online ([207.188.148.122])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a05600c350600b0040b43da0bbasm4421986wmq.30.2023.11.30.23.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Nov 2023 23:33:45 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  1 Dec 2023 08:33:05 +0100
Message-ID: <20231201073304.1599298-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701416026; x=1702020826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+gCNa8drLgpC4Dvq/nNfgaBbTMVCE3mEeBgDz/0CHiI=;
 b=YATkmBjCfpjD+5jyZrjO+ihMAcJw+an2pFmKdGjmE8MYHNYbEwLAGYw91ZWjEquHUh
 fASXkfNNcIiTW8qUAhNm4uQJ7qgIZsZUdGB26kREEdNe/3HyhuG5JB9KIujvy2IVuzp9
 lGhUNXa6mzz9ppbEwZEJbTJMzCWa1DUJchhzGvoI4kwdnMFkQAVd0FEpMb1PSrJG+Qjm
 HEjy7tceb/cDX07UNx8Yl+LqB996a2j4mUHjURB8loh2HtEl26kaHzWOop2AwmYiJ8e5
 c+CoZDgQ6DOtObSCkyU+Ce+9U1OWwElSEA+mdsHy3Ie43Q1JzA6d6D2Ij1DLb4cJP4WC
 K4tg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YATkmBjC
Subject: [Buildroot] [PATCH] package/zfs: bump version to 2.2.2
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
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyByZWxlYXNlIGNvbnRhaW5zIGFuIGltcG9ydGFudCBmaXggZm9yIGEgZGF0YSBjb3JydXB0
aW9uCmJ1Zy4gRnVsbCBkZXRhaWxzIGFyZSBpbiB0aGUgaXNzdWUgWzFdIGFuZCBidWcgZml4IFsy
XS4KCjEuIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9pc3N1ZXMvMTU1MjYKMi4gaHR0
cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3B1bGwvMTU1NzEKClNpZ25lZC1vZmYtYnk6IEpv
c8OpIEx1aXMgU2FsdmFkb3IgUnVmbyA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgotLS0K
IHBhY2thZ2UvemZzL3pmcy5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL3pmcy96ZnMubWsgICB8IDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5oYXNoIGIvcGFja2FnZS96ZnMvemZzLmhhc2gKaW5k
ZXggYjAyYzQ5MjM0YS4uMDFjODZmMmJkNiAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLmhh
c2gKKysrIGIvcGFja2FnZS96ZnMvemZzLmhhc2gKQEAgLTEsNSArMSw1IEBACi0jIExvY2FsbHkg
Y29tcHV0ZWQKLXNoYTI1NiAgNDIwMzVmZDA1OWZhYTI1YTA5Y2Q1MTFiMjRhNTdiOGFkMTI4NWNi
NjkxMjdmMmEwMDQzYjk4NTYyYzVlYzY5MCAgemZzLTIuMi4wLnRhci5negorIyBGcm9tIGh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuemZzL3pmcy9yZWxlYXNlcy9kb3dubG9hZC96ZnMtMi4yLjIvemZz
LTIuMi4yLnNoYTI1Ni5hc2MKK3NoYTI1NiAgNzZiYzA1NDdkOWJhMzFkNGIwMTQyZTQxN2FhYWY5
Zjk2OTA3MmMzY2IzYzFhNWIxMGM4NzM4ZjM5ZWQxMmZjOSAgemZzLTIuMi4yLnRhci5negogCiAj
IEhhc2ggZm9yIGxpY2Vuc2UgZmlsZXM6CiBzaGEyNTYgIDFmZmI3MGMzM2M0Zjc5ZjA0ZTk0N2Zh
Y2M1Yzc4NTFmMjg5NjA5MjU2YWFjYjQ3ZmMxMTVmNzAwNDI3ZDk1MjAgIExJQ0VOU0UKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvemZzL3pmcy5tayBiL3BhY2thZ2UvemZzL3pmcy5tawppbmRleCBkODU5
NTZjOThiLi5hMmM3YjUzNTFkIDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMubWsKKysrIGIv
cGFja2FnZS96ZnMvemZzLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKIAotWkZTX1ZFUlNJT04gPSAyLjIuMAorWkZTX1ZFUlNJT04gPSAyLjIuMgogWkZTX1NJ
VEUgPSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93bmxvYWQvemZz
LSQoWkZTX1ZFUlNJT04pCiBaRlNfU0VMSU5VWF9NT0RVTEVTID0gemZzCiBaRlNfTElDRU5TRSA9
IENEREwKLS0gCjIuNDMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
