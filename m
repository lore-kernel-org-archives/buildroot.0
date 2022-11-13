Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5449CC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Nov 2022 11:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD78160B30;
	Sun, 13 Nov 2022 11:09:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD78160B30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xTjYuTgjuJHi; Sun, 13 Nov 2022 11:09:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1072C60864;
	Sun, 13 Nov 2022 11:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1072C60864
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 014211BF42E
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 11:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D08D94048F
 for <buildroot@lists.busybox.net>; Sun, 13 Nov 2022 11:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D08D94048F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uCMm9ikptpCM for <buildroot@lists.busybox.net>;
 Sun, 13 Nov 2022 11:09:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 97B934020B
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97B934020B
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 11:09:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id o4so12369599wrq.6
 for <buildroot@buildroot.org>; Sun, 13 Nov 2022 03:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YJy+K1KqGUxca3/rRMi09Zps7iCKQ2BDaQ6WWGqqGdE=;
 b=oB4SNd6IR7Cc/yPMlLz2yALoppkgsRe7frSpbFqRm+0bnu5Q939WDL4XzNeolnVTM/
 36c6ZQZLLpFwtAiEc+lGFvXSO7ugsKyDivCz3GcYDmHG/4Bjm/2b/FzpsQTYEJ+E617Y
 fP/v2STGXzutq+3CvtU5RMY6yHVbHj7I//wZ22tB7yigp6Kt5JuyGmmCIdlFQnrXKhSS
 bs1FDN7IWevylAe0fOT4sPeZrVLIrAgOfdvTG7AEIOP7WBy4PRQUVduMcZsXwy7Fo91h
 iJ5Sm3vWhVQwu6ipwMzz1Yl72Na/gbkiQk09lBXDom0JMxFgcpY6uqFjyHVxRFwAAO+4
 sS2w==
X-Gm-Message-State: ANoB5plBUII8Jo3gLS5NBQh1wtsNlxZH0ywKGah7axcdf8qpOzMPjtnw
 Kc/uDKxyV0J75ZIQ/vRic6zkgfLnzIw=
X-Google-Smtp-Source: AA0mqf60ZLA00EmpbP58wbKnCzyQQXkzuQSHSbdcr2Pp1/DrSAFjQ1JZQhwhZLXsZ1M2ckMkDngq5A==
X-Received: by 2002:adf:e80a:0:b0:236:593f:2ab3 with SMTP id
 o10-20020adfe80a000000b00236593f2ab3mr5485404wrm.356.1668337742669; 
 Sun, 13 Nov 2022 03:09:02 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:f76c:17ea:8df1:99cc])
 by smtp.gmail.com with ESMTPSA id
 k34-20020a05600c1ca200b003b47b80cec3sm16289791wms.42.2022.11.13.03.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Nov 2022 03:09:02 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 13 Nov 2022 12:09:01 +0100
Message-Id: <20221113110901.4065729-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=YJy+K1KqGUxca3/rRMi09Zps7iCKQ2BDaQ6WWGqqGdE=;
 b=kdUz/Rk7v1lT2pLZdIK4dcO6i2Yv7Mup9ULhoxhdMMUm2AMQKLGNDJfPnczvYvRRqg
 vVwa1nVOnsK1RtW6uJTKQk6mrYn7W8eB4SKAr3UAv53XOattz+aUdwkObgelDFYuznef
 XSJ9fgwZ/Fd87Pr1xG63ueoNmRCsiSHUHvx7x709LcJa8TbuIddz8tsG9xQ6GVlI7Sco
 YVn4AHLfM+K7u1Pm5H7IDxd752CEc/3B32RZ51bLY1bPbT/tIWsAaBIb20bj7ylqKebu
 a2MwL1OLMrWXRDkRy8U/ydHg48WLoaLj/bwTSRe8AxrYVqD4ddtHw4HVi/am0KayZJaX
 Rv6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kdUz/Rk7
Subject: [Buildroot] [PATCH] package/systemd: fix build with -Ofast
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

