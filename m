Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20EACD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:51:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B97AE84144;
	Fri, 12 Jun 2026 20:51:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YUXTfq4T_Buo; Fri, 12 Jun 2026 20:51:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E289B84147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781297486;
	bh=elxbCOAGO6Vx30Skq82coJa7Ws0Sm7IkME1ZqhH866g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ip2QurtSbnwz09AhMkC9imqQglrSnkKaNC214e3zUFJvrI3A+NJXbbQxTmzlIGm8+
	 PCf5v3l7EJ06/bHUmKeyDTrHSZpWuy6M0jIwoS/uSS1u1KtC6UVKMOJkcOlwJJXk87
	 3fQN9KFenLfuGWuVVAnsBXnKczN8ohC/5Bb3/DSxLY2qBUdmAEfrr9DIPT9XzUfriq
	 /qEee1l9M/C2PE24hlb9Q8DlVXs3KvpDtghs2BE6OrbDEsAw0ZvzWlHMLDEmX9OpqT
	 bO8aJdkXjobsfh7oDz83SaQjFvW+fbpDH3lIl/AEBd9aIduhF/PLgdIRqse+q2Scqu
	 9YZGAidYj/mjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E289B84147;
	Fri, 12 Jun 2026 20:51:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F8E61E9D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 803E284150
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sNo9RhofBB8L for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:51:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8B4984158
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8B4984158
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8B4984158
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 20:51:21 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-45eedcdaeaaso947206f8f.3
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 13:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781297480; x=1781902280;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Fxxq9F+b4RgGt4+mWV3tQaHggGndS5nnqkax3YQ4uHI=;
 b=jMLb9u+dKUKhcDTr54XhQ9Me0cvp3WKNgxhXEtw5k6h+cynsMwygICHGvH5I9t7a+E
 xTHT3la4VzIp4lch3jrdcBCbUcstzrj5pRG8STl0LzvIHVVb2Hx+0LNjob6apXeu0smE
 zKxLYeCEFfSAju2+K41tH+iPTc9KzQfQtwO61ZmNdFzQ8eiOsBDJcy+IoZP+K1M+gbQ6
 ZiE3UtO/rVjSWXNmkfizmVIpQIh8okN/Q0YGASuickjBpSKYzAs/LqRGjj2gtAQdGbx/
 FR0PaIEH3Gl2IBqy5GS8IcAv2VWkneMrgUCorQfOhTF4EEgibKSru0CQXt/FwidwQMY0
 pOQQ==
X-Gm-Message-State: AOJu0YzZbez0qfb4wxmRdMy9c3lZkMdFoP4Ym9YPiLKLpmkkSCwQUhXr
 nVNvEEGWbVsypvA3TdDu5ClFS1uNT3hIdmJncb2HX+X2+Fk8A+bxpTzhCnfkaRr9pEZDAF00vuA
 sa0Eexw==
X-Gm-Gg: Acq92OEDrFUY/p7z0brs+zSM0YWenK6VwLj6ZrtlMJyLfoxFCuvjermov5r/za11LF1
 qPkqPvK+gkyGfybbeFgq1pM9nL0+l+c5lEY1sfZ8Eeq4zYikebQF2rxgJtvJ7jRLFU73YGDKqLK
 LHPqX4mlwzgpq7bwRhfmuDSMd6e4o24/2w+2JTvqCboSQwwjyCSMhdd/lxTj9OzVeXcGxLKeE93
 hqVvIgVxci9Hq5XkUNw5Ah2rq0pbUY/iNpU+J8m9DUxjNY2vnVqeQyua0rdrvVpNHyBthsVBck3
 NIZlp1jBsJgd8isf8/7R79pEbkoRU+m4ptaRY25bcxMQ1LkElzJMsvk3SQJvQVr31WYoss3/xfi
 YkXc/qFvZNsqrL8i4MHFsooalGRN6IB9+DiC59B93NXflfNLUZO1lCPFxToN3lqVduFDk55uj1R
 EvBtf5HjRq1oYqlUDenXvIdSg+DbHMdsRE1lqcABlbALp9YPE/jg==
