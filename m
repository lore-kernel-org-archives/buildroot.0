Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADD45EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 16 Jul 2023 20:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F3160D88;
	Sun, 16 Jul 2023 20:13:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62F3160D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mZzhpb76dJz8; Sun, 16 Jul 2023 20:13:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94BF260DDF;
	Sun, 16 Jul 2023 20:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94BF260DDF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B41B91BF8B4
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 20:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A57A40183
 for <buildroot@lists.busybox.net>; Sun, 16 Jul 2023 20:13:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A57A40183
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3shFCSHEgL2P for <buildroot@lists.busybox.net>;
 Sun, 16 Jul 2023 20:13:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 984AB400C6
 for <buildroot@buildroot.org>; Sun, 16 Jul 2023 20:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 984AB400C6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8795687116; Sun, 16 Jul 2023 20:13:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jul 2023 22:06:22 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 20969cb303541937d22754ad6ecbb7cfe9edba76
X-Git-Newrev: 607450ac62d2b258164baa130915eb0701c575f6
X-Patchwork-Hint: ignore
Message-Id: <20230716201318.8795687116@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-pyicu: fix
 build
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

commit: https://git.buildroot.net/buildroot/commit/?id=607450ac62d2b258164baa130915eb0701c575f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes:
http://autobuild.buildroot.net/results/977/977c043615603dd3541e23b81c5f11374606aff6/

Set environment variables to cross-compile friendly values, this prevents
icu-config picking up host libraries:
https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L89
https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L179
https://gitlab.pyicu.org/main/pyicu/-/blob/main/setup.py#L216

This follows the upstream build docs:
https://gitlab.pyicu.org/main/pyicu#building-pyicu

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit c15e60c106bc852a4cd1f987357580e70e6c28ef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyicu/python-pyicu.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-pyicu/python-pyicu.mk b/package/python-pyicu/python-pyicu.mk
index 512b2f857f..53e4a15c4f 100644
--- a/package/python-pyicu/python-pyicu.mk
+++ b/package/python-pyicu/python-pyicu.mk
@@ -12,4 +12,10 @@ PYTHON_PYICU_LICENSE_FILES = LICENSE
 PYTHON_PYICU_DEPENDENCIES = icu
 PYTHON_PYICU_SETUP_TYPE = setuptools
 
+PYTHON_PYICU_ENV += \
+	ICU_VERSION="`$(PKG_CONFIG_HOST_BINARY) icu-i18n --modversion`" \
+	PYICU_CFLAGS="`$(PKG_CONFIG_HOST_BINARY) icu-i18n --variable=CXXFLAGS`" \
+	PYICU_LFLAGS="`$(PKG_CONFIG_HOST_BINARY) icu-i18n --libs-only-L` \
+		`$(PKG_CONFIG_HOST_BINARY) icu-i18n --libs-only-l`"
+
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
