Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61D53C4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 16:00:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E335841899;
	Mon, 11 Dec 2023 16:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E335841899
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2wbFKEtTj-LJ; Mon, 11 Dec 2023 16:00:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10872418A2;
	Mon, 11 Dec 2023 16:00:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10872418A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B74FB1BF336
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 16:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8FA95418A2
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 16:00:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FA95418A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uY3NqaOblqQo for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 16:00:05 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F313341899
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 16:00:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F313341899
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-40c39e936b4so23481165e9.1
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 08:00:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702310403; x=1702915203;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z46PtF2+HXCDN9MrtZvPO6Z/ML7mOdmepq+nkLdX1Wg=;
 b=moo8fVt1PM7nmfJY6A1WYAehpUFUx9tYcTGdf/bTV5s/CP+Lpvn06xdN2PS7E6ppJR
 Zi8PGX+hLHe9FQADXUXvATIyttol2THM/u2wWHs/61AgtsIPnxGqCHlQfN13dih6gyKT
 YGO3ry8g6c3Cjz9FbrLSg5KDh7x/BdJqvVrFCefk2mH8bYPtsgjv5EnRhOc+J5ntXdCO
 kA2e5fU7ohe4Q5fLb1jFHeAMMz455pHyFJXfJmtMcF4L09wXLAJGNVQW9rmzLSRYSD7m
 a2+0Bn3jaR0C48cIuIjtVPV3+bmrs8ljdV8JD/WW1CmSqn85OhmnRZgMXizphzMY90i0
 BEvQ==
X-Gm-Message-State: AOJu0Yw9Z0MxO+gB0z/PuYa4HUWFZC3BSlCfcTVQgm4FehKPqHblrvLj
 /26Zcl9pzH9on8C8BeGb5OkYeb3vUw4oHe3d6Tg=
X-Google-Smtp-Source: AGHT+IHwMxrJMblAIzWYr8YJea3pmclbRYtbNDiP3UMfPKBa4AUlcTkJaRNpKVNJ5UUCF5aIWux3/w==
X-Received: by 2002:a05:600c:4507:b0:40c:22b5:d174 with SMTP id
 t7-20020a05600c450700b0040c22b5d174mr1344803wmo.126.1702310402676; 
 Mon, 11 Dec 2023 08:00:02 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 d1-20020adfe881000000b003334926fb81sm3800972wrm.90.2023.12.11.08.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Dec 2023 08:00:02 -0800 (PST)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Mon, 11 Dec 2023 16:59:49 +0100
Message-ID: <20231211155951.4079886-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1702310403; x=1702915203; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z46PtF2+HXCDN9MrtZvPO6Z/ML7mOdmepq+nkLdX1Wg=;
 b=THoriLr8RTQkXwrDnF34iX1wDMgk/iq5EZ6zG+pDCvubXbuZ0RN0CU02ARWZIvzIIx
 fvPIJnkS9myDiBBGWz6DhezZ+6hrQGoZNCGh8tVfd36wzGpI7oRUU8elVXR4+aCzSlIs
 eMXLm+2/e75WiBBiaM/C9qs2is6pwWgHrHHsA=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=THoriLr8
