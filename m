Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE44CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C99C4089B;
	Sat, 10 Oct 2026 15:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKSWbkgvXfWC; Sat, 10 Oct 2026 15:19:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AA1914094B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645542;
	b=RoE17hEjGzsRqUjuL7xGeZI+FCPquB1tISErePeI40PQlJtJhV/+mrkQz/wB6nZXlTnY
	 ak3BmKDaiQvmfYPPNt5yNEME7oSr3F1fn5JdVOONL3+F+mOfHYVC/zWGG7MhuwGIGSFWo
	 qrZvFnG17kfyOTe6fufHaGNXAbPuDDQFnQwbB0haEEiY/1OSj41apLhkf6SDlZbl0Fmfo
	 sKbDsrzYavLAtKkrW4beOhAOUcuIU8YRTqLYwjQkkWWSPSfMuglsEqEQj80Q4H8YfBkiX
	 5o5MDhi7lK0nVhD9HmxtKxeXHycGvzLQ+H5+6zoD/hxJnHsd6799BYNgJKkkR+eFyqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645542;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZFZf0CuGzfClxghPXV+cmIP7UKfeBU7rIpNTk/UN7ak=;
	b=FVcT8A/pZOApvazY23Wnj/ReZoHd4+MrCa/zV6SzQFxOAyKR4/al/FdzefSiMZUOGiP6
	 m/RYulv5cvmXxaGsFmXBB+WYUrrEog4WbxXP3JZroorgSKIsyUICdTtlkj4oBWs2Tnlm9
	 0CqOLjt/fUs9Yc+xWg5uCT4MD0xtiE/6jvDsOsyg22ouhERzE1in3sfu7z6cqWJCnTqRm
	 fKjC4l+AmJVnEoSa/43WkCy7CMzTXNVHyaUzxdc4wdrDWVB9desP+GAVrjkTY7HnZsLNr
	 f9CIcWhK9Z+7Iwpq9NaTON2gdqHxqX4iik473oU8zjN3PKrJsIycpAbpxhuTSZywQBA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645542;
	bh=ZFZf0CuGzfClxghPXV+cmIP7UKfeBU7rIpNTk/UN7ak=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bAlPjPs4nkeA3AdSJFX9wD45pl0it6ef2T0Wu+GIwP1FRmhhah/fiSzNDgfRQuj8p
	 69orqh1AL5UCxGF1mjIHPEKiTsyyufmRLsiLuCJ+t6T/wTc1KDgvs5mC2jtsiH4eKK
	 P+TS+G83o9dPVMIJ2f5pSzRQ+tKM5Zmv8KIJu2fyzSfISVK8DBsS0KATOdcIEhWQij
	 tO8sJ83Qecat4XbDFauT534jMg+BL+BvEcj2FwrQFw6oP9PoEuTKu91GgOG+rQiutD
	 0Zh35cWBxUnQaXZ6fp/dFYgE4t+P3hIh0SKylpUsFK6wNlLa/g6ZY/7CxCBQk1lR3g
	 1H2IkrhNYj6wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA1914094B;
	Sat, 10 Oct 2026 15:19:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C767F356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8B8381109
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrVB5N95GAQa for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:18:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E9BE581126
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645533;
 b=F0W2g3VpCsZ0e/Bv2jFjauC8TuOas7TBa/to8djy1agtJ/Vh5QGcCoZp7moSLjQ35RuN
 T/L1nlRtnGnPH7RMTY5C5mvHEVj6+6WYywTRwNbujHaWH9nMtqPEwxRajKHa/IINMPgw6
 VWMqC6JLLCIJ27BQ/ZQcobiQuNPm8RnMG7WsSyH8j2/2yvZwHfK4HT3Mvb12rTrCutx+i
 /3p853SmfGLwREbfwpIL4oeozynu7pRfxIahz7q/Uvj4td9IPrh1X4ZIzyeKD8tTI3Hte
 5C6E+KIwB9Sjjj3XTk2wp0ueBpibyUgLUPMTvwK4GDk1FVNWW2lyTDBRbZ75Ga51RXw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645533;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=r5pHTE8CHplMwFRMyBtMQDB1TDMYfARGxMuc9M2B6PY=;
 b=MwvS0yzzOn2cp8d1HPAkNfpuOx+a5IMGzaqK3UKyYczCDtWkOCLlx7Yd6aH0cZbq9Gme
 BaqN+xNYJLdFEaHxoYopOq4GFMYdnkHHT5fTTAVbSM6Ujqz7bOxkmiDCpVGOYmqQpFqF7
 Gw0bxIwnTJPFT0tC4mZ5eGNrxiUQZu7W9Sz9wsFgzz/dlrhFNe6V8UdMlnY9M35XMMZH6
 ZwUr0DTXE6vKk4Tq0qOMDv4PYRSoEkSK0rwZPMh/Pn5bOrItgrmBFxQ0RhzvbDJqCTDiT
 r6Ob1iWHClrBWLGrwjfGeuT1AgpR8h91tqRlP/0IM+9vkhVZLbMZiqQI6Ov61F1uGVg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9BE581126
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:18:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A94A99223A; Sat, 10 Oct 2026 15:17:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:17:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 444d769c0a575916767f54238c4e01dbd56eeb7d
X-Git-Newrev: 35dc65563dbe9ecc226c09473289f3e8cdb8855e
X-Patchwork-Hint: ignore
Message-Id: <20261010151734.A94A99223A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kbd: reorder .mk variables
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/35dc65563dbe9ecc226c09473289f3e8cdb8855e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

We usually put the metadata variables at the beginning of the file and
the variables related to how to build it (like _CONF_OPTS) later.  Apply
this principle.

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/kbd/kbd.mk | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 12e638200e..024f49603c 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -7,13 +7,17 @@
 KBD_VERSION = 2.10.0
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
-KBD_CONF_OPTS = \
-	--disable-vlock \
-	--disable-tests
+KBD_LICENSE = GPL-2.0+
+KBD_LICENSE_FILES = COPYING CREDITS
+
 KBD_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf
 
+KBD_CONF_OPTS = \
+	--disable-vlock \
+	--disable-tests
+
 # 0001-libkbdfile-Require-dlopen-and-memfd_create-for-libra.patch
 # modifies configure.ac and src/libkbdfile/Makefile.am
 KBD_AUTORECONF = YES
@@ -46,9 +50,6 @@ else
 KBD_CONF_OPTS += --without-zstd
 endif
 
-KBD_LICENSE = GPL-2.0+
-KBD_LICENSE_FILES = COPYING CREDITS
-
 KBD_INSTALL_TARGET_OPTS = MKINSTALLDIRS=$(@D)/config/mkinstalldirs DESTDIR=$(TARGET_DIR) install
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
