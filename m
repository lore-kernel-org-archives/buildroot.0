Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8456C61D85
	for <buildroot@archiver.kernel.org>; Tue, 21 Nov 2023 19:35:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AB9581F44;
	Tue, 21 Nov 2023 19:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AB9581F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d1j1dn-_XiNS; Tue, 21 Nov 2023 19:35:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 771968146B;
	Tue, 21 Nov 2023 19:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 771968146B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18D941BF30C
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 19:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E596E60C14
 for <buildroot@lists.busybox.net>; Tue, 21 Nov 2023 19:35:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E596E60C14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DPuEFAXj9Jg6 for <buildroot@lists.busybox.net>;
 Tue, 21 Nov 2023 19:35:01 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A325B60BF0
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 19:35:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A325B60BF0
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40839807e82so682475e9.0
 for <buildroot@buildroot.org>; Tue, 21 Nov 2023 11:35:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700595299; x=1701200099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uEcOneuRxNZ8xzY3Sph/uzy+F2kVvmB4N2o4QaDIylM=;
 b=qMWEDhGAM4Y/HbzqiAYdGdPc3qIa7OsltJgZBeOJIrcukVwnMphc8fuFTzDGU6jpYV
 +WHXrO6SAgLKX4Rz6e+f25+uN0/BeBGg0YWW4r6kBoL06kgXQn0kxfHf3hZL5t5w/hvO
 0lsJ1rDMg7O4JeL8Rygk7ZzXyyBJxOt6g6Q2DjZCZfNy7RdavgHIEYt5ckTdUe4fCY/T
 D8X4N92SXzZ93/jJxzg6f84CIIA5nhViIVwkV7GDqGxq0TT7nib1ER5IN1GOC4TpOZf9
 4pZxeJ2YMrUBbQnRhz8wK4UuIe0UoLQL+uIZKXP6WMGuGCmL6aRlHbimRjKeJSa0SgL1
 XvTQ==
X-Gm-Message-State: AOJu0YwzJh/k3cBKY62E8YvRkeLCpL48URBpPAsG0hCfQ8si+IYgIsaR
 lcx2O2Ksv9I8qbgfrzqGE5STFwBI4FfZC5l2YNk=
X-Google-Smtp-Source: AGHT+IGEoNJKrotJ0WEl/JwIdalEKqigJ7qAEV8t/gjjLxO4SAxkF0f5xY6PNEvZKcXZtJO2T9q70w==
X-Received: by 2002:a05:600c:a2a2:b0:3fe:d67d:5040 with SMTP id
 hu34-20020a05600ca2a200b003fed67d5040mr3213071wmb.5.1700595298983; 
 Tue, 21 Nov 2023 11:34:58 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a1c4c11000000b0040a44179a88sm21879043wmf.42.2023.11.21.11.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 11:34:58 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Tue, 21 Nov 2023 20:34:44 +0100
Message-ID: <20231121193448.1151936-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1700595299; x=1701200099; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uEcOneuRxNZ8xzY3Sph/uzy+F2kVvmB4N2o4QaDIylM=;
 b=Cocd4l2mN+t5MyWnhdy6javn9ycZROnKCqyU1H8p+UbK7dFeEK2xgd8ar9V6QA+Z59
 5yWDmtumRybIQuDGfhIzy7XGmm+KILvMvISMQZDj/5WJL40mW0cdGP/TEjRUMoeHnGS2
 J5gWncBDEri+raOVLSWm7AjBgAiuNNeBD+sTE=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=Cocd4l2m
