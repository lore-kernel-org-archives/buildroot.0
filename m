Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00ECAECAAA1
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 21:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82D9960C07;
	Fri, 28 Oct 2022 21:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82D9960C07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivGVXYvV2qJh; Fri, 28 Oct 2022 21:31:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 998F660BCB;
	Fri, 28 Oct 2022 21:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 998F660BCB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 231A21BF855
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 21:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB74A40112
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 21:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB74A40112
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gahf2_gJsWG1 for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 21:31:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A62040104
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A62040104
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 21:31:33 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w14so8145879wru.8
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 14:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pM9yTln9vMlgkECkZlrM5gTA0WwPMmy0oGJihX5/Ef4=;
 b=mTsQcviPwL2fSxl/0rgWasDxSPMiMbTqAUYIFUvFAwkiIduUG0Z3F8e91mptamce60
 3tGvjBxdgxxRC3Y5e+lCQY/cg2pGf+Df9YZ2oo3hdj9xUWm7z5GkEcNSwwckQ6CuaIGf
 8qKK/222DU+qKOZalzr7ueOiycwZC2n41bCDZt4toVI6mTaqraS3cyBWSDb8Uz8H9atQ
 V6jEXFIXHCBbN/tDeMQ4IAhpcQK4BgCs/R2vYN7/qhlbdXW6SXN40+pt+5PVGq/79tc2
 JKVoJoS36S0Zu3ol61T76tYXi85NEuSVNnvwlxk6VlPuzP/LAy7n7BrOzM3EGygLtLIT
 cxsw==
X-Gm-Message-State: ACrzQf0Ae6EWdBnsiGoGyPjejfCDAh46dcZ3O6SR/XqT5fzV5URQXxhn
 L6Hg1kR3z9rddx0AIISutJP4/EwjuaI=
X-Google-Smtp-Source: AMsMyM5sNw2KL7iS0wNy/lsnXF3cqIuyoKw6mKQCgbLB1C7ov/3oug2b5rJx68bMOsHuVccbZ3CCQw==
X-Received: by 2002:adf:dec3:0:b0:236:61ff:e107 with SMTP id
 i3-20020adfdec3000000b0023661ffe107mr752340wrn.39.1666992690820; 
 Fri, 28 Oct 2022 14:31:30 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 u3-20020adfdd43000000b002364c77bc96sm4510107wrm.33.2022.10.28.14.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 14:31:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 23:31:27 +0200
Message-Id: <20221028213127.243377-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pM9yTln9vMlgkECkZlrM5gTA0WwPMmy0oGJihX5/Ef4=;
 b=HeSzd3uYqFbc1tBD9km8QbG02vqN3uiqmMcxX7LpqGVeGIxwzFpsE+Ex9bWgCxjTEY
 VCnI7vlqh6wQi/gXPXJhYjHKBSmnv8wAA4jmEYVjlqF4cBXoXWlHk8CYDFko3ALvcdwt
 j8MSE0BI87wD3VNQ2e8TdUGpVAVuBoqgtGBZ0ilKMuApoKZixHGCqrBAnq8fOt5cynMa
 Udl9v0pwbgn0rbDNXqtJts89L2UT5QndBlXf2qAcNhpp4DB85sMeJ1+CVHZlKysWfjEv
 CLHki0UWqQfg2D+St1R59x0Uf4fO37uMFkfWJbs2rplc66dON5uMUUzmkjfQGAf4r8Yr
 0aTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HeSzd3uY
