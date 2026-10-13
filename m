Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFC5CC6B15
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 21:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B57A60896;
	Tue, 13 Oct 2026 21:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQQ3NwgG9Vi2; Tue, 13 Oct 2026 21:20:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4CC5D60860
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791926450;
	b=qyxwN95p/iBQYAZrq+L4XGj7Mkj8mrDHH8jay2ckYFSAZJpJrH+dybtsCkYM1sP8h2bZ
	 4FuH94a7r9cZbDodjYgAmp8DK7qWRyeSTERkgt9/S8HzWxlI7ZMJUUxK+9uf7D4idrFNa
	 mfRCru8v14nBaW1CEpkCXNYsoK2WSq9QTvmgMKjznBgNkgNujLkaTT1iuxLRBPh7CBEn4
	 rdUFKtilBMdy363txxiggbx+s5sfwT642LucaQ6getc0qC35tRxnmXsgmH6j+3tRPJjB/
	 LEmQ5yuvUBQvKlQ/YIHlohuzOXgUPbbfqLhhD1CQu2qjP0A2c9u6JhIZlJr+0Mu6qYA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791926450;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=P/VrcxGnrFFI6gYl+oDBduhKQsYTadEWZh6NByoub5Q=;
	b=Q6gWUyM6EFSHZgLCtck3j2gyDUG+5CF0Yy+gj+ThjQUa4V+hCOJGyi+DcVvpYLOBBcn6
	 2pvQiv5v8GOa4t81DQjxlPPh86afMPKxyaJnMjHn3l9gO7CYinVpk3T+fOE0mf+9cfGxG
	 H8puOlmJCc91llfq2dCIJi+e4L0/qdG+MEp/V5DepL9jbXp0gnP+3cu7cANcpDqVU7g/l
	 9Vf03Ba/dztXFz2bbw9tUKmX2lRULcPuIP9KELK0slv7FHk1NIbJkRmIr/zmV7jAc8n1K
	 bmaYflsfak1CKOurEATfPEeUJSV2ln2eUocgczRtFCkDKM8M4TS0LrNh6dIpeau8e9A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791926450;
	bh=P/VrcxGnrFFI6gYl+oDBduhKQsYTadEWZh6NByoub5Q=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TdrIg2riSLGNC4hP8sut2g0tksFI9QRjHzwGgQyLaH/2krqqB496bhRLtULD6hYfn
	 ybyX1cIt3Ww9XZTnD0WnVbipV2Jgq7lTsXqQI22lpH/95XX/2SFv2I7OCIg4I7WBzy
	 wBeN7hFCbFPacvrXNt+HVOmBSygoKz2racR9QbSdrdzeoFGcIyTKhkYoNRb8jrNiAm
	 NazABDV5raSgmLvyjQtqpAlg/y3F8rOrXYz+0kw+Yi0lTyT19kHzt4zgzkdUfYTxJE
	 2cCt0zDRhnXYcUII3/MrcVbU2zuizsjCnv9tSdyuiUq3HifD46ts/BwAlkbO45mAX7
	 diYi3gb5AGK3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CC5D60860;
	Tue, 13 Oct 2026 21:20:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E7622AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C54D80564
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYbR3oGKK9fe for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 21:20:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9657080870
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::231"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791926445;
 b=asEJLyTQidWqT1yjbTLzcwdyrGaKj59nZcWuRuMz9CBBqokW+90KBLGfB1+WhgdfX/a7
 XcORH2eZEd5QEEaWhTZ9oZBe6OTt+onQ4e15dzSxOx4DUey/48mEa9f+/WP7ifPmrvTQe
 MZA/N47LAQz/gIDDiHy1ROcmh2xZ7cRtifV4uIMK+joQo2SqEt/xhVszkc37veHjHQmVi
 +FnFhsPtmJniFGxA6WVzI9ZJvRruj78y9vvkNUmk6f2sfwk4tYhV3UAqVJIlhCvXqJj+l
 3yJfHCuDXEu5Bwt838/qy82IfYsfDfD7meUwh2WB5ubTs5qUZyGE14JSJ3igL4Hyr/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791926445;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=/Jrhi1STNqNLabgSCoMkl6eWn4HZd8Tnkhm3IgJ8J5Y=;
 b=Z2nSLi7qTM70ZP4bYKuFtdm+kbEbwRdr95/2DeTlMl3VU1xGQb92edoBcCKJVJ5sGxeQ
 XvcW/bP36hN1lnarQzJTAYtW8m/DMTeTpeeNqbJf5eS0YX6+mvBQlSwmjX7VtRjUhAdJr
 J7Ug2ECtqkkqVLga+1q4Ks+XIioqAXpEagGquKwZhscfgllbN/BSVRsqpG8/GG1bzcHPI
 NrddeE4hlWNOy4XH0jwzI8hD3oY/gurOyzRWMJ1sanMJQn+BvjRjCgHGfoUbCCF+M+fjh
 /aSnpdIgiJ6oU5ATAll3kGIREmdYwc055wkJULgxKWKpoOzxyAF1kMApr+M05y+xBsg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=oTjdWEr6; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::231"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::231; helo=mail-oi1-x231.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=oTjdWEr6
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9657080870
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 21:20:44 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-4b21f71613fso2279829b6e.2
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 14:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791926444; x=1792531244; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/Jrhi1STNqNLabgSCoMkl6eWn4HZd8Tnkhm3IgJ8J5Y=;
 b=oTjdWEr6+T19gYlAgUkl+2OhCtkFDxXmzLpk0BjKGZGa3F0CDA+PceRI1h+Z1vGwgw
 4rHAMQsCPeR/90tw0yECEqOGW18MwAFDTUqxd6eBUQ5BkYn9z8W1cRLmgbIGA+82uFYz
 EzI3DEdXsnaFDiIwYYvWmqpvb6hO96pY1BKZS2S61sjEaogQL2tCeWhnpf7onHU+RmjG
 vynxKSuLSN5a320vww7vT45SOKVHTXpFsAKPen8br2JW/jMzmSSqXC59dClkxnz2u40G
 3yHQBGTW7j/OTB6e4yjsZ35DAzHeFwx9Bkxcg1ZaVVXUseJWtwBi6LPD4gTFQPmCBtY/
 Hf3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791926444; x=1792531244;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/Jrhi1STNqNLabgSCoMkl6eWn4HZd8Tnkhm3IgJ8J5Y=;
 b=nZU0bcXUdPjZQg6M/LOFG1xZwdr/eykF89b2cWojvehloP3JFAlW9dlpUJsfkG/ql/
 c2NYu/rzSiRDuK200WiDI+lQ5ibb92L6WvnKoTjFGZvFAzZk/TLU/IsXvpihNCypi1Mh
 zQ9Ut9stDXVAs0HkeD6MoSicbyhGpxHKjEXctligtUs6DQxRbIrdVxbragVkErdUfm3K
 Kon3Y8ypIG9ESbgjl1XJrV6h/x4RXpxnhZkVBOwFWdbXe81B0xD7dCsd2KSnu+uR4s41
 EGIR8vTsefN2fhBdmyIRlshbCuFeD2zwn4FLKBMKkwfZr+qMy+JDoYerSWaRMn7ujtqk
 7Xew==
