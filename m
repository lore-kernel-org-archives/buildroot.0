Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFDEC38A2D
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 18:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D04D81275;
	Tue, 25 Oct 2022 18:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D04D81275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLKSTv3RVe5L; Tue, 25 Oct 2022 18:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CD008126E;
	Tue, 25 Oct 2022 18:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CD008126E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29BF41BF290
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 052374012B
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 18:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 052374012B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wbOuE-sXYPZU for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 18:06:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB13540323
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB13540323
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 18:06:10 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id s27so1558268ioa.10
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 11:06:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gNYHmzaM804rW8WpWnod14d2l/CB3s6B5iMYpUS+VRs=;
 b=cjmlPn7N+zH7GI3DyO95xnAqetsb5GEXYJqG3e5G9d62U2FRIoUw5h3MawcC91d0fx
 fXY58noYGplQZA1C7MszT12i2mnDxDymxq+FDJLDgoKbicwv/81Oy34TU2NX4onVIK7j
 fd7D5+xFbEibfKP2cIYGSjj4lEHoSfrRFvlALfzqnabQLN3eC9QRDAmGMGHAPfqQMP3Y
 et6zNy4jz9lmKyRyqEcjTKv4RUq2S5lZRjJ0KOyLEgkhsRrKvbMl5equMN9WF7VmElU4
 heUwW/G9g5FqjIZF06D+NtyjqvcI8AqiIYkXKGkX8XHCsPHN42Hx3wgoPfZXvz2QRZzQ
 wg1w==
X-Gm-Message-State: ACrzQf3fEuzzLCjt9xfsIclnawN/yNWi2D/++losWn5Cmb7zEdd5HdOT
 +vcXsGG4+GWh08gjX4D+7iJm2vjFUnaKDw==
X-Google-Smtp-Source: AMsMyM7VcbaSf24Xfm0OCNsTMzr60kCPRSS5dVihZhYYlXJSc2+A6QazlZ6phgWzsYHiHbxt5UAeQw==
X-Received: by 2002:a05:6638:3486:b0:365:c4e0:e5a5 with SMTP id
 t6-20020a056638348600b00365c4e0e5a5mr25818547jal.219.1666721169555; 
 Tue, 25 Oct 2022 11:06:09 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 q12-20020a02a98c000000b0034a6d12aa25sm1168247jam.4.2022.10.25.11.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 11:06:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Oct 2022 12:06:03 -0600
Message-Id: <20221025180603.886122-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gNYHmzaM804rW8WpWnod14d2l/CB3s6B5iMYpUS+VRs=;
 b=YqqMsmtjpITkIj6/jbABxSjkWesZBHH0jDH322XoxpPvFg2YcajocFmH/gYXb6PS11
 HkiwBI+lAjoKZhhrdVcaOtnDF7WDB5ci01ZEtSutjJ+QuhNlx1LVyV9EXMxWOWPIQ+CN
 Y/xZUseoBAZBGnotQlRtasfi2vWutS67WDsz536/SX0Ake2QR9cpgX17Lh41INWqqikc
 sBFgKg2lVkDbapdzvQtEKA/+RQv5fe5H9vlarDGXxz2lxB+o0wi7IsHIxK6BR1r5vCLJ
 Zech6nP39jwZlLc4z9018JY9W85rt+mL79d3dQE6GLcSi9+uTg2SDfKDIjknJwTOwJGV
 7IYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YqqMsmtj