X-Received: by 2002:a5d:64c6:0:b0:45d:77f4:1ac2 with SMTP id
 ffacd0b85a97d-4606da0508bmr6846776f8f.0.1781297478329; 
 Fri, 12 Jun 2026 13:51:18 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26434dsm9353447f8f.1.2026.06.12.13.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 13:51:18 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Fri, 12 Jun 2026 22:50:28 +0200
Message-ID: <20260612205029.269642-10-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612205029.269642-1-francois.perrad@gadz.org>
References: <20260612205029.269642-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781297480; x=1781902280; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fxxq9F+b4RgGt4+mWV3tQaHggGndS5nnqkax3YQ4uHI=;
 b=QWR1pekSvyQdbVc8qL5Qopu8Ssxs1owmFHNqRjWexznjSoZnm9pmLtAHmRl8Aamu4h
 YP287BGR3J+4SJodd0poTlwIVccCtQGGQ0iaSN6wrQmGMY50as3F/jA+kB2eLFTmvJza
 +YDzmVe3glEYhrEjmhq4D/MehQ+fjm01ftuNHVmW1jiuqbazfUhZRVap/KgMSqFjvA+P
 8ZRbBtIAIUaMCzwlLq+t++um0zEeKNz+SaW9Zv+feu18zhe4x8Kxp2DeNn/A/Pvp/RCY
 exeGDIVS2ca1wyrjtFYg58bc5nnYfnAtgqnx1+nq4VUGisyOFLARNF5VC/jdH6ez28cU
 zQPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=QWR1pekS
Subject: [Buildroot] [RFC PATCH 9/9] package/hare-hello: dummy package
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                |  1 +
 package/hare-hello/Config.in     |  6 ++++++
 package/hare-hello/hare-hello.mk | 24 ++++++++++++++++++++++++
 package/hare-hello/main.ha       |  5 +++++
 4 files changed, 36 insertions(+)
 create mode 100644 package/hare-hello/Config.in
 create mode 100644 package/hare-hello/hare-hello.mk
 create mode 100644 package/hare-hello/main.ha

diff --git a/package/Config.in b/package/Config.in
index aa8818ce7..7d1972b09 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2366,6 +2366,7 @@ menu "Miscellaneous"
 	source "package/gqrx/Config.in"
 	source "package/gr-osmosdr/Config.in"
 	source "package/gsettings-desktop-schemas/Config.in"
+	source "package/hare-hello/Config.in"
 	source "package/haveged/Config.in"
 	source "package/linux-syscall-support/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
diff --git a/package/hare-hello/Config.in b/package/hare-hello/Config.in
new file mode 100644
index 000000000..7551f280f
--- /dev/null
+++ b/package/hare-hello/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HARE_HELLO
+	bool "hare-hello"
+	depends on BR2_PACKAGE_HOST_HARE_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_HARE
+	help
+	  Just a "Hello, world" from a single Hare file.
diff --git a/package/hare-hello/hare-hello.mk b/package/hare-hello/hare-hello.mk
new file mode 100644
index 000000000..ad23f17ed
--- /dev/null
+++ b/package/hare-hello/hare-hello.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# hare-hello
+#
+################################################################################
+
+HARE_HELLO_VERSION = 1.0
+HARE_HELLO_SOURCE =
+HARE_HELLO_DEPENDENCIES = host-hare
+
+define HARE_HELLO_EXTRACT_CMDS
+	cp package/hare-hello/main.ha $(@D)/main.ha
+endef
+
+define HARE_HELLO_BUILD_CMDS
+	(cd $(@D); \
+		$(HARE_RUN_CMD) build $(HARE_ARCH_OPT) -o hello main.ha)
+endef
+
+define HARE_HELLO_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -T $(@D)/hello $(TARGET_DIR)/usr/bin/hello
+endef
+
+$(eval $(generic-package))
diff --git a/package/hare-hello/main.ha b/package/hare-hello/main.ha
new file mode 100644
index 000000000..943c97169
--- /dev/null
+++ b/package/hare-hello/main.ha
@@ -0,0 +1,5 @@
+use fmt;
+
+export fn main() void = {
+	fmt::println("Hello world!")!;
+};
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
