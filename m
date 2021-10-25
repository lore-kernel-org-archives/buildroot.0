Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E487C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:32:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E625C604AC
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 08:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E625C604AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE51340378;
	Mon, 25 Oct 2021 08:32:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BaXomzMlAyxr; Mon, 25 Oct 2021 08:32:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E520840376;
	Mon, 25 Oct 2021 08:32:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 23C361BF3AA
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1340C6082F
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 08:32:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GoCnl377EWq0 for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 08:32:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D37FE60827
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 08:32:28 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id j6so11708618ila.1
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gKF9ziiYRiwVZS85cj7ARkU0IA57SW3V2H06aUjnTII=;
 b=P4xECoj9BlEJfCVm4B4H3eHwZPXKy6ZB3jp74ZbUwNEhwH8yTrEH1yVJGVQNp6n2vT
 Q6zFZVxKed1x9fBqsuhOaKEkqpwL0fJgwLn2J7SbbKKj1l+QNZaKvANd3e7IwwcJjjV/
 +9bQLS0c7QWeW5kTBhoLyEtJk0jzLMXZ34Wre2EyEii4MfqhVsY1u4q8Qeug5bihezA9
 4nRenpEaqOX6Qcfst8xthJCElHOokTLZtEdtHWHaq3LYJiSx09EjKakSwUlnIHBqvYCD
 7Q2q5y05rcEZo05O+UTxQqK/anpgCk8HIqrueme7AmAfrO7He7wM1v48dov0YcBi9tZW
 5Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gKF9ziiYRiwVZS85cj7ARkU0IA57SW3V2H06aUjnTII=;
 b=CVepDMHNeWmTkAXmQtFKAVswFrx2CxG5h7UVaNV92dRr0n9dbaxQONMk1sHV2BrlNN
 DG/id4GjavObvUpx+/iTFwgyVFB1sWWoTluSe8qcRpEJxeXEQBnU8J/dmzVH/lmahACz
 nQccZsRGUaDNOMO/4pJYvnHMBbLd2jS+cavey5JEwXlYKNVBjeiEvphZ+NO7FbRXI17A
 aI+JUnf3PFEcgv0294vl5iqwllhlrfTSdWaB7lY6GhsvkwfrWbnyNoEnXEwZth01vGGr
 cl//heD0aSivDe1bdgM4brKWvjWIZG4slh8ij+IC6xarc6beqLTtZUhMkEg5NiBBJUd6
 Atcg==
X-Gm-Message-State: AOAM531u9i/olFyWyrHgoqQ7tTHHmTsFHuCmiMfDT6WMIZ1wx/uO9GPk
 bAjNUH48MTHuq9AyKpUjPuTVcBxAPhU=
X-Google-Smtp-Source: ABdhPJzdHrgUrHiXNLWUbR7mR6g8Bt+qeapaI/eMltHWw1gx8uVMqAGYlMS+9+UI1FmmFATvzY8V2Q==
X-Received: by 2002:a92:c241:: with SMTP id k1mr7739526ilo.26.1635150747898;
 Mon, 25 Oct 2021 01:32:27 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id x14sm8482665ilv.26.2021.10.25.01.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 01:32:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 02:32:17 -0600
Message-Id: <20211025083217.3988476-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1/gst1-vaapi: fix tests
 config option
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

Fixes:
output/build/gst1-vaapi-1.18.5/meson.build:1:0: ERROR: Unknown options: "test"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-vaapi/gst1-vaapi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
index 497c6df0d3..9810b12cf7 100644
--- a/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
+++ b/package/gstreamer1/gst1-vaapi/gst1-vaapi.mk
@@ -24,7 +24,7 @@ GST1_VAAPI_CONF_OPTS += \
 	-Dwith_wayland=no \
 	-Dwith_egl=no \
 	-Dexamples=disabled \
-	-Dtest=disabled \
+	-Dtests=disabled \
 	-Ddoc=disabled
 
 ifeq ($(BR2_PACKAGE_GST1_VAAPI_ENCODERS),y)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
