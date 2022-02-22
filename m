Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC8AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 20:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FC5981AD1;
	Tue, 22 Feb 2022 20:46:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKvSfz7qG5g3; Tue, 22 Feb 2022 20:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0AA18199D;
	Tue, 22 Feb 2022 20:46:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D4611BF33C
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 20:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 69F3A4011C
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 20:46:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xr_JMprWHBVz for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 20:46:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E1B6400CB
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 20:46:08 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l2-20020a7bc342000000b0037fa585de26so1431461wmj.1
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 12:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rhjp+h5oo5yXObueEfVpqZA/lrACP35Sgl2Cg4uzcKk=;
 b=dlwKrW2mkIwF99BlXEi6ew+jMqgGUNNbuCEzibdbMZvP3ohuaC0TuXvCP8ESKw/vlP
 E5+5LqPPpQUMBkrAZt7N+S/CVov/bD+++HRaCjUel4Ko202PNuwfx+IesTAQeXPb4/sz
 LYl3IqnVOzSv/Fv7JRaD2BLOjWsnsq+istDScHmQ0VX+XBztfJ8+mKGRe2nxUFADPbNz
 1jVQYKCZV3NHmCI0x74ngZAmY0vBdgiIYgKeDdV413mgSgHccqRPk9K2EBYI75VeuLlz
 FvllA6dK0dQ2r6w6KHn+z+bM3q8071/9K8IY5yKO7F0b9VWSfFhwLDtbrMNsNCfjNYQq
 dhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rhjp+h5oo5yXObueEfVpqZA/lrACP35Sgl2Cg4uzcKk=;
 b=rHK74XuV6CoYA7527nNv1VG+H4iik1wRqXdy1iFaT64abl5nTthG+Y/96bPZCNsTOl
 tfgBmUbrlCdXtsVhRCJYxHJJzKVWaNi0unU/evI3TtAe2Qr3UhLCQYy4jEaB3Fg0ZSdX
 OAY6u7KSP0+i6nsBSOm8PXS7Ke8DLCKGlDuRLtNoxuYSqHqs2nl3uvwV/BAGuFuVUz4V
 H+oOHIzQvKrr99oz24iEcBrLiKsKRfzspeO5C5elArVn7uFNEr6V66GlTHjKWEwUSjtn
 VcGMwfC/4DBe8Pw/mqZqZgutNGObMlAHGiIW7APuNi6UiX0KiBdRZ6hcwiDPfJ3aAQjG
 GVoQ==
X-Gm-Message-State: AOAM5336u79EFbc1Ymnir1NGo1LZ9V3Wb7GlZVZ8KRuvijrK0oK0QgyW
 D0bIPQ7BDQQRgNdWgFkRmdRsN7JGg68=
X-Google-Smtp-Source: ABdhPJxPkW5UlLUKhy0QYp95fFdbNqPnb8tvpV8CYUdiz4hR32RAb8U5VV2q8tmZ2nt6i56TUf4a8Q==
X-Received: by 2002:a7b:c7cf:0:b0:37c:233:53da with SMTP id
 z15-20020a7bc7cf000000b0037c023353damr4751972wmk.174.1645562766290; 
 Tue, 22 Feb 2022 12:46:06 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id s7sm24838919wro.104.2022.02.22.12.46.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:46:06 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 21:46:01 +0100
Message-Id: <20220222204601.3150365-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/haproxy: bump to version 2.4.13
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://www.mail-archive.com/haproxy@formilux.org/msg41834.html
https://www.mail-archive.com/haproxy@formilux.org/msg41698.html
https://www.mail-archive.com/haproxy@formilux.org/msg41685.html
https://www.mail-archive.com/haproxy@formilux.org/msg41618.html
https://www.mail-archive.com/haproxy@formilux.org/msg41512.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index c29857cd9c..e3120b521f 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.8.tar.gz.sha256
-sha256  e3e4c1ad293bc25e8d8790cc5e45133213dda008bfd0228bf3077259b32ebaa5  haproxy-2.4.8.tar.gz
+# From: http://www.haproxy.org/download/2.4/src/haproxy-2.4.13.tar.gz.sha256
+sha256  4788fe975fe7e521746f826c25e80bc95cd15983e2bafa33e43bff23a3fe5ba1  haproxy-2.4.13.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index d79d6e9c9c..c162a4c3f4 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.4
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).8
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).13
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
