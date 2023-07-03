Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17615C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EF9A81882;
	Mon,  3 Jul 2023 19:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EF9A81882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77JP-5iTtGvn; Mon,  3 Jul 2023 19:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA95D817B1;
	Mon,  3 Jul 2023 19:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA95D817B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 95C131BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B0254035D
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B0254035D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aX4AXU1wwk7j for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:35:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 907C140292
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 907C140292
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 785AF864E1; Mon,  3 Jul 2023 19:35:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 21:32:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ca4a986c9df314bdcf9786c6fe7d292fa75a198e
X-Git-Newrev: 94370ed250cba1f5cf01f4e8090df3ef0ca01337
X-Patchwork-Hint: ignore
Message-Id: <20230703193511.785AF864E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools: drop bogus
 select on missign symbol
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

commit: https://git.buildroot.net/buildroot/commit/?id=94370ed250cba1f5cf01f4e8090df3ef0ca01337
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 3b2913552e (package/python-setuptools: add missing dependency on
host-python-wheel) adding the select of the runtime, as a last-minute
fixup.

However, there is no target python-wheel package; it is a host-only
package, leading to sainty-check failures:

    $ make check-symbol
    package/python-setuptools/Config.in:5: BR2_PACKAGE_PYTHON_WHEEL referenced but not defined

Srop the select. If there was a rationale for actually having
python-wheel on the target, it's going to need a bit more.

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-setuptools/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-setuptools/Config.in b/package/python-setuptools/Config.in
index 73368c1a49..d47f758750 100644
--- a/package/python-setuptools/Config.in
+++ b/package/python-setuptools/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_PYTHON_SETUPTOOLS
 	bool "python-setuptools"
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
-	select BR2_PACKAGE_PYTHON_WHEEL # runtime
 	help
 	  Download, build, install, upgrade, and uninstall Python
 	  packages.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
