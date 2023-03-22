Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AEFC6FD1F
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 23:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF26941C82;
	Wed, 22 Mar 2023 23:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF26941C82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8RzaMfHUxYf; Wed, 22 Mar 2023 23:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4BC7740576;
	Wed, 22 Mar 2023 23:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4BC7740576
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 470811BF488
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 23:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 205AB40576
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 23:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 205AB40576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dd9Zfn6my3eN for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 23:15:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 521DC40191
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 521DC40191
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 23:15:00 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id bo10so14936509oib.11
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 16:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679526899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iEwLbU9Rk5rEIqcrdSmbAW2KFTQPmd318DY18FR/cJs=;
 b=6kt7YYHNBx+lyG/YP45qukZzo9ZwwYqy3amNyQsOuqPtyzuNIQi2uSLRIlJAtGvTEf
 kzrIZHd9q6Hp/QiwG4Y/Mi3JiOIFdHLG0ikTUz6oMjQ8KD/svaxJMd6EqnLrp995l55L
 3eG0D+/JeDAnS5uVsZQsyaUkl+GWOUecmSm7/0GxYv4ARnmmdsISJVUCbHB0PTSiV0Vb
 pn95kd7Kxzt7hLlbSoMs7UGzjXt1H49qzHS7CuNPrTXqal2cIifIR/SwsWa2C90/gPD/
 Qc+ZmnVq20TSEkeOK1GxnU+oJaWKrjjr/JArUvFrtjKfbFlcdAYfL9ERECuumAnjhgsJ
 4y7g==
X-Gm-Message-State: AO0yUKUNnLxOKcHl2pFthpvqA2YMSmGE1HAuP2IL8nOGFNSkS3kawxkk
 Q1Df5JV3tOYFWa68VYYkAUbRVvABGuI=
X-Google-Smtp-Source: AK7set+feqSKBJSwrMgKwY9czw4eFwRO9GKBylOlQfflraReO4ZCxSpr1vdllmefyWfp1ZhQ5YqOYQ==
X-Received: by 2002:a05:6808:19a8:b0:387:36c9:fffa with SMTP id
 bj40-20020a05680819a800b0038736c9fffamr2464713oib.33.1679526899195; 
 Wed, 22 Mar 2023 16:14:59 -0700 (PDT)
Received: from casantos.remote.csb ([177.158.139.132])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a0568301e3000b0069f9209c84dsm1871035otr.60.2023.03.22.16.14.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Mar 2023 16:14:58 -0700 (PDT)
From: unixmania@gmail.com
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 20:14:53 -0300
Message-Id: <20230322231453.551305-1-unixmania@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679526899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iEwLbU9Rk5rEIqcrdSmbAW2KFTQPmd318DY18FR/cJs=;
 b=RcPk1+XYIAY+K8NGynsoxqRUlU9QQ2GjaVj0+i9Adp3ibZzAV2LQWX7V8d9AQNXwki
 LORseYTR8AqW3UgjlIi7qc3zs/CkZESMzKDzbP2zLTh5oyYAWWLKyp1EtUlGQxHPcst4
 mlRO8f4uw2+YnLsP4GTlESfJAXV4EbK7Zb0/5Qt+sU8N6aYd5wlI5k45xsKeLROor6uT
 nR4i6NOnBAqwIEu/O9ZOWod7pJkqu4dvsZyoscEugXnL4tNHnUUAj/IkUzigV6H6Q/9N
 BvzTXEh5RpzzaY3bslGY1SU7JdnHEIWQ7Dc/ewPazNrZ6FiZe5SHip5UbOPNCqkn9VBp
 r6NQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RcPk1+XY
Subject: [Buildroot] [PATCH] package/qemu: do not build the guest agent for
 the host
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
Cc: Carlos Santos <unixmania@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Carlos Santos <unixmania@gmail.com>

It does not make sense to build it for the host.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/qemu/qemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index 4194670bb0..cdc1785375 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -486,6 +486,7 @@ define HOST_QEMU_CONFIGURE_CMDS
 		--disable-vnc-sasl \
 		--enable-slirp \
 		--enable-tools \
+		--disable-guest-agent \
 		$(HOST_QEMU_OPTS)
 endef
 
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
