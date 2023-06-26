Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6454EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 07:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EC7540525;
	Mon, 26 Jun 2023 07:05:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1EC7540525
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4puTJkDCRQl; Mon, 26 Jun 2023 07:05:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39E9D41171;
	Mon, 26 Jun 2023 07:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39E9D41171
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A55E71BF390
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 07:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F66E60BC7
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 07:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F66E60BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xVrAEKQ-EiC3 for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 07:05:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D9A060B8A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D9A060B8A
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 07:05:41 +0000 (UTC)
Received: from bricolage.. (unknown
 [IPv6:2a01:e0a:c7e:7060:468a:5bff:fe9a:3c4d])
 by smtp1-g21.free.fr (Postfix) with ESMTP id C6F80B00535;
 Mon, 26 Jun 2023 09:05:37 +0200 (CEST)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 09:05:35 +0200
Message-Id: <20230626070536.311268-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] package/gnuradio: fix build with
 python-pybind > 2.10.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Since commit 0e82c360942907f5a2f379e64e0d211aaff80774 (and since release
2.10.1), a new variable called PYBIND11_PYTHONLIBS_OVERWRITE was introduced
and set to ON by default.

According to comment before this option:
"Overwrite cached values read from Python library (classic search). Turn off if
cross-compiling and manually setting these values."

In buildroot's context this option must be disabled to keep variables
provided by buildroot and lib/app.

This issue affect branches: master, next and tags 2023.02.x, 2023.05.

Fix:
- http://autobuild.buildroot.net/results/7423df5db5237d94bb49e32698828d4fe470e39b/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
- move PYBIND11_PYTHONLIBS_OVERWRITE option to python support section
---
 package/gnuradio/gnuradio.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index d9218b533d..1453b78493 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -116,6 +116,9 @@ ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
 GNURADIO_DEPENDENCIES += python3 python-pybind \
 	host-python-numpy host-python-packaging
 GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
+# mandatory to avoid pybind11 to overwrite variables provided
+# by gnuradio and buildroot
+GNURADIO_CONF_OPTS += -DPYBIND11_PYTHONLIBS_OVERWRITE=OFF
 # mandatory to install python modules in site-packages and to use
 # correct path for python libraries
 GNURADIO_CONF_OPTS += -DGR_PYTHON_RELATIVE=ON \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
