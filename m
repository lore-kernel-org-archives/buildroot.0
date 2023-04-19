Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D629C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 10:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12D964159F;
	Wed, 19 Apr 2023 10:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12D964159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n3R9B5tvdvvk; Wed, 19 Apr 2023 10:33:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D536C40878;
	Wed, 19 Apr 2023 10:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D536C40878
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6DCA11C4356
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 10:33:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 896A340878
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 10:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 896A340878
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9PbfCg2R_1f for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 10:33:48 +0000 (UTC)
X-Greylist: delayed 00:05:56 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E9B2D408BB
Received: from forward200a.mail.yandex.net (forward200a.mail.yandex.net
 [178.154.239.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E9B2D408BB
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 10:33:47 +0000 (UTC)
Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d101])
 by forward200a.mail.yandex.net (Yandex) with ESMTP id A18944BF9C
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 13:27:51 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:799f:0:640:d5c0:0])
 by forward101b.mail.yandex.net (Yandex) with ESMTP id 5279E600BE
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 13:27:41 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id eRaxA0ODe8c0-WWWn5wQp; 
 Wed, 19 Apr 2023 13:27:40 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 13:27:25 +0300
Message-Id: <20230419102725.958315-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; t=1681900060; 
 bh=b6h5vwEgLurUYC88W1rjLr0js/MNQv5DguHk5+YSotQ=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=J7XVj69b4TXWYMKbpjmssipD1iduSy6iz+p/C+eZfKwdVfB+80bJsiDsKWJQtynh/
 v2lWEEMSzTDbkvEFziKbZp8s2CPy+jyM6Q6y2qLLjYnwWDHdV2Yfm4oDyY2hwSOKKp
 0jLHAYS1owQFtp46L/NYNumHQn4C4iQUbPlWPJrQ=
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-22.iva.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.12.5 "Dynamo"
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
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBpcyBzdGFibGUgcmVsZWFzZSBvZiBmcm9udHdhcmQgX2xpYm1kYnhfIGJyYW5jaCB3aXRo
IG5ldyBzdXBlcmlvciBmZWF0dXJlcwpvbiB0aGUgZGF5IG9mIDEwMCBhbm5pdmVyc2FyeSBvZiBV
U1NSJyDCq0R5bmFtb8K7IHNwb3J0cyBhbmQgZml0bmVzcyBzb2NpZXR5LgoKVGhlIGNvbXBsZXRl
IENoYW5nZUxvZzogaHR0cHM6Ly9naXRmbGljLnJ1L3Byb2plY3QvZXJ0aGluay9saWJtZGJ4L2Js
b2I/ZmlsZT1DaGFuZ2VMb2cubWQKClNpZ25lZC1vZmYtYnk6INCb0LXQvtC90LjQtCDQrtGA0YzQ
tdCyIChMZW9uaWQgWXVyaWV2KSA8bGVvQHl1cmlldi5ydT4KLS0tCiBwYWNrYWdlL2xpYm1kYngv
bGlibWRieC5oYXNoIHwgMiArLQogcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsgICB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2ggYi9wYWNrYWdlL2xpYm1kYngvbGli
bWRieC5oYXNoCmluZGV4IGIxYTI4OTFiOTEuLjdhNWIxOTk1MmUgMTAwNjQ0Ci0tLSBhL3BhY2th
Z2UvbGlibWRieC9saWJtZGJ4Lmhhc2gKKysrIGIvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFz
aApAQCAtMSw1ICsxLDUgQEAKICMgSGFzaGVzIGZyb206IGh0dHBzOi8vbGlibWRieC5kcWRrZmEu
cnUvcmVsZWFzZS9TSEEyNTZTVU1TCi1zaGEyNTYgIDk3YjAzOTY1YjViNjE3MjdkYzQyMzJjNTBj
Y2IxNzRjNjMyNDcwYTNkMjQ0MzhiM2M1MjMxNWJlZjZmYjQwMzMgIGxpYm1kYngtYW1hbGdhbWF0
ZWQtMC4xMS4xNC50YXIueHoKK3NoYTI1NiAgOWMzYWJhYWY5MDc5YTk1MThiYjcxNTU3MzQ4MTdh
MmUyODZmZmZlYTQ2ZjdjYzA4MjVkZmJkMWNmOTE3NDA3NSAgbGlibWRieC1hbWFsZ2FtYXRlZC0w
LjEyLjUudGFyLnh6CiAKICMgTG9jYWxseSBjYWxjdWxhdGVkCiBzaGEyNTYgIDMxMGZlMjVjODU4
YTk1MTVmYzhjOGQ3ZDFmMjRhNjdjOTQ5NmY4NGE5MWUwYTBlNDFlYTk5NzViMTM3MWU1NjkgIExJ
Q0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rIGIvcGFja2FnZS9s
aWJtZGJ4L2xpYm1kYngubWsKaW5kZXggNWU3OTk1ZjhjOC4uMGM2YzliY2I5ZiAxMDA2NDQKLS0t
IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsKKysrIGIvcGFja2FnZS9saWJtZGJ4L2xpYm1k
YngubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwogCi1MSUJN
REJYX1ZFUlNJT04gPSAwLjExLjE0CitMSUJNREJYX1ZFUlNJT04gPSAwLjEyLjUKIExJQk1EQlhf
U09VUkNFID0gbGlibWRieC1hbWFsZ2FtYXRlZC0kKExJQk1EQlhfVkVSU0lPTikudGFyLnh6CiBM
SUJNREJYX1NJVEUgPSBodHRwczovL2xpYm1kYnguZHFka2ZhLnJ1L3JlbGVhc2UKIExJQk1EQlhf
U1VQUE9SVFNfSU5fU09VUkNFX0JVSUxEID0gTk8KLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
