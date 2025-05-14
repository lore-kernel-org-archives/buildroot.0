Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7666C3ABDD
	for <buildroot@archiver.kernel.org>; Wed, 14 May 2025 19:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D2624051B;
	Wed, 14 May 2025 19:05:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9MOYdJGZXeC; Wed, 14 May 2025 19:05:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E61640B87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E61640B87;
	Wed, 14 May 2025 19:05:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D484153
 for <buildroot@buildroot.org>; Wed, 14 May 2025 19:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E920607D3
 for <buildroot@buildroot.org>; Wed, 14 May 2025 19:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cc_EDXVC-_-Y for <buildroot@buildroot.org>;
 Wed, 14 May 2025 19:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 35F0260739
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35F0260739
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [IPv6:2607:f8b0:4864:20::832])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 35F0260739
 for <buildroot@buildroot.org>; Wed, 14 May 2025 19:05:49 +0000 (UTC)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-48d71b77cc0so2352951cf.1
 for <buildroot@buildroot.org>; Wed, 14 May 2025 12:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747249548; x=1747854348;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kUtwvRn4ZBYgGIq5tBQicfA82BEW1QD9Moo/NN15GnI=;
 b=NEsAdszlpdFLgRms7ixB0n7BIabEg09DrnEEgVa26W4PafBhx30K9ni2frECsCgwgQ
 b5BBhekednRGZhICPLwSeZhVkiO06mjTYriFoXpFSIji5PRUAqKsGM6u7THGzwLZcSf4
 SL2RLJeQClfhoSzG58MeqEj8l5KabSBQsWYlAP39/0FpIUrtYsZ/DxPWEn12nwsBVQ7T
 jvRQURxw+gExhLHQUJxh9SEqdw8ZxXpoXBQgYasOFfe2luFvnDGg+crctQoESuWbRQ9n
 oqCLbYLOYPpi0PwSAOHQoK36lUPqdpQFuV+1JHs2nYrsAzulIvVLstqwK9uCpsV4wEEP
 Erjg==
X-Gm-Message-State: AOJu0YzUVodboTFdymvI+shGXYRdKMowhg5cZQfqs4CVkYYVxI9fwdky
 HYW+V5YKGii5z6Nbu0WLZMIQ1qaVDXbr9b9eZwNXcOI1hs8T5Ke1TxiwmY+1
X-Gm-Gg: ASbGncvF5t5g1EmtrRbedEeiTAgV08LTMfRLIKr+PstGnVAqhI/5eCBxNG9EunxtEZe
 6FaK5OPjUlGRQKUM33N9kos9I9ocDzXgi1GZPk/l4urgGn4Gw1BTWxAk/c8pZmKSlHBdy/q7qZN
 YW41jvkjF37QdmKZ+AcYNPVge/ii9e74GIlo6JpHfPWgc4ZufjyHPcv2A6WB30d7C0bq8KD9mBX
 Feu+5tJXO/dCnNfKPoEA3NTzC7LtZ5RvxD+zHiVvDxsTmUE1QgG5UoydEQ+TzXG0+Dc+H2D4ey9
 vFh3bnNQ69sT7ZySeH6tCH0H0sLvuDmLOFMugV40BBsxiVaJ38URPX/4QM6CKDmJu2qIx4xkWiF
 XmBVr4bmeywyAbq/fuLTvhvgpMvVFDg==
X-Google-Smtp-Source: AGHT+IGLQHgCNH/pdA7iGt4ahN30lFB84TE0KHOrlru4nwGl0IgXmVYCpyEJe958RUvHB/VoAQmq0w==
X-Received: by 2002:a05:6e02:3e91:b0:3d8:18d4:7bce with SMTP id
 e9e14a558f8ab-3db6f795694mr57038235ab.2.1747249537605; 
 Wed, 14 May 2025 12:05:37 -0700 (PDT)
