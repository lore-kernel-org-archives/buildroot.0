Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FD7CA0FF5
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 13:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CA7181EF8;
	Fri, 30 Aug 2024 13:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LtL8gUmXtbrK; Fri, 30 Aug 2024 13:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1738784166
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1738784166;
	Fri, 30 Aug 2024 13:55:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5DB1BF5B3
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 13:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39C5542462
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 13:55:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K0lVFV79vjfB for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 13:55:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12f; helo=mail-lf1-x12f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1F694245F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1F694245F
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1F694245F
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 13:55:54 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-53346132365so2339597e87.1
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 06:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725026153; x=1725630953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fYyBOegYLJgKEPS4VWgJgHpm6o0OAzjqrd5R/pjucto=;
 b=SEve2UkXq6eWKyLmcCj21aDcycTLlEbHa5GNWzeJGKe3IM/ziyKfhpOwgA/sN4ZeAK
 C1MtjZINXzdtoWqIaV10R1cbyiaNZr2RWSkYubJvuTZ28vprbVLt6iAIoXshF2URSTew
 pxYZLUzMgM5MeulDUs1HJErQIreFeIW5iJrohESe6YdO2NgqHjSQw7h8FlZ/jLUQvxPa
 L1d9FZ21rtg+8ZJhXrL+fxXWX4VeJqExOv514lWhRwmznSh/U43O/jEXW3RWB92GXP/b
 2HJNsTgW2Pm5TchjrqwNoL7JUrhECX/AbFm6iGVBzGOhe3qcuCpPpPIRPxQNvuU+vTCn
 QxWA==
X-Gm-Message-State: AOJu0YymiPTqkEiVnB+KdddQzbmiG2en3qkRUq8KqFsb+3RQEd2Ox5Mq
 Wd3UCtFOii+r3MX+rySOPWrvJHc/YngSSziIvO352F9kkOlOaYjFgdKgBA==
X-Google-Smtp-Source: AGHT+IGWRIem7BWQBIiFOdEKNlK2JpFRm+JRrn5D6Tflqz3NHQ0utcRLQHnHzFyboCrvKAJ1hmHxVQ==
X-Received: by 2002:a05:6512:3a8d:b0:530:ab86:1e with SMTP id
 2adb3069b0e04-53546afa9f6mr1926007e87.6.1725026151828; 
 Fri, 30 Aug 2024 06:55:51 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354079bc53sm618931e87.35.2024.08.30.06.55.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 06:55:51 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 15:55:45 +0200
Message-ID: <20240830135546.906135-1-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725026153; x=1725630953; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fYyBOegYLJgKEPS4VWgJgHpm6o0OAzjqrd5R/pjucto=;
 b=UGYOk0b9pzbD2COgHdXtKQfIa0mK/kwXkf91y7/Yy4rp4AB0I7BW09BQnU20S8ZUcE
 JAP9ZkVwnQtEZ2SxPLFDqLgqwHuFzNCF3BWmlDq4Aku1zUIM5H4BGazPY3dQNcTyGpH0
 s/PgR5WcnH78fT5VTbdw4KQLCws9Iw22PSrNqEsiiSDdGuDHb89fDKly4KwQcJutczjv
 Ni9E/sY7uyQ5HsKS+vTN+CUt9imv1UqELWI70gimsDB5BBSbyPShF5nAuBA335PTR8TN
 5kabuW3l/mOUdjeuOxi3t4eegKNJhnpqzrff/XYVeOMJh7olwX0z4Os/xA6OKRiep7HS
 VZ5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=UGYOk0b9
Subject: [Buildroot] [PATCH 1/1] docs/manual: fix description of how to
 reply to <message-id>
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
Cc: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Patch v1 not set to 'superseded' when replying to <message-id> with v2.

I'm using git version 2.46.0. The manual says the following is the
correct way to use the '--in-reply-to' option:

git send-email --in-reply-to=<message-id>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 docs/manual/contribute.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index fe3ae963a5..ffaff6f857 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -517,7 +517,7 @@ address you register in
 https://patchwork.ozlabs.org/project/buildroot/list/[patchwork] should
 match the one you use for sending patches to the mailing list.
 
-You can also add the +--in-reply-to <message-id>+ option when
+You can also add the +--in-reply-to=<message-id>+ option when
 submitting a patch to the mailing list. The id of the mail to reply to
 can be found under the "Message Id" tag on
 https://patchwork.ozlabs.org/project/buildroot/list/[patchwork]. The
-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
