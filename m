Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3DDC27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 13:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3087961216;
	Tue, 18 Jun 2024 13:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 40jmKcnz5k9a; Tue, 18 Jun 2024 13:20:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8614E610B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8614E610B8;
	Tue, 18 Jun 2024 13:20:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 531851BF3BB
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D46D817A1
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 13:20:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PK4NjJqOrGA6 for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 13:20:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6F1E78179D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F1E78179D
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F1E78179D
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 13:20:04 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52bc335e49aso6167198e87.3
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 06:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718716802; x=1719321602;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h7zZ0J+fXlAqaJ9lANjXTHcNystjMaptQaRzNJSan0Q=;
 b=nXSskszXcaoLwY5WadT078elJrjt4x77DIRAIpeY2bKq8xkQ94RWOpZ0+ehhfJHDBb
 wiKSay4qf0s6JGmC8G3NGbhYFlLtrC+nWZoUlu2eBBTl8ODAkuVR+VaoKAKNF5Frm4sY
 Cd31nrihQ9QytFxcNDF8XBBLoT3W/k1jpyc9fu1mB2QE/tL943QfCP2qQAefz9NFgl3l
 NXpSfdVVu02AnYY25TJI9ggsgZgfi2uN25t1AoakTlVT7EE4Vv8P3OtrcCW5c/rEOt1u
 Fzma1rEa+OKFL3nuyJcEiWrc3YbOaLczTJAEBpOaJGqoASuyZDJol3xk4xRWfhCpm910
 QhtQ==
X-Gm-Message-State: AOJu0YwcCSSc1jcR6xif9sVF2oTGkMdZ57OrHMdpSOLTWhE1AOo7prw+
 /xEXnqjg3gvRoMI+ddhdI37PWeS7yk3Lu1FZrPmdvt8Qa4APqTLu8ex6IA==
X-Google-Smtp-Source: AGHT+IERjzk5uIqyBDMCfSm0ucs0M7Uau0jshyLyP1WYhCKLaziG8uZB+1/zxjygWgcrmOwOjf1+FA==
X-Received: by 2002:a05:6512:128a:b0:523:8cd3:42cb with SMTP id
 2adb3069b0e04-52ca6e5515fmr11192368e87.7.1718716802257; 
 Tue, 18 Jun 2024 06:20:02 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca287228bsm1497540e87.163.2024.06.18.06.20.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 06:20:01 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 15:18:28 +0200
Message-ID: <20240618131902.2912459-7-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240618131902.2912459-1-roykollensvendsen@gmail.com>
References: <20240603115206.3583474-9-roy.kollen.svendsen@akersolutions.com>
 <20240618131902.2912459-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718716802; x=1719321602; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7zZ0J+fXlAqaJ9lANjXTHcNystjMaptQaRzNJSan0Q=;
 b=TMwwTCU01/RP5Pss5ZFQP0dIFIj8KPsMeQSGAEo1QnnokFZqsjDObLQ5TL4GSTrqI4
 Ae5dLNgKBXaOq30ht4YEkkDU8ZB2JNRHKRgDlIviKMeHuzZEmC6SpkXepWpqXLuh+XU+
 3FD8xa8oCoeCil3plvmhjt3feUjhisR+Oqdx/uEkhcEUYHOiYEkbNAmTzgOoOBClqtFC
 Xbr+KUNdFJHOi8RMwz2UVbJLZaeVbJ5o52lFLVU0MnuCAnQ+UyFyIxWrO3CX3nfS8IVs
 AjTSndjk/7vj5YalxnqwaT1t0eLIIMfQbPHR9d0x1M+OP9hqYdvxIeu14KcYXpsCwEQL
 5yaQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TMwwTCU0
Subject: [Buildroot] [PATCH v7 07/14] package/qt6/qt6svg: allow building for
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
