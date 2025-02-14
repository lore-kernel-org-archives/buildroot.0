Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D179C02198
	for <buildroot@archiver.kernel.org>; Fri, 14 Feb 2025 18:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 034DC83B80;
	Fri, 14 Feb 2025 18:40:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ejh0mEsHKL3C; Fri, 14 Feb 2025 18:40:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9F2F83BC8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9F2F83BC8;
	Fri, 14 Feb 2025 18:40:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 060E01E3
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDF7E6074C
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zHtctfKOVGXh for <buildroot@buildroot.org>;
 Fri, 14 Feb 2025 18:40:31 +0000 (UTC)
X-Greylist: delayed 453 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 14 Feb 2025 18:40:30 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 551E360836
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 551E360836
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:6b8:c02:900:1:45:d181:d200; helo=forward200b.mail.yandex.net;
 envelope-from=leo@yuriev.ru; receiver=<UNKNOWN> 
Received: from forward200b.mail.yandex.net (forward200b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 551E360836
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 18:40:30 +0000 (UTC)
Received: from forward102b.mail.yandex.net (forward102b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d102])
 by forward200b.mail.yandex.net (Yandex) with ESMTPS id 10A3267FAE
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 21:33:03 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c08:df8e:0:640:17d3:0])
 by forward102b.mail.yandex.net (Yandex) with ESMTPS id AEDD460B55
 for <buildroot@buildroot.org>; Fri, 14 Feb 2025 21:32:52 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net
 (smtp/Yandex) with ESMTPSA id pWW1WKIMiOs0-I3n4ubIG; 
 Fri, 14 Feb 2025 21:32:51 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Date: Fri, 14 Feb 2025 21:32:39 +0300
Message-ID: <20250214183242.2297637-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1739557972; bh=d1mbahEFH6ujymMM5QfjBpauWHNubwLaORqowbThhiU=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=VCO+ucF6TTfHjrr+W56Rvu0NRIqZfpebsdY0lxcOEfF+8LI0yB7FItOflhkpOZYYZ
 XBDZkF+nVH5GoVLqwJveiwBmnXd+pkCcTgtPP2LZ83FwsPTxvaD7QTEezTCVwgYDBm
 dJGoyh9SsAIrwuuO2lNFN2lTihnkab5Q6H/ye/Mc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yuriev.ru
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-44.sas.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.13.4
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

