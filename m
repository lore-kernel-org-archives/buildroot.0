Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBA0C38A02
	for <buildroot@archiver.kernel.org>; Sat, 29 Oct 2022 11:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B71C408B3;
	Sat, 29 Oct 2022 11:56:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B71C408B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bXsV1Is_ytRr; Sat, 29 Oct 2022 11:56:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70007408B0;
	Sat, 29 Oct 2022 11:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70007408B0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4B93C1BF3B8
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 11:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2801660675
 for <buildroot@lists.busybox.net>; Sat, 29 Oct 2022 11:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2801660675
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-T59aLriZFT for <buildroot@lists.busybox.net>;
 Sat, 29 Oct 2022 11:56:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ECA4605EE
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9ECA4605EE
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 11:56:02 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id bs21so9703059wrb.4
 for <buildroot@buildroot.org>; Sat, 29 Oct 2022 04:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yEnaNf/AMKKafGbnPpGGckYV6pU/hdhe114U1y84GDI=;
 b=L8BdQHB9LgkkpAHf2VQVrX5FCoSRzQjJrUk2ljJ1rGHqkK+HhNweQMN//fo1ePHDMc
 LjUYyqdKG8B+BK1W+BjSTzPOM7uLU8NDNhbZbHU5otNE3eUVVSvn/0eJkp3R//X0X2+B
 4bwnG16SV+4S8X/8Q37HjWm1xWVZ7luA/w9GZKjOkN1V7tooWEQzjwC8sXNNhX1CHVuT
 tcwpx6uZ+n6s4kyejy+9Dody+hXEvN5Fa6vVLwx6aIcwwnGXnaJqOoEPX7yFix+a5/el
 Q98WQhSubtwV0VBjPxeLk27m8m/FvoP0o8hpQiaCoc+N+dTZkzqHmLInfJitTSLqwk1E
 tM/A==
X-Gm-Message-State: ACrzQf3Vz4gn1K2HyYT0r6zdMH/S8DVVpvlf8N2bY5GTc7HlJkHbZRAB
 KRtf92qtk+JvjIpiJELklRKYMgQXeyM=
X-Google-Smtp-Source: AMsMyM62OxwV053gpVzMvHFAG6rHgr+ZbdILf7dJpAwivCvyEYt0Cz1SPL4EdHVQ0SJaEn48AQTWiQ==
X-Received: by 2002:a5d:66c3:0:b0:236:aa03:aa3c with SMTP id
 k3-20020a5d66c3000000b00236aa03aa3cmr2074237wrw.243.1667044560382; 
 Sat, 29 Oct 2022 04:56:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j31-20020a05600c1c1f00b003a8434530bbsm1497961wms.13.2022.10.29.04.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Oct 2022 04:55:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Oct 2022 13:55:54 +0200
Message-Id: <20221029115555.789814-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yEnaNf/AMKKafGbnPpGGckYV6pU/hdhe114U1y84GDI=;
 b=Be2NIAV/mWcgJDJtNMVr7rbvh2s1Nw2HcwhpN9iychXZaOsV7d451xVdzpJ3w8DRJc
 s68eRup7B3I06W3aLTNyJKla24TUQ6ug9NhSQbpXnzXcdM5hDwycBdQPZO6ympMLo/ZY
 z30Yj/ZRASPlGTkR92a+QSNXfk9A2yMTsUxEL6AOvwj5fQtMyqT0jIdtEpXZ5+A9K2pB
 Tc0b8QF8Wvzk8syecrmW894EWkiK9CtF42pAQUwOThyouqVTD9KsHRYQoDlJFvkOEhoP
 0KCXTL4pe3qTV+1YJCCY2g5cWieb7FhcDzSuyTA1NTvZr+I4A0pNj83kKnGIhH8GK1+G
 12iA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Be2NIAV/
