Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD97DC433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 13:57:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82E1940203;
	Thu, 30 Dec 2021 13:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Jl1lXBZ_FKF; Thu, 30 Dec 2021 13:57:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC653414E6;
	Thu, 30 Dec 2021 13:57:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 505D91BF408
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 13:56:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FD4B80BD1
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 13:56:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qfUAGqbVum7n for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 13:56:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D92380C02
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 13:56:44 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id e5so50591754wrc.5
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 05:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OBz07dqVbMtHtLOuxS/XsoePeOqRa3qQtYIWpGRaEeo=;
 b=UDzw/jq0Wbfhya+DfL2bkSJD1rXWj/vxMzulkyZ6qZNRGZGyYh04gMVbLNUsex6/T+
 +uKEhsfi/v6+maUxIPxIZH5K8ssegKaxWR78c8wfL3rdXOLsmBTyeh3v4eF1KOnvp7l3
 XdIf8XZ7xrofZd/yy3+6jYzvg9gEzuFgSgypEdgG6wWYj8SJhr41qVQb17pAndsQ5QNq
 taFeOKUY5iL9g8dMntV4i/GgGN1zit0GcYqrsEL/4+PJbgLghgbm4qr/En87h+/nG+dO
 5huDoDZoiW9+mrWNJlyY82OVMEwpzam6f4nWUdIX79Ce8YoQ7nFwJrTXCr7oVOnsjmR2
 UYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OBz07dqVbMtHtLOuxS/XsoePeOqRa3qQtYIWpGRaEeo=;
 b=67f/tQVlLhD8l8Fmoh5fuDmur/oVdbjCkmBrcwvkdJzSoG4WUkvkZ1Jgn/5CAzY+Lj
 jCkRXtvqI9+ZHdZm9ioeeFw2/57Ee1bZ8IEAx4I4b0awDQSI6RZej+BfCACQ55s/UuBF
 jieVuHlE3/Z2rqqvGYA4HO3R8cICXISXlAweymZPo2hXeiA17F6Zjq7THijNbakEm5KH
 Mb8E8m2No3itJFoHTc0keWId7WAc7EbWNTKtadnPWSIBIgX0Il70N3Pcq4x4Okh1CF1O
 pclXO9DbqDCAb3cM16KJp03ksklSzST+9wkAwltEvjkNSea8/QWMTK/ZGGr+KghtFMuf
 vWng==
X-Gm-Message-State: AOAM533Mnb2w7AAVpRGiPsqSQFdeFVA9ONGGck2/VaD25IN7Kcq5BapC
 wjE0fUgf5EjS+ZWleOfgsSDzEb6oPO0=
X-Google-Smtp-Source: ABdhPJwYgJP7I4sxt2m0cIjyitnzcYzYz1EgDGaUC1uwgubQ4xn+YBQgsnDfJ4JCAuktZffx/j45EA==
X-Received: by 2002:a05:6000:1817:: with SMTP id
 m23mr24780232wrh.684.1640872602788; 
 Thu, 30 Dec 2021 05:56:42 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l7sm24353765wms.1.2021.12.30.05.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 05:56:42 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 14:56:21 +0100
