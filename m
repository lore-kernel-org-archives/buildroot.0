Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D456BCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 916B44096C;
	Sat, 10 Oct 2026 15:12:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G_OAt6f7kOhS; Sat, 10 Oct 2026 15:12:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6404A40964
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645123;
	b=Nevyguk+ATGlE8jZbL9/7Fylo8sS5gSkG2LEUe1nkgm3S79ql4JFss9bUkuhkWmOBcPC
	 TTBDZKy0z+dPbDID0EGbfKbUjhzgNT1TRXKA371IWjSjKfdsRQUNweyZ55kOtPebrd948
	 o66zN0twRRGzQ3RB9PZrbJzIpDwTBZQOdAE94Ph4uEQXIQcEVwhNQpln0Yq367EmRrmG7
	 2BAffdhw3LvJu62yrnmUzWq6leKi1pWHRtAPnLUMnptoXEbV94badeO/LD2CTIlaPzmsz
	 73t8jRCcuF14hOE/kEs4VsGY4N9a3EcsRe8bpa3edfUY+WyNWa8aMDJ3ZToPdWYSdLw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645123;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=bJjTCuIXxEI80O7J+4e8HabO4i9n6InsGz+F2m5PWek=;
	b=OYAwHwEVDekRxDKiYbqR3twJuXFtaju6f066HO38TaVjetPa2zgeCaSUexTa1bAS7DAP
	 K87FwV5l4bNCbmEzs9qjieRaIrZAq8UYhbtmCW3MM2BV4Yws7fHDKVW6yPN/EGn9lpgKX
	 ac9DzzW9Qn7iUqFNy6Q0S4YdFRdlulApvF89liNqqvPMiv32SXLOoSbsNvMJAZKbJBznS
	 Z/42yfftLmU1HOFW2mnPLTBU4lXOjcPbgi69uDPLvsWICnCtJ5+na4C25+6IVc/wpDz32
	 /V61gcg+DpLrlTIxzqt0RXLi3Nx//AaM2rdY7gFTfGPbG0FbydIAGswOxPrJz/FlxKw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645123;
	bh=bJjTCuIXxEI80O7J+4e8HabO4i9n6InsGz+F2m5PWek=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Jr3Wed6mZGKijys1Kz7ed+/dYsP7xN6A43/VcgkCMpQK0tVISxkm5Z03bHxzvobWb
	 OMVVe8qxbKVXXfVoEpmnNpHpsk7x+lPCcy/sEv/YYu2Xw+ePVzdZDiEGkJut7rTDPa
	 Yb9vrrrQIUTWFiZdTkNileWakFCqJkaezh6pzw4LpfBcu2BGsN6OjNh//K4z224e5N
	 1TtvTBHrFHNaSCsUjMnwgorwcuCBR0OEHqNXGx5iqrjG9/WSvVyRcQN5NjmJA96FWk
	 f80CsffIOrkuqdkw7mkYGdPyv4fhfNz3qNjXUBvTCUZpK9nNvFLOdHEVmA7KoQwOz/
	 DtWMpGIxPp0sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6404A40964;
	Sat, 10 Oct 2026 15:12:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FE0F105
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8F9D16066F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M1UNqotjnmaz for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:11:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 507B16067B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645118;
 b=N1u826qoDaF8O2sSkTCL95L3kTKaKkiPUmhLAHa212Kriiid1LJmKQ48avIe3EsSTH32
 ryOImMjFird+W//al1bLHoqFcybbEHg0KQ2RR+hMcMehTfw45zVnzlcsLOcVM9ZPA6l+b
 8zDr2OdCsop+MdS21FE2AKk2Ulr3sdOM8+OwIBWU9tSBxH65kybBdhTA2uc7VKTmhzTrs
 ffsLBjfP5PddCFlSEWVqs8T5sRaEeAFkM97l+o5hTPfbzpNQpnkSmail15+Rw+e1/MAaH
 lDuYt1Nr177B0dAlhoE9IPmqYnqCiNp5jcoaWxTFlRTCAroSUpSMwW/MwMyNJuQeyrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645118;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=GQ0MGRe2k5X/ADfFWwoxhYr/6gItSjqIZXy7iuIWiJU=;
 b=ZA1ijD4hAM9ZJi5tKYGcS9ZJjoMyVV+Ds+kJtv+jrWIUQZMesML+AlVHTtDELJ6CPX8O
 dW+vklm1Ut4rLEKRULRxxH0vpkgwoJFDjfrKk7uxBv6XYiVqflWDr1Hs98vnyECYi76eQ
 qHQy5BaWF7bdHzdrFVmxdFaLHiZChU4mYu6UyuuwU84ZULoAzuMRVlQ/Pv0whFzqdZ95R
 Z+DRcoZ62oQ5+uy/Lo9KJ/DE18WahZ3YZux+eHVU6x0yltWE36m5lwjzbR+6MclQ+w8Nn
 +TZcCj2IQPU84ZxPZ7e/bmtDYhjvRCwJwyA1yRVrfh1fp6O/K9yOukejIKNx9IBXVTg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GRV26yrp; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 507B16067B
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:57 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a1923f15afso1917795e9.3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:11:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791645116; x=1792249916;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=GQ0MGRe2k5X/ADfFWwoxhYr/6gItSjqIZXy7iuIWiJU=;
 b=T3ziZNk4mf1Zg3X8Xf8TI3BSpxu05uzhE8gLuRxss8lY4QUST9j3KeJGwr5zhWD4or
 jjuXiH+dzgd9f30Rz+v0jkvYvifVSOPI/sCQfuC60XBvAvi4fvwz78/h36qJVnkjqCpA
 TrQCRIXv/33agwZ7d59GrUy9LJXDtvHMLGI3FaOMHsv3xC8035elAlF4DXAjofoElwgD
 rolOZycWwIQ+ZggA4WLEsnYCaOYu7V2HC+ZQaXhDMqrAv/CEQVTk+w7i1cMnbz3SWqyx
 5C2n70hpe+Oo8GfSNPAe6gHtbU2APTolv47yLQVXlUU9YvqkcwV8UfBWkJDKVVcASJzo
 DeXA==
