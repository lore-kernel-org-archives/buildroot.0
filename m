Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38D1AC61D97
	for <buildroot@archiver.kernel.org>; Wed, 22 Nov 2023 17:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A157D4155D;
	Wed, 22 Nov 2023 17:21:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A157D4155D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pnTqWk_sOn-C; Wed, 22 Nov 2023 17:21:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98A944148C;
	Wed, 22 Nov 2023 17:21:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98A944148C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5EF401BF588
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 17:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3089F61244
 for <buildroot@lists.busybox.net>; Wed, 22 Nov 2023 17:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3089F61244
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t9ANexOwCuLr for <buildroot@lists.busybox.net>;
 Wed, 22 Nov 2023 17:21:42 +0000 (UTC)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1DED9611B1
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 17:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DED9611B1
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2c50906f941so106171fa.2
 for <buildroot@buildroot.org>; Wed, 22 Nov 2023 09:21:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700673700; x=1701278500;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TiUet92uIwYkeEZ/pwfdzAYSP+mh6OI0OqR8QLsGS3w=;
 b=a2eB0pss9B0g4zTSH8bIqy4LHNiwwFsTgMZpy1o6mfCMSGU2wUn1+qNGu793oM6YsP
 H6QqbMn21+2shzmAVBAevO6Yq6dwUCu0a3rMN/xPaDw8K3gCo2vTntk7cvNL0BD0VZ9U
 OlkA0Ts7qAkuvjOt5YebMb+Bb/rQqRppB+xWhElpYFsFhDy0KMBQNbe2XvGIydFO4UKV
 UuqMZ+C4koZK973t5zkWol07TDTlFaZHu06QUZMbwyKb2IZ77Jr3+oQaPG9KpAc9Z++y
 RbuBqQU4CRHUYPBTf+HfXEhT4BN8ex/tjTIDa0F55qbjx4vqhJb/Kvdb8MFuAqcoM2It
 o2RA==
X-Gm-Message-State: AOJu0YyrOjAUbyqT/xWc4sKOKdGZCFUcJGsLo0vnkurIvmQjNzLrCMSn
 UHbAJ7DcNaWa0CdbKPkijl7ZUuXpa90=
X-Google-Smtp-Source: AGHT+IHQuOPOmDqdACBqbf7pfHah23vrKvLRDubbngaw0rMM53XZ8+3UcJqLtYF5mY65cRRrsGh2dA==
X-Received: by 2002:a2e:7011:0:b0:2c5:31de:6c02 with SMTP id
 l17-20020a2e7011000000b002c531de6c02mr2004642ljc.15.1700673699775; 
 Wed, 22 Nov 2023 09:21:39 -0800 (PST)
Received: from cuervo.intranet.jlsalvador.online ([207.188.148.122])
 by smtp.gmail.com with ESMTPSA id
 t16-20020adff610000000b0032da4c98ab2sm17675537wrp.35.2023.11.22.09.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 09:21:39 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Nov 2023 18:20:42 +0100
Message-ID: <20231122172041.1714140-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700673700; x=1701278500; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TiUet92uIwYkeEZ/pwfdzAYSP+mh6OI0OqR8QLsGS3w=;
 b=mpracAnAU1pshmLjEUlSN14Rlh9iR8IVlsvNZSHlgVu+yJR+JwbloxRPBTL7ENVhkc
 BOK+c9QejLZRtVAkLOnqxBJmCLKzO8LORJ1fvF8lW06SWdzdV+4/QkJY2FmMUL3XZWVm
 KYqayjmhvh6oKX7DcGbHpRjfcGpcbzP3DVw6HD+VEsRa9wkkQ7vxozjjaYhkV25EoXxI
 +3hTJYNCURtmoGjOywOZQ3pq0GlT7klIWSXrD0SW/bRRTIHROSQmk5vI4osTUn4F9x2G
 nD9xKFsAhsYUDPZcEinY5llNYYXvSaW1yD8zigVt0QbzeOasNWKgVw1JX4nW39DRMYTb
 EPZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mpracAnA
Subject: [Buildroot] [PATCH] package/zfs: bump version to 2.2.1
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
 <salvador.joseluis@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R2VudG9vIHVzZXJzIGhhdmUgaWRlbnRpZmllZCBhIGJsb2NrIGNsb25pbmcgYnVnICgjMTU1MjYp
IHRoYXQgY2FuCnJlc3VsdCBpbiBkYXRhIGNvcnJ1cHRpb24gaW4gemZzLTIuMi4wLiBUbyB3b3Jr
YXJvdW5kIHRoaXMsIHpmcy0yLjIuMQpkaXNhYmxlcyBibG9jayBjbG9uaW5nIGJ5IGRlZmF1bHQu
CgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2Vs
dWlzQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdlL3pmcy96ZnMuaGFzaCB8IDQgKystLQogcGFja2Fn
ZS96ZnMvemZzLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy96ZnMuaGFzaCBiL3BhY2th
Z2UvemZzL3pmcy5oYXNoCmluZGV4IGIwMmM0OTIzNGEuLjUzYTM3MDIwNzggMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvemZzL3pmcy5oYXNoCisrKyBiL3BhY2thZ2UvemZzL3pmcy5oYXNoCkBAIC0xLDUg
KzEsNSBAQAotIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIDQyMDM1ZmQwNTlmYWEyNWEwOWNk
NTExYjI0YTU3YjhhZDEyODVjYjY5MTI3ZjJhMDA0M2I5ODU2MmM1ZWM2OTAgIHpmcy0yLjIuMC50
YXIuZ3oKKyMgRnJvbSBodHRwczovL2dpdGh1Yi5jb20vb3Blbnpmcy96ZnMvcmVsZWFzZXMvZG93
bmxvYWQvemZzLTIuMi4xL3pmcy0yLjIuMS5zaGEyNTYuYXNjCitzaGEyNTYgIDRmZjJkZTQzZDM5
NzEwMjgzYWU4ZmYxNzQ0YWE5NmU2Y2RjODNjOGVmZTg2YTcxNTI5NGQ0ZjZiYzM0YThlOGUgIHpm
cy0yLjIuMS50YXIuZ3oKIAogIyBIYXNoIGZvciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICAxZmZi
NzBjMzNjNGY3OWYwNGU5NDdmYWNjNWM3ODUxZjI4OTYwOTI1NmFhY2I0N2ZjMTE1ZjcwMDQyN2Q5
NTIwICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pm
cy96ZnMubWsKaW5kZXggZDg1OTU2Yzk4Yi4uYTdjY2JkODMwNiAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS96ZnMvemZzLm1rCisrKyBiL3BhY2thZ2UvemZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMK
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVpGU19WRVJTSU9OID0gMi4yLjAKK1pGU19WRVJT
SU9OID0gMi4yLjEKIFpGU19TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3Jl
bGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpGU19WRVJTSU9OKQogWkZTX1NFTElOVVhfTU9EVUxFUyA9
IHpmcwogWkZTX0xJQ0VOU0UgPSBDRERMCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
