Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11D1EF48C5
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 11:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF254406B3;
	Sat, 14 Feb 2026 11:26:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jkEHnZxGJkD; Sat, 14 Feb 2026 11:26:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18F7740553
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771068371;
	bh=NUeUp0SQWISyFn4145TdNrAO6g5RXpatr0bgX8BULQI=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=ZvFoGbYUlaqEzAg0XeSr0rmiCcGdFKmtYTKl9Sfz25gSTqPH8YxZ0ITuVhtQRJ5cd
	 Ssku5Bxb3DxLqwkMSImlSY5Xse9nhn+wtWgh407SbxbbV41UtNlPX4zFtoa60j39J+
	 +VIYzWKtDD+U8GMzb4b16PB3Fza4PQbFUhOsHIA+PrQf33YH6YOdL6dZ2l+4J0GV7M
	 ABFLgdYOoK9LCoFdjf+eXocAFBHCy++E8zOzWADHLCd92qvYdEahQlsjsuEovKquUw
	 fFT+icFAbBCLQKsU5AAyeHpOgc+Hh7truS69PFkE5hDrT3eblgHFOAP8ATMbzKJIur
	 rUJC+/HyLkHcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18F7740553;
	Sat, 14 Feb 2026 11:26:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0514D270
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE1FD82201
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S_vsTo61C30h for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 11:26:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AF593821EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF593821EF
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF593821EF
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:26:06 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 6E0AD4E40D8A
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:26:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 45550606CB
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 11:26:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 64F5A10368FFD; Sat, 14 Feb 2026 12:26:03 +0100 (CET)
Date: Sat, 14 Feb 2026 12:25:14 +0100
MIME-Version: 1.0
Message-Id: <20260214-libxmlsec_fix-v1-1-0512d1cd6e06@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvyJ7TlgXEuorEZG21YJZKEQQ/j3pO
 AMzL2ROwhl69ULiW7KcsYJpFPh9jhtrWSoDIVkkQzqIe46Q2U+rPJoQO+ccoW0t1OZKXPX/G8Z
 SPnwtAhRfAAAA
X-Change-ID: 20260212-libxmlsec_fix-2009bbb20656
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1771068363; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=cBcoPyDX8jPn3EdLRNmHUKDGgTKkAzNhH+nljezbl64=;
 b=xKxT2VWPHLqdU13v/R7drlqzpiPmHRQMQgak7XhJ3E9WqGjSLWdcZhHP0Bo+kmtYEI48Dd
 kgqGjHrrqJ9iRFldEljE3+Af9TP5jesw3RKXB5H8VNJmEHQH+tVeNJuxYytOabWEZIjVzT
 aYt9TliaGEDOuevmKwTJHg+ehITqTBodCunL7Hq6GvVFRaJ7YGSd+v3lp5ui1v7U0kwEDU
 zKx8KB+2Q96lpfcPIxRtHjCAi0LNdpuwZj2djdnUOSukidILv0C4IOg62H71c2vfeAjnM1
 60mBCdZ4JrjtFBT9XeJCMzw7QVNCbES1X4bVx5O6pyk2k3kE6rWPHeicKCGayw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=xKxT2VWP
