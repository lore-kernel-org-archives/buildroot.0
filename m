Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7845FC433EF
	for <buildroot@archiver.kernel.org>; Thu, 31 Mar 2022 20:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 125DC840DF;
	Thu, 31 Mar 2022 20:17:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BTCZDeZDnwBP; Thu, 31 Mar 2022 20:17:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12D7784006;
	Thu, 31 Mar 2022 20:17:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D843E1BF384
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 20:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF9E660B75
 for <buildroot@lists.busybox.net>; Thu, 31 Mar 2022 20:17:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eeCVZ7c58g4s for <buildroot@lists.busybox.net>;
 Thu, 31 Mar 2022 20:17:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8482C60B01
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 20:17:23 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 l9-20020a05600c4f0900b0038ccd1b8642so2545725wmq.0
 for <buildroot@buildroot.org>; Thu, 31 Mar 2022 13:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k9yP1laWPFGqVH8O74vNfEPSokuqd0yGjCLK8hXcztQ=;
 b=OHaYa7Ao96zGoroYu8O4nU00ZpFrh8I5HqC9m3fjbrMrOS1s58Ow8RXVzWMvNgdUJV
 qILkWDUvItrWDZ/p+XCrWjFEKJ+PpcBKUIREfukbvp2aBk95NzeCQilVJXsA8gMGQ863
 5XYPxOCSOEY1khQBKH7B7dmynlpYE++75dVyHaWEjY1EWjQ9rNImKEEScZzFTFkZbFy/
 /ZOdCUSrgobg0J9NKwFcySuLNzYRR8DUfI7CzZybGCjti9lXUnT1pf+h0dtbbAEdw8qQ
 yUgYdNgCeopW+XZdN8JeuFRRTUpbAPfIHQps4i2dJ75QJWJcKYYhbZLbdqWMzKNdTsuL
 kz2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k9yP1laWPFGqVH8O74vNfEPSokuqd0yGjCLK8hXcztQ=;
 b=Oi9fw3ZbkFAyyS33iqOij2sJscolgOGu3L7r4C1wDSKhr0E9ZwSUj5iwfm96/wL3Mo
 AVVJiET1BaiLDcxF5XAmwdEnz0XNFXbsQf4qwNgTxVntP47GbdQXE8u/E4dy/K6fhdUp
 IzfQSUNmQ/NYA3HqLZz1fMM04jsHMUgBvQWzbXoDKah/kJVuY7G+QnHMNsMvEe2MwEPd
 xXOXsByyMWPiWh8UkjMaHnXMl6zqVZkvtALGZdSxSHoANBCYMP+NqSJgbz1FkKW0WzGi
 TNwldHP1AtIxYRivW66sf5pPdFZAvWfhI7juX+C2t7BxVbNVttscq5zrREQjCbbUSefr
 or+Q==
X-Gm-Message-State: AOAM530bxgJxoeLnykaYp2cAIOGP4OuXaq8eMdJrILUh7fWRpTDuT2S2
 UJKlyNBytWyfN8KQrZT1M/IoSfY2+Fs=
X-Google-Smtp-Source: ABdhPJzZ7xYvod+ECpAl4EaQuSxXlLsG0hWCf7200fmw51CnzJ0wRn9TB9x7YNA5KOCHa2bs776ruw==
X-Received: by 2002:a05:600c:5106:b0:38e:38f8:858 with SMTP id
 o6-20020a05600c510600b0038e38f80858mr5925769wms.109.1648757841775; 
 Thu, 31 Mar 2022 13:17:21 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 r15-20020a5d6c6f000000b002040552e88esm386466wrz.29.2022.03.31.13.17.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 13:17:21 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 31 Mar 2022 22:17:18 +0200
Message-Id: <20220331201718.728570-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-{treq,
 twisted}: add a comment to use the same version
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported by [1], python-twisted and python-treq must use the same
version because its the same project:

https://github.com/twisted/twisted
https://github.com/twisted/treq

We have to update python-treq to version 22.2.0 [2] otherwise we have
a runtime issue:

Traceback (most recent call last):
  File "/root/sample_python_treq.py", line 2, in <module>
    import treq
  File "/usr/lib/python3.10/site-packages/treq/__init__.py", line 5, in <module>
  File "/usr/lib/python3.10/site-packages/treq/api.py", line 5, in <module>
  File "/usr/lib/python3.10/site-packages/treq/client.py", line 11, in <module>
ImportError: cannot import name '_PY3' from 'twisted.python.compat' (unknown
location)

The comment should avoid forgeting one of them while upgrading or
backporting version bump.

[1] http://lists.busybox.net/pipermail/buildroot/2022-February/637505.html
[2] https://github.com/twisted/treq/releases/tag/release-22.2.0
[3] https://gitlab.com/buildroot.org/buildroot/-/jobs/2179206653

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-treq/python-treq.mk       | 3 +++
 package/python-twisted/python-twisted.mk | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/package/python-treq/python-treq.mk b/package/python-treq/python-treq.mk
index 57dc50ee74..8995bf2cfe 100644
--- a/package/python-treq/python-treq.mk
+++ b/package/python-treq/python-treq.mk
@@ -4,6 +4,9 @@
 #
 ################################################################################
 
+# When bumping this package, make sure to also verify if the
+# python-twisted package still works and to update its hash,
+# as they share the same version/site variables.
 PYTHON_TREQ_VERSION = 22.2.0
 PYTHON_TREQ_SOURCE = treq-$(PYTHON_TREQ_VERSION).tar.gz
 PYTHON_TREQ_SITE = https://files.pythonhosted.org/packages/cd/c8/b68ab17d994133baf6edbcb5551ba81e1494bdc6d5e21a9d4f3bc4315140
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index e5d643ec05..8a89d3dc82 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,6 +4,9 @@
 #
 ################################################################################
 
+# When bumping this package, make sure to also verify if the
+# python-treq package still works and to update its hash,
+# as they share the same version/site variables.
 PYTHON_TWISTED_VERSION = 22.2.0
 PYTHON_TWISTED_SOURCE = Twisted-$(PYTHON_TWISTED_VERSION).tar.gz
 PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/40/8b/56e8870d412c550b3ff2d6714ee212c7e80a6634f4e720c3a26a983e7b46
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
