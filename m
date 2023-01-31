Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0415FC636CD
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 06:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 721B88135A;
	Tue, 31 Jan 2023 06:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 721B88135A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUTQ-XtHUwa9; Tue, 31 Jan 2023 06:46:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A587F81358;
	Tue, 31 Jan 2023 06:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A587F81358
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E0CD1BF37A
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 06:45:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 576AC40947
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 06:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 576AC40947
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBwyS8dYSxBJ for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 06:45:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB7640942
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CB7640942
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 06:45:54 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id i17so5975815ils.11
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 22:45:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VV2a712AQ4/bEm60DwHZJBbqCiweobrtnOOeOThbgOQ=;
 b=ICcKrB6oODaqqzAbqIeZ5Tg2T6f4eiX0758wozflZzTgrwWnj8DMVq5tXA3Du9MNT+
 FikjuMoqpGfO8yyhzYaCpomnmrdu9ZTE9H/NrIINnDxyS7ijqiNHtUXDpEtCcL4qiq2Z
 D3xYrQ8WUD9/3myiy54Fkaw5qugPQlt4MXWbk7F5hU+LmAxfc6p8tB7zZJsXSryyz5sk
 x2gNBLXzYlp+2IF2Bki40/3umJe5XMRk6ai3qz4/TEJHgVNFp7+xItJU7aTDpZGQxQIO
 YM366uUE74CYIWvS+Zyokwpij7TkUGh83Qww0IwJNH6uO6nddRBNBEMNcDJlXwQgDD0a
 R88g==
X-Gm-Message-State: AO0yUKXjwYDaNYVdiRP5NtXRwcD9XPlUOnUaW3SZjqrVzVS6XOKxASng
 fM5QZwXiI4oeD/WcvQtaUT6pduYNSFaaxQ==
X-Google-Smtp-Source: AK7set+Y3Whsg4mtdYKkA4M4ns5fxj/9Vlo/prdTx6VPV4B8LjmfKKb0cmh0i3BsJoX4luBUaeHEFg==
X-Received: by 2002:a05:6e02:20e1:b0:310:ac52:1cf6 with SMTP id
 q1-20020a056e0220e100b00310ac521cf6mr14390112ilv.29.1675147553145; 
 Mon, 30 Jan 2023 22:45:53 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 184-20020a021dc1000000b00375783003fcsm5342371jaj.136.2023.01.30.22.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 22:45:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Jan 2023 23:45:45 -0700
Message-Id: <20230131064545.3266194-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131064545.3266194-1-james.hilliard1@gmail.com>
References: <20230131064545.3266194-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VV2a712AQ4/bEm60DwHZJBbqCiweobrtnOOeOThbgOQ=;
 b=QisQMoF5uIubZLXhBW0YNzY+BS11yt114cW3rd9Ntwu+UwMUgLUgwP6bL2kDsATbZ/
 oIsKsz/ZdDXyqPanq3oBYAVZVAtKJyVqCbG15kfk7qT+iKovyfgp5HrADsu9M+NUwP4m
 a8VBPSs/n6ZenjHC3c8fgZxyKsBJtsnxGgZOHmC+h7P8+e4zaR+yEwgRjdCrC7+DhU7u
 0RcTE9xNs0B/QQcCSpa1ktqOU9bzTNkuFBhQJf7naPHI9lS+O7TcqwSbLPAgyFyZIjuD
 0NwEouWR7ttowYAdUiBQZd2b3J+a6I+XfPWS2Q84/8yD5ge7x02jV0mi+V0+aHzuZyDT
 wLJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=QisQMoF5
Subject: [Buildroot] [PATCH 2/2] package/pipewire: bump to version 0.3.65
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
Cc: Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add support for new compress-offload and pw-cat-ffmpeg features.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.hash |  2 +-
 package/pipewire/pipewire.mk   | 13 ++++++++++---
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index d8b5b0cc86..0e027aaa55 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  24b218cf3bb1fb279c8c489c14cc9ae483e1da7b4c8215b2ee5a5ee831bae94f  pipewire-0.3.62.tar.bz2
+sha256  c78c95cdff2774418f0a9468e94a1b2800761d322f13104df6501e1a0dc92558  pipewire-0.3.65.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 6bcda0a93d..976d7783b9 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.62
+PIPEWIRE_VERSION = 0.3.65
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
@@ -122,10 +122,10 @@ PIPEWIRE_CONF_OPTS += -Dbluez5=disabled -Dbluez5-codec-opus=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG),y)
-PIPEWIRE_CONF_OPTS += -Dffmpeg=enabled
+PIPEWIRE_CONF_OPTS += -Dffmpeg=enabled -Dpw-cat-ffmpeg=enabled
 PIPEWIRE_DEPENDENCIES += ffmpeg
 else
-PIPEWIRE_CONF_OPTS += -Dffmpeg=disabled
+PIPEWIRE_CONF_OPTS += -Dffmpeg=disabled -Dpw-cat-ffmpeg=disabled
 endif
 
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)
@@ -215,6 +215,13 @@ else
 PIPEWIRE_CONF_OPTS += -Dsdl2=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_TINYCOMPRESS),y)
+PIPEWIRE_CONF_OPTS += -Dcompress-offload=enabled
+PIPEWIRE_DEPENDENCIES += tinycompress
+else
+PIPEWIRE_CONF_OPTS += -Dcompress-offload=disabled
+endif
+
 ifeq ($(WEBRTC_AUDIO_PROCESSING),y)
 PIPEWIRE_CONF_OPTS += -Decho-cancel-webrtc=enabled
 PIPEWIRE_DEPENDENCIES += webrtc-audio-processing
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
