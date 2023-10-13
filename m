Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D168CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E01C402E7;
	Fri, 13 Oct 2023 18:02:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E01C402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFimCJRVzt4J; Fri, 13 Oct 2023 18:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC73F41176;
	Fri, 13 Oct 2023 18:02:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC73F41176
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCE061BF326
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B48AF402E7
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:02:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B48AF402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yo95h8ApAzve for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:02:07 +0000 (UTC)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E651405DD
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E651405DD
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-32d81864e3fso1996247f8f.2
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 11:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697220125; x=1697824925;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zHErn79cfVe4RmKMpzEeuZ8+ax9r7fgg8GJN+bIX4Nk=;
 b=LlrxMq21Pog9CEq1fQL6plSX63eKSLy5UvIdzDMO8RBXXU6yguxKWXCx8GV8sluIqa
 pGOQwT/puK7T0pVGun6sU+ugOrFQpNLbDQbA91dvynq58a7cWbEvYvmAwjP5Kh4NH638
 Zc3vVDxOFM/sQ9XFF6k8q0OY/+oWBxFP3Fq6+53T3PmCcYOeYjEXVYd1l3QWhU4TF1G9
 rMyudHtV8vJDnxnou+wt2QZ0wxETqjGEnBaUlgY52xKZHeedqQl9T81QoZ3HWpMtVGNO
 /70L+UVvu2K4ohhDR6xRPmsmqdCkqlOoPsFotJ5JBz1uNuR5oUiKnsTALOAMV3pVYVa7
 la2A==
X-Gm-Message-State: AOJu0YzC5rx7ILIT2EJ3fwZhgJ4O1k+x2zcfwGBzLdLXWyALwIHuAtSL
 4szK3Ex5nZjEzMAciS2+zFoEvNxfnwSsf33M2nszAA==
X-Google-Smtp-Source: AGHT+IE8ej42yOnDI1u8chPSRADdkDaEk1OoabaIT/kPjHnXG262qYohDkAR4ZjQsEpOvT9NB0Bwrw==
X-Received: by 2002:adf:a4d5:0:b0:32d:701b:a585 with SMTP id
 h21-20020adfa4d5000000b0032d701ba585mr8951385wrb.69.1697220124696; 
 Fri, 13 Oct 2023 11:02:04 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a05600c354900b0040531f5c51asm788860wmq.5.2023.10.13.11.02.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 11:02:04 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:01:45 +0200
Message-ID: <20231013180145.162565-4-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013180145.162565-1-gael.portay@rtone.fr>
References: <20231013180145.162565-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1697220125; x=1697824925; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zHErn79cfVe4RmKMpzEeuZ8+ax9r7fgg8GJN+bIX4Nk=;
 b=C3q59kh5P4tn930DTT3eNjF8yy/qjCLYCBPbnI4PG35MFG3wKjb/8REqEtlAfpxcKR
 DqDCvKTZF83qtmlSA3XB+NV3NNudW2JivBPu3qy6q6wWFW3zZpzDyU4mQ0Z+7iwrXqaB
 oekKTrWrTVQNRWH5VluLmDESj1xqOtC9OTi1o=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=C3q59kh5
