Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5B3CCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2734441206;
	Thu, 30 Oct 2025 08:24:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1-ctrCNkGe3T; Thu, 30 Oct 2025 08:24:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45EC14120F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45EC14120F;
	Thu, 30 Oct 2025 08:24:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CBCE2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3343240793
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBW_SGUar7P1 for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:24:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1C25440748
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C25440748
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1C25440748
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:24:17 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-429b72691b4so468715f8f.3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812655; x=1762417455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oOX3ae+0k5M0N9Fb9aYUDr3GMkkBmPWn0ZlkheGq7uU=;
 b=bCDILPh5kqnLNAP4DUuTnANQpVmo2Qcnbwusjj0PwU5rNlZWSXfPy8nG/F4d3PlNRF
 1iO9iNJ8YaHk8Sq2pO84l22VfcOTPX5LtCgmACnzRiH1qLL37RQTe3Jf3X/jvi2uoA1V
 23iA144s+K1HC/qmOIadejl2bYiaU9H9ZSxS66UfEd9n4+EEtydJzMH6wVBMUze5qWL7
 wIJTJDyWrnRaaNpirgpXkafTr+icAIdNtaRgk68Ib4E430vzhOTN75VQbc9rNGWLb2mY
 jRx+Jkiw+pPLfnDUyjdhuLuOsB2h5AX+LKErNKrwGs792IwguCcxW01wJVmQLh84gmrv
 t5lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiarcL1SBhIq2svd2udqwRBSbbxwuCU64l/Tvb9TxsJbcbfFqAr1e+6DdjpqRiB/20PzN4gGegleA=@buildroot.org
X-Gm-Message-State: AOJu0Yybk7LUJo6bkjkXneeBZC36gcEmx3KHwuQkuRbO+MENeYGlN6Gv
 KIsbAKAox2+yzjtXQdk31dGRZDnL+W1rvEvEIPPJ8sFzT7WBpHcggNqaSIKVdI6W0Fk=
X-Gm-Gg: ASbGncv0nkGktyqYZ8Ck/kWfccCABociAFdYjEv8TOBxgwGjf1ti44mS0lhgB404ltD
 +xgjU8DVusS8+5Hb2OVfSCSXVDyREbp++Puz3FqABR2dj8MgbXr8N1vF8LRrQ1E+IRsLxVk2wb8
 4UQ+eJsM9g3YJU7J5KZX/F8EBvnw68gL+NsgR0ea3CE3cU8I6EoyuDoiSCwckiVWxjNP/A8o+ZI
 zXEdMH0g13FBE8M1VInbOzB3dyuO85sWfvxHNrZn6GB5sQwIrHdygKkXwJgmnzxwa5xoRpIEdr9
 MJmIqFhZDi3FuzDj97WskoYq+BwwdR8GBfe9maJxxTKueuYT9mcEDdnRdmQRUa7DhVB3mpMAmj7
 lwMVK4n5CtVebTqywW/yeN1oucrZg1dCZbZaIf3hZ5SnYkC2Eo4uHLccMeaak/bFjGWI6QQaHUV
 9/r1w0P1/RtPJ4P86he11pFZ2bDjxgRiQX67PX
X-Google-Smtp-Source: AGHT+IH+wwKtJvpHN6wdi9EWG6bpzaclv0Z6maITp9dZ5p/6grlfKItow5RlF8sism7P0Yect7o9Xw==
X-Received: by 2002:a05:6000:420e:b0:3eb:c276:a347 with SMTP id
 ffacd0b85a97d-429b4bfb2e8mr1563147f8f.0.1761812654955; 
 Thu, 30 Oct 2025 01:24:14 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df5c9sm30914349f8f.41.2025.10.30.01.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:24:14 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:24:14 +0100
