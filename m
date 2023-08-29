Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260B0C6FA8F
	for <buildroot@archiver.kernel.org>; Tue, 29 Aug 2023 17:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2F0341573;
	Tue, 29 Aug 2023 17:03:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2F0341573
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2kGGw8IXe2Dj; Tue, 29 Aug 2023 17:03:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA47A4155C;
	Tue, 29 Aug 2023 17:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA47A4155C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1B2D51BF3EA
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C333961142
 for <buildroot@lists.busybox.net>; Tue, 29 Aug 2023 17:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C333961142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 11JFqEqdb_bW for <buildroot@lists.busybox.net>;
 Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1F1961139
 for <buildroot@buildroot.org>; Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1F1961139
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88CE886499; Tue, 29 Aug 2023 17:03:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 29 Aug 2023 18:50:53 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 867a993aeaebfa54c7154c872dcfcda1e2cf0737
X-Git-Newrev: bf041313f95cfd3b592621c875d7dfdf5c7f4d86
X-Patchwork-Hint: ignore
Message-Id: <20230829170309.88CE886499@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/gnuradio: fix
 gnuradio python libraries for cross-compile
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

commit: https://git.buildroot.net/buildroot/commit/?id=bf041313f95cfd3b592621c875d7dfdf5c7f4d86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

By default, module libraries have a suffix based on cpython version + host
architecture: this is fine for a native compile when these libraries are used on
the same computer (or similar computers). But when target architecture is not
the same python is unable to find libraries due to the wrong suffix and produces
unclear errors messages:

# python3
Python 3.11.3 (main, Jun 19 2023, 14:15:44) [GCC 11.4.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> from gnuradio import blocks
Traceback (most recent call last):
  File "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py", line 18, in <module>
ModuleNotFoundError: No module named 'gnuradio.blocks.blocks_python'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "/home/xxx/buildroot/output/build/gnuradio-3.10.4.0/gr-blocks/python/blocks/__init__.py", line 22, in <module>
ModuleNotFoundError: No module named 'gnuradio.blocks.blocks_python'
>>>

By adding _PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" at configure time, sysconfig will
return correct informations (target architecture) instead of host architecture.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e22b450692a6d02da43a453f24ec057bb5517422)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnuradio/gnuradio.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 1453b78493..8eb7778d99 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -119,6 +119,10 @@ GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
 # mandatory to avoid pybind11 to overwrite variables provided
 # by gnuradio and buildroot
 GNURADIO_CONF_OPTS += -DPYBIND11_PYTHONLIBS_OVERWRITE=OFF
+# mandatory to avoid pybind11 to force libraries extensions
+# with a name based on host architecture
+GNURADIO_CONF_ENV += _PYTHON_SYSCONFIGDATA_NAME="$(PKG_PYTHON_SYSCONFIGDATA_NAME)" \
+	PYTHONPATH=$(PYTHON3_PATH)
 # mandatory to install python modules in site-packages and to use
 # correct path for python libraries
 GNURADIO_CONF_OPTS += -DGR_PYTHON_RELATIVE=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