X-Gm-Message-State: AFq9FYJ2EoNKRp9bBtmJtGOERXXdsONDfS20wvRhwakEins3fWriqKLq
 wkIPOIgLTfXXdwKcwvC5KoY6leaY5RalpOdoz9e9Kcc+Mj+5jlCD5ZnTWnWSJfIHJASf4vqtY6s
 iM9V+vqk=
X-Gm-Gg: AYBFou2jnQFixdr6YzQQVu30HyTwWw8KXyGIFvNFiN8YOPbnSsoEHtMCAxrUkUDbUqd
 rt/T9A2wslP8PeEjdkxSKltOuiou0lqZ6g5mw+cIYGnLpFhDXJOvsmYtfrPAwGaz9Inj9UqkEti
 vU5NL0RHJqzCjUhZ4o6XJw2vBlrvmpKm+2jH/KXcXJSWxrKyr3GXNxZ92up4NxnUBP60J1fPBNl
 XM3/Z/EVZogAYhZbbgo44h2ZZBs7WrNxQOIIxoOiMs7ct0Sj63WOqK4rp9PT9W+zPselbbrJv3K
 VoynDKXwcSa1NpaV10Wnn7YwI0j5DlgwpvlrfF0SrQ+H35QKE88EFEOeu8Vw+a0Nh11kqmY2PYd
 1whgyreeuz3fyC377RcJCNRHJikRBnOtiIpg89YQDkQkmVxcevYcPpdy6joUDEJYMfeq9WyHkWP
 oM4Nrf1RzSddLkwQmfc9P/qY4mREpJ25yS39kNTDIWUs2XkuHrlexW7FCdfFyKX6OLscOqNiQTD
 hhsCYEMm20ogTkTbiCUI1qJpFsV3mJ1WESD1Ghd0hadb/WRViahyxsaOPmZ3b3fqBFShQcx4g==
X-Received: by 2002:a05:600c:5493:b0:4a1:78da:d271 with SMTP id
 5b1f17b1804b1-4a18e4ee976mr98600345e9.30.1791645114054; 
 Sat, 10 Oct 2026 08:11:54 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bb6b3cbsm115104125e9.0.2026.10.10.08.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 08:11:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:11:19 +0200
Message-ID: <20261010151121.876133-8-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010151121.876133-1-titouan.christophe@mind.be>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 7/7] Makefile: add new target "yellowconfig"
 based on kconfiglib
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: petr.vorel@gmail.com, ps.report@gmx.net, yann.morin@orange.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As informally proposed during the February 2026 Buildroot dev meeting,
this introduces a new kconfig user interface based on Zephyr's kconfiglib.
The name "yellowconfig" is inspired by the yellow-themed curses interface,
as opposed to the classical blue "menuconfig".
Read more about kconfiglib: https://github.com/zephyrproject-rtos/Kconfiglib

