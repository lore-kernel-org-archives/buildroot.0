Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A20D8CA0FFD
	for <buildroot@archiver.kernel.org>; Mon,  1 Sep 2025 09:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A003408C6;
	Mon,  1 Sep 2025 09:01:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W0h2gg2G_BgI; Mon,  1 Sep 2025 09:01:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AC4C409CA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7AC4C409CA;
	Mon,  1 Sep 2025 09:01:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C086D169
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BCABF60DF8;
 Mon,  1 Sep 2025 09:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWAgw6anOuHA; Mon,  1 Sep 2025 09:01:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CA1C660DC6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA1C660DC6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA1C660DC6
 for <buildroot@buildroot.org>; Mon,  1 Sep 2025 09:01:30 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45b7d485173so24579595e9.0
 for <buildroot@buildroot.org>; Mon, 01 Sep 2025 02:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717289; x=1757322089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9XQQFLzHzI8qGpdU/scdw61gbBzA9sXTSbWqZHg5CXI=;
 b=kSakmGVDkHgeUgfv6TovNfBoVZGU4cQcD76dPbgGUS+zbQ79bNRB0pwoRZww16FSnP
 nroavN5foDvps9PiV5yz6boRF7EnaJZgDkL5LzZ+J5JxL2ruCUN2dL3Ib7/kiZ+lRBIM
 9AGEa1QtmbrWRT5rxRV03UArqI6JDYCSS5rjd2Gblj0By/TESPHFlaPZJtlXzmd87XrS
 VzeJdFDEQ1mEn3qOL4QJoT85DNIzwvWVXtUNOZ/9mCSvbbM3RQDkXsfyUVDURs3gKRkq
 6hW9q+WV77PTIWAPVyAetIuwSZrAIr71dqgmGnBMXkGgY2hEyakPfeyTKPkoslK4Gnx4
 DlcQ==
X-Gm-Message-State: AOJu0YyFPwUOUceKGjQ8YP4Hvkf4kY+D6wwghyMWQ2+MHtZxB7s4Dqc2
 iRjGtrKZjYqTaMTRqsHdRwejwj9TA5f+5BM1KztVlS+Ns53WekbNnXQFRs2DPQ==
X-Gm-Gg: ASbGnct3yAnKiaR8zFqEiBtZ7hsC4xJDlteuLOb+M9IYXzs+kos6pIQYAoDRifsYZJY
 r7iPDQU4juRcuvJ1CnZWYXVZyI1YVr7NTmhnuhVofx+JuGgqa25LqC5Z35DuEYwfQs9GT1c3kSl
 dIt4ylKpri1J6METgaSS7cKNk+MS1LV8ustQfQNgH1jZMm5Wi6aw5exlH6gVSlCkkAKCsQfuWl4
 pD6Q/WdQADR72i9SGljUPx0sGu/B092iXsrR7Ohb6Iee5nYh9mgcMLdvN+D+JDD7k/qdHe/49fp
 29054Dcv7VuR5xLjPdyR1yLNsdfp9ne6vpUQ2QJd0RI/EdHcbsCpRp/d1TFe0H5i1b4R/lLIRYP
 9TaYZ2KcqHnMLWU0tr2uxEtmSRPjDXs8+y1zm1guLK3I=
X-Google-Smtp-Source: AGHT+IFY0BtwV1FjeQfYnkkG7BD3Lfc+e4beUekvvR+Y2wDVVrMc9zpDKL2XFHgjqmsi4bX+KdxeFg==
X-Received: by 2002:a05:600c:4e90:b0:45b:8d8d:589e with SMTP id
 5b1f17b1804b1-45b8fe2b805mr5486045e9.14.1756717288527; 
 Mon, 01 Sep 2025 02:01:28 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b8525a94bsm98171055e9.15.2025.09.01.02.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:01:28 -0700 (PDT)
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Arnout Vandecappelle <arnout@mind.be>
Date: Mon,  1 Sep 2025 11:01:10 +0200
Message-ID: <42f8dbdf2320e4451ac4dbc3115e2520853931a2.1756717276.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1756717276.git.yann.morin.1998@free.fr>
References: <cover.1756717276.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717289; x=1757322089; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9XQQFLzHzI8qGpdU/scdw61gbBzA9sXTSbWqZHg5CXI=;
 b=lEKMjcvir85Y1qUUxsBv0OA0X7vS83iE9BUQ1aDyZOHCNKgM5y5wQtljxdumEPXKrY
 jALzucgWVFJaViQvoPJm2tlfYmJSNSr1ktbDF3O2A8BeGlj4BAjj0Nq7u6EDtMR1FSgV
 NHPS0uDLDwxyvojjKUew/UtiMuD0oaj+9SbwpSR98P/ZMXL3MpUcBp4lmMZisXfwbc1c
 vQ5MJCkxXZzpTqZYCoy1mbeAAwEqa9htgtT+JKIYM8An8u5nqL4T+qhFQd3dDpMlpH5o
 Ng+x4TG+XUrnmMajexP+rotWtmXqS+bm2NSPnHzKskqL2fE7Cf7NWXO1Ixbq5zVOmeA0
 UQjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lEKMjcvi
Subject: [Buildroot] [PATCH 01/18 v3] system: reword merged-usr prompt
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

The current prompt is overly verbose, and departs from the usual
terminology used to refer to merged /usr, which, 10 years later [0],
makes it a little bit difficult to find or understand.

Furthermore, we're going to add another similar prompt for merged
/usr/sbin, and there's no way we want to introduce as similarly
convoluted prompt then.

Reword the prompt for the merged /usr option to the explicit "merged
/usr" everyone expects and understands.

[0] see commit c5bd8af65e50 (system: add options for /bin /sbin and
/lib to be symlinks into /usr)

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - typos
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index da9e20a35c..1bc8b61f11 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -337,7 +337,7 @@ config BR2_ROOTFS_DEVICE_TABLE_SUPPORTS_EXTENDED_ATTRIBUTES
 	  Support extended attributes handling in device tables
 
 config BR2_ROOTFS_MERGED_USR
-	bool "Use symlinks to /usr for /bin, /sbin and /lib"
+	bool "Merged /usr"
 	help
 	  If you say 'n' here, then /bin, /sbin and /lib and their
 	  counterparts in /usr will be separate directories. This
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
