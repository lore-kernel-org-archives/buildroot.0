Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6D9CD37AC
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 08:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAA1C4148C;
	Mon, 11 May 2026 08:04:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6i30KyAGsWMT; Mon, 11 May 2026 08:04:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C68D41429
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778486689;
	bh=s+hlQqKaekpLS6XJ0duvApiIxY+52xFObdMoKn/r8T4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o1L8jnJLG7lKjaRL+ywM3ekuNqROLpanufRxZ0W2l0OCpI9ibXuM62Vi0N0lVhasZ
	 EvOF3sX6CizB3tiYAd4yTpZoqM/MebCqIFqtboWvco5kYRXm2arquNbaFA3RFFdOkc
	 s31mcNrTeU5SniI46ZG8D+q22JJofpMuaLRCO4cKONfUQkoXGo91lQ4+eFawtcYkub
	 x48CpD9UQUL/6jTBO7aTy83ZmtHAzPvlY0wRixdMPSDRA3yosw0tCDSjhFNRnISP3g
	 /fuP7hGgQeJt++L0+L0IeNXSwMw28zPCd4X/t7qTYC/2BaH31z7kbmfCboMmQnGrad
	 Yqx80tvXvvGGA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C68D41429;
	Mon, 11 May 2026 08:04:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F3EE223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 08:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7813E8448F
 for <buildroot@buildroot.org>; Mon, 11 May 2026 08:04:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2NBCBUSj25c for <buildroot@buildroot.org>;
 Mon, 11 May 2026 08:04:46 +0000 (UTC)
X-Greylist: delayed 380 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 11 May 2026 08:04:45 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ACB258448D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACB258448D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:6b8:c02:900:1:45:d181:d204; helo=forward204b.mail.yandex.net;
 envelope-from=leo@yuriev.ru; receiver=<UNKNOWN> 
Received: from forward204b.mail.yandex.net (forward204b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ACB258448D
 for <buildroot@buildroot.org>; Mon, 11 May 2026 08:04:45 +0000 (UTC)
Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net
 [IPv6:2a02:6b8:c02:900:1:45:d181:d100])
 by forward204b.mail.yandex.net (Yandex) with ESMTPS id 9B38A83CE5
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:58:30 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net
 [IPv6:2a02:6b8:c24:2310:0:640:2452:0])
 by forward100b.mail.yandex.net (Yandex) with ESMTPS id 1A57680764
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:58:20 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net (smtp)
 with ESMTPSA id HwDJcFZYGmI0-RKEWiPW6; 
 Mon, 11 May 2026 10:58:18 +0300
X-Yandex-Fwd: 1
From: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?=
 <leo@yuriev.ru>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?=D0=9B=D0=B5=D0=BE=D0=BD=D0=B8=D0=B4=20=D0=AE=D1=80=D1=8C?=
 =?UTF-8?q?=D0=B5=D0=B2=20=28Leonid=20Yuriev=29?= <leo@yuriev.ru>
Date: Mon, 11 May 2026 10:58:12 +0300
Message-ID: <20260511075813.2533548-1-leo@yuriev.ru>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1778486299; bh=z1CAxriBOFB8IOfMmNC9oUx6AOBsgF0KENeFCp3LduA=;
 h=Message-ID:Date:Cc:Subject:To:From;
 b=PRVySWnS8nnI6gIN5JnE+kybLHmUH5ldib4vCXf34COQzCrA8SMo/o5+Q9ddYNkAN
 SLecGqTXWSB9LBDo3LQ2d029FkiIKGF8DQOfNriaQlGby+m+RHDkL73kGxVJIkyCJP
 uHYHStTFQ+jWVZFH4gblLsCuCoB+HAJtAkHLR4tM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=yuriev.ru
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=yuriev.ru header.i=@yuriev.ru header.a=rsa-sha256
 header.s=mail header.b=PRVySWnS
X-Mailman-Original-Authentication-Results: mail-nwsmtp-smtp-production-main-71.sas.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: [Buildroot] [PATCH] package/libmdbx: bump version to 0.13.12
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

