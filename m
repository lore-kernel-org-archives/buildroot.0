Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D06CC433EF
	for <buildroot@archiver.kernel.org>; Fri, 20 May 2022 22:29:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93F49426B1;
	Fri, 20 May 2022 22:29:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3LjA_LtNSVgF; Fri, 20 May 2022 22:29:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68584426A8;
	Fri, 20 May 2022 22:29:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AFB71BF33B
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 22:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 87FCF847C2
 for <buildroot@lists.busybox.net>; Fri, 20 May 2022 22:29:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xPFOvkMlxtSq for <buildroot@lists.busybox.net>;
 Fri, 20 May 2022 22:29:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 737A9847C1
 for <buildroot@buildroot.org>; Fri, 20 May 2022 22:29:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id j25so13187584wrc.9
 for <buildroot@buildroot.org>; Fri, 20 May 2022 15:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6xcvmO58zuOvUW89kmBYnihjRyQFvp1xFQzMgwihI1k=;
 b=N4YUNPox1yx7pZkGyiirXUStNPbjYIeV0kPB9UaFzawbV29qnyGeDLHeDu6NZW0gly
 oQXP0HwTnNJrG4cTTR+yKuR3vWgmSyyR5rLZd9EStTBVbFETGHym1qB0oUQl2Q/s4kMq
 0TMk5FSFB+hMgL8dzPfil8CyaRafQnXSgL+dPSLECIDrDAf+smCCd+s+L4dXQ6pHRULr
 qBZHAkjs2Lblzde16TQIBJq3bfvEBJ1VClQhGrDAPNCaRdzI29EEviElNUiiE3lcRqsB
 BxND/xYxy6ELE3d/3gZ7SjoBCHnQxAf2J/xFW6eQf786E6dLuZr0NxpMQuBpEh9u1TkZ
 HD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6xcvmO58zuOvUW89kmBYnihjRyQFvp1xFQzMgwihI1k=;
 b=R6de9u5DCpErj2hHz9pyWFaNoFXacCDyJtszqV+7SRpJLi0MTJ7+I7jq33yZZrYm8r
 MJe3P8guDzcvHqB+1y0G4B0398GyUiQlKxBiIvewGvIFYbjCHyFK0Tt7yQGuApX/goLz
 iG/BItgLroAiyjwV0bYp1jCMjT2xLO9Y5MWJiMqsQqUrPa6Mt5C4xI7fxXRhaLo4y0gO
 0kQ5+LdTpNpwwwYRFAbkGchzRKA274tSzEvW2cmbcIqJJ/UpECI0ykRBsM5SGrGwBvi+
 HqtHowQ/8mpP0MeEqU7EfcOjq7hIho7h77UwMO6c0Iy4ATJLyz24XcAcE0HDWc2fhBDw
 bSMw==
X-Gm-Message-State: AOAM5330a9joJkathJjEGfBaQpup6IwIN13oBwPSGER7AYgsQQb+6V6s
 u/dHvS+e3CRPe0rAfhBR06+NxvkfEEg=
X-Google-Smtp-Source: ABdhPJwlRfnUq4ITcomLyU0t6FRXwClqgCY3GF532g6CuN8VLzxwTam43hoB2V+kS9RpSBLY617Q9Q==
X-Received: by 2002:a05:6000:1f99:b0:20e:61f4:91e4 with SMTP id
 bw25-20020a0560001f9900b0020e61f491e4mr9998109wrb.425.1653085781273; 
 Fri, 20 May 2022 15:29:41 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a05600c35cf00b003970b2fa72dsm3060837wmq.22.2022.05.20.15.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 15:29:40 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 May 2022 00:27:13 +0200
Message-Id: <20220520222713.2036389-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libcec: drop unrecognized option
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

HAVE_DATE_BIN has been dropped since version 4.0.5 and
https://github.com/Pulse-Eight/libcec/commit/d04037825e8c49075ddd3ae6f8f0b94a0fef2709

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libcec/libcec.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 8b5d70d008..33e0463eb8 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -39,7 +39,6 @@ endif
 
 # Disable information about how libCEC is compiled.
 LIBCEC_CONF_OPTS += -DHAVE_GIT_BIN="" \
-	-DHAVE_DATE_BIN="" \
 	-DHAVE_WHOAMI_BIN="" \
 	-DHAVE_HOSTNAME_BIN="" \
 	-DHAVE_UNAME_BIN=""
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
