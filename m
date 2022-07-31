Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D484DC00140
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 19:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C6E96106F;
	Sun, 31 Jul 2022 19:37:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C6E96106F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PjjUhWGiujy9; Sun, 31 Jul 2022 19:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A076460E2C;
	Sun, 31 Jul 2022 19:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A076460E2C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 937F01BF2EB
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EA3761069
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 19:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EA3761069
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xwWDsco-liSN for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 19:36:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3D7060773
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B3D7060773
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 19:36:03 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id m67so1730275vsc.12
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 12:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=sLqdgO5O8themBjIMC0Z7sGMwhz5PCaCJIKqiSYSZaE=;
 b=F5r2J1SQENBbRdU5h7oV+ugGFnTXlHOEGso4kaAr/YMXc/nvo7hgZOmlu3/ih5VbCM
 3yTqF9OGPON6ZrqwTANOCTyU8p/6cc1zIebn00XGjVbw+JbPps36hAHZvW5AMyCnHMV+
 12VZYmyCIJ+vRhugGPwioBccEgFKZHbiLW+Vye8t8hRbFq3PsThJ7jSwxxGMMEsVsHM0
 MFCQXFDgdbWWELYiN7UPmWxfNWmO43DrOQ3d3BdKLlYRJfixs0k2Oom1YAC5FLx2x9h/
 5zVDSlMgdMtrz0xqLKagUog/TUCjigaf666vSESBt3yHHI6wnh1+QosQn6smYRDZBE9b
 HpXg==
X-Gm-Message-State: ACgBeo1uvGEbtGMUAwqxi2ImtbwXKURhMh1Nd2874k5zKkB/iKdJBOyt
 wZly7bbIuOGGCJrCc3cqfgMfgR+YWNE=
X-Google-Smtp-Source: AA6agR4fMPXf1gvZHBMiW4Qbnzqvh/D9KY6mu7dzb9NOk6dmgorCa1aLGAhnZQW+wZJBkBSmrIDQug==
X-Received: by 2002:a67:ca98:0:b0:386:2789:bf91 with SMTP id
 a24-20020a67ca98000000b003862789bf91mr106328vsl.46.1659296162574; 
 Sun, 31 Jul 2022 12:36:02 -0700 (PDT)
Received: from localhost.localdomain ([191.187.223.18])
 by smtp.gmail.com with ESMTPSA id
 v5-20020a056102074500b0037ddf9489f2sm1418667vsg.13.2022.07.31.12.35.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jul 2022 12:36:00 -0700 (PDT)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 31 Jul 2022 16:35:13 -0300
Message-Id: <20220731193521.1217825-7-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
References: <20220731193521.1217825-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=sLqdgO5O8themBjIMC0Z7sGMwhz5PCaCJIKqiSYSZaE=;
 b=I82L9EBkLAuj+vzfwOtUrqi+5fGJhO/MEbtjw/HYbxrqn5MKx2zMLPZNdlOjazs2/i
 JOgeCldOs18g9T5hgvtjqdwu88WC2/8Pqnpvjeqj3mnxBnDcB6EoggjFgSA4GxktH38g
 iZtixrKcZoDVSkiUhYUdaBvcifqFJmjiHiJDe6uDXKgu5EcNAbBcEYz099ExXZDrsNAk
 ftiujVYNf2+ibV2wvnEnSpsxa0h6+Vc0cY5rRuXJafo1wr8CRDRKkwbCn/gJSR+CjRGb
 PLJ2qOEw4qPm5wILC1QZwdx7PaU3IqtVO/o+VN7xRv3yEezH1XW6oxt8ePpmSZbfWxqc
 aUtg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=I82L9EBk
Subject: [Buildroot] [PATCH v2 06/14] support/docker: add python3-magic
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It will be needed by check-package to run checks according to the file
type (the same determined by the command 'file').

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Changes v1 -> v2:
  - none

NOTE to the maintainer applying this patch: all patches after this in
the series assume this patch was applied, a new docker image was
generated and its version was updated in .gitlab.yml
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index f54c31b54a..d775ae23e1 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -39,6 +39,7 @@ RUN apt-get install -y --no-install-recommends \
         openssh-server \
         python3 \
         python3-flake8 \
+        python3-magic \
         python3-nose2 \
         python3-pexpect \
         python3-pytest \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
