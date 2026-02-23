Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3077EC1120
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 18:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CDF1814C9;
	Mon, 23 Feb 2026 18:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhMobwAb2-Fk; Mon, 23 Feb 2026 18:54:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A8B081335
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771872893;
	bh=zeAZI3eW6I5Q3T/VItNEYFQT7LDKP2KuT/4MErz0144=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YgJwL1zX1Fa/CZ3rcKsMzkyKM9FmBrSd2L7Bn+3mxEZQ3or8IAffiJkEKfRs8NwgW
	 bc0n5Z4zxONZ68uOxynUdXEea8j1YGueu32qg9xQwbSvZ3sgctsqhrGKhoQLG0OMYJ
	 eZI5Ms+Lc6nU/8NB3aWlJao+KAra8N8bRjQkJKt4VKF3sq6AU9/AtdMcbKGoJDUsvV
	 zshDE2lqAR7XBjpCul5jw+sjXXLeEhtQBzMy20CBs7owkuxVdt7DnNZmwkQuD/t+xO
	 /UNuq6kBhCRXrINYyLBuSiQtWXFl4NUseHumZhria6pRCszMs/yht5S7J81BC3juQA
	 fi/TFmHFvenVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A8B081335;
	Mon, 23 Feb 2026 18:54:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F08721B8
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 18:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED81D6076F
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 18:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WVn8QoQ6PuQf for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 18:54:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2AE956075D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AE956075D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AE956075D
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 18:54:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CE619A4C1F31
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 19:54:45 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51396)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vub4v-000000007b3-3BlX
 for buildroot@buildroot.org; Mon, 23 Feb 2026 18:54:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 23 Feb 2026 19:54:45 +0100
Message-ID: <20260223185445.1259745-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771872885;
 bh=9ZHxsILbYgafeUCeGQ+Xstk/CjHOMMeHxjk3XLgCess=;
 h=From:To:Subject:Date:From;
 b=hfXC72x2Lbd890P4Kvgrq1DN1LF3Qp8l8yQ93V8YFD5On5Wg4Dj31ySUklV48D4ha
 oFq/X0Jdceu4kpfs9tL63MK18XrbGfBdhuYLIp4XnocFnStf6Hc4qTleurPF6tRLAU
 FxCPRm/W/6UeMbsUdxmwat9wS8+aev4ZtVEf35xVNq5NNetkn2DLYb/CXjoC20RR+X
 Gz8HQX6m1zHS2k3dClsX4hah/11lW0nUBE3s1RMmIVi6lbZaIJzhno8/Cgkik4PYu4
 UM1jRiiOoZIbcHTyZYPNOXPX52Ipr3/I0DbFEqv2okv/dO6UoHhoegeLcwAi+TeD4r
 nbvYZK/+fNMGQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=hfXC72x2
Subject: [Buildroot] [PATCH 1/1] package/kodi: fix wayland build
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

Fixes wayland-related build error:
make[4]: *** No rule to make target '/usr/share/waylandpp/protocols/presentation-time.xml',
 needed by 'wayland-extra-protocols.hpp'.  Stop.

by adding a configure parameter pointing to STAGING_DIR.

The build error was not recorded by the autobuilders and can be
reproduced by this defconfig:

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PER_PACKAGE_DIRECTORIES=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SOFTPIPE=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON3_PY_ONLY=y
BR2_PACKAGE_WAYLAND=y

LibreELEC added this configure parameter seven years ago:
https://github.com/LibreELEC/LibreELEC.tv/commit/d19ab98bf324364bf36b7c2d630524267dfaaa01

so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi/kodi.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index c31e789503..02feb17b4d 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -126,7 +126,8 @@ endif
 ifeq ($(BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND),y)
 KODI_CONF_OPTS += \
 	-DPC_WAYLANDPP_SCANNER=$(HOST_DIR)/bin/wayland-scanner \
-	-DPC_WAYLANDPP_SCANNER_FOUND=ON
+	-DPC_WAYLANDPP_SCANNER_FOUND=ON \
+	-DWAYLANDPP_PROTOCOLS_DIR=$(STAGING_DIR)/usr/share/waylandpp/protocols
 KODI_CORE_PLATFORM_NAME += wayland
 KODI_DEPENDENCIES += libxkbcommon waylandpp
 endif
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
