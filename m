Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A78D59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 15:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB13C60D89;
	Sun, 14 Dec 2025 15:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vmQGMZMI3MvL; Sun, 14 Dec 2025 15:37:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 477CB60D9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765726647;
	bh=c2X8Fij6TPVCo91K7rioKnGCMxJMwTjRfWazsEoOyh8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=dsB4ijRy8H6IcwC517009gS99lpQExbfEcjy+hIsA49bvVrIlS9MhekNYGeWxUbUE
	 ckuxoAhnCEazP3SuHnYG8WmPsGzcj6UkIErIGMZ4zBRq0lF8nxS5vFBITtbJ0sjMoo
	 w5c1yXHQMUyurTK2A+YCzrj3FRsu5JByZKzkgLZjNsii4ZLhzxFp4F3E40LOPXU8X0
	 Ya8CjDXgfBGvIOUDYhWO54yO0guM6ESg2N8+1OIvYNrRLL+Iykz7Km1k0siMYCZkpT
	 9A78on2p7PevYHyFgeH5KYbr188kE7HNrVaaW5uNgsseKYjp/p6R6q7hl5kziwuyf9
	 cC2TOCac8x35Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 477CB60D9E;
	Sun, 14 Dec 2025 15:37:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 478412C1
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 15:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A438403AC
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 15:37:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B82hyof47LF2 for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 15:37:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 428FF40298
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 428FF40298
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 428FF40298
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 15:37:25 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 698DA1A219F;
 Sun, 14 Dec 2025 15:37:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 37ECB60713;
 Sun, 14 Dec 2025 15:37:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C5FFB11940D06; Sun, 14 Dec 2025 16:37:20 +0100 (CET)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 16:37:09 +0100
Message-ID: <20251214153711.766150-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214153711.766150-1-thomas.petazzoni@bootlin.com>
References: <20251214153711.766150-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765726641; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=VopE5Xc0ZwG/+gmO2DFFfvrcSu8+y8tpt7G4FAJjoDY=;
 b=ynfSIc3PvoNQ5A3I7axs2m6YauDK6pdPtiR/vmqbumJpKl0Gk/G10Fa/63/nBR8jFJECS0
 uObfEd2hE75nXEnGiehAF1oE2tb68bZTVdTOLtAKRkwNuy5oe3vX2mN+enoXTcv2of4lPX
 Uysfeu+hHk4lZ7/obPO3t29e0zT7REDgI2vw4zFIOPXIqPH2vzYYMuR/3q7jrs8QQRLL5c
 pP4yxHHlLhzA69UrB3PcxxRxFwCz3itIf6u/iomAW7E305PMDI+3DX+JlL7SgTV/fKF3+I
 ts0hLjj2CgOs68uhAUhnHb4bvLtZRcI6dSYqug2cCw4EHllKtkDiPlMxUnJltg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ynfSIc3P
Subject: [Buildroot] [PATCH 2/2] toolchain/Config.in: drop
 BR2_TOOLCHAIN_HAS_GCC_BUG_121567
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

