Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B89C87FCB
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 13:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0E3C83CF4;
	Wed, 30 Jul 2025 13:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQDzy2XWUzf2; Wed, 30 Jul 2025 13:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94AD583CFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94AD583CFA;
	Wed, 30 Jul 2025 13:28:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08E95186
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 13:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE9F760DE2
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 13:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9bZp6obqHwdG for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 13:28:47 +0000 (UTC)
X-Greylist: delayed 461 seconds by postgrey-1.37 at util1-new.osuosl.org;
 Wed, 30 Jul 2025 13:28:46 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1C2960779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1C2960779
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:6b8:c02:900:1:45:d181:d200; helo=forward200b.mail.yandex.net;
 envelope-from=leo@yuriev.ru; receiver=<UNKNOWN> 
Received: from forward200b.mail.yandex.net (forward200b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1C2960779
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 13:28:46 +0000 (UTC)
Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d101])
 by forward200b.mail.yandex.net (Yandex) with ESMTPS id B5EB780D27
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 16:21:10 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c23:2f3c:0:640:7ca0:0])
 by forward101b.mail.yandex.net (Yandex) with ESMTPS id B9734C001D
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 16:21:00 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id xKaCNVoHhCg0-6gkNGzq4; 
 Wed, 30 Jul 2025 16:21:00 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Date: Wed, 30 Jul 2025 16:20:51 +0300
Message-ID: <20250730132052.5426-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1753881660; bh=MUScKdtZa90vEYCSjm8k8UKgnlDX+2Wj+l9eVMztcJ0=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=T1YUEN1yz65iY89absvTy5K8pdppEr9SzPANBXlH4OiXNQeBu4gVvvZB+K962zVZ6
 NRHwilTe1sOoiuojLYNHXaPQUMwbwPHFu2SMesA/rR3YJd5ieqIiIemRCHAwEEPdoA
 sDmeQff9J2RmJVNByLIEQSJ01wKV3H3OxkVloH5U=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yuriev.ru
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-87.sas.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.13.7
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyByZWxlYXNlIGNhbGxlZCAi0JTRgNGD0LbQsdCwIiAoRnJpZW5kc2hpcCkgb2YgdGhlIHN0
YWJsZSBsaWJtZGJ4IGJyYW5jaC4KClBsZWFzZSB2aXNpdCBodHRwczovL2xpYm1kYnguZHFka2Zh
LnJ1IGZvciBtb3JlIGluZm9ybWF0aW9uLCBjaGFuZ2Vsb2csCmNyZWRpdHMgYW5kIGFja25vd2xl
ZGdtZW50cywgZG9jdW1lbnRhdGlvbiwgQysrIEFQSSBkZXNjcmlwdGlvbiBhbmQKbGlua3MgdG8g
dGhlIG9yaWdpbmFsIGdpdCByZXBvIHdpdGggdGhlIHNvdXJjZSBjb2RlLiBRdWVzdGlvbnMsIGZl
ZWRiYWNrCmFuZCBzdWdnZXN0aW9ucyBhcmUgd2VsY29tZSB0byB0aGUgVGVsZWdyYW0nIGdyb3Vw
IGh0dHBzOi8vdC5tZS9saWJtZGJ4LgoKU2luY2UgMC4xMy54IGxpYm1kYnggaXMgbGljZW5zZWQg
dW5kZXIgdGhlIEFwYWNoZSAyLjAgTGljZW5zZS4KRm9yIG5vdGVzIGFib3V0IHRoZSBsaWNlbnNl
IGNoYW5nZSwgcGxlYXNlIHJlZmVyIHRvIHRoZSBDT1BZUklHSFQgZmlsZQp3aXRoaW4gb3JpZ2lu
YWwgbGlibWRieCBzb3VyY2UgY29kZSByZXBvc2l0b3J5Cmh0dHBzOi8vZ2l0ZmxpYy5ydS9wcm9q
ZWN0L2VydGhpbmsvbGlibWRieAoKU2lnbmVkLW9mZi1ieTog0JvQtdC+0L3QuNC0INCu0YDRjNC1
0LIgKExlb25pZCBZdXJpZXYpIDxsZW9AeXVyaWV2LnJ1PgotLS0KIHBhY2thZ2UvbGlibWRieC9s
aWJtZGJ4Lmhhc2ggfCAyICstCiBwYWNrYWdlL2xpYm1kYngvbGlibWRieC5tayAgIHwgMiArLQog
MiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaCBiL3BhY2thZ2UvbGlibWRieC9saWJt
ZGJ4Lmhhc2gKaW5kZXggYWU1MjY2NzE2Yi4uOGM3ZWZiMTg0YiAxMDA2NDQKLS0tIGEvcGFja2Fn
ZS9saWJtZGJ4L2xpYm1kYnguaGFzaAorKysgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNo
CkBAIC0xLDUgKzEsNSBAQAogIyBIYXNoZXMgZnJvbTogaHR0cHM6Ly9saWJtZGJ4LmRxZGtmYS5y
dS9yZWxlYXNlL1NIQTI1NlNVTVMKLXNoYTI1NiAgNTdkYjk4N2RlNmY3Y2NjNjZhNjZhZTI4YTdi
ZGE5ZjlmYmI0OGFjNWZiOTI3OWJjY2E5MmZkNWRlMTMwNzVkMSAgbGlibWRieC1hbWFsZ2FtYXRl
ZC0wLjEzLjYudGFyLnh6CitzaGEyNTYgIGQwMGMxMjg3ZWM2YmJjMzY2MzYzY2NkZDNlZWE5N2Jk
NDcwY2NiNWNjMTAyZDU2YjM0MWY4NGE5ZmJhN2U4ZTkgIGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4x
My43LnRhci54egogCiAjIExvY2FsbHkgY2FsY3VsYXRlZAogc2hhMjU2ICAwZDU0MmUwYzg4MDRl
MzlhYTdmMzdlYjAwZGE1YTc2MjE0OWRjNjgyZDc4Mjk0NTEyODdlMTFiOTM4ZTk0NTk0ICBMSUNF
TlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tayBiL3BhY2thZ2UvbGli
bWRieC9saWJtZGJ4Lm1rCmluZGV4IGY0NjFkOTgzOTcuLmJiYjM3ZjIxYTYgMTAwNjQ0Ci0tLSBh
L3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rCisrKyBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4
Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTElCTURC
WF9WRVJTSU9OID0gMC4xMy42CitMSUJNREJYX1ZFUlNJT04gPSAwLjEzLjcKIExJQk1EQlhfU09V
UkNFID0gbGlibWRieC1hbWFsZ2FtYXRlZC0kKExJQk1EQlhfVkVSU0lPTikudGFyLnh6CiBMSUJN
REJYX1NJVEUgPSBodHRwczovL2xpYm1kYnguZHFka2ZhLnJ1L3JlbGVhc2UKIExJQk1EQlhfU1VQ
UE9SVFNfSU5fU09VUkNFX0JVSUxEID0gTk8KLS0gCjIuNTAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