X-Gm-Message-State: AFq9FYJS6T28j5P/b5koC4fGPq+uNIQkSKP+lLyEpsk4JHTk1xcRKxUm
 N3dECpIf1D9/1Ib5jCB8dad5VBvAqUAKiwMXpP7Q8DWSyCI5FvcgFK3B4Ahd1WxE
X-Gm-Gg: AYBFou0KzKwhw0JhPdNtBsIhLlfOUKjrVQy5ZttGXD/k3fh7wil2FC71za0FM3R+5ir
 DFUyKuUVv3ltZ96kHV+aM9OTvZEuSt2Lru53shxrOP6XKocgpSeEV3b+4cb4SvHFQxwaLmi9zMm
 Dbb5zFgZy3LFDu2FjnCQBGLlboVRc5/8wW5dSPIYfOhstaj0RrHFEC4oVMlrrMw2ZHg6gyX2Oie
 /Kh+mindDggAFLzrcNgVmwvDn3sqzEtQ065yC/iMOjZwKsqcJ7PP0LbP5t7o9sRzSQs+mnnpRrl
 2avgZ0vDvtYBCpUkvQ8LVS1SBrhYUx4X9oOl2jNsBxBUBws7o2fgFAsStHcOVZxhPGIraH38pou
 fIjKe6sLI6qBbsWKaJnuXTdhrk3k6gEmt6RjZDmtWpPEbuB0pRq3RZ0RwCN+zab/MABbQJs2AJL
 6sLvvt44yp4hWUjcI1lyDgHho6ssaxFjffDiH2J4+9t8AbYjnqB2/GeUrg6A9dJAZ81P+LZwqHt
 +mOgDlwolieYnBb/ZmDFRx6ouyKVb1j2wYpizJhOamV7Iiv7G0qSzOy3FtPowTkL8ocP6YnvgDf
 7ioWyCCK7zMjuAFXMvRvLTxlyt7F1L0kCcQKdmTw7/PNGFP3FjoN9SXQ034HuqluTeeuj8b6SSS
 iHB0equ4tgfYc1cv02i0hbmkrceVkp+A0CuNa6R9sZK4=
