Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF9FE77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 17:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9742580EA3;
	Sun, 12 Jan 2025 17:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-HcWd-Hb5or; Sun, 12 Jan 2025 17:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 978C180AF2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 978C180AF2;
	Sun, 12 Jan 2025 17:33:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8842B68
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 17:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68E3380AF2
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 17:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p3tZ6Ptp7n4j for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 17:33:53 +0000 (UTC)
X-Greylist: delayed 538 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 12 Jan 2025 17:33:51 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6BEF8050E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6BEF8050E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:6b8:c41:1300:1:45:d181:d204; helo=forward204d.mail.yandex.net;
 envelope-from=leo@yuriev.ru; receiver=<UNKNOWN> 
Received: from forward204d.mail.yandex.net (forward204d.mail.yandex.net
 [IPv6:2a02:6b8:c41:1300:1:45:d181:d204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6BEF8050E
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 17:33:51 +0000 (UTC)
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net
 [IPv6:2a02:6b8:c41:1300:1:45:d181:d101])
 by forward204d.mail.yandex.net (Yandex) with ESMTPS id 552CE63A75
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 20:18:57 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net
 [IPv6:2a02:6b8:c42:4caf:0:640:9790:0])
 by forward101d.mail.yandex.net (Yandex) with ESMTPS id 78C4B60B1C
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 20:18:47 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id kIR10RMOpKo0-JVZEIYgS; 
 Sun, 12 Jan 2025 20:18:46 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Date: Sun, 12 Jan 2025 20:18:29 +0300
Message-ID: <20250112171832.2886452-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1736702327; bh=MkGZN652pt+x93T9ccatkbAtjEMsFhNXu0AfecBP6F4=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=P4hngB63E0gB2BEyFV1iYe36K4KuoGwBKD0E7rHWRBJQ3ZoQ08bStLU406dzNxluU
 4sviUdwpBCG3a4bV99QnQm/5sYHzjD0n94BpiApUTajNZfzlKnFsCeFGyHTu1PsfUz
 IhzHIGWChmZ0+oIx7LTULGnjdikspQRS1pCCV2DM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yuriev.ru
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-77.klg.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.13.3
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

VGhpcyBpcyBzdGFibGUgcmVsZWFzZSBvZiBmcm9udHdhcmQgX2xpYm1kYnhfIGJyYW5jaCB3aXRo
IG5ldyBzdXBlcmlvciBmZWF0dXJlcwpvbiB0aGUgYmlydGhkYXkgYW5kIGluIG1lbW9yeSBvZiBT
ZXJnZWkgS29yb2xldiB3aG8gd2FzIHRoZSBsZWFkIFNvdmlldCByb2NrZXQKZW5naW5lZXIgYW5k
IHNwYWNlY3JhZnQgZGVzaWduZXIuCgpUaGUgY29tcGxldGUgQ2hhbmdlTG9nOiBodHRwczovL2dp
dGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvYmxvYj9maWxlPUNoYW5nZUxvZy5tZAoK
U2lnbmVkLW9mZi1ieTog0JvQtdC+0L3QuNC0INCu0YDRjNC10LIgKExlb25pZCBZdXJpZXYpIDxs
ZW9AeXVyaWV2LnJ1PgotLS0KIHBhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2ggfCA0ICsrLS0K
IHBhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm1k
YngvbGlibWRieC5oYXNoIGIvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaAppbmRleCAyMjJl
N2NhZjVjLi4xYzkxYWEyZjkwIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5o
YXNoCisrKyBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2gKQEAgLTEsNSArMSw1IEBACiAj
IEhhc2hlcyBmcm9tOiBodHRwczovL2xpYm1kYnguZHFka2ZhLnJ1L3JlbGVhc2UvU0hBMjU2U1VN
Uwotc2hhMjU2ICAxOWMwZWIzM2UxZWQ0M2NhMmE5NGRjZWIwNmRkMzE5NDY0MzJkMTZmMzBhOTc1
MWQzNzAxYzY3ZWZhMjJlYjFhICBsaWJtZGJ4LWFtYWxnYW1hdGVkLTAuMTIuMTIudGFyLnh6Citz
aGEyNTYgIDJlNDI1MDVmMWNlYjU3OTQ1NTY5ZGIzYzFhNWRiOWI1MjE2ZDhmNzJkYTdjNzVjMjQw
ZmY4MTE5NmY4ZTlhMGIgIGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4xMy4zLnRhci54egogCiAjIExv
Y2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICAzMTBmZTI1Yzg1OGE5NTE1ZmM4YzhkN2QxZjI0YTY3
Yzk0OTZmODRhOTFlMGEwZTQxZWE5OTc1YjEzNzFlNTY5ICBMSUNFTlNFCitzaGEyNTYgIDBkNTQy
ZTBjODgwNGUzOWFhN2YzN2ViMDBkYTVhNzYyMTQ5ZGM2ODJkNzgyOTQ1MTI4N2UxMWI5MzhlOTQ1
OTQgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rIGIvcGFj
a2FnZS9saWJtZGJ4L2xpYm1kYngubWsKaW5kZXggYzczNjk0NWU5Mi4uYTBmMzRkYzk2NiAxMDA2
NDQKLS0tIGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsKKysrIGIvcGFja2FnZS9saWJtZGJ4
L2xpYm1kYngubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwog
Ci1MSUJNREJYX1ZFUlNJT04gPSAwLjEyLjEyCitMSUJNREJYX1ZFUlNJT04gPSAwLjEzLjMKIExJ
Qk1EQlhfU09VUkNFID0gbGlibWRieC1hbWFsZ2FtYXRlZC0kKExJQk1EQlhfVkVSU0lPTikudGFy
Lnh6CiBMSUJNREJYX1NJVEUgPSBodHRwczovL2xpYm1kYnguZHFka2ZhLnJ1L3JlbGVhc2UKIExJ
Qk1EQlhfU1VQUE9SVFNfSU5fU09VUkNFX0JVSUxEID0gTk8KLS0gCjIuNDcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
