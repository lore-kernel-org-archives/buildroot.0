Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5093CA0EC1
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 21:00:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83048417D2;
	Mon, 11 Sep 2023 21:00:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83048417D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WzaXUSyQqUng; Mon, 11 Sep 2023 21:00:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29779417BE;
	Mon, 11 Sep 2023 21:00:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29779417BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0F7CE1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5379781E84
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:58:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5379781E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J_uuvWlLusN7 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 20:58:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D3BB81EB4
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 20:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D3BB81EB4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D6DF86D44; Mon, 11 Sep 2023 20:58:23 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 22:48:31 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 5c6c6d9634fe47a6b356a37389d59e6ab37ae78f
X-Git-Newrev: 78c648a8f3ac01402e9bd3b99620e75e62bc5223
X-Patchwork-Hint: ignore
Message-Id: <20230911205823.6D6DF86D44@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/python3:
 berkeleydb support needs the dbm interface
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

commit: https://git.buildroot.net/buildroot/commit/?id=78c648a8f3ac01402e9bd3b99620e75e62bc5223
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Until now, the Python build system was building a _dbm.cpython-*.so
native module when BR2_PACKAGE_PYTHON3_BERKELEYDB was enabled, but
since the bump of Python to 3.11.x, it was no longer building this
native module.

Investigation this, we found out that Python 3.11 changed how libdb
was detected [1] and that check now fails:

quoting configure log:
checking for libdb... no

quoting python config.log:
conftest.c:(.text.startup+0x8): undefined reference to `__db_ndbm_open'

However, in fact it turns that this problem is not new in Python
3.11. In Python 3.10, the build system was always producing the native
module, but it was in fact not working at runtime:

>>> from _dbm import *
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ImportError: /usr/lib/python3.10/lib-dynload/_dbm.cpython-310-arm-linux-gnueabihf.so: undefined symbol: __db_ndbm_delete

It was not really visible because when one does "import dbm", it
actually tries several "backends", including ndbm (which relies on
_dbm above), and if it doesn't work, it falls back silently on a pure
Python implementation.

So the issue was never noticed, but has already been there,
potentially forever.

In order for this _dbm native module to be built (Python >= 3.11) or
to work (Python < 3.11), the BerkeleyDB library need to be built with
its so-called "dbm" interface, which we do by selecting select
BR2_PACKAGE_BERKELEYDB_DBM.

And now:

>>> import _dbm
>>>

[1] https://github.com/python/cpython/blob/d2340ef25721b6a72d45d4508c672c4be38c67d3/configure.ac#L4002

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Thomas: did more research to have a better explanation of what is
happening, and realize the problem is not related to Python 3.11]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b84ffd85e2900741bb97325b53d09e170e941e6c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index 761c38c850..38f0580aa4 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -48,6 +48,7 @@ config BR2_PACKAGE_PYTHON3_2TO3
 config BR2_PACKAGE_PYTHON3_BERKELEYDB
 	bool "berkeleydb"
 	select BR2_PACKAGE_BERKELEYDB
+	select BR2_PACKAGE_BERKELEYDB_DBM
 	help
 	  berkeleydb module for Python3
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
