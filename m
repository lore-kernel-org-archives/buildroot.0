Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B337FCDB46E
	for <buildroot@archiver.kernel.org>; Thu, 12 Oct 2023 10:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6AEBA60A77;
	Thu, 12 Oct 2023 10:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6AEBA60A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mc0rz4hbgVJg; Thu, 12 Oct 2023 10:33:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FFA160FC6;
	Thu, 12 Oct 2023 10:33:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FFA160FC6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8D9F1BF2B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CFDCD404B9
 for <buildroot@lists.busybox.net>; Thu, 12 Oct 2023 10:32:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFDCD404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OrT3qjhNSU2V for <buildroot@lists.busybox.net>;
 Thu, 12 Oct 2023 10:32:43 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1142F40004
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 10:32:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1142F40004
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9b1ebc80d0aso124541166b.0
 for <buildroot@buildroot.org>; Thu, 12 Oct 2023 03:32:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697106761; x=1697711561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cmcnY/4dDVKz8J2UjSlW1GtRYoBR8JxEmXpwnnUZYfI=;
 b=CYOqbfxHdRjtn2RlWgHHqW7965+jb0GrRJW1UBZfl03adfkhw9y8Yceqy5/ukrL8aW
 fsWLtPYWL/E5UUno9yUwab0E6qJI5Lfkg1Q4di0tM060Epe4BwxL0ev0pqkxIx4Plu8F
 ds9btLiZItwH9LHgtGMCikhMgfaLydrqRFz32PfTeCej6dQHQLZtb0iorQrUHTMMHpQC
 VMgV1wQidcCYOHht+Nat5C2GoIsA6jWZZ8IyaDsacY6y7idllC1cGPXNCLLDLgYIcSmE
 +87jzUM4RrmmspeQaGHWhmFT4Pze3ATjNJdb/0QWjsfmJCE9Q+EZmGU9mMADzu8tiKep
 ne1Q==
X-Gm-Message-State: AOJu0YzVpSxnEni5J+dnOSgxu8Q+3j401pwY8mr76vFJG015Ixs/cjSA
 zJoeEUoAFbYbODbjzHbuj+xPHH+0PkxAPIC3PVBofw==
X-Google-Smtp-Source: AGHT+IFNWwK3XpbEY+0jSCe/OrvV932JvVEMDTDFoZ4fdOjwJ+9zgDWGJC5swmvnGDPwf/N2Q9DrMw==
X-Received: by 2002:a17:907:7749:b0:9b2:b9bd:a369 with SMTP id
 kx9-20020a170907774900b009b2b9bda369mr19801108ejc.45.1697106761049; 
 Thu, 12 Oct 2023 03:32:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 gx13-20020a170906f1cd00b009ad8d444be4sm10847131ejb.43.2023.10.12.03.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 03:32:40 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Oct 2023 12:32:03 +0200
Message-ID: <20231012103210.2915871-7-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
References: <20231012103210.2915871-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697106761; x=1697711561;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cmcnY/4dDVKz8J2UjSlW1GtRYoBR8JxEmXpwnnUZYfI=;
 b=fra7dl+q49tmc/VlE4sDHYNhdXjtesWP4dB+l1LToczauIpHs4ZZas4O8lTqaiy+sr
 S1KcB5VDP94txva/fysYMBfA9ijb1CGW+x3jn1yT9exeQzMy16LtORSnd5OpxDFvZv/d
 UPugLix1GiQkh5RRxRDpCPb3lzBUVk3jJlD8w=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fra7dl+q
Subject: [Buildroot] [PATCH 06/12] package/audit/selinux: Add buildroot
 audit policy
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Marek Belisko <marek.belisko@open-nandra.com>,
 Antoine Tenart <atenart@kernel.org>, Sen Hastings <sen@phobosdpl.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a basic policy necessary for audit to work properly in enforcing mode
without any denials.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 DEVELOPERS                               |  1 +
 package/audit/selinux/buildroot-audit.fc |  0
 package/audit/selinux/buildroot-audit.if |  1 +
 package/audit/selinux/buildroot-audit.te | 13 +++++++++++++
 4 files changed, 15 insertions(+)
 create mode 100644 package/audit/selinux/buildroot-audit.fc
 create mode 100644 package/audit/selinux/buildroot-audit.if
 create mode 100644 package/audit/selinux/buildroot-audit.te

diff --git a/DEVELOPERS b/DEVELOPERS
index a90f453261..5f4b7320ba 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -32,6 +32,7 @@ F:	package/vulkan-loader/
 F:	package/vulkan-tools/
 
 N:	Adam Duskett <adam.duskett@amarulasolutions.com>
+F:	package/audit/selinux/
 F:	package/busybox/selinux/
 F:	package/depot-tools/
 F:	package/flutter-engine/
diff --git a/package/audit/selinux/buildroot-audit.fc b/package/audit/selinux/buildroot-audit.fc
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/package/audit/selinux/buildroot-audit.if b/package/audit/selinux/buildroot-audit.if
new file mode 100644
index 0000000000..2a739a1113
--- /dev/null
+++ b/package/audit/selinux/buildroot-audit.if
@@ -0,0 +1 @@
+## <summary>Buildroot audit rules</summary>
diff --git a/package/audit/selinux/buildroot-audit.te b/package/audit/selinux/buildroot-audit.te
new file mode 100644
index 0000000000..3cac330d30
--- /dev/null
+++ b/package/audit/selinux/buildroot-audit.te
@@ -0,0 +1,13 @@
+policy_module(buildroot-audit, 1.0.0)
+
+#============= auditd_t ==============
+allow auditd_t auditd_etc_t:file map;
+allow auditd_t device_t:chr_file { open read write };
+allow auditd_t kernel_t:fd use;
+allow auditd_t root_t:chr_file { read write };
+allow auditd_t selinux_config_t:dir search;
+allow auditd_t tmpfs_t:dir { remove_name add_name search write };
+allow auditd_t tmpfs_t:file { create open write unlink };
+allow auditd_t tmp_t:dir { add_name getattr open read search setattr write };
+allow auditd_t tmp_t:file { append create setattr getattr read open };
+allow auditd_t var_t:lnk_file read;
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
