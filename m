Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52342E9A03B
	for <buildroot@archiver.kernel.org>; Wed, 18 Feb 2026 06:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E56C5405AD;
	Wed, 18 Feb 2026 06:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRSwN_F8ryyE; Wed, 18 Feb 2026 06:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15746405BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771396293;
	bh=BDnRgWO4tlFe3ladpQX32bzlLdyFKpblIOHB3BvQVcQ=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZWNCo/LIK1C0vi/lFO9cL+izMpjZGTStRSEorplRREvPatN0UGFx7kHlKPeXFhh8v
	 idqUx2cUDsa7M0qZ1GkaVKMMYssYvJ7nVOo0CyKaCNJxCKXtahB86i41L3vEQMypV4
	 k6XQPDfTR//XfNZudJeleweqRXkO67HsK50Kdeqcs4tEayZqEr4SNlwhksWPaGRkf/
	 KPegg0KSruAcT9cEv3kapb5o297G0+9HUZn32t2Th8lIb77o8DQRfSkb72IYmZB6T5
	 5hZKEE6mwds+pKbAtB2hzz18E2gExToBIrEubvAFCXxtp9xUFZbtQtj98yw5NtMeLc
	 0ziucBv6HN3bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15746405BA;
	Wed, 18 Feb 2026 06:31:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CA0E1CE
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 06:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E8576074F
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 06:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGH4jW5_3zi1 for <buildroot@buildroot.org>;
 Wed, 18 Feb 2026 06:31:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A2CE6073D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A2CE6073D
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A2CE6073D
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 06:31:30 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-45f171cb842so364424b6e.1
 for <buildroot@buildroot.org>; Tue, 17 Feb 2026 22:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771396289; x=1772001089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=t4XS46x53oe6BULRrH0tKgFCPogcy4s9GDskYHn8txw=;
 b=ojzCUiWYrHl7roZvFT5p4Ez5CTF/0q0g7IMqtdsig+WnFS51NAzwnkFNmCtrd9TMfA
 Q2lFEu0UiSd/k4oHEx4H5/9LkJ3xhmZ/eJZRBqKn1Gbut2ngolWlOlLZMNNlnPTqLMhH
 PgJ7/Z+twDXQda/DOx5ypXb3SNmnLdvebEfQkG59bV4/OHnEK1B8xN4AMi7k4HSZa8zm
 5WUkt2a336XDJhmNBiF0Qx37wX7wgMMFrb/9eAzJQq26f+KIW3fkoljnyyyGrKoXIdnc
 zZEjTjmn2qySmr7G22ij+s9FQDoowwxW1NLccDPS/4M7ipetasApUYITqf1OE2jYkN5q
 cExA==
X-Gm-Message-State: AOJu0YwOY06bK+YnOlSqmsiG4ksQqqfX48slLhu2l8nmw2r3D/Qxp90a
 an1y2ZWqUquTEIrSPardNc4hKihHwwOczZOQ33unZJZnGOdooovDJdmSNpIIkHM3
X-Gm-Gg: AZuq6aLyebSa8coNtjJh7yBSkh4BZTcyKPXoI4wlpCnFQsx+3F9hlY/l/embFcE4f7F
 kqVi2NXhbI7SE7kaQHt/ZiqrhUgGe822fk2FthbspFL6n+/TnHc1YD2HZtnrcZDVv3XZHdrT8SJ
 Ke4HjBBUjKLE3/vFBhH7rY4xAmT0On7DqmFLZB/HRlmqS1fDY+yrTGx2gCc5XAWtzoZzlWR7ErF
 c5nztK6yg42bECFp1LwW0GULcT8YwIohJ3hrwpjPAeutiMeiNgXvNT0Iji1IDglb1uoUVrXkbrF
 cBbqe6dcHQrs1odIGQInR99ox8ZyP3yIeyrCUtbwOVnI2gCx+yM/NijYTVF92i3x8wYpO/HRhDK
 YupNW0Huv3SXQQn9eukIdJ/S5rVLo8/sUr+fKEXbqqOt2X1vQct51HcB8w1hzz3PSyiyPic6oze
 H9LtSRzFxJlmyif0FO3/pJ/oxur3kIcDUD96js3Kf+FRLPnWuQESyxihNYT2wt5Kqd8I6TWq/Ft
 PEsk4Mwjyiw2wrDQaBZdh/VVYnXALDeU7C2gjSo9VDz2BmeyQ9ZoS/Tdxy/
X-Received: by 2002:a05:6808:f15:b0:45e:fd68:3dd7 with SMTP id
 5614622812f47-46410c8f0e9mr462752b6e.32.1771396289007; 
 Tue, 17 Feb 2026 22:31:29 -0800 (PST)
Received: from james-x399.localdomain (71-33-158-51.hlrn.qwest.net.
 [71.33.158.51]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7d4c22d11a3sm12444701a34.6.2026.02.17.22.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 22:31:28 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>, Bernd Kuhls <bernd@kuhls.net>,
 Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 17 Feb 2026 23:31:23 -0700
Message-ID: <20260218063123.546067-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260218063123.546067-1-james.hilliard1@gmail.com>
References: <20260218063123.546067-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771396289; x=1772001089; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t4XS46x53oe6BULRrH0tKgFCPogcy4s9GDskYHn8txw=;
 b=QDnzEH0K9NyELdCS/Utaya0zxSRKsdUP9lr9wtb6WjuYxZk1jHtXapM1+ixkTZ0VCq
 cS+h7xmomshjrwV/u/rAHyssyG4JbEQtH/pYVwQoV2iF02H0BG2ymXdiyFgvb1M2NFFr
 e4DcSSPHsWcorQuB1a6F3xQw4NDHkdQdhUeBQrAyUe9JMz4pTGo0u4y78K2/10XkL/YW
 aoGzAsIi0tbNCNEvmlNfDSKTu5igM+yL4ZPvDisnier6uckejUcNmJNUL1fvEB5rZERC
 +MRJ2izR7PAohrXIIOOM8DXk4D/VW9YtLSILtSNn7Zvk9rLk6aBx+t5TLYhYLDxFRrW1
 v4xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QDnzEH0K
Subject: [Buildroot] [PATCH 2/2] package/wpebackend-fdo: fix
 EGL_NOT_INITIALIZED crash
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 4cd4b2e1e6e8816555db38771d18daad46df3a6c updated mesa3d
past version 25.2.0 which deprecated the legacy wayland
EGL_WL_bind_wayland_display interface, as wpebackend-fdo
currently still relies on this functionality ensure that we
enable EGL_WL_bind_wayland_display in mesa3d.

Fixes:
 - https://lore.kernel.org/all/CADvTj4pYf0uymrkZUuWgahWK=pm5CgTJL5U+gwbwKExK1so5jA@mail.gmail.com/

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/wpebackend-fdo/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/wpebackend-fdo/Config.in b/package/wpebackend-fdo/Config.in
index 9b4dd28741..bd0ab5421e 100644
--- a/package/wpebackend-fdo/Config.in
+++ b/package/wpebackend-fdo/Config.in
@@ -14,6 +14,7 @@ config BR2_PACKAGE_WPEBACKEND_FDO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBWPE
 	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_MESA3D_LEGACY_BIND_WAYLAND_DISPLAY if BR2_PACKAGE_MESA3D
 	help
 	  WPEBackend interface using freedesktop.org API.
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
