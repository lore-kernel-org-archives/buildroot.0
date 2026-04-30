Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F69FCD13DA
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 19:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 413DE6F503;
	Thu, 30 Apr 2026 19:09:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uN2DevTl44ln; Thu, 30 Apr 2026 19:09:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37F216F4F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777576148;
	bh=HTh7AyqOzXcNRTnAZU9F6hAoRrkX/cCcqA5EFkfcMpU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=C1Yt4w/VIFC0Ia4rWMjG8MMFKyaqFEUDz479YARx0s0q9JBwEDshozbHJnfCMpURC
	 YgN9R52/vzn4zLgdMeoyztkD65lwt0+wgAu8NLX1Jzf0eYUZNBeTLwVnviOUbhismq
	 CrmaEbKCMzakTPKwxcd0ECsXyXDbeP/7isLRafByzYAXMLWH7CTwyscWEwQzLyJE9v
	 RgC46U6OeAHNDcQpnrYCYK06nANbetNbkg7Fi+i/DEkbs3D/83p7//tH2LReCrXl9P
	 bdEwbPcP0THaQxQ/AV4MVxsGWjSlNdOmCMkz0AenggV1vAGZOvkqnXCQJxrTifxyg9
	 BKe3rg879yR5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F216F4F3;
	Thu, 30 Apr 2026 19:09:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E9282192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA2E26F4F3
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bG4e_WIM9Ipv for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 19:09:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1D916F4F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1D916F4F2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1D916F4F2
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 19:09:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B293A4C2D6C;
 Thu, 30 Apr 2026 21:07:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60442)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIWim-000000000Pg-2irS;
 Thu, 30 Apr 2026 19:06:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 21:06:45 +0200
Message-ID: <20260430190647.3212159-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430190647.3212159-1-bernd@kuhls.net>
References: <20260430190647.3212159-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777576021;
 bh=4twEeZDmt786fSG77MfE3Zp+TLRdEimw/c8/YQYP5Fc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DaeLtCLU/+x4N8abzBXvB0s5mWL/7l8SrkeFBNsGeM5hsYHTgS0XV//wtmaTFASjr
 USlYJqgkdhGeEM0//C9O2gKPUg4+QKLxULrj7N0yn1klKs+2IJOTgDz16cL9NQZeHU
 eblnYMwyEk6pTgMiNOpQz1Ov3NwYuadJ41Zm6giSCSKHXDsoG9G2Ocxl5QUJw85/Qk
 QNW71kJiGbagQr+0v0oDjE3+atJzo7Z72UbJXLbohfQlzEuAE60pHUBr6Ead+siq68
 o9ToUXdICK0NpmcnPqJ10eFi0Nx5jbMuLg7toPTDS31U9TjhnGM/228Cso30WdEysy
 40w+VtOroIZzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DaeLtCLU
Subject: [Buildroot] [PATCH v2 12/14] package/gcc: switch to GCC 15.x as the
 default
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that GCC 16.x support has been added, follow our usual strategy of
making GCC 15.x the default GCC version.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b9dd37471f..e218b13bd2 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -5,7 +5,7 @@ choice
 	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_POWERPC_CPU_HAS_SPE
-	default BR2_GCC_VERSION_14_X
+	default BR2_GCC_VERSION_15_X
 	help
 	  Select the version of gcc you wish to use.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
