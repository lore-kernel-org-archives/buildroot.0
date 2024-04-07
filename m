Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6921CCD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 11:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36B878212B;
	Sun,  7 Apr 2024 11:47:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zsSDeb8sXe9U; Sun,  7 Apr 2024 11:47:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 33D6382137
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33D6382137;
	Sun,  7 Apr 2024 11:47:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B656F1BF947
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:47:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A396360733
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 11:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k7hga4qSPyNC for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 11:47:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8869560705
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8869560705
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8869560705
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 11:47:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a070b.dip0.t-ipconnect.de [91.58.7.11])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B5CA9A4C2E11;
 Sun,  7 Apr 2024 13:44:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53892)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rtQx6-000000005Wv-2AwW;
 Sun, 07 Apr 2024 11:44:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 13:44:37 +0200
Message-Id: <20240407114445.683504-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240407114445.683504-1-bernd@kuhls.net>
References: <20240407114445.683504-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1712490288;
 bh=TcJBVsDSgbLD3g9wm4VRRjwauZ0yiMz/1d8yEKRMfA8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dskAjBjYkifYnfN7Qeb3M0K9ZX/JOm1Ap6RpI/RPB/5UJQipwn9gxyCZVoE4oDTBg
 W3A06HWcZGNxByhg41Fg6UeNsDdCfaUWbKaVPlnB6PDJWR9LSLT+FD3+8bxecgpwKP
 Zeb91+Pz394/w6aKanUnLMclf6GGh0ZzTnyXAdBy7V03gylIN0PV5qba+6Qhp9X0ih
 fQAp5SqMYOXAm37WzZvZMScVR3o1xEVH7NSVZ2a31of9HkZX4ODehEvq+jEuAqK68Y
 2wr1cTNP45h2NMP3T/JyVoNquCNzsZAvm53YemEpIKWP7exk0ZF3uaUmtD/JUGGRAq
 KS277P9bbnrrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=dskAjBjY
Subject: [Buildroot] [PATCH v2 12/20] package/kodi-inputstream-ffmpegdirect:
 bump version to 21.3.5-Omega
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patch which is included in upstream release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...de-missing-cstdint-to-support-gcc-13.patch | 49 -------------------
 .../kodi-inputstream-ffmpegdirect.hash        |  2 +-
 .../kodi-inputstream-ffmpegdirect.mk          |  2 +-
 3 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch

diff --git a/package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch b/package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch
deleted file mode 100644
index 65db2b4702..0000000000
--- a/package/kodi-inputstream-ffmpegdirect/0001-include-missing-cstdint-to-support-gcc-13.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From fd7bd5ad86fd0006ad571a051fa5d5603a47e4b4 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Wed, 26 Apr 2023 17:15:00 +0000
-Subject: [PATCH] include missing <cstdint> to support gcc-13
-
-gcc 13 moved some includes around and as a result <cstdint> is no longer transitively
-included [1]. Explicitly include it for uint{32,64}_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-Upstream: https://github.com/xbmc/inputstream.ffmpegdirect/commit/fd7bd5ad86fd0006ad571a051fa5d5603a47e4b4
----
- src/utils/DiskUtils.h | 1 +
- src/utils/HttpProxy.h | 3 ++-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/src/utils/DiskUtils.h b/src/utils/DiskUtils.h
-index 79e34268..f900ec58 100644
---- a/src/utils/DiskUtils.h
-+++ b/src/utils/DiskUtils.h
-@@ -7,6 +7,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- 
- namespace ffmpegdirect
-diff --git a/src/utils/HttpProxy.h b/src/utils/HttpProxy.h
-index eb0c99cb..d203ce36 100644
---- a/src/utils/HttpProxy.h
-+++ b/src/utils/HttpProxy.h
-@@ -7,6 +7,7 @@
- 
- #pragma once
- 
-+#include <cstdint>
- #include <string>
- 
- namespace ffmpegdirect
-@@ -36,4 +37,4 @@ namespace ffmpegdirect
-     std::string m_user;
-     std::string m_password;
-   };
--} //namespace ffmpegdirect
-\ No newline at end of file
-+} //namespace ffmpegdirect
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
index 7dbcee6585..536bdc7031 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a849b6b4d5ce740ec3552d244acc4c7a4d64792358428f5154236052473d5734  kodi-inputstream-ffmpegdirect-20.5.0-Nexus.tar.gz
+sha256  b28ccbd489d9b69779fd818ee158f69ebd6fd85b1f0410ffc8098ff0c8665bdc  kodi-inputstream-ffmpegdirect-21.3.5-Omega.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
index ff66f13e14..d9d46ed768 100644
--- a/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
+++ b/package/kodi-inputstream-ffmpegdirect/kodi-inputstream-ffmpegdirect.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 20.5.0-Nexus
+KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION = 21.3.5-Omega
 KODI_INPUTSTREAM_FFMPEGDIRECT_SITE = $(call github,xbmc,inputstream.ffmpegdirect,$(KODI_INPUTSTREAM_FFMPEGDIRECT_VERSION))
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE = GPL-2.0+
 KODI_INPUTSTREAM_FFMPEGDIRECT_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
