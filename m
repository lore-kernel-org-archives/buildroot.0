Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F98ACCF2E3
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 12:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B70680E3D;
	Mon, 19 Oct 2026 12:31:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tb2wr-5EouHO; Mon, 19 Oct 2026 12:31:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2CA5780DA5
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792413101;
	b=n6gC/ASJNqIwF9igbFhpYkRJT3gUeC9lm1d5wk/ti6S05eM5bJdKLO8MK2hw3nOPF9Q5
	 EV3jbtQGBwrJ0aWfKE22vFaKGY6pRIDcDKhZLrMza4xnipLoFIbk5hk1oLccrg9EqsnZ7
	 V8x8jkgnZ5LOXsrh3OScip2N4JHgbVO4doiIyh08SecAcERGLB4+bpj8iEEwdJUsWnR3X
	 hlAPDfZqxIVqzp8oj9ONpLDTSKkBdajoBd7UmeWG355Av5Ez6RNUvP2RuAgR2YlwZxXeh
	 1h31DiE11nWq8zaPCR3l5LWjETB05XNtJTRACtQm/mdQ1fqQcVEwYUM/lx2kEda96Tw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792413101;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5NbMJx0s9saMxoq/Kg1gUvFI4E1+9xdHab2iKUOdJ7k=;
	b=HSUYVpRaPo1iFZrkZiiCFWehsnQ7JGyX5kCrj2w9lf+RSAjEZwVX/BmWm6Jp8R3cnH6O
	 uC6toIqmSIKIMnXo6RJerFFdrO50V3Zt3ATQ9fPg5Vv9KWBylZKT40lJeTXVTEmPvS5uu
	 HacGiLHGLyTro5PuYzW5kjxL9th0yU8r3eizO4R9VWXPt01YN8Hkp7fgKqUb88aLwAc+V
	 XeZyPVf4Bv0r7VFPzE8UPz5d+POwh2469VXCDfzb9KqVn48qNbi0jLYVYS/dPXr1sajwF
	 XV1AvPcH/DXdlsHUn2c50exbroGCl9l5ksK7gtnY0OzRUgYiNO0u5R+QkJ5YuIOrlIA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792413101;
	bh=5NbMJx0s9saMxoq/Kg1gUvFI4E1+9xdHab2iKUOdJ7k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=GtVstuUXWYhsFDwNrP3F0ypUptI8Wn3fezJDYg/MP3rMtTlAFMEXXx4JfoOLOtLyY
	 5xoGUyy4q3VQiGNdxoTCh04x6cLBMQQa/7vCD8NgHWme5jcwtjz28dN5psS3kMomB4
	 ge0h55z5frAkMG916Xkja1656pPc5Tk+j2BlfZceVP8SdJjZY7DYIxLjg2LuKyYpxp
	 EItpC+p6oefuNNA2FDRdJ6ncUfYL0YJL78qQjZGXjr/NI/c3huclQfIuQ3+73YfPXk
	 E1s2+8G2X7E3mM3nSd7TRPDt1tfGUJsjuHg1F23RTJF8vfsrhiAyPBl+nt/t1km0WO
	 UMc3KKVTUGcRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CA5780DA5;
	Mon, 19 Oct 2026 12:31:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D4EA22B
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03FD4809C1
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9anvdheuvv09 for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 12:31:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B0F0780DA5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792413098;
 b=FHui//hP60HcwmFYpEs9QIXjrCZoUgVpCQzaZpEjPtfrHtYv4AGJuflM0PU1ddPL3sZZ
 3ArUq400h2pPJ0wcV/yZgna/M0vJm9FYg0VPCLDVIgP5pxieGOgWyBhlK2tX3uHKJwvWV
 pQdMJXqWWVmFD8UMcL+xTF1bUcbc7e1w1gtmuw6N173s9ZihmfIYDJKfY4GjESLlbEwHb
 D4ocG5l85+HqEYefsD1fu2WiLru6yY+apESdmJb1N7kP+Ew7rtWDEyP0z8o5MBEkw70/x
 gzuqpCIhEe3mV90+txBeCDSoOa5xzfSNFXZdffo8497oVjDnMaQDGCsLzhEJFdcbU/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792413098;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 MIME-Version:Content-Transfer-Encoding;
 bh=vXUHVcJ1y8mQe2fTEMBgKe9eHhbo24ZQU7VUNbM0zxY=;
 b=nmTSLiKkJ+fuGthzKHM1b13tF8O0uunvKaETm3oBQvnyx038c1a2TufaYMESZCAZ70L1
 BBlvFHk5vvma5mZ/NlIveakC/okJiWZRITOrphoIykE+6xc4Lmhfd7Lfh6ssDyv0B7Nj3
 Jnyunm5MgA7krHwTuaBBFM5cchQz6rNWWFgSQe9I4eQ4FPNe+7EZaEnE/JKsbJ8NBvYuB
 vSHZWf0TNRljsdGwuNB8zVKn4JWMLg2tddgHtoTonKJynJuxc3cej+rCpwPB5neeAQrrb
 2bvxfYQNyDVvL3u6hgA00KA/fGJMITOz13imNp2LwNV2JFsQfPZ+pJDWWK4LuT+Grxw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=X1h53F7V; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::631"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0F0780DA5
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 12:31:37 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c38ac26cc5dso288235966b.2
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 05:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792413095; x=1793017895;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vXUHVcJ1y8mQe2fTEMBgKe9eHhbo24ZQU7VUNbM0zxY=;
 b=PToYCxDjNqwME5ObkRwVC3DuYH/Zsoepef+/DCD1d1AjSWvOXPsiQBvqROx5zB6aX7
 /1wYhye54bGCWtbsCT4l8mzrdEzMqCAVHc5Nq9cM52zUSW/9HC/FxApMIxpYVdIt9Do+
 My36PJ47BlgQ41DSSRXG7fvgtPPD1QTcf4C3eYx2hxXVOrAwMUhjMEIVs+k5MTFlGOae
 P1M1Q3EIXksDz1Bl+bR8Fh03w+XcYB+9SwOzahW3eBYeOwh9w4jYMqnVXUrgdzWA1jZM
 ATX+ELl8gtEAa2PSZ93iItans/49f/sY/vpx23PrABDof3Ib0myl8+jR+STqLq8zCrzA
 iRkg==
