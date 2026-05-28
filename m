Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FDCCD5BD1
	for <buildroot@archiver.kernel.org>; Thu, 28 May 2026 08:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FD4484755;
	Thu, 28 May 2026 08:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZphMobwijzQ; Thu, 28 May 2026 08:36:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70098474C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779957359;
	bh=OpP9zOSIy6oEekkL9RljxRCiY69wj7hlxpxVNZMObMo=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kTh43Km1x5pXyEpNwxJQjrW0BJ68bg3ZuoYnE0yQWuTE1w8Q/Q9XLS9Ia7VctQr/7
	 rJcTJwO2h4WyDvJK8XRncjyfz+bp0VbdIuDxmLku07+tftIK217TDAgGks0fAbIXn2
	 2u0dG0/dH7LzT7ot6XiaNoBnAmoSnTsTEyFkX5QnFqH+UIdnedMRJvD/8XWYmEYant
	 dbjqUmqcWgX4KNRoH7QsaMYZhCOL3MhTe+UnAwTcbCW3uxCKMH4GXUglCTz/Q3Ed35
	 3Gw6pzGkQ6coGp+FGJB8VZQeuyjwpI9UTl3+vJA1Z7DwdsxycU5tnmT+wKNHo690IO
	 D6X9NEp44/vJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D70098474C;
	Thu, 28 May 2026 08:35:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 96A8D288
 for <buildroot@buildroot.org>; Thu, 28 May 2026 08:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 788B1429F0
 for <buildroot@buildroot.org>; Thu, 28 May 2026 08:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTnUMaRdyO0M for <buildroot@buildroot.org>;
 Thu, 28 May 2026 08:35:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EE375429EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE375429EB
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EE375429EB
 for <buildroot@buildroot.org>; Thu, 28 May 2026 08:35:54 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso80334785e9.1
 for <buildroot@buildroot.org>; Thu, 28 May 2026 01:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779957352; x=1780562152;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NPIEtAyzaE12FvbZeqWoVfXX2Bic0vCinrBao+Be0js=;
 b=YxwRr8ioSfeEQA9Q992ol3evKZSG/C9XdmUvnb8lCUS1LOKD7r/pGUyf4BKuzkRKZJ
 FywdwSSITtVfBfi9vYmEh6pTaMUkcpPM3pd/Z+xflY6mL8gmuV27jwW6qilVaTp0p2Rm
 96IP+IFNlAjywzWCI3u/oSV73bDZyK7f5bVotEHkSGAh2yyrCk9b4k++870LXwC9XBCY
 HD3mjn5ozqIXzjhma7pUyTyX0xrgKaEYN/7jKSebMsYzb1TP7Cz5cAKxTUvtQAneXTME
 J6D474q3ExPOOQgqh+m0bmlFTSKZgLOpVB/cSglDYOT+f+C/D0HKKgJKdlDdMfsHfBS5
 olXw==
X-Gm-Message-State: AOJu0Yx3p6mwkgzgl1y1VsmJDZjeb5lSfnu9xGJwuFmGRqHfnhzT2177
 Y1UtkFbz/xMiIrPdampMIOivr3wPsrLfWr7+Yw+2nPP3TvUpz+PgIX52OjVWKcOb4vBibpSJBjb
 vsF+a
X-Gm-Gg: Acq92OHP3Ucqxt7+hqIknVszUXhe2KkXO0Ym/EwPG3Dy1B1jOObsKJKM7fB9X8RbYm6
 ttqZqpJdN2A4/8SsrxtAH7LFm9mVBOCPu30Ul8yawbuA/Sba6WvCWPKoMqFgyHTMB1E4BvvGzZX
 cmBfVF4N4oayPXCmAOupKCr1AjLrGoxi3bjhGaimRQAtbMl4gOHHWtahDPC1hU710uFq/vWKAuQ
 lc5qVJrgugAsiJEHiSVHdN8McW2FcxKK1kRJX1yMvsktXCpojhNjoyzidUzIpLAXFGgN7UjD84d
 CXDWUkdoQa6mAho8HRJ0bD5/P59tZALjPtP2B7ZdsArqLcfN3znqEhWbM3g49VQ9H2tiGvClN39
 +FT5ZGOhm3is185R6EVNKDyscC3sgS8R31/mIZz59pot01nLlpoG1N1qGF5SEoApyzjK2PdVzus
 mscWaRj30L3f8ePgqeFqXHcuDc7PBjqJIYF2xrE5FmTyh4ehjkYDah4iZFXgfLyk8vzvE8
X-Received: by 2002:a05:600c:6383:b0:490:4717:970f with SMTP id
 5b1f17b1804b1-4904717984dmr434668355e9.14.1779957352069; 
 Thu, 28 May 2026 01:35:52 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49092a902bfsm43653275e9.12.2026.05.28.01.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2026 01:35:51 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Thu, 28 May 2026 10:35:51 +0200
