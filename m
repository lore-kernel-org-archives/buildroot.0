Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48388D1D480
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 17:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F1888301D;
	Thu,  8 Jan 2026 17:19:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmljLtJDgeAi; Thu,  8 Jan 2026 17:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57A74828A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767892793;
	bh=j8mgOzQx6vnIKuOvwyCjaVIoje2p/1mCvSfWfs39P5o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N9utuDIFesFESE6RLjjrD8EIXHRMG0i5HnqmEUxL4CeuUbqGyxt3/OMVPAWXr3qHv
	 24qIH0cY1ELEMo7bTvOWKOeSZe6w0nBtFVgEEd0u4mH4b8lv3vT0jqrbA+IQgN5Caq
	 0lF/u+hapdxSz9M7z7eWumSfslDWz5GPWEU0/H+WAZ/tlDy33A0q8l8OovtW7NtrnN
	 20uOfCuoVdKBHDOU2Cb+pIUYb6ofSSciG4pL4AReKfFmy8Vh4XuwURR8cuoERmsa0e
	 dRwJqmaMH6t5UT7LCbzJ/zAmrrCE/0BHAmoMU+ux5Os6NRVFrc4mOdA1IWCWC0acZA
	 hg0/0K1O23zsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57A74828A9;
	Thu,  8 Jan 2026 17:19:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D070237
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 17:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B228828A9
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 17:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iBzARH2TZjyl for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 17:19:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28D8181137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28D8181137
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28D8181137
 for <buildroot@busybox.net>; Thu,  8 Jan 2026 17:19:49 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4779ce2a624so28765825e9.2
 for <buildroot@busybox.net>; Thu, 08 Jan 2026 09:19:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767892788; x=1768497588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W8gZlIGNzq7VlFsJO4lty3j8pNbCT7KyMyWm6FXnDB8=;
 b=h9BqZhRV+k+5oKEeEc/kgZ+8WlzKGpraS9lV/cb52zLk5zQ+ABNSCoqbmFwElIBM+E
 28i0vkN/kspxW3RWTJU7pJ1zPtWqiXwq771B3E5504p2YS78zLzzSry0j8wfwIDUdcap
 ksd63k+/fyIgjhS7hOixxd3Z4EzeswlYGfBFI36oCvU/Z/TGTCGYVruLbAkgBSlMZx06
 bltLzgusK8GQZGdjsYCAQFBNAkSW+HeeCnF7dQAT/CYX9ZlV/UELdjBJpSqaWx6R9d0t
 +QRjeI0T+O71qemxbsn92Z2RsJ5g6b9ZvW/2hpPNVlQt5cRGA/ddSbrXarioU2Hl/FiC
 TGHQ==
X-Gm-Message-State: AOJu0YyYKQFqhcRLRsSNH561A0kSWWEJW2Sli8V9RW4F8aPGMB9q9xaY
 +ezpW4OdYoVkLbN9b+66n6vaiDX+4DmCycCYXpcdwg8ZnIWwFTzRg85ym0/CFGZg6/ALrBhKt23
 KLUaeWg==
X-Gm-Gg: AY/fxX7MAPiMaD6upxKbZRJjuKvfe/niNNz0wPPkfuWGP6BdyVz4yNv1S3ysaStV1//
 pnjlMluxmyAEimd2GWA/jzSOZeRXFOXH8hxA8zBy0LJTvee0z1T1IbPqWz+GSvdvf0Bi30l/9Ak
 NZO6sto8yIvKqOm76iuOeHfU96GvQaBjlrDTgoKeFMx2if17bzJ2cs6GcJgo2prn4YNkMcVm7jv
 uecHgjod3lcgzFXJmjHJzceuBm8S2WAPW2UDwDbwINrgRKoeGyFvWAiAtOGwLYYq9HHI8B6H+7T
 qB+CJOk50W9SVEY+xMrRu48s9Jd6Pjg85fhuOYemoW4Gv+SBKlzuz1AtBRObMnKRa+eEbHhpD6x
 tEDS2s5O5B8pjxn1mftDMFe/Gaprhxh/BRKBgBe9c39Fg+mH3Y8Ot54oAcQkA3+dZH6sErZQmnU
 H/jVCfnw6dMKLrYVHR+4/3/yJDKLm1jJgBL84=
X-Google-Smtp-Source: AGHT+IFBJIBiFX34lDcubd85xuyighK6ij6PjBKnaMWkQCCDUHu9En86DDJFYN5yhZDj5THUTmJL6A==
X-Received: by 2002:a05:600c:3484:b0:46e:7e22:ff6a with SMTP id
 5b1f17b1804b1-47d84b1fd4bmr87949545e9.15.1767892787161; 
 Thu, 08 Jan 2026 09:19:47 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f653c78sm172329995e9.11.2026.01.08.09.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 09:19:46 -0800 (PST)
To: buildroot@busybox.net
Date: Thu,  8 Jan 2026 18:19:26 +0100
Message-ID: <20260108171928.669166-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767892788; x=1768497588; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W8gZlIGNzq7VlFsJO4lty3j8pNbCT7KyMyWm6FXnDB8=;
 b=CbS/t7oF6di7fNNGbBZI70WhTHOWiBz39OqZrnlNiX4fvIfppjkUUR+z+zcekv0KQm
 aymfP28YIKkUySQkRP43IcsZYgMWqazAHA6N37RZecukoWJ65lBJFP1rDIL1nGUD0enR
 leG6uYwKUP0HxH1xUU/6VQewTsqdzUCoaMLi52hDE6jdq4wb+sidqhxBM5CTupmUPncN
 Tl2FjR05TiisWKRsjV8IgQTY+HBpGEevt0YNefdHGdSkiWBCiqRukgNjEblrrpLbI5Ok
 DDmHuRnmhIe4fn1bo/FrENXmIPfQxKbcdtxgF3hf13mNQPHHnRcNMHVnWC3RtPR4/BD2
 qtMg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=CbS/t7oF
Subject: [Buildroot] [PATCH v2 1/3] package/janet: add host variant
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

needed by host-jpm

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/janet/janet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/janet/janet.mk b/package/janet/janet.mk
index dd2283e5a..c7255394b 100644
--- a/package/janet/janet.mk
+++ b/package/janet/janet.mk
@@ -28,3 +28,4 @@ JANET_CONF_OPTS += -Dsingle_threaded=true
 endif
 
 $(eval $(meson-package))
+$(eval $(host-meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
