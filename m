Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1904ACD3439
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 18:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BB0F82BF4;
	Wed,  6 May 2026 18:41:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGzML_fiOuVv; Wed,  6 May 2026 18:41:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DBD382BBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778092889;
	bh=+wmE4zBTALlBvGr7WKMBndylde+iu06cW/X90IeQDzw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C/Zpb0sRfgSBTrJKz2mfTjpzJDy+u0bmXx7wXZsT0DLMtsFLx8c1KZR6jNlHmoz1W
	 Oz3hBweL/JJLVG4lq1EFhpcu5E8TQbFtOydOBjaTXX8xhfJi43w4iiqBq/xaaiEYKZ
	 pwHmjpXe6CHj2iYJ91NyafTafqwrl3ppH6bPlujZNdmkWQHSMV+Fm7gL+ZIF4bnmKG
	 pN2Y0/GsW262mlPih+XbmxMPuvAEpXuGrQuvPPF/9+93TVgJps/6z7C3JxkNb33U9f
	 Bkp9yX1CKTIagyC2jWb4VBE6yfwfMuTPTeGzooqNz+Io/OkSfQAGpWsSX0LFY7PgvP
	 0GcFdfYl6Zgfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DBD382BBC;
	Wed,  6 May 2026 18:41:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C9C4A280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:41:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFF1540F44
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:41:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJHfEVmaBmY4 for <buildroot@buildroot.org>;
 Wed,  6 May 2026 18:41:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66E2740F3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66E2740F3E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66E2740F3E
 for <buildroot@buildroot.org>; Wed,  6 May 2026 18:41:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bec8.dip0.t-ipconnect.de [84.161.190.200])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A6958A4C2096;
 Wed,  6 May 2026 20:40:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38038)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wKhB3-0000000040X-3zbK;
 Wed, 06 May 2026 18:40:58 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  6 May 2026 20:40:46 +0200
Message-ID: <20260506184057.665854-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260506184057.665854-1-bernd@kuhls.net>
References: <20260506184057.665854-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1778092858;
 bh=D+osnGSBmsspVvJ5+wMPqrq5abkNxtEqGiHFe737XmE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rXVk+TAJaovwAIUUtTCxGqWKK29O1X7GOlKqwK8RO2gbft3cNwJ6g9D0NYUG1zlya
 ELpae686GvmytQUgTXZRGzPM/qG2YSOxbEyvpLnYwArDxnaICAhIL4sNgghkvQpa0T
 AzoYYK2GqhO4pnTInTV2zMrt6scWU3dsl3SVIDCMyWM6HYM2P2khwCRPiqaZNPyhNW
 a8dBSeO/xCmd6NUNtAUK9qhaVKCehzgrFFl9W8pW6OSju37iq/M6LbYz34lGFXqj/W
 pJvFv1StSgecdt6eAyeqnogzMyQjAxlW0FBsXlbmfeqznvhCWHc/9L1ajJC74G+lyU
 03hcpIHsh4J3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=rXVk+TAJ
Subject: [Buildroot] [PATCH 02/12] package/libudev: new virtual package
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

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/Config.in          | 1 +
 package/libudev/Config.in  | 6 ++++++
 package/libudev/libudev.mk | 7 +++++++
 3 files changed, 14 insertions(+)
 create mode 100644 package/libudev/Config.in
 create mode 100644 package/libudev/libudev.mk

diff --git a/package/Config.in b/package/Config.in
index b7c799d9db..1c0f6d8a29 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -530,6 +530,7 @@ endmenu
 	source "package/libiec61850/Config.in"
 	source "package/libmanette/Config.in"
 	source "package/libubootenv/Config.in"
+	source "package/libudev/Config.in"
 	source "package/libuio/Config.in"
 	source "package/linux-backports/Config.in"
 	source "package/linux-serial-test/Config.in"
diff --git a/package/libudev/Config.in b/package/libudev/Config.in
new file mode 100644
index 0000000000..2dbafe4991
--- /dev/null
+++ b/package/libudev/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_LIBUDEV
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	string
+	depends on BR2_PACKAGE_HAS_LIBUDEV
diff --git a/package/libudev/libudev.mk b/package/libudev/libudev.mk
new file mode 100644
index 0000000000..af1b3ddb51
--- /dev/null
+++ b/package/libudev/libudev.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# libudev
+#
+################################################################################
+
+$(eval $(virtual-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