Received: from james-x399.localdomain (71-218-120-130.hlrn.qwest.net.
 [71.218.120.130]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3da7e10477csm36206095ab.27.2025.05.14.12.05.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 12:05:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Brandon Maier <brandon.maier@collins.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 May 2025 13:05:29 -0600
Message-Id: <20250514190529.680618-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747249548; x=1747854348; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kUtwvRn4ZBYgGIq5tBQicfA82BEW1QD9Moo/NN15GnI=;
 b=eCcqrTHS8r9vBmVw/MSY9zjH3T8M/699UezhkhN4rOw7t75INxvRYMNczitLst2AsH
 yCAmgdmM9/yLW6mrLRrrSkBdyF7aOmEspMg4rxBr4tjCBuDXYZE/ZqHzwHGG++QFG9Rr
 g5B2xrJAB24n+9csy3OQeHxlBcq0GjvEGvZRqCUyf+URXrA94WilVaAmA45nWaN7iMfp
 PSMRYx61jVQqXFL4KqTEa/MiFwBcvM+cJo94rvYRyQMpX/Jq7DcYFJzipDQEw+pWxH4j
 SUxNnKZ737cepa6eFDVfP5rXm60v3A6a0cO/Htp6/XU9HkonPKB3IOE3vJev//4T2KLb
 e81g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=eCcqrTHS
Subject: [Buildroot] [PATCH 1/1] package/unifdef: fix build with gcc 15
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

Add a patch fixing compilation on hosts with gcc 15.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...0002-Don-t-use-C23-constexpr-keyword.patch | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch

diff --git a/package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch b/package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch
new file mode 100644
index 0000000000..5b5c9690da
--- /dev/null
+++ b/package/unifdef/0002-Don-t-use-C23-constexpr-keyword.patch
@@ -0,0 +1,60 @@
+From d616741e6b0d5b57b66447e85ad32b283b28adde Mon Sep 17 00:00:00 2001
+From: Sam James <sam@gentoo.org>
+Date: Sun, 17 Nov 2024 01:26:27 +0000
+Subject: [PATCH] Don't use C23 constexpr keyword
+
+This fixes building with upcoming GCC 15 which defaults to -std=gnu23.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/fanf2/unifdef/pull/19
+---
+ unifdef.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/unifdef.c b/unifdef.c
+index dc145a2..4bd3bda 100644
+--- a/unifdef.c
++++ b/unifdef.c
+@@ -202,7 +202,7 @@ static int              depth;			/* current #if nesting */
+ static int              delcount;		/* count of deleted lines */
+ static unsigned         blankcount;		/* count of blank lines */
+ static unsigned         blankmax;		/* maximum recent blankcount */
+-static bool             constexpr;		/* constant #if expression */
++static bool             is_constexpr;		/* constant #if expression */
+ static bool             zerosyms;		/* to format symdepth output */
+ static bool             firstsym;		/* ditto */
+ 
+@@ -1086,7 +1086,7 @@ eval_unary(const struct ops *ops, long *valp, const char **cpp)
+ 			*valp = (value[sym] != NULL);
+ 			lt = *valp ? LT_TRUE : LT_FALSE;
+ 		}
+-		constexpr = false;
++		is_constexpr = false;
+ 	} else if (!endsym(*cp)) {
+ 		debug("eval%d symbol", prec(ops));
+ 		sym = findsym(&cp);
+@@ -1103,7 +1103,7 @@ eval_unary(const struct ops *ops, long *valp, const char **cpp)
+ 			lt = *valp ? LT_TRUE : LT_FALSE;
+ 			cp = skipargs(cp);
+ 		}
+-		constexpr = false;
++		is_constexpr = false;
+ 	} else {
+ 		debug("eval%d bad expr", prec(ops));
+ 		return (LT_ERROR);
+@@ -1170,10 +1170,10 @@ ifeval(const char **cpp)
+ 	long val = 0;
+ 
+ 	debug("eval %s", *cpp);
+-	constexpr = killconsts ? false : true;
++	is_constexpr = killconsts ? false : true;
+ 	ret = eval_table(eval_ops, &val, cpp);
+ 	debug("eval = %d", val);
+-	return (constexpr ? LT_IF : ret == LT_ERROR ? LT_IF : ret);
++	return (is_constexpr ? LT_IF : ret == LT_ERROR ? LT_IF : ret);
+ }
+ 
+ /*
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
