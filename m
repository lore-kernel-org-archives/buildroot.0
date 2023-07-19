Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9746DEB64DA
	for <buildroot@archiver.kernel.org>; Wed, 19 Jul 2023 12:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8C9D4180D;
	Wed, 19 Jul 2023 12:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8C9D4180D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hk19lerUf4Xw; Wed, 19 Jul 2023 12:42:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D820E417B5;
	Wed, 19 Jul 2023 12:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D820E417B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E40E1BF39D
 for <buildroot@lists.busybox.net>; Wed, 19 Jul 2023 12:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52CB2417B5
 for <buildroot@lists.busybox.net>; Wed, 19 Jul 2023 12:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52CB2417B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CoChTZog6Skb for <buildroot@lists.busybox.net>;
 Wed, 19 Jul 2023 12:42:20 +0000 (UTC)
X-Greylist: delayed 328 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 19 Jul 2023 12:42:20 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0490A401C3
Received: from mail (kmf.trabucayre.com [91.121.117.161])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0490A401C3
 for <buildroot@buildroot.org>; Wed, 19 Jul 2023 12:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
 by mail (Postfix) with ESMTP id A505039856;
 Wed, 19 Jul 2023 13:57:39 +0200 (CEST)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Wed, 19 Jul 2023 13:57:38 +0200
Message-Id: <1689767858-17206-1-git-send-email-gwenj@trabucayre.com>
X-Mailer: git-send-email 1.6.4.2
Subject: [Buildroot] [PATCH v3] package/gnuradio: fix gnuradio python
 libraries for cross-compile
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

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
---
Changes v2 -> v3:
- replaces PYTHON_MODULE_EXTENSION by _PYTHON_SYSCONFIGDATA_NAME env (arnout)
Changes v1 -> v2:
- replaces patch by PYTHON_MODULE_EXTENSION option (result is the same
  but less "noisy")
---
 package/gnuradio/gnuradio.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 85b359088e..4e82c9e129 100644
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
