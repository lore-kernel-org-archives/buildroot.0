Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD7CCA1002
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1959413F9;
	Mon,  1 Sep 2025 09:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b-Q89a8ll0Iw; Mon,  1 Sep 2025 09:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A463414C7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A463414C7;
	Mon,  1 Sep 2025 09:01:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 671FD169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 592F540480;
 Mon,  1 Sep 2025 09:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Co9x-6osTnWE; Mon,  1 Sep 2025 09:01:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00F1C40498
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00F1C40498
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00F1C40498
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:32 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-45b8b7ac427so4540225e9.2
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717291; x=1757322091;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WdxNr8Hcv67hD58PTCGT2uYL9ocfAHRL5u9ilfweHGA=;
 b=XXK04AMi1T3zTLOz8rVO7IV1yQ77nmXAUNc1wtIGHKtXU0OLOdlgmuetvu67C6oN9Q
 orBAQNYGxLJbK8G8xEPCv3fEIRUkILZWKoslTks6Hiqxna91sUNYU3v7AMz9NChpPIAl
 OVePoEGAmB9gdJEdxeCLQI+9fFiQ1ho4zCk1Q5iKXIRIhy+xMKON8AbSogFh+wRaH9l5
 q7xfdkuid7UDhmEmns0I2uhPu7BG0sbwdhTvdUb4wbsnWXg+IjGSTzsDHFN7Rn2UAoN3
 7cjAD/Ew++6I9CbvrWJT7z+enLxqtEdkbRzDQWWqmsHW2/WB7GLJzJ+vL5jYXpTf9gxn
 +zgQ==
X-Gm-Message-State: AOJu0Yw0Tpk5bvwxVU18PMmi8cTuCr/1Nfjq89GoLps7Ae5G2lconAdF
 nf8ee7HDFW5X0i8RhzouqozvbLoK65VrtpJPJsVfvm44ebk0mkHHRmn7HGa3Ow==
X-Gm-Gg: ASbGncucT4itVK9yPj+I4/DIbWzXzQZqRgp2zO78i1T2DvcrfGgYidZf71paTScF8mh
 AgteGyclajofAlbYlVPjjqzYHS97krskocDW2HDClFxvpPJ2o3QkFif8lAVDdE8XlK4st4BalPs
 RylEN84sAvlRDmiPps5t0MIjk/nDgI3LYjGTLh4nmzhk2F2BrV9y99EkALD8fUy78C6UaTZ+QgP
 wsYrqrwdnybwiVqp7eIlQluVY8fpSK0omT35f0u6Mbtf6cfVr0fgGyHOy8hJJcUaI1xRkPq3kfl
 8I/jgUYGBU0Zi4MMPbp2H8fIZFN1LPbXuGc3U8rjmKTPeajZ0L0iJOpZDjJSjbEav54J4QQe53F
 P8uLXr9p3xeqbfcA/M7NK25+OiMqEBjd7
X-Google-Smtp-Source: AGHT+IFHGPLpkXOrVFr+WvBp6QtNt3zrOQtvlqJlce3hXEDXBLpmNtzqxA0sY2BBadhi6XtmS2WVQA==
X-Received: by 2002:a05:600c:3b25:b0:45b:8adf:cf12 with SMTP id
 5b1f17b1804b1-45b8adfd07cmr31751975e9.33.1756717290654; 
 Mon, 01 Sep 2025 02:01:30 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:30 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2025 11:01:14 +0200
Message-ID: <84edfea405b01399cd05b5298bf30b3b86eae074.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717291; x=1757322091; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WdxNr8Hcv67hD58PTCGT2uYL9ocfAHRL5u9ilfweHGA=;
 b=TL4f0rHbJahValuKV55d7Sv7xPwyzeymzaLqxvd6t1nHuzoiE0WDe7tOlFii8MOCCl
 Go82cXQZ5eKMik1z+PUVexlkBmncbeeahymzrkLNoZbg8TdQAFETJbyiyt/OMG8LYS1U
 dTPkfWbmxwzJS41MpdrOQM4bEeVa6TD3hjOsY2/xdZCe07yGaKReoHMFIhZyxpz5nR8r
 WfIA5yDupDnJoPNtPw34ga6qMqyZmvcr5EL6DCaomehxr0aiYPtLVtUxzBYJm0B+zZSC
 DU45nSSd6DBlFUoRBOMMDIDlP5s1rqScYAIyPPmmGDqJ6Gdu+APANaqLNkgCFuoc+Yhf
 hxvg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TL4f0rHb
Subject: [Buildroot] [PATCH 05/18 v3] support/scripts: prepare for a more
 complex check for merged directories
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
From: "Yann E. MORIN via buildroot" <buildroot@buildroot.org>
Reply-To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/check-merged-usr.sh | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/support/scripts/check-merged-usr.sh b/support/scripts/check-merged-usr.sh
index ed0c58e9b7..ac676185dd 100755
--- a/support/scripts/check-merged-usr.sh
+++ b/support/scripts/check-merged-usr.sh
@@ -26,7 +26,7 @@ root="${1}"
 # each of them.
 #
 
-test_merged() {
+is_valid_merged() {
 	local root="${1}"
 	local dir1="${2}"
 	local dir2="${3}"
@@ -35,9 +35,17 @@ test_merged() {
 	inode1="$(stat -c '%i' "${root}${dir1}/." 2>/dev/null)"
 	inode2="$(stat -c '%i' "${root}${dir2}/." 2>/dev/null)"
 
-	test -z "${inode1}" || \
-		test "${inode1}" = "${inode2}" || \
-			printf '%s\n' "${dir1}"
+	test -z "${inode1}" || test "${inode1}" = "${inode2}"
+}
+
+test_merged() {
+	local root="${1}"
+	local dir1="${2}"
+	local dir2="${3}"
+
+	if ! is_valid_merged "${root}" "${dir1}" "${dir2}"; then
+		printf '%s\n' "${dir1}"
+	fi
 }
 
 test_merged "${root}" "/lib" "/usr/lib"
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
