Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A09C6FD18
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 08:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3595D818E8;
	Wed, 19 Apr 2023 08:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3595D818E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5HzIu4KxfERr; Wed, 19 Apr 2023 08:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 613578186E;
	Wed, 19 Apr 2023 08:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 613578186E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8D581C432F
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2C0240527
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 08:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2C0240527
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MA9Tmi6Ac2G8 for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 08:31:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C10F24298F
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C10F24298F
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 08:31:56 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-329518648ebso36845825ab.0
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 01:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681893115; x=1684485115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5wF+tEdXHT3qIqHdn7FihHufBnqpEEwkxX4ShLq0r9U=;
 b=JA2In7bG9UD6Oc9p8zOnk2AG5/M71RrpPFWEerwmnZ8LjdPV84izjIsvjdasHkOdaO
 wbd8XbzsXtVHvsLXW2eC2CnhxiLeANLVkLVSQgGhGY0qLR5y5eplfeC1wB9Ew1tG77uG
 /joDBN7/FAFxfoP1Ha2fP8+Ll/xNmgKNlk/0JxWCu/zlRJuk6Q88e7xb80D9oGOEDGkO
 WsmtHF+iUpnF0CZvUvyvCKzYQmgb2GSYdK7x4dd5CCriJy3Lnj42doen3a/l90kl+Dvf
 ju7hZkd22XhJ56S9wiRGTb3cu6I+MGvAeJtwLveJtlhSbtqANOa+Nadjrd2Dq3NJgd8d
 v6TQ==
X-Gm-Message-State: AAQBX9f3O8w3XKJOlI+MWiWEPkkxftUJcrEuOpQSB2RH+3QglXZ1cfYU
 RjT9vsMnbs7vfa713WqFAfa3Zv16PSc=
X-Google-Smtp-Source: AKy350aJvuxgIZwckfi2yZfT175vYGlTPTlGb9fXKan9pKMGBDuHMweP3WMbEdsS9QamfnzjyZehEg==
X-Received: by 2002:a05:6e02:605:b0:32c:3272:ffd9 with SMTP id
 t5-20020a056e02060500b0032c3272ffd9mr1680782ils.5.1681893115689; 
 Wed, 19 Apr 2023 01:31:55 -0700 (PDT)
Received: from james-x399.localdomain (71-218-108-164.hlrn.qwest.net.
 [71.218.108.164]) by smtp.gmail.com with ESMTPSA id
 z20-20020a056638241400b0040f8a65164csm4026442jat.105.2023.04.19.01.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 01:31:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 19 Apr 2023 02:31:44 -0600
Message-Id: <20230419083144.212921-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419083144.212921-1-james.hilliard1@gmail.com>
References: <20230419083144.212921-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681893115; x=1684485115;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5wF+tEdXHT3qIqHdn7FihHufBnqpEEwkxX4ShLq0r9U=;
 b=JZtLBFaPvfExmlZUX0H+dSQHuZPPzOsqJybTUBlWpJaGo0QzOSs4i35FhgmFjDg5mS
 br1FJ55aW3RslTOYaRn7QPTrlnsIO5ze3TzvDMW4LsqhCY8UZNHp7DwbqbsF5eWWNII5
 9zMjd8ZqpqZAA0PHkP6QX3ECmfc9vszYwFgIaPSBGJ5Z+EoiSSreyW99FIP3JJR8CQSU
 VxE1QYLb+uupOrVSVZ98lACJRnw+eyFHGvgwOir3QgL+Js7DpjrCyEZg6abhBcZ7JEeA
 8tQSpzBu4eaA8/q9stn1oHhOzyVtoKqMYp9m1L3PLf0RQfqC/l+nrgzHY3z6iYFdw7jW
 LAcg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=JZtLBFaP
Subject: [Buildroot] [PATCH 12/12] package/gst1-python: bump version to
 1.22.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/gstreamer1/gst1-python/gst1-python.hash | 4 ++--
 package/gstreamer1/gst1-python/gst1-python.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gstreamer1/gst1-python/gst1-python.hash b/package/gstreamer1/gst1-python/gst1-python.hash
index 128a739c2c..006d4985ef 100644
--- a/package/gstreamer1/gst1-python/gst1-python.hash
+++ b/package/gstreamer1/gst1-python/gst1-python.hash
@@ -1,3 +1,3 @@
-# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.0.tar.xz.sha256sum
-sha256  6c63ad364ca4617eb2cbb3975ab26c66760eb3c7a6adf5be69f99c11e21ef3a5  gst-python-1.22.0.tar.xz
+# From https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.22.2.tar.xz.sha256sum
+sha256  bef2b3d82ce4be46b775b1bb56305c1003ee01b535a53a82f9fe8924972153ad  gst-python-1.22.2.tar.xz
 sha256  ea3ad127610e5ded2210b3a86a46314f2b3b28e438eccffdae19a4d6fbcdb0c2  COPYING
diff --git a/package/gstreamer1/gst1-python/gst1-python.mk b/package/gstreamer1/gst1-python/gst1-python.mk
index 2fc268b0ac..527d101786 100644
--- a/package/gstreamer1/gst1-python/gst1-python.mk
+++ b/package/gstreamer1/gst1-python/gst1-python.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GST1_PYTHON_VERSION = 1.22.0
+GST1_PYTHON_VERSION = 1.22.2
 GST1_PYTHON_SOURCE = gst-python-$(GST1_PYTHON_VERSION).tar.xz
 GST1_PYTHON_SITE = https://gstreamer.freedesktop.org/src/gst-python
 GST1_PYTHON_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
