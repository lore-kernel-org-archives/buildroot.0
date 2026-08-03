Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09B6C55179
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 14:08:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20940607B3;
	Mon,  3 Aug 2026 14:08:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y3plKv_Mf-mM; Mon,  3 Aug 2026 14:08:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3492A6072F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785766102;
	bh=ADsdzDJLdF/3z6PpxxuOEaBMkkpxqwau2n42SD9+3r0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m8lvpgav7FJ9UlmkDzpi96EEkRB/ga0O5k4HRquz93ebtjnHJ275p6OD2N1BC9YAq
	 Q4dhjj8MRr/Vwi4Q9LvMyh99TXYwKvuZO0qt7zkw59qT5mxohDB+pP68EyKYD3+PBz
	 ZbpxwWj81jYsJrfAfyqB1/1McMv4ZG2EzmOV6oFT1pg9iQnwzqaIra+3INM8ZA8vmc
	 3yiBJBMRgfOfCgS//LBmcSjuu8k6k/c/xAWtC+5P5Wsj/7hHWW4DrSczPTqprhfEq5
	 OAxCufjy7vN9lO5lLlWKGpmZQ9u0v5omLfT3gsN8l4U7mcT8jb6EDBM0sQx9qBOEUv
	 uMHcEoktvwPqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3492A6072F;
	Mon,  3 Aug 2026 14:08:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11CC6389
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:08:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C56C80DA8
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yScBwLL7-Ak6 for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 14:08:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com;
 envelope-from=aford173@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3D13880DA4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D13880DA4
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3D13880DA4
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 14:08:20 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-49ff971e903so2660986b6e.0
 for <buildroot@buildroot.org>; Mon, 03 Aug 2026 07:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785766099; x=1786370899;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=UTKuyd8xQoEmJO2Om0+jsvn4u5oa9M8YphR+PwnhCl4=;
 b=LxEJd/pSmbdZY334nADKIpObuTbTCdMeZDp79X7lCbT52PA9J8u5EdrIpl2TWk6r6F
 isUsyQ/GTDPr6QlHX8JeRJ7vBDOafb6UmeR8cBgyMfBW5E34s1SPvlX2YQUty3hv1aIz
 d6vogrvHDWaDx3VQj8n9VJ+65s+Arv97XNpIB5E13Ap62RN+KVKbj+K0U6UcP9teTXpt
 JtCbOxILuFP5a4g26FbBKJEhcF+sgD8IWoTl9m8zY3U/WK2+viVl6b9i77bpvkTwZKXe
 28MRd7VEFcJ1bKvu6fTsO7bzNXGWpQx3MHPXED38L8eKV7dDlt6ilRVyjpUk8Zh6x0uz
 zg+Q==
X-Gm-Message-State: AOJu0Yz6kP4tdER9fb2JfD8OJBwJvkyRM20g2kh2CQZ3d3Bnd0XY83Te
 4wGx9HHREyVTV84AQr24x7wWvEidUWHlbkeXT/4K5C/XoTITdM/MiiyK+yveSHd6hqQ=
X-Gm-Gg: AR+sD10OX2aMOuTSE7u/1L+kwlHhnX0HdrZY54k6YfoZYd3QvOuv//p8PfupZ4LosIZ
 VHGIkZ/oyO/0kXD4wgxg/IVgIiuKNoE+9d5CEK7+PU3aWZzZNxD1113xRf+Scb6eVlRPcmc3U/X
 U9LdwA54Fn6FMh49iLkvseRlYYjRibk/KWO5hs0/GQhQoCOQ4M5WKzuH1vv9lHfGDwp3sUwynVi
 yy/+EhMGPu/6juF4DM4BjYMcBs9lq32I7cIO1nuBUmXNXhPoNt3fOs6jygbGbFYauGddrlHXD34
 IFGOV5VQQWM20QUpIGNCOU97UboFVywIXQQC2Bh/HgCe5iOvVTv1E9EMqZejzcSiEsrIRQ3lEbb
 rk0oBzUIDh8MbeRaEQK7MhMTWQN73Tx8w5OSu8ivQND0MsXVEBrMxXzK/Otq9O8VtwvVz4d+JhQ
 90NjASitOKXQ7ZATfMvzThxeTdyRXiAGsyXN5MZqQ5e91FPWtNvZIrU1JNr0mAVaCv7g3mnwD1X
 D7rTjz+Q2RjI54P4EukbT2cxlz6X7n320lCAYjmIw==
X-Received: by 2002:a05:6808:1a0d:b0:495:ca1b:7865 with SMTP id
 5614622812f47-4ae318da863mr14743804b6e.11.1785766098891; 
 Mon, 03 Aug 2026 07:08:18 -0700 (PDT)
Received: from aford-System-Version.lan (c-73-94-212-116.hsd1.mn.comcast.net.
 [73.94.212.116]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7f18ed92a7dsm7864765a34.7.2026.08.03.07.08.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2026 07:08:18 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: buildroot@buildroot.org
Cc: Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Adam Ford <aford173@gmail.com>
Date: Mon,  3 Aug 2026 09:08:15 -0500
Message-ID: <20260803140815.617446-1-aford173@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785766099; x=1786370899; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UTKuyd8xQoEmJO2Om0+jsvn4u5oa9M8YphR+PwnhCl4=;
 b=p59omqJ/T+J/aoPoplL1DCJpoaPHVA4VEFhukycDI+xwqhc+MXvQrKXX8r/e8q7Waw
 ox8bqZpyuVEsP/DVu+7eMVLU/jyh5cvKYVI6jlVSuWdHW1pT8GT/uwOaxQuX4Y2JCPxx
 89IX9gTKE6wlSD0ny5/3sMDEKlZKezeujP5CinIxETTgEUa1XdM7pdi1o28l90aLxfgk
 oF+cJOmV/BYZufoQQbcD77CZdqOM5AQciOY7HFNaf1upFybcOnkvlWiNbnkvoZ02J+8R
 cSqKjtjYwzy43+CUt5lmGIAw91XnFt0FjEahm//8Uv2DERaybxb8L0uprwPO6+++b0ay
 OyOg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=p59omqJ/
Subject: [Buildroot] [PATCH V2] package/x11r7/xwayland: fix glamor DRI
 ordering dependency on mesa3d
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

Xwayland's glamor support enables a DRI configure check that looks for
Mesa's dri.pc in staging. Without an explicit ordering dependency, a
highly parallel build can run Xwayland's configure before mesa3d is
installed, failing with:

    ERROR: Dependency "dri" not found

Since mesa3d is what provides the DRI/EGL/GBM bits glamor relies on, fold
it into the glamor condition: only enable -Dglamor=true and add it to the
dependencies alongside libepoxy.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 02a21b96c1..3bd87a4552 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -32,7 +32,7 @@ XWAYLAND_CONF_OPTS = \
 
 ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_LIBEPOXY),yy)
 XWAYLAND_CONF_OPTS += -Dglamor=true
-XWAYLAND_DEPENDENCIES += libepoxy
+XWAYLAND_DEPENDENCIES += libepoxy mesa3d
 else
 XWAYLAND_CONF_OPTS += -Dglamor=false
 endif
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