Subject: [Buildroot] [PATCH 1/1] package/zbar: fix python 3.11 compatibility
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Volkov Viacheslav <sv99@inbox.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGEgcGF0Y2ggZnJvbSB1cHN0cmVhbSBwdWxsIHJlcXVlc3QgdG8gZml4IGJ1aWxkIHdpdGgg
cHl0aG9uIDMuMTEuCgpGaXhlczoKcHl0aG9uL2VudW0uYzogSW4gZnVuY3Rpb24g4oCYZW51bWl0
ZW1fbmV34oCZOgpweXRob24vZW51bS5jOjU1OjI1OiBlcnJvcjogbHZhbHVlIHJlcXVpcmVkIGFz
IGxlZnQgb3BlcmFuZCBvZiBhc3NpZ25tZW50CiAgIDU1IHwgICAgIFB5X1NJWkUoJnNlbGYtPnZh
bCkgPSBQeV9TSVpFKGxvbmd2YWwpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgIF4K
cHl0aG9uL2VudW0uYzogSW4gZnVuY3Rpb24g4oCYemJhckVudW1JdGVtX05ld+KAmToKcHl0aG9u
L2VudW0uYzoxNDY6MjU6IGVycm9yOiBsdmFsdWUgcmVxdWlyZWQgYXMgbGVmdCBvcGVyYW5kIG9m
IGFzc2lnbm1lbnQKICAxNDYgfCAgICAgUHlfU0laRSgmc2VsZi0+dmFsKSA9IFB5X1NJWkUobG9u
Z3ZhbCk7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgXgoKU2lnbmVkLW9mZi1ieTog
SmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+Ci0tLQogLi4ueXRob24t
ZW51bS1maXgtYnVpbGQtZm9yLVB5dGhvbi0zLjExLnBhdGNoIHwgNjIgKysrKysrKysrKysrKysr
KysrKwogMSBmaWxlIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBwYWNrYWdlL3piYXIvMDAwMS1weXRob24tZW51bS1maXgtYnVpbGQtZm9yLVB5dGhvbi0zLjEx
LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS96YmFyLzAwMDEtcHl0aG9uLWVudW0tZml4LWJ1
aWxkLWZvci1QeXRob24tMy4xMS5wYXRjaCBiL3BhY2thZ2UvemJhci8wMDAxLXB5dGhvbi1lbnVt
LWZpeC1idWlsZC1mb3ItUHl0aG9uLTMuMTEucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5k
ZXggMDAwMDAwMDAwMC4uZjUyNWI2MjE4NAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvemJh
ci8wMDAxLXB5dGhvbi1lbnVtLWZpeC1idWlsZC1mb3ItUHl0aG9uLTMuMTEucGF0Y2gKQEAgLTAs
MCArMSw2MiBAQAorRnJvbSBmYmFlYzRiNGU2ZmU3MzVlZmU2OTE2ZmU1YjkyODA1YTBkOTZiZjhh
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogPT9VVEYtOD9xPz1DND05MG89QzM9QTBu
PTIwVHI9RTE9QkE9QTduPTIwQz1DMz1CNG5nPTIwRGFuaD89CisgPGNvbmdkYW5ocXhAZ21haWwu
Y29tPgorRGF0ZTogV2VkLCAyMSBTZXAgMjAyMiAxMDozMjoxMSArMDcwMAorU3ViamVjdDogW1BB
VENIXSBweXRob246IGVudW06IGZpeCBidWlsZCBmb3IgUHl0aG9uIDMuMTEKK01JTUUtVmVyc2lv
bjogMS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQt
VHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKKworUHl0aG9uIDMuOSBpbnRyb2R1Y2VkIFB5X1NFVF9T
SVpFIGZ1bmN0aW9uIHRvIHNldCBzaXplIGluc3RlYWQgb2YKK3JlbHlpbmcgb24gUHlfU0laRSgp
IGFzIGEgbWFjcm8gWzMuOV0uCisKK1B5dGhvbiAzLjEwIHN0YXJ0ZWQgdG8gZW5jb3VyYWdlIHRv
IHVzZSBQeV9TRVRfU0laRSBpbnN0ZWFkIG9mCithc3NpZ25pbmcgaW50byByZXR1cm4gdmFsdWUg
b2YgUHlfU0laRSBbMy4xMF0uCisKK1B5dGhvbiAzLjExIGZsaXBzIHRoZSBzd2l0Y2gsIHR1cm4g
UHlfU0laRSBpbnRvIGEgZnVuY3Rpb24gWzMuMTFdLAordGh1cyBQeV9TSVpFKG9iaikgd2lsbCBi
ZSBhIHJ2YWx1ZS4gV2UgbmVlZCB0byB1c2UgUHlfU0VUX1NJWkUKK3RvIHNldCBzaXplIG5vdy4K
KworWzMuOV06IGh0dHBzOi8vZG9jcy5weXRob24ub3JnLzMuOS9jLWFwaS9zdHJ1Y3R1cmVzLmh0
bWwjYy5QeV9TRVRfU0laRQorWzMuMTBdOiBodHRwczovL2RvY3MucHl0aG9uLm9yZy8zLjEwL2Mt
YXBpL3N0cnVjdHVyZXMuaHRtbCNjLlB5X1NJWkUKK1szLjExXTogaHR0cHM6Ly9kb2NzLnB5dGhv
bi5vcmcvMy4xMS9jLWFwaS9zdHJ1Y3R1cmVzLmh0bWwjYy5QeV9TSVpFCisKK1NpZ25lZC1vZmYt
Ynk6IMSQb8OgbiBUcuG6p24gQ8O0bmcgRGFuaCA8Y29uZ2RhbmhxeEBnbWFpbC5jb20+CitTaWdu
ZWQtb2ZmLWJ5OiBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4KK1tV
cHN0cmVhbSBzdGF0dXM6CitodHRwczovL2dpdGh1Yi5jb20vbWNoZWhhYi96YmFyL3B1bGwvMjMx
XQorLS0tCisgcHl0aG9uL2VudW0uYyB8IDggKysrKysrKysKKyAxIGZpbGUgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspCisKK2RpZmYgLS1naXQgYS9weXRob24vZW51bS5jIGIvcHl0aG9uL2VudW0u
YworaW5kZXggZGZlMWIxZS4uOTQ2MzQ0ZiAxMDA2NDQKKy0tLSBhL3B5dGhvbi9lbnVtLmMKKysr
KyBiL3B5dGhvbi9lbnVtLmMKK0BAIC01Miw3ICs1MiwxMSBAQCBlbnVtaXRlbV9uZXcgKFB5VHlw
ZU9iamVjdCAqdHlwZSwKKyAKKyAgICAgLyogd2UgYXNzdW1lIHRoZSAiZmFzdCBwYXRoIiBmb3Ig
YSBzaW5nbGUtZGlnaXQgaW50cyAoc2VlIGxvbmdvYmplY3QuYykgKi8KKyAgICAgLyogdGhpcyBh
bHNvIGhvbGRzIGlmIHdlIGdldCBhIHNtYWxsX2ludCBwcmVhbGxvY2F0ZWQgbG9uZyAqLworKyNp
ZiBQWV9WRVJTSU9OX0hFWCA+PSAweDAzMDkwMDAwCisrICAgIFB5X1NFVF9TSVpFKCZzZWxmLT52
YWwsIFB5X1NJWkUobG9uZ3ZhbCkpOworKyNlbHNlCisgICAgIFB5X1NJWkUoJnNlbGYtPnZhbCkg
PSBQeV9TSVpFKGxvbmd2YWwpOworKyNlbmRpZgorICAgICBzZWxmLT52YWwub2JfZGlnaXRbMF0g
PSBsb25ndmFsLT5vYl9kaWdpdFswXTsKKyAgICAgUHlfREVDUkVGKGxvbmd2YWwpOworICNlbHNl
CitAQCAtMTQzLDcgKzE0NywxMSBAQCB6YmFyRW51bUl0ZW1fTmV3IChQeU9iamVjdCAqYnluYW1l
LAorIAorICAgICAvKiB3ZSBhc3N1bWUgdGhlICJmYXN0IHBhdGgiIGZvciBhIHNpbmdsZS1kaWdp
dCBpbnRzIChzZWUgbG9uZ29iamVjdC5jKSAqLworICAgICAvKiB0aGlzIGFsc28gaG9sZHMgaWYg
d2UgZ2V0IGEgc21hbGxfaW50IHByZWFsbG9jYXRlZCBsb25nICovCisrI2lmIFBZX1ZFUlNJT05f
SEVYID49IDB4MDMwOTAwMDAKKysgICAgUHlfU0VUX1NJWkUoJnNlbGYtPnZhbCwgUHlfU0laRShs
b25ndmFsKSk7CisrI2Vsc2UKKyAgICAgUHlfU0laRSgmc2VsZi0+dmFsKSA9IFB5X1NJWkUobG9u
Z3ZhbCk7CisrI2VuZGlmCisgICAgIHNlbGYtPnZhbC5vYl9kaWdpdFswXSA9IGxvbmd2YWwtPm9i
X2RpZ2l0WzBdOworICAgICBQeV9ERUNSRUYobG9uZ3ZhbCk7CisgCistLSAKKzIuMzQuMQorCi0t
IAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
