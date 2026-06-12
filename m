Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7CFCD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99980613C8;
	Fri, 12 Jun 2026 11:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZ1BH9rPtLjI; Fri, 12 Jun 2026 11:38:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ADA46138F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264309;
	bh=/0iZewiplS0BjaZrmfovOm20Kbf72ifQCYUs3JyEvdU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BY0fK31JgyZuvP2uVjJ/FuXishuTTmiNPc3Y4IMsl9PlPufBSU2xq6J2oN1BLvVjX
	 Fk5NVbmIljPoBV9NAwSUIfQgVd/Y1Wc5ICZNOPATHB/4aJEZNgrn2A0Tizm6pgR7Bj
	 FjsgqdIjZ4PmhH6ft3mljzpIfotCabno5otFra8lZ25bt0G99h11eWxeB/Ch/ycuOu
	 LNq/ODdvlB1l/jsuQJ8FwfgcYMauyeJcjinCiTXl9CW38PxnaS9kD2czu5UOGK6iPv
	 gn7FeiDl6xgoSeXJCV01E2dB5NVITaSpzkk/hmKAxHsoklvSjZH2ywHNuawa9d9kOv
	 j5v9n5DjboKkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ADA46138F;
	Fri, 12 Jun 2026 11:38:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1ECEA12F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 028A5832EA
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiKIVl8hW2JO for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C864F820F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C864F820F1
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C864F820F1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:14 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-490cf322ed0so5917435e9.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264293; x=1781869093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XCQ82l4Kxq8uoNrB3OjuAxlveq1OR+XKK7c0bfaKAS4=;
 b=IGdCRNgmR8v/gsIfjoMYrET5+kQGeBLUZAuPp5t8P3QETixb49jtypUE+/TEEmYgYu
 xSAe2Ltbm/ApJm1lM9Zq0jyfoGmOLqHsMDcPTSzP+yz9GcqOKzit+jJWbz72DhflB+Mf
 gV+f3n41A/GBv3sOEjCnzX98CjVEXqnVHTpI3R478XlxcTp6UrGXK65Ya+foDWrAApcB
 yvucF6Bbnru32YlYL0yp9eo9LPw8bmwsDcpYqSQxh4manaQfblSIiKLG3dymM4hyf09V
 bnDW0OnRdvTiRwHmrYCN4J4pGVroNkexrRtJFV+tLxp5DBLiQ3NrgeTct9xFKhNT9K7A
 knuQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/6ASBplUiiX/nzyOiKUpV3Gnt6Gj94T/DiJZGy3UBt4gMC/04ijaEQIXNRG8tCCu+/6nYdwM0lqWw=@buildroot.org
X-Gm-Message-State: AOJu0YxfKaFHSu14rqne2TOUG4/+pwZzwrssT4CB9jg0M2MRFzywmxNm
 0ABkpvNRh3fvPuUpcAQ2Ax9wZRQzQGBEpr5pUR+2TPQvyJEeanzf4QaQ5LEt9WXOt0A=
X-Gm-Gg: Acq92OGY7nt18W6TikEs7bL9uLccEQ+r1L8+aTbONmGT1u+Mz9cNZ5WkGnrgg3nVq63
 g3KFDkWTxuG8HN3HOXZVmhzwgxasWpP8Z3nqTWfLT5qgIiRxNP1Od9XIkkmOcYdzd35aFj+Ov08
 wDDz9bayTePOUX/Gwb86ENa7Rk7G3saDyZJz3SdPid1Tulqg+aGx91U1UbGzhiIrPiWo0l/VuvA
 xNIcWPqAQzLBm/3rUZweTT3Y2oZLz/8YWYXoOAL76ziMxB/914zUPxv2nbksZ+FldjBpJxNk5Hv
 7FxaSKUiv55CXyizWMSC0i3ilT9NLVQ3YerTO8zNzcyTjuug+OHuGuvo/lXtrS7PfWEHhcfVbg5
 lq43bfI4jrpfFX3iczBbO/lzZaoCDn5u86RSsvc9lAXR8qZgwVn7EojNWHQJMVE24Pg1T8JHbXQ
 ONMVuuO+9y1+A9FpU=
X-Received: by 2002:a05:600c:848d:b0:490:e1cd:e5a3 with SMTP id
 5b1f17b1804b1-490ec4e78aemr26592975e9.26.1781264292848; 
 Fri, 12 Jun 2026 04:38:12 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490e2d046d5sm141012045e9.13.2026.06.12.04.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:12 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:12 +0200
Message-ID: <20260612113812.253217-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602194447.794218-1-bernd@kuhls.net>
References: <20260602194447.794218-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264293; x=1781869093; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XCQ82l4Kxq8uoNrB3OjuAxlveq1OR+XKK7c0bfaKAS4=;
 b=Xz4HrGgYsvQ+0LvZcY1bwDr9fwiasP1h+2hnYGtm+D1WiFmKqd69bdxG9y6CEFWBLm
 qupHRbd77neuCn+sPKN+DYGHY9KU6QHDd/Arg2nAjizwj9ob7Q3OpXOICwymWfCZ8tgn
 UIn7tGLkptPl3kArcuPyXM4lDl3UJaf92QFbvNbXbm78nZrerwFb3JopbwP0GUMXf5jH
 ZNoC4zGkK2IJ5ny47IT/0OvkI+ftORPZiS11Ai19rfdd/aQM1CsnNveWKZsL5kQwVkNG
 CxpHBIUf3LRyrb1oyVHppw6brUWEW3J/ZzmTkgSbVybzYVwQl+jO8K/+mz19yqAtZcyT
 SwkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xz4HrGgY
Subject: Re: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server:
 security bump version to 21.1.23
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
> https://lists.x.org/archives/xorg-announce/2026-June/003703.html
> https://lists.x.org/archives/xorg-announce/2026-June/003702.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/d677191379c7a4bbd40d79be4f5565511550bf62
> 
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.hash | 6 +++---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> index b7adf1559d..5f10908c8a 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
> @@ -1,5 +1,5 @@
> -# From https://lists.x.org/archives/xorg-announce/2026-April/003678.html
> -sha256  1a242c8917c49ba29ccc1f6021613d8a2b9805dd0d271a66ae9d09f4b0bb06b3  xorg-server-21.1.22.tar.xz
> -sha512  6cb37ff971e10eb4a7dfcb3e8071afd769c7632d50e4ad8bc948b810dc4847e152b8a05ec135f55e0695b35908abd07e7728ef85dd3135456fd532e919f440f4  xorg-server-21.1.22.tar.xz
> +# From https://lists.x.org/archives/xorg-announce/2026-June/003703.html
> +sha256  e39832e5617dadaf072fdf9f0e19e5d2e1c2a13607ac280bac1aba9f8fe14634  xorg-server-21.1.23.tar.xz
> +sha512  7eae854af1b5db1f5d1e59cb9d26b86d98fa176d4f80f70935c707f17982d0446a0a8ad8d29c922edbd208435f995b027604fbb72e62a7bf3ba79f2f570aa0bb  xorg-server-21.1.23.tar.xz
>  # Locally calculated
>  sha256  c9f90a6669109aad6c9a7c3b46cc2c574221a73b792afa419336816b49da5c11  COPYING
> diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> index d1e7267c27..cecbb821ae 100644
> --- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> +++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XSERVER_XORG_SERVER_VERSION = 21.1.22
> +XSERVER_XORG_SERVER_VERSION = 21.1.23
>  XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
>  XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
>  XSERVER_XORG_SERVER_LICENSE = MIT
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
