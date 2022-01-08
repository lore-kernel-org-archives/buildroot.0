Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0DBC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 15:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A449360A89;
	Sat,  8 Jan 2022 15:40:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZO2aGPKXN_u4; Sat,  8 Jan 2022 15:40:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E576607A3;
	Sat,  8 Jan 2022 15:40:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6F6671BF5A1
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:40:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6BD20607A3
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 15:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ngrsbtLSNv5w for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 15:40:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 721C560674
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 15:40:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E2F7582A92; Sat,  8 Jan 2022 15:34:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 16:38:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c49342adf1f72a1ca1745f02c7aca13d8145a3f
X-Git-Newrev: 1842a1cb2c7baebbc6e0f78993dac7953fd3309c
X-Patchwork-Hint: ignore
Message-Id: <20220108153408.E2F7582A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-numpy: use fortran compiler
 when available
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1842a1cb2c7baebbc6e0f78993dac7953fd3309c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-numpy can be built using fortran compiler if available. Pass the
F90 environment variable to setup.py to make sure it picks up the
cross-compiler. Otherwise, use --fcompiler to make sure it doesn't
accidentally pick up the host compiler.

Don't do anything like this for host compilation. We don't care whether
or not it uses fortran.

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-numpy/python-numpy.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/python-numpy/python-numpy.mk b/package/python-numpy/python-numpy.mk
index 9e8b032b78..417fe81f57 100644
--- a/package/python-numpy/python-numpy.mk
+++ b/package/python-numpy/python-numpy.mk
@@ -25,7 +25,12 @@ else
 PYTHON_NUMPY_ENV += BLAS=None LAPACK=None
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
+PYTHON_NUMPY_BUILD_OPTS = --fcompiler=gnu95
+PYTHON_NUMPY_ENV += F90=$(TARGET_FC)
+else
 PYTHON_NUMPY_BUILD_OPTS = --fcompiler=None
+endif
 
 define PYTHON_NUMPY_CONFIGURE_CMDS
 	-rm -f $(@D)/site.cfg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
