Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74232C433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:20:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C32B61A79
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 22:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C32B61A79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFFCF4033B;
	Tue,  9 Nov 2021 22:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lSCSfCGln702; Tue,  9 Nov 2021 22:20:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9746403C5;
	Tue,  9 Nov 2021 22:20:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C8681BF3C2
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5B08403BA
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 22:19:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q141Kx6gGrLV for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 22:19:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BAED3403D0
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 22:19:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 240548B82A; Tue,  9 Nov 2021 22:15:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 9 Nov 2021 21:48:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d8a422e277b03f164c7002cd0e8b1a8f87c8a6a8
X-Git-Newrev: b658a44ab5f40f9e828e1bc3ca3e28620d6d9092
X-Patchwork-Hint: ignore
Message-Id: <20211109221516.240548B82A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: needs python3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b658a44ab5f40f9e828e1bc3ca3e28620d6d9092
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python 2 support has been dropped since version 3.0.0 and
https://github.com/ultrajson/ultrajson/commit/0673d237cf5589a2a059771f694d5fbc5a293b13
resulting in the following build failure since bump to version 4.1.0 in
commit a47f332a20bf3f79ef4903c8ddd2b7917217e354:

./python/ujson.c:79:15: error: variable 'moduledef' has initializer but incomplete type
   79 | static struct PyModuleDef moduledef = {
      |               ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/61cc675281ba25d6ebee4892175e9c7222aabb79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-ujson/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-ujson/Config.in b/package/python-ujson/Config.in
index d185c98532..aee1d75fce 100644
--- a/package/python-ujson/Config.in
+++ b/package/python-ujson/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_UJSON
 	bool "python-ujson"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  UltraJSON is an ultra fast JSON encoder and decoder written
-	  in pure C with bindings for Python 2.5+ and 3.
+	  in pure C with bindings for Python 3.
 
 	  https://pypi.python.org/pypi/ujson
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