X-Gm-Message-State: AFq9FYLIVV6p7neZtOUOS4/WPdkNlcrDR6pGQNp0sO3VXqAv5AmpIx2I
 olBWuqljpb5buCXyVJg+cPDY53j2meX79qVfwauvaYVYOBZS58tSfT0H/eToIQ==
X-Gm-Gg: AYBFou0StZBad9JTwigLfLTw3G+cs5FA9DpP66DCP0RtfiKvbDRzMWIEXJUmVKSm57v
 OgVYP5vdz8zdnXtuZwiqPQ83BGfnpmb252X861kXjnh0xNxyJkRwvw4qk1gjNQ3g87sLFIX+hzq
 G+MauI/KuNmlnboAcaMX4V9OaRvIMVYVfFC0erIzRsLBIKUEIx7AH11XdV68b8a8uMYnOto8H3e
 UpI3veeoBo14+s9wMpUrw4F2feCm2yg15I691JAGFdpCxduBIc1ACHpiB+6IVXCKxRDWkhcloX/
 5doxFKbzVvWlOX5CJ81SjrWYJOyzCCMTGp1nBz+1aGj4VtJDnWJE5pbxYpCYpAGkL/PCYCzimGr
 KjKPK24640ezxfi/zhE5ZPf6AUpTpe5zDmiESYQ4LwakZK4680m+y7r/ugnvLsUBRdcGuiWfntt
 yVmLUwRQKlnF3hZAUNX82BrTOG8DQ3G943OkdEQ26IZVNXIL0nqNqcJKLM0GRs/y7TBzU/XGfEB
 1uixWfqJNIFpQtHBR0YUmhY+UkTQ7kO8ACvJylp1FRlBLg=
