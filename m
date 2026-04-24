Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 703B9FED3CD
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 13:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 298DE427EC;
	Fri, 24 Apr 2026 13:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dR77rZmCudr9; Fri, 24 Apr 2026 13:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31A78427F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777037767;
	bh=H+Jl78BAgAyxDnqykGQKS6rou9ezeGVcaomMudW8BTs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=OK8BdKoBTbZuhIYS+S6Qc7NEA73y3To/TzcsN2QSFDN+Nz9y3JInPYb8g6Xk8do7o
	 1BDPL1NioMSW7w0tRYcxNVpVL+4h4AJ2Mv1nq9Z+POAf1c7qDY3vxoexl89VCJfMom
	 +OEP80tQAleeEQb2eQk12ChBttOZbeT1L2m9OCr9fjO2Ct3rRzuv5O5cxHehb4uYr4
	 Z4ozgLJ4Uk0HxshcZDdsMM8enrHhRtXa8dXHdizW/EuSC1QW5NPOaQtRRSA8vejV9g
	 4BfVcbEekt3yrwKyjyK1ndtZX0bt1A1SDlG+9LLAd9zaJAf93PyrTir8q0gwtb+mrE
	 Cty4lpwz84Sig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31A78427F6;
	Fri, 24 Apr 2026 13:36:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 351602DF
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 271DB422F6
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J29welVNFR42 for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 13:36:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=jeanmichel.hautbois@yoseli.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EAF20400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EAF20400BA
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EAF20400BA
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:36:02 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id DB0105834EC
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 13:23:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22D673EC96;
 Fri, 24 Apr 2026 13:23:28 +0000 (UTC)
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
To: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 15:23:15 +0200
Message-Id: <20260424132326.825570-1-jeanmichel.hautbois@yoseli.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-Cause: dmFkZTFyAWigktPD/NoOncmYxNmF2zVYkLWe54PJE15DHAT5eY7NU43AZYKwnr14qDJSmVOtRXtFIpXwB/ViUPJjTcGiUFpr8O8i2ErMsVbvHMO3kpR2tDGHufzTBGoi7ScfMVM0jPzTVYFtaymsdYqhGnzUjW/fCfBh6oj6XDVrl1jbBCITscJHFitKk+pK4i4OVA5N7rYDwe2WpHjaaYYJP18shC5ZUB8KRJlRoWIfck6m9BBWtO4bBnqfpXJGNM5z4hB16FF+wMoeTfmflh0etFn7BuVZzXq1hxotoJPwPCedEhqo23Euhl4+cvvso5ePlM5eQpAgokBRrV6uGNq3DATpQzXVdJU7/DYQfhpi5Mvb1MDfPuqo/cODtB2a1eQiamMABciOOWVTPnBrXLqNBbIuZFn0t369VkbOY1fCwmbyAXpW5XTPttoK/+4cZRqRYNoSPQjvO991O0473DWjD8XRotKjbvR4ta/hXmKoxiE3tNIAmILfMqHNrzuEtciVcHGJERO8EbVFfW6rA0wVf8U+H8/tfo3bulFDAEbQYFoDn8dU/DVmYl6zJmEKBrmMcSk/ETqk2gOR7M99/AQ1Uv2yNtvsv9+It8YndlWWiX1af/kORc/JL7x9EdwukBILs9i8eZDhihvq/ctzKFs1cpyR/o+ehADm3j6RHEbOQdoVRA
X-GND-State: clean
X-GND-Score: -100
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yoseli.org; s=gm1; t=1777037009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=thk9yA8DyvVoelFL0DXxgWaLIg5b3A+A95w00lUZQqw=;
 b=SRgQ0ZSAZ0LjE80p3LXA5YAKbQVLVGPyYTwYLuL90/fBPywFsFxFmIAN1nOmhr59TIxNZh
 4VvwK8n05tezdpz1IFKYwSpVEAg2FB/9f+PlIdAssdvqlFuLh/c3EnxnGFUZX5ov1W8Vls
 IC4LZ6JYmyxM9moAYW6hT/9Hs8XkDGajEp+COg7DBwIiAyzzrAhSkDPvIDfI+Gf2yom/0s
 N6zzpjGmrDJsX1LGbPrH+zVyfP4zPURML7pWbLo0qAxuBgRvOUXiGClmzxQj4Irj0GgKy/
 OfV9T4o6/9Crn/OYoXBCZsHkghCpgWWwpO1zeUyGV+hGKyQdCrHhLWLGVzDY5Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yoseli.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=yoseli.org header.i=@yoseli.org header.a=rsa-sha256
 header.s=gm1 header.b=SRgQ0ZSA
