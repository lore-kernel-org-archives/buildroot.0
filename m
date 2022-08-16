Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4CEC25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 14:40:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D62FA82ACA;
	Tue, 16 Aug 2022 14:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D62FA82ACA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CUQvsccDL0d6; Tue, 16 Aug 2022 14:40:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1762D82983;
	Tue, 16 Aug 2022 14:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1762D82983
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56FE41BF4D6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31CCF82983
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31CCF82983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YAVeSHp5hzgv for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 14:40:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C457081D4F
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C457081D4F
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 14:40:21 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 bd26-20020a05600c1f1a00b003a5e82a6474so3831624wmb.4
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 07:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=O5zyifV1nllqOYIFU/otJ9kQa8jEor/ouKh5CvcdaVw=;
 b=23r/yP6JQuKwmbOrDcTimgW89Vc1Yh8c4BDtjzUQMUqjoXYtNhBcd14zypfpsiAz0d
 wXsv1YZCPn/nNQ9d04Q4ZRZbIravcSzvBGq+PRlzT3wwOfy/jy/Wld4H7oc9KXdaw78+
 tckTaZoSbhqusTAjRBtvDy7Dpno0Obb7Ttn0kIU4OZHU1W63piiS4g8LecVZ3lWttP6b
 9sYktNBezgL5+NGj7Fs68agZnnOATALON90Yv+FR1ay6+7s48aujUTj/0j8yte2JrISo
 xvcYAZyfX6F5fZlgRMVn6njYOg1sjc59ucxPgIVZVe9EEtBNpSwS/ywYTyX1mphe46vf
 Nw1A==
X-Gm-Message-State: ACgBeo2/86uLj6X32r9QLLqHk1f3tTIWmMbMGc0sjaZB959oDb3fGIaj
 7b0HyxI9zff/sOqhx4PKOwjENfU3Blw=
X-Google-Smtp-Source: AA6agR75NotZ2OsC9aEBDDj7W21HbYMsOZPdQht+qQ331EepHyRiyr8QyCCv69H6XwQto8K7S1zBew==
X-Received: by 2002:a05:600c:1f11:b0:3a5:3df9:4859 with SMTP id
 bd17-20020a05600c1f1100b003a53df94859mr19176593wmb.175.1660660819816; 
 Tue, 16 Aug 2022 07:40:19 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b003a4c6e67f01sm13844300wms.6.2022.08.16.07.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 07:40:19 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 16 Aug 2022 16:39:39 +0200
Message-Id: <20220816143943.16142-3-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
References: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=O5zyifV1nllqOYIFU/otJ9kQa8jEor/ouKh5CvcdaVw=;
 b=ZOeVcktrU8dIYFUT+oq0XBvn3e9Vm7xMP1KLolyGkh4t8cjTYiiW1pBj/eZGMS8t0n
 seWt3vxjivKEN+uzHrl/ytI94MX+ms/ulKsPfrZhKlCJHdIZUsV51Ozbmm3c+0Iwm8Vk
 hEqVVuSHSajjmhqxZb1zobpCVrGInVHJdF7mP7CmwPcOjKf4U2YdE4AyxjqvJYuHODYF
 hWfg8/W6+hly9WuLbQTop0R57MaglJn0KUpllJoOD+2LT9ZlYjN5idMk/jhjGC+h5XXH
 RwJa+AlCDTQ+pnFv2JhrX3PGiNcceM8i4crbIyb0a3XbKNJOz2gehPwDO1zGW1byI2KM
 yIUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ZOeVcktr
Subject: [Buildroot] [PATCH v1 3/7] package/lapack: host-python-scipy needs
 host-lapack
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-python-scipy is a build time dependency of python-scikitlearn

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/lapack/lapack.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lapack/lapack.mk b/package/lapack/lapack.mk
index 3db2797202..dc7ce1cde0 100644
--- a/package/lapack/lapack.mk
+++ b/package/lapack/lapack.mk
@@ -28,3 +28,4 @@ LAPACK_CONF_OPTS += \
 endif
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
