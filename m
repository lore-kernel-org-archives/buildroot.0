Return-Path: <SRS0=M9Dx=N5=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EDFC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:10:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07DF860238
	for <buildroot@archiver.kernel.org>; Tue,  7 Sep 2021 12:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 07DF860238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EEA5404E4;
	Tue,  7 Sep 2021 12:10:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8xbcpeC1k8eS; Tue,  7 Sep 2021 12:10:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8290640235;
	Tue,  7 Sep 2021 12:10:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 399731BF334
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29F9C82446
 for <buildroot@lists.busybox.net>; Tue,  7 Sep 2021 12:10:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zg8rO7YWteBC for <buildroot@lists.busybox.net>;
 Tue,  7 Sep 2021 12:10:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E954980AA4
 for <buildroot@buildroot.org>; Tue,  7 Sep 2021 12:10:05 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id q3so13591770edt.5
 for <buildroot@buildroot.org>; Tue, 07 Sep 2021 05:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NtY6N4/mxYna1kF5OLaQLZtHJP1kdQapFkUKo6Ml2qo=;
 b=FdzemWPiczZhQx+dGlcZQs3xx6KHpPZP8f8fd6CmUeq11/eqjgNLAgtSYAXXTFwfCC
 jCJ1yrGkllUXI4FaXfiZADVy5wEz1hKtAVg8ssV0vot73GxRSkKrmLn/shkusckjnn6P
 Ls1hGWSZ6wtnIx3FDfSlXaJ70PG/SbhxngITD7LivPfew5DRceOX6T+FIZgqL8NKJEDJ
 1uCkT3lxC3e3eiacuVaBAJrqc6s4YxnnOnxcdyz0vZoe730opFfvAtmbuXcNZ/JgTGyJ
 8m1BNk32Guq9ctGgcd5kYoQKC+sCFKiligc5p4DZnSOjbLa2azPbBKmHWKLAlE6Fmpsr
 U6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NtY6N4/mxYna1kF5OLaQLZtHJP1kdQapFkUKo6Ml2qo=;
 b=K/4E+BVdWxkzw8JGCGJbGWTdTHfWI0tHKRj6fF3boUZnk3HZy5tI13QRLEeMxB730O
 AC51ODB2lqc8un4ki/knUcCXgotAJGtD/HmOLDzPck8u4xea3YidohZzL67dGag6shrP
 DqJS73iYL5vDEHVT+UxjtgV2PZfiOSvJopAW2NIFrAzyT+GDQDTy+zWut/fkjVJza5aW
 3FYaZyyTd4uGaI9R/jzPz/w0Z9VmGobvWvdhp0WtuQH+EBOjlcSxTqCJs6Ng//xmXPn8
 XU1rQSddFSyqyf2gCDbYmv3ppy9dAESSzTdieNG20NcUE6aMGRuarr1FAc2gKh/zAPaJ
 2FRw==
X-Gm-Message-State: AOAM530HLWKPkFX2Jo6OKByIek+wx1JCpxq6F+WEJwlT2hGeAh+m+wo0
 f7Syu1+wJY7uT5vr4/KEMKrrYpEfJ/cDYdjv
X-Google-Smtp-Source: ABdhPJx8enDS/fVUYulLEnygeeGF9XWtk/4TWyNk0PA8/6CQJNwqQfv3UjQBQqacFga89SCTZ+0LKw==
X-Received: by 2002:a50:d09a:: with SMTP id v26mr18473557edd.346.1631016604165; 
 Tue, 07 Sep 2021 05:10:04 -0700 (PDT)
Received: from debian-hp-1.home (5.26-130-109.adsl-dyn.isp.belgacom.be.
 [109.130.26.5])
 by smtp.gmail.com with ESMTPSA id gz22sm5538336ejb.15.2021.09.07.05.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 05:10:03 -0700 (PDT)
From: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
To: buildroot@buildroot.org
Date: Tue,  7 Sep 2021 14:09:33 +0200
Message-Id: <20210907120933.31647-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/mupdf: fix building with some
 toolchains
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