Subject: [Buildroot] [PATCH 00/11] Add ColdFire MCF5441x (m68k) support
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ismael Luceno <ismael@iodev.co.uk>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This series adds support for the NXP ColdFire MCF5441x family (m68k/cf
subarch) in Buildroot, and fixes a set of package build and runtime
issues that surface when targeting this CPU.

MCF5441x (MMU, ColdFire V4e core, typically 250 MHz, no hardware FPU, no
SMP, no TLS, no atomic builtins) is not well exercised by the existing
m68k coverage. Building a minimal userland (busybox, openssl, nginx,
dropbear, ntp) on top of uClibc-ng exposed the fixes gathered in this
series.

The series can be grouped as follows:

 * Arch and global flags
   - arch/Config.in.m68k: new BR2_m68k_cf5441x subarch entry
   - package/gcc: force --with-arch=cf on MCF5441x so internal
     multilibs are driven by the ColdFire ISA, not m68k-classic
   - package/Makefile.in: add ColdFire workaround flags (mxgot, etc.)
     consumed by multiple packages

 * Toolchain companions
   - package/gdb: use static libgcc on ColdFire to avoid runtime
     libgcc_s ABI mismatch
   - package/gmp: disable C++ bindings on ColdFire (libstdc++ is not
     available on this target flavour)

 * Network stack
   - package/libopenssl: extend ColdFire handling (OPENSSL_NO_ATOMICS,
     OPENSSL_NO_ASM, OPENSSL_SMALL_FOOTPRINT, mxgot)
   - package/dropbear: disable ML-KEM768 which triggers an ICE in gcc
     14 on m68k
   - package/ntp: link libatomic when the toolchain provides it, so
     64 bit atomics resolve at link time
   - package/nginx: propagate ColdFire TLS/atomic settings

 * Misc
   - package/mawk: create the awk symlink on install so scripts relying
     on /usr/bin/awk keep working
   - package/libglib2: add ColdFire conditional tweaks needed for the
     target build

The series has been validated on real hardware (Freescale/NXP MCF54418
based ColdFire V4e board, 250 MHz, 256 MiB DDR, uClibc-ng) via a
buildroot initramfs image: kernel boot, openssl, nginx, dropbear and
ntpd all start cleanly with the compiled flags visible in
"openssl version -a" (mxgot, OPENSSL_NO_ATOMICS, OPENSSL_NO_ASM).

The series applies cleanly on top of current master. No regressions
expected on other m68k variants (mcf5208, q800) or other arches; the
changes are all guarded by BR2_m68k_cf or MCF5441x conditionals.

Thanks for the review.

Jean-Michel Hautbois (11):
  arch/Config.in.m68k: add ColdFire MCF5441x support
  package/gcc: force --with-arch=cf on m68k MCF5441x
  package/Makefile.in: add global ColdFire workaround flags
  package/gmp: disable C++ bindings on m68k ColdFire
  package/gdb: use static libgcc on m68k ColdFire
  package/libopenssl: extend m68k ColdFire support
  package/dropbear: disable ML-KEM768 on m68k
  package/ntp: Link libatomic when available
  package/nginx: add m68k ColdFire TLS support
  package/mawk: create awk symlink on install
  package/libglib2: add m68k ColdFire support

 arch/Config.in.m68k              |  7 +++++++
 package/Makefile.in              |  4 ++++
 package/dropbear/dropbear.mk     |  7 +++++++
 package/gcc/gcc.mk               |  4 ++++
 package/gdb/gdb.mk               |  5 +++++
 package/gmp/gmp.mk               |  4 +++-
 package/libglib2/libglib2.mk     | 11 ++++++++++-
 package/libopenssl/libopenssl.mk |  3 +++
 package/mawk/mawk.mk             |  6 ++++++
 package/nginx/nginx.mk           |  6 ++++++
 package/ntp/ntp.mk               |  5 +++++
 11 files changed, 60 insertions(+), 2 deletions(-)

-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
