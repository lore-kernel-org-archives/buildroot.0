Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C6FC531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 06:51:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1F5280C76;
	Mon, 27 Jul 2026 06:51:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XIz7t96Kphaw; Mon, 27 Jul 2026 06:51:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6487780B1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785135077;
	bh=YwDjkYDlvrvykbNceBjc4trhx8uH6IOzWFQgC8L3xTw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oSwMmvwOndWZEETPZ9QbDG52ed6LVys+1nnjeW9pbulnH+FVTI9CmNUVT8elOVz8n
	 koW053uDaS9/4ohdT5LM+frdpyC9SxW5NXsC6E1DB2DIFpH0+FuIRFW0ED0vSpA7JA
	 lXp/wZ/ehafwrQQMFNx0itp8zESRbZMC4Y8svc2bKhzKXbJ80fXoyenxBAYUcuqspa
	 WydiLB8y1YpV/7DiawYIPZuWBELGpP5V3SwiHkz2RkwTeyV6VtmSsoAT1X5ChJY5dl
	 xmslOloHfITmFKtMqa/9ztVyh7MdtOsWq4MdqwR+cnAlbDFqS/kTP/cmX6wtUT0OSL
	 zUH/QKE+AwF9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6487780B1E;
	Mon, 27 Jul 2026 06:51:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BEE68490
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 06:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B0C180B1E
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 06:51:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WQxp3ZRsDhYB for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 06:51:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 69E8780A9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69E8780A9B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 69E8780A9B
 for <buildroot@busybox.net>; Mon, 27 Jul 2026 06:51:15 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4956242332dso20643795e9.2
 for <buildroot@busybox.net>; Sun, 26 Jul 2026 23:51:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785135073; x=1785739873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=i92TLlYQMI+5m5MvYQQXgnjh+q0QvxQy/n5WwFCkr+M=;
 b=ogEfXQThPbDV9KKn4NHkHtbZBZR+jX2+BzG5zcOMv1XZmIHtXu4+havHUTo92K7T/e
 qPmZoO0FSnR9cevowYNFI1Mtso+OP5ChaVTUoDU2ZbW7Pzy9otwYkwEK5ErsOvMYOcEl
 YaXvmY9s98RplvKhNMPtDrZ0WxfTSHrvknpGq12LquQXbdbgQkeqqhx2fIumSwGiZJ9C
 HMrJhgaXHZDgYD04nESyrHOha0wvUHejP5a26n5TSlECtBZzZT5NlIcHKWXyUj+xE/WI
 c6gkz/ZMmCkVf2LiAKvKS5sIRcl1W6PI9h/uv+w0Yf0lTcIQHy08ZftEFIE+sPTNF6XD
 rAPQ==
X-Gm-Message-State: AOJu0Yw7WRtfM7wngMRlgrz67soIVu5dUqbYJAq2jSOwwbFtS7dTcMoV
 xOXgDZt0ZX6UE/oygudDd23AYiqaerjLzv7WzYH6kRCNFMlfoHfznITIWpOSOA==
X-Gm-Gg: AR+sD13Dy8WGo92bS1NzZ/0cIiqGi+RLkFl2DROF4R+Kpd79CNPMOmuf0gkNUHgNdbR
 TqA19pFwlcL5AtBoBXkEHpRu/PnLwvl7+tI2ih6tH+fnSYj1Hb8quvhadq6R6YFXeQq80iVqVnp
 hsqdw0dbvYMSJRLalHJRkBQtXWS5N5hAcW4oqutZcSOLFtJLXQOu8iCoFaUuXEG6KpxPcJpjBPc
 AE8BBBK/aL4B06jI97uvyFIuXVuS4LRewyGQ4lM8jHUoA5D1lqf0ox1Va6AVkyLq/CFG6D7dwKu
 KUxpD/V5jk58tO4dgjICCeKcbDfKiVHaW97iJvn4H8n7IiQ/vi0Zci3OiMi8kjH0HzzBXw5ZWPb
 lDvbDwDYqiiaLBuWuKrXGroVzsVVbA/OlTP0swNFxoJrCbKPfYoxsEW/TsCjXw1rmZgipMrFmpx
 dR3xCxZufFJOmuHoDXaxcLCzjRB3tOsHvRALM=
