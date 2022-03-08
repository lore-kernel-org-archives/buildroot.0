Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E50EC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 18:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3140440522;
	Tue,  8 Mar 2022 18:29:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bU7wO9Rq1ywc; Tue,  8 Mar 2022 18:29:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 01FBE40338;
	Tue,  8 Mar 2022 18:29:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1451BF290
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 18:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F22A5410C0
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 18:29:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tcmBUTrlyL6P for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 18:29:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE9E440022
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 18:29:35 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so60994wms.4
 for <buildroot@buildroot.org>; Tue, 08 Mar 2022 10:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R29e40a9HXBGAxjFoKbo/Dn5bJ2BvXNxvMtGRgGGCt4=;
 b=qMuDpyjWDvJL6YWVgYmtiqvjSDr/WtK7VQL3jpbFBFo7DwYF4A2EIkxDVZ36puBg+7
 h/l+tfweuiIuCfHJK0CSqrHjLUw5GXsd0mfgx4XWoc+AtrgtEqt+yg7P+HpFBCiE5FYQ
 mvIKKw5Aw7yk6EyKh+BXsMW2P+tJiA4fzNQQBNK0vSU5Vtmo/Q3L/tyIQk3gl5PPfWnR
 UbwDEXggbhaIHNnbCtesjGNNV6MpJE02sHvJXHM3RgmlsKaDMhlUb9mssDlEXzrfd8PG
 RQXxV1LYh+PGXYeDBWeMvcZmPFFnQO7niFuGU9n2Tg+qALCIfnaHIJqOu1NW4teH358Q
 Je/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R29e40a9HXBGAxjFoKbo/Dn5bJ2BvXNxvMtGRgGGCt4=;
 b=MTGACSyKByHtMBumsiq0hz12EaDM9Ua5QT+aZ0E9j/Qu8ly5b8FERogNv6flA5fVzf
 +EzI5qw1aBzUpnGdeJmXX7dxrBnBar662FYnBkYZALtFlQHLb+iPUo47ziH/Fo5sHLOv
 Trc3JfhhSpulfV39/izRsjq27u8DbpZ3eAKUxidJUES3K+Aea3rraBSQhp6aMye22Rh1
 wgGMPGzE14lAuFjUGpq+NRSvb8e/W5pW4NznPFd3rtfmIjGCk06Ft4OSgKHotTyhJlQ4
 VYkpTsGUKQT1fqhPh8U2BGIBvHMVocCCZ5z/gH7urjPM+Qq7jzR4fhb5LshKFevx3t/+
 kjDA==
X-Gm-Message-State: AOAM5301diiAIdUAOsWBJ2RsH88pSa+II5oWwssZw+IzbSuD+nNR//uO
 s0g91UCSQby5Te6rEL3SV3TGa53RmEQ=
X-Google-Smtp-Source: ABdhPJwkhrCbatCxYzmVB0s6bfx/oRYQnfsSXP38KotP1jv8n4EOz3QtWTUGwyrloH+6/AWreEYpmA==
X-Received: by 2002:a1c:f616:0:b0:37d:1e1c:f90a with SMTP id
 w22-20020a1cf616000000b0037d1e1cf90amr4511410wmc.148.1646764173970; 
 Tue, 08 Mar 2022 10:29:33 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 z2-20020a056000110200b001e7140ddb44sm14455089wrw.49.2022.03.08.10.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 10:29:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  8 Mar 2022 19:28:45 +0100
