Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84DFC3DA6E
	for <buildroot@archiver.kernel.org>; Thu, 21 Dec 2023 00:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85C1A42131;
	Thu, 21 Dec 2023 00:21:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85C1A42131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1cRmdV4WtSx; Thu, 21 Dec 2023 00:21:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFA95421CE;
	Thu, 21 Dec 2023 00:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFA95421CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADEF51BF408
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8327B42124
 for <buildroot@lists.busybox.net>; Thu, 21 Dec 2023 00:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8327B42124
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y_51ZD6K8pYI for <buildroot@lists.busybox.net>;
 Thu, 21 Dec 2023 00:19:40 +0000 (UTC)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9FE5F42117
 for <buildroot@buildroot.org>; Thu, 21 Dec 2023 00:19:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FE5F42117
Received: by mail-il1-x12a.google.com with SMTP id
 e9e14a558f8ab-35f7589ea1fso989275ab.1
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 16:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703117979; x=1703722779;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cOjYf9LtQaqBu3JuU4NlwC/OYMpYjbPqKNoRhk5/oGQ=;
 b=QEghDFRDQplug1V+PuxXt5b6SjeQHPhvJgNrpmvz1xBz0GC/rQ7a+ze6puQzXoVhwv
 yDQxls+RXsVZdF1rvZ7AEUSYVaB6y+8hFldR5doW9hMFJVN3x/FJantjg9Ri1Z1NSDAm
 IpCHyJ3JS35uvrJFMenNU39RznXXI1mH5paIIWAXDo18jmshYmk/Ln7iIrIYCsRWWWOG
 Em77yivRonQhG4jxyvsE7xpODQGlQJCO0ReFt8UkFsvs3kY8J/XDh4R9lo6Si40agmkq
 DzSTyGzW5U7WLL2bDPTYTRLLlSPMZHpCG+T/Wy9NqHi1abXxchAX0G3cHSHY9sKEDH30
 rgGg==
X-Gm-Message-State: AOJu0YwPC8+TNxjSFlKomx9q2cjDEH8nSEAVAK8Cl2R8817Vk2A8W6kj
 wTxZRt1y++YyxMIjCeR1I4Ovo+1ekx1LHzU506Y=
X-Google-Smtp-Source: AGHT+IGrTwKNkDgvQ7LONVTNDHrFAaFefaocXdw5wdVrYfI+pUVYFDUaLttD4S7bUSnRa4oKQIuKgQ==
X-Received: by 2002:a05:6e02:1baf:b0:35f:c963:7366 with SMTP id
 n15-20020a056e021baf00b0035fc9637366mr2651851ili.37.1703117979036; 
 Wed, 20 Dec 2023 16:19:39 -0800 (PST)
Received: from DESKTOP-OI0KN2B.ht.home (174-126-58-188.cpe.sparklight.net.
 [174.126.58.188]) by smtp.gmail.com with ESMTPSA id
 a5-20020a170902ecc500b001d364210979sm294459plh.224.2023.12.20.16.19.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Dec 2023 16:19:38 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 20 Dec 2023 17:19:24 -0700
Message-ID: <20231221001924.1356215-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
References: <20231221001924.1356215-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1703117979; x=1703722779;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cOjYf9LtQaqBu3JuU4NlwC/OYMpYjbPqKNoRhk5/oGQ=;
 b=d2fpKVCM56gxqSnVXz8DGsKZlYMceK35n56mdrovsMCUfSSCXeHikeGbm4TYduMWRr
 4GUxohFDkAOG5qcLM2TvBLrNNk+natVTC8SRIa8CLpVcD/JNu97eKa2PfbNycQdad17K
 sMfuFW4sKvKttyMmSeMdNyPB0+tAGqfc1G2sI=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=d2fpKVCM
Subject: [Buildroot] [PATCH v3 10/10] package/sway/Config.in: Add a help
 note about the default terminal
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The default terminal used by sway is the foot terminal. Add a note in
the Config.in explaining that if a user is using the default sway config,
it is recommended to also enable the foot package.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/sway/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/sway/Config.in b/package/sway/Config.in
index 926128193c..7e723bbf97 100644
--- a/package/sway/Config.in
+++ b/package/sway/Config.in
@@ -21,6 +21,10 @@ config BR2_PACKAGE_SWAY
 	select BR2_PACKAGE_XKEYBOARD_CONFIG # runtime
 	help
 	  i3-compatible Wayland compositor
+	  Note:
+	    The default sway config uses the foot package as the
+	    default terminal. If you plan on using the default
+	    config, it is recommended to select the foot package!
 
 	  https://github.com/swaywm/sway
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
