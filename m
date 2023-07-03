Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED354C3063F
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 18:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CF3360EE1;
	Mon,  3 Jul 2023 18:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CF3360EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmFr5rxrRgmd; Mon,  3 Jul 2023 18:17:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6A5D60EC2;
	Mon,  3 Jul 2023 18:17:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6A5D60EC2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C27F81BF39A
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:17:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BE8D40420
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 18:17:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BE8D40420
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N5Mrp1svHnUW for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 18:17:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A31E540280
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 18:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A31E540280
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 90443863DA; Mon,  3 Jul 2023 18:17:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 20:16:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef95ec920cbae32e5a525d887b7a279440d96f11
X-Git-Newrev: c15e60c106bc852a4cd1f987357580e70e6c28ef
X-Patchwork-Hint: ignore
Message-Id: <20230703181748.90443863DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyicu: fix build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c15e60c106bc852a4cd1f987357580e70e6c28ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
