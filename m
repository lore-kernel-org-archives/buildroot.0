Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27AE7CD98DA
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 08:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE07642CEA;
	Tue, 16 Jun 2026 08:35:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RliFmGlpTeKY; Tue, 16 Jun 2026 08:35:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4C8042CD7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781598917;
	bh=RRjAHCxr1Jsnu3kt8lbLvDgXW7/0fOvVrVT1y+4GRE8=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Bff8dqurqkHFdX1hAB2vug92qm5hK/kRoNvQfzPrVTjyj55yEBTUB4UJpu5xFwXJD
	 EkE+L1nApkauAA7QqGlqArW7CrexFfpaQt9EFfaOGM1ZcgBhI8lMLZxJTEOPgfp+Au
	 AEd671JrB5O1CHDDt5X9GzqiCN9qxOaSk4U8ulFqt8XMVgjHwTLMckFWjFFPcjwlZD
	 KzyjU4AMdRZxVtl7axLqdDCwmS8NQUKAr2GLE2iZ6FtLgpZtfftsmVpIf+eq0//FdX
	 Rs/hRDXeZ+vQeaZx3/DlK6tDuMvd3yel/Qbbxf5n8iEcqFgmQW8pNdDGKaDgbSN00J
	 FE7gekgDaLnxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C8042CD7;
	Tue, 16 Jun 2026 08:35:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33D8E169
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 08:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28A14853D1
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 08:35:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2vS5WHvraDSV for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 08:35:13 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=bram.vlerick@openpixelsystems.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 89627853CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89627853CB
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89627853CB
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 08:35:11 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so41495435e9.1
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 01:35:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781598909; x=1782203709;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1JLduDaFuF7lVR4os/zF9Cer/54wMnNB0z0iegdNNVc=;
 b=cnWS2hVX5HT63oGb/62JFXgdEZNsACCqqf07IKoctYViUt+OTgJXIQnk11/wH5bxfC
 /2vL4suf/LPzjNpCEsIMOlx4e0d9AzZvW+wG4pM5DNq27hSZlZOlV6crXIaLp3giydsk
 2RnPSHPKA/ewoLFc4oUPs0I66FXdyybf8z3wJVtuLZXNpS5wfod9cc7r+QxUUgpEN+1Y
 Bhdk8C4nGKpTHouvOeVgaOH8bS+esVxZdrM9Ycm0tmbeEqFGKuMo4ilyQciPm+X0UEY2
 3B6D/tASKbQgOczlmFdybYYaXH/F209suIADFs3qsoNAXiXwyWIIY8OvKEeFwYyiVHcb
 jLGw==
X-Gm-Message-State: AOJu0YxbKX+YjT8fG2KWMGjmOlob3e4ageDJf4eLIjbCetPzyGy1Ir2G
 9ItJ4r1+JBQfTk89uSFA+zEh79h1umlsuP+fsK8kUGbzqDJ/wS3ZWyaI6lBdZnD4glq3b3gzAXg
 xM5173lT5XWdG
X-Gm-Gg: Acq92OHZe2kgT8j25nXFtajVIxZL9AMTnro72ZOXU3gWod5x4q1EgTmLWRqyjwklDdI
 9RLnw/Y8Ish85EHpUNNfe4uR6NwYGrfi+T4u5iKTWO1SEmY6tJQECP1DhqzlYkaZi42pj7L0B1L
 xuBeU/JoAFYZ98KjZOdvwmnoB/b6fGUK8kPnL3gg3/puclzcaK7Pdg2JqiZgFilJtBIVwOwkrwx
 8iCHIaXue/dtf7PGKRw4wugcjJWmJo3Giuku74D62sI2bK6lGUnwPNPMJWSNzqGAGWARs6ElTiF
 5pB7BlKlTYlGmyeMXR47F0g+wDDDIsgF9G79Q0VwXnp0+VPX9lJUi9KIVrZe6JxhbAKzih1yUpL
 UmoylkISMA43soUtk9NpDVcdsNek/1+JBo/mXPzUhxJgua+CElynn4tI0h60hnw8lWup8SlqfBr
 x6OiPUuMcqo3400Lusmj6xxpPooNCQuhDNhpK/kH2Uxdb9gfnh2vO4qaT/uM8ECwddH/BGKyyXj
 VQY21pCOHqo5vMFXLdvwndhTVuFQYiCrjq9zPWnOB7t6sF/YVNRqNLZSkC7JN/KsBJcwND8RKcc
 kN0nlFgN3W2vnIBMrxEXZI7BLmI+BueviROKOl8jN4TmMTrgN0z9kTjK5tOkBaoCuMHzn5Z3MP2
 tSFIIQH+NFtSe4udbcRY=
X-Received: by 2002:a05:600c:4e8d:b0:490:4b89:5372 with SMTP id
 5b1f17b1804b1-4922faecb1emr13198395e9.11.1781598908738; 
 Tue, 16 Jun 2026 01:35:08 -0700 (PDT)
