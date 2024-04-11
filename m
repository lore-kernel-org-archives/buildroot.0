Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7302CC04FF6
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 13:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB63541A2B;
	Thu, 11 Apr 2024 13:35:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FCe9bOtxshNG; Thu, 11 Apr 2024 13:35:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 384B441A37
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 384B441A37;
	Thu, 11 Apr 2024 13:35:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC8F21BF3DB
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 13:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8ADD96129E
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 13:35:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mQmtoAK7dBHo for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 13:35:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41ECA612A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41ECA612A1
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41ECA612A1
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 13:35:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EEFC3240005;
 Thu, 11 Apr 2024 13:35:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 15:35:07 +0200
Message-ID: <20240411133507.82781-4-alexis.lothore@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411133507.82781-1-alexis.lothore@bootlin.com>
References: <20240411133507.82781-1-alexis.lothore@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: alexis.lothore@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1712842513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=efamNpgUN7aoAQ1rzXFgbty8d82m+xEwfmj67o4CGH0=;
 b=MYH/3HZydN+sKdnAh7nAKIT54D0kzZchRLBQkRFmPMog6z7XPRreYOdej1jHjLrLwj3jed
 Yr7qyHrCXra6JAlkxAY5gwaYu5w0x8TsmFXt6nN+M9xOtX3/+T3ls4WH30TYtV08VdBmJO
 ekbWj6mw3FjazqqRdxGtYBR8XFxeRSTjZem9BSIGXQ4GE1C8RrFcAGDim/of6X5cWPe+Wg
 O+aXgLulqSAO8S5UXxuQ38aJtT1PIySwlBiK3Dwin827UuvoT9zkEZhAjY48SK3/AG4Jid
 5OKw/qV9wN0ZqIp1t2Gd0xzyBJM6PYdHi2LG23ktQ4Xm+asQ7D5A36YajjTuIw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=MYH/3HZy