Subject: [Buildroot] [RFC PATCH 3/3] configs: add raspberrypi 5 32-bit
 defconfig
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
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBjb25maWd1cmF0aW9uIGJ1aWxkcyBhIDMyLWJpdCBpbWFnZSBmb3IgUmFzcGJlcnJ5UGkg
NS4KCk5vdGU6IEl0IHJldXNlcyB0aGUgUGk0J1MgZGVmY29uZmlnIGFzIHRoZXJlIGlzIG5vIHNw
ZWNpZmljIGRlZmNvbmZpZwpmb3IgQkNNMjcxMiBvbiBBUk0gMzItYml0LiBPbiBBUk0gNjQtYml0
LCB0aGUgbWFpbiBkaWZmZXJlbmNlIGlzIHRoZQpCQ00yNzEyIHVzZXMgMTZrIHBhZ2VzIHdoaWxl
IHRoZSBCQzI3MTEgdXNlcyA0ayBwYWdlcy4gU2VlIHRoZQpkaWZmZXJlbmNlIGJlbG93IGJldHdl
ZW4gdGhlIHR3byBBUk02NCBkZWZjb25maWdzOgoKCWdwb3J0YXlAYXJjaGxpbnV4IH4vc3JjL2xp
bnV4LXJhc3BiZXJyeXBpICQgZGlmZiAtTnVyZCBhcmNoL2FybTY0L2NvbmZpZ3MvYmNtMjcxKgoJ
LS0tIGFyY2gvYXJtNjQvY29uZmlncy9iY20yNzExX2RlZmNvbmZpZwkyMDIzLTEwLTA4IDExOjQ1
OjIwLjQ3MDIzODk5MyArMDIwMAoJKysrIGFyY2gvYXJtNjQvY29uZmlncy9iY20yNzEyX2RlZmNv
bmZpZwkyMDIzLTEwLTA4IDExOjQ1OjIwLjQ3MDIzODk5MyArMDIwMAoJQEAgLTEsNCArMSw0IEBA
CgktQ09ORklHX0xPQ0FMVkVSU0lPTj0iLXY4IgoJK0NPTkZJR19MT0NBTFZFUlNJT049Ii12OF8x
NmsiCgkgIyBDT05GSUdfTE9DQUxWRVJTSU9OX0FVVE8gaXMgbm90IHNldAoJIENPTkZJR19TWVNW
SVBDPXkKCSBDT05GSUdfUE9TSVhfTVFVRVVFPXkKCUBAIC00MSw2ICs0MSw3IEBACgkgIyBDT05G
SUdfQ0FWSVVNX0VSUkFUVU1fMjIzNzUgaXMgbm90IHNldAoJICMgQ09ORklHX0NBVklVTV9FUlJB
VFVNXzIzMTU0IGlzIG5vdCBzZXQKCSAjIENPTkZJR19DQVZJVU1fRVJSQVRVTV8yNzQ1NiBpcyBu
b3Qgc2V0CgkrQ09ORklHX0FSTTY0XzE2S19QQUdFUz15CgkgQ09ORklHX0NPTVBBVD15CgkgQ09O
RklHX0FSTVY4X0RFUFJFQ0FURUQ9eQoJIENPTkZJR19TV1BfRU1VTEFUSU9OPXkKCUBAIC02NSw2
ICs2Niw4IEBACgkgQ09ORklHX1ZJUlRVQUxJWkFUSU9OPXkKCSBDT05GSUdfS1ZNPXkKCSBDT05G
SUdfSlVNUF9MQUJFTD15CgkrQ09ORklHX0FSQ0hfTU1BUF9STkRfQklUUz0xOAoJK0NPTkZJR19B
UkNIX01NQVBfUk5EX0NPTVBBVF9CSVRTPTExCgkgQ09ORklHX01PRFVMRVM9eQoJIENPTkZJR19N
T0RVTEVfVU5MT0FEPXkKCSBDT05GSUdfTU9EVkVSU0lPTlM9eQoKU2lnbmVkLW9mZi1ieTogR2HD
q2wgUE9SVEFZIDxnYWVsLnBvcnRheUBydG9uZS5mcj4KLS0tCiBib2FyZC9yYXNwYmVycnlwaS9j
b25maWdfNS50eHQgfCAyMyArKysrKysrKysrKysrKysrKysrKwogYm9hcmQvcmFzcGJlcnJ5cGkv
cmVhZG1lLnR4dCAgIHwgIDEgKwogYm9hcmQvcmFzcGJlcnJ5cGk1ICAgICAgICAgICAgIHwgIDEg
KwogY29uZmlncy9yYXNwYmVycnlwaTVfZGVmY29uZmlnIHwgMzggKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogNCBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCiBjcmVh
dGUgbW9kZSAxMDA2NDQgYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzUudHh0CiBjcmVhdGUgbW9k
ZSAxMjAwMDAgYm9hcmQvcmFzcGJlcnJ5cGk1CiBjcmVhdGUgbW9kZSAxMDA2NDQgY29uZmlncy9y
YXNwYmVycnlwaTVfZGVmY29uZmlnCgpkaWZmIC0tZ2l0IGEvYm9hcmQvcmFzcGJlcnJ5cGkvY29u
ZmlnXzUudHh0IGIvYm9hcmQvcmFzcGJlcnJ5cGkvY29uZmlnXzUudHh0Cm5ldyBmaWxlIG1vZGUg
MTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLmFjMzQzMjUwYzgKLS0tIC9kZXYvbnVsbAorKysgYi9i
b2FyZC9yYXNwYmVycnlwaS9jb25maWdfNS50eHQKQEAgLTAsMCArMSwyMyBAQAorIyBQbGVhc2Ug
bm90ZSB0aGF0IHRoaXMgaXMgb25seSBhIHNhbXBsZSwgd2UgcmVjb21tZW5kIHlvdSB0byBjaGFu
Z2UgaXQgdG8gZml0CisjIHlvdXIgbmVlZHMuCisjIFlvdSBzaG91bGQgb3ZlcnJpZGUgdGhpcyBm
aWxlIHVzaW5nIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9DT05GSUdfRklMRS4KKyMgU2VlIGh0
dHA6Ly9idWlsZHJvb3Qub3JnL21hbnVhbC5odG1sI3Jvb3Rmcy1jdXN0b20KKyMgYW5kIGh0dHA6
Ly9lbGludXgub3JnL1JQaWNvbmZpZyBmb3IgYSBkZXNjcmlwdGlvbiBvZiBjb25maWcudHh0IHN5
bnRheAorCitzdGFydF9maWxlPXN0YXJ0NC5lbGYKK2ZpeHVwX2ZpbGU9Zml4dXA0LmRhdAorCitr
ZXJuZWw9ekltYWdlCisKKyMgVG8gdXNlIGFuIGV4dGVybmFsIGluaXRyYW1mcyBmaWxlCisjaW5p
dHJhbWZzIHJvb3Rmcy5jcGlvLmd6CisKKyMgRGlzYWJsZSBvdmVyc2NhbiBhc3N1bWluZyB0aGUg
ZGlzcGxheSBzdXBwb3J0cyBkaXNwbGF5aW5nIHRoZSBmdWxsIHJlc29sdXRpb24KKyMgSWYgdGhl
IHRleHQgc2hvd24gb24gdGhlIHNjcmVlbiBkaXNhcHBlYXJzIG9mZiB0aGUgZWRnZSwgY29tbWVu
dCB0aGlzIG91dAorZGlzYWJsZV9vdmVyc2Nhbj0xCisKKyMgSG93IG11Y2ggbWVtb3J5IGluIE1C
IHRvIGFzc2lnbiB0byB0aGUgR1BVIG9uIFBpIG1vZGVscyBoYXZpbmcKKyMgMjU2LCA1MTIgb3Ig
MTAyNCBNQiB0b3RhbCBtZW1vcnkKK2dwdV9tZW1fMjU2PTEwMAorZ3B1X21lbV81MTI9MTAwCitn
cHVfbWVtXzEwMjQ9MTAwCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0
IGIvYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dAppbmRleCBmMmFmNTAyMjUxLi5kZTkzYWQ2
NzcyIDEwMDY0NAotLS0gYS9ib2FyZC9yYXNwYmVycnlwaS9yZWFkbWUudHh0CisrKyBiL2JvYXJk
L3Jhc3BiZXJyeXBpL3JlYWRtZS50eHQKQEAgLTEwMiw2ICsxMDIsNyBAQCBBZnRlciBidWlsZGlu
ZywgeW91IHNob3VsZCBvYnRhaW4gdGhpcyB0cmVlOgogICAgIHwgICArLS0gZml4dXA0LmRhdCAg
ICAgICAgICAgICAgWzFdCiAgICAgfCAgICstLSBzdGFydC5lbGYgICAgICAgICAgICAgICBbMV0K
ICAgICB8ICAgKy0tIHN0YXJ0NC5lbGYgICAgICAgICAgICAgIFsxXQorICAgIHwgICArLS0gc3Rh
cnQ1LmVsZiAgICAgICAgICAgICAgWzFdCiAgICAgfCAgIGAtLSBvdmVybGF5cy8gICAgICAgICAg
ICAgICBbMl0KICAgICArLS0gc2RjYXJkLmltZwogICAgICstLSBJbWFnZSAgICAgICAgICAgICAg
ICAgICAgICAgWzFdCmRpZmYgLS1naXQgYS9ib2FyZC9yYXNwYmVycnlwaTUgYi9ib2FyZC9yYXNw
YmVycnlwaTUKbmV3IGZpbGUgbW9kZSAxMjAwMDAKaW5kZXggMDAwMDAwMDAwMC4uZmNkYWZjODFl
ZAotLS0gL2Rldi9udWxsCisrKyBiL2JvYXJkL3Jhc3BiZXJyeXBpNQpAQCAtMCwwICsxIEBACity
YXNwYmVycnlwaQpcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKZGlmZiAtLWdpdCBhL2NvbmZp
Z3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZp
ZwpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5kZjAwZTAzNWRhCi0tLSAv
ZGV2L251bGwKKysrIGIvY29uZmlncy9yYXNwYmVycnlwaTVfZGVmY29uZmlnCkBAIC0wLDAgKzEs
MzggQEAKK0JSMl9hcm09eQorQlIyX2NvcnRleF9hNzZfYTU1PXkKK0JSMl9BUk1fRlBVX1ZGUFY0
PXkKKworQlIyX1RPT0xDSEFJTl9CVUlMRFJPT1RfQ1hYPXkKKworQlIyX1NZU1RFTV9ESENQPSJl
dGgwIgorCisjIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEgNS4xMCBzZXJpZXMKK0JS
Ml9QQUNLQUdFX0hPU1RfTElOVVhfSEVBREVSU19DVVNUT01fNV8xMD15CisKK0JSMl9MSU5VWF9L
RVJORUw9eQorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVEFSQkFMTD15CitCUjJfTElOVVhfS0VS
TkVMX0NVU1RPTV9UQVJCQUxMX0xPQ0FUSU9OPSIkKGNhbGwgZ2l0aHViLHJhc3BiZXJyeXBpLGxp
bnV4LGZlYjRlYTUxZTc3YWYwOWMxYTRjN2MzZTVkZDMzMjM3NzUwZjk1Y2QpL2xpbnV4LWZlYjRl
YTUxZTc3YWYwOWMxYTRjN2MzZTVkZDMzMjM3NzUwZjk1Y2QudGFyLmd6IgorQlIyX0xJTlVYX0tF
Uk5FTF9ERUZDT05GSUc9ImJjbTI3MTEiCisKKyMgQnVpbGQgdGhlIERUQiBmcm9tIHRoZSBrZXJu
ZWwgc291cmNlcworQlIyX0xJTlVYX0tFUk5FTF9EVFNfU1VQUE9SVD15CitCUjJfTElOVVhfS0VS
TkVMX0lOVFJFRV9EVFNfTkFNRT0iYmNtMjcxMi1ycGktNS1iIgorCitCUjJfTElOVVhfS0VSTkVM
X05FRURTX0hPU1RfT1BFTlNTTD15CisKK0JSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRT15CitCUjJf
UEFDS0FHRV9SUElfRklSTVdBUkVfVkFSSUFOVF9QSTU9eQorQlIyX1BBQ0tBR0VfUlBJX0ZJUk1X
QVJFX0NPTkZJR19GSUxFPSJib2FyZC9yYXNwYmVycnlwaTUvY29uZmlnXzUudHh0IgorCisjIFJl
cXVpcmVkIHRvb2xzIHRvIGNyZWF0ZSB0aGUgU0QgaW1hZ2UKK0JSMl9QQUNLQUdFX0hPU1RfRE9T
RlNUT09MUz15CitCUjJfUEFDS0FHRV9IT1NUX0dFTklNQUdFPXkKK0JSMl9QQUNLQUdFX0hPU1Rf
TVRPT0xTPXkKKworIyBGaWxlc3lzdGVtIC8gaW1hZ2UKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDI9
eQorQlIyX1RBUkdFVF9ST09URlNfRVhUMl80PXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0la
RT0iMTIwTSIKKyMgQlIyX1RBUkdFVF9ST09URlNfVEFSIGlzIG5vdCBzZXQKK0JSMl9ST09URlNf
UE9TVF9CVUlMRF9TQ1JJUFQ9ImJvYXJkL3Jhc3BiZXJyeXBpNS9wb3N0LWJ1aWxkLnNoIgorQlIy
X1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0iYm9hcmQvcmFzcGJlcnJ5cGk1L3Bvc3QtaW1hZ2Uu
c2giCi0tIAoyLjQyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