Message-Id: <20211230135621.2255847-7-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211230135621.2255847-1-romain.naour@gmail.com>
References: <20211230135621.2255847-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/7] package/x11r7/xdriver_xf86-video-ati: Guard
 local variable priv only used with glamor
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
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4ZXM6CnJhZGVvbl9wcmVzZW50LmM6IEluIGZ1bmN0aW9uIOKAmHJhZGVvbl9wcmVzZW50X2No
ZWNrX2ZsaXDigJk6CnJhZGVvbl9wcmVzZW50LmM6MjgxOjIxOiBlcnJvcjogaW52YWxpZCB1c2Ug
b2YgdW5kZWZpbmVkIHR5cGUg4oCYc3RydWN0IHJhZGVvbl9waXhtYXDigJkKICAyODEgfCAgICAg
aWYgKHByaXYgJiYgcHJpdi0+ZmJfZmFpbGVkKQogICAgICB8ICAgICAgICAgICAgICAgICAgICAg
Xn4KClNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4K
Q2M6IEJlcm5kIEt1aGxzIDxiZXJuZC5rdWhsc0B0LW9ubGluZS5kZT4KLS0tCiAuLi4tdmFyaWFi
bGUtcHJpdi1vbmx5LXVzZWQtd2l0aC1nbGFtb3IucGF0Y2ggfCA2NiArKysrKysrKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgNjYgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0
IHBhY2thZ2UveDExcjcveGRyaXZlcl94Zjg2LXZpZGVvLWF0aS8wMDAzLUd1YXJkLWxvY2FsLXZh
cmlhYmxlLXByaXYtb25seS11c2VkLXdpdGgtZ2xhbW9yLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFj
a2FnZS94MTFyNy94ZHJpdmVyX3hmODYtdmlkZW8tYXRpLzAwMDMtR3VhcmQtbG9jYWwtdmFyaWFi
bGUtcHJpdi1vbmx5LXVzZWQtd2l0aC1nbGFtb3IucGF0Y2ggYi9wYWNrYWdlL3gxMXI3L3hkcml2
ZXJfeGY4Ni12aWRlby1hdGkvMDAwMy1HdWFyZC1sb2NhbC12YXJpYWJsZS1wcml2LW9ubHktdXNl
ZC13aXRoLWdsYW1vci5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAw
Li4wYTIzYzU0Y2NlCi0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS94MTFyNy94ZHJpdmVyX3hm
ODYtdmlkZW8tYXRpLzAwMDMtR3VhcmQtbG9jYWwtdmFyaWFibGUtcHJpdi1vbmx5LXVzZWQtd2l0
aC1nbGFtb3IucGF0Y2gKQEAgLTAsMCArMSw2NiBAQAorRnJvbSBhNzhlMzFiNWZmZmFkZDczYjAw
NDgzZjIxZTU0YmQxNDRmMWI0MzlhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogPT9V
VEYtOD9xP01pY2hlbD0yMEQ9QzM9QTRuemVyPz0gPG1kYWVuemVyQHJlZGhhdC5jb20+CitEYXRl
OiBGcmksIDI2IE1hciAyMDIxIDE3OjQyOjEwICswMTAwCitTdWJqZWN0OiBbUEFUQ0hdIEd1YXJk
IGxvY2FsIHZhcmlhYmxlIHByaXYgb25seSB1c2VkIHdpdGggZ2xhbW9yCitNSU1FLVZlcnNpb246
IDEuMAorQ29udGVudC1UeXBlOiB0ZXh0L3BsYWluOyBjaGFyc2V0PVVURi04CitDb250ZW50LVRy
YW5zZmVyLUVuY29kaW5nOiA4Yml0CisKK0ZpeGVzIGNvbXBpbGUgZXJyb3JzIHdpdGggZ2xhbW9y
IGRpc2FibGVkOgorCisuLi8uLi9zcmMvcmFkZW9uX3ByZXNlbnQuYzogSW4gZnVuY3Rpb24g4oCY
cmFkZW9uX3ByZXNlbnRfY2hlY2tfZmxpcOKAmToKKy4uLy4uL3NyYy9yYWRlb25fcHJlc2VudC5j
OjI4MToyMTogZXJyb3I6IGludmFsaWQgdXNlIG9mIHVuZGVmaW5lZCB0eXBlIOKAmHN0cnVjdCBy
YWRlb25fcGl4bWFw4oCZCisgIDI4MSB8ICAgICBpZiAocHJpdiAmJiBwcml2LT5mYl9mYWlsZWQp
CisgICAgICB8ICAgICAgICAgICAgICAgICAgICAgXn4KKy4uLy4uL3NyYy9yYWRlb25fcHJlc2Vu
dC5jOjI4ODoxOTogZXJyb3I6IGludmFsaWQgdXNlIG9mIHVuZGVmaW5lZCB0eXBlIOKAmHN0cnVj
dCByYWRlb25fcGl4bWFw4oCZCisgIDI4OCB8ICBpZiAocHJpdiAmJiAhcHJpdi0+ZmJfZmFpbGVk
KSB7CisgICAgICB8ICAgICAgICAgICAgICAgICAgIF5+CisuLi8uLi9zcmMvcmFkZW9uX3ByZXNl
bnQuYzoyOTI6MTA6IGVycm9yOiBpbnZhbGlkIHVzZSBvZiB1bmRlZmluZWQgdHlwZSDigJhzdHJ1
Y3QgcmFkZW9uX3BpeG1hcOKAmQorICAyOTIgfCAgICAgIHByaXYtPmZiX2ZhaWxlZCA9IFRSVUU7
CisgICAgICB8ICAgICAgICAgIF5+CisKKyhjaGVycnkgcGlja2VkIGZyb20gY29tbWl0IDNjN2M4
NGVkNDk1NjQ5MDdhMTQ4YWU5OWIwMzIwMGUwYmUzNTAwNjApCitTaWduZWQtb2ZmLWJ5OiBSb21h
aW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+CistLS0KKyBzcmMvcmFkZW9uX3ByZXNl
bnQuYyB8IDYgKysrKysrCisgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQorCitkaWZm
IC0tZ2l0IGEvc3JjL3JhZGVvbl9wcmVzZW50LmMgYi9zcmMvcmFkZW9uX3ByZXNlbnQuYworaW5k
ZXggNDk0NjU1YzkuLmQwMTBhYTE5IDEwMDY0NAorLS0tIGEvc3JjL3JhZGVvbl9wcmVzZW50LmMK
KysrKyBiL3NyYy9yYWRlb25fcHJlc2VudC5jCitAQCAtMjU0LDcgKzI1NCw5IEBAIHJhZGVvbl9w
cmVzZW50X2NoZWNrX2ZsaXAoUlJDcnRjUHRyIGNydGMsIFdpbmRvd1B0ciB3aW5kb3csIFBpeG1h
cFB0ciBwaXhtYXAsCisgICAgIHhmODZDcnRjUHRyIHhmODZfY3J0YyA9IGNydGMtPmRldlByaXZh
dGU7CisgICAgIFNjcmVlblB0ciBzY3JlZW4gPSB3aW5kb3ctPmRyYXdhYmxlLnBTY3JlZW47Cisg
ICAgIFNjcm5JbmZvUHRyIHNjcm4gPSB4Zjg2X2NydGMtPnNjcm47CisrI2lmZGVmIFVTRV9HTEFN
T1IKKyAgICAgc3RydWN0IHJhZGVvbl9waXhtYXAgKnByaXYgPSByYWRlb25fZ2V0X3BpeG1hcF9w
cml2YXRlKHBpeG1hcCk7CisrI2VuZGlmCisgICAgIHhmODZDcnRjQ29uZmlnUHRyIGNvbmZpZyA9
IFhGODZfQ1JUQ19DT05GSUdfUFRSKHNjcm4pOworICAgICBSQURFT05JbmZvUHRyIGluZm8gPSBS
QURFT05QVFIoc2Nybik7CisgICAgIFBpeG1hcFB0ciBzY3JlZW5fcGl4bWFwID0gc2NyZWVuLT5H
ZXRTY3JlZW5QaXhtYXAoc2NyZWVuKTsKK0BAIC0yNzgsMTAgKzI4MCwxMyBAQCByYWRlb25fcHJl
c2VudF9jaGVja19mbGlwKFJSQ3J0Y1B0ciBjcnRjLCBXaW5kb3dQdHIgd2luZG93LCBQaXhtYXBQ
dHIgcGl4bWFwLAorIAlyZXR1cm4gRkFMU0U7CisgI2VuZGlmCisgCisrI2lmZGVmIFVTRV9HTEFN
T1IKKyAgICAgaWYgKHByaXYgJiYgcHJpdi0+ZmJfZmFpbGVkKQorIAlyZXR1cm4gRkFMU0U7Cisr
I2VuZGlmCisgCisgICAgIGlmICghcmFkZW9uX3BpeG1hcF9nZXRfZmIocGl4bWFwKSkgeworKyNp
ZmRlZiBVU0VfR0xBTU9SCisgCWlmICghcHJpdikKKyAJICAgIHByaXYgPSByYWRlb25fZ2V0X3Bp
eG1hcF9wcml2YXRlKHBpeG1hcCk7CisgCitAQCAtMjkxLDYgKzI5Niw3IEBAIHJhZGVvbl9wcmVz
ZW50X2NoZWNrX2ZsaXAoUlJDcnRjUHRyIGNydGMsIFdpbmRvd1B0ciB3aW5kb3csIFBpeG1hcFB0
ciBwaXhtYXAsCisgCQkgICAgICAgIm5vcm1hbCBpZiB1c2luZyBQUklNRSByZW5kZXIgb2ZmbG9h
ZGluZylcbiIpOworIAkgICAgcHJpdi0+ZmJfZmFpbGVkID0gVFJVRTsKKyAJfQorKyNlbmRpZgor
IAorIAlyZXR1cm4gRkFMU0U7CisgICAgIH0KKy0tIAorMi4zMS4xCisKLS0gCjIuMzEuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
