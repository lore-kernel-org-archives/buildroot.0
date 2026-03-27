Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3252610ED659
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 11:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4656416C5;
	Fri, 27 Mar 2026 11:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5osk9joV8uKb; Fri, 27 Mar 2026 11:11:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB924416C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774609895;
	bh=0adxE1tfP3wt7yO4BfD6O/RGGFnaTiEyxA2d+egThU4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AR9Bz3Za8uTzbgzIFuyAaysV50Urm3+pPC0m1ZmyRzoZH08ljK7ySHrPJsVx2YVMN
	 vUIdf+jUwojUGh0QJHDJgaZdNUcPwjGaivQguiCkyiSl2GSZR7/CJVOdt0NZvL7gUp
	 5gGAXw+MlNTPoECFLn4TIXGXA6D3D8FZEOueKg1s3s8OPtoDcJupYwD/Ayurok53qt
	 ystG2oZfujqsgvuzNvOH5zWGvnjvkuRSaKKUW8J+sT+uXnvYm/1VyRRUCeF/HVsd+5
	 DTM315dDHmi7LQ6T2SQ07oZeQYD3zTKQjqBmb3e7om10B/QVorGMikoAuioOnkJbrP
	 0tq5gh1BwMc2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB924416C0;
	Fri, 27 Mar 2026 11:11:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E4F142D5
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 11:11:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB350416C0
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 11:11:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBAO2E_aMY7j for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 11:11:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=51.210.94.138;
 helo=smtpout1.mo533.mail-out.ovh.net; envelope-from=mooz@blockos.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3EEDA416BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EEDA416BF
Received: from smtpout1.mo533.mail-out.ovh.net
 (smtpout1.mo533.mail-out.ovh.net [51.210.94.138])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EEDA416BF
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 11:11:30 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net [152.228.215.222])
 by mo533.mail-out.ovh.net (Postfix) with ESMTPS id 4fhydC2NRNz60gK;
 Fri, 27 Mar 2026 11:11:27 +0000 (UTC)
Received: from director3.derp.mail-out.ovh.net
 (director3.derp.mail-out.ovh.net. [127.0.0.1])
 by director3.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
 for <mooz@blockos.org>; Fri, 27 Mar 2026 11:11:27 +0000 (UTC)
Received: from mta3.priv.ovhmail-u1.ea.mail.ovh.net (unknown [10.110.43.92])
 by director3.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4fhycl2VpJz5vr2;
 Fri, 27 Mar 2026 11:11:03 +0000 (UTC)
Received: from blockos.org (unknown [10.1.6.6])
 (Authenticated sender: mooz@blockos.org)
 by mta3.priv.ovhmail-u1.ea.mail.ovh.net (Postfix) with ESMTPSA id 03CBC941509; 
 Fri, 27 Mar 2026 11:11:02 +0000 (UTC)
X-OVh-ClientIp: 213.36.7.12
From: Vincent Cruz <mooz@blockos.org>
To: buildroot@buildroot.org
Cc: Vincent Cruz <mooz@blockos.org>
Date: Fri, 27 Mar 2026 12:09:39 +0100
Message-ID: <20260327111042.1172143-1-mooz@blockos.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
x-ovh-tracer-id: 7333830518234139597
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTElGEe8rzEefrflNawYYIu7EZGdx8M/UZwKEj4X7GtBvrVVfM9PS00t2cuBOyue5vltczKKXcihftbKtvJfg3Ki+mw6RPOMkrDxRmJHuTan923PnXH9/h8pTuJ6BXYYJl08eze0dCYqJmJnNiGCEyMHUZ4dcuTW1ePTg4+eYeJ32DsWhfQk1WObfB1/0cD6C/ShFm6PuK7NOxj7X05CkljZt+dukuZVyg/Ttnl72/kGR+52ErPL8TaeYYvH8A6s3hCRlCwZZ6oC1jpJl5XPzaJns4I4lgKdMU9NtQQ0jFI8rTmWn8RoXCqRh2SR7CUpBC9ko/tY64M0W1dkab132ehHoMhCGOWRbz6JbDCnjzFQ8jmcnmRHwAngKT/BIkyf63Z0zcna3xb1cUMUYbTpZmhL6eCw4qmYTyHwQN8y5pT0W5qMoh98q+ZzB5nGO83TIMUGfnnunnPX3/zCQvGKlFVmxMQYWcJDdUbtSGNBleZ7IKFkvYHMRdTO+4tvktGvAcOuFhHP+fKAchcG/KXsg42OApB60taOg7akJ8vx6eO79wXvT7jW52Gyk42FBpTAepKv2md7QWuUXqsvrXHe25qrmF9Cr9iOjgcfT056rsL0rPhY4M338tirr8JcQRQ8Hz/j3gbNXxJsyTfy3TbSW3KPfTDfR+DNCbQUsBuPVREV5A
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blockos.org
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002557f74ca-97de-4b94-baf3-c83c4f2d1335,
 B548C52B33E4A2712BFB385F62670DC0A4297526) smtp.auth=mooz@blockos.org
