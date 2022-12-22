Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B38FC4332F
	for <buildroot@archiver.kernel.org>; Thu, 22 Dec 2022 22:29:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8FD1404F4;
	Thu, 22 Dec 2022 22:28:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8FD1404F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d9N1e1p4YxbJ; Thu, 22 Dec 2022 22:28:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1973C40545;
	Thu, 22 Dec 2022 22:28:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1973C40545
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AAE861BF357
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 22:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 934E040438
 for <buildroot@lists.busybox.net>; Thu, 22 Dec 2022 22:28:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 934E040438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6OgwbGLnzLjh for <buildroot@lists.busybox.net>;
 Thu, 22 Dec 2022 22:28:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 853DB40112
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 853DB40112
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 22:28:54 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m14so3015435wrh.7
 for <buildroot@buildroot.org>; Thu, 22 Dec 2022 14:28:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GZcuQ5f0Ly52rNdLlxNoc3Vu77cJOj3E6i6u3AcH8iM=;
 b=GroSzl9pVVivCRjYQdF3lOLHjwL+RCRkTZSJfrVetStJCwZSlU8nUqU1E03X5sn19K
 JJZ79mMS6yxmVHq1BNz0I9bB4w1eFo/EuJLxQXWQSBtVAha8o7eLTgMFon59mULaAB72
 c0HyYIf+8NYdJV8zWZHXDR5AMRThugyplq/PD4Vyn/3EUqFPSmipDsn6x3D3XaD7W2pG
 Aulq3eYomkRFUqIbF0LxQEQM/arYerYNlVxH+mVAmkeKg/8wy8woo9Y/fZSc4+OBcOoH
 ZPTXaasLiD58Umsc8RAKH/C0Ubpm6GlhqiFltGuaWx1M5LBRGEfA7iCuyHBFus6psPmk
 N1gA==
X-Gm-Message-State: AFqh2kpE/L2YLL18Wsqhn7GoX7zIDDYbA+tVFcYscN1bCzjzDGskv84c
 khCJFIxZTmF1eFV/g5jDt7CaWnyW3ro=
X-Google-Smtp-Source: AMrXdXsNtl4ajCuZvviMfAWokuoTdrfR1wWObpJ9iKUIkUtzVFxdVrmJ1DigS2z4e79rmtlmn1fZxg==
X-Received: by 2002:adf:f9d1:0:b0:254:3dcb:dbb3 with SMTP id
 w17-20020adff9d1000000b002543dcbdbb3mr4652584wrr.53.1671748132219; 
 Thu, 22 Dec 2022 14:28:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n12-20020a5d51cc000000b00241da0e018dsm1593701wrv.29.2022.12.22.14.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 14:28:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 22 Dec 2022 23:28:40 +0100
Message-Id: <20221222222840.51146-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GZcuQ5f0Ly52rNdLlxNoc3Vu77cJOj3E6i6u3AcH8iM=;
 b=goPLa0p2UFhujWZYSVzUiR8M4OJ+6xlJ+AzjmoNMava5N8tKZapJ7N89MZ2KWVHK10
 t7d7DShqsrCdEUfMFMZ715phLaucAErZay7b4Pjj5n/B6fmZJdl22Q72uFqfdulNm8iC
 T5UCaa6A2edcL7o2giJqUpPYa6BfvAQN6Yfn3d5lVXVyzQFrC++o6Y58VPFqLpkAlSFR
 NsukLA2iScZwPPFzC/6UgXrZ2Cm2tIrtWkGSrF80ueXx6B+iVzkSolxmj2v1cJzP5LLp
 a9wgwC9TQYQUj6f2AZVQofPbhEKEvPRnK6VFv6eKVpFgCRC1HwCxxka5NA/86/TplGZG
 1tSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=goPLa0p2
Subject: [Buildroot] [PATCH 1/1] package/xtables-addons: bump to version 3.22
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

