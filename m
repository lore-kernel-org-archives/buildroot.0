Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBD6D65C7D
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 16:31:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6375D40D64;
	Wed, 17 Dec 2025 16:31:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNwMQup_H6BG; Wed, 17 Dec 2025 16:31:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2728740D5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765989104;
	bh=Qs0roFcNWyueVGf2Jqah+SKnOKLf4Nx9etmX16fCJBI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qfd28F1PEVKgvtFI6gy8DBnvO6hzDFNvnq40wqpiKRDUKZRyUmJjozLf8sQ/JjyBb
	 BVCMeeisYEQQKe/cdXlGvW1mtjTn6eB8KAAm4LHgyL8nfHlYQgDd2eMX1Yyl0RpTJt
	 72E7IcHRH63A+aNdINelpim3jBt+xemVFszHGCsOepflcuLcPhjqZv5mbtkRTdG9KB
	 UFnX4FlnM3UE2sQN04S/RuwrvxbWwjepdH1k3vBmughVQVC2DzcOJKBXUE0Sge+fMm
	 OQ2ig2TIgMMO6kx11RDG/rAZRDpwl2UdTJ9nUf3lWoknOcjD4vlb28D8T44dku53qo
	 ssUIPBtIzaJ4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2728740D5A;
	Wed, 17 Dec 2025 16:31:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1422935B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 16:31:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1205C40D5A
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 16:31:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LgqkFt-DrzIi for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 16:31:42 +0000 (UTC)
X-Greylist: delayed 443 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 17 Dec 2025 16:31:40 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32C7340CAE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32C7340CAE
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.154.239.218;
 helo=forward203d.mail.yandex.net; envelope-from=leo@yuriev.ru;
 receiver=<UNKNOWN> 
Received: from forward203d.mail.yandex.net (forward203d.mail.yandex.net
 [178.154.239.218])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32C7340CAE
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 16:31:40 +0000 (UTC)
Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net
 [IPv6:2a02:6b8:c41:1300:1:45:d181:d100])
 by forward203d.mail.yandex.net (Yandex) with ESMTPS id AE7C088322
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:24:18 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:11a5:0:640:79ad:0])
 by forward100d.mail.yandex.net (Yandex) with ESMTPS id CA17DC0079
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 19:24:08 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id 2OYhXC0GNKo0-jdWMaoWd; 
 Wed, 17 Dec 2025 19:24:08 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Date: Wed, 17 Dec 2025 19:23:49 +0300
Message-ID: <20251217162352.2951390-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1765988648; bh=68IV9sLbu8Csm++0vxyCmf9TEus1KsfckaX/gmI1ahw=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=oD1vIHcbMU/QdOlj1RFScnLWh0SUkp5XUVDmIpR/xwp7ZfBQqDdFXlQcnMmhycsVE
 uxQU6jh6TMu5X1gv6ri61v8ELQCNfoEoVRsBVlgp15emR6Vh0sUh6vOZqxHDVrq1r7
 axNwekEXfPfzX+0dwkK6uTqievb2z+ct1FB+ztTU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=yuriev.ru
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=yuriev.ru header.i=@yuriev.ru header.a=rsa-sha256
 header.s=mail header.b=oD1vIHcb
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-85.iva.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.13.10
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

