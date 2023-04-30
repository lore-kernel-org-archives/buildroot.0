Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7ACC77B73
	for <buildroot@archiver.kernel.org>; Sun, 30 Apr 2023 18:37:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 856CE607B4;
	Sun, 30 Apr 2023 18:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 856CE607B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2Pz7GjOBqls; Sun, 30 Apr 2023 18:37:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6F4C607A1;
	Sun, 30 Apr 2023 18:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6F4C607A1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 123411BF475
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 18:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DFA514044C
 for <buildroot@lists.busybox.net>; Sun, 30 Apr 2023 18:37:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFA514044C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YgWaxk6BBeHJ for <buildroot@lists.busybox.net>;
 Sun, 30 Apr 2023 18:37:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8FDF400D8
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8FDF400D8
 for <buildroot@buildroot.org>; Sun, 30 Apr 2023 18:37:40 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2a8bca69e8bso17360711fa.3
 for <buildroot@buildroot.org>; Sun, 30 Apr 2023 11:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682879858; x=1685471858;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S+bpz6ytR9vOr746CPc3n2I7B4OJkPAWtbys38Gr4u4=;
 b=GVa7BArOYXhL90jZaTquenB32Mk3CNds0xpgj1CdsFZ6SZwpvdw5qi1/oCIIHknSu9
 +13qgqSJ2t6mZk7Sf5leE8VGij+1VyO/8IE35QY3+op7oHuGKu/ZgkALj0F/pyGgZYtP
 xpwkmvK8OHNaphdCiSTZkR1txDWH4OmgnOcuZCAIJkmAAqCz4Ik/L+Si1fvWfL/wyw3e
 zIpwI/VDh9cigmT+QpXCeATRD5g6c4L6C5VS6MJedHD1eY/IB5g20iaUxLQ0c6qqmWKU
 F3bUJcm35FWmdgcQYueORXr9g7l0T4c3UJUX6iK801dh8TUmGeX6uHUzZ3iiO4OdIEoZ
 as+g==
X-Gm-Message-State: AC+VfDz2DTtkxVjF6Ku7OppeZcjvRLUxnEDZkbQ/g34znMVA1G6fdqSh
 hfB93hQuPGkP+o1ak1Lr/TAVdKhtZlI=
X-Google-Smtp-Source: ACHHUZ51tdB+bl72nsrj9jROypIU+tiKjaMgnMha4fS/oMjI5xe3ghXKlQZqlm5fpWn8waveDmocbg==
X-Received: by 2002:a2e:8e88:0:b0:2a8:d3bb:2d83 with SMTP id
 z8-20020a2e8e88000000b002a8d3bb2d83mr3216877ljk.42.1682879858005; 
 Sun, 30 Apr 2023 11:37:38 -0700 (PDT)
Received: from gimli.lan (h-82-196-111-25.NA.cust.bahnhof.se. [82.196.111.25])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a2e8455000000b002a8e8c776e9sm4278989ljh.56.2023.04.30.11.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 11:37:37 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Apr 2023 20:35:33 +0200
Message-Id: <20230430183533.2488112-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682879858; x=1685471858;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=S+bpz6ytR9vOr746CPc3n2I7B4OJkPAWtbys38Gr4u4=;
 b=eIIwv35gwEyjDWRGIKHg0o5YXsAYVtNGIZMiZxje/XnVvHsgV4tenziuCeV1fZHrHI
 MHbQpkveB+YeXfIzVItZTQkHa1PCDTkKYB1g4uYMFFtfZNHfjdDQIWBr8/X2+EDoimJZ
 UT+RCmk7ftGvbUMana6m0InoYFs+SmnpCuT/8/M4IXwCkJHq8LmahmhNdMzadvl2Zr2U
 +h21Y9znVyOpcurM8lZWc0WUgKjo/Iolqn2qVKUiZh4fY8Sd7mIJV15dQquA8srI6Sb9
 Vs9LEIY9AxGX41M78c1H/YCWEpvDnpkdx4BZwYUlYP0fgZmxTnio4ddZpw2SuD3cZqVk
 nRDA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=eIIwv35g
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.5.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Add support for -c and -cc to disable log compression
   A single -c disables compression for pipes, another -c (or -cc)
   disables compression for all other log targets
 - The default syslog.conf now logs debug messages again (disabled in
   v2.4.0) due to problems (confusion) reported in the field
 - Dropped not recommended KillMode=process from systemd unit file
 - Fix loss of early log messages running under systemd

Full changelog: https://github.com/troglobit/sysklogd/releases/tag/v2.5.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index e370716bd9..30ce6d9c0b 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  01f25931d1508c3e6be4e182f49356c993abc7d035d5835db35f9b61d5085549  sysklogd-2.4.4.tar.gz
+sha256  e1d635944e5a6062c8ea18b9506668ebdaefacea1965147f60cf3fb3a25770e8  sysklogd-2.5.0.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 68023c9ae2..ebc9f89cf7 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.4.4
+SYSKLOGD_VERSION = 2.5.0
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