Subject: [Buildroot] [PATCH v2 3/3] package/pppd: create rundir when it is
 missing
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Alexis=20Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cHBwZCBmYWlscyB0byBzdGFydCBvbiBidWlsZHJvb3QgMjAyNC4wMiwgYmVjYXVzZSBvZiBub24t
ZXhpc3RpbmcgZGlyZWN0b3J5CnBwcGQgaW4gL3Zhci9ydW4KClNpZ25lZC1vZmYtYnk6IEFsZXhp
cyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQogLi4uMDAwNy10cnkt
dG8tY3JlYXRlLXJ1bmRpci1pZi1taXNzaW5nLnBhdGNoIHwgNTIgKysrKysrKysrKysrKysrKysr
KwogMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3BwcGQvMDAwNy10cnktdG8tY3JlYXRlLXJ1bmRpci1pZi1taXNzaW5nLnBhdGNoCgpk
aWZmIC0tZ2l0IGEvcGFja2FnZS9wcHBkLzAwMDctdHJ5LXRvLWNyZWF0ZS1ydW5kaXItaWYtbWlz
c2luZy5wYXRjaCBiL3BhY2thZ2UvcHBwZC8wMDA3LXRyeS10by1jcmVhdGUtcnVuZGlyLWlmLW1p
c3NpbmcucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi5kMjIz
YWJmODAxYmYKLS0tIC9kZXYvbnVsbAorKysgYi9wYWNrYWdlL3BwcGQvMDAwNy10cnktdG8tY3Jl
YXRlLXJ1bmRpci1pZi1taXNzaW5nLnBhdGNoCkBAIC0wLDAgKzEsNTIgQEAKK0Zyb20gOGVmMmIx
ZDVlMTM1NDBjZmIzNjU0OTBlYTFlZDEzMTc4NDE4NGMxYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb206IERvbWluaXF1ZSBNYXJ0aW5ldCA8ZG9taW5pcXVlLm1hcnRpbmV0QGF0bWFyay10
ZWNobm8uY29tPgorRGF0ZTogVGh1LCAzIEF1ZyAyMDIzIDE2OjM3OjI3ICswOTAwCitTdWJqZWN0
OiBbUEFUQ0hdIHRyeSB0byBjcmVhdGUgcnVuZGlyIGlmIG1pc3NpbmcKK01JTUUtVmVyc2lvbjog
MS4wCitDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgKK0NvbnRlbnQtVHJh
bnNmZXItRW5jb2Rpbmc6IDhiaXQKKworUnVudGltZSBkaXIgY2hhbmdlZCBmcm9tIC9ydW4gdG8g
L3J1bi9wcHBkIGluIGNvbW1pdCA2NmE4Yzc0YzNmNzMgKCJMZXQKKy4vY29uZmlndXJlIGNvbnRy
b2wgdGhlIHBhdGhzIGZvciBwcHBkIikgYW5kIGlzIGxpa2VseSB0byBub3QgZXhpc3Qgb24KK3Nv
bWUgZGlzdHJvcywgaW4gd2hpY2ggY2FzZSB0aGUgcHBwZGIgd2lsbCBub3QgYmUgY3JlYXRlZC4K
KworU2VlOiAjNDE5IChsb2NrIGRpcmVjdG9yeSBtb3ZlZCBpbiBwcHAtMi41LjApCitTaWduZWQt
b2ZmLWJ5OiBEb21pbmlxdWUgTWFydGluZXQgPGRvbWluaXF1ZS5tYXJ0aW5ldEBhdG1hcmstdGVj
aG5vLmNvbT4KK1Vwc3RyZWFtOiBodHRwczovL2dpdGh1Yi5jb20vcHBwLXByb2plY3QvcHBwL2Nv
bW1pdC8zYTRmZWM5NjgxNzRmZDZmMzg3ZDVlYzg3MmE1NjM0M2YyNTZmNjQ1CitTaWduZWQtb2Zm
LWJ5OiBBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5sb3Rob3JlQGJvb3RsaW4uY29tPgorLS0tCisg
cHBwZC90ZGIuYyB8IDggKysrKysrKysKKyAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
CisKK2RpZmYgLS1naXQgYS9wcHBkL3RkYi5jIGIvcHBwZC90ZGIuYworaW5kZXggOGE1NjNmODhi
OWE2Li42MjY0NDE3MWFhNmUgMTAwNjQ0CistLS0gYS9wcHBkL3RkYi5jCisrKysgYi9wcHBkL3Rk
Yi5jCitAQCAtNjAsOCArNjAsMTEgQEAKKyAjaW5jbHVkZSA8c3lzL21tYW4uaD4KKyAjaW5jbHVk
ZSA8c3lzL3N0YXQuaD4KKyAjaW5jbHVkZSA8c2lnbmFsLmg+CisrCisrI2luY2x1ZGUgInBwcGQt
cHJpdmF0ZS5oIgorICNpbmNsdWRlICJ0ZGIuaCIKKyAjaW5jbHVkZSAic3BpbmxvY2suaCIKKysj
aW5jbHVkZSAicGF0aG5hbWVzLmgiCisgCisgI2RlZmluZSBUREJfTUFHSUNfRk9PRCAiVERCIGZp
bGVcbiIKKyAjZGVmaW5lIFREQl9WRVJTSU9OICgweDI2MDExOTY3ICsgNikKK0BAIC0xNzI4LDcg
KzE3MzEsMTIgQEAgVERCX0NPTlRFWFQgKnRkYl9vcGVuX2V4KGNvbnN0IGNoYXIgKm5hbWUsIGlu
dCBoYXNoX3NpemUsIGludCB0ZGJfZmxhZ3MsCisgCQlnb3RvIGludGVybmFsOworIAl9CisgCisr
YWdhaW46CisgCWlmICgodGRiLT5mZCA9IG9wZW4obmFtZSwgb3Blbl9mbGFncywgbW9kZSkpID09
IC0xKSB7CisrCQlpZiAoKG9wZW5fZmxhZ3MgJiBPX0NSRUFUKSAmJiBlcnJubyA9PSBFTk9FTlQg
JiYKKysJCQlta2Rpcl9yZWN1cnNpdmUoUFBQX1BBVEhfVkFSUlVOKSA9PSAwKQorKwkJCWdvdG8g
YWdhaW47CisrCisgCQlUREJfTE9HKCh0ZGIsIDUsICJ0ZGJfb3Blbl9leDogY291bGQgbm90IG9w
ZW4gZmlsZSAlczogJXNcbiIsCisgCQkJIG5hbWUsIHN0cmVycm9yKGVycm5vKSkpOworIAkJZ290
byBmYWlsOwkvKiBlcnJubyBzZXQgYnkgb3BlbigyKSAqLworLS0gCisyLjQ0LjAKKwotLSAKMi40
NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
