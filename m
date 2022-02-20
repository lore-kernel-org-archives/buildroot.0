Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768D0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 21:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1238B60BB1;
	Sun, 20 Feb 2022 21:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4ixVCgr3BuIx; Sun, 20 Feb 2022 21:11:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DD0060692;
	Sun, 20 Feb 2022 21:11:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8581BF3D7
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:11:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2895660692
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 21:11:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NKPAp5H5kGQN for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 21:11:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C50E605C9
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 21:11:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1828DFF802;
 Sun, 20 Feb 2022 21:11:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nLtTv-005LH1-QG; Sun, 20 Feb 2022 22:10:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org, james.hilliard1@gmail.com, romain.naour@gmail.com
Date: Sun, 20 Feb 2022 22:10:54 +0100
Message-Id: <20220220211055.1273368-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing/../sample_python_pyyaml_dec.py:
 unbreak after move to pyaml 6.0
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