To run that target, one has to install kconfiglib beforehand,
for example by issuing the following command:
> pip install kconfiglib

In terms of user interface differences, Zephyr's kconfig brings:
- searching symbols as you type, and more symbols are visible in a single
  page of search results [1]
- symbols that aren't selectable (because of unmet dependencies) can be
  viewed (toggling them on or off with the key "A") [2]
- symbols y/n dependencies are displayed more clearly, each one on a newline.
  This is especially appreciable when there are many of them, whereas in the
  classical menuconfig one has to scroll left/right to view them [3]

Having this as a new make target allow for Buildroot users to try it out
and forge their opinion on this different interface without breaking
habits and usual workflows. However, in the longer run, this could possibly
allow to replace the custom-patched kconfig programs we ship in Buildroot
with an unmodified upstream supported codebase. If this proves to be useful,
an appropriate distribution strategy for kconfiglib must be determined,
such that it doesn't need to be installed externally by users.

Moreover, as unselectable symbols can be displayed in the interface, this
would remove the need for comments in the like "<pkg> needs <condition>",
where we need to invert and maintain conditional dependencies.

As a final nice addition, having a Python based kconfiglib allows for
programmatic access to kconfig symbols and settings in scripts, which
could be useful in testing scenarios.

[1] https://gitlab.com/-/project/2648174/uploads/8ae29a772927e7e555f85f6d31876bb4/2026-02-04-105501_958x1015_scrot.png
[2] https://gitlab.com/-/project/2648174/uploads/8d27510cf738cab9fd95ffdd81f75bc9/2026-02-04-105514_958x1015_scrot.png
[3] https://gitlab.com/-/project/2648174/uploads/6d51a4b608fce076ac8c0c84623531f2/2026-02-04-105522_958x1015_scrot.png

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Makefile                    | 6 +++++-
 docs/manual/quickstart.adoc | 7 +++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 7fa3ce4890..8fa95a86a6 100644
--- a/Makefile
+++ b/Makefile
@@ -122,7 +122,7 @@ export BR2_VERSION_FULL := $(BR2_LOCALVERSION)
 endif
 
 # List of targets and target patterns for which .config doesn't need to be read in
-noconfig_targets := menuconfig nconfig gconfig xconfig config oldconfig randconfig \
+noconfig_targets := menuconfig yellowconfig nconfig gconfig xconfig config oldconfig randconfig \
 	defconfig %_defconfig allyesconfig allnoconfig alldefconfig syncconfig release \
 	randpackageconfig allyespackageconfig allnopackageconfig \
 	print-version olddefconfig distclean manual manual-% check-package \
@@ -1017,6 +1017,9 @@ gconfig: $(BUILD_DIR)/buildroot-config/gconf outputmakefile
 menuconfig: $(BUILD_DIR)/buildroot-config/mconf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
+yellowconfig: outputmakefile
+	@$(COMMON_CONFIG_ENV) CONFIG_= python -m menuconfig $(CONFIG_CONFIG_IN)
+
 nconfig: $(BUILD_DIR)/buildroot-config/nconf outputmakefile
 	@$(COMMON_CONFIG_ENV) $< $(CONFIG_CONFIG_IN)
 
@@ -1164,6 +1167,7 @@ help:
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
 	@echo '  nconfig                - interactive ncurses-based configurator'
+	@echo '  yellowconfig           - interactive kconfiglib-based configurator'
 	@echo '  xconfig                - interactive Qt-based configurator'
 	@echo '  gconfig                - interactive GTK-based configurator'
 	@echo '  oldconfig              - resolve any unresolved symbols in .config'
diff --git a/docs/manual/quickstart.adoc b/docs/manual/quickstart.adoc
index 605031037f..d8e788ca97 100644
--- a/docs/manual/quickstart.adoc
+++ b/docs/manual/quickstart.adoc
@@ -27,6 +27,13 @@ for the original curses-based configurator, or
 
 for the new curses-based configurator, or
 
+----
+ $ make yellowconfig
+----
+
+for the https://pypi.org/project/kconfiglib/[Python kconfiglib]
+curses-based configurator, or
+
 ----
  $ make xconfig
 ----
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
