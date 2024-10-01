Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8756CCE7CE7
	for <buildroot@archiver.kernel.org>; Tue,  1 Oct 2024 09:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED21A607FE;
	Tue,  1 Oct 2024 09:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IOzQvX_ZAbla; Tue,  1 Oct 2024 09:21:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F247060807
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F247060807;
	Tue,  1 Oct 2024 09:21:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F3991BF27E
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 09:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F227A40A7F
 for <buildroot@lists.busybox.net>; Tue,  1 Oct 2024 09:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFxEvRUppsOe for <buildroot@lists.busybox.net>;
 Tue,  1 Oct 2024 09:21:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8426F40A7C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8426F40A7C
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8426F40A7C
 for <buildroot@buildroot.org>; Tue,  1 Oct 2024 09:21:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 804951814BA; Tue,  1 Oct 2024 11:21:33 +0200 (CEST)
To: buildroot@buildroot.org
Date: Tue,  1 Oct 2024 11:20:55 +0200
Message-Id: <20241001092057.612830-1-buildroot@heine.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1727774495; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=pyuFbxnqHGbo8gttp2mL8Z9tZS6PUO/860Yqas7wVeY=;
 b=tZ4oWerVow1719NBMjqTCFv5GDzN84WRS40RoX1bihAE2BRQdbWPyz6Pw9p+CZTHKMUDGg
 D/tgIuDhNDUYTxwRuPbfdmYXD9WGCAsgbRwduyhvjUWNsseuUvfNfSZbyYbmYbpggD2Jlf
 c/0rqgBQUgmKzt1JuuG6oCYklQeOrPI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=tZ4oWerV
Subject: [Buildroot] [PATCH] package/linux-pam: adjust login pam file for
 lastlog
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

when pam_lastlog.so is not installed login issues an error
that it is not able to load it.

Hence only enable the entry when pam_lastlog.so is installed.

Fixes:
 login[649]: PAM unable to dlopen(/lib/security/pam_lastlog.so): /lib/security/pam_lastlog.so: cannot open shared object file: No such file or directory
 login[649]: PAM adding faulty module: /lib/security/pam_lastlog.so

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/linux-pam/linux-pam.mk | 5 +++++
 package/linux-pam/login.pam    | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/linux-pam/linux-pam.mk b/package/linux-pam/linux-pam.mk
index 1433eb00b3..c5543e1f1f 100644
--- a/package/linux-pam/linux-pam.mk
+++ b/package/linux-pam/linux-pam.mk
@@ -56,6 +56,10 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_PAM_LASTLOG),y)
 LINUX_PAM_CONF_OPTS += --enable-lastlog
+define LINUX_PAM_LASTLOG_PAMFILE_TWEAK
+	$(SED) 's/^# \(.*pam_lastlog.so.*\)$$/\1/' \
+		$(TARGET_DIR)/etc/pam.d/login
+endef
 else
 LINUX_PAM_CONF_OPTS += --disable-lastlog
 endif
@@ -66,6 +70,7 @@ define LINUX_PAM_INSTALL_CONFIG
 		$(TARGET_DIR)/etc/pam.d/login
 	$(INSTALL) -m 0644 -D package/linux-pam/other.pam \
 		$(TARGET_DIR)/etc/pam.d/other
+	$(LINUX_PAM_LASTLOG_PAMFILE_TWEAK)
 	$(LINUX_PAM_SELINUX_PAMFILE_TWEAK)
 endef
 
diff --git a/package/linux-pam/login.pam b/package/linux-pam/login.pam
index 5df7db628c..21d2afb61e 100644
--- a/package/linux-pam/login.pam
+++ b/package/linux-pam/login.pam
@@ -8,5 +8,5 @@ password	required	pam_unix.so nullok
 session		required	pam_limits.so
 session		required	pam_env.so
 session		required	pam_unix.so
-session		optional	pam_lastlog.so
+# session	optional	pam_lastlog.so
 # session	required	pam_selinux.so open
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
