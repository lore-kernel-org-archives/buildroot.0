Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869ABCD98C5
	for <buildroot@archiver.kernel.org>; Sun, 14 Jun 2026 15:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FCE660D53;
	Sun, 14 Jun 2026 15:53:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8QoC_EUG_9XJ; Sun, 14 Jun 2026 15:53:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 287A860BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781452427;
	bh=MRCz/YKfsDgXfe+JRvZroGAIT5WyQAiqUC7ZLc1vEck=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JMv755pzORbQYCsHs6tshkALow7tye2j2wjRqb6EZHMXSZXHGllu7EJZR6MvC9ys0
	 xpcNJJpMLljoHaATGpPdH38GhbiaqalGQM/iuxF4uMnwHnYw6RcERglUQoCwOraqio
	 /0A1oui+Gx+O5Nz1TnS7TDcq2v27ZhVMlzGIgKo+QkOdEA4WhWEEyfIkXQwquX4o3M
	 b0rBR97xLA78+Y+WnbnBBhfYb+5dUvF/zC9Vdb4g3YS1ikIVt+HOQ7uUrvAi2RwhBz
	 rNdDDeA57h+huKYeGKB1u9nqmUezntOeWAg1lAivbG3lgWe9+AIfa3xrkWD09YAGBn
	 5tayKsKb+ya7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 287A860BC0;
	Sun, 14 Jun 2026 15:53:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19BC12EF
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B2D441049
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOJLDU9qh0CB for <buildroot@buildroot.org>;
 Sun, 14 Jun 2026 15:53:44 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4413E41045
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4413E41045
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4413E41045
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 15:53:43 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5aa68d65d24so2349935e87.1
 for <buildroot@buildroot.org>; Sun, 14 Jun 2026 08:53:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781452421; x=1782057221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xF4a2qqg3ETmtLggIC+A2DvTtjwmZxb3KlOE8bsDJ1M=;
 b=h8w4jwfNcSw00rBy7akKKaHnVhkELqGi7FS3EI9+1FHrBF5Ur6zJrPxRpLqTC/CGIJ
 8ZsKKCUMvY0/oDtB6T/gtPZ4Lp8P02AOsPCgD0SzJBdk4Wh5L+K/W1HE3YN8a90l9oGn
 8XN1AahZ4i+EsLl25YBOcq61bJTZfMmKjtddNffhXtEFTTnG8vgE7IWygFDT2PDPxvM3
 gFimJEyjflVR8rsH6vzlYXxnPVDxQ/Pu5TYlV9Vp5vSact3KTmtxgiygplDsuu2a95ZL
 CT5FAH/3MfG5WR/F/7BlgCIxaWowLzPl8BK1yU+WfeMQ2txXimkmXhMFrYhLkwZib4tK
 qi8Q==
X-Gm-Message-State: AOJu0YwubpDOGzid8s2CTsmo1e87IvH8I2PzkfvnKvUoWlgcRb0lpaE6
 KHBDWcWtA462WeJH08xiRsRnr1M0AST4/xL++wpqpwd5ysskbueAPKOrJGqQjpNjHoA8YRuqRw7
 2VYExRhvRxw==
X-Gm-Gg: Acq92OFZnFmE7+u1GWjS/h73mCS8zTEeUjZo3BH/kba3HjCmTJkj6ttrzGxx5tAWJqg
 YTYksth8w6SE+u7eKs8B5NUFIIdbOOFlmAp54QIn4pcAXZ8s1QzL77hrChx/Y+F+uvCr63qn6aD
 4b7uI4620PcEXH9DUYqrdzqXJdkKQjncZ2FZBrk2EREHgNE//Ek5FK55SM0sOwVjUZjXk38fk2e
 sGsnf5E0luVpHcFJmbHg+HLIASg2tmIdF2Ma+i5LM8EnLFP7WWEFlr7VD+DWqRqPBSN4qa5OdPc
 AQXeumRKJzPsKIqUrHNXh0a8mpF/fPb9rIrU/LHDotZ9T+Mqp4XOn8ESe5wL7vw10nSPgy6IDEU
 qGADGfG/4QaSujIKJebEOlsEHSmp0qeHnQTXPJeP0MvzQgR+M9HmhSwim9EQC1KUdEQOhP5ButD
 zSOb4vuCE1FqGp/5zGe68PiULSFH1eNQ5mS5IqI2MAH1uaWcbhfeeWXQ==