Subject: [Buildroot] [PATCH v2] package/rwmem: bump to version 2.0
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

For more details, see:
https://github.com/tomba/rwmem/compare/c89bc9ad9...2.0

Signed-off-by: Vincent Cruz <mooz@blockos.org>
---
Changes v1 -> v2:
  - Add patch to fix compilation failure with musl libc.

 ...001-Fix-build-failure-with-musl-libc.patch | 29 +++++++++++++++++++
 package/rwmem/rwmem.hash                      |  3 +-
 package/rwmem/rwmem.mk                        |  3 +-
 3 files changed, 32 insertions(+), 3 deletions(-)
 create mode 100644 package/rwmem/0001-Fix-build-failure-with-musl-libc.patch

diff --git a/package/rwmem/0001-Fix-build-failure-with-musl-libc.patch b/package/rwmem/0001-Fix-build-failure-with-musl-libc.patch
new file mode 100644
index 0000000000..9f298eb842
--- /dev/null
+++ b/package/rwmem/0001-Fix-build-failure-with-musl-libc.patch
@@ -0,0 +1,29 @@
+Fix build failure with musl libc.
+
+Signed-off-by: Vincent Cruz <mooz@blockos.org>
+---
+ tests/test_data_generator.cpp | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tests/test_data_generator.cpp b/tests/test_data_generator.cpp
+index 39e1322..3676f19 100644
+--- a/tests/test_data_generator.cpp
++++ b/tests/test_data_generator.cpp
+@@ -2,6 +2,7 @@
+ 
+ #include <algorithm>
+ #include <cstring>
++#include <endian.h>
+ 
+ // Constants from regfiledata.h
+ static const uint32_t RWMEM_MAGIC = 0x00e11554;
+@@ -169,4 +170,4 @@ std::vector<uint8_t> TestRegisterFileBuilder::build() {
+     }
+ 
+     return data;
+-}
+\ No newline at end of file
++}
+-- 
+2.51.0
+
diff --git a/package/rwmem/rwmem.hash b/package/rwmem/rwmem.hash
index da74002cb4..8b73f662ea 100644
--- a/package/rwmem/rwmem.hash
+++ b/package/rwmem/rwmem.hash
@@ -1,2 +1,3 @@
-sha256  e6cb76b77869aef9ec4a2c31d0d80af0182a5f9c9c3ae06225c8fb2f8266379f  rwmem-c89bc9ad9a8f2359f358c510db57b7678eb156d1.tar.gz
+# Locally calculated
+sha256  d10639f563100c819202337c4d4df57db11c2fcd59a19b0c68e34b8eb9aa1d01  rwmem-2.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/rwmem/rwmem.mk b/package/rwmem/rwmem.mk
index d6ef05193b..1259b5503f 100644
--- a/package/rwmem/rwmem.mk
+++ b/package/rwmem/rwmem.mk
@@ -4,11 +4,10 @@
 #
 ################################################################################
 
-RWMEM_VERSION = c89bc9ad9a8f2359f358c510db57b7678eb156d1
+RWMEM_VERSION = 2.0
 RWMEM_SITE = $(call github,tomba,rwmem,$(RWMEM_VERSION))
 RWMEM_LICENSE = GPL-2.0
 RWMEM_LICENSE_FILES = LICENSE
-RWMEM_CONF_OPTS = -Dpyrwmem=disabled
 RWMEM_DEPENDENCIES = host-pkgconf fmt inih
 
 $(eval $(meson-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