U3VwcG9ydCBmb3IgdXAgdG8gTGludXggNi4xIGJ5IGZpeGluZyB0aGUgZm9sbG93aW5nIGJ1aWxk
IGZhaWx1cmU6CgovdG1wL2luc3RhbmNlLTUvb3V0cHV0LTEvYnVpbGQveHRhYmxlcy1hZGRvbnMt
My4yMS9leHRlbnNpb25zL3h0X0NIQU9TLmM6IEluIGZ1bmN0aW9uIOKAmHh0X2NoYW9zX3RvdGFs
4oCZOgovdG1wL2luc3RhbmNlLTUvb3V0cHV0LTEvYnVpbGQveHRhYmxlcy1hZGRvbnMtMy4yMS9l
eHRlbnNpb25zL3h0X0NIQU9TLmM6NzA6NDY6IGVycm9yOiBpbXBsaWNpdCBkZWNsYXJhdGlvbiBv
ZiBmdW5jdGlvbiDigJhwcmFuZG9tX3UzMuKAmTsgZGlkIHlvdSBtZWFuIOKAmHByYW5kb21fdTMy
X21heOKAmT8gWy1XZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tZGVjbGFyYXRpb25dCiAgIDcwIHwg
ICAgICAgICBpZiAoIXJldCB8fCBob3Rkcm9wIHx8ICh1bnNpZ25lZCBpbnQpcHJhbmRvbV91MzIo
KSA+IGRlbHVkZV9wZXJjZW50YWdlKQogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+CiAgICAgIHwgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJhbmRvbV91MzJfbWF4CgpodHRwczovL2Zvc3Np
ZXMub3JnL2xpbnV4L3ByaXZhdC94dGFibGVzLWFkZG9ucy0zLjIyLnRhci54ei94dGFibGVzLWFk
ZG9ucy0zLjIyL2RvYy9jaGFuZ2Vsb2cucnN0CgpGaXhlczoKIC0gaHR0cDovL2F1dG9idWlsZC5i
dWlsZHJvb3Qub3JnL3Jlc3VsdHMvNDU2NGJhODg4MTU2NzEwODE5ZjZiZDg2MTE3ZTBjMGJkZDUx
M2RiYQoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBn
bWFpbC5jb20+Ci0tLQogcGFja2FnZS94dGFibGVzLWFkZG9ucy94dGFibGVzLWFkZG9ucy5oYXNo
IHwgMiArLQogcGFja2FnZS94dGFibGVzLWFkZG9ucy94dGFibGVzLWFkZG9ucy5tayAgIHwgMiAr
LQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvcGFja2FnZS94dGFibGVzLWFkZG9ucy94dGFibGVzLWFkZG9ucy5oYXNoIGIvcGFj
a2FnZS94dGFibGVzLWFkZG9ucy94dGFibGVzLWFkZG9ucy5oYXNoCmluZGV4IDBkMjQzNGVlYjEu
Ljg0MGEzMWY5NDcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UveHRhYmxlcy1hZGRvbnMveHRhYmxlcy1h
ZGRvbnMuaGFzaAorKysgYi9wYWNrYWdlL3h0YWJsZXMtYWRkb25zL3h0YWJsZXMtYWRkb25zLmhh
c2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICAyZTA5YWMx
MjlhMTRmNWU5YzIzYjExNWViY2RmZmY0YWE4NGUyYWViYTEyNjhkYmRmMzliMmQ3NTJiZDcxZTE5
ICB4dGFibGVzLWFkZG9ucy0zLjIxLnRhci54egorc2hhMjU2ICBmYWExNmEyNzE2NjI3NWFmYmZl
OGRmNjA1ZjU1YzNhODFhYzY5M2JmMTlkYTY3NGQ0NWNlZGVkNDEzN2FlMjE3ICB4dGFibGVzLWFk
ZG9ucy0zLjIyLnRhci54egogc2hhMjU2ICBhYjE1ZmQ1MjZiZDhkZDE4YTllNzdlYmMxMzk2NTZi
ZjRkMzNlOTdmYzcyMzhjZDExYmY2MGUyYjliODY2NmM2ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3h0YWJsZXMtYWRkb25zL3h0YWJsZXMtYWRkb25zLm1rIGIvcGFja2FnZS94dGFibGVz
LWFkZG9ucy94dGFibGVzLWFkZG9ucy5tawppbmRleCA4M2NjMzI2NmM0Li43N2RjZmQ3NDFjIDEw
MDY0NAotLS0gYS9wYWNrYWdlL3h0YWJsZXMtYWRkb25zL3h0YWJsZXMtYWRkb25zLm1rCisrKyBi
L3BhY2thZ2UveHRhYmxlcy1hZGRvbnMveHRhYmxlcy1hZGRvbnMubWsKQEAgLTQsNyArNCw3IEBA
CiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1YVEFCTEVTX0FERE9OU19WRVJTSU9OID0g
My4yMQorWFRBQkxFU19BRERPTlNfVkVSU0lPTiA9IDMuMjIKIFhUQUJMRVNfQURET05TX1NPVVJD
RSA9IHh0YWJsZXMtYWRkb25zLSQoWFRBQkxFU19BRERPTlNfVkVSU0lPTikudGFyLnh6CiBYVEFC
TEVTX0FERE9OU19TSVRFID0gaHR0cHM6Ly9pbmFpLmRlL2ZpbGVzL3h0YWJsZXMtYWRkb25zCiBY
VEFCTEVTX0FERE9OU19ERVBFTkRFTkNJRVMgPSBpcHRhYmxlcyBsaW51eCBob3N0LXBrZ2NvbmYK
LS0gCjIuMzUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczov
L2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
