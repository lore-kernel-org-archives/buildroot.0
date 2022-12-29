Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6561C4332F
	for <buildroot@archiver.kernel.org>; Thu, 29 Dec 2022 16:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0CF0760ADD;
	Thu, 29 Dec 2022 16:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CF0760ADD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CmF_lMydXy9j; Thu, 29 Dec 2022 16:43:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50C8560A81;
	Thu, 29 Dec 2022 16:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50C8560A81
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7E69B1BF39A
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 16:43:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A19D405B5
 for <buildroot@lists.busybox.net>; Thu, 29 Dec 2022 16:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A19D405B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c-F7BkKVKzfD for <buildroot@lists.busybox.net>;
 Thu, 29 Dec 2022 16:43:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 47A4840185
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 47A4840185
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 16:43:20 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id bx10so17887573wrb.0
 for <buildroot@buildroot.org>; Thu, 29 Dec 2022 08:43:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IrxvqODLrocOEkKsbCjuw+aJVwRXkvmcOS04Sjk2qOg=;
 b=MSEI738IblgZE1hb2Mie/ro33SbuMcv2RBJ4H3fIPNwmGFULmra956JxxK4zH7IFmM
 CxSJZWfoT5mxdVSroePvqLmfTyXL7Fr/K26tucdke1bCBKxSgRIq73uAcWG3OaUjXJDM
 XhGsUraMjO1JfOwkAeL9kv4e/Tc4cYg8mqvr15L83Ui+GeQLIeCvlAQHXazxWk2Xs/+d
 w2RSLFff/UIj+fb48Nkk/JTjKO02O5SO7/OWf7YR5knVtdyCi0lF84AH8lZ5n3kovJoO
 VBgKCBOVkhyrozNcM0PS+YWJDs8oj/Ev4DA/byjEYKvc768ESnApmvfi6KYeX0wGH9zx
 aASQ==
X-Gm-Message-State: AFqh2kpzw9p4fIfmOHwhZ7JoBALHzDwj4/NNYttMXjjKmKJ3kug4TayF
 0gpPneVw7BBrplQzpWeR9SMbBC+nHBM=
X-Google-Smtp-Source: AMrXdXusjWI6yKuW8/jJp7f8vJ1hEQrI+qoimiZp4JmH0dpf3UHFyggrhUaZL/xVaMJcM2brQy6R7A==
X-Received: by 2002:a05:6000:10d1:b0:242:4835:8e69 with SMTP id
 b17-20020a05600010d100b0024248358e69mr16922817wrx.46.1672332198176; 
 Thu, 29 Dec 2022 08:43:18 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 l7-20020adfc787000000b002238ea5750csm22479319wrg.72.2022.12.29.08.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 08:43:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 29 Dec 2022 17:43:15 +0100
Message-Id: <20221229164315.424657-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IrxvqODLrocOEkKsbCjuw+aJVwRXkvmcOS04Sjk2qOg=;
 b=dbfTeb4a8TrinQwt5T7QzNEzUZuhtC6KjzquiytntAQibNxiM/N7qtLvN0Bx5a1Dvd
 CnCGOJHbg3Jp7ReKo1M9I0gnG/KqoX56P0Pvpk8g4lPpcsN5fwIii2ERBQwY2/gnTuJX
 rHR0Nb3c1pLt2R4v7lxoWU/u9G3nItEhHB2ZHyFWQ5EYzZV5YhjZteXfCwo4D1//oE7h
 QttpS4H8RFkpqR+cCticfxYa/3781POHfMpolJ9DSXsAaerlokylSJpYMzeCcEEfl5EI
 AV7Xlh6cCq1BQZUlVH6BIOR+NZ4ignh9a/A4PKxiSc4WTKUlyAwn3t38u0eTFe0/NjMs
 +a2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dbfTeb4a
