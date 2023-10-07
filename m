Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CDDE95A65
	for <buildroot@archiver.kernel.org>; Sat,  7 Oct 2023 18:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D84A441D9F;
	Sat,  7 Oct 2023 18:19:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D84A441D9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6kyq_suNhZSz; Sat,  7 Oct 2023 18:19:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFA0F41DCE;
	Sat,  7 Oct 2023 18:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFA0F41DCE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94E861BF401
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 18:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E3A283C9B
 for <buildroot@lists.busybox.net>; Sat,  7 Oct 2023 18:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E3A283C9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XZKuCvE1A51 for <buildroot@lists.busybox.net>;
 Sat,  7 Oct 2023 18:19:37 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C1CA83C98
 for <buildroot@buildroot.org>; Sat,  7 Oct 2023 18:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C1CA83C98
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-406618d0991so29047585e9.2
 for <buildroot@buildroot.org>; Sat, 07 Oct 2023 11:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696702775; x=1697307575;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yERto+pI3+ZP8278EB7XiCSQjJpuQglnhBntHLZ6eDM=;
 b=rVGfx0BaXeF3DNuqw6GETx0sd8AcbfEV4qilZrB1LYTOgfALgglFgKKU43alTj8c7Q
 zhqZ4hNpHpVVF9St2SLyNOe01KnDxL9c0Z/wBeaGdKWoQwVMQEvketpyLZyyecxZ7gLU
 wdufyN0DmfVWp0kuGrW55VjzNsx96o+sVzinl/9RUJi7QVofWFZBNa2H0vB7HmY5rtob
 +zCTlaDPqa0gPpZrmwV5rcClyZVQHie2SysE6J29Gt0i8fk2Gq5x/xRitmic2OdBQwao
 gAgtiRI15mmUech50rXbLwySljbAr/odcAZcs/CTKc3LBr+qsBEx5efVAWMNRvdjqcQf
 6dXQ==
X-Gm-Message-State: AOJu0YzjI/gBxwtMb3YJb4DK8BvFGwUY8mwMlw6RdueVNo66ET5nqvI3
 TAmBeWv9mJXRw4eHT8uft/sKoLPYpoJMUtQTCQXt8g==
X-Google-Smtp-Source: AGHT+IHAyuLp+9A+/+Y2x39PhcXWNahD4WlCDGFyDAJj+IA9D6qJhoYRluWrVyPg3RepOOqr+DHBug==
X-Received: by 2002:a5d:6e85:0:b0:323:10b8:543e with SMTP id
 k5-20020a5d6e85000000b0032310b8543emr9736849wrz.49.1696702774411; 
 Sat, 07 Oct 2023 11:19:34 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 r18-20020adfe692000000b0031912c0ffebsm4842870wrm.23.2023.10.07.11.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Oct 2023 11:19:34 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat,  7 Oct 2023 20:19:25 +0200
Message-ID: <20231007181926.7115-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696702775; x=1697307575;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yERto+pI3+ZP8278EB7XiCSQjJpuQglnhBntHLZ6eDM=;
 b=fGB8I6t0SHKqovDcmd2VKSF9S+S7RXIoz+E9B/SS9CCJiqGXVtNVwvjbf9R1S8qjpG
 3g8W1IYsaZMOV17E6/oxV+m4FDzlO8wD/R/ghKXpD0hWMZgSlIPFxpJsXfktgVt8VzJv
 PW2uktN+M+yuTMdvWVYG2CMBW8/Ipsde0yibk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fGB8I6t0
Subject: [Buildroot] [PATCH v2 1/2] package/refpolicy/Config.in: force
 merged usr when selecting upstream
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
Cc: Antoine Tenart <atenart@kernel.org>,
 Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Refpolicy contexts expect a merged /usr file system. In fact, there
are no references to /bin, /sbin, /lib, or /lib64 at all. However, if a user
wants to go through the trouble of creating a policy that works with a
non-merged system, they should be free to do so. As such, only select
BR2_ROOTFS_MERGED_USR if using BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/refpolicy/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 0e72b895df..f1f3c7e64d 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -36,6 +36,7 @@ choice
 
 config BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
 	bool "Upstream version"
+	select BR2_ROOTFS_MERGED_USR
 	help
 	  Use the refpolicy as provided by Buildroot.
 
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
