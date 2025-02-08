Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2163C0219E
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 14:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A55A83976;
	Sat,  8 Feb 2025 14:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbMqIr514hMf; Sat,  8 Feb 2025 14:23:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB72680EAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB72680EAA;
	Sat,  8 Feb 2025 14:23:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 09DDECF
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E4EFB835ED
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmtvwEaDg4Ko for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 14:23:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 205A28322E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 205A28322E
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 205A28322E
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 14:23:36 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43625c4a50dso19766975e9.0
 for <buildroot@buildroot.org>; Sat, 08 Feb 2025 06:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739024615; x=1739629415;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M6nSza5xhyjdwuhVedWtkvV6mzUbAFltauOY2DnOO9c=;
 b=Osdbmqzx6Erc6vptZF965cloaGm6xg/C2CkmuoGQXashhnwoFiA5UxQWSdhHr1Xb0C
 ArHBAHMgwXQWVGNZisgUIlhvBMc/LsQ3RWS5AN0VYwTvQ0hWyMCMmBSrtm+6AOxrQC7n
 JzN8XCn6AHpXbpxRKE9K+eUC4fcJzFgR5hjEF52Gh4aqT86t6DZnZhKBzeMc78SVPHxQ
 RXZRMbIb08gV5Lq99uiVZygm0s3CJ4IRNunwv6AJUf86NwqqpbPoMYeCAXIgKcXks0mD
 EiMNDZbkOUOQQM7Mb4ivas2YHFhjMbSfBizjKMyrWZuQuzUtC60xKOCcc+kS5AXLXNDt
 Nyyg==
X-Gm-Message-State: AOJu0YwfR4ZJwV+kreKV6jUPyLZ+gAd4/JFTROdo9M69I03/dGJCebfB
 jPaeSfDEfkyrxSfzAXFmjYzW29mxoFYrL06BSJOGZtV0szdNBxvIWSrCjnp44uE+/qYNb7qHUPf
 n
X-Gm-Gg: ASbGncvHKvLrnZFpG72WTMe/qp4nK0a5E/YpPYtHITUhazt9w6FP162ncwNrvDKAetl
 uPgWosfXl/Idd6PTenlf//wzgpjhHE6A/IpB/pP5erSVrIn5MqJJOHHHtwfIPqyAxgJM8El9xMi
 wT22rMadK8nfCITqJBS+xG8+qonSsAwM2BfofhqUZqkNcNw84tlrQ3ri68BlrLGadqESTnmvAWL
 zG/WSdb0+IYvHIobegw4KJE7s14pG1zQhV9MymiAsYlQo1HQ0pyM+KDZulpV4Dad9lI6lLo5dp4
 GqkyF6FRqMAYQa0tCiTlOHAv6HvwpKgSKcrrXNGvk5xul94zN1qQLZ0Jh78NuHsXitUZGE/ZS1y
 y6/tVmMTKyo9X
X-Google-Smtp-Source: AGHT+IHXpQw5s6nRy5rWHCc1gekoqJEB+XrcY/46KwEiUJZNLE6lctlNf7DDZisNv2yPuoWeK6S96w==
X-Received: by 2002:a05:600c:4f50:b0:436:ed50:4f8a with SMTP id
 5b1f17b1804b1-439249841b4mr64020105e9.10.1739024615224; 
 Sat, 08 Feb 2025 06:23:35 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4390daf7dbcsm124290665e9.30.2025.02.08.06.23.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 06:23:35 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Sat,  8 Feb 2025 15:23:25 +0100
Message-ID: <20250208142327.418271-10-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250208142327.418271-1-romain.naour@smile.fr>
References: <20250208142327.418271-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1739024615; x=1739629415; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M6nSza5xhyjdwuhVedWtkvV6mzUbAFltauOY2DnOO9c=;
 b=qxkPF5vrnYTxa6gOqORXd5dmL46gyR2i2KDprkO9V3go1T2JacemT9zSz8EQ+KVc23
 v059K/zb2TOTBzgdPQXXbcE4cC0BtEcT4qosxyrWNwerB6yBXRVK1SrdEphwdzYDS09O
 jT318jOhATyxy7zB8meMAAN97w0lBpE83hMRM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=qxkPF5vr
Subject: [Buildroot] [PATCH 09/11] utils/config: fix shellcheck errors
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SC2086 is now reported for missing Double quote around
$FN since shellcheck 0.9.0.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 utils/config | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/config b/utils/config
index dfaaf46cd7..038986ca6c 100755
--- a/utils/config
+++ b/utils/config
@@ -172,10 +172,10 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--state|-s)
-		if grep -q "# ${BR2_PREFIX}$ARG is not set" $FN ; then
+		if grep -q "# ${BR2_PREFIX}$ARG is not set" "$FN" ; then
 			echo n
 		else
-			if V="$(grep "^${BR2_PREFIX}$ARG=" $FN)"; then
+			if V="$(grep "^${BR2_PREFIX}$ARG=" "$FN")"; then
 				V="${V/#${BR2_PREFIX}$ARG=/}"
 				V="${V/#\"/}"
 				V="${V/%\"/}"
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