VGhlIHN1cHBvcnRpbmcgcmVsZWFzZSBvZiBhIHN0YWJsZSBicmFuY2ggd2l0aCBidWcgZml4ZXMu
CgpTaW5jZSAyMDI2IGxpYm1kYnggcHJvamVjdCBoYXMgY2hhbmdlZCBpdHMgY29kZSBkZXZlbG9w
bWVudCBhbmQgZGlzdHJpYnV0aW9uIG1vZGVsLgpQbGVhc2Ugc2VlIGh0dHBzOi8vbGlibWRieC5k
cWRrZmEucnUvcmVsZWFzZS9saWJtZGJ4LXJvYWRtYXAtSE5ZMjAyNi1lbmdsaXNoLnBkZgoKQnJp
ZWZseSwgc2luY2UgMC4xMy4xMToKIC0gRml4ZWQgdGhlIGNvdW50aW5nIG9mIG5lc3RlZCB0cmVl
cyBpbiB0aGUgYG1kYnhfY2hrYCB0b29sIGZvciBhIG11bHRpLXZhbHVlcy9kdXBzb3J0IGhpdmVz
OwogLSBGaXhlZCBzd2FwcGluZyB0aGUgc2hyaW5rL2dyb3d0aCBwYXJhbWV0ZXJzIGluIGEgREIt
Z2VvbWV0cnkgaW4gdGhlIGBtZGJ4X2xvYWRgIHV0aWxpdHk7CiAtIEZpeGVkIGBTSUdTRUdWYCBp
biB0aGUgY2FzZSB3aGVuIGFsbCBtZXRhIHBhZ2VzIGFyZSBub3QgZW50aXJlbHkgdXNhYmxlOwog
LSBGaXhlZCBpbmZvcm1hdGlvbiBjb2xsZWN0aW9uIHZpYSBga3N0YXQoKWAgZm9yIGJvb3RpZCBv
biBTb2xhcmlzIGFuZCByZWxhdGVkIHBsYXRmb3JtczsKIC0gRml4ZWQgYSB0eXBvIGluIHRoZSBg
U1RfRVhQT1JURURgIHByb2Nlc3NpbmcgcGF0aCB0aGF0IGJyb2tlIHRoZSBidWlsZCBvbiBwbGF0
Zm9ybXMgd2hlcmUgdGhlIG1lbnRpb25lZCBmbGFnIGlzIGRlZmluZWQgZm9yIGBmc3RhdHZmcygp
YDsKIC0gRml4ZWQgbWlzc2luZyBlcnJvciBoYW5kbGluZyBvZiBgTnRVbm1hcFZpZXdPZlNlY3Rp
b24oKWAgYW5kIGBtdW5tYXAoKWAgaW5zaWRlIGBvc2FsX211bm1hcCgpYDsKIC0gRml4ZWQgYFNJ
R1NFR1ZgIGR1ZSB0byBhbiBhdHRlbXB0IHRvIGNsZWFuL292ZXJ3cml0ZSBhIGNvcnJ1cHRlZCBt
ZXRhIHBhZ2Ugd2hlbiBvcGVuaW5nIHRoZSBkYXRhYmFzZSBpbiByZWFkLW9ubHkgbW9kZTsKIC0g
Rml4ZWQgcmV0dXJuaW5nIGEgd3JvbmcvdW5pbml0aWFsaXplZCBgbXNfcHNpemVgIGZpZWxkIHdo
ZW4gdXNpbmcgYG1kYnhfZW51bWVyYXRlX3RhYmxlcygpYDsKIC0gRml4ZWQgYWRqdXN0aW5nIG9m
IG5laWdoYm9yIG5lc3RlZCBjdXJzb3JzIGFmdGVyIGEgZHVwc29ydCBpdGVtIGRlbGV0aW9uOwog
LSAyMCBmaWxlcyBjaGFuZ2VkLCAxOTEgaW5zZXJ0aW9ucygrKSwgMjE1IGRlbGV0aW9ucygtKQoK
QnJpZWZseSwgc2luY2UgMC4xMy4xMDoKIC0gRml4ZWQgdXNpbmcgb2YgdGhlIGlkZW50aWZpZXIg
YEVSUk9SX1VOSEFORExFRF9FUlJPUmAsIHdoaWNoIGlzIG5vdCBkZWZpbmVkIGluIG5ldyB2ZXJz
aW9ucyBvZiBXaW5kb3dzIFNESzsKIC0gRml4ZWQgbm9uLWNsb3Npbmcgb2YgREJJIGRlc2NyaXB0
b3JzIGZvciB0YWJsZXMgY3JlYXRlZCBpbiBuZXN0ZWQgdHJhbnNhY3Rpb25zIHdoZW4gc3VjaCB0
cmFuc2FjdGlvbnMgYXJlIGFib3J0ZWQ7CiAtIEZpeGVkIGV4dHJhIG1zeW5jL2ZzeW5jIG9wZXJh
dGlvbnMgZHVyaW5nIEdDIHJlY2xhaW1pbmcgaW4gYSBmdWxsIGRhdGFiYXNlOwogLSBGaXhlZCBz
dWJvcHRpbWFsIHJlZHVjaW5nL21lcmdpbmcgb2YgaGlzdG9ncmFtIGl0ZW1zIGluIGFuIG91dHB1
dCBvZiB0aGUgYG1kYnhfY2hrYCB0b29sOwogLSBGaXhlZCBjdXJzb3IocykgZmluYWxpemF0aW9u
IGFmdGVyIG9uZXMgZXhwbGljaXRseSBjbG9zZWQgaW4gYSBuZXN0ZWQgdHJhbnNhY3Rpb25zOwog
LSAxNTkgZmlsZXMgY2hhbmdlZCwgMTkxMSBpbnNlcnRpb25zKCspLCA2NDIgZGVsZXRpb25zKC0p
CgpCcmllZmx5LCBzaW5jZSAwLjEzLjk6CiAtIFRoZSBvcmlnaW4gcmVwb3NpdG9yeSBoYXMgYmVl
biBtb3ZlZCB0byBodHRwczovL3NvdXJjZWNyYWZ0LmRldi9kcWRrZmEvbGlibWRieCwgaXQgaXMg
c3RpbGwgb3BlbiBhbmQgcHJvdmlkZWQgd2l0aCBmaXJzdC1jbGFzcyBmcmVlIHN1cHBvcnQ7CiAt
IFRoZSBidWZmZXIgaW1wbGVtZW50YXRpb24gaGFzIGJlZW4gcmVmYWN0b3JlZCBhbmQgb3RoZXIg
aW1wcm92ZW1lbnRzIGhhdmUgYmVlbiBtYWRlIHRvIHRoZSBDKysgQVBJOwogLSBTZXZlcmFsIG1p
bm9yIHdhcm5pbmdzIGFuZCBidWdzIGhhdmUgYmVlbiBmaXhlZDsKIC0gRXhwYW5kZWQgdGhlIHNl
dCBvZiB0ZXN0czsKIC0gMjYgZmlsZXMgY2hhbmdlZCwgMTAzNyBpbnNlcnRpb25zKCspLCA5OTgg
ZGVsZXRpb25zKC0pCgpCcmllZmx5LCBzaW5jZSAwLjEzLjg6CiAtIFN1cHBvcnQgb2YgSGFybW9u
eSBPUzsKIC0gZml4ZWQgYXNzZXJ0aW9uIChCTUkgPiAwKSBpbiBkZWJ1Z2dpbmcgYnVpbGRzIGZv
ciAzMi1iaXQgcGxhdGZvcm1zOwogLSBmaXhlZCByZWdyZXNzaW9uIG9mIERCIGdyb3d0aCAobm8g
c2hyaW5raW5nKSBhZnRlciB1c2luZyBmYWxsb2NhdGUoKSBmb3IgYFNJR0JVU2AgcHJldmVudGlv
bjsKIC0gd29ya2Fyb3VuZCB0byBhdm9pZCBgRUFHQUlOYCBvbiBBbmRyb2lkIGFmdGVyIGFuIGFw
cGxpY2F0aW9uIHJlc3RhcnQ7CiAtIDI0IGZpbGVzIGNoYW5nZWQsIDI2MiBpbnNlcnRpb25zKCsp
LCAyMjYgZGVsZXRpb25zKC0pCgpCcmllZmx5LCBzaW5jZSAwLjEzLjc6CiAtIGVuYWJsZWQgb2xk
IExpbnV4IGtlcm5lbHMgc3RhcnRpbmcgZnJvbSAzLjE2OwogLSBmaXhlZCB1bmV4cGVjdGVkIGBT
SUdCVVNgIGlzIG5vdCBlbm91Z2ggc3BhY2UgaW4gYSBmaWxlc3lzdGVtOwogLSBmaXhlZCBpbmFw
cHJvcHJpYXRlL2lycmVsZXZhbnQgYE1EQlhfV0FOTkFfUkVDT1ZFUllgIHdoZW4gdGhlIERCIHNp
emUgaXMgbm90IHJvdW5kZWQgdG8gc3lzLWFsbG9jYXRpb24tZ3JhbnVsYXJpdHkuCiAtIDkgZmls
ZXMgY2hhbmdlZCwgMTAxIGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9ucygtKQoKRm9yIG1vcmUg
aW5mb3JtYXRpb24gcGxlYXNlIHNlZSBbQ2hhbmdlTG9nXShodHRwczovL3NvdXJjZWNyYWZ0LmRl
di9kcWRrZmEvbGlibWRieC9icm93c2UvQ2hhbmdlTG9nLm1kP3Jldj1zdGFibGUpIGluIHRoZSBg
c3RhYmxlYCBicmFuY2guCgpTaWduZWQtb2ZmLWJ5OiDQm9C10L7QvdC40LQg0K7RgNGM0LXQsiAo
TGVvbmlkIFl1cmlldikgPGxlb0B5dXJpZXYucnU+Ci0tLQogcGFja2FnZS9saWJtZGJ4L0NvbmZp
Zy5pbiAgICB8IDQgKysrLQogcGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaCB8IDQgKystLQog
cGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWsgICB8IDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRi
eC9Db25maWcuaW4gYi9wYWNrYWdlL2xpYm1kYngvQ29uZmlnLmluCmluZGV4IGE5YTRhYzQ1YzUu
LjFjNGJjMTllNTQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlibWRieC9Db25maWcuaW4KKysrIGIv
cGFja2FnZS9saWJtZGJ4L0NvbmZpZy5pbgpAQCAtMTEsNyArMTEsOSBAQCBjb25maWcgQlIyX1BB
Q0tBR0VfTElCTURCWAogCSAgc29sdXRpb25zLgogCiAJICBsaWJtZGJ4IHN1cnBhc3NlcyB0aGUg
bGVnZW5kYXJ5IExNREIgaW4gdGVybXMgb2YKLQkgIHJlbGlhYmlsaXR5LCBmZWF0dXJlcyBhbmQg
cGVyZm9ybWFuY2UuCisJICByZWxpYWJpbGl0eSwgZmVhdHVyZXMgYW5kIHBlcmZvcm1hbmNlLiBB
dCB0aGUgZW5kIG9mIDIwMjQKKwkgIGxpYm1kYnggd2FzIGNob3NlbiBieSBhbGwgbW9kZXJuIEV0
aGVyZXVtIG5vZGVzCisJICBhcyBhIHN0b3JhZ2UgZW5naW5lLgogCiAJICBodHRwczovL2xpYm1k
YnguZHFka2ZhLnJ1CiAKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2gg
Yi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoCmluZGV4IGFlNTI2NjcxNmIuLmE1N2RiNTgy
ZDAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2gKKysrIGIvcGFja2Fn
ZS9saWJtZGJ4L2xpYm1kYnguaGFzaApAQCAtMSw2ICsxLDYgQEAKICMgSGFzaGVzIGZyb206IGh0
dHBzOi8vbGlibWRieC5kcWRrZmEucnUvcmVsZWFzZS9TSEEyNTZTVU1TCi1zaGEyNTYgIDU3ZGI5
ODdkZTZmN2NjYzY2YTY2YWUyOGE3YmRhOWY5ZmJiNDhhYzVmYjkyNzliY2NhOTJmZDVkZTEzMDc1
ZDEgIGxpYm1kYngtYW1hbGdhbWF0ZWQtMC4xMy42LnRhci54egorc2hhMjU2ICA0Nzk1YzhmMDlm
YjkxMTE5ODJkMGYxZGQ4MTE2MDIwZmY4YTA5OGRhNjhkMDg2ZjM2MzhiZDIwZDE2ZGExMmE0ICBs
aWJtZGJ4LWFtYWxnYW1hdGVkLTAuMTMuMTIudGFyLnh6CiAKICMgTG9jYWxseSBjYWxjdWxhdGVk
CiBzaGEyNTYgIDBkNTQyZTBjODgwNGUzOWFhN2YzN2ViMDBkYTVhNzYyMTQ5ZGM2ODJkNzgyOTQ1
MTI4N2UxMWI5MzhlOTQ1OTQgIExJQ0VOU0UKLXNoYTI1NiAgNjUxZjcxYjQ2YzZiYjAwNDZkMjEy
MmRmN2Y5ZGVmOWNiMjRmNGRjMjhjNWIxMWNlZjA1OWY2NjU2NWNkYTMwZiAgTk9USUNFCitzaGEy
NTYgIDE1OTZlMmRiNDEyNDgyOGZlNDZhOGFkMzU2ZDVlYjAzZDgwZmYxNWZmZTkzYmM0ODkxYTM4
M2Y4MDJlZjBjNDggIE5PVElDRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngu
bWsgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5tawppbmRleCBmNDYxZDk4Mzk3Li5hNzY1YWE3
NTU0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5taworKysgYi9wYWNrYWdl
L2xpYm1kYngvbGlibWRieC5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjCiAKLUxJQk1EQlhfVkVSU0lPTiA9IDAuMTMuNgorTElCTURCWF9WRVJTSU9OID0gMC4x
My4xMgogTElCTURCWF9TT1VSQ0UgPSBsaWJtZGJ4LWFtYWxnYW1hdGVkLSQoTElCTURCWF9WRVJT
SU9OKS50YXIueHoKIExJQk1EQlhfU0lURSA9IGh0dHBzOi8vbGlibWRieC5kcWRrZmEucnUvcmVs
ZWFzZQogTElCTURCWF9TVVBQT1JUU19JTl9TT1VSQ0VfQlVJTEQgPSBOTwotLSAKMi41NC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
