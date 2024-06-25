Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C07CC2BBCA
	for <buildroot@archiver.kernel.org>; Tue, 25 Jun 2024 21:21:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27D7741714;
	Tue, 25 Jun 2024 21:21:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TARI5_M9vo9R; Tue, 25 Jun 2024 21:21:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC575416D2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AC575416D2;
	Tue, 25 Jun 2024 21:21:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2F83B1BF417
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D763607CA
 for <buildroot@lists.busybox.net>; Tue, 25 Jun 2024 21:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gULpR5X4MB_D for <buildroot@lists.busybox.net>;
 Tue, 25 Jun 2024 21:19:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 57F1260617
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57F1260617
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57F1260617
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 21:19:14 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ec1620a956so72970711fa.1
 for <buildroot@buildroot.org>; Tue, 25 Jun 2024 14:19:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719350352; x=1719955152;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7zZ0J+fXlAqaJ9lANjXTHcNystjMaptQaRzNJSan0Q=;
 b=s6qqfIFfCRh8Yqj5SVzU4UUoDIrOLtXBLEwoqPHwqWPAZwezHupim5fHX85D7I6MqN
 DfH109TFbwZtilG9i6Cw9SX0lepXCo+2XUHd8xHCHPYvGh/hSFxgnu8v2kUZ2Ke1RuQ7
 EF36j9m+jMT+p4hr0QeSMIbHhxcqbhybrPO1QoeTbr48dUfpK+ObQZq9L85pLb/eT6eA
 cAFRqHnuptur8gW23Cr3GnJa+ABJkd5/ZrzAjz316h5hJM5EGXoqSv+b6d8oh3bH8vLY
 b5gDxoSCG+6dno3XOTIXbZsxaTQPceKkY0xLmx19+99/BmGiRc0PYdhIUcE0lmNjS/V8
 BYdw==
X-Gm-Message-State: AOJu0Yxn76vujf34OKixn5/E0/7i5cX05BDBc/tfpdLkk23hLxR1KeK5
 8417k6E9SbtBVq3MUPBlwranxoQdnHgggaA66H9p1NvYd3LsC3GrWb8dSg==
X-Google-Smtp-Source: AGHT+IEz5cBqknKNqX61fInR/56VV5ACOWLMHjs06DIDa9SWoEP3g91jn0Q9QGKPO44zHLKnKFRsJQ==
X-Received: by 2002:a05:651c:1991:b0:2ec:5bb2:c236 with SMTP id
 38308e7fff4ca-2ec5bb2c276mr65145011fa.33.1719350352148; 
 Tue, 25 Jun 2024 14:19:12 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec592b6158sm8908971fa.3.2024.06.25.14.19.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 14:19:11 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jun 2024 23:18:31 +0200
Message-ID: <20240625211847.1419944-7-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240625211847.1419944-1-roykollensvendsen@gmail.com>
References: <20240618212646.4154474-1-roykollensvendsen@gmail.com>
 <20240625211847.1419944-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719350352; x=1719955152; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7zZ0J+fXlAqaJ9lANjXTHcNystjMaptQaRzNJSan0Q=;
 b=QzuGTIT8KoG0t9/yAXWdghTumxk0FVw6XGqzg7kdBqaPshfJ3mAAig2wWtQ53GkxK6
 qzAUXaSl2FRA0x6JUG15gW2fijAOwlZ7rWY+TFExdgBlK/aSBlnMY3ScckWR+wHfGxiT
 Ta+Dwt42vhdwsdz+6JCLrzmovcvzMTLF+V8mSAJJiTfUXpdBnch8+xjHDvHRFu4uOf1K
 KZwQkTsvl+qa8rSTkuLC9/pFq05PvUjAxstSNp1ym6PaaH5+pF2TE3m44JU7aYo1K6eC
 KyCpGSgjcXJOGhQqPwREJCAcVOTVwkRKgYwiY/ddbIATzKk/8J6ZDyCA582Z5XRpZvvE
 vCMg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QzuGTIT8
Subject: [Buildroot] [PATCH v9 07/14] package/qt6/qt6svg: allow building for
 host
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6svg/qt6svg.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt6/qt6svg/qt6svg.mk b/package/qt6/qt6svg/qt6svg.mk
index 25e87dd208..a9d7eaef51 100644
--- a/package/qt6/qt6svg/qt6svg.mk
+++ b/package/qt6/qt6svg/qt6svg.mk
@@ -37,3 +37,4 @@ QT6SVG_DEPENDENCIES = \
 	qt6base
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
