Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77175EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 14:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE10B414FA;
	Sun, 18 Jun 2023 14:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE10B414FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDJu1mVifVkn; Sun, 18 Jun 2023 14:52:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FA164091C;
	Sun, 18 Jun 2023 14:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FA164091C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8912F1BF281
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 14:52:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56E7A4150F
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 14:52:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56E7A4150F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FK0YMIYB4FHr for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 14:52:45 +0000 (UTC)
X-Greylist: delayed 00:07:52 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91FCE40905
Received: from forward200b.mail.yandex.net (forward200b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91FCE40905
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 14:52:44 +0000 (UTC)
Received: from forward100c.mail.yandex.net (forward100c.mail.yandex.net
 [IPv6:2a02:6b8:c03:500:1:45:d181:d100])
 by forward200b.mail.yandex.net (Yandex) with ESMTP id EFE5F665FE
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 17:44:46 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-37.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-37.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:601e:0:640:1bb:0])
 by forward100c.mail.yandex.net (Yandex) with ESMTP id 254FB6009F
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 17:44:38 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-37.myt.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id aigqBVXDXKo0-kN9Ab2Yw; 
 Sun, 18 Jun 2023 17:44:37 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Sun, 18 Jun 2023 17:44:24 +0300
Message-Id: <20230618144425.105081-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; t=1687099477; 
 bh=XKNX1snJVWi3L4/o1XWxIni9JwFb08wBfNf7dfiD9DA=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=t7eJ0IUByDqePh78oDaL5FSbxU/DEDxU0+FGe87l5OmMEFq9N977W9TJMV3oUXH6o
 Astt+zcHt3pl56gL5qp5r3LGU2kB9q/MpgO9Kfsv/pnPufkfz7Y5Ll981SHtzFjFmj
 KSYZs3wWjQ5nbWIOGEjwZYoKLEcAUwr1p0ixwexs=
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-37.myt.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.12.7 "Artek"
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

VGhpcyBpcyBidWdmaXggcmVsZWFzZSBvZiBzdGFibGUgbGlibWRieCBicmFuY2gsCm9uIHRoZSBk
YXkgb2YgaW50ZXJuYXRpb25hbCBjaGlsZHJlbidzIGNhbXAgwqtBcnRla8K7LgoKSXQgaXMgcmVh
c29uYWJsZSB0byBiYWNrcG9ydCB0aGlzIHBhdGNoIHRvIGFsbCBhcHBsaWNhYmxlIHJlbGVhc2Vz
L2JyYW5jaGVzIG9mIEJ1aWxkcm9vdC4KClRoZSBtb3N0IHNpZ25pZmljYW50IGZpeGVzIG9mIHYw
LjEyLjc6CiAtIGFkZGVkIHdvcmthcm91bmQgZm9yIGJ1aWxkIGlzc3VlcyB3aXRoIG1vZGVybiBH
Q0MgdXNpbmcgYC1tMzIgLWFyY2g9aTY4NiAtT2Zhc3RgLgogLSBmaXhlZCB0aGUgY2F1c2Ugb2Yg
dGhlIGZhbHNlLXBvc2l0aXZlIHdhcm5pbmcgb2YgbW9kZXJuIEdDQyBpbiB0aGUgQysrIEFQSS4K
IC0gcmVmaW5lZCBEQiBvcGVuaW5nIGluICJyZWNvdmVyeSIgbW9kZSBhbmQgc3dpdGNoaW5nIHRv
IGEgZ2l2ZW4gbWV0YS1wYWdlLgoKVGhlIGNvbXBsZXRlIENoYW5nZUxvZzogaHR0cHM6Ly9naXRm
bGljLnJ1L3Byb2plY3QvZXJ0aGluay9saWJtZGJ4L2Jsb2I/ZmlsZT1DaGFuZ2VMb2cubWQKClNp
Z25lZC1vZmYtYnk6INCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9uaWQgWXVyaWV2KSA8bGVv
QHl1cmlldi5ydT4KLS0tCiBwYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoIHwgMiArLQogcGFj
a2FnZS9saWJtZGJ4L2xpYm1kYngubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9s
aWJtZGJ4Lmhhc2ggYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoCmluZGV4IDdhNWIxOTk1
MmUuLjBmNTkwOGNmMzggMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2gK
KysrIGIvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaApAQCAtMSw1ICsxLDUgQEAKICMgSGFz
aGVzIGZyb206IGh0dHBzOi8vbGlibWRieC5kcWRrZmEucnUvcmVsZWFzZS9TSEEyNTZTVU1TCi1z
aGEyNTYgIDljM2FiYWFmOTA3OWE5NTE4YmI3MTU1NzM0ODE3YTJlMjg2ZmZmZWE0NmY3Y2MwODI1
ZGZiZDFjZjkxNzQwNzUgIGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4xMi41LnRhci54egorc2hhMjU2
ICBlMTUwNTQxYzJiMDc1NThiOTYxZTc1NGU4ZTkxNzFiZjFhYTk3NGM4ZTkzNmY2MmJkMzc1NjA2
ZjdkNTUwNjY3ICBsaWJtZGJ4LWFtYWxnYW1hdGVkLTAuMTIuNy50YXIueHoKIAogIyBMb2NhbGx5
IGNhbGN1bGF0ZWQKIHNoYTI1NiAgMzEwZmUyNWM4NThhOTUxNWZjOGM4ZDdkMWYyNGE2N2M5NDk2
Zjg0YTkxZTBhMGU0MWVhOTk3NWIxMzcxZTU2OSAgTElDRU5TRQpkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9saWJtZGJ4L2xpYm1kYngubWsgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tawppbmRleCAw
YzZjOWJjYjlmLi44NGI1ODYzMmI2IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm1kYngvbGlibWRi
eC5taworKysgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tawpAQCAtNCw3ICs0LDcgQEAKICMK
ICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUxJQk1EQlhfVkVSU0lPTiA9IDAuMTIuNQorTElC
TURCWF9WRVJTSU9OID0gMC4xMi43CiBMSUJNREJYX1NPVVJDRSA9IGxpYm1kYngtYW1hbGdhbWF0
ZWQtJChMSUJNREJYX1ZFUlNJT04pLnRhci54egogTElCTURCWF9TSVRFID0gaHR0cHM6Ly9saWJt
ZGJ4LmRxZGtmYS5ydS9yZWxlYXNlCiBMSUJNREJYX1NVUFBPUlRTX0lOX1NPVVJDRV9CVUlMRCA9
IE5PCi0tIAoyLjQwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