VGhpcyBpcyBzdGFibGUgcmVsZWFzZSAiU2lnbWEgQm95IiBvZiBmcm9udHdhcmQgbGlibWRieCBi
cmFuY2ggd2l0aCBuZXcgc3VwZXJpb3IgZmVhdHVyZXMuCgpTaW5jZSAwLjEzLnggbGlibWRieCBp
cyBsaWNlbnNlZCB1bmRlciB0aGUgQXBhY2hlIDIuMCBMaWNlbnNlLgpGb3Igbm90ZXMgYWJvdXQg
dGhlIGxpY2Vuc2UgY2hhbmdlLCBjcmVkaXRzIGFuZCBhY2tub3dsZWRnbWVudHMsCnBsZWFzZSBy
ZWZlciB0byB0aGUgQ09QWVJJR0hUIGZpbGUgd2l0aGluIG9yaWdpbmFsIGxpYm1kYnggc291cmNl
IGNvZGUKcmVwb3NpdG9yeSBodHRwczovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1k
YngKClBsZWFzZSB2aXNpdCBodHRwczovL2xpYm1kYnguZHFka2ZhLnJ1IGZvciBtb3JlIGluZm9y
bWF0aW9uLCBjaGFuZ2Vsb2csCmRvY3VtZW50YXRpb24sIEMrKyBBUEkgZGVzY3JpcHRpb24gYW5k
IGxpbmtzIHRvIHRoZSBvcmlnaW5hbCBnaXQgcmVwbwp3aXRoIHRoZSBzb3VyY2UgY29kZS4gUXVl
c3Rpb25zLCBmZWVkYmFjayBhbmQgc3VnZ2VzdGlvbnMgYXJlIHdlbGNvbWUKdG8gdGhlIFRlbGVn
cmFtJyBncm91cCBodHRwczovL3QubWUvbGlibWRieC4KClNpZ25lZC1vZmYtYnk6INCb0LXQvtC9
0LjQtCDQrtGA0YzQtdCyIChMZW9uaWQgWXVyaWV2KSA8bGVvQHl1cmlldi5ydT4KLS0tCiBwYWNr
YWdlL2xpYm1kYngvbGlibWRieC5oYXNoIHwgNSArKystLQogcGFja2FnZS9saWJtZGJ4L2xpYm1k
YngubWsgICB8IDcgKysrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaCBi
L3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2gKaW5kZXggMjIyZTdjYWY1Yy4uMjAyOTM3ZTdi
ZSAxMDA2NDQKLS0tIGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaAorKysgYi9wYWNrYWdl
L2xpYm1kYngvbGlibWRieC5oYXNoCkBAIC0xLDUgKzEsNiBAQAogIyBIYXNoZXMgZnJvbTogaHR0
cHM6Ly9saWJtZGJ4LmRxZGtmYS5ydS9yZWxlYXNlL1NIQTI1NlNVTVMKLXNoYTI1NiAgMTljMGVi
MzNlMWVkNDNjYTJhOTRkY2ViMDZkZDMxOTQ2NDMyZDE2ZjMwYTk3NTFkMzcwMWM2N2VmYTIyZWIx
YSAgbGlibWRieC1hbWFsZ2FtYXRlZC0wLjEyLjEyLnRhci54egorc2hhMjU2ICA4NmRmMzBjYTIy
MzFjOWIzYWQ3MTQyNGJiODI5ZGNhOTA0MTk0N2Y1NTM5ZDQyOTUwMzBjNjUzZDQ5ODJjMWJlICBs
aWJtZGJ4LWFtYWxnYW1hdGVkLTAuMTMuNC50YXIueHoKIAogIyBMb2NhbGx5IGNhbGN1bGF0ZWQK
LXNoYTI1NiAgMzEwZmUyNWM4NThhOTUxNWZjOGM4ZDdkMWYyNGE2N2M5NDk2Zjg0YTkxZTBhMGU0
MWVhOTk3NWIxMzcxZTU2OSAgTElDRU5TRQorc2hhMjU2ICAwZDU0MmUwYzg4MDRlMzlhYTdmMzdl
YjAwZGE1YTc2MjE0OWRjNjgyZDc4Mjk0NTEyODdlMTFiOTM4ZTk0NTk0ICBMSUNFTlNFCitzaGEy
NTYgIDY5OWE2Mjk4NmI2YzhkMzExMjQ2NDZkZmZkNGIxNTg3MmM3ZDNiYzVlZWNlYTU5OTRlZGIx
ZjUxOTVkZjQ5ZDEgIE5PVElDRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngu
bWsgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tawppbmRleCBjNzM2OTQ1ZTkyLi5hOGE2ZjNk
YmRmIDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5taworKysgYi9wYWNrYWdl
L2xpYm1kYngvbGlibWRieC5tawpAQCAtNCwxMiArNCwxMyBAQAogIwogIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMKIAotTElCTURCWF9WRVJTSU9OID0gMC4xMi4xMgorTElCTURCWF9WRVJTSU9OID0g
MC4xMy40CiBMSUJNREJYX1NPVVJDRSA9IGxpYm1kYngtYW1hbGdhbWF0ZWQtJChMSUJNREJYX1ZF
UlNJT04pLnRhci54egogTElCTURCWF9TSVRFID0gaHR0cHM6Ly9saWJtZGJ4LmRxZGtmYS5ydS9y
ZWxlYXNlCiBMSUJNREJYX1NVUFBPUlRTX0lOX1NPVVJDRV9CVUlMRCA9IE5PCi1MSUJNREJYX0xJ
Q0VOU0UgPSBPTERBUC0yLjgKLUxJQk1EQlhfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKK0xJQk1E
QlhfTElDRU5TRSA9IEFwYWNoZS0yLjAKK0xJQk1EQlhfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0Ug
Tk9USUNFCitMSUJNREJYX1JFRElTVFJJQlVURSA9IFlFUwogTElCTURCWF9TVFJJUF9DT01QT05F
TlRTID0gMAogTElCTURCWF9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKIAotLSAKMi40OC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
