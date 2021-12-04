Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E283C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 08:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E47F840146;
	Sat,  4 Dec 2021 08:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aw2QQR0tSJs2; Sat,  4 Dec 2021 08:43:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E194640275;
	Sat,  4 Dec 2021 08:43:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3AA1BF5E9
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 08:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23F5C607FC
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 08:43:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I2h3GZZUJgpe for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 08:43:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 026716079B
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 08:43:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u17so3524928wrt.3
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 00:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhvlZaUX7/8qeL8onsTFGiJ2kW6TxYjVO7Z5LOI/dCw=;
 b=l3+j63yOriq1qEEedOz7N5AvaeyY0mlJtRMNroB7sZ99b1x5fkvcOHOyo8VePoc4t1
 jnMfpEmgbOmbIzQMC6Wo0iCMGFuJZ8LgCe6iHwJ/EVaW6/3zT/ffflAkYBCApGwRjUOp
 faKOrwN69/SfSCm+sV9AGLDWJnKPOzEq2TWTfwxjldQSguNSF9Xz7z70efvelHRb+uqi
 pqCpLqDCbeCwYo1WyUMkfna5REfH1tZZwQJD3f+Rjvv7ocgSETQ1440f4m09QQzFci0J
 J0GbOghmpEzstfo/pZYqEGhPCODegEoqFO4OOllE+o3mC4kqDRplDwtRhJz/Yqgqy/DT
 R9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rhvlZaUX7/8qeL8onsTFGiJ2kW6TxYjVO7Z5LOI/dCw=;
 b=a8hYreEjSxQRceq0EIeRMiNqpo5lidQUFFTn1FRHwr7/byRInUWMW+IQFhzL9k2Aqj
 Cg4D7mloeqUOIaGW3rfnrGCJBPCNHrqGj4aNLi8j24TQQ7MrHYNGWQnoUHVkmh1jN/gJ
 QT4EFyXFec9PDGJbALhCnBnk0hRD29r6NNvMOslzIjx9XD4wonZ12X1g1x8zg8TpBp/t
 e6bn3EULZG4TwpwtQWQtmA6UWoARTQzAACEi7HKOwFV26n3J36kFSh7I4DbkWc2DDX2K
 Q3uqdYcpwkxx+h+1UXo4KMhOpkQsqWLNq6a3bYCsI6bJUZEIi5riTgXmr8dPjjqzGad3
 HpYw==
X-Gm-Message-State: AOAM5323s7S1GBfJ7brmZ7lEtfBFOHJFlS9+rn580zP5BRQ49eYvQmu1
 5E/i7wZUd5o282bgZbPE4FrxPoQmezR1UQ==
X-Google-Smtp-Source: ABdhPJxPwZ/ZEcpQ7JR4WiTzc2encDbtiTAGwJtNnHi3rRzZPpJ+COoTK6DdAyyHefojXGMJlkXdmw==
X-Received: by 2002:adf:f206:: with SMTP id p6mr27725614wro.509.1638607382547; 
 Sat, 04 Dec 2021 00:43:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id t4sm7217628wmi.48.2021.12.04.00.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 00:43:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 09:43:11 +0100
