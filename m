Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025DAECAAD1
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 19:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C89983168;
	Wed, 31 Aug 2022 19:38:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C89983168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cs5uRVptWwj1; Wed, 31 Aug 2022 19:38:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7E6F8315C;
	Wed, 31 Aug 2022 19:38:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7E6F8315C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 051A81C1148
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 19:38:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2BF540156
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 19:38:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2BF540156
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6wqlXhYixYtR for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 19:38:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E556D4012D
 for <buildroot@buildroot.org>; Wed, 31 Aug 2022 19:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E556D4012D
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8C3F288146; Wed, 31 Aug 2022 19:23:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 31 Aug 2022 21:21:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f2c0c24d310cc7f9393be6ce37594fcadc63a5a
X-Git-Newrev: 2526a2f51fce00084a645aec0bdae5471c5ab626
X-Patchwork-Hint: ignore
Message-Id: <20220831192321.8C3F288146@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-paho-mqtt: fix package for
 python 3.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=2526a2f51fce00084a645aec0bdae5471c5ab626
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following error on calling mqtt.publish():

  File "/usr/lib/python3.10/site-packages/paho/mqtt/publish.py", line 222, in single
    multiple([msg], hostname, port, client_id, keepalive, will, auth, tls,
  File "/usr/lib/python3.10/site-packages/paho/mqtt/publish.py", line 126, in multiple
    if not isinstance(msgs, collections.Iterable):
AttributeError: module 'collections' has no attribute 'Iterable'

Backported from https://github.com/eclipse/paho.mqtt.python/pull/497/

This was deprecated in python 3.9 and stopped working in python 3.10

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-fix-publish-for-python-3-10.patch         | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch b/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch
new file mode 100644
index 0000000000..aad6b5d723
--- /dev/null
+++ b/package/python-paho-mqtt/0001-fix-publish-for-python-3-10.patch
@@ -0,0 +1,37 @@
+From e1c45570f61f9d6b28f8604c8a8cd6dd94f959ed Mon Sep 17 00:00:00 2001
+From: Brishen Hawkins <brishen.hawkins@gmail.com>
+Date: Tue, 9 Jun 2020 00:18:39 -0600
+Subject: [PATCH] Fix for Python 3.9 moving Iterable to collections.abc
+
+Signed-off-by: Brishen Hawkins <brishen.hawkins@gmail.com>
+
+Backported from: e1c45570f61f9d6b28f8604c8a8cd6dd94f959ed
+Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+---
+ src/paho/mqtt/publish.py | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/src/paho/mqtt/publish.py b/src/paho/mqtt/publish.py
+index f9f1986e..dcb34ff1 100644
+--- a/src/paho/mqtt/publish.py
++++ b/src/paho/mqtt/publish.py
+@@ -21,6 +21,10 @@
+ from __future__ import absolute_import
+ 
+ import collections
++try:
++    from collections.abc import Iterable
++except ImportError:
++    from collections import Iterable
+ 
+ from . import client as paho
+ from .. import mqtt
+@@ -124,7 +128,7 @@ def multiple(msgs, hostname="localhost", port=1883, client_id="", keepalive=60,
+     proxy_args: a dictionary that will be given to the client.
+     """
+ 
+-    if not isinstance(msgs, collections.Iterable):
++    if not isinstance(msgs, Iterable):
+         raise TypeError('msgs must be an iterable')
+ 
+     client = paho.Client(client_id=client_id, userdata=collections.deque(msgs),
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
