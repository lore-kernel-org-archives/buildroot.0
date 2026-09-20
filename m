Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3F8C982DA
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 21:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA7040844;
	Sun, 20 Sep 2026 21:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MYRdJS4skvG9; Sun, 20 Sep 2026 21:40:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4967C40DCF
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789940430;
	b=aptQS5DPN9H5hmYfO/hlMxgK7G/Jf0GstHAo2c24B7Ge3DjLOxakUSiJd7AP1SNp0DGE
	 Tzt8putI2WkCYc/rEsxH7SO9DzZ1w1hR3sCs8Q3PmYJGPu+aYoRU47Pfo3FcxiAFNH4Ws
	 VxiyFROaYseWgMyrGkd/8MKu1C+xvWuZKoHbPULOu97m6gt0ztpEJbWuuTVPDQfiSxI16
	 gAiR+owzEXQdSfcziVTzHLwvi4F9fv6PN4wW5C0KprgMooINVyye8oldz0pjGKZGpWK2K
	 wO7w4/Fe/rwg4lMOgDwVqjEQCVV49Ct7WbYyNlk/LT8kATBJ7x3Jb0WdXZzUxJ0iQlA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789940430;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1Lc2HhVxq0OPs5Jt5rRokqgWjS2FjjPLxZhG+Xo5tG8=;
	b=aQHig5jRiCNOuTszlnppc9IxcKtfG4M0EtS81KqY516LxWO6/XtN/2gl88bYkLyNM8R8
	 WQl0nlCZ24iVnKZ/2ImcTBu9F+9nTbDoAqPREcjPtv2mRIReyjGGTzrsd318opZomniSF
	 xrzlpY5bPyUxJUsBvYoFrm6swQNvQWDHmN5i/dlfKoyBF9D4BZ+EYcrB6CpvzwHAJ4NZb
	 a5gCYxKiKYSavQwJjmlrMWFQnfkl7/wlts4i4aJNo/OgFWQ4vMf7wN6sw6wYp9Q5lJhC6
	 WCmTl1ZnFkFTopjFqpf6b6unzfA+/PSFxke9MAYs7efSaMpf6RbwNUIdpUsFatAw+MQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789940430;
	bh=1Lc2HhVxq0OPs5Jt5rRokqgWjS2FjjPLxZhG+Xo5tG8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qQsGAwYqq2aobHpqRxv4L361+FEYnsAYefsATidL8fcRAW0VLnm6bZZOhUFUpgBcB
	 2lCqULkkRNrQKQnKI4AQ2CFXies75aFeknhIwIt6CNArTw2r2YtV7h1cGs578AF4Xd
	 jNgvDdLHdDyx5NJORKX/AJMyy+/b/KnjzPezfGT/cEsqUWLMCCCg+ABqSX3HMYSJvA
	 xY8mSd+9U6b/X3V6Am7ExrAK/clsWztnjKDP0kWB34efCH8Ve1l8rtFSNEmFJV1j8j
	 4NInC4hLP0EV/3BdmBPgv++N/Wia8O2oHAzDXG2/VkRsTPJ+jUnOgpluFwcLsF1oQb
	 irmtcPOdO5J4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4967C40DCF;
	Sun, 20 Sep 2026 21:40:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 30E79380
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EBA360679
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nJ43JHmLKxR4 for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 21:40:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 342EC605FD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789940428;
 b=IArs2zrw9hlPErZUXNJ4K7jLX0XzMY2kvA7Ou+RGb5EOBWjx01eJ1S8kdc1Ke5JO2S03
 PjY7ko0jzQqyNpGhySU8XY+Lm/P2uPD3Mfrrl48o3LJJCPfUYlNx9fb+BfRrGxq69xRY4
 QQ2QAo+HPqD7abmpRWoeJg9TkbLkU4H4xeqxeYaXecXNE60XCV5WXj55MUpqg/gKoVB1g
 ch/3CZio56x7Ob5JWp+2B/cK9DM2RwhCM+VSiriwtXjdi3CzVi1z6KW+RXVzyzUmN4x9v
 XZEZ9gyg/3WNUSGXbsY35/Y/n9GF3hdOdPY2kKkUqRWTtCWHTZk9jdjIsGBwiBxijjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789940428;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=b7JOGpP/Oqb3jXF3/ZnO3NQCuCW6yt0T74ldfFmd5QY=;
 b=Vw2JF7mdk6/PSTAa+pD2Qc3BEcBvyJ5oaqpppT2sMAje6wjxwYB42WzKlvrxlXY8PqVv
 hxaO31eo1mzEaRmwjjG49idEW7uxyLvV7/t+ZYoH/HJ3i4iK/lqSLPMkfrOiY9DeEdUH5
 5RLXz5T0TWL++ZTSSnCkFz0iIK9w79qdphKuq/JUHi1BzXNPmv1kTewZ/sCfuvIi48Zzy
 AiL4febDURJuIC7aevoLd4cqYunBqgpGPWPa5HWEVsRlOxNTmNF0euiI28MCICK7wGh0H
 ORxcXyAmSaQmhQgK8+ZOsTTIQYckgw/6hJzi8au/Q9gvVXRM8jsCpvcQjmxwequqZiA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=epsY5PmN; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=epsY5PmN
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 342EC605FD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 21:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789940402;
 bh=b7JOGpP/Oqb3jXF3/ZnO3NQCuCW6yt0T74ldfFmd5QY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=epsY5PmNgTWe09ThNhYi5rBwEUGkAIXJa2nO0I926oOqoH2CIE+TcHYLLce3Rfe56
 DRZAYtuL6TwG/rD/mGlltYWGylo8yaF/OdHJJxAD5IuY5StjicBThuYEWvTPrFweDk
 k1ns7TijgkEdzrou5iulg34rkKTuFZz6FUao5XxV9T4EFJ+u0DBdkU3hOdyYZxCgYv
 WFYtVYTABYfyU1W/5okxEYSHVaOlfp1FJDvd2i0tCzv7RLXJl6XJo06wRE+RUlvizk
 63in25blLZJP70kW8ikRtrSw0sR5R1KzOAbc46ip6HcFhVgVZNOEWe0hzZqA90U6+n
 597TITzj15iaA==
