Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581FDC4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 21:01:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 170D460F46
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 21:01:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 170D460F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBCD540360;
	Sat, 14 Aug 2021 21:01:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P27PzwTNUbUC; Sat, 14 Aug 2021 21:01:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6588E40361;
	Sat, 14 Aug 2021 21:01:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D34701BF958
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 21:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF53540332
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 21:01:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QB0AyvKXPEmY for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 21:01:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26E7840312
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 21:01:03 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id z9so17962747wrh.10
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 14:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e9pwPj3L+oKSQ5KlOoEprSPAPGe6O0KUvtZxVBqJ1d8=;
 b=XbFPsz6ts8natHaCucl6aRJzcr6iHwBnVSbpSEUzcH1BfuczPA3Ht2q1QNJ/gbyIbj
 sZ9nj0taYCeE3YV8l2EVOUC2Hp5uEsyGEfmrc1UrYDaZMBT6C69dVc/wRl163MMpPm+D
 fyGYfOM2yaTK/mu/M/ensaNUrzHplUQrgHskeYKaNL0ehgCLRVspBRF+JnCjuT6WKAxb
 ai/+jp9jBkF/uQ37HYzBFipQ2AXa4idagSa9oykKrrV19w8yvwezz6fmyADAgz1U4cgV
 kQMFZ/G2c+ZkyHPVlas4B1N3AErvffazgoK2YQ6cACDZnNiGDzEGxhcEsH/Q31KiDf+2
 amoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e9pwPj3L+oKSQ5KlOoEprSPAPGe6O0KUvtZxVBqJ1d8=;
 b=QFYTj2Hlc/3WK9Rl4L5i9uAAls+b9l9rEowmalR4mMPQkj/+uXzoG5qpIsregx1xyy
 hsY3UmmrJjI0Hhz+SHdPbBHv2HtYQy9gzoyPnJsTnBpOaxZxl9f3MOL+rS96YtS1G3YQ
 5TreZ5W6ptd8o5eMkzDvvBxuioNo3JD8U0ot5EUaKMfrOT/RZsPMGfqTYEmdrZ1gT1C3
 oje0qm+ybRSXaEoq286wXWpFTflx4jt61NV/vh6hOmNu3DFIOjkrvUpqwhyUCFKeBGRt
 10jC1PZe24DxF6QJFk3Ubn0CXNsKhIlQCA2XoBlNVbCL2jaQncQqkdBQY159taNv2Fsz
 okMg==
X-Gm-Message-State: AOAM530VIQm/hNO9gmktyYNDt5xJJuGEGdj2351iSlZjilBhjIyPUWm0
 f38x/Q577iVlL5AjVMkFgegq169C/Eo7Cw==
X-Google-Smtp-Source: ABdhPJzbkJpOHMDfO60jPzGTNiNwUxCCt04/hvahYcFeECCqznk356Av/b2LqGR1ZgkLGy47yEO01w==
X-Received: by 2002:a05:6000:12d0:: with SMTP id
 l16mr10116747wrx.166.1628974861157; 
 Sat, 14 Aug 2021 14:01:01 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id t8sm6744975wrx.27.2021.08.14.14.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 14:01:00 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 23:00:42 +0200
Message-Id: <20210814210042.354849-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210814210042.354849-1-fontaine.fabrice@gmail.com>
References: <20210814210042.354849-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/sylpheed: fix CVE-2021-37746
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

textview_uri_security_check in textview.c in Claws Mail before 3.18.0,
and Sylpheed through 3.7.0, does not have sufficient link checks before
accepting a click.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-link-checker-before-accepting-click.patch | 37 +++++++++++++++++++
 package/sylpheed/sylpheed.mk                  |  3 ++
 2 files changed, 40 insertions(+)
 create mode 100644 package/sylpheed/0001-harden-link-checker-before-accepting-click.patch

diff --git a/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
new file mode 100644
index 0000000000..fe3375bc91
--- /dev/null
+++ b/package/sylpheed/0001-harden-link-checker-before-accepting-click.patch
@@ -0,0 +1,37 @@
+From ac286a71ed78429e16c612161251b9ea90ccd431 Mon Sep 17 00:00:00 2001
+From: Paul <paul@claws-mail.org>
+Date: Sun, 23 May 2021 12:16:40 +0100
+Subject: [PATCH] harden link checker before accepting click
+
+[Retrieved from:
+https://git.claws-mail.org/?p=claws.git;a=commit;h=ac286a71ed78429e16c612161251b9ea90ccd431]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/textview.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/textview.c b/src/textview.c
+index 62ad46eaf..3cdf5d911 100644
+--- a/src/textview.c
++++ b/src/textview.c
+@@ -2885,7 +2885,7 @@ gboolean textview_uri_security_check(TextView *textview, ClickableText *uri)
+ 	gboolean retval = TRUE;
+ 
+ 	if (is_uri_string(uri->uri) == FALSE)
+-		return TRUE;
++		return FALSE;
+ 
+ 	visible_str = textview_get_visible_uri(textview, uri);
+ 	if (visible_str == NULL)
+@@ -2922,6 +2922,8 @@ gboolean textview_uri_security_check(TextView *textview, ClickableText *uri)
+ 		if (aval == G_ALERTALTERNATE)
+ 			retval = TRUE;
+ 	}
++	if (strlen(uri->uri) > get_uri_len(uri->uri))
++		retval = FALSE;
+ 
+ 	g_free(visible_str);
+ 
+-- 
+2.25.1
+
diff --git a/package/sylpheed/sylpheed.mk b/package/sylpheed/sylpheed.mk
index 2f8a7aeff9..a7c7adade3 100644
--- a/package/sylpheed/sylpheed.mk
+++ b/package/sylpheed/sylpheed.mk
@@ -14,6 +14,9 @@ SYLPHEED_CPE_ID_VENDOR = sylpheed_project
 SYLPHEED_CONF_OPTS = --disable-gtkspell --disable-gpgme
 SYLPHEED_DEPENDENCIES = host-pkgconf libgtk2
 
+# 0001-harden-link-checker-before-accepting-click.patch
+SYLPHEED_IGNORE_CVES += CVE-2021-37746
+
 # Remove the -I$(includedir) from the Makefiles
 # because it refers to the host /usr/include.
 define SYLPHEED_PRECONFIGURE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
