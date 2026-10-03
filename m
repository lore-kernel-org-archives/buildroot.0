Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B98CCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F8C260609;
	Sat,  3 Oct 2026 07:04:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRAYuOgIJgyE; Sat,  3 Oct 2026 07:04:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7CC796061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791011046;
	b=aPo/4MS8C8S+pezpod8KN1jMi3B0P7s24nfitwvMrXDaTy1BOJ7YTWrAjcOE8GibMnIO
	 879DGI7X7lL3JlRhKQZGKTgPR33H2V9vJcbzAh0sDipp0LQi3eP9cBXGK/xN9EuBvRpJh
	 of66BtA77uemfD2ajqyOHhTIK9UO4JU0CJTkjObUzZBJD2t1gQvl8ZGdTyUoua1dmmk+p
	 HSJEBgDHA04PkhN6KMFKVQRL7ZQgj7GXOv3xPptkkHO46g0X7fm9FBfdRhubNnvwjX4we
	 /a1yOxXwbCglXK0lIImbeX2j2d14m+CT9JYBubF908+DMc95mUSWbsv70aVfZOtvJJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791011046;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=KWODuMaYPeVLz+dgRjhEcCvUhoEk47rzPSJoWBmhvgQ=;
	b=qJ+aKhBPjS+GbKJMsT/exYC9UnCyQo9ss4VD3QJiYjKiUfyQ7oDTp1vrXwnVQuSMTCb8
	 qN1/MVvhd+tChX0Jli3Q1MnkeT38+LY7DatL4vQmtqquovoNSaSb7OO4mCFKfAfYNFxu2
	 TlLhDTEd/DiXffhPvtg2FJC/QXPPhkhiIR8onV3FhaxIB+oVBijR28tVIRFEcbP2Mh5Jx
	 1hjJBxpHJvd1Pryvs9J7qzsTekTcfmQpR2QWKv+E6w7ZAvc9GtnV8OXZiP3BIs/xTdrjK
	 8spZqcBzUmTkgPQQDxZ9uu1dqc68P8diIYm+qX0h5QWEfEYBh+prsYLJTG2XDlLVJlg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=fkxp4qQ1;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791011046;
	bh=KWODuMaYPeVLz+dgRjhEcCvUhoEk47rzPSJoWBmhvgQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Qht2kTAcHESxV5DsBVwVoTxrSDKjMSsiByVWtPnWQIQcAOqlB9xL5oYs1gmp+kEeI
	 OvU3l76HxDfMIyrJoxbRnWg07fMPxOtZ7VkrdUittesO24Cw3m2DXB4V2mC1B5XJOG
	 YTFAu0vdhW3CkxuzIVluyOXyGMrJ2Mfu1K+cdTBF5cVx41ddmlp84yI7g3M4Ktf4qF
	 VB1xac/qWHzXmULwSnDNZCfJeKciWg1DZwP5CNb9J/OpNFE9Y6uYjXibd5A1KP6GT4
	 RrOtAZSpl5mJNic1WCsAMGokpefgGMZT56CrGtU/Vkd9UkfC2t91gUvtwcSb9Ip1LW
	 8vdYE/TrhKyeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CC796061C;
	Sat,  3 Oct 2026 07:04:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE8D42E0
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B44EC60623
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUbGWqx07-_P for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:04:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C1BAB60609
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791011044;
 b=TRWvSUjrj5IT+xqq0pTMQG5N2sepyxIxBrhtsMiN60yqSX2ScAac9ucmiCVff3aSWrpX
 +aI1qrHIAointYlz+bkdWHr8RDigWRdEeCNbQi4XHteASi38eAcVXoeil+o4SOfvs2A6f
 Gde0iVyVIR4SopVeQGRR1Wxd3/O5wKaMxPHagNdSl7hK+DFT19ZuLr/n8+xpKKVw6OcfH
 vy9wTcmClIaMcYrbG9hTkQ/pT3ExNfUM5w3RPbCGzyiNh/zMEBO8VBNuiFELXoiLyF/Qz
 tkDqbjSaCY0T5nEcP01UnvMF4L35DqNa7hYtbHudmFm7jISeoaZvlOA+/kDZBd/RlRA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791011044;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=y+SooChOmKMyO3fOPu97qcrEKPkiO/7ZivX7LRfTIO8=;
 b=q7BYyTlbom3DK+vCsvv055ORAoOzPF71251755+pnA5oHbO2XmliPqP34bdgdweLYGmF
 Kmv6PFfIaEbjla4r5GKPXgIMciCcwFMjo2wfAFDivum/n2rQGtJ/0rTEqeuehGi4CV7v5
 TbHNgicoSpP0NKs6xs3G5pSUAIZANc3Ze/xPT4ks8GQ0vAK7Imz8hOejEjYVPQItQ7hta
 DL0YjwlHrr/ZRychuVRsGrEn4FujogCPaZxn/yX6N3vA0iuYv5vrbfqVSu/TUko6xwf5g
 49PUOm2AOumVSzRtnzp1K7XNqEGWUdCuN7qdTwmLL3exSVGVJw7Ash+QbIXLfWk3htA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=fkxp4qQ1; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=fkxp4qQ1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1BAB60609
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791010923;
 bh=y+SooChOmKMyO3fOPu97qcrEKPkiO/7ZivX7LRfTIO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fkxp4qQ1xD45RfP47XjIyh9VPSclQwHEp4tRIFllDlbeAYy8dHNpooIWRngNOg0/s
 VU+TdsBBvKlZb1cbYwETRKByJy7AMgQp9PVHkKAqiGap66zcNqKf4Vy3zneKkShZyH
 I7vlb5/CKe2BJ+GfheLn3rDEblPgIwv671cAQHK3wn4HbcWhd2Zt+1pTQu7yB3EP72
 W1Pg/oiQ8Q4lOvj/UzQ+fID1vFYZSQp9m3frfSGyPXcE3EBnReAa0Uj72ftT9de3mS
 RX38ZTzq+nbKUAtnEwrwoei+hlLRRNIpJM3O72CCrUhG14fEVG9ByOSYM9PIFET37H
 lixaW0zUVLT1Q==