Subject: [Buildroot] [PATCH v2 0/2] Add support for Pi5
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
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RGVhciBtYWludGFpbmVycywKClRoaXMgdHdvIHBhdGNoZXMgYWRkcyB0aGUgc3VwcG9ydCBmb3Ig
dGhlIFJhc3BiZXJyeSBQaSA1WzBdLgoKVGhlIGZpcnN0IHBhdGNoIGVuYWJsZXMgTU1VIDE2SyBw
YWdlLXNpemUgb24gQVJNNjQgYXMgdGhlIFJhc3BiZXJyeSBQaSA1CnN1cHBvcnRzIDE2SyBwYWdl
LXNpemVbMV0uCgpUaGUgbGFzdCBwYXRjaCBhZGRzIHRoZSByYXNwYmVycnlwaTVfZGVmY29uZmln
IGZvciB0aGUgUmFzcGJlcnJ5IFBpIDUKNjQtYml0LiBJdCB1c2VzIHRoZSBkZWZjb25maWcgYmNt
MjcxMl9kZWZjb25maWdbMl0gYW5kIHRoZSBkZXZpY2UtdHJlZQpzb3VyY2UgYmNtMjcxMi1ycGkt
NS1iLmR0c1szXS4gVGhlIFJhc3BiZXJyeSBQaSA1IGhhcyBub3cgYSBkZWRpY2F0ZWQKZGVidWcg
VUFSVCBjb25uZWN0b3JbNF0gKGl0IGlzIGFsd2F5cyBhY3RpdmUgYW5kIGVuYWJsZWQ7IHRoZXJl
IGlzIG5vCm1vcmUgbmVlZCB0byBlbmFibGVfdWFydD0xIGluIHRoZSBmaWxlIGNvbmZpZy50eHQp
LiBUaGUgVUFSVCBkZXZpY2UgbmFtZQpjaGFuZ2VzIHRvIHR0eUFNQTEwIGFuZCB0aGUgY29tbWFu
ZCBsaW5lIGhhcyB0byBiZSB1cGRhdGVkIGluIHRoZSBmaWxlCmNtZGxpbmUudHh0LiBUaGUgUmFz
cGJlcnJ5IFBpIDUgb25seSBzdXBwb3J0cyA2NC1iaXQga2VybmVsWzVdLgoKQ2hhbmdlcyBzaW5j
ZSBSRkM6CiAtIFVwZGF0ZSBSRUFETUUgdG8gYWRkIG1vZGVsIFBpIDUgQgogLSBBZGQgc3VwcG9y
dCBmb3IgNjRLIE1NVSBwYWdlLXNpemUgZm9yIEFSTTY0IGFuZCBSYXNwYmVycnkgUGkgNQogLSBB
ZGQgUmFzcGJlcnJ5IFBpIDUgc3BlY2lmaWMgY21kbGluZV81LnR4dCB0byBzZXQgaXRzIGNvbnNv
bGUgb24gaXRzCiAgIGRlYnVnIHVhcnQgKHR0eUFNQTEwIGluc3RlYWQgb2YgdHR5QU1BMCkKIC0g
UmVtb3ZlIDMyLWJpdCB2YXJpYW50IHNpbmNlIFJhc3BiZXJyeSBQaSA1IHN1cHBvcnRzIGJvb3Rp
bmcgYSA2NC1iaXQKICAga2VybmVsIG9ubHkKIC0gUmVtb3ZlIHRoZSBwcm9wZXJ0eSBhcm1fNjRi
aXQ9MSBmcm9tIGNvbmZpZ181XzY0Yml0LnR4dAogLSBSZW1vdmUgdGhlIF82NGJpdCBzdWZmaXgK
IC0gUmVtb3ZlIHVuZWNlc3NhcnkgUGkgNSB2YXJpYW50IGZyb20gcGFja2FnZSBycGktZmlybXdh
cmUKCkNoYW5nZXMgc2luY2UgdjE6CiAtIFJlYmFzZSBvbiB0b3Agb2YgbWFzdGVyCiAtIFJlbW92
ZSB0aGUgYnVtcHMgZm9yIHRoZSBycGktZmlybXdhcmUgYW5kIGxpbnV4IHBhY2thZ2VzCiAtIEJ1
bXAgdGhlIGtlcm5lbCB0byBsaW51eC0xN2YxMzViNzQyYzRlZGIzNDBhZmIzNjU4NzNjM2E1NzRm
N2UxNmNiCiAgICg2LjEuNjEsIGkuZS4gdGhlIHNhbWUgdmVyc2lvbiBhcyB0aGUgb3RoZXIgcmFz
cGJlcnJ5cGkgZGVmY29uZmlncykKClswXTogaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkuY29tL2Rv
Y3VtZW50YXRpb24vY29tcHV0ZXJzL3Jhc3BiZXJyeS1waS01Lmh0bWwjaW50cm9kdWN0aW9uClsx
XTogaHR0cHM6Ly93d3cucmFzcGJlcnJ5cGkuY29tL2RvY3VtZW50YXRpb24vY29tcHV0ZXJzL2Nv
bmZpZ190eHQuaHRtbCNrZXJuZWwKWzJdOiBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkv
bGludXgvY29tbWl0LzljZmIzNzkxNDdmODAzYjAzNjJiMGZlMjQ5ZTViMTQ1ZDIzMmJlYTMKWzNd
OiBodHRwczovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvY29tbWl0LzExOTZiZjFhNzcz
NmZmMGFiNzlmNTAxMmZhODQwODJlMjk4MDMxYTcKWzRdOiBodHRwczovL3d3dy5yYXNwYmVycnlw
aS5jb20vZG9jdW1lbnRhdGlvbi9jb21wdXRlcnMvcmFzcGJlcnJ5LXBpLTUuaHRtbCN1YXJ0LWNv
bm5lY3RvcgpbNV06IGh0dHBzOi8vd3d3LnJhc3BiZXJyeXBpLmNvbS9kb2N1bWVudGF0aW9uL2Nv
bXB1dGVycy9jb25maWdfdHh0Lmh0bWwjYXJtXzY0Yml0CgpLaW5kIFJlZ2FyZHMsCkdhw6tsIFBP
UlRBWSAoNCk6CiAgYXJjaDogYWRkIHN1cHBvcnQgMTZrIHBhZ2Ugc2l6ZSBvbiBBUk02NAogIGNv
bmZpZ3M6IGFkZCByYXNwYmVycnlwaSA1IGRlZmNvbmZpZwoKIGFyY2gvQ29uZmlnLmluLmFybSAg
ICAgICAgICAgICAgfCAgNCArKysrCiBhcmNoL2FyY2gubWsgICAgICAgICAgICAgICAgICAgIHwg
IDIgKy0KIGJvYXJkL3Jhc3BiZXJyeXBpL2NtZGxpbmVfNS50eHQgfCAgMSArCiBib2FyZC9yYXNw
YmVycnlwaS9jb25maWdfNS50eHQgIHwgMTQgKysrKysrKysrKysrCiBib2FyZC9yYXNwYmVycnlw
aS9yZWFkbWUudHh0ICAgIHwgIDYgKysrKysKIGJvYXJkL3Jhc3BiZXJyeXBpNSAgICAgICAgICAg
ICAgfCAgMSArCiBjb25maWdzL3Jhc3BiZXJyeXBpNV9kZWZjb25maWcgIHwgNDAgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCiBsaW51eC9saW51eC5tayAgICAgICAgICAgICAgICAg
IHwgIDQgKysrKwogOCBmaWxlcyBjaGFuZ2VkLCA3MSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgYm9hcmQvcmFzcGJlcnJ5cGkvY21kbGluZV81LnR4dAog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3Jhc3BiZXJyeXBpL2NvbmZpZ181LnR4dAogY3JlYXRl
IG1vZGUgMTIwMDAwIGJvYXJkL3Jhc3BiZXJyeXBpNQogY3JlYXRlIG1vZGUgMTAwNjQ0IGNvbmZp
Z3MvcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZwoKLS0KMi40My4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
