Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06A2C47077
	for <buildroot@archiver.kernel.org>; Tue, 16 Jan 2024 08:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74AAF8266A;
	Tue, 16 Jan 2024 08:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74AAF8266A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IG7W4rpyenpy; Tue, 16 Jan 2024 08:56:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C858582122;
	Tue, 16 Jan 2024 08:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C858582122
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C87301BF429
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 08:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB75082122
 for <buildroot@lists.busybox.net>; Tue, 16 Jan 2024 08:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB75082122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zTj0rXXO6i2d for <buildroot@lists.busybox.net>;
 Tue, 16 Jan 2024 08:56:01 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C5D8E81F04
 for <buildroot@buildroot.org>; Tue, 16 Jan 2024 08:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5D8E81F04
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08AF12000E;
 Tue, 16 Jan 2024 08:55:56 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rPfEg-00FCps-1I;
 Tue, 16 Jan 2024 09:55:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Jan 2024 09:55:46 +0100
Message-Id: <20240116085546.3624229-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH] package/refpolicy: move patch to version subdir
 for custom git support
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit e88823d667cf0 (package/refpolicy: fix build with smartmontools) added
a 0001-policy-modules-services-smartmon.te-make-fstools-opt.patch patch, but
forgot to put it in the version specific sub directory - Breaking builds
using BR2_PACKAGE_REFPOLICY_CUSTOM_GIT as shown by the TestSELinuxCustomGit
test:

>>> refpolicy RELEASE_2_20200818 Extracting
gzip -d -c /builds/buildroot.org/buildroot/test-dl/refpolicy/refpolicy-RELEASE_2_20200818-br1.tar.gz | tar --strip-components=1 -C /builds/buildroot.org/buildroot/test-output/TestSELinuxCustomGit/build/refpolicy-RELEASE_2_20200818   -xf -
>>> refpolicy RELEASE_2_20200818 Patching

Applying 0001-policy-modules-services-smartmon.te-make-fstools-opt.patch using patch:
patching file policy/modules/services/smartmon.te
Hunk #1 FAILED at 143.
1 out of 1 hunk FAILED -- saving rejects to file policy/modules/services/smartmon.te.rej
make[1]: *** [package/pkg-generic.mk:241: /builds/buildroot.org/buildroot/test-output/TestSELinuxCustomGit/build/refpolicy-RELEASE_2_20200818/.stamp_patched] Error 1

https://gitlab.com/buildroot.org/buildroot/-/jobs/5929796183

Fix it by moving the patch to a versioned sub directory.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...001-policy-modules-services-smartmon.te-make-fstools-opt.patch | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/refpolicy/{ => 2.20231002}/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch (100%)

diff --git a/package/refpolicy/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch b/package/refpolicy/2.20231002/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch
similarity index 100%
rename from package/refpolicy/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch
rename to package/refpolicy/2.20231002/0001-policy-modules-services-smartmon.te-make-fstools-opt.patch
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
