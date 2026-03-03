Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1431EDEBEC
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 20:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84E0482F03;
	Tue,  3 Mar 2026 20:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gKhGlOet9eRO; Tue,  3 Mar 2026 20:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC47B82CB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772568087;
	bh=efguG6A5kL4OZeqntzGPmH1LqbSYj+cCvTqm11/42Rs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CrYgU5YfMzhW69TzB2I+bDCXVRGC5ET8f06JhZgeMRQ+vROlOhCrz3Z9tUVIefaJo
	 P1Fsv1hAxyIyBAVOujIp4CTXFMADVa8xW00nSWkrbtlxrZ1h4aMKoN+MmpXdfdkP4E
	 ArdqYwcUTlTBgx2iPTljx3cN1lwCBBgk2ioIUGbpRb3yRfPYOz6LAUTQWXrtSXn/tU
	 x3VdAc49RUQqqF0/ToVONLWqWWhkt7vp8qX8ZBo5cS5HrCF6WgFOZeM4CBAxqRnoBS
	 NKyAv3ll7aquDbGSsJ69VfBMKn4H7yvjQ3xhvk/cSbaY8pDZqVB7DzcYyr4rXxyE/d
	 E7I6ZWyopfhYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC47B82CB7;
	Tue,  3 Mar 2026 20:01:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EC711EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4060C4189A
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pT7wHo7FdMys for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 20:01:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DCD8A40CF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCD8A40CF5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCD8A40CF5
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 20:01:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04ca.dip0.t-ipconnect.de [91.58.4.202])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C0855A4C337B;
 Tue,  3 Mar 2026 21:00:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53148)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxVvL-000000003gI-1qhL;
 Tue, 03 Mar 2026 20:00:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Mar 2026 21:00:41 +0100
Message-ID: <20260303200054.784253-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260303200054.784253-1-bernd@kuhls.net>
References: <20260303200054.784253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772568055;
 bh=kroJWmlhcbU41myDRAr+wlZM/105BgVkxhvj005fFRk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EV9vlH/iJmyjDfPhESStCiLtkwbk4LjAmsaSW37RWXJhdHMJXJ3Ei3MIO/3ARNIAn
 gxwyYS1KQ9RFvzbz3zji3D9FGFaDRlOCgaQvU9+jf6mYfmAN4R0wmH8SIKoeccS+US
 BJMPToCyMvOOnJL0hlZFLC8hML0IS27QZtg9p/hghAKZU+7pGQW60h7SwlHBKqZ4r9
 XR0yfNr5bY3MYngccxDg6MMrw6DMPaL0jx3VDkOmqDmHBBrIl02t2Wfg6DyM5Ay74g
 N7iBbtPFdmIAdK0XTgTsOuUwtnYSlA76LSGPqomv457Ew0uPk9W1A8ohvgZLETCa0D
 dRNMRtBVAmbhg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=EV9vlH/i
Subject: [Buildroot] [PATCH/next 02/14] package/lxc: bump version to 6.0.6
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Pieter De Gendt <pieter.degendt@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://discuss.linuxcontainers.org/t/lxc-6-0-6-lts-has-been-released/26294

Added sha256 hash tarball provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lxc/lxc.hash | 3 ++-
 package/lxc/lxc.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lxc/lxc.hash b/package/lxc/lxc.hash
index cfe0e5ab6b..8cec7002fe 100644
--- a/package/lxc/lxc.hash
+++ b/package/lxc/lxc.hash
@@ -1,4 +1,5 @@
+# From https://github.com/lxc/lxc/releases/tag/v6.0.6
+sha256  b0ba4537258d2b848fd07dedb1044dab132de3fb3f1976d240da40a7dee1b8cf  lxc-6.0.6.tar.gz
 # Locally calculated
-sha256  2e540c60b9dd49e7ee1a4efa5e9c743b05df911b81b375ed5043d9dd7ee0b48a  lxc-6.0.5.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 2f17960e55..399b47070d 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 6.0.5
+LXC_VERSION = 6.0.6
 LXC_SITE = https://linuxcontainers.org/downloads/lxc
 LXC_LICENSE = GPL-2.0 (some tools), LGPL-2.1+
 LXC_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