X-Received: by 2002:a17:907:272b:b0:c2c:d06f:cf87 with SMTP id
 a640c23a62f3a-c41a03f6343mr476550566b.46.1792413094806; 
 Mon, 19 Oct 2026 05:31:34 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4090dcf72asm366569166b.18.2026.10.19.05.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2026 05:31:33 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 14:31:33 +0200
Message-Id: <20261019123133.1631472-1-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/sysprof: fix build on 32-bit x86 with
 AVX2
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Adrian Perez de Castro <aperez@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

The bundled CRoaring code enables its x64 specific code paths as soon
as __AVX2__ (or __POPCNT__ and __SSE4_2__) is defined, which also
happens on 32-bit x86 targets such as i686 with BR2_x86_haswell. This
results in calls to 64-bit only intrinsics:

  roaring.h:260:18: error: implicit declaration of function '_mm_popcnt_u64'; did you mean '_mm_popcnt_u32'? [-Wimplicit-function-declaration]

Backport the upstream patch that defines DISABLE_X64 when building
for 32-bit x86, so that the portable implementation is used instead.

Fixes:
https://autobuild.buildroot.org/results/f00d523aa13923c9eb73ae4e1b1f04f297512351

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...disable-x64-code-paths-on-32-bit-x86.patch | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch

diff --git a/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch b/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch
new file mode 100644
index 0000000000..2b2c6cb6cb
--- /dev/null
+++ b/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch
@@ -0,0 +1,53 @@
+From 22c10f0dbd3c357e96f83f430ebe05d24a25c536 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sat, 17 Oct 2026 22:47:15 +0200
+Subject: [PATCH] contrib/eggbitset: disable x64 code paths on 32-bit x86
+
+roaring.h enables USEAVX (and thus IS_X64) whenever __AVX2__ is defined,
+and USESSE4 whenever __POPCNT__ and __SSE4_2__ are defined.  This also
+happens on 32-bit x86 targets such as i686 built with -march=haswell,
+where 64-bit only intrinsics like _mm_popcnt_u64() and
+_mm256_extract_epi64() are not available, so the build fails with:
+
+  roaring.h:260:18: error: implicit declaration of function
+    '_mm_popcnt_u64'; did you mean '_mm_popcnt_u32'?
+    [-Wimplicit-function-declaration]
+  roaring.h:1011:23: error: implicit declaration of function
+    '_mm256_extract_epi64'; did you mean '_mm256_extract_epi8'?
+    [-Wimplicit-function-declaration]
+
+Define DISABLE_X64 from the build system when building for 32-bit x86 so
+that the portable implementation is used instead. This keeps the bundled
+CRoaring sources unmodified, making future updates a plain copy.
+DISABLE_X64 is only set for x86, as it also guards the NEON detection
+used on ARM.
+
+Upstream: https://gitlab.gnome.org/GNOME/sysprof/-/commit/22c10f0dbd3c357e96f83f430ebe05d24a25c536
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ contrib/eggbitset/meson.build | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/contrib/eggbitset/meson.build b/contrib/eggbitset/meson.build
+index 82cd8a40..f2f81685 100644
+--- a/contrib/eggbitset/meson.build
++++ b/contrib/eggbitset/meson.build
+@@ -6,9 +6,18 @@ libeggbitset_deps = [
+   gio_dep,
+ ]
+ 
++libeggbitset_c_args = []
++
++# roaring.h enables its x64 code paths based on __AVX2__/__SSE4_2__ alone,
++# but they rely on intrinsics only available on 64-bit x86.
++if host_machine.cpu_family() == 'x86'
++  libeggbitset_c_args += ['-DDISABLE_X64']
++endif
++
+ libeggbitset_static = static_library('eggbitset', libeggbitset_sources,
+   gnu_symbol_visibility: 'hidden',
+            dependencies: libeggbitset_deps,
++                 c_args: libeggbitset_c_args,
+ )
+ 
+ libeggbitset_static_dep = declare_dependency(
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
