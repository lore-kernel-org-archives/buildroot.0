Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50880C369AB
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 08:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB87583B92;
	Fri, 18 Apr 2025 08:05:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPJupakcOuCx; Fri, 18 Apr 2025 08:05:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD44B83B04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD44B83B04;
	Fri, 18 Apr 2025 08:05:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B33E869
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97B6141B12
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:05:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbmaLeCRd51l for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 08:05:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D375B411C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D375B411C6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D375B411C6
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 08:05:45 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([213.196.211.137]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MVvPD-1uXYih3i7R-00Pofl; Fri, 18
 Apr 2025 10:05:42 +0200
Date: Fri, 18 Apr 2025 10:03:44 +0200
Message-Id: <20250418-ffmpt-v1-0-5540e2621486@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGAHAmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE0ML3bS03IISXUsLs7RUi1QDA6NEQyWg2oKi1LTMCrA50bG1tQDWUoy
 pVwAAAA==
X-Change-ID: 20250418-ffmpt-986fe8e002a1
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>, Bernd Kuhls <bernd@kuhls.net>, 
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744963541; l=482;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=rbmp/gkj6MONNJFdFCA6ip223D9uiPL6D8vFbycJy9M=;
 b=9+mdKah+ZqO/cQg8rw7S3JfRNUSpPN25eSWfMxVgQ8qSUdTjkLZB2ruJTpGYPmV2bWBErX3Q9
 obXp5Ik6R5+DQXU2PbcHOcNusyZJtIqpoKXnR74NSa8rVEizZO/Pa/a
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:ehBRTziFrtdfWgehxnyi5hbNVtPPnW/dPlye+OEMJar1heO+I0k
 t/tVulHbqO01Hi9fnZWvK9e8Xt6kwof8INs4XNuwId9RDB2x+Pli5spw3NEen1dn0ACkjIV
 RO7INwIx/JBAUl+Ofgk8MIeOh3ACjKVC/WeHaa89M0j7OOkjkaWXjQ+TaMXfpFJWIUXwxNV
 Ds6buwaRBKgDt3whwPE8g==
UI-OutboundReport: notjunk:1;M01:P0:mU+8LzJg4ng=;R9h1VM+YDP4Xu06i/VJI4tlWpDT
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1744963543; x=1745568343; i=j.neuschaefer@gmx.net;
 bh=00LRoxM16LJVDV4Rt/ISbnhxEVEfSDo/YUuJpki1dxM=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Cy7jblffN6X7Eu15w5eq863D1p5/0Enj4EghsAUbd+1VV/8MZVKyCCCD2PqkOUYn
 Z1LpHTjUf/hOqK+sIcmwSz8LQyjp8fp9qlkDKk94l0fmDCJffaqVa6Dbgk4H03d2X
 fpypcZM+kyiJQn4OwIQDAHpWRNsNRtO/xx6b+zyYQJlnsk505tRYVlSYjtmTSImIz
 AIBIW5Mrd6IBpZiNbmocvaYHUNW+lwtSJRXfEcKt4UowIpoomn01zVQ2H3650xWiB
 kinfx06DQbfxUZmkWeFteOG/0OVhpnpdlgeieqmiZHqJVkXPLmgod44dWxMEmK8rE
 FBgXXQvyXM9Af0MNTA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Cy7jblff
Subject: [Buildroot] [PATCH 0/2] Enable libopenmpt support in ffmpeg package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0t
CkouIE5ldXNjaMOkZmVyICgyKToKICAgICAgcGFja2FnZS9saWJvcGVubXB0OiBpbnN0YWxsIHRv
IHN0YWdpbmcgdG8gZml4IHBrZy1jb25maWcKICAgICAgcGFja2FnZS9mZm1wZWc6IGFkZCBzdXBw
b3J0IGZvciBsaWJvcGVubXB0CgogcGFja2FnZS9mZm1wZWcvZmZtcGVnLm1rICAgICAgICAgfCA3
ICsrKysrKysKIHBhY2thZ2UvbGlib3Blbm1wdC9saWJvcGVubXB0Lm1rIHwgMSArCiAyIGZpbGVz
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQotLS0KYmFzZS1jb21taXQ6IGViZGY3ZDVmZTIxMGVh
NzE3NjZjY2NhYTFmM2YwYjExMGE5ODcxNDkKY2hhbmdlLWlkOiAyMDI1MDQxOC1mZm1wdC05ODZm
ZThlMDAyYTEKCkJlc3QgcmVnYXJkcywKLS0gCkouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVy
QGdteC5uZXQ+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