c3lzdGVtZCBkb2VzIG5vdCBidWlsZCB3aXRoIC1PZmFzdCAoYXQgbGVhc3Qgd2l0aCBnY2MtMTIp
LCBsZWFkaW5nIHRvCmJ1aWxkIGVycm9ycyBsaWtlOgoKICAgIC4uL3NyYy9zaGFyZWQvY29uZGl0
aW9uLmM6IEluIGZ1bmN0aW9uIOKAmGNvbmRpdGlvbl9kdW1wX2xpc3TigJk6CiAgICAuLi9zcmMv
c2hhcmVkL2NvbmRpdGlvbi5jOjEyMjc6MzM6IGVycm9yOiDigJglc+KAmSBkaXJlY3RpdmUgYXJn
dW1lbnQgaXMgbnVsbCBbLVdlcnJvcj1mb3JtYXQtb3ZlcmZsb3c9XQogICAgIDEyMjcgfCAgICAg
ICAgICAgICAgICAgIiVzXHQlczogJXMlcyVzICVzXG4iLAogICAgICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+CiAgICBjYzE6IHNvbWUgd2FybmluZ3MgYmVpbmcgdHJl
YXRlZCBhcyBlcnJvcnMKCkl0IGlzIG5vdCByZWFsbHkgY2xlYXIgd2hhdCB0aGUgcmVhc29uIGlz
LCBidXQgaXQgc21lbGxzIGxpa2UgYSBjb21waWxlcgplcnJvci4KCkluZGVlZCwgdGhlIGZhaWxp
bmcgZm9ybWF0IGlzIHBhc3NlZCB0byBhbiBmcHJpbnRmLCBhbmQgdGhlIHBhcmFtZXRlcgpjb3Jy
ZXNwb25kaW5nIHRvIHRoZSBmYWlsaW5nICVzIGRpcmVjdGl2ZSBpcyBhIGNhbGwgdG8gYSBmdW5j
dGlvbgp3aGljaCBwcm90b3R5cGUgaXMgZGVmaW5lZCBidXQgdGhlIGltcGxlbWVudGF0aW9uIG9u
bHkgY29tZXMgbGF0ZXIgaW4KdGhlIHNhbWUgY29tcGlsYXRpb24gdW5pdCwgYnV0IGlzIHRoZSBy
ZXN1bHQgb2YgbWFjcm8gZXhwYW5zaW9uLCB3aGljaAp5aWVsZHMgYSBmdW5jdGlvbiBkZWZpbnRp
b24gbGlrZToKCiAgICBjb25zdCBjaGFyIGZvb190b19zdHJpbmcoZm9vX3R5cGUgaSkgewogICAg
ICAgIGlmIChpIDwgMCB8fCBpID49IChmb29fdHlwZSkgRUxFTUVOVFNPRihmb29fdGFibGUpKQog
ICAgICAgICAgICByZXR1cm4gTlVMTDsKICAgICAgICByZXR1cm4gZm9vX3RhYmxlW2ldCiAgICB9
Cgood2hlcmUgRUxFTUVOVFNPRih4KSBpcyBhIG1hY3JvcyBhcm91bmYgc2l6ZW9mKHgpIHRvIGRl
dGVybWluZSB0aGUKbnVtYmVyIG9mIGVsZW1lbnRzIGluIHRoZSBhcnJheSBmb29fdGFibGUpLgoK
SG93ZXZlciwgaW4gdGhlIGZhaWxpbmcgY2FzZSwgZm9vX3RhYmxlIGlzIGEgc3RhdGljIGNvbnN0
IGFycmF5IGluZGV4ZWQKd2l0aCBjb25zdGFudHMgZnJvbSBhbiBlbnVtLCBhbmQgZm9vX3RvX3N0
cmluZygpIGlzIG9ubHkgZXZlciBjYWxsZWQKd2l0aCB2YXJpYWJsZXMgdGhhdCBhcmUgb25seSBl
dmVyIHNldCB0byBvbmUgb2YgdGhvc2UgZW51bSB2YWx1ZXMuCgpTaW5jZSAtT2Zhc3QgaXMgYWxz
byBleHBsaWNpdGx5IGRvY3VtZW50ZWQgYXMgYnJlYWtpbmcgb3RlaHJ3aXNlCmNvbmZvcm1hbnQg
cHJvZ3JhbXMsIHdlJ3JlIG5vdCBnb2luZyB0byBkZWJ1ZyBmdXJ0aGVyIHRoZSByZWFzb24gZm9y
IHRoZQpidWlsZCBmYWlsdXJlLgoKSW5zdGVhZCwganVzdCByZXZlcnQgdG8gdGhlIGJlc3QgYWx0
ZXJuYXRlIG9wdGltaXNhdGlvbiBsZXZlbC4gV2UgY2hvc2UKLU8zLCBhcyAtT2Zhc3QgaXMgYmFz
ZWQgb24gLU8zIHdpdGggYnJlYWtpbmcgb3B0aW1pc2F0aW9uIGZsYWdzLgoKV2l0aCAtTzMsIHRo
ZSBidWlsZCBzdWNjZWVkcy4KCkZpeGVzOgogICAgaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qu
b3JnL3Jlc3VsdHMvM2ZmYWE5YjNlY2FjYzZhYzMyNmJlNzgxOTZhZjFhZDYxM2YxOTVlZC8gKHNw
YXJjNjQpCiAgICBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy8zZjZhZTJl
NTAzZGQxNTM5ZTQyNDBmMzQ0ODY1ZGE0ODgxODc5MjA0LyAoYXJtKQogICAgaHR0cDovL2F1dG9i
dWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvNjhjMTcwNTY0OTBkNDQxYzdmODYyMzQ5ZTljN2U0
NzFiNDU3MDE2Mi8gKHBwYzY0KQogICAgLi4uCgpTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklO
IDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4KQ2M6IE5vcmJlcnQgTGFuZ2UgPG5vbGFuZ2U3OUBn
bWFpbC5jb20+CkNjOiBTZW4gSGFzdGluZ3MgPHNlbkBwaG9ib3NkcGwuY29tPgotLS0KIHBhY2th
Z2Uvc3lzdGVtZC9zeXN0ZW1kLm1rIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3lzdGVtZC9zeXN0ZW1kLm1rIGIvcGFja2Fn
ZS9zeXN0ZW1kL3N5c3RlbWQubWsKaW5kZXggMWQ3NDUyZGUxOS4uYjQyZjZhNTAyYiAxMDA2NDQK
LS0tIGEvcGFja2FnZS9zeXN0ZW1kL3N5c3RlbWQubWsKKysrIGIvcGFja2FnZS9zeXN0ZW1kL3N5
c3RlbWQubWsKQEAgLTkwLDYgKzkwLDExIEBAIFNZU1RFTURfQ09ORl9PUFRTICs9IFwKIAktRHVt
b3VudC1wYXRoPS91c3IvYmluL3Vtb3VudCBcCiAJLUR1dG1wPWZhbHNlCiAKK1NZU1RFTURfQ0ZM
QUdTID0gJChUQVJHRVRfQ0ZMQUdTKQoraWZlcSAoJChCUjJfT1BUSU1JWkVfRkFTVCkseSkKK1NZ
U1RFTURfQ0ZMQUdTICs9IC1PMworZW5kaWYKKwogaWZlcSAoJChCUjJfbmlvczIpLHkpCiAjIE5p
b3MyIGxkIGVtaXRzIHdhcm5pbmdzLCBtYWtlIHdhcm5pbmdzIG5vdCB0byBiZSB0cmVhdGVkIGFz
IGVycm9ycwogU1lTVEVNRF9MREZMQUdTID0gJChUQVJHRVRfTERGTEFHUykgLVdsLC0tbm8tZmF0
YWwtd2FybmluZ3MKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
