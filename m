Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39B3C61DD6
	for <buildroot@archiver.kernel.org>; Tue,  1 Sep 2026 07:01:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0999140683;
	Tue,  1 Sep 2026 07:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbZ1j-HgS4fm; Tue,  1 Sep 2026 07:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788246092;
	bh=dU7pyLwNCCSFFwxFe6kI1P0uMQxM3Hi0jWwx9ori1UE=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RzDGyYM5xK5pIBRRD8uNj8ci+4dw+pTUZFN3iYRRAV7WRdTv4sYrsjWucb764tL+k
	 lnNxwUJYAfVXF8oZaLU8pmy9zxq4WpzQnzWWvXU+tSlfO9AxoJ2rqBhCk5rw+4ON/S
	 MjTBQUhTZjBgUav/3WN8QWDWfh62OC03wOLf9giwhWzJzW/uKZxbCNjNJ4KthvGFb7
	 dfiKhhjrzexSzvb0DZnaaMqBmEpQwsm4ZPItr9Fx61FzCIakIahP4VgP26qZF8Qr/F
	 EDl3LLd2KZU4OnnvTd/6RiFyR2d4GI6w4btQCf6FduFuvrhCZhHUAK6/s58cAzSoEa
	 IZU/8W49RdF+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69A684064E;
	Tue,  1 Sep 2026 07:01:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A048127
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 227F880AFB
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbe-RX7Teaky for <buildroot@buildroot.org>;
 Tue,  1 Sep 2026 07:01:30 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=rhidian.dewit@openpixelsystems.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems.org header.i=@openpixelsystems.org
 header.a=rsa-sha256 header.s=google header.b=O+hqUheb
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8E45480ACC
 for <buildroot@buildroot.org>; Tue,  1 Sep 2026 07:01:26 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-484415c8cb1so611667f8f.2
 for <buildroot@buildroot.org>; Tue, 01 Sep 2026 00:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems.org; s=google; t=1788246084; x=1788850884;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OvgbWpxcp7PFFd0UukUIMj68njTEp9ZCeg6Qq9uyh7A=;
 b=O+hqUheb46p4n19QqBg1lNnIGgHyb2S2NgY7LgDGMzZcxemZovQSjLFliHidSZlVk2
 Ij2hPErdv6W+OeQJYa8G+VoXIL+LZXsnvJLncspCugDgsdh7ObBKRfMIDyz02RdHyTCP
 hk+EXVNDHH5g8kuTUOEtqZU5ffwPBWn9WRk9+ItSplRtY1D2/TaiSfqmJwv04GE3uH7g
 xLBO2KNo8salSB6AqzbbdNUQ4QQfPix1qdKyw6MFAVT2kXDlQnRuYbfhnxGHlC7XqAT2
 nEgLn2oK96EtKUWCzAeQ64ODecbWn0VaZgCDRHvwDWRwrw4ioHU+4yetrlmhVdc3nC8I
 uiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788246084; x=1788850884;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OvgbWpxcp7PFFd0UukUIMj68njTEp9ZCeg6Qq9uyh7A=;
 b=J4/A1Ah5FlW35Hvmp5xQ8LZSnbIxr6B6gTBJW5Mp8XJXpxWm+AwM5a5TgBux4aCr/F
 4VY262U0qnRWVD9ODqErmg13e+oZ45O85eg3pLy+lgGkTctkOeCtOLdk7tnG5hgm4yGz
 VdN3jbO6joqbfKdQm3F9yt5zDH2Tw0fFa3/ZNmcmXnFqkfSF2UIwokHGg8J2Sbj790Vz
 /UKTIEP6KaIJX38wvFjcXbwJ1MS/WZ0ZaUPY1QOuF3H3i/6n9DAK8hGOIA+1FmoHuooN
 Ku2FlpVbpbtGHDXg2bYtK7ifAnuBqEk9ocSMUwH/CAeFQ6cI6fl8S5mtZvcSH43CHHqm
 t8Kw==
X-Gm-Message-State: AFuF++lvlGjxKTUFWQ+Uj5AN1/pvmxG4rjnZXcc7lLSqxQHKBMaqC8kC
 rwJOS7KsZGj/gTb2EgA9/mPudlikPLcPWL8sMZcIsKKo37tkgpEJ7mkTFS6Cw7OTQzscKlmz/8k
 jP7zt
