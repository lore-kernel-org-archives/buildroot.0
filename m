Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EDFCCDE00E
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 21:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADF9B6087F;
	Thu, 25 Jun 2026 21:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WEe_NRRjeLNZ; Thu, 25 Jun 2026 21:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5D4D6087B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782422657;
	bh=5Mq0MWv5yae326f+tzxYPHGjlKYta9/wLMLZcAMZrpA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=niQ+YrvvxjrzyEigIXP2k+GlTT4k3VgFyqWPyNXoWk1A1r6Gi2r+ojqbGQY/PF/fF
	 pniK3viaLVbji/+4qrEIpcq/o3bpcir4G39Y+5/vIlTaeCo7iY0hwF5WtJkLDUKcHJ
	 0fzZMOZBLIHAA/dRKK9jcymgorg8P0HbbixIXpG9VpthBNmHuw0nZlKywgJEupda48
	 TQhALkSeTDZlrkOroSm0Va5PP4uszR/Klhn456iPCePliaiy3GYM6bIo4TLfMF/K4H
	 X+vCTCG/b+p4PkvIM3ppJSVGAv4sNG0sdkrOSUjcOSRlTbBeiY65UyLbSh9BJcCwQ0
	 S6jDQdwE3qK2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D4D6087B;
	Thu, 25 Jun 2026 21:24:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23180FE1
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 21:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17BB240DFA
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 21:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XMUjhKv8VZOs for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 21:24:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5E4B40DF0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5E4B40DF0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5E4B40DF0
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 21:24:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c081.dip0.t-ipconnect.de [79.214.192.129])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 06336A4C2BB7;
 Thu, 25 Jun 2026 23:24:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40786)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wcrYM-000000006gN-44nk;
 Thu, 25 Jun 2026 21:24:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 25 Jun 2026 23:24:06 +0200
Message-ID: <20260625212406.3148001-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1782422647;
 bh=MX4Y9nOZIbce/fYrT88KXzBsbMROP8x9eY3+Y3NCJX8=;
 h=From:To:Cc:Subject:Date:From;
 b=Hg+VvDwO5Cey6+b5BpVB3CjZkideXi9RUzxPMH1HJYfyp1lr+lxAOZVb82T0rnmxY
 zBfwkFn1lK8OSK4GOT1PTzP2K/NhDwKGg7KsxLVq15TSXH2dTEHviDBTBkf/zpn4FS
 VnQd/AZOuzE4OtunkR43E7BxWCdUfgOuqKq7QE8aYnoEtea1GDWfTG6q6sMDyGbONj
 tnnsrWnkr3C5eG61GmPvH716tmPHb3PITs6p6r2AN8hrLZGRI08vfHlUng8zuIEgR+
 Zy8li9ib5JYRWBrzfJAaK+dPes1zVBhwd1ptFOvupq89zmlaWoQgXDQbu1navBanJT
 1tTycS/FVq4xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Hg+VvDwO
Subject: [Buildroot] [PATCH 1/1] package/expat: security bump version to
 2.8.2
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