Message-ID: <20260528083551.770750-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1779957352; x=1780562152; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NPIEtAyzaE12FvbZeqWoVfXX2Bic0vCinrBao+Be0js=;
 b=ROfwcJrb/Box94/MUavN8CUbxmvcLehDT7SRWnXO2Z7CKiTsJ4ydvcZIHKrRD/vUTJ
 36mc53xrTxtsrKMS6pl9yziQup9ugiHNQDEiPVVr/HfkHuhTI90zQka+3rFyLr9lbgZu
 PkZZgljMzLOfXIwKBhj2rQazgAn/6ySi8tEx8RGGhNSE4BK+CarZoJPE2bjE6FOcNLGE
 +LCISi2o+pfacW1XXYGrI0uDAaleR416OyJIdo7ZrlgBXM4U+iBrlo8sOWWMeUngfMYg
 NFFPz/AbwiByVIhDm4yKd0psru/ekkCUdWxvPnj5KG1LB6xqkkHezrAGfbzqUqR+u03a
 L1Zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ROfwcJrb
Subject: [Buildroot] [PATCH 2025.02.x] package/samba4: security bump version
 to 4.22.10
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
- https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.22
- https://www.samba.org/samba/history/samba-4.22.10.html
- https://www.samba.org/samba/history/samba-4.22.9.html
- https://www.samba.org/samba/history/samba-4.22.8.html
- https://www.samba.org/samba/history/samba-4.22.7.html
- https://www.samba.org/samba/history/samba-4.22.6.html
- https://www.samba.org/samba/history/samba-4.22.5.html
- https://www.samba.org/samba/history/samba-4.22.4.html
- https://www.samba.org/samba/history/samba-4.22.3.html
- https://www.samba.org/samba/history/samba-4.22.2.html
- https://www.samba.org/samba/history/samba-4.22.1.html
- https://www.samba.org/samba/history/samba-4.22.0.html

Samba 4.21 is EOL [1] and thus moving to 4.22.
Cherry picked [2] and bumped to latest release for this version.

Fixes the following vulnerabilities:

- CVE-2026-1933 (Missing access checks on reparse point operations.)
- CVE-2026-2340 (WORM vfs module does not block overwrites.)
- CVE-2026-3012 (auto-enrolment GPO installing CA certificate over http without verification.)
- CVE-2026-3238 (Denial of service against AD DC WINS server.)
- CVE-2026-4408 (Unauthenticated Remote Code Execution in Samba DCE/RPC SAMR server.)
- CVE-2026-4480 (Unauthenticated Remote Code Execution in Samba printing subsystem.)

[1] https://wiki.samba.org/index.php/Samba_Release_Planning
[2] 286d85d7c4 package/samba4: bump version to 4.22.2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...d-find-pre-built-heimdal-build-tools-in-case-of-.patch | 8 ++++----
 package/samba4/Config.in                                  | 2 ++
 package/samba4/samba4.hash                                | 4 ++--
 package/samba4/samba4.mk                                  | 2 +-
 4 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
index eb0ea099b7..8d223e38a0 100644
--- a/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
+++ b/package/samba4/0001-build-find-pre-built-heimdal-build-tools-in-case-of-.patch
@@ -33,7 +33,7 @@ BUG: https://bugzilla.samba.org/show_bug.cgi?id=14164
 
 Signed-off-by: Uri Simchoni <uri@samba.org>
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
-[Bernd: rebased for version 4.11.13, 4.17.7 & 4.20.3]
+[Bernd: rebased for version 4.11.13, 4.17.7, 4.20.3 & 4.22.1]
 ---
  wscript_configure_embedded_heimdal | 11 +++++++++++
  wscript_configure_system_heimdal   | 11 -----------
@@ -43,10 +43,10 @@ diff --git a/wscript_configure_embedded_heimdal b/wscript_configure_embedded_hei
 index 8c55ae2..4fdae80 100644
 --- a/wscript_configure_embedded_heimdal
 +++ b/wscript_configure_embedded_heimdal
-@@ -13,3 +13,14 @@
- # when this will be available also in
- # system libraries...
+@@ -15,3 +15,14 @@
  conf.define('HAVE_CLIENT_GSS_C_CHANNEL_BOUND_FLAG', 1)
+ 
+ conf.define('HAVE_KRB5_INIT_CREDS_STEP', 1)
 +
 +def check_system_heimdal_binary(name):
 +    if conf.LIB_MAY_BE_BUNDLED(name):
diff --git a/package/samba4/Config.in b/package/samba4/Config.in
index 6aff82bb3d..e1d3dd9bf7 100644
--- a/package/samba4/Config.in
+++ b/package/samba4/Config.in
@@ -15,6 +15,8 @@ config BR2_PACKAGE_SAMBA4
 	select BR2_PACKAGE_CMOCKA
 	select BR2_PACKAGE_E2FSPROGS
 	select BR2_PACKAGE_GNUTLS
+	select BR2_PACKAGE_HOST_PYTHON3
+	select BR2_PACKAGE_HOST_PYTHON3_SSL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index ae37e497cc..1875343d11 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.21.9.tar.asc
-sha256  9d60206efb450c08700a85504ec2b63257be7c6e1c393627da54e047b4e9ea75  samba-4.21.9.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.22.10.tar.asc
+sha256  e601437cde4845a42e7818379cd0ad5fc4fa518a7cf5284cc0a2657e79b30c34  samba-4.22.10.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index c2886d9ea7..e96e86b5f3 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.21.9
+SAMBA4_VERSION = 4.22.10
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
