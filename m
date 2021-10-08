Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8175FC433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 11:03:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 307E360F22
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 11:03:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 307E360F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=unikie.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0085C403E7;
	Fri,  8 Oct 2021 11:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hiTKpl-9-0j4; Fri,  8 Oct 2021 11:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2585E40406;
	Fri,  8 Oct 2021 11:03:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A7F41BF5A2
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 11:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 235B4403D9
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 11:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ULBEl8NLf7Ai for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 11:03:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 611B1403D7
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 11:03:48 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id u18so37482127lfd.12
 for <buildroot@buildroot.org>; Fri, 08 Oct 2021 04:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gTxQ2Pgrrq+HsrQP4PEmSpPOX6C/8Nu2i+i1w9CLH5o=;
 b=dN/smjYmorx0EHhzD+lHW8tfyHpfG9lD2gXL2G3k/JW6qZ6z6Hsqyvzxq0F6GiFw4/
 ThC3jpo4XPqcj+atpttw+2OWLtqhLV/REIJL/RLZUJYQERopQMEKEi24zHpIgLjtLqfQ
 OqzoHRZPAA1ztmEugu3q5rCcbjpS4d2dABd5GV4/v/qrIbFqNPlpe03x+rRs0UalM9WZ
 dYVey4ykwJCvJIezMn4MU3Ybmp9K8Whit6OVgI010F9jhCImnZUf+uzqzmjzFANu+QAB
 Da6FCxbnZiJ9gKiODXle7v2VJrklzWy1SPtAj1oHa42Pw9QKHkjwj6z7qFU0ZaajHa+3
 KS6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gTxQ2Pgrrq+HsrQP4PEmSpPOX6C/8Nu2i+i1w9CLH5o=;
 b=ejAD3XQToeE032FFlPesTXpQllKJqfwa2onwswWdOcDJCxKBg+athGx1sb8iFKFiE3
 VRQFNLHiYVv+Frw9NzQiVEWbTvDHczIJgy9HwlclLjFLbfB3PrmQD9LguPXr2YuaVFLG
 noVewf8E0IEe+ZtLNlipkO0hdtbE5n5ofaII3iUT40pI8MU474IHIQbFZMZo9qnPyzDh
 yod9m/DxuncGgNDkgarbFLTwM0Gceqq+gdyUwASJ2jpzwkQfUfQAg8HLJGO23wjjWoBa
 8+gHHas2+fMhK6CbpVlLkz4eL5ZIHt882iLbpF6Ay36O0Aoe0QZM4mBJuVpOu3hPV7bl
 4ltw==
X-Gm-Message-State: AOAM530Yp7UuFOJ7QOOnzOk/GUR3VEuFri8t+3/Q7yv3nGxbdc9Hgk/4
 Hpk+AhCNNGpFZclfqeRwyIERezA9mLHLSSxZ
X-Google-Smtp-Source: ABdhPJxLvraaQXnuZPdWpH5dHOEz1bYfQfU3JOwkVCp2xYuSULBi/xvbtmxZn0KoALoG7Z5tjTAhpQ==
X-Received: by 2002:a2e:bd04:: with SMTP id n4mr2736941ljq.273.1633691026197; 
 Fri, 08 Oct 2021 04:03:46 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (88-113-104-240.elisa-laajakaista.fi. [88.113.104.240])
 by smtp.googlemail.com with ESMTPSA id d3sm77555lfa.100.2021.10.08.04.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 04:03:45 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Fri,  8 Oct 2021 14:03:45 +0300
Message-Id: <20211008110345.1901311-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/opensc: add package
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGZvbGxvd2luZyBwYXRjaCB3aWxsIGFkZCBhIHJlY2lwZSB0bwppbnN0YWxsIG9wZW5zYyBp
biBmaW5hbCBpbWFnZXMuCgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBQZWtrYXJpbmVuIDxqb3NlLnBl
a2thcmluZW5AdW5pa2llLmNvbT4KLS0tCiBwYWNrYWdlL29wZW5zYy9Db25maWcuaW4gfCAgNyAr
KysrKysrCiBwYWNrYWdlL29wZW5zYy9vcGVuc2MubWsgfCAxNSArKysrKysrKysrKysrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2th
Z2Uvb3BlbnNjL0NvbmZpZy5pbgogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvb3BlbnNjL29w
ZW5zYy5tawoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvb3BlbnNjL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
b3BlbnNjL0NvbmZpZy5pbgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5h
YmQyNmE5YjA4Ci0tLSAvZGV2L251bGwKKysrIGIvcGFja2FnZS9vcGVuc2MvQ29uZmlnLmluCkBA
IC0wLDAgKzEsNyBAQAorY29uZmlnIEJSMl9QQUNLQUdFX09QRU5TQworCWJvb2wgIm9wZW5zYyIK
KwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQk9QRU5TU0wgJiYgQlIyX1BBQ0tBR0VfUENTQ19M
SVRFCisJaGVscAorCQlPcGVuU0MgcHJvdmlkZXMgYSBzZXQgb2YgbGlicmFyaWVzIGFuZCB1dGls
aXRpZXMgdG8gd29yayB3aXRoIHNtYXJ0IGNhcmRzLgorCisJCWh0dHBzOi8vZ2l0aHViLmNvbS9P
cGVuU0MvT3BlblNDLmdpdApkaWZmIC0tZ2l0IGEvcGFja2FnZS9vcGVuc2Mvb3BlbnNjLm1rIGIv
cGFja2FnZS9vcGVuc2Mvb3BlbnNjLm1rCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLjc3NDFkYWMyYTUKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL29wZW5zYy9vcGVu
c2MubWsKQEAgLTAsMCArMSwxNSBAQAorIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKKyMKKyMgb3Bl
bnNjCisjCisjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIworCitPUEVOU0NfVkVSU0lPTiA9IDAuMjIu
MAorT1BFTlNDX1NJVEUgPSAkKGNhbGwgZ2l0aHViLE9wZW5TQyxPcGVuU0MsJChPUEVOU0NfVkVS
U0lPTikpCitPUEVOU0NfTElDRU5TRSA9IEdQTC0yCitPUEVOU0NfTElDRU5TRV9GSUxFUyA9IExJ
Q0VOU0UKK09QRU5TQ19ERVBFTkRFTkNJRVMgPSBvcGVuc3NsIHBjc2MtbGl0ZQorT1BFTlNDX0FV
VE9SRUNPTkYgPSBZRVMKK09QRU5TQ19JTlNUQUxMX1RBUkdFVCA9IFlFUworCiskKGV2YWwgJChh
dXRvdG9vbHMtcGFja2FnZSkpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