X-KAS-Sym: v3:f51bdf72230551df:VqMTyGEcl2GJp/akTftrKMgcPyezivNX+fOLOm9ncnigH
 pNFvxOG3DbE5s98QwUKc0+pVLoDU9niaXtrdppC307xvfy2ZRvK81G4RIKqo5daA5GNZSwddO5w
 qLhxMnBm1ZL/vu3uvejsivYqpikrzacdo7+61qTZJJ9eL6iWs8tJ+vv6P6mwr6nRgjCRtv3Rwzq
 +JQSM4Woxf1JlUmiYTM175O4JgoLN/VF3JIDkRpmn8CEnEYfiQ0wZ4omAbqIJqsY9QV1EiODtvQ
 /YbmJc9J/NA6DXwTO2eQ2zs/WqqYsDZlGWMNnp9VEvu1hCfuFnOalkQDg8qJ+aPdWX61oK4w==:
 5FgMiTWQkaswHfBYed6GbpwU2y4Vb4a/pj4ASOomKolWLGj29V9Q8lj7puGUaclbeES0qo02Vx2
 ldGpjPOYhJxNr5O7byqTBVQoOhDjX9mUxpgmbIryMV5F3E1kRWzb96qVMxayJoEYA7or82I4aRH
 u8UI1khnVJ2Mz9EB19kFpQdUIIzFfIIR15P8mF9vl/DmPu6d2bpyXEv5FnyQigoscE6iGORI5nf
 1bSgdDuTAj7F00VMG4PS7DU4fptY0uhYxS1kIN3UMChQtdttu+wBObNtb1gr6K3EDtEjpB6KW5D
 +3s8oCn8cACrlGalFhw/sK76Gb91/CYoj8L2tXjrlG4+9tupcmM3/lXIMWvSMRrJeg1PYOy4jRO
 1bdyehjKO+3dkL/h0XRSxTF48eichbPb0p6+5upF/4fyIMZJaSijWS/EoVI5eOFiiffk++0bVZx
 8A9qJMSPD3/pUuG/326TRQ9Ii6oEjV57lf7IgyM2saqktE+q5370e/RB7iPuSXMxNBzG+PTZFAa
 l27i0FiWOKsMgAPQHIvPdt6wYM+zpLA3Z+1dTC4j97p5KyJDPe0OD+THPhhQkcOS5rfVCRnHDs0
 ZcD4HgtU0XDQbGFLrzKRHdYYZ3jF1zzOvC4q6EDqzep7iAiXI/ivwSQlEEWR51BO0Q==
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 04186A4C5413;
 Sat,  3 Oct 2026 09:02:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:55754)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtkj-000000007Zo-2rtC;
 Sat, 03 Oct 2026 07:01:49 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat,  3 Oct 2026 09:01:23 +0200