Received: from argon.opsys.be (253.124-78-194.adsl-static.isp.belgacom.be.
 [194.78.124.253]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49230a4ff67sm41182845e9.6.2026.06.16.01.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2026 01:35:08 -0700 (PDT)
From: Bram Vlerick <bram.vlerick@openpixelsystems.org>
Date: Tue, 16 Jun 2026 10:34:47 +0200
MIME-Version: 1.0
Message-Id: <20260616-fix-lynis-busybox-stat-v1-1-a4c194132a58@openpixelsystems.org>
X-B4-Tracking: v=1; b=H4sIAKcKMWoC/yXMQQqDMBCF4avIrB0wYqe2VxEXiU7bkRJLJimKe
 Hdju/zgvX8D5SCscC82CPwVldlnmLKA4WX9k1HGbKirmioyhA9Z8L16UXRJVzcvqNFGpLa50eV
 qGmdHyOdP4Lz8hbv+b01u4iGeNdj3AwVrsNx6AAAA
X-Change-ID: 20260616-fix-lynis-busybox-stat-684965714bad
To: buildroot@buildroot.org
Cc: Francois Perrad <francois.perrad@gadz.org>, 
 Bram Vlerick <bram.vlerick@openpixelsystems.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927;
 i=bram.vlerick@openpixelsystems.org; h=from:subject:message-id;
 bh=QDMkmiVOd7It4Je99XtPnA13t63kuVHBNAabHSKi2Fo=;
 b=owEBiQJ2/ZANAwAIAd6tmkew/Z03AcsmYgBqMQq6ES+QB69+wBxNrBUQE7fOgJ3VVrBlNvzrX
 W6lOjZAEHqJAk8EAAEIADkWIQTzNzLrMhPFwtdXzrPerZpHsP2dNwUCajEKuhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQ3q2aR7D9nTdxTA//UuWcFeJRSKjIlpYJOeCMRJKVYnAReTY
 RsPyClexZ3C7fl8nIiQCJIPBGtRtizF3aSNq/B/bO2gTPVKNW/wHZchUuCSP0f6DxPje1AtKdhh
 L2dFS9WkwKcqe6f4pLjoPcczfaCw57wTWg8m+1Jhw/z6Kp34o2zHhNrqHCxYh682kaiJcbUvrxx
 150TJ7em9BJ4731YjLRqb74925FZroTDP5dN4xkQpXRwCFXlR3rdrmph4Kb8n1gPJGjZbtxlF9r
 YJ1arfhVcPlmc6B0J77WWnSUTXMrLPjPPRQVSlqUH3ZadWOfhNHKLFUyXk94c/H7iQeUqzajaWw
 H29LsAe3WYlsiwNCvN9vMlxa48ij1ektY1hYIAEfcKa6s1IiEd4F1zXq4TXfP3IAkWMuCC/ozbg
 3gHo7a+Y1wr+qCGaI814X1qGg0zNzqjfVOXeZWazZJ/e4jIy9Ff3lOz2pjERlIPIDbVmwqIEAno
 nyTwESPf5l5yA5rNE4bd2fqZJPCGB5GqOiuaqGUPCVN/GMRRm4M5wd27D9RcA+gnqjsrTNRhu66
 5aKqcEKDRgYP77lb+Pm3Fz7khsZrp/6ktDjRQdCiCsE0SAICG+Vc92P8ciKBGO1vkpw/svym8Cd
 lTe7v28H3zMvB8MpjUh6CgsTy9KTwkFfHZ2I9XWl2D3Dtw46ZtYE=
X-Developer-Key: i=bram.vlerick@openpixelsystems.org; a=openpgp;
 fpr=F33732EB3213C5C2D757CEB3DEAD9A47B0FD9D37
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openpixelsystems-org.20251104.gappssmtp.com; s=20251104; t=1781598909;
 x=1782203709; darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1JLduDaFuF7lVR4os/zF9Cer/54wMnNB0z0iegdNNVc=;
 b=u2QknzqAh5YdG3AtzXZy3c4hExZr7vz8eTONZpqKgFvPpNPXrYrQK6yfyBlcunX4Ui
 4p774ufBnS0mVhi2/yot7cTBoBI5qJyrLzFADdCvSyyji0a2fay4T6w4OPbuseFL17dW
 SdoVsTwAE1KYRRvzd+AwdcEAyiRZ4Iqq/Xu4ooPHlm4x9+WSb6L26wM1rTo5c0urImw1
 0zDJ8mytaOFKWth6sTv5V1E1eeUp1pItJ3WXyrJoqbuJ0YJG2jxqLbCK9vqxlIO8yoiH
 uZ9SJZ4cVPReZA4gMeulvp0jvSA68WQbhqCb4mzkE5Men/k7FAoaiuhaSCqPHsJKqxeF
 bUsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openpixelsystems.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openpixelsystems-org.20251104.gappssmtp.com
 header.i=@openpixelsystems-org.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=u2QknzqA
Subject: [Buildroot] [PATCH] package/lynis: add busybox
 CONFIG_FEATURE_STAT_FORMAT enable
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

Lynis uses `stat -c <FMT>` in multiple tests. However when using
busybox, the `-c` parameter is only available if
CONFIG_FEATURE_STAT_FORMAT is enabled. This commit adds this
configuration to the busybox fixups.

Signed-off-by: Bram Vlerick <bram.vlerick@openpixelsystems.org>
---
 package/lynis/lynis.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lynis/lynis.mk b/package/lynis/lynis.mk
index d630182732..1b9f5fa5a2 100644
--- a/package/lynis/lynis.mk
+++ b/package/lynis/lynis.mk
@@ -36,6 +36,7 @@ endif
 ifneq ($(BR2_PACKAGE_COREUTILS),y)
 define LYNIS_STAT_BUSYBOX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_STAT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_STAT_FORMAT)
 endef
 endif
 

---
base-commit: cbe867b895d19861cd809c953f88c576f2073223
change-id: 20260616-fix-lynis-busybox-stat-684965714bad

Best regards,
--  
Bram Vlerick <bram.vlerick@openpixelsystems.org>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
