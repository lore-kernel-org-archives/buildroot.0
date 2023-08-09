Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1BAEEE49AA
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:09:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7A2BB40B22;
	Mon, 21 Aug 2023 20:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A2BB40B22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5HBTIEuDIH1K; Mon, 21 Aug 2023 20:09:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EFAB40C0A;
	Mon, 21 Aug 2023 20:09:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9EFAB40C0A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED5501BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43C1960F60
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43C1960F60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EoQErcaMrQZL for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C9B160E82
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C9B160E82
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D8D986025; Mon, 21 Aug 2023 20:01:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Aug 2023 20:16:38 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 244a8c52ef25bafdee6577d08e47c091b2093cc8
X-Git-Newrev: b84ffd85e2900741bb97325b53d09e170e941e6c
X-Patchwork-Hint: ignore
Message-Id: <20230821200125.6D8D986025@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python3: berkeleydb
 support needs the dbm interface
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b84ffd85e2900741bb97325b53d09e170e941e6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
