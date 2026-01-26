Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658B9D13C04
	for <buildroot@archiver.kernel.org>; Mon, 26 Jan 2026 13:04:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4AA5180B2E;
	Mon, 26 Jan 2026 13:04:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u77SQOIY9ZpO; Mon, 26 Jan 2026 13:04:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6352C80AD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769432666;
	bh=OA2vQG7SG+71f+6HCNcowBLjB4EqFz25hMc+h/OmxOI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=okD6X0E1KpP5P+DKoKy+Jy59P7fA3V0AT/3qvlA+bPekjG0AW4uyZkMtsdlcxQfax
	 ViW4fMntTRWf+K3RkOIGDUTCha9ljxiUIK64OsZ4BfSypzUmAkG/R0IurZQfugjRFQ
	 2XKWC9ZI1LdLG1XdtB08BCPZMhBz9BbW538a0EzjqcuPEiBr/ZeXVrPxbEyLwTvSUl
	 886n44gbEbDKlTGO1xwa6tilhF/pi1d4IesTbhGDEsYh6zWs/2QJY3JnZ9BvJLD5A4
	 Am8iHqaEWUTJWfZz3yKE5PZrqhoQxycWq1BDS7Ma6LK4ZT4tH+E+AK6TXeBLUgipNU
	 sPxQPzVmEbk+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6352C80AD6;
	Mon, 26 Jan 2026 13:04:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3883C355
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 290A340026
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b0xtWdkAHl1V for <buildroot@buildroot.org>;
 Mon, 26 Jan 2026 13:04:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 594334083F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 594334083F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 594334083F
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 13:04:18 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4801eb2c0a5so44596215e9.3
 for <buildroot@buildroot.org>; Mon, 26 Jan 2026 05:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769432656; x=1770037456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=f2MF5BAj7MNeJP1RE9uLcIomh8UXj9pfgWfGb+H9XEE=;
 b=uZezpOSAtXxDqMRZbsjint47odXtrTbVBouicWZ5EWGiMRj6mSgzU1OXnv4WUHpbup
 +5XnZm8Rsuo77LZpnEniPXjcK/jLuHa+ItpHXx7/aRCORjjeXrpDyr8eZsTPNFinS9zc
 g1aeJApv8WPys9XPXEQzKSfMTJ7x9TkMX4kCJYK99W/EKCyWNAmgejgWcqRjUC4/sCjB
 TngmD2YTCWthoAGRNqC1o0P+Wdzg9CVRiv4lgDcuFcfouvW9Ql7DtgDj2gpGNYUYxmRl
 1VAFwHcLtAw7UJTYThJ6hpd9xOnYgWbbHkpUP5WLN4WKUs69QA0I+sZzJ/ggPE/JDSxb
 Zv0Q==
X-Gm-Message-State: AOJu0YzwEDfCu+zocObxouwLgmHpXUAjlNDZLr+iILSYgHvQf38rHNvm
 615BYYnKtNeH/ETXyRYnyWSaVN72SZb6IP8eyzTiU0ORo+i6swAETkWw8B6X4FwjOUeYJK3Le8U
 kSGhr
X-Gm-Gg: AZuq6aJCb+vekYrLsRZitoLBW/FgPUFwGpXtsepQ1RrFdfObUJZY5UGIL48OgxLkuNR
 aKi/Z/HtqLs1mE9CP5QkAAAOSL8mHCZ/aHvcz3TNSW5uTgXEGJyOcS+D47OaPqCDDT8rmfgh6+H
 9TceB9dAPYsfLBuu+r1Fpy4fK8G40i4qLlQrMB5BgCtTV70VglzE9DWfNnPHB465dZXSJ2CwOVj
 +t+ieT3rCWItrXVHh4YQY3+4ccIx+6RwVQvTi/YwP0mlNYXyWj1i6OM1EMJ3Y5/6lvtDF2Cztbb
 f3nxDvhecyUea1LTNP1ONsTja87Fq/Drnj0CbAp4nY67QFuVA+7Fg8mCCtW6CVTPLAxdnh4vKFX
 PaokxaQ9peJQDun5wfbz6vvFFQiXZbDpi0llw8FygKz495sgKZuNtKYWecTg9k72AKK4BLJnC7U
 esE3K3CJrB5BKSLynE9BGPuDV3CyIOYKUiMO2xhh+HIwyxhabS
X-Received: by 2002:a05:600c:6296:b0:480:3a72:5238 with SMTP id
 5b1f17b1804b1-4805cf67ef5mr76031325e9.30.1769432655968; 
 Mon, 26 Jan 2026 05:04:15 -0800 (PST)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470cf1acsm359603435e9.14.2026.01.26.05.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 05:04:15 -0800 (PST)
To: buildroot@buildroot.org
Cc: Thomas Perale <thomas.perale@mind.be>
Date: Mon, 26 Jan 2026 14:04:13 +0100
Message-ID: <20260126130414.59175-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130414.59175-1-thomas.perale@mind.be>
References: <20260126130414.59175-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1769432656; x=1770037456; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f2MF5BAj7MNeJP1RE9uLcIomh8UXj9pfgWfGb+H9XEE=;
 b=ShduAtEkhgscx57Ki4+ahvh+7RDisCRaDGSH+vlL5Ngz913q0LfjRhfN3FwZngreGN
 pzteqFM4a46jc0VsFNMV8ECdiuV5ZqmF11FdOj0BVWCPx7ysd5BC8ooIyu102Jr2FOQM
 Ia/Q8kcl6Gd8coDuNeF7Xm6Vp5kLCdgRAXbtxmRcVXN089f9X9YQWVwcHIH3sevyMFHO
 hB+Y18p85kltezi60K0E4DvGykifZxnM/0tK+OiJ6lhOHks7gug4M2CUrRwK3fGBZGlD
 GS3gXqhtoZbqsHQ1V4F70sh+aNKAXKN1ET+bKCCQWT5rdAD9/KIZjltICJVTfpkJPpwb
 R8fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ShduAtEk
Subject: [Buildroot] [PATCH v2 3/4] package/pkg-utils: add 'provides' to
 show-info
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

Add the list of virtual packages a show-info entry provides to the
output.

For more information on virtual packages infrastructure see [1]

[1] https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_virtual_packages

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pkg-utils.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 288a202230..211e681e8f 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -201,9 +201,16 @@ define _json-info-pkg-details
 		$(foreach patch, \
 			$(call pkg-patches-list,$(1)), \
 			$(call mk-json-str,$(patsubst $(CONFIG_DIR)/%,%,$(patch)))$(comma) \
-
 		)
 	],
+	$(if $($(1)_PROVIDES), \
+		"provides": [ \
+			$(foreach provide, \
+				$($(1)_PROVIDES), \
+				$(call mk-json-str,$(provide))$(comma) \
+			) \
+		]$(comma) \
+	)
 endef
 
 define _json-info-fs
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
