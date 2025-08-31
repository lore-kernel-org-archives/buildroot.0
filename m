Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6110CA0FE8
	for <buildroot@archiver.kernel.org>; Sun, 31 Aug 2025 13:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68BBA610E2;
	Sun, 31 Aug 2025 13:38:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gAwq1bBK8f3L; Sun, 31 Aug 2025 13:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 720D8610D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 720D8610D8;
	Sun, 31 Aug 2025 13:38:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4075A10E
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:38:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26AF240D7B
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:38:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6bl9D5Gqslkt for <buildroot@buildroot.org>;
 Sun, 31 Aug 2025 13:38:19 +0000 (UTC)
X-Greylist: delayed 385 seconds by postgrey-1.37 at util1.osuosl.org;
 Sun, 31 Aug 2025 13:38:18 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8C30740D5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C30740D5B
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:6b8:c02:900:1:45:d181:d205; helo=forward205b.mail.yandex.net;
 envelope-from=leo@yuriev.ru; receiver=<UNKNOWN> 
Received: from forward205b.mail.yandex.net (forward205b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d205])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C30740D5B
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 13:38:18 +0000 (UTC)
Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d100])
 by forward205b.mail.yandex.net (Yandex) with ESMTPS id 28BB182B66
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 16:31:59 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c23:143b:0:640:90e9:0])
 by forward100b.mail.yandex.net (Yandex) with ESMTPS id 9DAD68063C
 for <buildroot@buildroot.org>; Sun, 31 Aug 2025 16:31:47 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id jVdiWhBMTa60-gRKyK7gk; 
 Sun, 31 Aug 2025 16:31:46 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Date: Sun, 31 Aug 2025 16:31:37 +0300
Message-ID: <20250831133138.13736-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1756647106; bh=tM1PHwJh0RVoSPLAZifPXy9CiU7n0hqpPJs30X35qoo=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=hbdovMAQpuIUDCt9g1+4KztZrd2yZWfA+Zem3gGmjnEDEUjv/O8EiGL4WoQYS3FpX
 LyaxdJIZwhBoH1vTk9UXAuzLvPewJRU2my8aM3Id0c9S4CgJUsDUj3VpEfT4n+Ck38
 ttc/EDIDRw3drcCIACHh6hizysvO6a2qVJ5jWp1I=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yuriev.ru
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-67.sas.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.13.8
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