Subject: [Buildroot] [v1 0/4] [PATCH 0/3] Add support for Pi5
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
Cc: Martin Bark <martin@barkynet.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGVhciBtYWludGFpbmVycywKClRoaXMgcGF0Y2ggc2VyaWVzIGFkZHMgdGhlIHN1cHBvcnQgZm9y
IHRoZSBSYXNwYmVycnkgUGkgNVswXS4KClRoZSBmaXJzdCBwYXRjaCBlbmFibGVzIE1NVSAxNksg
cGFnZS1zaXplIG9uIEFSTTY0IGFzIHRoZSBSYXNwYmVycnkgUGkgNQpzdXBwb3J0cyAxNksgcGFn
ZS1zaXplWzFdLgoKVGhlIHR3byBmb2xsb3dpbmcgcGF0Y2hlcyBidW1wIHRoZSBwYWNrYWdlcyBy
cGktZmlybXdhcmUgYW5kIGxpbnV4LgogLSBUaGUgcGFja2FnZSBycGktZmlybXdhcmUgYnVtcHMg
dGhlIGR0YiBvdmVybGF5cyB0byB0aGUgY29tbWl0CiAgIDdlOWMyMDYzZmMxNTI3NGZiYzRkYWIx
Y2E2MTRmOTIyODgzNGQ4ODFbMl0uIFRoZSBjb21taXQgc3RhdGVzICJBZGQKICAgc3VwcG9ydCBm
b3IgUEkgNSIgYW5kIGl0IGJ1bXBzIHRoZSBrZXJuZWwgZmlsZXMuIFRoZSBmaXJtd2FyZSBmaWxl
cwogICB0cmFuc2ZlcnJlZCB0byB0aGUgVmlkZW9Db3JlIEdQVSBhcmUgbGVmdCB1bnRvdWNoZWQg
c2luY2UgdGhleSBhcmUKICAgc2VsZi1jb250YWluZWQgaW4gdGhlIGJvb3Rsb2FkZXIgRUVQUk9N
IG9mIHRoZSBSYXNwYmVycnkgUGkgNQogICBmaXJtd2FyZVszXS4KIC0gVGhlIHBhY2thZ2UgbGlu
dXggYnVtcHMgdG8gdGhlIHJhc3BiZXJyeXBpIGtlcm5lbCB0byA2LjEuNTUgdXAgdG8gdGhlCiAg
IGNvbW1pdFs0XS4gVGhlIGJyYW5jaCBycGktNi4xLnkgc3VwcG9ydHMgdGhlIFJhc3BiZXJyeSBQ
aSA1LgoKVGhlIGxhc3QgcGF0Y2ggYWRkcyB0aGUgcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZyBmb3Ig
dGhlIFJhc3BiZXJyeSBQaSA1CjY0LWJpdC4gSXQgdXNlcyB0aGUgZGVmY29uZmlnIGJjbTI3MTJf
ZGVmY29uZmlnWzVdIGFuZCB0aGUgZGV2aWNlLXRyZWUKc291cmNlIGJjbTI3MTItcnBpLTUtYi5k
dHNbNl0uIFRoZSBSYXNwYmVycnkgUGkgNSBoYXMgbm93IGEgZGVkaWNhdGVkCmRlYnVnIFVBUlQg
Y29ubmVjdG9yWzddIChpdCBpcyBhbHdheXMgYWN0aXZlIGFuZCBlbmFibGVkOyB0aGVyZSBpcyBu
bwptb3JlIG5lZWQgdG8gZW5hYmxlX3VhcnQ9MSBpbiB0aGUgZmlsZSBjb25maWcudHh0KS4gVGhl
IFVBUlQgZGV2aWNlIG5hbWUKY2hhbmdlcyB0byB0dHlBTUExMCBhbmQgdGhlIGNvbW1hbmQgbGlu
ZSBoYXMgdG8gYmUgdXBkYXRlZCBpbiB0aGUgZmlsZQpjbWRsaW5lLnR4dC4gVGhlIFJhc3BiZXJy
eSBQaSA1IG9ubHkgc3VwcG9ydHMgNjQtYml0IGtlcm5lbFs4XS4KClRoZSBvdXRwdXQgYm9vdHMg
ZmluZSBhbmQgaXQgcnVucyBnZXR0eSBvbiB1YXJ0IGFuZCB2aXJ0dWFsIHR0eSBpZiBpdCBpcwpi
dWlsdCB1c2luZyB0aGUgdG9vbGNoYWluIGJ1aWx0IGJ5IGJ1aWxkcm9vdC4KClRoZSBvdXRwdXQg
Ym9vdHMgdGhlIGtlcm5lbCBidXQgdGhlIGtlcm5lbCBjYW5ub3QgcnVuIHRoZSBpbml0IHByb2Nl
c3MKaWYgaXQgaXMgYnVpbHQgdXNpbmcgdGhlIGJvb3RsaW4gcHJlYnVpbHQgdG9vbGNoYWluLiBT
b21ldGhpbmcgaXMgYnJva2VuCmR1ZSB0byB0aGUgMTZrIE1NVSBwYWdlLXNpemUgOigKClF1ZXN0
aW9uOiB0aGUgZGV2aWNlLXRyZWUgb3ZlcmxheXMgYXJlIHRha2VuIGZyb20gdGhlIHJwaS1maXJt
d2FyZTsgaXMKdGhlcmUgYSBwbGFuIHRvIGNvbXBpbGUgdGhlIG9uZSBmcm9tIHRoZSBkb3duc3Ry
ZWFtIGtlcm5lbCBzb3VyY2VzCmluc3RlYWQ/IGJ5IHR3ZWFraW5nIHRoZSBsaW51eC5tayBtYXli
ZT8KCkNoYW5nZXMgc2luY2UgUkZDOgogLSBVcGRhdGUgUkVBRE1FIHRvIGFkZCBtb2RlbCBQaSA1
IEIKIC0gQWRkIHN1cHBvcnQgZm9yIDY0SyBNTVUgcGFnZS1zaXplIGZvciBBUk02NCBhbmQgUmFz
cGJlcnJ5IFBpIDUKIC0gQWRkIFJhc3BiZXJyeSBQaSA1IHNwZWNpZmljIGNtZGxpbmVfNS50eHQg
dG8gc2V0IGl0cyBjb25zb2xlIG9uIGl0cwogICBkZWJ1ZyB1YXJ0ICh0dHlBTUExMCBpbnN0ZWFk
IG9mIHR0eUFNQTApCiAtIFJlbW92ZSAzMi1iaXQgdmFyaWFudCBzaW5jZSBSYXNwYmVycnkgUGkg
NSBzdXBwb3J0cyBib290aW5nIGEgNjQtYml0CiAgIGtlcm5lbCBvbmx5CiAtIFJlbW92ZSB0aGUg
cHJvcGVydHkgYXJtXzY0Yml0PTEgZnJvbSBjb25maWdfNV82NGJpdC50eHQKIC0gUmVtb3ZlIHRo
ZSBfNjRiaXQgc3VmZml4CiAtIFJlbW92ZSB1bmVjZXNzYXJ5IFBpIDUgdmFyaWFudCBmcm9tIHBh
Y2thZ2UgcnBpLWZpcm13YXJlCgpbMF06IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLmNvbS9kb2N1
bWVudGF0aW9uL2NvbXB1dGVycy9yYXNwYmVycnktcGktNS5odG1sI2ludHJvZHVjdGlvbgpbMV06
IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLmNvbS9kb2N1bWVudGF0aW9uL2NvbXB1dGVycy9jb25m
aWdfdHh0Lmh0bWwja2VybmVsClsyXTogaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL2Zp
cm13YXJlL2NvbW1pdC83ZTljMjA2M2ZjMTUyNzRmYmM0ZGFiMWNhNjE0ZjkyMjg4MzRkODgxClsz
XTogaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkuY29tL2RvY3VtZW50YXRpb24vY29tcHV0ZXJzL2Nv
bmZpZ190eHQuaHRtbCNzdGFydF9maWxlLWZpeHVwX2ZpbGUKWzRdOiBodHRwczovL2dpdGh1Yi5j
b20vcmFzcGJlcnJ5cGkvbGludXgvY29tbWl0L2ZlYjRlYTUxZTc3YWYwOWMxYTRjN2MzZTVkZDMz
MjM3NzUwZjk1Y2QKWzVdOiBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvY29t
bWl0LzljZmIzNzkxNDdmODAzYjAzNjJiMGZlMjQ5ZTViMTQ1ZDIzMmJlYTMKWzZdOiBodHRwczov
L2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvY29tbWl0LzExOTZiZjFhNzczNmZmMGFiNzlm
NTAxMmZhODQwODJlMjk4MDMxYTcKWzddOiBodHRwczovL3d3dy5yYXNwYmVycnlwaS5jb20vZG9j
dW1lbnRhdGlvbi9jb21wdXRlcnMvcmFzcGJlcnJ5LXBpLTUuaHRtbCN1YXJ0LWNvbm5lY3Rvcgpb
OF06IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLmNvbS9kb2N1bWVudGF0aW9uL2NvbXB1dGVycy9j
b25maWdfdHh0Lmh0bWwjYXJtXzY0Yml0CgpLaW5kIFJlZ2FyZHMsCkdhw6tsIFBPUlRBWSAoNCk6
CiAgYXJjaDogYWRkIHN1cHBvcnQgMTZrIHBhZ2Ugc2l6ZSBvbiBBUk02NAogIHBhY2thZ2UvcnBp
LWZpcm13YXJlOiBidW1wIHZlcnNpb24gZm9yIHBpNSBzdXBwb3J0CiAgY29uZmlncy9yYXNwYmVy
cnlwaSo6IGJ1bXAga2VybmVsIHZlcnNpb24gdG8gZmViNGVhNSAoNi4xLjU1KQogIGNvbmZpZ3M6
IGFkZCByYXNwYmVycnlwaSA1IGRlZmNvbmZpZwoKIGFyY2gvQ29uZmlnLmluLmFybSAgICAgICAg
ICAgICAgICAgICAgIHwgIDQgKysrCiBhcmNoL2FyY2gubWsgICAgICAgICAgICAgICAgICAgICAg
ICAgICB8ICAyICstCiBib2FyZC9yYXNwYmVycnlwaS9jbWRsaW5lXzUudHh0ICAgICAgICB8ICAx
ICsKIGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ181LnR4dCAgICAgICAgIHwgMjQgKysrKysrKysr
KysrKysrKwogYm9hcmQvcmFzcGJlcnJ5cGkvcmVhZG1lLnR4dCAgICAgICAgICAgfCAgOCArKysr
Ky0KIGJvYXJkL3Jhc3BiZXJyeXBpNSAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogY29uZmln
cy9yYXNwYmVycnlwaTBfZGVmY29uZmlnICAgICAgICAgfCAgMiArLQogY29uZmlncy9yYXNwYmVy
cnlwaTB3X2RlZmNvbmZpZyAgICAgICAgfCAgMiArLQogY29uZmlncy9yYXNwYmVycnlwaTJfZGVm
Y29uZmlnICAgICAgICAgfCAgMiArLQogY29uZmlncy9yYXNwYmVycnlwaTNfNjRfZGVmY29uZmln
ICAgICAgfCAgMiArLQogY29uZmlncy9yYXNwYmVycnlwaTNfZGVmY29uZmlnICAgICAgICAgfCAg
MiArLQogY29uZmlncy9yYXNwYmVycnlwaTNfcXQ1d2VfZGVmY29uZmlnICAgfCAgMiArLQogY29u
Zmlncy9yYXNwYmVycnlwaTRfNjRfZGVmY29uZmlnICAgICAgfCAgMiArLQogY29uZmlncy9yYXNw
YmVycnlwaTRfZGVmY29uZmlnICAgICAgICAgfCAgMiArLQogY29uZmlncy9yYXNwYmVycnlwaTVf
ZGVmY29uZmlnICAgICAgICAgfCAzOSArKysrKysrKysrKysrKysrKysrKysrKysrKwogY29uZmln
cy9yYXNwYmVycnlwaV9kZWZjb25maWcgICAgICAgICAgfCAgMiArLQogY29uZmlncy9yYXNwYmVy
cnlwaWNtNGlvXzY0X2RlZmNvbmZpZyAgfCAgMiArLQogY29uZmlncy9yYXNwYmVycnlwaWNtNGlv
X2RlZmNvbmZpZyAgICAgfCAgMiArLQogY29uZmlncy9yYXNwYmVycnlwaXplcm8yd19kZWZjb25m
aWcgICAgfCAgMiArLQogbGludXgvbGludXgubWsgICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NCArKysKIHBhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5oYXNoIHwgIDIgKy0KIHBh
Y2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5tayAgIHwgIDIgKy0KIDIyIGZpbGVzIGNo
YW5nZWQsIDk1IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IGJvYXJkL3Jhc3BiZXJyeXBpL2NtZGxpbmVfNS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBi
b2FyZC9yYXNwYmVycnlwaS9jb25maWdfNS50eHQKIGNyZWF0ZSBtb2RlIDEyMDAwMCBib2FyZC9y
YXNwYmVycnlwaTUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdzL3Jhc3BiZXJyeXBpNV9kZWZj
b25maWcKCi0tCjIuNDIuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