aHR0cHM6Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L2Jsb2IvUl8yXzhfMi9leHBhdC9D
aGFuZ2VzCmh0dHBzOi8vYmxvZy5oYXJ0d29yay5vcmcvcG9zdHMvZXhwYXQtMi04LTItcmVsZWFz
ZWQvCgpGaXhlcyB0aGUgZm9sbG93aW5nIENWRXM6CgogICAgQ1ZFLTIwMjYtNTAyMTkg4oCUIG1p
c3NpbmcgY29udHJvbCBmbG93IGludGVncml0eSBjaGVja3MKICAgIENWRS0yMDI2LTU2MTMxIOKA
lCBtaXNzaW5nIGNvbnRyb2wgZmxvdyBpbnRlZ3JpdHkgY2hlY2tzCiAgICBDVkUtMjAyNi01NjEz
MiDigJQgb3V0LW9mLWJvdW5kcyB3cml0ZQogICAgQ1ZFLTIwMjYtNTY0MDMg4oCUIGludGVnZXIg
b3ZlcmZsb3cKICAgIENWRS0yMDI2LTU2NDA0IOKAlCBpbnRlZ2VyIG92ZXJmbG93CiAgICBDVkUt
MjAyNi01NjQwNSDigJQgaW50ZWdlciBvdmVyZmxvdwogICAgQ1ZFLTIwMjYtNTY0MDYg4oCUIGlu
dGVnZXIgb3ZlcmZsb3cKICAgIENWRS0yMDI2LTU2NDA3IOKAlCBpbnRlZ2VyIG92ZXJmbG93CiAg
ICBDVkUtMjAyNi01NjQwOCDigJQgaW50ZWdlciBvdmVyZmxvdwogICAgQ1ZFLTIwMjYtNTY0MDkg
4oCUIGludGVnZXIgb3ZlcmZsb3cKICAgIENWRS0yMDI2LTU2NDEwIOKAlCBpbnRlZ2VyIG92ZXJm
bG93CiAgICBDVkUtMjAyNi01NjQxMSDigJQgaW50ZWdlciBvdmVyZmxvdwogICAgQ1ZFLTIwMjYt
NTY0MTIg4oCUIG1pc3NpbmcgY29udHJvbCBmbG93IGludGVncml0eSBjaGVja3MKClNpZ25lZC1v
ZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+Ci0tLQogcGFja2FnZS9leHBhdC9l
eHBhdC5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL2V4cGF0L2V4cGF0Lm1rICAgfCAyICstCiAyIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9wYWNrYWdlL2V4cGF0L2V4cGF0Lmhhc2ggYi9wYWNrYWdlL2V4cGF0L2V4cGF0Lmhhc2gKaW5k
ZXggNWQzNGFkZmM4ZC4uMjA4NzEzMzM4MiAxMDA2NDQKLS0tIGEvcGFja2FnZS9leHBhdC9leHBh
dC5oYXNoCisrKyBiL3BhY2thZ2UvZXhwYXQvZXhwYXQuaGFzaApAQCAtMSw0ICsxLDQgQEAKLSMg
RnJvbSBodHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGliZXhwYXQvcmVsZWFzZXMvdGFnL1Jf
Ml84XzEKLXNoYTI1NiAgMTBiMTk1ZWU3ODE2MGE5MDgzODgxODBhOGZlMzYwM2Q0ZTlhMTJmNDc1
NWZiZjVmMzgxNmIyM2E5ZDc1MGRhMCAgZXhwYXQtMi44LjEudGFyLnh6CisjIEZyb20gaHR0cHM6
Ly9naXRodWIuY29tL2xpYmV4cGF0L2xpYmV4cGF0L3JlbGVhc2VzL3RhZy9SXzJfOF8yCitzaGEy
NTYgIDNhZDg5Yjg1ODhlNjY0NGJkNGU0OTk4MTQ4MGQ0OGIyMTI4OWVlYmJjZDRmMGExYTRhZmIx
YzI5Zjk5YjZhYjQgIGV4cGF0LTIuOC4yLnRhci54egogIyBMb2NhbGx5IGNhbGN1bGF0ZWQKIHNo
YTI1NiAgMzFiMTVkZTgyYWExOWE4NDUxNTYxNjlhMTdhNTQ4OGJmNTk3ZTU2MWIyYzMxOGQxNTll
ZDU4MzEzOWIyNWU4NyAgQ09QWUlORwpkaWZmIC0tZ2l0IGEvcGFja2FnZS9leHBhdC9leHBhdC5t
ayBiL3BhY2thZ2UvZXhwYXQvZXhwYXQubWsKaW5kZXggM2I1MjljMzM5MC4uZmIyNWE0YTQ3YiAx
MDA2NDQKLS0tIGEvcGFja2FnZS9leHBhdC9leHBhdC5taworKysgYi9wYWNrYWdlL2V4cGF0L2V4
cGF0Lm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotRVhQ
QVRfVkVSU0lPTiA9IDIuOC4xCitFWFBBVF9WRVJTSU9OID0gMi44LjIKIEVYUEFUX1NJVEUgPSBo
dHRwczovL2dpdGh1Yi5jb20vbGliZXhwYXQvbGliZXhwYXQvcmVsZWFzZXMvZG93bmxvYWQvUl8k
KHN1YnN0IC4sXywkKEVYUEFUX1ZFUlNJT04pKQogRVhQQVRfU09VUkNFID0gZXhwYXQtJChFWFBB
VF9WRVJTSU9OKS50YXIueHoKIEVYUEFUX0lOU1RBTExfU1RBR0lORyA9IFlFUwotLSAKMi40Ny4z
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