X-Received: by 2002:ac2:4851:0:b0:5aa:6c66:e343 with SMTP id
 2adb3069b0e04-5ad2db6cb19mr2274524e87.38.1781452420668; 
 Sun, 14 Jun 2026 08:53:40 -0700 (PDT)
Received: from localhost (81-226-112-165-no2360.tbcn.telia.com.
 [81.226.112.165]) by smtp.gmail.com with UTF8SMTPSA id
 2adb3069b0e04-5ad2e1a7333sm2045094e87.52.2026.06.14.08.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 Jun 2026 08:53:40 -0700 (PDT)
From: John Ernberg <j@j-ernberg.se>
To: buildroot@buildroot.org
Cc: John Ernberg <john.ernberg@actia.se>,
	John Ernberg <j@j-ernberg.se>
Date: Sun, 14 Jun 2026 17:53:21 +0200
Message-ID: <20260614155328.304282-2-j@j-ernberg.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614155328.304282-1-j@j-ernberg.se>
References: <20260614155328.304282-1-j@j-ernberg.se>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1781452421; x=1782057221;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xF4a2qqg3ETmtLggIC+A2DvTtjwmZxb3KlOE8bsDJ1M=;
 b=Y9vNbsN1mn9FXIztdUxxJzJKlSC5gxm93daBnM0th5/zq8faXRcYuP7tNQfI2S9t3R
 wVFKqQ/I20uSEF/mSkGukLae03IbURi9mKxBGCteJvTP+PLVN3Dbx6ZxNgzsh7Kw/lBE
 XiHtLa7LBtHAgUYqt0M9mYsNOHkFR+B5dmhp8DH3RCgqfE9LQ3kIeWREtgHu8IMPLe1y
 DC+3XzqjXZAmCGOEdS8XGHwgWeFYJ7m4IMzeg2xZkwLNorKv6qdc/XA1qcDBoMb7N0BD
 e4+4q3rjOy5TtpLeBWUMliaxE2S6pqc/FVk2wE6RIkUUl9A1jVjDZQnlHnvsmRe4J0V+
 6cdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=j-ernberg.se
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=Y9vNbsN1
Subject: [Buildroot] [PATCH v2 1/8] package/foot: Prefer ncurses terminfo if
 ncurses is selected
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

foot's INSTALL.md says to use the ncurses provided terminfo. [1]

If the ncurses package is being installed, disable generating the bundled
terminfo in favor of the ncurses one.

Note that the ncurses terminfo is smaller, meaning that some edge case
features may no longer work properly after this.

Link: https://codeberg.org/dnkl/foot/src/branch/master/INSTALL.md#other [1]
Signed-off-by: John Ernberg <j@j-ernberg.se>

---

v2:
 - Add explicit note to the commit message based on the foot manual.

RFC: Because I am concerned it might break stuff in ways I don't know how
to test.
---
 package/foot/foot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/foot/foot.mk b/package/foot/foot.mk
index 3e37d41557..1275b08c4f 100644
--- a/package/foot/foot.mk
+++ b/package/foot/foot.mk
@@ -27,6 +27,10 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 FOOT_DEPENDENCIES += systemd
 endif
 
+ifeq ($(BR2_PACKAGE_NCURSES),y)
+FOOT_CONF_OPTS += -Dterminfo=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_LIBUTEMPTER),y)
 FOOT_DEPENDENCIES += libutempter
 FOOT_CONF_OPTS += -Dutmp-backend='libutempter'
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