VGhlIHN1cHBvcnRpbmcvYnVnZml4IHJlbGVhc2UgY2FsbGVkIDAuMTMuOCAi0JLRgdC10L7QsdGD
0YciICh2YHNlYWJvb2NoKSBvZiB0aGUgc3RhYmxlIGxpYm1kYnggYnJhbmNoLApvbiB0aGUgZGF5
IG9mIHRoZSAxMDB0aCBhbm5pdmVyc2FyeSBvZiB0aGUgUmVzb2x1dGlvbiBvZiBSdXNzaWFuIENl
bnRyYWwgRXhlY3V0aXZlIENvbW1pdHRlZSBvbiBjb21tb24gZnJlZSBwcmltYXJ5IGVkdWNhdGlv
bi4KCkJyaWVmbHk6CiAtIGVuYWJsZWQgb2xkIExpbnV4IGtlcm5lbHMgc3RhcnRpbmcgZnJvbSAz
LjE2OwogLSBmaXhlZCB1bmV4cGVjdGVkIGBTSUdCVVNgIGlzIG5vdCBlbm91Z2ggc3BhY2UgaW4g
YSBmaWxlc3lzdGVtOwogLSBmaXhlZCBpbmFwcHJvcHJpYXRlL2lycmVsZXZhbnQgYE1EQlhfV0FO
TkFfUkVDT1ZFUllgIHdoZW4gdGhlIERCIHNpemUgaXMgbm90IHJvdW5kZWQgdG8gc3lzLWFsbG9j
YXRpb24tZ3JhbnVsYXJpdHkuCiAtIGdpdCBkaWZmJyBzdGF0OiA5IGZpbGVzIGNoYW5nZWQsIDEw
MSBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKCkZvciBtb3JlIGluZm9ybWF0aW9uIHBs
ZWFzZSBzZWUgW0NoYW5nZUxvZ10oaHR0cHM6Ly9saWJtZGJ4LmRxZGtmYS5ydS9tZF9fY2hhbmdl
X2xvZy5odG1sKS4KClNpZ25lZC1vZmYtYnk6INCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9u
aWQgWXVyaWV2KSA8bGVvQHl1cmlldi5ydT4KLS0tCiBwYWNrYWdlL2xpYm1kYngvQ29uZmlnLmlu
ICAgIHwgNCArKystCiBwYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoIHwgMiArLQogcGFja2Fn
ZS9saWJtZGJ4L2xpYm1kYngubWsgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9Db25m
aWcuaW4gYi9wYWNrYWdlL2xpYm1kYngvQ29uZmlnLmluCmluZGV4IGE5YTRhYzQ1YzUuLjE2NDBk
YmQ5ZGUgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlibWRieC9Db25maWcuaW4KKysrIGIvcGFja2Fn
ZS9saWJtZGJ4L0NvbmZpZy5pbgpAQCAtMTEsNyArMTEsOSBAQCBjb25maWcgQlIyX1BBQ0tBR0Vf
TElCTURCWAogCSAgc29sdXRpb25zLgogCiAJICBsaWJtZGJ4IHN1cnBhc3NlcyB0aGUgbGVnZW5k
YXJ5IExNREIgaW4gdGVybXMgb2YKLQkgIHJlbGlhYmlsaXR5LCBmZWF0dXJlcyBhbmQgcGVyZm9y
bWFuY2UuCisJICByZWxpYWJpbGl0eSwgZmVhdHVyZXMgYW5kIHBlcmZvcm1hbmNlLiBBdCB0aGUg
ZW5kIG9mIDIwMjQKKwkgIGxpYm1kYnggd2FzIGNob3NlbiBieSBhbGwgbW9kZXJuIEV0aGVyZXVt
IGZyb250aWVycy9ub2RlcworCSAgYXMgYSBzdG9yYWdlIGVuZ2luZS4KIAogCSAgaHR0cHM6Ly9s
aWJtZGJ4LmRxZGtmYS5ydQogCmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5o
YXNoIGIvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaAppbmRleCBhZTUyNjY3MTZiLi5jN2Zm
YzcyZjJkIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoCisrKyBiL3Bh
Y2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2gKQEAgLTEsNSArMSw1IEBACiAjIEhhc2hlcyBmcm9t
OiBodHRwczovL2xpYm1kYnguZHFka2ZhLnJ1L3JlbGVhc2UvU0hBMjU2U1VNUwotc2hhMjU2ICA1
N2RiOTg3ZGU2ZjdjY2M2NmE2NmFlMjhhN2JkYTlmOWZiYjQ4YWM1ZmI5Mjc5YmNjYTkyZmQ1ZGUx
MzA3NWQxICBsaWJtZGJ4LWFtYWxnYW1hdGVkLTAuMTMuNi50YXIueHoKK3NoYTI1NiAgNDBhMzA2
NzY3M2I0N2Y0ODllNjRlNjRmNTQxYWQwMTY4MzJlZDlkNzFjZDhiN2Y4YmQxM2M4MWUyNmM3MzY5
YiAgbGlibWRieC1hbWFsZ2FtYXRlZC0wLjEzLjgudGFyLnh6CiAKICMgTG9jYWxseSBjYWxjdWxh
dGVkCiBzaGEyNTYgIDBkNTQyZTBjODgwNGUzOWFhN2YzN2ViMDBkYTVhNzYyMTQ5ZGM2ODJkNzgy
OTQ1MTI4N2UxMWI5MzhlOTQ1OTQgIExJQ0VOU0UKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRi
eC9saWJtZGJ4Lm1rIGIvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsKaW5kZXggZjQ2MWQ5ODM5
Ny4uMmZkYzAyM2M4MyAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsKKysr
IGIvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwogCi1MSUJNREJYX1ZFUlNJT04gPSAwLjEzLjYKK0xJQk1EQlhfVkVS
U0lPTiA9IDAuMTMuOAogTElCTURCWF9TT1VSQ0UgPSBsaWJtZGJ4LWFtYWxnYW1hdGVkLSQoTElC
TURCWF9WRVJTSU9OKS50YXIueHoKIExJQk1EQlhfU0lURSA9IGh0dHBzOi8vbGlibWRieC5kcWRr
ZmEucnUvcmVsZWFzZQogTElCTURCWF9TVVBQT1JUU19JTl9TT1VSQ0VfQlVJTEQgPSBOTwotLSAK
Mi41MS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
