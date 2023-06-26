Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BA9EB64D7
	for <buildroot@archiver.kernel.org>; Mon, 26 Jun 2023 07:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF68F41142;
	Mon, 26 Jun 2023 07:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF68F41142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7R5B8FiM-01q; Mon, 26 Jun 2023 07:06:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF8884117A;
	Mon, 26 Jun 2023 07:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF8884117A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 67D4B1BF390
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 07:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D87A40980
 for <buildroot@lists.busybox.net>; Mon, 26 Jun 2023 07:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D87A40980
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gvQU4DM0jQlp for <buildroot@lists.busybox.net>;
 Mon, 26 Jun 2023 07:05:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48D8D4098B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48D8D4098B
 for <buildroot@buildroot.org>; Mon, 26 Jun 2023 07:05:45 +0000 (UTC)
Received: from bricolage.. (unknown
 [IPv6:2a01:e0a:c7e:7060:468a:5bff:fe9a:3c4d])
 by smtp1-g21.free.fr (Postfix) with ESMTP id 170C8B00563;
 Mon, 26 Jun 2023 09:05:39 +0200 (CEST)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jun 2023 09:05:36 +0200
Message-Id: <20230626070536.311268-2-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230626070536.311268-1-gwenj@trabucayre.com>
References: <20230626070536.311268-1-gwenj@trabucayre.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/gnuradio: fix gnuradio python
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
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

By adding -DPYTHON_MODULE_EXTENSION=".so" at configure time, pybind11 will use
this option instead of using host-python to forge suffix.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v1 -> v2:
- replaces patch by PYTHON_MODULE_EXTENSION option (result is the same
  but less "noisy")
---
 package/gnuradio/gnuradio.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index 1453b78493..d7b3b86c31 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -119,6 +119,8 @@ GNURADIO_CONF_OPTS += -DENABLE_PYTHON=ON
 # mandatory to avoid pybind11 to overwrite variables provided
 # by gnuradio and buildroot
 GNURADIO_CONF_OPTS += -DPYBIND11_PYTHONLIBS_OVERWRITE=OFF
+# force libraries suffix (avoid to have libxxx.PYTHONVER-HOST_ARCH.so)
+GNURADIO_CONF_OPTS += -DPYTHON_MODULE_EXTENSION=".so"
 # mandatory to install python modules in site-packages and to use
 # correct path for python libraries
 GNURADIO_CONF_OPTS += -DGR_PYTHON_RELATIVE=ON \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