Message-Id: <20220308182845.1832681-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/libaacs: bump to version 0.11.1
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RHJvcCBwYXRjaCAobm90IG5lZWRlZCBzaW5jZQpodHRwczovL2NvZGUudmlkZW9sYW4ub3JnL3Zp
ZGVvbGFuL2xpYmFhY3MvLS9jb21taXQvYTJlZjMzMTNiYWU0NTUwZjU0YmE4NDJmYTM0MmQ1Yjli
NWY5NzE0NSkKCmh0dHBzOi8vY29kZS52aWRlb2xhbi5vcmcvdmlkZW9sYW4vbGliYWFjcy8tL2Js
b2IvMC4xMS4xL0NoYW5nZUxvZwoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9u
dGFpbmUuZmFicmljZUBnbWFpbC5jb20+Ci0tLQogLi4uMDAwMS1yZWFkX2ZpbGUuaC1pbmNsdWRl
LXN5cy10eXBlcy5oLnBhdGNoIHwgMzYgLS0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS9saWJh
YWNzL2xpYmFhY3MuaGFzaCAgICAgICAgICAgICAgICAgIHwgIDQgKy0tCiBwYWNrYWdlL2xpYmFh
Y3MvbGliYWFjcy5tayAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogMyBmaWxlcyBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2UvbGliYWFjcy8wMDAxLXJlYWRfZmlsZS5oLWluY2x1ZGUtc3lzLXR5cGVzLmgucGF0Y2gK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmFhY3MvMDAwMS1yZWFkX2ZpbGUuaC1pbmNsdWRlLXN5
cy10eXBlcy5oLnBhdGNoIGIvcGFja2FnZS9saWJhYWNzLzAwMDEtcmVhZF9maWxlLmgtaW5jbHVk
ZS1zeXMtdHlwZXMuaC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggOWJiMWUw
NDUzOS4uMDAwMDAwMDAwMAotLS0gYS9wYWNrYWdlL2xpYmFhY3MvMDAwMS1yZWFkX2ZpbGUuaC1p
bmNsdWRlLXN5cy10eXBlcy5oLnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzYgKzAsMCBAQAot
RnJvbSAxZmIwOGEzNTJhZmFkYTU4OWYwYjkzYWY3YTA3YzZmY2Q2ZGE5YmI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQotRnJvbTogQmVybmQgS3VobHMgPGJlcm5kLmt1aGxzQHQtb25saW5lLmRl
PgotRGF0ZTogTW9uLCAyMSBTZXAgMjAyMCAyMDoxOTozOCArMDIwMAotU3ViamVjdDogW1BBVENI
XSByZWFkX2ZpbGUuaDogaW5jbHVkZSBzeXMvdHlwZXMuaAotTUlNRS1WZXJzaW9uOiAxLjAKLUNv
bnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAotQ29udGVudC1UcmFuc2Zlci1F
bmNvZGluZzogOGJpdAotCi1GaXhlcyBidWlsZCBlcnJvciB3aXRoIHVDbGliYyBhbmQgZ2NjLTgu
My4wOgotCi1JbiBmaWxlIGluY2x1ZGVkIGZyb20gc3JjL2RldnRvb2xzL3VrX2R1bXAuYzoyODoK
LXNyYy9kZXZ0b29scy9yZWFkX2ZpbGUuaDoyNDo0NDogZXJyb3I6IHVua25vd24gdHlwZSBuYW1l
IOKAmG9mZl904oCZCi0gc3RhdGljIHNpemVfdCBfcmVhZF9maWxlKGNvbnN0IGNoYXIgKm5hbWUs
IG9mZl90IG1pbl9zaXplLCBvZmZfdCBtYXhfc2l6ZSwgdWludDhfdCAqKnBkYXRhKQotCi1VcHN0
cmVhbSBzdGF0dXM6IHBlbmRpbmcKLQotU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5k
Lmt1aGxzQHQtb25saW5lLmRlPgotLS0tCi0gc3JjL2RldnRvb2xzL3JlYWRfZmlsZS5oIHwgMSAr
Ci0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCi0KLWRpZmYgLS1naXQgYS9zcmMvZGV2
dG9vbHMvcmVhZF9maWxlLmggYi9zcmMvZGV2dG9vbHMvcmVhZF9maWxlLmgKLWluZGV4IDk1M2Iy
ZWYuLmE1ZDE4NWMgMTAwNjQ0Ci0tLS0gYS9zcmMvZGV2dG9vbHMvcmVhZF9maWxlLmgKLSsrKyBi
L3NyYy9kZXZ0b29scy9yZWFkX2ZpbGUuaAotQEAgLTE5LDYgKzE5LDcgQEAKLSAKLSAjaW5jbHVk
ZSA8c3RkaW8uaD4KLSAjaW5jbHVkZSA8c3RkbGliLmg+Ci0rI2luY2x1ZGUgPHN5cy90eXBlcy5o
PgotICNpbmNsdWRlIDxlcnJuby5oPgotIAotIHN0YXRpYyBzaXplX3QgX3JlYWRfZmlsZShjb25z
dCBjaGFyICpuYW1lLCBvZmZfdCBtaW5fc2l6ZSwgb2ZmX3QgbWF4X3NpemUsIHVpbnQ4X3QgKipw
ZGF0YSkKLS0tIAotMi4yNy4wCi0KZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGliYWFjcy9saWJhYWNz
Lmhhc2ggYi9wYWNrYWdlL2xpYmFhY3MvbGliYWFjcy5oYXNoCmluZGV4IDYyZTM4OWYyZjkuLmQ0
OTc3NzI3YjAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGliYWFjcy9saWJhYWNzLmhhc2gKKysrIGIv
cGFja2FnZS9saWJhYWNzL2xpYmFhY3MuaGFzaApAQCAtMSw1ICsxLDUgQEAKLSMgRnJvbSBodHRw
Oi8vZG93bmxvYWQudmlkZW9sYW4ub3JnL3B1Yi92aWRlb2xhbi9saWJhYWNzLzAuMTEuMC9saWJh
YWNzLTAuMTEuMC50YXIuYnoyLnNoYTUxMgotc2hhNTEyICAxNjdlZGJiNmYyNjU5OWU0MWQ2MDg0
OTA4MDM5YmY5MDJmNjlmNTdkYTFmNjRmMTQ5MTczNDE1N2QxNTY4YWQwYjMyYzhlYTMwNjRlMDcw
NmUzODNhZjhkYzYwMDdlZWY2NTE3MGIyYjQ3MjIyYmYzZDM2M2UzOTVlMGI2MDM4OCAgbGliYWFj
cy0wLjExLjAudGFyLmJ6MgorIyBGcm9tIGh0dHA6Ly9kb3dubG9hZC52aWRlb2xhbi5vcmcvcHVi
L3ZpZGVvbGFuL2xpYmFhY3MvMC4xMS4xL2xpYmFhY3MtMC4xMS4xLnRhci5iejIuc2hhNTEyCitz
aGE1MTIgIDQyZGNiYTVmZDU5M2M5YThlYzdhZjExMjUxMDA2YjA4M2FkMmM0OWVjMTk4NzM0ZDFk
NjZmNjdjMmRlZDQ1NTdkNzc2MTc2MDBlZGJmMGM1MjUwZTliMDQwN2VmOWEyZjkwNmQ1OWQxNTRi
ZGE4ZWNmYzhhZGZkMjM0ZmIyYzQyICBsaWJhYWNzLTAuMTEuMS50YXIuYnoyCiAKICMgSGFzaCBm
b3IgbGljZW5zZSBmaWxlOgogc2hhMjU2ICA1OTI5ODdlODUxMDIyOGQ1NDY1NDBiODRhMjI0NDRi
ZGU5OGU0OGQwMzA3OGQzYjJlZWZjZDg4OWJlYzVjZThjICBDT1BZSU5HCmRpZmYgLS1naXQgYS9w
YWNrYWdlL2xpYmFhY3MvbGliYWFjcy5tayBiL3BhY2thZ2UvbGliYWFjcy9saWJhYWNzLm1rCmlu
ZGV4IDNlMGRmMTgwMTAuLmQ0ZTkwYmUyNmMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGliYWFjcy9s
aWJhYWNzLm1rCisrKyBiL3BhY2thZ2UvbGliYWFjcy9saWJhYWNzLm1rCkBAIC00LDcgKzQsNyBA
QAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTElCQUFDU19WRVJTSU9OID0gMC4xMS4w
CitMSUJBQUNTX1ZFUlNJT04gPSAwLjExLjEKIExJQkFBQ1NfU0lURSA9IGh0dHA6Ly9kb3dubG9h
ZC52aWRlb2xhbi5vcmcvcHViL3ZpZGVvbGFuL2xpYmFhY3MvJChMSUJBQUNTX1ZFUlNJT04pCiBM
SUJBQUNTX1NPVVJDRSA9IGxpYmFhY3MtJChMSUJBQUNTX1ZFUlNJT04pLnRhci5iejIKIExJQkFB
Q1NfTElDRU5TRSA9IExHUEwtMi4xKwotLSAKMi4zNC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2J1aWxkcm9vdAo=