Subject: [Buildroot] [PATCH 1/2] package/dahdi-linux: bump to version 3.2.0
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBVc2Ugb2ZmaWNpYWwgdGFyYmFsbAotIFRoaXMgYnVtcCB3aWxsIGZpeCB0aGUgZm9sbG93aW5n
IGJ1aWxkIGZhaWx1cmVzIHdpdGgga2VybmVsID49IDUuMTY6CgovaG9tZS9hdXRvYnVpbGQvYXV0
b2J1aWxkL2luc3RhbmNlLTYvb3V0cHV0LTEvYnVpbGQvZGFoZGktbGludXgtNWM4NDBjZjQzODM4
ZTA2OTA4NzNlNzM0MDk0OTFjMzkyMzMzYjNiOC9kcml2ZXJzL2RhaGRpL3djdDR4eHAvYmFzZS5j
OjQ1OjEwOiBmYXRhbCBlcnJvcjogc3RkYm9vbC5oOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5
CiAgIDQ1IHwgI2luY2x1ZGUgPHN0ZGJvb2wuaD4KICAgICAgfCAgICAgICAgICBefn5+fn5+fn5+
fgoKWy4uLl0KCi4uL2RhaGRpLWxpbnV4LTVjODQwY2Y0MzgzOGUwNjkwODczZTczNDA5NDkxYzM5
MjMzM2IzYjgvZHJpdmVycy9kYWhkaS94cHAveGJ1cy1jb3JlLmM6IEluIGZ1bmN0aW9uIOKAmHhi
dXNfcmVhZF9wcm9jX29wZW7igJk6Ci4uL2RhaGRpLWxpbnV4LTVjODQwY2Y0MzgzOGUwNjkwODcz
ZTczNDA5NDkxYzM5MjMzM2IzYjgvZHJpdmVycy9kYWhkaS94cHAveGJ1cy1jb3JlLmM6MTg0NTo0
MzogZXJyb3I6IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmFBERV9EQVRB4oCZ
OyBkaWQgeW91IG1lYW4g4oCYTk9ERV9EQVRB4oCZPyBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlv
bi1kZWNsYXJhdGlvbl0KIDE4NDUgfCAgcmV0dXJuIHNpbmdsZV9vcGVuKGZpbGUsIHhidXNfcHJv
Y19zaG93LCBQREVfREFUQShpbm9kZSkpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgTk9ERV9EQVRBCgpodHRwczovL2dpdGh1Yi5jb20vYXN0ZXJp
c2svZGFoZGktbGludXgvY29tcGFyZS81Yzg0MGNmNDM4MzhlMDY5MDg3M2U3MzQwOTQ5MWMzOTIz
MzNiM2I4Li4udjMuMi4wCgpGaXhlczoKIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3Jn
L3Jlc3VsdHMvM2YyMzU1OWYwMWE3NzgzZDgyYWQ0ZTBiMmQ2NzkyMTcxZTZmMmI3OQogLSBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9mM2YyMjZmYjY2MWE2YjE5OTgzODFm
NWZiN2NiMzA2NzcxYzJlY2MwCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiBwYWNrYWdlL2RhaGRpLWxpbnV4L2RhaGRpLWxp
bnV4Lmhhc2ggfCA0ICsrLS0KIHBhY2thZ2UvZGFoZGktbGludXgvZGFoZGktbGludXgubWsgICB8
IDYgKysrLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2RhaGRpLWxpbnV4L2RhaGRpLWxpbnV4Lmhhc2ggYi9w
YWNrYWdlL2RhaGRpLWxpbnV4L2RhaGRpLWxpbnV4Lmhhc2gKaW5kZXggN2E0YzY4ODA2MS4uMmQz
ZjMzNjc3NyAxMDA2NDQKLS0tIGEvcGFja2FnZS9kYWhkaS1saW51eC9kYWhkaS1saW51eC5oYXNo
CisrKyBiL3BhY2thZ2UvZGFoZGktbGludXgvZGFoZGktbGludXguaGFzaApAQCAtMSw1ICsxLDUg
QEAKLSMgTG9jYWxseSBjb21wdXRlZAotc2hhMjU2ICAzZmFmMTI3ZWUzZjFmYWQwMTk1YzU2ZDAw
YjdiZjI3MDhlYzhhNTRiZjNjMzFlZGQ4MjdmZDliZWI0N2UwYTUxICBkYWhkaS1saW51eC01Yzg0
MGNmNDM4MzhlMDY5MDg3M2U3MzQwOTQ5MWMzOTIzMzNiM2I4LWJyMS50YXIuZ3oKKyMgRnJvbSBo
dHRwOi8vZG93bmxvYWRzLmFzdGVyaXNrLm9yZy9wdWIvdGVsZXBob255L2RhaGRpLWxpbnV4L3Jl
bGVhc2VzL2RhaGRpLWxpbnV4LTMuMi4wLnNoYTI1Ngorc2hhMjU2ICBlMmVmOWIzZjY3NjlmNjBm
NDMyY2ZhMDljMzljOWEwZDdhYjViZGRmZjU5MjI5ZjM4NTA1NjkxNWM2NWY5ZjEzICBkYWhkaS1s
aW51eC0zLjIuMC50YXIuZ3oKIAogIyBGaXJtd2FyZSBmaWxlcyBoYXZlIG5vIHVwc3RyZWFtIGhh
c2gsIHNvIHNoYTU2IGxvY2FsbHkgY29tcHV0ZWQKIHNoYTI1NiAgM2ZmMjZjZjgwNTU1ZmQ3NDcw
YjQzYTg3YzUxZDAzYzFkYjJhNzVhYmNkNDU2MWQ3OWY2OWI2YzQ4Mjk4ZTRhMSAgZGFoZGktZnds
b2FkLXZwbWFkdDAzMi0xLjI1LjAudGFyLmd6CmRpZmYgLS1naXQgYS9wYWNrYWdlL2RhaGRpLWxp
bnV4L2RhaGRpLWxpbnV4Lm1rIGIvcGFja2FnZS9kYWhkaS1saW51eC9kYWhkaS1saW51eC5tawpp
bmRleCA5MzEyNGYwZTAyLi44ODUxOWI1MTA2IDEwMDY0NAotLS0gYS9wYWNrYWdlL2RhaGRpLWxp
bnV4L2RhaGRpLWxpbnV4Lm1rCisrKyBiL3BhY2thZ2UvZGFoZGktbGludXgvZGFoZGktbGludXgu
bWsKQEAgLTQsOSArNCw5IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1EQUhESV9M
SU5VWF9WRVJTSU9OID0gNWM4NDBjZjQzODM4ZTA2OTA4NzNlNzM0MDk0OTFjMzkyMzMzYjNiOAot
REFIRElfTElOVVhfU0lURSA9IGh0dHBzOi8vZ2Vycml0LmFzdGVyaXNrLm9yZy9kYWhkaS1saW51
eAotREFIRElfTElOVVhfU0lURV9NRVRIT0QgPSBnaXQKK0RBSERJX0xJTlVYX1ZFUlNJT04gPSAz
LjIuMAorREFIRElfTElOVVhfU0lURSA9IFwKKwlodHRwOi8vZG93bmxvYWRzLmFzdGVyaXNrLm9y
Zy9wdWIvdGVsZXBob255L2RhaGRpLWxpbnV4L3JlbGVhc2VzCiAKICMgV2UgbmVlZCB0byBkb3du
bG9hZCBhbGwgdGhvc2UgZmlybXdhcmUgYmxvYnMgb3Vyc2VsdmVzLCBvdGhlcndpc2UKICMgZGFo
ZGktbGludXggd2lsbCB0cnkgdG8gZG93bmxvYWQgdGhlbSBhdCBpbnN0YWxsIHRpbWUuCi0tIAoy
LjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0
cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
