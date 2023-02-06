Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BE2C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 12:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6E07403FF;
	Mon,  6 Feb 2023 12:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6E07403FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nh9GYuB2j9Y9; Mon,  6 Feb 2023 12:04:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22DEA40436;
	Mon,  6 Feb 2023 12:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22DEA40436
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E222F1BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 12:04:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6B3E403F8
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 12:04:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6B3E403F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFAJKGgLMGKU for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 12:04:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA6DD403E7
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA6DD403E7
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 12:04:06 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id l128so4361066iof.2
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 04:04:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=i5GlWUHvTgTXCzGtQqq9dumlO8OTVvwZoZcYLB4Yqws=;
 b=lQ9Wat3+Qh++EXJ/8k+SVnd179H99ZDWBgYjjrshVwVXUsomj3NWy1q8W1KkODgzNI
 b0fB4+8FGIQGi74EmIgbdNXl8YJIeYasJMl2dpCqJni9QjWu/5f423oh3EYqGWBFwCYt
 FgmpEinROS/PMFXJt0ys8WtyJ5DOi2nC/fAT7P9xbfpxaTmEAcbMNmDczDY/sLyxU27U
 rFINFIJwEbl21FXfBKbytZhIdMjvOzvPu4dAsZe7nDQUH3ar8KaJJWNf2L7+hjqRUZe7
 kpGkxcbJznprjBiTqJOjqdvzRaPVYkxA4cFQlbbkbhWAv3PUTk/iIupkP6DDL5MnSRz0
 cg9g==
X-Gm-Message-State: AO0yUKVACnTag2d1IGr/6VkYMfxr5ZzyM9MVNWGa3KC0ngb44+eUAYvT
 BPHDoETIUwq934F3NqVCn+Xjk7NIQlrKbw==
X-Google-Smtp-Source: AK7set+XvCNEHWb9/jnPzP0NK6/12/1IcoavBYnaUWV8U591KziG/Uf5LC9dxEkQHXKCHJBe493+qQ==
X-Received: by 2002:a6b:5b0a:0:b0:713:fe27:1df0 with SMTP id
 v10-20020a6b5b0a000000b00713fe271df0mr13032446ioh.1.1675685045659; 
 Mon, 06 Feb 2023 04:04:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 z12-20020a02938c000000b0039ea34dffcdsm3467587jah.129.2023.02.06.04.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Feb 2023 04:04:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Feb 2023 05:03:59 -0700
Message-Id: <20230206120400.3188421-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=i5GlWUHvTgTXCzGtQqq9dumlO8OTVvwZoZcYLB4Yqws=;
 b=Xs0So53xcdIYqvgJkk4bV8DxOgii+QEgtpM+ABBfaNAeYQVpP5lfu3P+QkNJ8lCH+8
 TPDq9RoxmdI8Ll/Yi5/PYvySyd+wsIhjyh/03IpMGlqdutBJqI7f3ou6zsdPOetURXUT
 6fadSggxybT10cTEWIJL4hNwVTormCUDXhU7EvHpWjqHKp4UwSRuXox67UQC3A3E/xa4
 BSstQhRYLdUF024hjFR8vm9wyj/Zq4IjlRtYsFCzwfGLECxoLYSSZ2/zFtooaXpTFBkj
 csPuXLbmX5CGh+kp8PRn7AWrXZzkrb31bBmQ9v6O2KcYkvuPAleLe9u3ApcnVotV1YfV
 Uvdg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xs0So53x
Subject: [Buildroot] [PATCH 1/2] package/python-pyproject-hooks: new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-pyproject-hooks.hash                    |  5 +++++
 .../python-pyproject-hooks.mk                      | 14 ++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 package/python-pyproject-hooks/python-pyproject-hooks.hash
 create mode 100644 package/python-pyproject-hooks/python-pyproject-hooks.mk

diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.hash b/package/python-pyproject-hooks/python-pyproject-hooks.hash
new file mode 100644
index 0000000000..9fdcd33596
--- /dev/null
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/pyproject_hooks/json
+md5  69b0b6de189bc04c3f9e304281765741  pyproject_hooks-1.0.0.tar.gz
+sha256  f271b298b97f5955d53fb12b72c1fb1948c22c1a6b70b315c54cedaca0264ef5  pyproject_hooks-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
diff --git a/package/python-pyproject-hooks/python-pyproject-hooks.mk b/package/python-pyproject-hooks/python-pyproject-hooks.mk
new file mode 100644
index 0000000000..a42dbb0ab1
--- /dev/null
+++ b/package/python-pyproject-hooks/python-pyproject-hooks.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-pyproject-hooks
+#
+################################################################################
+
+PYTHON_PYPROJECT_HOOKS_VERSION = 1.0.0
+PYTHON_PYPROJECT_HOOKS_SOURCE = pyproject_hooks-$(PYTHON_PYPROJECT_HOOKS_VERSION).tar.gz
+PYTHON_PYPROJECT_HOOKS_SITE = https://files.pythonhosted.org/packages/25/c1/374304b8407d3818f7025457b7366c8e07768377ce12edfe2aa58aa0f64c
+PYTHON_PYPROJECT_HOOKS_SETUP_TYPE = flit-bootstrap
+PYTHON_PYPROJECT_HOOKS_LICENSE = MIT
+PYTHON_PYPROJECT_HOOKS_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