Subject: [Buildroot] [PATCH 1/1] package/dahdi-linux: fix build with kernel
 >= 6.1
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

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGtlcm5lbCA+PSA2LjEKCkluIGZp
bGUgaW5jbHVkZWQgZnJvbSAuL2luY2x1ZGUvbGludXgvc3RyaW5nLmg6MjAsCiAgICAgICAgICAg
ICAgICAgZnJvbSAuL2luY2x1ZGUvbGludXgvYml0bWFwLmg6MTEsCiAgICAgICAgICAgICAgICAg
ZnJvbSAuL2luY2x1ZGUvbGludXgvY3B1bWFzay5oOjEyLAogICAgICAgICAgICAgICAgIGZyb20g
Li9pbmNsdWRlL2xpbnV4L21tX3R5cGVzX3Rhc2suaDoxNCwKICAgICAgICAgICAgICAgICBmcm9t
IC4vaW5jbHVkZS9saW51eC9tbV90eXBlcy5oOjUsCiAgICAgICAgICAgICAgICAgZnJvbSAuL2lu
Y2x1ZGUvbGludXgvYnVpbGRpZC5oOjUsCiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUv
bGludXgvbW9kdWxlLmg6MTQsCiAgICAgICAgICAgICAgICAgZnJvbSAvaG9tZS9hdXRvYnVpbGQv
YXV0b2J1aWxkL2luc3RhbmNlLTExL291dHB1dC0xL2J1aWxkL2RhaGRpLWxpbnV4LTMuMi4wL2Ry
aXZlcnMvZGFoZGkvd2N0YzR4eHAvYmFzZS5jOjI0OgouL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2Fz
bS9zdHJpbmcuaDoyNzoyMjogbm90ZTogZXhwZWN0ZWQg4oCYdm9pZCAq4oCZIGJ1dCBhcmd1bWVu
dCBpcyBvZiB0eXBlIOKAmGNvbnN0IHVuc2lnbmVkIGNoYXIgKuKAmQogICAyNyB8IGV4dGVybiB2
b2lkICogbWVtY3B5KHZvaWQgKixjb25zdCB2b2lkICosX19rZXJuZWxfc2l6ZV90KTsKICAgICAg
fCAgICAgICAgICAgICAgICAgICAgICBefn5+fn4KL2hvbWUvYXV0b2J1aWxkL2F1dG9idWlsZC9p
bnN0YW5jZS0xMS9vdXRwdXQtMS9idWlsZC9kYWhkaS1saW51eC0zLjIuMC9kcml2ZXJzL2RhaGRp
L3djdGM0eHhwL2Jhc2UuYzo2NjE6OTogZXJyb3I6IHRvbyBtYW55IGFyZ3VtZW50cyB0byBmdW5j
dGlvbiDigJhuZXRpZl9uYXBpX2FkZOKAmQogIDY2MSB8ICAgICAgICAgbmV0aWZfbmFwaV9hZGQo
bmV0ZGV2LCAmd2MtPm5hcGksICZ3Y3RjNHh4cF9wb2xsLCA2NCk7CiAgICAgIHwgICAgICAgICBe
fn5+fn5+fn5+fn5+fgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL25ldC9pbmV0X3Nv
Y2suaDoxOSwKICAgICAgICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC91ZHAuaDoxNiwK
ICAgICAgICAgICAgICAgICBmcm9tIC9ob21lL2F1dG9idWlsZC9hdXRvYnVpbGQvaW5zdGFuY2Ut
MTEvb3V0cHV0LTEvYnVpbGQvZGFoZGktbGludXgtMy4yLjAvZHJpdmVycy9kYWhkaS93Y3RjNHh4
cC9iYXNlLmM6Mzg6Ci4vaW5jbHVkZS9saW51eC9uZXRkZXZpY2UuaDoyNTYyOjE6IG5vdGU6IGRl
Y2xhcmVkIGhlcmUKIDI1NjIgfCBuZXRpZl9uYXBpX2FkZChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2
LCBzdHJ1Y3QgbmFwaV9zdHJ1Y3QgKm5hcGksCiAgICAgIHwgXn5+fn5+fn5+fn5+fn4KCkZpeGVz
OgogLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9kN2NlMTAzYTg4NjMy
OWM2OGMwNGViZTA1NTcxYmU4Zjk1YTg3M2NlCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRh
aW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiAuLi4vMDAwNC1uZXh0LWZpeC1r
ZXJuZWwtNi0xLWJ1aWxkLnBhdGNoICAgICAgfCAzMiArKysrKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
ZGFoZGktbGludXgvMDAwNC1uZXh0LWZpeC1rZXJuZWwtNi0xLWJ1aWxkLnBhdGNoCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9kYWhkaS1saW51eC8wMDA0LW5leHQtZml4LWtlcm5lbC02LTEtYnVpbGQu
cGF0Y2ggYi9wYWNrYWdlL2RhaGRpLWxpbnV4LzAwMDQtbmV4dC1maXgta2VybmVsLTYtMS1idWls
ZC5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5iOTEwYzRiNzc1
Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9kYWhkaS1saW51eC8wMDA0LW5leHQtZml4LWtl
cm5lbC02LTEtYnVpbGQucGF0Y2gKQEAgLTAsMCArMSwzMiBAQAorRnJvbSBhNzU5YTU3ODI3N2Jk
ZTk4ZWJhN2VmNGJmODZiZGY4MTlhOTAwZGU5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bTogSm9obiBUaG9tc29uIDxnaXRAam9obnRob21zb24uZmFzdG1haWwuY29tLmF1PgorRGF0ZTog
U3VuLCAyMyBPY3QgMjAyMiAxMzo0Mjo1MiArMTAwMAorU3ViamVjdDogW1BBVENIXSBmaXgga2Vy
bmVsIDYuMSBidWlsZAorCitrZXJuZWwgNi4xIGluY2x1ZGVzIGI0OGI4OWY5YzE4OSAoIm5ldDog
ZHJvcCB0aGUgd2VpZ2h0IGFyZ3VtZW50IGZyb20gbmV0aWZfbmFwaV9hZGQiKSBbMF0KKworWzBd
OiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxk
cy9saW51eC5naXQvY29tbWl0Lz9pZD1iNDhiODlmOWMxODlkMjRlYjVlMmI0YTBhYzA2N2RhNWEy
NGVlODZkCisKK1NpZ25lZC1vZmYtYnk6IEpvaG4gVGhvbXNvbiA8Z2l0QGpvaG50aG9tc29uLmZh
c3RtYWlsLmNvbS5hdT4KK1tSZXRyaWV2ZWQgZnJvbToKK2h0dHBzOi8vZ2l0aHViLmNvbS9hc3Rl
cmlzay9kYWhkaS1saW51eC9wdWxsLzE0L2NvbW1pdHMvYTc1OWE1NzgyNzdiZGU5OGViYTdlZjRi
Zjg2YmRmODE5YTkwMGRlOV0KK1NpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRh
aW5lLmZhYnJpY2VAZ21haWwuY29tPgorLS0tCisgaW5jbHVkZS9kYWhkaS9rZXJuZWwuaCB8IDQg
KysrKworIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKKworZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZGFoZGkva2VybmVsLmggYi9pbmNsdWRlL2RhaGRpL2tlcm5lbC5oCitpbmRleCAzNWU5
M2JjNC4uZmQ2NGExNWUgMTAwNjQ0CistLS0gYS9pbmNsdWRlL2RhaGRpL2tlcm5lbC5oCisrKysg
Yi9pbmNsdWRlL2RhaGRpL2tlcm5lbC5oCitAQCAtNTgsNiArNTgsMTAgQEAKKyAKKyAjaW5jbHVk
ZSA8bGludXgvcG9sbC5oPgorIAorKyNpZiBMSU5VWF9WRVJTSU9OX0NPREUgPj0gS0VSTkVMX1ZF
UlNJT04oNiwgMSwgMCkKKysjZGVmaW5lIG5ldGlmX25hcGlfYWRkIG5ldGlmX25hcGlfYWRkX3dl
aWdodAorKyNlbmRpZgorKworICNpZiBMSU5VWF9WRVJTSU9OX0NPREUgPj0gS0VSTkVMX1ZFUlNJ
T04oNSwgMTgsIDApCisgI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgorICNpbmNsdWRlIDxsaW51eC9k
bWEtbWFwcGluZy5oPgotLSAKMi4zNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
