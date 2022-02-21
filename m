Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1B6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 20:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 40D104026F;
	Mon, 21 Feb 2022 20:57:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHx7BHrz2plo; Mon, 21 Feb 2022 20:57:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26DBF4019B;
	Mon, 21 Feb 2022 20:57:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7467F1BF279
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61CB5813EC
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 20:56:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nKH42xGYFNKu for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 20:56:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4BD6813E6
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 20:56:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BB0BA8110D; Mon, 21 Feb 2022 20:49:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Feb 2022 21:56:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3d0d7e6ff1d1c723c3ab0c338d4ddf1ae415e69
X-Git-Newrev: a83177aac627764fb7ab5dc6bd87646586598934
X-Patchwork-Hint: ignore
Message-Id: <20220221204906.BB0BA8110D@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 support/testing/../sample_python_pyyaml_dec.py: unbreak after move to pyaml
 6.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a83177aac627764fb7ab5dc6bd87646586598934
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/2088684091

python sample_python_pyyaml_dec.py
Traceback (most recent call last):
  File "/root/sample_python_pyyaml_dec.py", line 5, in <module>
    data = yaml.load(serialized)
TypeError: load() missing 1 required positional argument: 'Loader'

yaml.load() requires a loader argument since the move to version 6.0:
https://github.com/yaml/pyyaml/pull/561

The test does not need the extra functionality of load(), so instead move to
the recommended safe_load().

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/sample_python_pyyaml_dec.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/sample_python_pyyaml_dec.py b/support/testing/tests/package/sample_python_pyyaml_dec.py
index 9ab8931197..bb90934f26 100644
--- a/support/testing/tests/package/sample_python_pyyaml_dec.py
+++ b/support/testing/tests/package/sample_python_pyyaml_dec.py
@@ -2,7 +2,7 @@ import yaml
 
 with open("/tmp/data.yml", "rb") as f:
     serialized = f.read()
-data = yaml.load(serialized)
+data = yaml.safe_load(serialized)
 print(data)
 assert(data["name"] == "python-pyyaml")
 assert(data["versions"] == ["1", "2"])
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
