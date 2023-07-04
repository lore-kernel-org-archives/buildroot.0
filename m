Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245C4EB64D9
	for <buildroot@archiver.kernel.org>; Tue,  4 Jul 2023 20:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF88A40C94;
	Tue,  4 Jul 2023 20:52:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF88A40C94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lW75iMYdqOgi; Tue,  4 Jul 2023 20:52:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E385340B91;
	Tue,  4 Jul 2023 20:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E385340B91
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B83B01BF95D
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AD7640576
 for <buildroot@lists.busybox.net>; Tue,  4 Jul 2023 20:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7AD7640576
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3r3VTcSaRI74 for <buildroot@lists.busybox.net>;
 Tue,  4 Jul 2023 20:52:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5884B400FB
 for <buildroot@buildroot.org>; Tue,  4 Jul 2023 20:52:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5884B400FB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46D2186623; Tue,  4 Jul 2023 20:52:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 4 Jul 2023 22:44:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21f6859647a9ebab2fc09824403514cbaea523a4
X-Git-Newrev: 11aa7ac8fa3a21dc2476dd09539ea3cf3e48f03d
X-Patchwork-Hint: ignore
Message-Id: <20230704205218.46D2186623@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gnuradio: fix build with
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11aa7ac8fa3a21dc2476dd09539ea3cf3e48f03d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since commit 0e82c360942907f5a2f379e64e0d211aaff80774 (and since release
2.10.1), a new variable called PYBIND11_PYTHONLIBS_OVERWRITE was introduced
and set to ON by default.

According to comment before this option:
"Overwrite cached values read from Python library (classic search). Turn off if
cross-compiling and manually setting these values."

In buildroot's context this option must be disabled to keep variables
provided by buildroot and lib/app.

Fixes:
- http://autobuild.buildroot.net/results/7423df5db5237d94bb49e32698828d4fe470e39b/

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