VGhlIHN1cHBvcnRpbmcgcmVsZWFzZSBvZiBhIHN0YWJsZSBicmFuY2ggd2l0aCBidWcgZml4ZXMs
CmluIG1lbW9yeSBvZiBNaWNoYWVsIEFsZXhhbmRlciBHbG9zcywgQW1lcmljYW4sIHNvbiBvZiBE
ZXB1dHkgRGlyZWN0b3Igb2YgdGhlIENJQSwKd2hvIGRpZWQgaGVyb2ljYWxseSBpbiBzZWFyY2gg
b2YganVzdGljZSBmb3IgdGhlIGJyaWdodCBpZGVhbHMgb2YgaHVtYW5pdHkKYW5kIHdhcyBwb3N0
aHVtb3VzbHkgYXdhcmRlZCB0aGUgT3JkZXIgb2YgQ291cmFnZS4KCkJyaWVmbHksIHNpbmNlIDAu
MTMuOToKIC0gVGhlIG9yaWdpbiByZXBvc2l0b3J5IGhhcyBiZWVuIG1vdmVkIHRvIGh0dHBzOi8v
c291cmNlY3JhZnQuZGV2L2RxZGtmYS9saWJtZGJ4LCBpdCBpcyBzdGlsbCBvcGVuIGFuZCBwcm92
aWRlZCB3aXRoIGZpcnN0LWNsYXNzIGZyZWUgc3VwcG9ydDsKIC0gVGhlIGJ1ZmZlciBpbXBsZW1l
bnRhdGlvbiBoYXMgYmVlbiByZWZhY3RvcmVkIGFuZCBvdGhlciBpbXByb3ZlbWVudHMgaGF2ZSBi
ZWVuIG1hZGUgdG8gdGhlIEMrKyBBUEk7CiAtIFNldmVyYWwgbWlub3Igd2FybmluZ3MgYW5kIGJ1
Z3MgaGF2ZSBiZWVuIGZpeGVkOwogLSBFeHBhbmRlZCB0aGUgc2V0IG9mIHRlc3RzOwogLSAyNiBm
aWxlcyBjaGFuZ2VkLCAxMDM3IGluc2VydGlvbnMoKyksIDk5OCBkZWxldGlvbnMoLSkKCkJyaWVm
bHksIHNpbmNlIDAuMTMuODoKIC0gU3VwcG9ydCBvZiBIYXJtb255IE9TOwogLSBmaXhlZCBhc3Nl
cnRpb24gKEJNSSA+IDApIGluIGRlYnVnZ2luZyBidWlsZHMgZm9yIDMyLWJpdCBwbGF0Zm9ybXM7
CiAtIGZpeGVkIHJlZ3Jlc3Npb24gb2YgREIgZ3Jvd3RoIChubyBzaHJpbmtpbmcpIGFmdGVyIHVz
aW5nIGZhbGxvY2F0ZSgpIGZvciBgU0lHQlVTYCBwcmV2ZW50aW9uOwogLSB3b3JrYXJvdW5kIHRv
IGF2b2lkIGBFQUdBSU5gIG9uIEFuZHJvaWQgYWZ0ZXIgYW4gYXBwbGljYXRpb24gcmVzdGFydDsK
IC0gMjQgZmlsZXMgY2hhbmdlZCwgMjYyIGluc2VydGlvbnMoKyksIDIyNiBkZWxldGlvbnMoLSkK
CkJyaWVmbHksIHNpbmNlIDAuMTMuNzoKIC0gZW5hYmxlZCBvbGQgTGludXgga2VybmVscyBzdGFy
dGluZyBmcm9tIDMuMTY7CiAtIGZpeGVkIHVuZXhwZWN0ZWQgYFNJR0JVU2AgaXMgbm90IGVub3Vn
aCBzcGFjZSBpbiBhIGZpbGVzeXN0ZW07CiAtIGZpeGVkIGluYXBwcm9wcmlhdGUvaXJyZWxldmFu
dCBgTURCWF9XQU5OQV9SRUNPVkVSWWAgd2hlbiB0aGUgREIgc2l6ZSBpcyBub3Qgcm91bmRlZCB0
byBzeXMtYWxsb2NhdGlvbi1ncmFudWxhcml0eS4KIC0gOSBmaWxlcyBjaGFuZ2VkLCAxMDEgaW5z
ZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCgpGb3IgbW9yZSBpbmZvcm1hdGlvbiBwbGVhc2Ug
c2VlIFtDaGFuZ2VMb2cgaW4gdGhlIGBzdGFibGVgIGJyYW5jaF0oaHR0cHM6Ly9zb3VyY2VjcmFm
dC5kZXYvZHFka2ZhL2xpYm1kYngvYnJvd3NlL0NoYW5nZUxvZy5tZD9yZXY9c3RhYmxlKS4KClNp
Z25lZC1vZmYtYnk6INCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9uaWQgWXVyaWV2KSA8bGVv
QHl1cmlldi5ydT4KLS0tCiBwYWNrYWdlL2xpYm1kYngvQ29uZmlnLmluICAgIHwgNCArKystCiBw
YWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL2xpYm1kYngvbGli
bWRieC5tayAgIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4L0NvbmZpZy5pbiBiL3BhY2th
Z2UvbGlibWRieC9Db25maWcuaW4KaW5kZXggYTlhNGFjNDVjNS4uMWM0YmMxOWU1NCAxMDA2NDQK
LS0tIGEvcGFja2FnZS9saWJtZGJ4L0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2xpYm1kYngvQ29u
ZmlnLmluCkBAIC0xMSw3ICsxMSw5IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJNREJYCiAJICBz
b2x1dGlvbnMuCiAKIAkgIGxpYm1kYnggc3VycGFzc2VzIHRoZSBsZWdlbmRhcnkgTE1EQiBpbiB0
ZXJtcyBvZgotCSAgcmVsaWFiaWxpdHksIGZlYXR1cmVzIGFuZCBwZXJmb3JtYW5jZS4KKwkgIHJl
bGlhYmlsaXR5LCBmZWF0dXJlcyBhbmQgcGVyZm9ybWFuY2UuIEF0IHRoZSBlbmQgb2YgMjAyNAor
CSAgbGlibWRieCB3YXMgY2hvc2VuIGJ5IGFsbCBtb2Rlcm4gRXRoZXJldW0gbm9kZXMKKwkgIGFz
IGEgc3RvcmFnZSBlbmdpbmUuCiAKIAkgIGh0dHBzOi8vbGlibWRieC5kcWRrZmEucnUKIApkaWZm
IC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaCBiL3BhY2thZ2UvbGlibWRieC9s
aWJtZGJ4Lmhhc2gKaW5kZXggYWU1MjY2NzE2Yi4uYWQzYzM3NDk4OCAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaAorKysgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5o
YXNoCkBAIC0xLDYgKzEsNiBAQAogIyBIYXNoZXMgZnJvbTogaHR0cHM6Ly9saWJtZGJ4LmRxZGtm
YS5ydS9yZWxlYXNlL1NIQTI1NlNVTVMKLXNoYTI1NiAgNTdkYjk4N2RlNmY3Y2NjNjZhNjZhZTI4
YTdiZGE5ZjlmYmI0OGFjNWZiOTI3OWJjY2E5MmZkNWRlMTMwNzVkMSAgbGlibWRieC1hbWFsZ2Ft
YXRlZC0wLjEzLjYudGFyLnh6CitzaGEyNTYgIGU2YzlhZjA4NTM5MGM0MWQxMDFmY2UwYTcyNzk0
Yzc3MTU5ZTFlMjcxZTQxMDc3ZWEwZmQ0MjcwYjQzY2M1NmMgIGxpYm1kYngtYW1hbGdhbWF0ZWQt
MC4xMy4xMC50YXIueHoKIAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKIHNoYTI1NiAgMGQ1NDJlMGM4
ODA0ZTM5YWE3ZjM3ZWIwMGRhNWE3NjIxNDlkYzY4MmQ3ODI5NDUxMjg3ZTExYjkzOGU5NDU5NCAg
TElDRU5TRQotc2hhMjU2ICA2NTFmNzFiNDZjNmJiMDA0NmQyMTIyZGY3ZjlkZWY5Y2IyNGY0ZGMy
OGM1YjExY2VmMDU5ZjY2NTY1Y2RhMzBmICBOT1RJQ0UKK3NoYTI1NiAgMWZhNTQzZDUwMDJhMjhm
NDMwOTY2YWNkMDFmMjMxYjQzNzk2ODQyMWExNmU4MjM2YjgzOTM4NTU2ZGZkZGIzNCAgTk9USUNF
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tayBiL3BhY2thZ2UvbGlibWRi
eC9saWJtZGJ4Lm1rCmluZGV4IGY0NjFkOTgzOTcuLmExYjIxOWViNTQgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvbGlibWRieC9saWJtZGJ4Lm1rCisrKyBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lm1r
CkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotTElCTURCWF9W
RVJTSU9OID0gMC4xMy42CitMSUJNREJYX1ZFUlNJT04gPSAwLjEzLjEwCiBMSUJNREJYX1NPVVJD
RSA9IGxpYm1kYngtYW1hbGdhbWF0ZWQtJChMSUJNREJYX1ZFUlNJT04pLnRhci54egogTElCTURC
WF9TSVRFID0gaHR0cHM6Ly9saWJtZGJ4LmRxZGtmYS5ydS9yZWxlYXNlCiBMSUJNREJYX1NVUFBP
UlRTX0lOX1NPVVJDRV9CVUlMRCA9IE5PCi0tIAoyLjUyLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
