Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9FAC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:35:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7B8F61100
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B7B8F61100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E0E380E2B;
	Fri, 10 Sep 2021 11:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6h49_XY5zcjI; Fri, 10 Sep 2021 11:35:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D300080D7E;
	Fri, 10 Sep 2021 11:35:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8AB1BF9CB
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07AC18274D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:34:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yp6cJdP2l20l for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 11:34:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CA0A826DE
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 11:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A041A88CBE; Fri, 10 Sep 2021 11:33:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 13:33:53 +0200
X-Git-Refname: refs/heads/2021.05.x
X-Git-Oldrev: 6d50eb786ba19f5929f62c91fd0a30db4b812fc8
X-Git-Newrev: e78fce6e34227ecc11c5501d42b56f37b4762d52
X-Patchwork-Hint: ignore
Message-Id: <20210910113305.A041A88CBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.05.x] utils/getdeveloperlib.py:
 explicitly set devs document encoding
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e78fce6e34227ecc11c5501d42b56f37b4762d52
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Explicitly indicate the file encoding to UTF-8 for the DEVELOPERS
document. This prevents Unicode decoding errors when printing E-Mail
entries with Unicode characters on systems using an alternative default
encoding (e.g. 'CP1252').

This corrects the following observed error:

    $ ./utils/get-developers outgoing/*
    Traceback (most recent call last):
      File "utils\get-developers", line 105, in <module>
        __main__()
      File "utils\get-developers", line 47, in __main__
        devs = getdeveloperlib.parse_developers()
      File "...\buildroot\utils\getdeveloperlib.py", line 239, in parse_developers
        for line in f:
      File "...\Python<ver>\lib\encodings\cp1252.py", line 23, in decode
        return codecs.charmap_decode(input,self.errors,decoding_table)[0]
    UnicodeDecodeError: 'charmap' codec can't decode byte 0x81 in position 6659: character maps to <undefined>

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9f127cc420884adbd42f174ffa9973af01aa827b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/getdeveloperlib.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/utils/getdeveloperlib.py b/utils/getdeveloperlib.py
index b205817033..08abcfed54 100644
--- a/utils/getdeveloperlib.py
+++ b/utils/getdeveloperlib.py
@@ -1,4 +1,5 @@
 from __future__ import print_function
+from io import open
 import os
 import re
 import glob
@@ -231,7 +232,8 @@ def parse_developers():
     linen = 0
     global unittests
     unittests = list_unittests()
-    with open(os.path.join(brpath, "DEVELOPERS"), "r") as f:
+    developers_fname = os.path.join(brpath, 'DEVELOPERS')
+    with open(developers_fname, mode='r', encoding='utf_8') as f:
         files = []
         name = None
         for line in f:
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