Message-Id: <20211204084311.2014763-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qemu: fix uclibc-ng and musl build
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSBvbiB1Y2xpYmMtbmcgYW5kIG11c2wgcmFp
c2VkIHNpbmNlIGJ1bXAKdG8gdmVyc2lvbiA2LjEuMCBpbiBjb21taXQgMzNjNjljMDJmYjRjMTE3
NjU4NGQxZTJkZDMzNmI3NGVkMzlmNWQ2NToKCi4uL2Jsb2NrL2V4cG9ydC9mdXNlLmM6IEluIGZ1
bmN0aW9uICdmdXNlX2ZhbGxvY2F0ZSc6Ci4uL2Jsb2NrL2V4cG9ydC9mdXNlLmM6NjQzOjIxOiBl
cnJvcjogJ0ZBTExPQ19GTF9aRVJPX1JBTkdFJyB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhp
cyBmdW5jdGlvbikKICA2NDMgfCAgICAgZWxzZSBpZiAobW9kZSAmIEZBTExPQ19GTF9aRVJPX1JB
TkdFKSB7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fgoK
Rml4ZXM6CiAtIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzLzZkMTAyZjAw
NWNmYWViYTU4MmE3OGExMTQ2MGJmMzgwMTRmNTZiZjkKIC0gaHR0cDovL2F1dG9idWlsZC5idWls
ZHJvb3Qub3JnL3Jlc3VsdHMvYmUyNDQzM2E0MjlmZGE2ODFmYjY2Njk4MTYwMTMyYzFjOTliYzUz
YgoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFp
bC5jb20+Ci0tLQogLi4uNC1ibG9jay1leHBvcnQtZnVzZS5jLWZpeC1tdXNsLWJ1aWxkLnBhdGNo
IHwgNDkgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMo
KykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3FlbXUvMDAwNC1ibG9jay1leHBvcnQtZnVz
ZS5jLWZpeC1tdXNsLWJ1aWxkLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9xZW11LzAwMDQt
YmxvY2stZXhwb3J0LWZ1c2UuYy1maXgtbXVzbC1idWlsZC5wYXRjaCBiL3BhY2thZ2UvcWVtdS8w
MDA0LWJsb2NrLWV4cG9ydC1mdXNlLmMtZml4LW11c2wtYnVpbGQucGF0Y2gKbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uNDg1NjgyMTg0MwotLS0gL2Rldi9udWxsCisrKyBi
L3BhY2thZ2UvcWVtdS8wMDA0LWJsb2NrLWV4cG9ydC1mdXNlLmMtZml4LW11c2wtYnVpbGQucGF0
Y2gKQEAgLTAsMCArMSw0OSBAQAorRnJvbSAzMDQzMzIwMzkwMTQ2NzliODA5ZjYwNmUyZjIyN2Vl
MGZjNDNhNDUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogRmFicmljZSBGb250YWlu
ZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CitEYXRlOiBGcmksIDIyIE9jdCAyMDIxIDEx
OjUyOjA5ICswMjAwCitTdWJqZWN0OiBbUEFUQ0hdIGJsb2NrL2V4cG9ydC9mdXNlLmM6IGZpeCBt
dXNsIGJ1aWxkCitNSU1FLVZlcnNpb246IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBj
aGFyc2V0PVVURi04CitDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK0luY2x1ZGUg
bGludXgvZmFsbG9jLmggaWYgQ09ORklHX0ZBTExPQ0FURV9aRVJPX1JBTkdFIGlzIGRlZmluZWQg
dG8gZml4CitodHRwczovL2dpdGxhYi5jb20vcWVtdS1wcm9qZWN0L3FlbXUvLS9jb21taXQvNTA0
ODJmZGE5OGJkNjJlMDcyYzMwYjdlYTczYzk4NWM0ZTlkOWJiYgorYW5kIGF2b2lkIHRoZSBmb2xs
b3dpbmcgYnVpbGQgZmFpbHVyZSBvbiBtdXNsOgorCisuLi9ibG9jay9leHBvcnQvZnVzZS5jOiBJ
biBmdW5jdGlvbiAnZnVzZV9mYWxsb2NhdGUnOgorLi4vYmxvY2svZXhwb3J0L2Z1c2UuYzo2NDM6
MjE6IGVycm9yOiAnRkFMTE9DX0ZMX1pFUk9fUkFOR0UnIHVuZGVjbGFyZWQgKGZpcnN0IHVzZSBp
biB0aGlzIGZ1bmN0aW9uKQorICA2NDMgfCAgICAgZWxzZSBpZiAobW9kZSAmIEZBTExPQ19GTF9a
RVJPX1JBTkdFKSB7CisgICAgICB8ICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+
fn5+fn4KKworRml4ZXM6CisgLSBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0
cy9iZTI0NDMzYTQyOWZkYTY4MWZiNjY2OTgxNjAxMzJjMWM5OWJjNTNiCisKK0ZpeGVzOiA1MDQ4
MmZkYTk4YiAoImJsb2NrL2V4cG9ydC9mdXNlLmM6IGZpeCBtdXNsIGJ1aWxkIikKK1NpZ25lZC1v
ZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgorTWVz
c2FnZS1JZDogPDIwMjExMDIyMDk1MjA5LjEzMTk2NzEtMS1mb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4KK1Jldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQHJlZGhh
dC5jb20+CitTaWduZWQtb2ZmLWJ5OiBLZXZpbiBXb2xmIDxrd29sZkByZWRoYXQuY29tPgorW1Jl
dHJpZXZlZCBmcm9tOgoraHR0cHM6Ly9naXRsYWIuY29tL3FlbXUtcHJvamVjdC9xZW11Ly0vY29t
bWl0LzMwNDMzMjAzOTAxNDY3OWI4MDlmNjA2ZTJmMjI3ZWUwZmM0M2E0NTFdCistLS0KKyBibG9j
ay9leHBvcnQvZnVzZS5jIHwgNCArKysrCisgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KQorCitkaWZmIC0tZ2l0IGEvYmxvY2svZXhwb3J0L2Z1c2UuYyBiL2Jsb2NrL2V4cG9ydC9mdXNl
LmMKK2luZGV4IDJlM2JmODI3MGIuLjgyM2MxMjZkMjMgMTAwNjQ0CistLS0gYS9ibG9jay9leHBv
cnQvZnVzZS5jCisrKysgYi9ibG9jay9leHBvcnQvZnVzZS5jCitAQCAtMzEsNiArMzEsMTAgQEAK
KyAjaW5jbHVkZSA8ZnVzZS5oPgorICNpbmNsdWRlIDxmdXNlX2xvd2xldmVsLmg+CisgCisrI2lm
IGRlZmluZWQoQ09ORklHX0ZBTExPQ0FURV9aRVJPX1JBTkdFKQorKyNpbmNsdWRlIDxsaW51eC9m
YWxsb2MuaD4KKysjZW5kaWYKKysKKyAjaWZkZWYgX19saW51eF9fCisgI2luY2x1ZGUgPGxpbnV4
L2ZzLmg+CisgI2VuZGlmCistLSAKK0dpdExhYgorCi0tIAoyLjMzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
