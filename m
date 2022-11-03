Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169C8C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC03281EB1;
	Thu,  3 Nov 2022 13:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC03281EB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ES2TrUFTWUka; Thu,  3 Nov 2022 13:40:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E8A9881F19;
	Thu,  3 Nov 2022 13:40:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8A9881F19
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F27561BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBAB860761
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBAB860761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aJUelHBPHWDc for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:40:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57C9560669
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 57C9560669
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:40:07 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id z9so1026214ilu.10
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:40:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9fdsh78HgmJLnIqAGomX2koW6J069MG1c9VavIMHO7g=;
 b=vQuRz6eskYDodxk+0SEi3U9Kq5MFpAh7TipNSUvDHrRcvlsgKTqGT1jAzYn+/JFCpl
 Sh0HBGF4loZWZ0sVBJ/zhjEK5En218DzTifMmJzYYwiWN03mvP7lVIkxgBy5AQjT+oz1
 AGDHd9Kl0AIgb5mSYEIQhCOMOXPMMbcL/sU5qBhowsVRvijQk2IrgbY5wQAMiDAjpnEw
 xJrGTffV29XEao69NDyfnxxJA9sxTYAIahTyTA/G/fcvc8yme7ocD2KZXLl0hC6pvGRB
 OST3tP6XT1HiURQXqa4ZXOCF/cxjOVgXLTpSuySlPUsf9VVeVfX3m/NqOsHi6xf5V0Cb
 DIiw==
X-Gm-Message-State: ACrzQf1yefxkT384qTgiJ+qiclmFPTiHiMYrrnE/k/DvgzIPVCGoxNAk
 w0Myilw6uvFvpNM6JdX/Z59xSauBLtgIlGNb
X-Google-Smtp-Source: AMsMyM7cdRkOZlm/J6qvp7nfs45PxrNpYPVxWsGZmt+RwmYJou7yqz17n3DwezyLKzunmfM4te+g7w==
X-Received: by 2002:a05:6e02:dc7:b0:300:94ae:56ec with SMTP id
 l7-20020a056e020dc700b0030094ae56ecmr17311308ilj.209.1667482806212; 
 Thu, 03 Nov 2022 06:40:06 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 8-20020a921308000000b002f90ff8bcbbsm330426ilt.37.2022.11.03.06.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:40:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:40:04 -0600
Message-Id: <20221103134004.2237300-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9fdsh78HgmJLnIqAGomX2koW6J069MG1c9VavIMHO7g=;
 b=oWLMhWPT6izynrxAfLMNhp4ZuFRlQkGA5Mne8IE0ooEDAjGBZpH0Boo+XA96t9vw6x
 pMlxVsCJ8wXyxaV04I4bTZqmaz152Qz4QFoQNVp06Xplc5QIMg9wRK5t+cRVosoy3JKO
 1YAhbnRhcHDq7/iP0u7Z+GgAo6cJRmC+tGaqaBaKZVVT8hA6BL1JpwijN3dDQ2qwCHTD
 QThfxAp81CqYsAdhej5VMIrbjDQc21M2Kz4mj6L+EMoOOqhIIao1HM5QLfoxGvZ480pY
 OsPRKlL2I0J0QWxMatllBD4bB771H7BE4/ZEuAE7btINPMyP6nVPDzMf2e6osU2+NXZ/
 jRFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oWLMhWPT
Subject: [Buildroot] [PATCH 1/1] package/python-pbr: bump to version 5.11.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pbr/python-pbr.hash | 4 ++--
 package/python-pbr/python-pbr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pbr/python-pbr.hash b/package/python-pbr/python-pbr.hash
index 8cf2a18d36..4ca503e976 100644
--- a/package/python-pbr/python-pbr.hash
+++ b/package/python-pbr/python-pbr.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pbr/json
-md5  62565acc6bf3e7e10b082463421f8b46  pbr-5.6.0.tar.gz
-sha256  42df03e7797b796625b1029c0400279c7c34fd7df24a7d7818a1abb5b38710dd  pbr-5.6.0.tar.gz
+md5  99ef94dbe5a00054fdcbbaa87268c3cd  pbr-5.11.0.tar.gz
+sha256  b97bc6695b2aff02144133c2e7399d5885223d42b7912ffaec2ca3898e673bfe  pbr-5.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
 sha256  eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
diff --git a/package/python-pbr/python-pbr.mk b/package/python-pbr/python-pbr.mk
index 3cc7ab81fa..99f0101e19 100644
--- a/package/python-pbr/python-pbr.mk
+++ b/package/python-pbr/python-pbr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PBR_VERSION = 5.6.0
+PYTHON_PBR_VERSION = 5.11.0
 PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
-PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/35/8c/69ed04ae31ad498c9bdea55766ed4c0c72de596e75ac0d70b58aa25e0acf
+PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/52/fb/630d52aaca8fc7634a0711b6ae12a0e828b6f9264bd8051225025c3ed075
 PYTHON_PBR_SETUP_TYPE = setuptools
 PYTHON_PBR_LICENSE = Apache-2.0 (module), BSD-3-Clause (test package)
 PYTHON_PBR_LICENSE_FILES = LICENSE pbr/tests/testpackage/LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
