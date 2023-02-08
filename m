Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350D2C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 15:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE33680BF0;
	Wed,  8 Feb 2023 15:58:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE33680BF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mja9O3lxiCkG; Wed,  8 Feb 2023 15:58:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AC828201F;
	Wed,  8 Feb 2023 15:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AC828201F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7C5381BF36C
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5463D61119
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 15:58:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5463D61119
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id shChwclwnRJH for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 15:58:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE98C610C9
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE98C610C9
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 15:58:06 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso1797027wms.5
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 07:58:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PyF93w18kCy+5hKuY1NJVRZayN3Lmq+tNuo1Adk2SRM=;
 b=RiSGjiHO9yEsfcCZalPHHEE553Utrv1f6DsmoL8eGtOHTOpY5NOf6bMHQnBnUuoEdM
 a5pDHUKtDqtCRKMtGbYN/oNL5fuQmuQmrlkRRwnwbmC003gj9RNqRD/KK3RIhAkR9a/A
 BhABzvv+b/UPW9n6Xe6+aWcC2u/nGixjvx7DGsLlZvVVFTz64tnhJ1K0iRGt2p7Njr0R
 Z5YPZ99Fo61lZhEUK3w4CIj3m2kFe/gRNRRSLr0iF0PiCexHSR7qo3O/txlxPmr0TrTM
 TSO1ZknpQ7eoZFEeIKqE1XAkL7b/E5M1UoEloVdWHYKDMOpMQptG/OSNI84RP6Fur3d6
 kHYQ==
X-Gm-Message-State: AO0yUKX/iChgPNmeLysoTx1Z0GB1du4EtpJmcgzfu81ZO+3jCkaqHLDM
 aXtY+eV6wl7wpTmKDtHK+ZhVrWknMgZw8/f84P+ZSQ==
X-Google-Smtp-Source: AK7set9XEuGuRZ94rpCHa0Um7J/L5htYEdBgQQ3nfWHBLmxEEjoHNDvf7GHiq8PVA5YcujLzqClQGA==
X-Received: by 2002:a05:600c:4918:b0:3dc:d5c:76d9 with SMTP id
 f24-20020a05600c491800b003dc0d5c76d9mr7890226wmp.0.1675871884710; 
 Wed, 08 Feb 2023 07:58:04 -0800 (PST)
Received: from wintermute.. (77.109.114.132.adsl.dyn.edpnet.net.
 [77.109.114.132]) by smtp.gmail.com with ESMTPSA id
 p27-20020a1c545b000000b003daf681d05dsm2469043wmi.26.2023.02.08.07.58.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Feb 2023 07:58:04 -0800 (PST)
From: Frank Vanbever <frank.vanbever@mind.be>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 16:57:52 +0100
Message-Id: <20230208155752.73981-2-frank.vanbever@mind.be>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230208155752.73981-1-frank.vanbever@mind.be>
References: <20230208155752.73981-1-frank.vanbever@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PyF93w18kCy+5hKuY1NJVRZayN3Lmq+tNuo1Adk2SRM=;
 b=iLT57vOiYMlZqFKivvuXnWVG7AF0zzFGt3/m1Vq27A0YN4F64XusaCTTctWSS7Wc74
 OpM9L6iAJ1QDGfBXEf0MSBrQuOaMv8BeW594HxSst2B7a7k+TtDxg3DEd7Wspw+WCMgU
 xUzsZyLQdS1hE385GdYFxz633NcSGhB4THPEhmjC/YZqX4XDixdP1crdPFXBpyzlqeUV
 Ye9oKtDKP10wDP2W7tTbypCIDNTLPa1mbxE/xQcJZPx+pmDUGMYXR1S6XjKfTsQan/WH
 4/K5XS9faNZqte1MG82+ISgqzaVzCD+Emz9PdQEPPCndwhF762LhZTeEnafY/bZhve1V
 fXIA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=iLT57vOi
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: update e-mail for Frank Vanbever
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
Cc: Frank Vanbever <frank.vanbever@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
---
 DEVELOPERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0e116e92a3..32c6e54919 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1088,7 +1088,7 @@ F:	package/sane-backends/
 F:	package/upx/
 F:	package/zxing-cpp/
 
-N:	Frank Vanbever <frank.vanbever@essensium.com>
+N:	Frank Vanbever <frank.vanbever@mind.be>
 F: 	package/elixir/
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
