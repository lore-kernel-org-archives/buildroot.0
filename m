Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D301CD3427
	for <buildroot@archiver.kernel.org>; Sun, 10 May 2026 19:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D7046071B;
	Sun, 10 May 2026 19:38:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KYVjCgWAXcsD; Sun, 10 May 2026 19:38:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3BC0E6084C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778441928;
	bh=bsZFY1wMFJ6IpGh6YDYtNBKFgYxWftTJ2DdkOn9Zn/g=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MuWldMjFc8DpIAABNmqH4zMfK4mjuCHf3gPOBRV+y1R1cIpxr9xQ4Jxq9CHjxZ+u1
	 MsqLTXXyo40fJeuClY7TvvhHGEZusTsoAFlbYhW0vbIr+pnR4REl4b0qcku/s085j6
	 ftv0sHc71ctdZYkC1ng7Y+rC+61PZ2hWy7hRbW3oV61e8nD2iNV46F1Tmi48XrThUp
	 PLgvTQ6AbIY6tUqPMTi8T2V6a+H7EgfAfU1jJ8Dat3bCnbPkoEWk8q7bivJN0pkArh
	 Hib3hkQLSbCKa8xhTIrLdUH1G55hLHPP8dQYbqMVAaow5WYDPuaaDgxbKXy3zWaNt3
	 OcV6wnGS4lU/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3BC0E6084C;
	Sun, 10 May 2026 19:38:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BA5A173
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 809AB41C10
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zpPYY0Psc3LM for <buildroot@buildroot.org>;
 Sun, 10 May 2026 19:38:45 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9C5C241C13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C5C241C13
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9C5C241C13
 for <buildroot@buildroot.org>; Sun, 10 May 2026 19:38:44 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-38ea6a5a0b3so29346621fa.3
 for <buildroot@buildroot.org>; Sun, 10 May 2026 12:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778441922; x=1779046722;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=r0ZCESBV6WRhc4EBOKZsQ4ufdg2mpZwXi5UOPmRr7MQ=;
 b=mjNp6Pd1JzNLMe2viAQRS3s+wT1uePYFDnkZxIDexhAJY23NyGpozUpXeMz8jNgMvv
 eCG/03DfDWJhJaXgfT+5xlVWAhHrMW87fdydJOzEN9xAzWJbngUSY7dvLgaC1qVyloWu
 gF1tCF2MVwN/3mgRp/814e3YTheaR8/1jG0UQ6OfG7+TD9GMcqabjEtHFZoZKyKRrEBe
 +357wInpJfXZzJIG82tdLFUfQWoskpZSsl7VeDJJA7+liogqAPLSeR0wtU8g9JdxcwuM
 /dTCB4Fq88B9vk1npe/LIj3scDCJQZHc3vfPVObKiTu4s5f2uoqPgcIYok3+muAnhFQS
 LXdg==
X-Gm-Message-State: AOJu0Yy74En1/lf8uUKg6GZO/9skMG1BpV0kjYdX0xIfFK0SlUBemWgf
 dWLCU9pxDGz2PG1J1oO4ZEOnxb6lbUkvGgomNQlZcyUEuPdk67MQQBrWrBztABtGbMY8VagPw44
 4UtRR0zLCDQ==
X-Gm-Gg: Acq92OGJhy+16U7ZG0TVjnjuvsjr7QUwE6NQ3H1RI9TqgMOoD63FjGoVh0FNeK2gdK5
 P2KCHWUOVyVsSNlDIVTr9IgUvFhaSQ5KVmP67m93lY5Ap/gDnP7vxmlkOigBHpeR+2fj03dUTbq
 OkghPw25ZiWr83ymSj5LTLSOwb143oZbi5mM+iOeJTn9Y1v+N0UX3oIrtOnXreYzWSdKL+IHHln
 bHsjl/AJQD+hAIY+swK6BzCkIQ3JuMgQxYs0ZInHIh3NaZVa697Xz4N/OvD5xAZ/Q5tkcVw+j8A
 +JlqZtChxYTVYzaXkpXTaxCFkwSnCIYf+nd5Id00gZqwcD2K22KO7ASmtxDYBissJ8Wl2NSKXdh
 sPHPO8kDB2MZHAR/SRgNQhuOtQIYoPgPufo2LmQ3H6qFfXn7xxCrNp6XwFzwsyl7tBEj3nvka+F
 l9Mb59JSrZOlRoBZipFH/mlWcPCTu6j70A0SgCzD9RIHd/o513WVQ=