Subject: [Buildroot] [PATCH 1/1] package/slang: bump to version 2.3.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVmcmVzaCBwYXRjaAoKaHR0cDovL2xpc3RzLmplZHNvZnQub3JnL2xpc3RzL3NsYW5nLXVzZXJz
LzIwMjIvMDAwMDAwNS5odG1sCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdlL3NsYW5nLzAwMDEtc2xzaC1saWJz
LnBhdGNoIHwgNiArKysrLS0KIHBhY2thZ2Uvc2xhbmcvc2xhbmcuaGFzaCAgICAgICAgICAgfCA0
ICsrLS0KIHBhY2thZ2Uvc2xhbmcvc2xhbmcubWsgICAgICAgICAgICAgfCAyICstCiAzIGZpbGVz
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3NsYW5nLzAwMDEtc2xzaC1saWJzLnBhdGNoIGIvcGFja2FnZS9zbGFuZy8wMDAxLXNs
c2gtbGlicy5wYXRjaAppbmRleCAyMTFjYjRhMGUwLi5mYWQxNmQxYjJmIDEwMDY0NAotLS0gYS9w
YWNrYWdlL3NsYW5nLzAwMDEtc2xzaC1saWJzLnBhdGNoCisrKyBiL3BhY2thZ2Uvc2xhbmcvMDAw
MS1zbHNoLWxpYnMucGF0Y2gKQEAgLTUsNiArNSw4IEBAIHByb2JhYmx5IERpZWdvIFBldHRlbsOy
LgogU2lnbmVkLW9mZi1ieTogR3VzdGF2byBaYWNhcmlhcyA8Z3VzdGF2b0B6YWNhcmlhcy5jb20u
YXI+CiBbQmVybmQ6IHJlYmFzZWQgYWdhaW5zdCAyLjMuMWFdCiBTaWduZWQtb2ZmLWJ5OiBCZXJu
ZCBLdWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+CitbRmFicmljZTogcmViYXNlZCBhZ2Fp
bnN0IDIuMy4zXQorU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFi
cmljZUBnbWFpbC5jb20+CiAKIC0tLSBhL3Nsc2gvTWFrZWZpbGUuaW4KICsrKyBiL3Nsc2gvTWFr
ZWZpbGUuaW4KQEAgLTEyLDggKzE0LDggQEAgU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJl
cm5kLmt1aGxzQHQtb25saW5lLmRlPgogICQoT0JKRElSKS9zbHNoX2V4ZTogJChPQkpESVIpL3Ns
c2gubyAkKE9CSkRJUikvcmVhZGxpbmUubwogICAgICQoQ0MpICQoQ0ZMQUdTKSAkKE9CSkRJUikv
c2xzaC5vICQoT0JKRElSKS9yZWFkbGluZS5vIC1vICQoT0JKRElSKS9zbHNoX2V4ZSAkKExERkxB
R1MpICQoRExJTktfRkxBR1MpICQoU1JDX0xJQlMpCiAgJChPQkpESVIpL3Nsc2g6ICQoT0JKRElS
KS9zbHNoLm8gJChPQkpESVIpL3JlYWRsaW5lLm8KLS0JJChDQykgJChDRkxBR1MpICQoT0JKRElS
KS9zbHNoLm8gJChPQkpESVIpL3JlYWRsaW5lLm8gLW8gJChPQkpESVIpL3Nsc2ggJChMREZMQUdT
KSAkKERMSU5LX0ZMQUdTKSAkKElOU1RfTElCUykKLSsJJChDQykgJChDRkxBR1MpICQoT0JKRElS
KS9zbHNoLm8gJChPQkpESVIpL3JlYWRsaW5lLm8gLW8gJChPQkpESVIpL3Nsc2ggJChMREZMQUdT
KSAkKERMSU5LX0ZMQUdTKSAkKFNSQ19MSUJTKQorLQkkKENDKSAkKE9CSkRJUikvc2xzaC5vICQo
T0JKRElSKS9yZWFkbGluZS5vIC1vICQoT0JKRElSKS9zbHNoICQoTERGTEFHUykgJChETElOS19G
TEFHUykgJChJTlNUX0xJQlMpCisrCSQoQ0MpICQoT0JKRElSKS9zbHNoLm8gJChPQkpESVIpL3Jl
YWRsaW5lLm8gLW8gJChPQkpESVIpL3Nsc2ggJChMREZMQUdTKSAkKERMSU5LX0ZMQUdTKSAkKFNS
Q19MSUJTKQogICQoT0JKRElSKS9zbHNoLm86ICQoT0JKRElSX1RTVEFNUCkgc2xzaC5jIHNsc2gu
aCBjb25maWcuaCBNYWtlZmlsZQogICAgIGNkICQoT0JKRElSKSAmJiAkKENDKSAkKFNMQU5HX1NS
Q0lOQykgJChDRkxBR1MpIC1jICQoREVGUykgJChTUkNESVIpL3Nsc2guYwogICQoT0JKRElSKS9y
ZWFkbGluZS5vOiAkKE9CSkRJUl9UU1RBTVApIHJlYWRsaW5lLmMgc2xzaC5oIGNvbmZpZy5oIE1h
a2VmaWxlCmRpZmYgLS1naXQgYS9wYWNrYWdlL3NsYW5nL3NsYW5nLmhhc2ggYi9wYWNrYWdlL3Ns
YW5nL3NsYW5nLmhhc2gKaW5kZXggM2UyMTFhYjU0OC4uNTYzMTE3YjQ4YSAxMDA2NDQKLS0tIGEv
cGFja2FnZS9zbGFuZy9zbGFuZy5oYXNoCisrKyBiL3BhY2thZ2Uvc2xhbmcvc2xhbmcuaGFzaApA
QCAtMSw2ICsxLDYgQEAKICMgc2hhMSBmcm9tIGh0dHA6Ly93d3cuamVkc29mdC5vcmcvcmVsZWFz
ZXMvc2xhbmcvLCBzaGEyNTYgbG9jYWxseSBjb21wdXRlZAotc2hhMSAgYmJmN2YyZGNjMTRlN2M3
ZmNhNDA4NjhmZDRiNDExYTJiZDllMjY1NSAgc2xhbmctMi4zLjIudGFyLmJ6Mgotc2hhMjU2ICBm
YzllM2IwZmM0ZjY3YzNjMWY2ZDQzYzkwYzE2YTVjNDJkMTE3YjhlMjg0NTdjNWI0NjgzMWI4YjVk
M2FlMzFhICBzbGFuZy0yLjMuMi50YXIuYnoyCitzaGExICAzOGQ5YjhlODBlNDMzNmY3NmRmZjNl
MWQ4NTc2MWQyZDBmNzEzNTk1ICBzbGFuZy0yLjMuMy50YXIuYnoyCitzaGEyNTYgIGY5MTQ1MDU0
YWUxMzE5NzNjNjEyMDhlYTgyNDg2ZDVkZDEwZTNjNWNkYWQyM2I3YzRhMDYxNzc0M2M4ZjVhMTgg
IHNsYW5nLTIuMy4zLnRhci5iejIKIAogIyBMaWNlbnNlIGZpbGUsIGxvY2FsbHkgY29tcHV0ZWQK
IHNoYTI1NiAgZmYwNWE5MDk2MmU3NzczZjhiZGM0N2IyYTk1ODUxMzA1MjYwMzkxMDI3NTliNTI0
YzFkZmZiZDU3Y2ZlNDY5YiAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9zbGFuZy9zbGFu
Zy5tayBiL3BhY2thZ2Uvc2xhbmcvc2xhbmcubWsKaW5kZXggNDRhMDE0ODA4OC4uZTBmNTk2OGI0
NiAxMDA2NDQKLS0tIGEvcGFja2FnZS9zbGFuZy9zbGFuZy5taworKysgYi9wYWNrYWdlL3NsYW5n
L3NsYW5nLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAot
U0xBTkdfVkVSU0lPTiA9IDIuMy4yCitTTEFOR19WRVJTSU9OID0gMi4zLjMKIFNMQU5HX1NPVVJD
RSA9IHNsYW5nLSQoU0xBTkdfVkVSU0lPTikudGFyLmJ6MgogU0xBTkdfU0lURSA9IGh0dHA6Ly93
d3cuamVkc29mdC5vcmcvcmVsZWFzZXMvc2xhbmcKIFNMQU5HX0xJQ0VOU0UgPSBHUEwtMi4wKwot
LSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
