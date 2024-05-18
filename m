Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1281BC25B79
	for <buildroot@archiver.kernel.org>; Sat, 18 May 2024 20:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B68586078B;
	Sat, 18 May 2024 20:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MAyGdwQQRpzV; Sat, 18 May 2024 20:25:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAC096082C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DAC096082C;
	Sat, 18 May 2024 20:25:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC3141BF3F0
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 20:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9539B406FA
 for <buildroot@lists.busybox.net>; Sat, 18 May 2024 20:25:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id STyIhd0QPwwn for <buildroot@lists.busybox.net>;
 Sat, 18 May 2024 20:25:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5AF1140549
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AF1140549
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5AF1140549
 for <buildroot@buildroot.org>; Sat, 18 May 2024 20:25:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-351d79b56cdso920607f8f.1
 for <buildroot@buildroot.org>; Sat, 18 May 2024 13:25:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716063911; x=1716668711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XXhRUnGohWUbo6PCjwoXVftdOxvDCzfM9pXt2nnvTlU=;
 b=YZHNP77hHgJpZCx3K1hjPp0WoY88LWpibNmyCCj4NFQgL9lETH01vaq+Oz/Dy2YbwD
 gn7bvbBGAMDB4sKXb8FAThfSNLSEwZz+Sfrcg/8BKsFrN9vRp3AgOP+vpcLeDBNZ/j7j
 6j5QqBabeiFhhq/vm6MASNDor5oWbNetfe53Le8gpLCqwJuOhGXbMP1Pq1IhAOfAIj+n
 bvgIzSXrshe2uRplPdHKqRgT2zxsQVSb/xZsoze7WfjNeqwHLNsbvsMz+MJstzLoGcKB
 JQErtN60yllCHGTDWJuMrEfeasR41l3G3rFu9hqmtHmb0Y1R0rUtcxK2PFn0LfDxXhuX
 eNEA==
X-Gm-Message-State: AOJu0YxRcAsxO9cvOntPDQxNcs1Wxkq889f+Am0/daCKYoXbholUgXtl
 Tz9BHFtQPIHtZ47QwcwgpKWiOpu+go55yXoE3bFalsfL0pMJTBZihtb1BQ==
X-Google-Smtp-Source: AGHT+IHZeK+Qsw5GccMlE2/w9sRLp6Edg841iqnoQ234o3mWMO/rLorTTRK7FzQ5UTTKI7/lfm+1FQ==
X-Received: by 2002:a5d:6190:0:b0:34d:bab1:26eb with SMTP id
 ffacd0b85a97d-3504aa62e31mr17211070f8f.68.1716063910519; 
 Sat, 18 May 2024 13:25:10 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502b8a76e6sm24981434f8f.62.2024.05.18.13.25.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 May 2024 13:25:09 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 18 May 2024 22:25:08 +0200
Message-ID: <8c1d3b15de6ac98e7dc9ad94db5bf56011b1bc66.1716063903.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1716063903.git.yann.morin.1998@free.fr>
References: <cover.1716063903.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716063911; x=1716668711; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XXhRUnGohWUbo6PCjwoXVftdOxvDCzfM9pXt2nnvTlU=;
 b=mUijZIGqq0SnlYIcFFWme+wMVATJ7EvhEYxS4ywL7wklq6pmkmB5wzSEDj/T5mP/nJ
 txwCfgIPPl4YpI5OLYJweeR001nlr4QnPMArf6FnMK7XFnLgmcLEZVodOm/EPLK9gp/G
 6cmHcNqCo2YMG4rb9GDpK2V75sARxqlOm5pTK5GhNE8GZzR3UmkzX1hCPcYNhgAXdNYy
 G+EOJjScI7w9IzU/a/wWN7EQJJ5175++dXcWUs+h+kYTDXsvHy+UnubWFBsaFOthgylQ
 Havts7GFGuzv/CgMSGa7sLHudmucmESaSV9uy4ztP0prPuC2/x2MeuCmm6tmJte7iKQD
 +Njg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mUijZIGq
Subject: [Buildroot] [PATCH 2/2] utils/genrandconfig: do not check
 certificates with curl
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

genrandconfig is used in autobuilders, and some autobuilders are running
on old distributions that are lacking the most recent CAs, causing build
failures because package sources can't be retrieved.

Do for the curl backend what we already did a while back for the wget
backend, with commit 0866a280e40a (utils/genrandconfig: use
--no-check-certificate in wget by default); in curl, the equivalent
would be --insecure, and applies to the ftps transport.

The integrity of the downloads are validated against our bundled hashes
so there is no risk of corruption of the downloaded files. The only
issue would be that an MITM could inspect the transaction, the same way
as for the wget --no-check-certificate in 0866a280e40a, but this is not
considered a high-level issue (we're anyway talking FTPS here, that's a
legacy protocol that has other issues).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

---
Note: this is totally untested, because FTPS is not widespread and no
known package was available via FTPS. This patch can probably be dropped.
---
 utils/genrandconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index df6bede158..63fbf617f4 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -699,6 +699,7 @@ def gen_config(args):
 
     # Allow hosts with old certificates to download over https
     configlines.append("BR2_WGET=\"wget --passive-ftp -nd -t 3 --no-check-certificate\"\n")
+    configlines.append("BR2_CURL=\"curl --ftp-pasv --retry 3 --insecure\"\n")
 
     # Per-package folder
     if randint(0, 15) == 0:
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
