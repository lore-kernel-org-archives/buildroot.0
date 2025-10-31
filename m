Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59888CCF9FE
	for <buildroot@archiver.kernel.org>; Fri, 31 Oct 2025 13:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF9EC60F9E;
	Fri, 31 Oct 2025 13:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fbomFqUQlgwu; Fri, 31 Oct 2025 13:04:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B39C60FC9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B39C60FC9;
	Fri, 31 Oct 2025 13:04:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 231E5160
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 13:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08CB241839
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 13:04:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x4b9IimhXAhs for <buildroot@buildroot.org>;
 Fri, 31 Oct 2025 13:04:44 +0000 (UTC)
X-Greylist: delayed 392 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 31 Oct 2025 13:04:43 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 554A8417DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 554A8417DB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.154.239.218;
 helo=forward203d.mail.yandex.net; envelope-from=leo@yuriev.ru;
 receiver=<UNKNOWN> 
Received: from forward203d.mail.yandex.net (forward203d.mail.yandex.net
 [178.154.239.218])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 554A8417DB
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 13:04:43 +0000 (UTC)
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net
 [IPv6:2a02:6b8:c41:1300:1:45:d181:d101])
 by forward203d.mail.yandex.net (Yandex) with ESMTPS id 7872188220
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 15:58:16 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:3d48:0:640:52d7:0])
 by forward101d.mail.yandex.net (Yandex) with ESMTPS id D4A19C008E
 for <buildroot@buildroot.org>; Fri, 31 Oct 2025 15:58:06 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id 5wfYWtOMqSw0-5gABrE3m; 
 Fri, 31 Oct 2025 15:58:06 +0300
X-Yandex-Fwd: 1
To: buildroot@buildroot.org
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Date: Fri, 31 Oct 2025 15:57:53 +0300
Message-ID: <20251031125754.223451-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1761915486; bh=ecTDEP6aCX1V0hm9g9pzp4mZYDOAeVpn6KKPxG1Y4SE=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=H+0sN1R6qnYmWjWyrf3l4erxjHUq2vKH7q/3RX/P3Z7xc5Ze6cS0ew92fo8+9pgq6
 8UXPC3CGUTghF4BvEnLlHWGS6BL0oCnyioxvtNiFHJZ+kjCVGmdItpJZGSEzkJY5cf
 DwygsILsaEU4PfdnEwlrMOhl3bHG06HCsQiiUriw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=yuriev.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=yuriev.ru header.i=@yuriev.ru header.a=rsa-sha256
 header.s=mail header.b=H+0sN1R6
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-81.klg.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.13.9
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
From: =?utf-8?b?0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYpIHZpYSBi?=
 =?utf-8?q?uildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHN1cHBvcnRpbmcvYnVnZml4IHJlbGVhc2UgY2FsbGVkICLQmNChLTIiIChJUy0yKSBvZiB0