V2l0aCBzb21lIHRvb2xjaGFpbnMgKGUuZy4gbWlwczY0ZWwpLCBwYXJ0aWFsIGxpbmtpbmcgZmFp
bHMgaW4gdGhlCmZvbGxvd2luZyB3YXk6Ci90bXAvaW5zdGFuY2UtMS9vdXRwdXQtMS9ob3N0L29w
dC9leHQtdG9vbGNoYWluL2Jpbi8uLi9saWIvZ2NjL21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC11
Y2xpYmMvOC40LjAvLi4vLi4vLi4vLi4vbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy9i
aW4vbGQ6IGJ1aWxkL3JlbGVhc2UvbGlibXVwZGYuYShEaW5nYmF0cy5jZmYubyk6IEFCSSBpcyBp
bmNvbXBhdGlibGUgd2l0aCB0aGF0IG9mIHRoZSBzZWxlY3RlZCBlbXVsYXRpb24KL3RtcC9pbnN0
YW5jZS0xL291dHB1dC0xL2hvc3Qvb3B0L2V4dC10b29sY2hhaW4vYmluLy4uL2xpYi9nY2MvbWlw
czY0ZWwtYnVpbGRyb290LWxpbnV4LXVjbGliYy84LjQuMC8uLi8uLi8uLi8uLi9taXBzNjRlbC1i
dWlsZHJvb3QtbGludXgtdWNsaWJjL2Jpbi9sZDogZmFpbGVkIHRvIG1lcmdlIHRhcmdldCBzcGVj
aWZpYyBkYXRhIG9mIGZpbGUgYnVpbGQvcmVsZWFzZS9saWJtdXBkZi5hKERpbmdiYXRzLmNmZi5v
KQoKVGFraW5nIGluc3BpcmF0aW9uIGZyb20gY29tbWl0CjllY2E0YjlmODRmZTI1MzVkOGNhZWU2
ZWViMDYyY2UzMzczM2JkZjEsIGZpeCBpdCBieSB1c2luZyBHQ0MgaW5zdGVhZApvZiBMRCBmb3Ig
cGFydGlhbCBsaW5raW5nLgoKJ25vc3RkbGliJyBoYXMgdG8gYmUgYWRkZWQsIG9yIGl0IHdpbGwg
dHJ5IHRvIHVzZSBHQ0MgbGlicmFyaWVzIGZvcgpwYXJ0aWFsIGxpbmtpbmcgYW5kIGZhaWwgd2l0
aCAnY2Fubm90IGZpbmQgLWxnY2NfcycuCgpOb3RlIHRoYXQgb24gbWlwcyB0aGUgYnVpbGQgd2ls
bCBub3cgcHJvZHVjZSB3YXJuaW5ncyBzaW1pbGFyIHRvIHRoaXMKb25lOgovaG9tZS9ybWUvRG9j
dW1lbnRzL2J1aWxkcm9vdC9vdXRwdXQvaG9zdC9saWIvZ2NjL21pcHM2NGVsLWJ1aWxkcm9vdC1s
aW51eC1nbnUvMTAuMy4wLy4uLy4uLy4uLy4uL21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC1nbnUv
YmluL2xkOiBidWlsZC9yZWxlYXNlL2xpYm11cGRmLmEoTm90b1NhbnNUYWlUaGFtLVJlZ3VsYXIu
dHRmLm8pOiB3YXJuaW5nOiBsaW5raW5nIGFiaWNhbGxzIGZpbGVzIHdpdGggbm9uLWFiaWNhbGxz
IGZpbGVzCgpEdXJpbmcgYSBydW50aW1lIHRlc3Qgb24gbWlwczY0ZWwgdW5kZXIgcWVtdSwgbXVw
ZGYteDExIHdhcwpub25ldGhlbGVzcyBhYmxlIHRvIGRpc3BsYXkgYSBzYW1wbGUgUERGIGZpbGUg
Y29ycmVjdGx5LgoKVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5nIGJ1aWxkIGZhaWx1cmVzIChhbmQg
bWFueSBzaW1pbGFyIG9uZXMpOgpodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0
cy8xNTZmZTllZTVmNmRjY2RjOTg5OTBmNmM1ZGU1NTYyMzgzYmMyYjc0LwoKU2lnbmVkLW9mZi1i
eTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIC4uLi8w
MDAxLXVzZS1nY2MtaW5zdGVhZC1vZi1vYmpjb3B5LnBhdGNoICAgICB8IDI5ICsrKysrKysrKysr
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAx
MDA2NDQgcGFja2FnZS9tdXBkZi8wMDAxLXVzZS1nY2MtaW5zdGVhZC1vZi1vYmpjb3B5LnBhdGNo
CgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9tdXBkZi8wMDAxLXVzZS1nY2MtaW5zdGVhZC1vZi1vYmpj
b3B5LnBhdGNoIGIvcGFja2FnZS9tdXBkZi8wMDAxLXVzZS1nY2MtaW5zdGVhZC1vZi1vYmpjb3B5
LnBhdGNoCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjlhOGRhY2JjY2EK
LS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL211cGRmLzAwMDEtdXNlLWdjYy1pbnN0ZWFkLW9m
LW9iamNvcHkucGF0Y2gKQEAgLTAsMCArMSwyOSBAQAorRnJvbSBkZTI3ZGFlZGY4Y2IxZDIxMGIw
YjFmYWNkODc2MzRjNmFhYWYxYTc0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogPT9V
VEYtOD9xP1JhcGhhPUMzPUFCbD0yME09QzM9QTlsb3R0ZT89IDxyYXBoYWVsLm1lbG90dGVAbWlu
ZC5iZT4KK0RhdGU6IFRodSwgMiBTZXAgMjAyMSAyMDoxNzoyNiArMDIwMAorU3ViamVjdDogW1BB
VENIXSB1c2UgZ2NjIGluc3RlYWQgb2Ygb2JqY29weQorTUlNRS1WZXJzaW9uOiAxLjAKK0NvbnRl
bnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOAorQ29udGVudC1UcmFuc2Zlci1FbmNv
ZGluZzogOGJpdAorCitTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5t
ZWxvdHRlQG1pbmQuYmU+CistLS0KKyBNYWtlZmlsZSB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIv
TWFrZWZpbGUKK2luZGV4IGIwZmI2MTdlMi4uMGE4Nzk1ZTBlIDEwMDY0NAorLS0tIGEvTWFrZWZp
bGUKKysrKyBiL01ha2VmaWxlCitAQCAtNjQsNyArNjQsNyBAQCBlbmRpZgorIExJTktfQ01EID0g
JChRVUlFVF9MSU5LKSAkKE1LVEdURElSKSA7ICQoQ0MpICQoTERGTEFHUykgLW8gJEAgJF4gJChM
SUJTKQorIFRBR1NfQ01EID0gJChRVUlFVF9UQUdTKSBjdGFncyAtUiAtLWMta2luZHM9K3AKKyBX
SU5EUkVTX0NNRCA9ICQoUVVJRVRfV0lORFJFUykgJChNS1RHVERJUikgOyAkKFdJTkRSRVMpICQ8
ICRACistT0JKQ09QWV9DTUQgPSAkKFFVSUVUX09CSkNPUFkpICQoTUtUR1RESVIpIDsgJChMRCkg
LXIgLWIgYmluYXJ5IC16IG5vZXhlY3N0YWNrIC1vICRAICQ8CisrT0JKQ09QWV9DTUQgPSAkKFFV
SUVUX09CSkNPUFkpICQoTUtUR1RESVIpIDsgJChDQykgLVdsLC1yIC1XbCwtYiAtV2wsYmluYXJ5
IC1XbCwteiAtV2wsbm9leGVjc3RhY2sgLW5vc3RkbGliIC1vICRAICQ8CisgCisgIyAtLS0gUnVs
ZXMgLS0tCisgCistLSAKKzIuMzIuMAorCi0tIAoyLjMyLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGxpc3RzLmJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