Message-ID: <20251030082414.35841-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251027093145.420945-1-titouan.christophe@mind.be>
References: <20251027093145.420945-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812655; x=1762417455; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oOX3ae+0k5M0N9Fb9aYUDr3GMkkBmPWn0ZlkheGq7uU=;
 b=CiGI09ir3TntTtaMj90ylSrTZ4OZmZReIQF3KpBeRvSyX0PoMKnp/d5Ubvzoe6m29T
 DRYIQ9TWQbWA/FTDrKm7CmAtI00Ulqf4qYAvtQ3vJUm9IznQn2ASij/5O8oEM1aLotv8
 Kp2y0phAnuBAC65+yzdxA78GPa4XzA0xJOpc6N2q0mtciudNckJiN2NE5f8YBiKqrntU
 x8VxbN21FyakZTgD5i8CjBklMPCrCUEl0hh19AliFI3uX6rLw1wqDXt/wGzQkrVT9bqo
 2eXg0Ok814vG22MQdkGxAs79Ig3P0UXoK8ak+2E7Bolt6WAYngEDRTjDqhkPlUw8GJJV
 GAMg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CiGI09ir
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/libglib2: add patch
 for CVE-2025-7039
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Backport upstream patch, that was released in GLib 2.84.4 [1],
> such that we can apply it onto GLib 2.82 in Buildroot LTS
> 
> This fixes the following vulnerability:
> - CVE-2025-7039:
>     A flaw was found in glib. An integer overflow during temporary file
>     creation leads to an out-of-bounds memory access, allowing an attacker
>     to potentially perform path traversal or access private temporary file
>     content by creating symbolic links. This vulnerability allows a local
>     attacker to manipulate file paths and access unauthorized data. The
>     core issue stems from insufficient validation of file path lengths
>     during temporary file operations.
>     https://www.cve.org/CVERecord?id=CVE-2025-7039
> 
> [1] https://gitlab.gnome.org/GNOME/glib/-/releases/2.84.4
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...x-computation-of-temporary-file-name.patch | 46 +++++++++++++++++++
>  package/libglib2/libglib2.mk                  |  3 ++
>  2 files changed, 49 insertions(+)
>  create mode 100644 package/libglib2/0002-gfileutils-fix-computation-of-temporary-file-name.patch
> 
> diff --git a/package/libglib2/0002-gfileutils-fix-computation-of-temporary-file-name.patch b/package/libglib2/0002-gfileutils-fix-computation-of-temporary-file-name.patch
> new file mode 100644
> index 0000000000..a297361ceb
> --- /dev/null
> +++ b/package/libglib2/0002-gfileutils-fix-computation-of-temporary-file-name.patch
> @@ -0,0 +1,46 @@
> +From 61e963284889ddb4544e6f1d5261c16120f6fcc3 Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@redhat.com>
> +Date: Tue, 1 Jul 2025 10:58:07 -0500
> +Subject: [PATCH] gfileutils: fix computation of temporary file name
> +
> +We need to ensure that the value we use to index into the letters array
> +is always positive.
> +
> +Fixes #3716
> +
> +CVE: CVE-2025-7039
> +Upstream: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4674
> +Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> +---
> + glib/gfileutils.c | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/glib/gfileutils.c b/glib/gfileutils.c
> +index c7d3339d1c..286b1b154f 100644
> +--- a/glib/gfileutils.c
> ++++ b/glib/gfileutils.c
> +@@ -1538,9 +1538,9 @@ get_tmp_file (gchar            *tmpl,
> +   static const char letters[] =
> +     "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
> +   static const int NLETTERS = sizeof (letters) - 1;
> +-  gint64 value;
> +-  gint64 now_us;
> +-  static int counter = 0;
> ++  guint64 value;
> ++  guint64 now_us;
> ++  static guint counter = 0;
> + 
> +   g_return_val_if_fail (tmpl != NULL, -1);
> + 
> +@@ -1559,7 +1559,7 @@ get_tmp_file (gchar            *tmpl,
> + 
> +   for (count = 0; count < 100; value += 7777, ++count)
> +     {
> +-      gint64 v = value;
> ++      guint64 v = value;
> + 
> +       /* Fill in the random bits.  */
> +       XXXXXX[0] = letters[v % NLETTERS];
> +-- 
> +GitLab
> +
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index b8c853b752..e0ef652593 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -25,6 +25,9 @@ endif
>  # 0001-gstring-Fix-overflow-check-when-expanding-the-string.patch
>  LIBGLIB2_IGNORE_CVES += CVE-2025-6052
>  
> +# 0002-gfileutils-fix-computation-of-temporary-file-name.patch
> +LIBGLIB2_IGNORE_CVES += CVE-2025-7039
> +
>  HOST_LIBGLIB2_CONF_OPTS = \
>  	-Ddtrace=false \
>  	-Dglib_debug=disabled \
> -- 
> 2.51.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