R0NDIGJ1ZyAxMjE1NjcgaXMgYWN0dWFsbHkgYSBkdXBsaWNhdGUgb2YgR0NDIGJ1ZyA4MTQyNiwg
d2hpY2ggYWxyZWFkeQpleGlzdGVkIHVwc3RyZWFtLCBhbmQgZm9yIHdoaWNoIHdlIGFscmVhZHkg
aGFkCkJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfODEyNDYuCgpJbiBhZGRpdGlvbiwgQlIyX1RP
T0xDSEFJTl9IQVNfR0NDX0JVR184MTI0NiBpcyBjb3JyZWN0bHkgZGVmaW5lZCBhcwphZmZlY3Rp
bmcgU3VwZXJIIHJlZ2FyZGxlc3Mgb2YgdGhlIG9wdGltaXphdGlvbiBsZXZlbC4gSW5kZWVkLCB3
aGVuCkJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfMTIxNTY3IHdhcyBpbnRyb2R1Y2VkLCBpdCB3
YXMgdGhvdWdodCB0aGF0Cm9ubHkgLU8yIGFuZCAtTzMgbGV2ZWxzIGFyZSBhZmZlY3RlZCwgYnV0
IC1PZywgLU8xIGFuZCAtT2Zhc3QgYXJlIGFsc28KYWZmZWN0ZWQsIGNhdXNpbmcgdGhlIHB5dGhv
bjMgYnVpbGQgdG8gZmFpbC4KCkZpeGVzOgoKICBodHRwczovL2F1dG9idWlsZC5idWlsZHJvb3Qu
bmV0L3Jlc3VsdHMvYWNhMTgxMjQxNWVlODRlZWYyMjNiMGZkZmY4OGYzMWEzOTc3NTI5NC8gKC1P
MSBidWlsZCkKCiAgaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzLzNmZDkx
Y2UzZmY4NzI3ZDJmOWMxMmY2NzIxZGY5MjJjNjAyODJkNzAvICgtT2Zhc3QgYnVpbGQpCgogIGh0
dHBzOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9lNTUzNmRjZjU5OGE1MWY1MDA2
MzQzNTEzYTc2ZjRlMjIzZTgwYTU1LyAoLU9nIGJ1aWxkKQoKU2lnbmVkLW9mZi1ieTogVGhvbWFz
IFBldGF6em9uaSA8dGhvbWFzLnBldGF6em9uaUBib290bGluLmNvbT4KLS0tCiBwYWNrYWdlL3B5
dGhvbjMvcHl0aG9uMy5tayB8ICAyICstCiB0b29sY2hhaW4vQ29uZmlnLmluICAgICAgICB8IDEz
ICsrKy0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbjMvcHl0aG9uMy5tayBiL3BhY2th
Z2UvcHl0aG9uMy9weXRob24zLm1rCmluZGV4IDRlNjYwZWNlZTIuLjA2OTA2NzhjMDQgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvcHl0aG9uMy9weXRob24zLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uMy9w
eXRob24zLm1rCkBAIC0xOTEsNyArMTkxLDcgQEAgZW5kaWYKIAogUFlUSE9OM19DRkxBR1MgPSAk
KFRBUkdFVF9DRkxBR1MpCiAKLWlmZXEgKCQoQlIyX1RPT0xDSEFJTl9IQVNfR0NDX0JVR18xMjE1
NjcpLHkpCitpZmVxICgkKEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfODE0MjYpLHkpCiBQWVRI
T04zX0NGTEFHUyArPSAtTzAKIGVuZGlmCiAKZGlmZiAtLWdpdCBhL3Rvb2xjaGFpbi9Db25maWcu
aW4gYi90b29sY2hhaW4vQ29uZmlnLmluCmluZGV4IDgzMzBlNjUyYzIuLjk5MzM3YTE4NzMgMTAw
NjQ0Ci0tLSBhL3Rvb2xjaGFpbi9Db25maWcuaW4KKysrIGIvdG9vbGNoYWluL0NvbmZpZy5pbgpA
QCAtMTQxLDYgKzE0MSw5IEBAIGNvbmZpZyBCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzY4NDg1
CiAJZGVmYXVsdCB5IGlmIEJSMl9taWNyb2JsYXplCiAKICMgaHR0cHM6Ly9nY2MuZ251Lm9yZy9i
dWd6aWxsYS9zaG93X2J1Zy5jZ2k/aWQ9ODE0MjYKKyMgZXJyb3I6IHVuYWJsZSB0byBmaW5kIGEg
cmVnaXN0ZXIgdG8gc3BpbGwgaW4gY2xhc3Mg4oCYUjBfUkVHU+KAmQorIyBUaGUgYnVnIGV4aXN0
cyBhdCBsZWFzdCBzaW5jZSBnY2MgNi54LCBzbyB3ZSBhcmUgYXNzdW1pbmcgaXQgYWZmZWN0cwor
IyBhbGwgR0NDIHZlcnNpb25zLgogY29uZmlnIEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfODE0
MjYKIAlib29sCiAJZGVmYXVsdCB5IGlmIEJSMl9zaApAQCAtMjQzLDE2ICsyNDYsNiBAQCBjb25m
aWcgQlIyX1RPT0xDSEFJTl9IQVNfR0NDX0JVR18xMTEwMDEKIAkJICAgQlIyX09QVElNSVpFXzIg
fHwgXAogCQkgICBCUjJfT1BUSU1JWkVfMwogCi0jIGh0dHBzOi8vZ2NjLmdudS5vcmcvYnVnemls
bGEvc2hvd19idWcuY2dpP2lkPTEyMTU2NwotIyBlcnJvcjogdW5hYmxlIHRvIGZpbmQgYSByZWdp
c3RlciB0byBzcGlsbCBpbiBjbGFzcyDigJhSMF9SRUdT4oCZCi0jIFRoZSBidWcgZXhpc3RzIGF0
IGxlYXN0IHNpbmNlIGdjYyA2LngsIHNvIHdlIGFyZSBhc3N1bWluZyBpdCBhZmZlY3RzCi0jIGFs
bCBHQ0MgdmVyc2lvbnMuCi1jb25maWcgQlIyX1RPT0xDSEFJTl9IQVNfR0NDX0JVR18xMjE1NjcK
LQlib29sCi0JZGVmYXVsdCB5IGlmIEJSMl9zaAotCWRlcGVuZHMgb24gQlIyX09QVElNSVpFXzIg
fHwgXAotCQkgICBCUjJfT1BUSU1JWkVfMwotCiBjb25maWcgQlIyX1RPT0xDSEFJTl9IQVNfTkFU
SVZFX1JQQwogCWJvb2wKIAotLSAKMi41Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
