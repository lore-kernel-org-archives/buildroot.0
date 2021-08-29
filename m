Return-Path: <SRS0=tQX8=NU=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3D51C432BE
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:48:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A52D360E90
	for <buildroot@archiver.kernel.org>; Sun, 29 Aug 2021 02:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A52D360E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 808A1404BC;
	Sun, 29 Aug 2021 02:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhTx56DXoSqE; Sun, 29 Aug 2021 02:47:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BFAB404BF;
	Sun, 29 Aug 2021 02:47:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 347BB1BF37E
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23889404BE
 for <buildroot@lists.busybox.net>; Sun, 29 Aug 2021 02:46:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XIFjN4HA8mz7 for <buildroot@lists.busybox.net>;
 Sun, 29 Aug 2021 02:46:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA9CF404BC
 for <buildroot@buildroot.org>; Sun, 29 Aug 2021 02:46:45 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id b200so14681472iof.13
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 19:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7m/+7ifuzuMhJ5ctHHwZWdO+ajn+S32hsjeXIWTDM8=;
 b=MyhoT8aADExypvEB2i9JsRee/N77KQSTWymETTbpbq1LdbjIIHrmzwR4w0DCmFv9Z4
 D6+fE0W1UgpGF3smUUWakZJKjpYVs8aNH9dr2mZWj9plFitcwVO3rjPU7IgZzFqD9xDw
 969aKI218BYL5r8JNmfGw2LN9Rx1H9dQYuAdXso5pIfhEiXBjeez9f1pn09N1zNqKnkm
 i4pJMqvZrJEaHdOcacQx/p4AV7c9vZh9zJgOckk8qNNqjgZ/oE65aOb0B+eiD8I5h5VW
 EqLCjyUQYd6Czj6/3fqfR2fFymiZ+mp2rtBUdulp7O6GFj3N2qIDKwkJNdSvZF5oOZlu
 ydUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E7m/+7ifuzuMhJ5ctHHwZWdO+ajn+S32hsjeXIWTDM8=;
 b=CEvpMChuOBRLRN0J5otHWxFiXaIE1yDtOa3OL8k7POrKnvsdNU6HFcZ7ERaNly73W0
 IraADX2r0EC/Y/4KlA7DFG5EqpIzZ6/RMZGbEs8i8rJmOOa1lQlof5QYRmPHSfV+Su1U
 dF/IrGi/7pIydFuOeFozzyicuOlKLeTAuctaqBYq7687wSYOjnvlAby9rH8qJA6ksmr9
 2NUWORPqtG/dVmllH7MqVpEj3dBXsI2722t3uXF4jG5yxUIoWxb9bICnr3z+SJad2HA6
 CnLdzBY4neANX+OlmPkHsQVWtlmVH3KvVCDpa37Ak/A2zfsqRnSpO0MwM8IsHJj9rVpQ
 NtXw==
X-Gm-Message-State: AOAM533l0osKDDUFEipUD25nhuZb9SfHk+ixOeHygYJuhXYeiFU2jXud
 uwclp6Yz5N/6rOYmjquyfLicfmfIsjU=
X-Google-Smtp-Source: ABdhPJw94/tjSUHFrEvTw3s6A+zsdfvo/omdnPtPi8qqdimq1GCRk0ltqi6VP3oGlAwhbG80Qv9pwQ==
X-Received: by 2002:a6b:7d0c:: with SMTP id c12mr13206426ioq.187.1630205205006; 
 Sat, 28 Aug 2021 19:46:45 -0700 (PDT)
Received: from james-x399.localdomain (97-118-237-25.hlrn.qwest.net.
 [97.118.237.25])
 by smtp.gmail.com with ESMTPSA id g23sm5741951ioc.8.2021.08.28.19.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Aug 2021 19:46:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 20:46:31 -0600
Message-Id: <20210829024632.682029-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210829024632.682029-1-james.hilliard1@gmail.com>
References: <20210829024632.682029-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 7/8] package/swupdate: prevent systemd from
 removing swupdate tmp folders
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Ensure these folders are excluded from being cleaned up by systemd.

Fixes:
[ERROR] : SWUPDATE failed [0] ERROR : I cannot open /tmp/scripts/format.lua 2
[ERROR] : SWUPDATE failed [0] ERROR : extracting script to /tmp/scripts/ failed
[ERROR] : SWUPDATE failed [1] Installation failed !

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/swupdate/swupdate.mk            | 2 ++
 package/swupdate/tmpfiles-swupdate.conf | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 package/swupdate/tmpfiles-swupdate.conf

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index cf3607a661..4bcdb96602 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -248,6 +248,8 @@ define SWUPDATE_INSTALL_INIT_SYSTEMD
 	$(SWUPDATE_INSTALL_COMMON)
 	$(INSTALL) -D -m 644 package/swupdate/swupdate.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
+	$(INSTALL) -D -m 644 package/swupdate/tmpfiles-swupdate.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/tmpfiles-swupdate.conf
 endef
 define SWUPDATE_INSTALL_INIT_SYSV
 	$(SWUPDATE_INSTALL_COMMON)
diff --git a/package/swupdate/tmpfiles-swupdate.conf b/package/swupdate/tmpfiles-swupdate.conf
new file mode 100644
index 0000000000..4743672fcc
--- /dev/null
+++ b/package/swupdate/tmpfiles-swupdate.conf
@@ -0,0 +1,2 @@
+X /tmp/datadst
+X /tmp/scripts
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