X-KAS-Sym: v3:f51bdf72230551df:lCKheS9ndnLLT4/f2BHXUkrfR+y86dFsCTmS5bBz4x+JxkFu26PKvBlGIxwbEoZV3EMtFST4Z+Yjco2VyPNCjf0K8YyV44TotU/s/6m7e1dzv1CrNQChbFzHpDFdaeqGlBULAx9L2hDMv6zhejJatdiQkneMrRZCElAm+doYIZfcFv82xVKiwh2EFYcJruuwMTZ//04bitbQcwuVLYhcHaglvfFOiNIzWpATDgyKjpjljYZba0Uo0N3Q0vvY7XTPULpWdgcdx470NDL3BFM9B4gIJYdB8o3O84alnrDZCCb7SZ1DLtA/fQ2cMvAFIRaKFu0NhBkZgIKqCW65wor1bg==:OgDqDcu8ioslNbS5lgQhaxDPZkHI+L3a3OpMOFu8wZJO8f1TTeu+lvNXycGIk9VVYma0JjsqxYbXuuwYlfXASGx8TKtjEpAUKeN7168VWq4zx2J5sBR88SXlddH7xFrnt5F/Q3LKtk1gkWzhAkmqgbITMyOIwK7G05kj2nZiwWavz/CgI3G85sLtgowuY5LSn1xsHOxDC5PBNMbLr7UgJgqB4t0DT3iW5XgxPfbvrtbNKnoqbZP7ZzuG43EUZRPHP9RTuKpLLHUOyindTdTg4xwCqrgmqe24gopvFezdVgnpw6qTclM5d3Bf9WixmTVnNx8ZeOqelFTjDqoenSR+Dm7lDb+bicLst9TFGSwnqx7ctHYAxfJ6T6aYCbcAMRbdDq6Cpi4mEGPqpepIaxbQAj1BAtH1L8UCU8KTJPpYFD/8/LEQexu2GA0YATKXaTBkdJRBRoeH5AoIXU+azN4JqZ/iggiM8KvFb8559eZ3Uv0MOLDDFtkqZRVj/6pf1/kPotZ/TRKcRmqJsGz55b5t9CLfxBGp1W7Fi71qx+rDKvD/t7+WrinJKkC3dZU3oDDVTMRLjddDJG2C3cOSarFGH3rm2LwsPkMGlX4MsepIY2EV26
 rZ4zlUh6XdU6WZulaISuglIMhmmPrYBZqCzKEc7IOAQ/n/BsKqURMez0X8v122O0OG5w==
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1EBEAA4C4887;
 Sun, 20 Sep 2026 23:40:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44740)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8PFb-000000006Yg-3akK;
 Sun, 20 Sep 2026 21:39:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Lang <dalang@gmx.at>, El Mehdi YOUNES <elmehdi.younes@smile.fr>,
 Joseph Kogut <joseph.kogut@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sun, 20 Sep 2026 23:39:04 +0200
Message-ID: <20260920213906.905956-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920213906.905956-1-bernd@kuhls.net>
References: <20260920213906.905956-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH v2 4/6] package/mesa3d: crocus Gallium driver
 needs precomp-compiler
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit 59ed1137e9bb8c0157be3dc91a1cc462211dd3c7 bumped the
package to 26.0.0 which added upstream commit
https://gitlab.freedesktop.org/mesa/mesa/-/commit/b72d347d1c3b9e829971fbdabf993b68776083c1
requiring the precomp-compiler for the crocus driver.

Add the necessary dependencies to fix a configure error:

../output-1/build/mesa3d-26.1.8/meson.build:945:3: ERROR:
 Feature llvm cannot be disabled: CLC requires LLVM

caused by
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L945

which checks the value in the variable with_clc.

When the precomp-compiler is not provided by host-mesa3d the meson
configure option mesa-clc does not contain 'system' causing
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L939
the variable with_clc to be filled, among others, with the content of with_driver_using_cl:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L939

which contains 'true' when the crocus driver is enabled:
https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-26.1.8/meson.build?ref_type=tags#L925

So we need to provide the precomp-compiler also for the crocus driver.

Fixes:
https://autobuild.buildroot.org/results/baa718e140264a9aa64c3a8f4114ca1b05f740e3/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 package/mesa3d/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index feed6b68fe..e18d25eb8e 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -110,10 +110,18 @@ comment "Gallium drivers"
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_CROCUS
 	bool "Gallium crocus driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS # host-llvm
+	depends on BR2_HOST_GCC_AT_LEAST_7 # host-llvm
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_NEEDS_PRECOMP_COMPILER
+	select BR2_PACKAGE_MESA3D_RUSTICL_SUPPORTED_DRIVER
 	help
 	  Mesa driver for gen4-7 Intel GPUs.
 
+comment "crocus driver needs host gcc >= 7"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	depends on !BR2_HOST_GCC_AT_LEAST_7
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	bool "Gallium Etnaviv driver"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_XORG7 # libxshmfence
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
