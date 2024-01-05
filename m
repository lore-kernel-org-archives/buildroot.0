Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B34C3DA6E
	for <buildroot@archiver.kernel.org>; Fri,  5 Jan 2024 13:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D86A783D4D;
	Fri,  5 Jan 2024 13:29:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D86A783D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e0HrGHMqcain; Fri,  5 Jan 2024 13:29:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 479BE83DA2;
	Fri,  5 Jan 2024 13:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 479BE83DA2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA6251BF841
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A26A7436F6
 for <buildroot@lists.busybox.net>; Fri,  5 Jan 2024 13:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A26A7436F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vdpPxMoVq8X6 for <buildroot@lists.busybox.net>;
 Fri,  5 Jan 2024 13:29:40 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEDF0436D8
 for <buildroot@buildroot.org>; Fri,  5 Jan 2024 13:29:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEDF0436D8
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40d5d898162so11788865e9.3
 for <buildroot@buildroot.org>; Fri, 05 Jan 2024 05:29:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704461377; x=1705066177;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ezqx+ler1wwlKTh/ZMW5ce0BdG7sgthRlaBm33+xizM=;
 b=Gf+E36xaWiJ4ScLG/SH3PJ4hhWxHmYSPRQ7pnRmr/dm8lQKFhdz55+ykxUNkUO0MJk
 +9u/BB46Uup3OVp7fm9+cLVUGxRnfocaIVxdKzTAnJUoHbBu0ekKesosBhMcn4fln1eV
 g6ArIhonxVIhtZcEL06jwq4alpEFwI47MF/FxUYFrGn7Nmr401Hz2rJHQ/V6DBhNm+dp
 Ygm9mxI+oSKIyEUtU+tQhPOWNXFCJ1MfC1b6GGOV9owBbTmhi10hAMrYnvwwBijlLZoG
 kRp7fTxF64FlFUhn/USGr8xRtBSwpVuxAkRaJKNXR9tRI8B53hK3MPreme+7YlW0zdzN
 jCdA==
X-Gm-Message-State: AOJu0Yxm2fiSrjspGri6UNkax9qWIDaFQEnh5C6rw8rOmfwp9zFcuCNi
 ynNxp+WM5ZCcYfwtCYp+xHhHjybQ3ms=
X-Google-Smtp-Source: AGHT+IFxQlwE+tOJt0+pEK4fUHXIzOoyDeQzWVVxlh7PcYYs/55g+WayMRWmduMxdSP4HWsPfMhYSw==
X-Received: by 2002:a05:600c:4e88:b0:40e:39cb:f258 with SMTP id
 f8-20020a05600c4e8800b0040e39cbf258mr371196wmq.111.1704461377048; 
 Fri, 05 Jan 2024 05:29:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 k4-20020adfe3c4000000b00336e15fbc85sm1398026wrm.82.2024.01.05.05.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 05:29:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Jan 2024 14:29:34 +0100
Message-ID: <20240105132934.508661-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704461377; x=1705066177; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ezqx+ler1wwlKTh/ZMW5ce0BdG7sgthRlaBm33+xizM=;
 b=ahcUMldH14gcWzLTQ9nZ+iIZxuJNEkjXxyb+SLclO32aJLFT3Wh4pib9uQQRgseKKQ
 d/oKZOO1pngyy5ZEO7pwK+Ui4IolHWnDlnKth3DDulxfGiQX1xSfG/tpTaxpGJN57ntX
 BS6iuDAnbnw6XOS+51Hw0jDM8BHKLwh4ca0vtkBaO+4DPUnMSJUTUUmAI8swYaYhLQC0
 LazQ2zzmXLv5jBr5Ene/dKD9FSHfTqLGC41bZjZMyAqJCWx0Cn9CT/jM9d4spRiY/qoo
 3gGmK/wsAfxlg2v6p31lyFjlGk4RPrdjs2PBPCQob9ovJIpqSWPTaMwwM6R6T9cLOQ2I
 x0wQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ahcUMldH
Subject: [Buildroot] [PATCH 1/1] package/gdal: add libcurl optional
 dependency
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
Cc: Dominik Michael Rauh <dmrauh@posteo.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gdal/gdal.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
index e9dcc826b5..937e28ba20 100644
--- a/package/gdal/gdal.mk
+++ b/package/gdal/gdal.mk
@@ -49,7 +49,6 @@ GDAL_CONF_OPTS = \
 	-DGDAL_USE_OPENSSL=OFF \
 	-DGDAL_USE_CRYPTOPP=OFF \
 	-DGDAL_USE_CRNLIB=OFF \
-	-DGDAL_USE_CURL=OFF \
 	-DGDAL_USE_ECW=OFF \
 	-DGDAL_USE_FILEGDB=OFF \
 	-DGDAL_USE_FREEXL=OFF \
@@ -112,6 +111,13 @@ else
 GDAL_CONF_OPTS += -DGDAL_USE_EXPAT=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+GDAL_DEPENDENCIES += libcurl
+GDAL_CONF_OPTS += -DGDAL_USE_CURL=ON
+else
+GDAL_CONF_OPTS += -DGDAL_USE_CURL=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 GDAL_DEPENDENCIES += libxml2
 GDAL_CONF_OPTS += -DGDAL_USE_LIBXML2=ON
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
