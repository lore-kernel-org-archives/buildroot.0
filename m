Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE667CEE325
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 15:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A228401A1;
	Wed,  9 Oct 2024 15:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8sDVsWytSIWp; Wed,  9 Oct 2024 15:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30A8D40765
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30A8D40765;
	Wed,  9 Oct 2024 15:47:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 02D501BF396
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E591240779
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 15:47:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gla_3PYngluR for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 15:47:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 16765401A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16765401A1
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 16765401A1
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 15:47:06 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-83541f580b6so32676839f.0
 for <buildroot@buildroot.org>; Wed, 09 Oct 2024 08:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728488826; x=1729093626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5D+a9bAj86ITF/DX1rznwXYa9BSlmu9g9rFXZPHZVAo=;
 b=w/czaGXARF2ADb6UvSrsTUZS27ALQak+2MVHgM0SBs5v8r1mKtU7gfh5rSuLVWDenh
 02jDqZ4aPXNsGFOo80KrAcCyybJn6YzuyeM+gi4ZU3OFSsKwhBO7xMIBAu7D4Bkq/BWV
 1sMZBDwyXJqV6bLOQJYde4Kx6gV92aRQmMoYEg5F99axsLjubGqRRQj8jeanVHsWox91
 bKKTtD3Pi8oHzUSZGVO2N9rMyk7Fq8CeHBeyB4/H9d7IEoM3gdZUVCgvJN1K+CEAq49d
 XAtiEZBzqd9EJHk2ArpFfs0ADvYkOYsQAdfhYZ/Yh1ByidPtLK7PQLPkRth9L0zsUtBJ
 wL0w==
X-Gm-Message-State: AOJu0YwOxxPB6iFp/pjvR8XjlLUrMQH66EgIZgpl50GWPEAcbhACvYDZ
 Ru+9Dd9FZyUzqdk7c+a90tp/pBT4u35OhqArqyrPX86Hp6538binmURE/Yxe
X-Google-Smtp-Source: AGHT+IGOOY3osnKhXB1NR0UvF5mv5DS7aV4/ldyzqJZrNuvL/i04A9SIOK4deu+WdwL1rU7FjhVixg==
X-Received: by 2002:a05:6602:2b8a:b0:82d:18d:bab with SMTP id
 ca18e2360f4ac-8353d516912mr314624039f.15.1728488825723; 
 Wed, 09 Oct 2024 08:47:05 -0700 (PDT)
Received: from james-x399.localdomain (71-33-149-81.hlrn.qwest.net.
 [71.33.149.81]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4db6eb556c4sm2076277173.39.2024.10.09.08.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 08:47:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Oct 2024 09:46:58 -0600
Message-Id: <20241009154658.3777691-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728488826; x=1729093626; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5D+a9bAj86ITF/DX1rznwXYa9BSlmu9g9rFXZPHZVAo=;
 b=bDLeiOE52uWhLL/W5iT0KGz38SgUrkk9bX5U8Bm1TP87Mjcl56ueoBW5U/ZhSJ1HAJ
 U5Uat7EubydH1oabJ+QNQIkSTOueZT3UN/Wd/oBtAEvLLJtfrx0ojkrKhkCqK6Tp2uN0
 LpoSz0YO8ZDfO7k7wwp+e6LAa518fG1wuvW6OJmhQBJxZ+LW559CNg+iMbC9/F9VaLrk
 pwflpP+9j76TkpGdYyWFlwtrFGXLf1niLYWl+dq8xVxjgWjJ9k66IIw9sYaacevTowaW
 /d0ZjunMC8OwekIZDvKT5Yl9E7PtOMtp/txNfNumqWt97kYzPjGCB5UdMT8+qj/ps/Yf
 RklQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bDLeiOE5
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: add missing setuptools
 fallback
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some projects use pyproject.toml without setting a build backend, per
pep517 we should simply fallback to using setuptools when no build
backend is specified.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/scanpypi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/utils/scanpypi b/utils/scanpypi
index b6a2a92219..f47150ceb6 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -424,6 +424,9 @@ class BuildrootPackage():
                         self.setup_metadata['method'] = 'pep517'
                     else:
                         self.setup_metadata['method'] = 'unknown'
+            else:
+                self.build_backend = 'setuptools.build_meta'
+                self.setup_metadata = {'method': 'setuptools'}
         except FileNotFoundError:
             self.build_backend = 'setuptools.build_meta'
             self.setup_metadata = {'method': 'setuptools'}
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