X-Received: by 2002:a05:600c:1387:b0:495:5b4a:53b7 with SMTP id
 5b1f17b1804b1-496bd695ff4mr47366125e9.19.1785135072869; 
 Sun, 26 Jul 2026 23:51:12 -0700 (PDT)
Received: from vm-2404.. (132.187.66.37.rev.sfr.net. [37.66.187.132])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-496b4858e28sm221518295e9.2.2026.07.26.23.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2026 23:51:12 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 27 Jul 2026 08:51:07 +0200
Message-ID: <20260727065108.409958-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785135073; x=1785739873; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=i92TLlYQMI+5m5MvYQQXgnjh+q0QvxQy/n5WwFCkr+M=;
 b=GHMAomcrEH0JyHXgMGIJDypm2Rno9vyOapW+e55MurGtY5X/qW+YQAktROlqjs5AZJ
 OjDBHek6LcAsGwV/DqYQBG5a+D4x2kGF8s5F3VDp4D/E6jezxUP+o7JWJW5Xc9tIBktu
 TBbFuf0EeabXHnSxwFh3nGsEzi3gEWyivS3mvUR46icScm7V73p8r1Ar5aFtxMl5sTfH
 svz5nO822f2WJqN9svKerunAMyGoDaQ+hpACLlycLVG1qt2anZMVItFAl0Qg9jglImyb
 5cONyPMQq2i2UacktWeQsMry7xL6D6wkLOFK5RKqHbuLvNIuLdxuhLu59G+Dsh7g17z8
 Z71A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=GHMAomcr
Subject: [Buildroot] [PATCH] package/lua-lyaml: bump to version 6.2.9
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

diff LICENSE: update copyright years
    -Copyright (C) 2013-2022 Gary V. Vaughan
    +Copyright (C) 2013-2026 Gary V. Vaughan

for changelog, see:
https://github.com/gvvaughan/lyaml/releases

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/lua-lyaml/lua-lyaml.hash | 4 ++--
 package/lua-lyaml/lua-lyaml.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-lyaml/lua-lyaml.hash b/package/lua-lyaml/lua-lyaml.hash
index a8599bc3d..49c98d980 100644
--- a/package/lua-lyaml/lua-lyaml.hash
+++ b/package/lua-lyaml/lua-lyaml.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  c6169f516ff2a8da96d55aa3a087e718edf7bceb2f1cae2def4e65cd2b41ac2d  lua-lyaml-6.2.8.tar.gz
-sha256  796d267e51d61652c55694d21108e7352e98b1ed489ab7516acc07102157e08d  LICENSE
+sha256  515e81d21903c1e428b017f2fe9dffa4e29ae9881b0d49ddbe6ba625e3164fe3  lua-lyaml-6.2.9.tar.gz
+sha256  30847a6989db6d5aeee177099fbaa1aaba793a0e5359ab0dafe1582eefb5a028  LICENSE
diff --git a/package/lua-lyaml/lua-lyaml.mk b/package/lua-lyaml/lua-lyaml.mk
index 00a868ec2..965060dd6 100644
--- a/package/lua-lyaml/lua-lyaml.mk
+++ b/package/lua-lyaml/lua-lyaml.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_LYAML_VERSION = 6.2.8
+LUA_LYAML_VERSION = 6.2.9
 LUA_LYAML_NAME_UPSTREAM = lyaml
 LUA_LYAML_SITE = $(call github,gvvaughan,$(LUA_LYAML_NAME_UPSTREAM),v$(LUA_LYAML_VERSION))
 LUA_LYAML_LICENSE = MIT
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
