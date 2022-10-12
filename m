Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CEBCC4332F
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 20:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06F7640926;
	Wed, 12 Oct 2022 20:50:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 06F7640926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fGFQ3RokAxZO; Wed, 12 Oct 2022 20:50:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E43BF4092A;
	Wed, 12 Oct 2022 20:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E43BF4092A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36D971BF2AA
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 20:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A79354035D
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 20:50:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A79354035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hpurEDqVy9O9 for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 20:50:44 +0000 (UTC)
X-Greylist: delayed 00:07:41 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB781402F2
Received: from forward100p.mail.yandex.net (forward100p.mail.yandex.net
 [77.88.28.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB781402F2
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 20:50:43 +0000 (UTC)
Received: from forward102q.mail.yandex.net (forward102q.mail.yandex.net
 [IPv6:2a02:6b8:c0e:1ba:0:640:516:4e7d])
 by forward100p.mail.yandex.net (Yandex) with ESMTP id EDDF24F0BA7D
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 23:42:59 +0300 (MSK)
Received: from vla1-ef285479e348.qloud-c.yandex.net
 (vla1-ef285479e348.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:35a1:0:640:ef28:5479])
 by forward102q.mail.yandex.net (Yandex) with ESMTP id E9751BF00002
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 23:42:59 +0300 (MSK)
Received: by vla1-ef285479e348.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id rH9MYrwD9k-gxhSKJwe; Wed, 12 Oct 2022 23:42:59 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Date: Wed, 12 Oct 2022 23:42:46 +0300
Message-Id: <20221012204246.904703-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; t=1665607379; 
 bh=5WRai1/Yv3Z5ZgBXxs8rPdZdR6x/yNW7qt8qWxaiO84=;
 h=Message-Id:Date:Cc:Subject:To:From;
 b=gVf5rSEaKYo3xbzInkggbWXEa9MsRY6aQVXJBN/hR5WmpTxwgouqCIsgfAMU3shCk
 vbjnkV/Dx8ubUFevx72OA7FoAeyFwIvt8fQU1RnIhp177GV5zB1xe5zHGNzyzhsY9i
 YRu5AxStZpuoaXhocDtFkJBTLOTfRv8+MyWWqQF0=
X-Mailman-Original-Authentication-Results: vla1-ef285479e348.qloud-c.yandex.net; dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.11.12
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

VGhpcyBpcyBzdGFibGUgYnVnZml4IHJlbGVhc2Ugb2YgbGlibWRieC4gU28gaXQgaXMgcmVhc29u
YWJsZSB0byBiYWNrcG9ydAp0aGlzIHBhdGNoIHRvIGFsbCBhcHBsaWNhYmxlIHJlbGVhc2VzL2Jy
YW5jaGVzIG9mIEJ1aWxkcm9vdC4KClJlbGVhc2Ugbm90ZXMgZm9yIHYwLjExLjEyCi0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCgpGaXhlczoKCiAgLSBGaXhlZCBzdGF0aWMgYXNzZXJ0aW9uIGZh
aWx1cmUgb24gcGxhdGZvcm1zIHdoZXJlIHRoZSBgb2ZmX3RgIHR5cGUgaXMgd2lkZXIKICAgIHRo
YW4gY29ycmVzcG9uZGluZyBmaWVsZHMgb2YgYHN0cnVjdCBmbG9ja2AgdXNlZCBmb3IgZmlsZSBs
b2NraW5nIChiYWNrcG9ydCkuCiAgICBOb3cgX2xpYm1kYnhfIHdpbGwgdXNlIGBmY250bDY0KEZf
R0VUTEs2NC9GX1NFVExLNjQvRl9TRVRMS1c2NClgIGlmIGF2YWlsYWJsZS4KICAtIEZpeGVkIGFz
c2VydGlvbiBjaGVjayBpbnNpZGUgYHBhZ2VfcmV0aXJlX2V4KClgIChiYWNrcG9ydCkuCgpNaW5v
cnM6CgogIC0gRml4ZWQgYC1XaW50LXRvLXBvaW50ZXItY2FzdGAgd2FybmluZ3Mgd2hpbGUgY2Fz
dGluZyB0byBgbWRieF90aWRfdGAgKGJhY2twb3J0KS4KICAtIFJlbW92ZWQgbmVlZGxlc3MgYExv
Y2tGaWxlRXgoKWAgaW5zaWRlIGBtZGJ4X2Vudl9jb3B5KClgIChiYWNrcG9ydCkuCgpUaGUgY29t
cGxldGUgQ2hhbmdlTG9nOiBodHRwczovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1k
YngvYmxvYj9maWxlPUNoYW5nZUxvZy5tZAoKU2lnbmVkLW9mZi1ieTog0JvQtdC+0L3QuNC0INCu
0YDRjNC10LIgKExlb25pZCBZdXJpZXYpIDxsZW9AeXVyaWV2LnJ1PgotLS0KIHBhY2thZ2UvbGli
bWRieC9saWJtZGJ4Lmhhc2ggfCAyICstCiBwYWNrYWdlL2xpYm1kYngvbGlibWRieC5tayAgIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaCBiL3BhY2thZ2UvbGlibWRi
eC9saWJtZGJ4Lmhhc2gKaW5kZXggYzRkOWM4ZDhjZS4uNzlhZjE4OTYzMyAxMDA2NDQKLS0tIGEv
cGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaAorKysgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRi
eC5oYXNoCkBAIC0xLDUgKzEsNSBAQAogIyBIYXNoZXMgZnJvbTogaHR0cHM6Ly9saWJtZGJ4LmRx
ZGtmYS5ydS9yZWxlYXNlL1NIQTI1NlNVTVMKLXNoYTI1NiAgZDJjODFkYjcxNmEzM2QwMDdjYzc1
NzAyZWNmM2M0NWNmYjdjMzNhMjI2MWZiYWNjZWQ2OTQ1MjA0ZWNlMWI2NyAgbGlibWRieC1hbWFs
Z2FtYXRlZC0wLjExLjExLnRhci54egorc2hhMjU2ICBkZGU4ZjM2MjY1MDliYjc2NGIxN2M5M2Zl
MDYyOTM4OTYyNWNiNTAzNjI1MDJlYjFjMjdjYTIwODM0MmYzODk0ICBsaWJtZGJ4LWFtYWxnYW1h
dGVkLTAuMTEuMTIudGFyLnh6CiAKICMgTG9jYWxseSBjYWxjdWxhdGVkCiBzaGEyNTYgIDMxMGZl
MjVjODU4YTk1MTVmYzhjOGQ3ZDFmMjRhNjdjOTQ5NmY4NGE5MWUwYTBlNDFlYTk5NzViMTM3MWU1
NjkgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rIGIvcGFj
a2FnZS9saWJtZGJ4L2xpYm1kYngubWsKaW5kZXggMzU3YjFiYWM5ZS4uYWMxYTNhMGQ2ZiAxMDA2
NDQKLS0tIGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsKKysrIGIvcGFja2FnZS9saWJtZGJ4
L2xpYm1kYngubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwog
Ci1MSUJNREJYX1ZFUlNJT04gPSAwLjExLjExCitMSUJNREJYX1ZFUlNJT04gPSAwLjExLjEyCiBM
SUJNREJYX1NPVVJDRSA9IGxpYm1kYngtYW1hbGdhbWF0ZWQtJChMSUJNREJYX1ZFUlNJT04pLnRh
ci54egogTElCTURCWF9TSVRFID0gaHR0cHM6Ly9saWJtZGJ4LmRxZGtmYS5ydS9yZWxlYXNlCiBM
SUJNREJYX1NVUFBPUlRTX0lOX1NPVVJDRV9CVUlMRCA9IE5PCi0tIAoyLjM0LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