Subject: [Buildroot] [PATCH] package/libxmlsec1: disable des support
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bGlieG1zbGVjMSBidWlsZCBmYWlscyBvbiBzb21lIGNvbmZpZ3VyYXRpb25zIHdpdGggdGhlIGZv
bGxvd2luZyBidWlsZApsb2dzOgoKICAgIENDICAgICAgIGxpYnhtbHNlYzFfb3BlbnNzbF9sYS1r
d19kZXMubG8KICBrd19kZXMuYzo3NTo4OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ3htbFNl
Y0tXRGVzM0tsYXNzJzsgZGlkIHlvdSBtZWFuICd4bWxTZWNLV0Flc0tsYXNzJz8KICAgICA3NSB8
IHN0YXRpYyB4bWxTZWNLV0RlczNLbGFzcyB4bWxTZWNPcGVuU1NMS1dEZXMzSW1wbEtsYXNzID0g
ewogICAgICAgIHwgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+CiAgICAgICAgfCAgICAgICAgeG1s
U2VjS1dBZXNLbGFzcwogIGt3X2Rlcy5jOjc3OjU6IGVycm9yOiBpbml0aWFsaXphdGlvbiBvZiAn
aW50JyBmcm9tICdpbnQgKCopKHN0cnVjdCBfeG1sU2VjVHJhbnNmb3JtICosIHhtbFNlY0J5dGUg
Kiwgc2l6ZV90LCAgc2l6ZV90ICopJyB7YWthICdpbnQgKCopKHN0cnVjdCBfeG1sU2VjVHJhbnNm
b3JtICosIHVuc2lnbmVkIGNoYXIgKiwgbG9uZyB1bnNpZ25lZCBpbnQsICBsb25nIHVuc2lnbmVk
IGludCAqKSd9IG1ha2VzIGludGVnZXIgZnJvbSBwb2ludGVyIHdpdGhvdXQgYSBjYXN0IFstV2lu
dC1jb252ZXJzaW9uXQogICAgIDc3IHwgICAgIHhtbFNlY09wZW5TU0xLV0RlczNHZW5lcmF0ZVJh
bmRvbSwgICAgICAgLyogeG1sU2VjS1dEZXMzR2VuZXJhdGVSYW5kb21NZXRob2QgICAgIGdlbmVy
YXRlUmFuZG9tOyAqLwogICAgICAgIHwgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fgogIGt3X2Rlcy5jOjc3OjU6IG5vdGU6IChuZWFyIGluaXRpYWxpemF0aW9uIGZvciAneG1s
U2VjT3BlblNTTEtXRGVzM0ltcGxLbGFzcycpCiAga3dfZGVzLmM6Nzc6NTogZXJyb3I6IGluaXRp
YWxpemVyIGVsZW1lbnQgaXMgbm90IGNvbXB1dGFibGUgYXQgbG9hZCB0aW1lCiAga3dfZGVzLmM6
Nzc6NTogbm90ZTogKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9yICd4bWxTZWNPcGVuU1NMS1dEZXMz
SW1wbEtsYXNzJykKICBrd19kZXMuYzo3ODo1OiBlcnJvcjogZXhjZXNzIGVsZW1lbnRzIGluIHNj
YWxhciBpbml0aWFsaXplcgogICAgIDc4IHwgICAgIHhtbFNlY09wZW5TU0xLV0RlczNTaGExLCAg
ICAgICAgICAgICAgICAgLyogeG1sU2VjS1dEZXMzU2hhMU1ldGhvZCAgICAgICAgICAgICAgIHNo
YTE7ICovCiAgICAgICAgfCAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KICBrd19kZXMuYzo3
ODo1OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3IgJ3htbFNlY09wZW5TU0xLV0RlczNJ
bXBsS2xhc3MnKQogIGt3X2Rlcy5jOjc5OjU6IGVycm9yOiBleGNlc3MgZWxlbWVudHMgaW4gc2Nh
bGFyIGluaXRpYWxpemVyCiAgICAgNzkgfCAgICAgeG1sU2VjT3BlblNTTEtXRGVzM0Jsb2NrRW5j
cnlwdCwgICAgICAgICAvKiB4bWxTZWNLV0RlczNCbG9ja0VuY3J5cHRNZXRob2QgICAgICAgZW5j
cnlwdDsgKi8KICAgICAgICB8ICAgICBefn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CiAg
a3dfZGVzLmM6Nzk6NTogbm90ZTogKG5lYXIgaW5pdGlhbGl6YXRpb24gZm9yICd4bWxTZWNPcGVu
U1NMS1dEZXMzSW1wbEtsYXNzJykKICBrd19kZXMuYzo4MDo1OiBlcnJvcjogZXhjZXNzIGVsZW1l
bnRzIGluIHNjYWxhciBpbml0aWFsaXplcgogICAgIDgwIHwgICAgIHhtbFNlY09wZW5TU0xLV0Rl
czNCbG9ja0RlY3J5cHQsICAgICAgICAgLyogeG1sU2VjS1dEZXMzQmxvY2tEZWNyeXB0TWV0aG9k
ICAgICAgIGRlY3J5cHQ7ICovCiAgICAgICAgfCAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fgogIFsuLi5dCgpUaGlzIGJ1aWxkIGZhaWx1cmUgaXMgZHVlIHRvIHRob3NlIHN0cnVj
dCBkZWZpbml0aW9ucyBiZWluZyBzZXQKY29uZGl0aW9uYWxseSBpbiBzcmMva3dfYWVzX2Rlcy5o
IGJlaGluZCBhIFhNTFNFQ19OT19ERVMgZGVmaW5lLCBhbmQKdGhpcyBkZWZpbmUgZW5kaW5nIHVw
IGJlaW5nIDEgb24gc29tZSBidWlsZHMuIFdlIGNvdWxkIGFzc3VtZSB0aGF0IHRoZQptYWtlZmls
ZXMgaW4gbGlieG1sc2VjIHNob3VsZCBqdXN0IG5vdCB0cnkgdG8gYnVpbGQgYW55IERFUyByZWxh
dGVkIGZpbGUKd2hlbiBYTUxTRUNfTk9fREVTIGlzIHNldCB0byAxIChhbmQgc28sIGluIHRoaXMg
c3BlY2lmaWMgY2FzZSwgbm90IHRyeQp0byBidWlsZCBzcmMvb3BlbnNzbC9rd19kZXMuYyksIGJ1
dCB0aGUgYXV0b3Rvb2xzIHRvb2xpbmcgaW4gdGhlIHByb2plY3QKaXMgbm90IHRoZSBvbmUgc2V0
dGluZyBYTUxTRUNfTk9fREVTOiB0aGVyZSBpcyBhIG1pc21hdGNoIGJldHdlZW4KZGV0ZWN0ZWQg
ZmVhdHVyZXMgYXQgY29uZmlndXJlIHRpbWUgYW5kIGJ1aWxkIHRpbWUuCi0gYXQgYnVpbGQgdGlt
ZSwgdGhlIHRvb2xpbmcganVzdCBjaGVja3MgaWYgdXNlciBoYXMgcGFzc2VkCiAgYC0tZW5hYmxl
LWRlcz1ub2AuIElmIHNvLCBpdCBzZXRzIFhNTFNFQ19OT19ERVMsIG90aGVyd2lzZSBpdCBhc3N1
bWVzCiAgdGhhdCBERVMgc3VwcG9ydCBpcyBhdmFpbGFibGUuCi0gYXQgYnVpbGQgdGltZSwgbGli
eG1sc2VjIHRyaWVzIHRvIGJ1aWxkIG9wZW5zc2wgYmFja2VuZC4gVGhpcyBiYWNrZW5kCiAgY2hl
Y2tzIE9wZW5TU0wgZmVhdHVyZXMsIGVzcGVjaWFsbHkgd2hldGhlciBPUEVOU1NMX05PX0RFUyBp
cyBzZXQgKGFuZAogIGlmIHNvLCBpdCBlbmZvcmNlcyBYTUxTRUNfTk9fREVTIHRvIDEgYXMgd2Vs
bCkKLSBUaGlzIE9QRU5TU0xfTk9fREVTIGNvbWVzIGZyb20gbGlib3BlbnNzbCBjb25maWd1cmF0
aW9uIGhlYWRlcnMKICBpbnN0YWxsZWQgaW4gc3lzcm9vdC4gSXRzIHByZXNlbmNlIGlzIGRyaXZl
biBieSB0aGUgYG5vLWRlc2Agb3B0aW9uCiAgcGFzc2VkIGF0IGxpYm9wZW5zc2wgY29uZmlndXJl
IHRpbWUKLSBUaGlzIGBuby1kZXNgIGZsYWcgaXMgZHJpdmVuIGJ5IGJ1aWxkcm9vdCBvcHRpb24K
ICBCUjJfUEFDS0FHRV9MSUJPUEVOU1NMX0VOQUJMRV9ERVMKClRoZXJlIGFyZSBtdWx0aXBsZSBv
cHRpb25zIHRvIGZpeCB0aGlzIHBhY2thZ2UgaGVyZToKMS4gZml4aW5nIHVwc3RyZWFtIHBhY2th
Z2UgdG8gbWFrZSB0aGUgZmVhdHVyZXMgZGV0ZWN0aW9uIG1vcmUgcm9idXN0IChlZwogICBjaGVj
ayBvcGVuc3NsIGhlYWRlcnMgYXQgY29uZmlndXJlIHRpbWUgdG8gZW5zdXJlIHRoYXQgREVTIGlz
CiAgIHN1cHBvcnRlZCkKMi4gZW5mb3JjZSBYTUxTRUNfTk9fREVTIGlmIEJSMl9QQUNLQUdFX0xJ
Qk9QRU5TU0xfRU5BQkxFX0RFUyBpcyBub3Qgc2V0CjMuIHN5c3RlbWF0aWNhbGx5IGVuZm9yY2Ug
WE1MU0VDX05PX0RFUz0xCgpOb3c6Ci0gMSBtYXkgdGFrZSB0aW1lLCBhbmQgd291bGQgdGhlbiBu
ZWVkIGEgdGVtcG9yYXJ5IHBhdGNoIHRvIGxpdmUgaW4KICBidWlsZHJvb3Qgd2hpbGUgdGhlIGZp
eCBpcyBhY2NlcHRlZCB1cHN0cmVhbSBhbmQgcmVsZWFzZWQKLSAyIHdvcmtzIG9ubHkgZm9yIGxp
Ym9wZW5zc2wsIHdoYXQgaWYgbGlicmVzc2wgaXMgdXNlZCA/Ci0gREVTIHVzYWdlIGlzIGRpc2Nv
dXJhZ2VkIGFueXdheSwgYXMgc3RhdGVkIGJ5IGNvbmZpZ3VyZSBsb2dzOgogIFsuLi5dCiAgY2hl
Y2tpbmcgZm9yIERFUyBzdXBwb3J0Li4uIHllcyAodXNlIGRpc2NvdXJhZ2VkKQogIFsuLi5dCkFz
IHRoZSBwYWNrYWdlIGhhcyBiZWVuIGludHJvZHVjZWQgdmVyeSByZWNlbnRseSwgdGhlcmUncyBh
IHZlcnkgbG93CmNoYW5jZSB0byBicmVhayBhbnkgdXNlciB1c2UgY2FzZSBieSBjb21wbGV0ZWx5
IGRpc2FibGluZyBERVMgc3VwcG9ydC4KClN5c3RlbWF0aWNhbGx5IGRpc2FibGUgREVTIHN1cHBv
cnQgaW4gbGlieG1sc2VjMSB0byBkaXNjb3VyYWdlIHVzYWdlIGFuZApmaXggYnVpbGQgZmFpbHVy
ZSB3aGVuIHRoZSBjb3JyZXNwb25kaW5nIFNTTCBsaWJyYXJ5IGRvZXMgbm90IGV4cG9zZSBERVMK
c3VwcG9ydC4KCkZpeGVzOiBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMv
M2UxNWYwM2RjMDIxMWM2MjIxMjVlYmI2OWZmNzIzMGNlOTAwMDI5YS8KU2lnbmVkLW9mZi1ieTog
QWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCiBwYWNrYWdl
L2xpYnhtbHNlYzEvbGlieG1sc2VjMS5tayB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlieG1s
c2VjMS9saWJ4bWxzZWMxLm1rIGIvcGFja2FnZS9saWJ4bWxzZWMxL2xpYnhtbHNlYzEubWsKaW5k
ZXggZDBkNTUzYzQ4YzY1Li4yOTIyMmJjMTZmZmQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvbGlieG1s
c2VjMS9saWJ4bWxzZWMxLm1rCisrKyBiL3BhY2thZ2UvbGlieG1sc2VjMS9saWJ4bWxzZWMxLm1r
CkBAIC0xOSw3ICsxOSw4IEBAIExJQlhNTFNFQzFfQ09ORl9PUFRTID0gXAogCS0td2l0aC1vcGVu
c3NsIFwKIAktLXdpdGhvdXQtZ251dGxzIFwKIAktLXdpdGhvdXQtZ2NyeXB0IFwKLQktLXdpdGhv
dXQtbnNzCisJLS13aXRob3V0LW5zcyBcCisJLS1kaXNhYmxlLWRlcwogCiBIT1NUX0xJQlhNTFNF
QzFfQ09ORl9PUFRTID0gXAogCS0tZW5hYmxlLWNyeXB0by1kbD1ubyBcCkBAIC0yNyw3ICsyOCw4
IEBAIEhPU1RfTElCWE1MU0VDMV9DT05GX09QVFMgPSBcCiAJLS13aXRob3V0LWdudXRscyBcCiAJ
LS13aXRob3V0LWdjcnlwdCBcCiAJLS13aXRob3V0LW5zcyBcCi0JLS13aXRob3V0LWxpYnhzbHQK
KwktLXdpdGhvdXQtbGlieHNsdCBcCisJLS1kaXNhYmxlLWRlcwogCiBpZmVxICgkKEJSMl9QQUNL
QUdFX0xJQlhTTFQpLHkpCiBMSUJYTUxTRUMxX0RFUEVOREVOQ0lFUyArPSBsaWJ4c2x0CgotLS0K
YmFzZS1jb21taXQ6IGU3MjhkMzUwNmIwYmIwYzMxNjliNWJlY2NkZjZlYjUyM2JkZGEzZjcKY2hh
bmdlLWlkOiAyMDI2MDIxMi1saWJ4bWxzZWNfZml4LTIwMDliYmIyMDY1NgoKQmVzdCByZWdhcmRz
LAotLSAKQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
