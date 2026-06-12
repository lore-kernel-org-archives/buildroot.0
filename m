Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980E9CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E4A26132B;
	Fri, 12 Jun 2026 20:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VMpvjBxrDbrM; Fri, 12 Jun 2026 20:51:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BF366132D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781297475;
	bh=Z7WBrZ6E6/jH9busqLMQTacQG1TPpIbD0XU+e6XBg0c=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JaSPEut1wRfZf4leGtUwiQrlj5+3xXbYErkVW7QJyqLglh+2yutxhHLt3Ms3IsJLZ
	 D4DCt94RgSLqZzlqh/HpeBvroLpRu/DgNrmATcYL4rc9Zaaxh6DDfDDkdSNCCe1WJm
	 ZdPPX5A3Us6ADdf+zRhHwBlMHXxoaS91D2sO32MaFmcYwvya18Pc4JJ/QXjdYwQBUc
	 gPveY1FZXO3lL6TjT7HI9Lz2UfAQx0GfS5wEPjmDZHh+AjMPvtlUD6n106LqPwZOb3
	 c8kQOf4wQ1ixiQNVoCrJqZ0/lttxuZ6eE3Bev9buNUC3aAH2xWAL32gAk+D7AiElTV
	 5tAzJ4G/13W6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BF366132D;
	Fri, 12 Jun 2026 20:51:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 30F9A237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87FE7816EE
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OL_gFsn_plw7 for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:51:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 68D888162E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68D888162E
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68D888162E
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 20:51:12 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4908b92904fso14835385e9.0
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 13:51:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781297470; x=1781902270;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sEm9SBKfZ8N4/t7lTtsWXrePOrgYZdwp1vtYIjqR0DY=;
 b=rtYhi6GUt8GnR7Azpdh+iyPuGvEu7qpK0rBEEmGKzZDFG4Haa0I3ZoGiXsatdbpCTG
 L4h4NMQxzBogZBtnGKZdXMbP7qJMYyz1Mzu1wlcg5YXFGe6L8qxEqf7ozvT3O9FIaod2
 Xo1z4NbKi+8ERh/JcO35n1TpTSl43sh2p89iWT/VwvQThJ0Fw/sJkFudfbmULc4QHMoc
 i0nMmHToXxzU42qkhTF5vcqL3iaBCejN/9lbu1u2oSeyskxtNDq7dbq2EMCjFeYgpL5w
 YKDA1I1GQEa5uSvj4kJtnuJ6jIx906fz056bNNaPmGtO5ubdfrZ67/XWtdiGO1p+7LmM
 Vi1w==
X-Gm-Message-State: AOJu0YyjxrFduK+PnUA+9iIwvf7ziTjYN3hKPSnrog0IkeGsdPYBbSuw
 IQ0fVaTFYmqOlC5Q/PAS/rXhMauRTwAlgJ1GbI7/OI9rGHMzIcDTcHkTn7v9vDyqMz0Bhcyf+T5
 uvlKSPA==
X-Gm-Gg: Acq92OHFjZDwp/VBpuVTVufvxwlmziPeKB3oSL5WO9Gmu4E2cZp+FvR6or8L6c0Zp15
 IKYQYrfOB80IBxYguZDof5prFY+ap++yWQV1Oe7zO/x54CcOw9YXQq9f4VK054jCVrJbDmb/uVG
 TIhYmE/U73TCgO/tqRYbH77k+x0i8cTN9Adv3LwWbQp+7qwXzhY3/JUx6yZOOndBkgp0uXIVlsZ
 VfICox10amM6RxB0SDa7IvJcfOvMLEiXi3ZXy7kLH+pZlfrzQqn5QtqLsuNSAL1TdTYprKbm0Y3
 CtcqlZKssjIohHqnLBY2MRTSqUZsycVa1LSwzyLNd83rimfYTdHtA6KbOf5/taXRG/dCLWdh6xK
 5W214ly2bTRirdAYUh3qNAuyII3H405L+0yUD6Ih2kPoUnL4jgWngS8P0Fm9hUfoBJtQrI4I5MX
 JQ7LXNKIHi2Kjj4XsNdx+SMOdE2ZJQLWkvEiVq923LnMiZ338lznrjlG6xHsKy
X-Received: by 2002:a05:600c:c3db:20b0:48f:d5a0:284e with SMTP id
 5b1f17b1804b1-490ec50e024mr43269315e9.28.1781297469535; 
 Fri, 12 Jun 2026 13:51:09 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26434dsm9353447f8f.1.2026.06.12.13.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 13:51:09 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Fri, 12 Jun 2026 22:50:20 +0200
Message-ID: <20260612205029.269642-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612205029.269642-1-francois.perrad@gadz.org>
References: <20260612205029.269642-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781297470; x=1781902270; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sEm9SBKfZ8N4/t7lTtsWXrePOrgYZdwp1vtYIjqR0DY=;
 b=Oakkk1rw6oiaM0OjPyhiIDN6dUsIzVNg0fRxbuasPeJNxEXfnJlLWA1AfSKrJv3aj8
 OMAZMgcHTB3aE884BRifg4io/fi607TgVWFy+cCQv52lEnysFliunIaq1Hd1FpKZPdqc
 CKmw8S/nZ8sE7BBnRiFZr36QrXhvNYinvZ1BkyGJIUyzHDUmR/LnLqbASvUCnN1KWQ88
 5lI1tYgr9XVnmWxs/AhSKrb0NLtMjJ8JVh4UyxGWNChWGxc0TGepcriJV1WkHSRCWTvM
 rVfO8JE/LSks/w6WXuAiBNKQnMlgsEKSAU3L7DHNlAGNIPHRFjgqHDQpMnfBnZyoQs0P
 ACuw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=Oakkk1rw
Subject: [Buildroot] [RFC PATCH 1/9] package/qbe: new host package
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

dependency for host-hare

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS           |  1 +
 package/qbe/qbe.hash |  5 +++++
 package/qbe/qbe.mk   | 22 ++++++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/qbe/qbe.hash
 create mode 100644 package/qbe/qbe.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9aaffa29a..317b960da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1177,6 +1177,7 @@ F:	package/coxpcall/
 F:	package/dado/
 F:	package/ficl/
 F:	package/janet/
+F:	package/qbe/
 F:	package/libtomcrypt/
 F:	package/libtommath/
 F:	package/linenoise/
diff --git a/package/qbe/qbe.hash b/package/qbe/qbe.hash
new file mode 100644
index 000000000..2250c493a
--- /dev/null
+++ b/package/qbe/qbe.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://c9x.me/compile/releases.html
+sha256  a6d50eb952525a234bf76ba151861f73b7a382ac952d985f2b9af1df5368225d  qbe-1.2.tar.xz
+
+# Locally computed
+sha256  2b026a9038be00b1102da922775ffea4857ea755f63694efc36dcbcbdebf23d6  LICENSE
diff --git a/package/qbe/qbe.mk b/package/qbe/qbe.mk
new file mode 100644
index 000000000..a6e3e4d57
--- /dev/null
+++ b/package/qbe/qbe.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# qbe
+#
+################################################################################
+
+QBE_VERSION = 1.2
+QBE_SITE = https://c9x.me/compile/release
+QBE_SOURCE = qbe-$(QBE_VERSION).tar.xz
+QBE_LICENSE = MIT
+QBE_LICENSE_FILES = LICENSE
+
+define HOST_QBE_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)
+endef
+
+define HOST_QBE_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=/usr DESTDIR="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