X-Received: by 2002:a05:651c:1111:b0:385:e793:fb11 with SMTP id
 38308e7fff4ca-393c41dd3fcmr65649281fa.20.1778441922349; 
 Sun, 10 May 2026 12:38:42 -0700 (PDT)
Received: from localhost (78-71-152-124-no2360.tbcn.telia.com. [78.71.152.124])
 by smtp.gmail.com with UTF8SMTPSA id
 38308e7fff4ca-393f5f18d5bsm20974531fa.7.2026.05.10.12.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 May 2026 12:38:40 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: john.ernberg@actia.se, John Ernberg <j@j-ernberg.se>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 May 2026 21:38:24 +0200
Message-ID: <20260510193826.2846038-7-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260510193826.2846038-1-j@j-ernberg.se>
References: <20260510193826.2846038-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1778441922; x=1779046722;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r0ZCESBV6WRhc4EBOKZsQ4ufdg2mpZwXi5UOPmRr7MQ=;
 b=bjAvgGHF77cLP+J6PUsb+UNFj0nY8ix0AsctdPhZsqLrsPV6+16edcurPI/MQBiCV3
 R8Kc/mlJEEvAROfk7FD0V/+rU6wlI5saIBhWPYHQ5baHCXCutRoiyXeq2SYEpYFiu33C
 fyirLQiIjwxTimb0KT3sUREeZtQmmYNBYh0t0mOzVzGPDVo00ggGeO+ONDJRajB8plZY
 aNMn8t2Hfl4D9qjzEZFnrkvLipl+AkOOMRKS2lX7qXGhkh5FIy+QLkF0E/wqI/Vi8/y8
 f9lNBTxjJYwOKHXjQ3GsovdK9s53MZRWxvd+LfarM/ZBNGkbWSZwnECMpKbm6kXOfBhf
 2sCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=bjAvgGHF
Subject: [Buildroot] [RESEND PATCH 6/8] package/pkg-generic: Purge files
 that should not be installed by INSTALL_CMDS
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

Packages such as mutt, bash and gdb are either generating their tar-balls
incorrectly, or break automake with custom directives, in such a way that
AM_UPDATE_INFO_DIR=no doesn't work to avoid updating the
/usr/share/info/dir file.

Add a post-install hook to both staging and target to delete files that are
needlessly generated and conflict with other packages post-install when
building with PPD enabled.

Since the currently listed file is documentation related, which ends up
deleted anyway, there is no TARGET_FINALIZE hook provided to generate the
file at a later point.

The post-install hook is added at the global level for easier extension and
also cover non-automake based packages that could be similarly broken.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: John Ernberg <j@j-ernberg.se>
---

RESEND:
 - Forgot to subscribe this e-mail to the list

 package/pkg-generic.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index dd440e4062..1675b1263d 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -343,6 +343,10 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
 			mv "$${la}.fixed" "$${la}"; \
 		fi || exit 1; \
 	done
+	@$(call MESSAGE,"Purging unwanted staging files")
+	@$(if $(BR2_PER_PACKAGE_DIRECTORIES), \
+		rm -f $(STAGING_DIR)/usr/share/info/dir \
+	)
 	@$(call step_end,install-staging)
 	$(Q)touch $@
 
@@ -373,6 +377,10 @@ $(BUILD_DIR)/%/.stamp_target_installed:
 	$(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
 		$(RM) -f $(addprefix $(TARGET_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS)) ; \
 	fi
+	@$(call MESSAGE,"Purging unwanted target files")
+	@$(if $(BR2_PER_PACKAGE_DIRECTORIES),\
+		rm -f $(TARGET_DIR)/usr/share/info/dir \
+	)
 	@$(call step_end,install-target)
 	$(Q)touch $@
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