X-Gm-Gg: AYBFou2imaIzrcHmyRcxxC6MWu2ykp7ECJwdwCQ5d5CTQ1Fny3LR+eP6KH0hSlcSGKa
 aFfoCP1FUw+jD1PKb4GkV5LVTtoHwxBIH8UboYm0rqSWoSWkJF37a1+fvDdoz0LnOXxpxEE3ScB
 UT7neUH+euETJU3XknyutjdHM3qGvt6mu7WdrREjuQd8JvQa6IXsKTP83reDcpYhgPaic5mB1MG
 xFgFuy/gm8aShdYwNWR4tB3DFpkvLsPnPy9V5SzgZZEDBACHF9s3y/ezQhYd98WB7cI81S53Cu9
 YdPd/G8YOsJS1EgPYBi6obgxOoI5Q4RmRw3fMjKC9T6lu5lepJlv1PuK8oIXPBtuYfkKsQWeNDU
 6hKb2hTXKy0MKd11IuAGvSDCIP5Bcem0/l9dc8xM2gSruS4rvj4QJ7TXfb/lLnTGkd71c+cym0h
 KbZRzqWN6DWb/dn7Fpq6HRufSYAQ8szYsH12Oflk8LkqNiYKF/0k79pFvmWd/YhqgkwUw3KecTG
 0sNhU1bjhIvPHKVXOJzfdXaMin7T80AKGNEKJ5bwelKL1af8RbC7I8EgTiLOOkq
X-Received: by 2002:a5d:4985:0:b0:484:372b:9524 with SMTP id
 ffacd0b85a97d-48440ffe6a0mr8879352f8f.18.1788246084088; 
 Tue, 01 Sep 2026 00:01:24 -0700 (PDT)
Received: from titanium.opsys.org (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48442d78a0bsm2850052f8f.28.2026.09.01.00.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2026 00:01:23 -0700 (PDT)
From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
To: buildroot@buildroot.org
Cc: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
Date: Tue,  1 Sep 2026 09:00:57 +0200
Message-ID: <20260901070113.831292-2-rhidian.dewit@openpixelsystems.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260901070113.831292-1-rhidian.dewit@openpixelsystems.org>
References: <20260901070113.831292-1-rhidian.dewit@openpixelsystems.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Avoid double-free on x86-64 systems with no
 cmdline set
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

Upstream: https://github.com/rauc/rauc/pull/2028

Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
---
 ...i-slot-bootname-to-avoid-double-free.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch

diff --git a/package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch b/package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch
new file mode 100644
index 0000000000..a062844659
--- /dev/null
+++ b/package/rauc/0002-Duplicate-efi-slot-bootname-to-avoid-double-free.patch
@@ -0,0 +1,39 @@
+From 1b17578e90b2929e1a7ed1f3eec8d3b5f663b673 Mon Sep 17 00:00:00 2001
+From: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
+Date: Fri, 21 Aug 2026 16:37:45 +0200
+Subject: [PATCH] Duplicate efi slot bootname to avoid double free
+
+Signed-off-by: Rhidian De Wit <rhidian.dewit@openpixelsystems.org>
+---
+ src/bootloaders/efi.c | 2 +-
+ test/bootchooser.c    | 1 +
+ 2 files changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/bootloaders/efi.c b/src/bootloaders/efi.c
+index 19224118..8b0cf820 100644
+--- a/src/bootloaders/efi.c
++++ b/src/bootloaders/efi.c
+@@ -630,7 +630,7 @@ gchar *r_efi_get_current_bootname(RaucConfig *config, GError **error)
+ 	RaucSlot *slot = NULL;
+ 	while (g_hash_table_iter_next(&iter, NULL, (gpointer*) &slot)) {
+ 		if (g_strcmp0(slot->bootname, bootcurrent->name) == 0) {
+-			return slot->bootname;
++			return g_strdup(slot->bootname);
+ 		}
+ 	}
+ 
+diff --git a/test/bootchooser.c b/test/bootchooser.c
+index 43c45397..c35a78f1 100644
+--- a/test/bootchooser.c
++++ b/test/bootchooser.c
+@@ -970,6 +970,7 @@ bootname=system1\n";
+ 
+ 	bootname = r_boot_get_current_bootname(r_context()->config, "", &error);
+ 	g_assert_nonnull(bootname);
++	g_clear_pointer(&bootname, g_free);
+ }
+ 
+ /* If the underlying 'efibootmgr --bootorder ...' call fails (e.g. the
+-- 
+2.51.0
+
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