aGUgc3RhYmxlIGxpYm1kYnggYnJhbmNoLAppbiBtZW1vcnkgb2YgdGhlIG1vc3QgcG93ZXJmdWwg
U292aWV0IElTLTIgdGFuayBvZiB0aGUgR3JlYXQgUGF0cmlvdGljIFdhci4KCkJyaWVmbHksIHNp
bmNlIDAuMTMuODoKIC0gU3VwcG9ydCBvZiBIYXJtb255IE9TOwogLSBmaXhlZCBhc3NlcnRpb24g
KEJNSSA+IDApIGluIGRlYnVnZ2luZyBidWlsZHMgZm9yIDMyLWJpdCBwbGF0Zm9ybXM7CiAtIGZp
eGVkIHJlZ3Jlc3Npb24gb2YgREIgZ3Jvd3RoIChubyBzaHJpbmtpbmcpIGFmdGVyIHVzaW5nIGZh
bGxvY2F0ZSgpIGZvciBgU0lHQlVTYCBwcmV2ZW50aW9uOwogLSB3b3JrYXJvdW5kIHRvIGF2b2lk
IGBFQUdBSU5gIG9uIEFuZHJvaWQgYWZ0ZXIgYW4gYXBwbGljYXRpb24gcmVzdGFydDsKIC0gZ2l0
IGRpZmYnIHN0YXQ6IDI0IGZpbGVzIGNoYW5nZWQsIDI2MiBpbnNlcnRpb25zKCspLCAyMjYgZGVs
ZXRpb25zKC0pCgpCcmllZmx5LCBzaW5jZSAwLjEzLjc6CiAtIGVuYWJsZWQgb2xkIExpbnV4IGtl
cm5lbHMgc3RhcnRpbmcgZnJvbSAzLjE2OwogLSBmaXhlZCB1bmV4cGVjdGVkIGBTSUdCVVNgIGlz
IG5vdCBlbm91Z2ggc3BhY2UgaW4gYSBmaWxlc3lzdGVtOwogLSBmaXhlZCBpbmFwcHJvcHJpYXRl
L2lycmVsZXZhbnQgYE1EQlhfV0FOTkFfUkVDT1ZFUllgIHdoZW4gdGhlIERCIHNpemUgaXMgbm90
IHJvdW5kZWQgdG8gc3lzLWFsbG9jYXRpb24tZ3JhbnVsYXJpdHkuCiAtIGdpdCBkaWZmJyBzdGF0
OiA5IGZpbGVzIGNoYW5nZWQsIDEwMSBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKCkZv
ciBtb3JlIGluZm9ybWF0aW9uIHBsZWFzZSBzZWUgW0NoYW5nZUxvZyBpbiB0aGUgYHN0YWJsZWAg
YnJhbmNoXShodHRwczovL2dpdGh1Yi5jb20vZXJ0aGluay9saWJtZGJ4L2Jsb2Ivc3RhYmxlL0No
YW5nZUxvZy5tZCkuCgpTaWduZWQtb2ZmLWJ5OiDQm9C10L7QvdC40LQg0K7RgNGM0LXQsiAoTGVv
bmlkIFl1cmlldikgPGxlb0B5dXJpZXYucnU+Ci0tLQogcGFja2FnZS9saWJtZGJ4L0NvbmZpZy5p
biAgICB8IDQgKysrLQogcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaCB8IDIgKy0KIHBhY2th
Z2UvbGlibWRieC9saWJtZGJ4Lm1rICAgfCAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm1kYngvQ29u
ZmlnLmluIGIvcGFja2FnZS9saWJtZGJ4L0NvbmZpZy5pbgppbmRleCBhOWE0YWM0NWM1Li4xNjQw
ZGJkOWRlIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm1kYngvQ29uZmlnLmluCisrKyBiL3BhY2th
Z2UvbGlibWRieC9Db25maWcuaW4KQEAgLTExLDcgKzExLDkgQEAgY29uZmlnIEJSMl9QQUNLQUdF
X0xJQk1EQlgKIAkgIHNvbHV0aW9ucy4KIAogCSAgbGlibWRieCBzdXJwYXNzZXMgdGhlIGxlZ2Vu
ZGFyeSBMTURCIGluIHRlcm1zIG9mCi0JICByZWxpYWJpbGl0eSwgZmVhdHVyZXMgYW5kIHBlcmZv
cm1hbmNlLgorCSAgcmVsaWFiaWxpdHksIGZlYXR1cmVzIGFuZCBwZXJmb3JtYW5jZS4gQXQgdGhl
IGVuZCBvZiAyMDI0CisJICBsaWJtZGJ4IHdhcyBjaG9zZW4gYnkgYWxsIG1vZGVybiBFdGhlcmV1
bSBmcm9udGllcnMvbm9kZXMKKwkgIGFzIGEgc3RvcmFnZSBlbmdpbmUuCiAKIAkgIGh0dHBzOi8v
bGlibWRieC5kcWRrZmEucnUKIApkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngu
aGFzaCBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2gKaW5kZXggYWU1MjY2NzE2Yi4uNGE0
ZjMwMjAxNSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaAorKysgYi9w
YWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBIYXNoZXMgZnJv
bTogaHR0cHM6Ly9saWJtZGJ4LmRxZGtmYS5ydS9yZWxlYXNlL1NIQTI1NlNVTVMKLXNoYTI1NiAg
NTdkYjk4N2RlNmY3Y2NjNjZhNjZhZTI4YTdiZGE5ZjlmYmI0OGFjNWZiOTI3OWJjY2E5MmZkNWRl
MTMwNzVkMSAgbGlibWRieC1hbWFsZ2FtYXRlZC0wLjEzLjYudGFyLnh6CitzaGEyNTYgIDYzZDI2
MDhjOGY3YzIzMTg1YzBkMjdkODE3ZDQyZGQ3MjBlODQ5NzMyMjRmZmM1ODRjN2Y3YjUyMmY1ZjA2
ZmUgIGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4xMy45LnRhci54egogCiAjIExvY2FsbHkgY2FsY3Vs
YXRlZAogc2hhMjU2ICAwZDU0MmUwYzg4MDRlMzlhYTdmMzdlYjAwZGE1YTc2MjE0OWRjNjgyZDc4
Mjk0NTEyODdlMTFiOTM4ZTk0NTk0ICBMSUNFTlNFCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm1k
YngvbGlibWRieC5tayBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rCmluZGV4IGY0NjFkOTgz
OTcuLjYyODE3YTk4ZjggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rCisr
KyBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIAotTElCTURCWF9WRVJTSU9OID0gMC4xMy42CitMSUJNREJYX1ZF
UlNJT04gPSAwLjEzLjkKIExJQk1EQlhfU09VUkNFID0gbGlibWRieC1hbWFsZ2FtYXRlZC0kKExJ
Qk1EQlhfVkVSU0lPTikudGFyLnh6CiBMSUJNREJYX1NJVEUgPSBodHRwczovL2xpYm1kYnguZHFk
a2ZhLnJ1L3JlbGVhc2UKIExJQk1EQlhfU1VQUE9SVFNfSU5fU09VUkNFX0JVSUxEID0gTk8KLS0g
CjIuNTEuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
