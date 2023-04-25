Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6832C77B61
	for <buildroot@archiver.kernel.org>; Tue, 25 Apr 2023 17:15:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 577D761121;
	Tue, 25 Apr 2023 17:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 577D761121
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GkgTlNmsAYsg; Tue, 25 Apr 2023 17:15:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 493486147A;
	Tue, 25 Apr 2023 17:15:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 493486147A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C20BC1BF82D
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A58184098A
 for <buildroot@lists.busybox.net>; Tue, 25 Apr 2023 17:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A58184098A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8YUtkj0Z8vLL for <buildroot@lists.busybox.net>;
 Tue, 25 Apr 2023 17:15:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA0E040977
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA0E040977
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 17:15:01 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-63b78b344d5so4868433b3a.1
 for <buildroot@buildroot.org>; Tue, 25 Apr 2023 10:15:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682442901; x=1685034901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D/+WDKApFL57MRtFzPe0K4c5n0aidUo9iSmp9utCx6Q=;
 b=ArH/my9/bicf2I4ZZwwRSsa80c2sWJ+6gjbajSyMAo7Kqdom6PxfFJmY8palwhbMjx
 ewKLovmV2RHjOFv8EEpjVrudp+Uw6Ol3449nH9dPpNM0C6ETNnnZ1Ml0lxvSV6l9qVoz
 2NSC50R+iKsG8gd2UqIVejOftdVqTiKmjVqwh6Q33LqweQGS5P+EDMo7sWuTO4ZUmquw
 L2eF/lfKah1rx0WRE3/oyeHkCJSDAjMtqfde13PEn7pkL//Wzwccjly4yEOzBEGqLKcK
 t8BER3JRtd3BxX6yFHRghFXChDnAp/KZSdryxXvt/AEZPwuARDHZZHJx7Qn268kA2n7p
 IfIg==
X-Gm-Message-State: AAQBX9eyS+HOF5L2sq5n/lfBuH3sWJCndhwyrj7y5yZC+RIsWisUlVg7
 yNVJoREEhgsxceBL/ZC4j1elcsKsyG1gtA==
X-Google-Smtp-Source: AKy350YFWPvgihr66hFPhq52DRP3j37Q/QJjSeK8K5RCl9ukuvxAyvI4GOk1aqjc0G3/G/E2culmzQ==
X-Received: by 2002:a05:6a21:99a0:b0:ec:5a61:52a8 with SMTP id
 ve32-20020a056a2199a000b000ec5a6152a8mr24460960pzb.9.1682442900754; 
 Tue, 25 Apr 2023 10:15:00 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::51c9])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a056a00218b00b0063b8ada8777sm9582454pfi.112.2023.04.25.10.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 10:15:00 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Apr 2023 10:14:43 -0700
Message-Id: <20230425171454.48802-3-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230425171454.48802-1-aduskett@gmail.com>
References: <20230425171454.48802-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682442901; x=1685034901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D/+WDKApFL57MRtFzPe0K4c5n0aidUo9iSmp9utCx6Q=;
 b=VoN0qRwEJcTJwRpWQTdvwtPRif6aCyCNAoq2/q9ZqA3jXm1Gj3+vLrparpq1taKKin
 sPl5FbEEjimgfyUgHqAiciumWi2upomzA6uGfvrDcGtYryBJ6ObbDQl4KsEnNh8vOMPP
 Bj/vRjMcjKGfBURcnlWnu95mXOXbkyiaM8wIZNyiaNT5wFk0Th6n78J/7bEu4DiBYoXE
 qPvFCD1ea8xpEgAEOtwBES7JFV1H2nhfjyIq5vz6WpZv5cmkehwB6xm6x2S9dNh1ZD//
 UogENkc4dA9APwr0KKfpGJP9xLxgwTVUDJD1RzGoLDHfEEbyUkQpbBRBv8A9oKQuusMt
 RSwA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=VoN0qRwE
Subject: [Buildroot] [PATCH v2 02/13] package/python-pip: add host variant
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In the following patch that updates libselinux, the libselinux python tools now
require pip to install.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-pip/python-pip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 8cf3aaa3ec..35ad7bede2 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -14,3 +14,4 @@ PYTHON_PIP_CPE_ID_VENDOR = pypa
 PYTHON_PIP_CPE_ID_PRODUCT = pip
 
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