X-Received: by 2002:a05:6808:319b:b0:4ca:97b7:c5f9 with SMTP id
 5614622812f47-50c4c7a306fmr13349680b6e.21.1791926443973; 
 Tue, 13 Oct 2026 14:20:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-50c1815fd26sm16116776b6e.10.2026.10.13.14.20.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 14:20:42 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 15:20:37 -0600
Message-ID: <20261013212037.2419515-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013212037.2419515-1-james.hilliard1@gmail.com>
References: <20261013212037.2419515-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/targetcli-fb: bump to version 3.0.2
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Switch to hatchling with hatch-vcs and use the PyPI source distribution,
which includes the version metadata needed by hatch-vcs.

Drop the obsolete six dependency and keep the remaining Python
dependencies as runtime selections.

Update the license hash for the removal of a trailing blank line:
https://github.com/open-iscsi/targetcli-fb/commit/f9d97a8bdecff94727ad975f263d132eec8d8ca6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/targetcli-fb/Config.in         |  1 -
 package/targetcli-fb/targetcli-fb.hash |  8 +++++---
 package/targetcli-fb/targetcli-fb.mk   | 13 +++++--------
 3 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/package/targetcli-fb/Config.in b/package/targetcli-fb/Config.in
index 4455a6ce31..00af7dd159 100644
--- a/package/targetcli-fb/Config.in
+++ b/package/targetcli-fb/Config.in
@@ -17,7 +17,6 @@ config BR2_PACKAGE_TARGETCLI_FB
 	depends on BR2_PACKAGE_HAS_LIBUDEV # python-rtslib-fb -> python-pyudev
 	select BR2_PACKAGE_PYTHON_CONFIGSHELL_FB
 	select BR2_PACKAGE_PYTHON_RTSLIB_FB
-	select BR2_PACKAGE_PYTHON_SIX
 	select BR2_PACKAGE_PYTHON_GOBJECT
 	help
 	  targetcli-fb is a command-line interface for configuring the
diff --git a/package/targetcli-fb/targetcli-fb.hash b/package/targetcli-fb/targetcli-fb.hash
index 1732fa99e5..95b76a4194 100644
--- a/package/targetcli-fb/targetcli-fb.hash
+++ b/package/targetcli-fb/targetcli-fb.hash
@@ -1,3 +1,5 @@
-# locally computed
-sha256  605f4e4e4e7189d6a03f11a4f55e7ddb4671002d542c2f684f87dd68391dcdc2  targetcli-fb-2.1.58.tar.gz
-sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  COPYING
+# md5, sha256 from https://pypi.org/pypi/targetcli/json
+md5  e7f681218a3895008ebaf503d46806cb  targetcli-3.0.2.tar.gz
+sha256  00422cce70f1d4a4d804cb1f3f633169ff4ad13b017b7e52d8f49262afe43b9e  targetcli-3.0.2.tar.gz
+# Locally computed sha256 checksums
+sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  COPYING
diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index 503b9224d0..a04cfae3f6 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -6,17 +6,14 @@
 
 # When upgrading the version, be sure to also upgrade python-rtslib-fb
 # and python-configshell-fb at the same time.
-TARGETCLI_FB_VERSION = 2.1.58
-TARGETCLI_FB_SITE = $(call github,open-iscsi,targetcli-fb,v$(TARGETCLI_FB_VERSION))
+TARGETCLI_FB_VERSION = 3.0.2
+TARGETCLI_FB_SOURCE = targetcli-$(TARGETCLI_FB_VERSION).tar.gz
+TARGETCLI_FB_SITE = https://files.pythonhosted.org/packages/01/3d/d6c306d24bdc31657599d2487879c3a1435e3c6c2268a7a1a984ef6f6b7b
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
 TARGETCLI_FB_CPE_ID_VALID = YES
-TARGETCLI_FB_SETUP_TYPE = setuptools
-TARGETCLI_FB_DEPENDENCIES = \
-	python-configshell-fb \
-	python-gobject \
-	python-rtslib-fb \
-	python-six
+TARGETCLI_FB_SETUP_TYPE = hatch
+TARGETCLI_FB_DEPENDENCIES = host-python-hatch-vcs
 
 define TARGETCLI_FB_INSTALL_INIT_SYSV
 	$(INSTALL) -m 0755 -D package/targetcli-fb/S50target \
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