Message-ID: <20261003070128.1295458-111-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261003070128.1295458-1-bernd@kuhls.net>
References: <20261003070128.1295458-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 111/114] package/python-zipstream-ng: bump
 version to 1.9.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pR0Ps/zipstream-ng/blob/v1.9.3/CHANGELOG.md

Upstream switched to hatch in version 1.9.1:
https://github.com/pR0Ps/zipstream-ng/commit/c85623da96430f46471cb052508a7bb2d08f8665

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-zipstream-ng/python-zipstream-ng.hash | 4 ++--
 package/python-zipstream-ng/python-zipstream-ng.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-zipstream-ng/python-zipstream-ng.hash b/package/python-zipstream-ng/python-zipstream-ng.hash
index 4360cd07b3..8457168cae 100644
--- a/package/python-zipstream-ng/python-zipstream-ng.hash
+++ b/package/python-zipstream-ng/python-zipstream-ng.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zipstream-ng/json
-md5  eb08f32b64b28005d5d3846cf49aabd3  zipstream_ng-1.9.0.tar.gz
-sha256  a0d94030822d137efbf80dfdc680603c42f804696f41147bb3db895df667daea  zipstream_ng-1.9.0.tar.gz
+md5  c2cbad4c5fa2f803c5cfab86fae726b2  zipstream_ng-1.9.3.tar.gz
+sha256  6cebd055025699c0af594c76a9452cdf13f4be67ee005b6907f0d3c9c6f44ced  zipstream_ng-1.9.3.tar.gz
 # Locally computed sha256 checksums
 sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  LICENSE
diff --git a/package/python-zipstream-ng/python-zipstream-ng.mk b/package/python-zipstream-ng/python-zipstream-ng.mk
index 35e03d041b..beb17e0cbd 100644
--- a/package/python-zipstream-ng/python-zipstream-ng.mk
+++ b/package/python-zipstream-ng/python-zipstream-ng.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_ZIPSTREAM_NG_VERSION = 1.9.0
+PYTHON_ZIPSTREAM_NG_VERSION = 1.9.3
 PYTHON_ZIPSTREAM_NG_SOURCE = zipstream_ng-$(PYTHON_ZIPSTREAM_NG_VERSION).tar.gz
-PYTHON_ZIPSTREAM_NG_SITE = https://files.pythonhosted.org/packages/11/f2/690a35762cf8366ce6f3b644805de970bd6a897ca44ce74184c7b2bc94e7
-PYTHON_ZIPSTREAM_NG_SETUP_TYPE = setuptools
+PYTHON_ZIPSTREAM_NG_SITE = https://files.pythonhosted.org/packages/f3/e0/76e5a674b0f6a6b7f90af9b87a92fbe1f2b97da447fb09078bcba6f6a28e
+PYTHON_ZIPSTREAM_NG_SETUP_TYPE = hatch
 PYTHON_ZIPSTREAM_NG_LICENSE = LGPL-3.0
 PYTHON_ZIPSTREAM_NG_LICENSE_FILES = LICENSE
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
