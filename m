Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F615FD7F93
	for <buildroot@archiver.kernel.org>; Fri, 27 Feb 2026 19:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F9D080835;
	Fri, 27 Feb 2026 19:21:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UQtLnRoQljUd; Fri, 27 Feb 2026 19:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1CD7C80068
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772220098;
	bh=JHlO+eNuHBWmJ3J8HxWaiqgyj6vgxmQOAXq/6JOA050=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=r18hbUQxmzZZDzU4LdEbl3/zc6Gm5TifHl/st2c8Ni4U15Kg+L1sW5xaEdUsahdTd
	 ENtK7jXkyBdmNxprsJsK60g3bSmSVCZhSHUouN4t3F+FSGp3iFq/IJlhJQakAfoMIz
	 egm7UxVReScoLZpXtFsi42AVeyeldN/bzqEBkPuS6y+jqCun6IPrP9ilWPixxEDbqC
	 Fgo98vrP48PJAppfZY1XNHOG+m+X2Jtc1w2FW+jKVUYGG5MsE5WIC2ALMJ4LsWxz1m
	 O3KfPTpxxxdqJxfCscS7eXIDl0ysMKxcmMMNGk0xP5gU/Mw6Psgljmy36O1Zms7Cml
	 /t+SOzwd1n1IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1CD7C80068;
	Fri, 27 Feb 2026 19:21:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0235204
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8652C831A5
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:21:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mp1uB1Z2VNQM for <buildroot@buildroot.org>;
 Fri, 27 Feb 2026 19:21:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 78E6E83168
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78E6E83168
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 78E6E83168
 for <buildroot@buildroot.org>; Fri, 27 Feb 2026 19:21:34 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MnJhU-1vEyoJ0tNs-00djpx; Fri, 27
 Feb 2026 20:21:31 +0100
To: buildroot@buildroot.org
Date: Fri, 27 Feb 2026 20:21:12 +0100
Message-ID: <20260227192112.3792145-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:dGSxGfzHXO2WxM8jg/E3M89fz+9f9HASEi0bxBpMVw1KBbXIGu5
 2URbZRpLwYrf2xKFR9LRIc9adrYLIC9HLHRdop8IPz4tRhEfQ0QH5/gdQbwvnWKfdbvIRHj
 6xBN0SVZycZL9HxON0NNwz+pRv0vhIoN6hgKtviShaNfNWLLap1USYhmI/26hTVFHVLaX+/
 tRyC8hmQDgx4yjq5Y+yKw==
UI-OutboundReport: notjunk:1;M01:P0:ORlY+4oW4zA=;jejqkB74XddBofP1cEIkkfft3qR
 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
 ytoTKSLoGhD
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1772220091; x=1772824891; i=fiona.klute@gmx.de;
 bh=rjXfx3iq2+2lDNFgytlFlYWqKhNc127eE62XoihKDX4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=MervNfqdGSxrzSNDfGG40WjI9pSxrE4NZvcj0tpAKJ0ZUMOQW2UbVBUPge1rpaZ6
 dKKQ4G7QA+KcFl93JdSuxWjz780MFSTYiORl+tmFmSIJD/KJeHXujUqVIBI3HRu/q
 xy+upjuVUhJyoDJDfK2KhntPRdWep5Ckymrquwq7QFHY+qMcfmpldqQ4IQGk/XA4y
 d0+Ocv6/94sUQZ5rVqHuoIlOgS4uF1OEYEc1hSruV+AZLW+jBxfawLQn2ih4lTLmz
 ROgglyYf5JQlkwLQGC92aZx9D3161ShFQXR3ezE7DnQqUIiaiM0fIwIvSbbs4jwL3
 9EA/WQrHzQKUo91CfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=MervNfqd
Subject: [Buildroot] [PATCH 1/1] support/testing: transfer config in
 environment instead of class variables
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>,
 Julien Olivain <ju.o@free.fr>, guenther.harrasser@mobileye.com,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With Python 3.14 the default process start method in the
multiprocessing module for POSIX platfroms changed from "fork" to
"forkserver". Unlike with "fork" the new process does not inherit
loaded modules, classes, etc., instead it has to load any it
needs. This means that class variables modified in the parent process
are lost, which breaks the way support/testing/run-tests sets
configuration in BRConfigTest.

Instead add a method to serialize the configuration into an
environment variable, and read it during
BRConfigTest.__init__(). Reading is skipped if the environment
variable is not set so test discovery (not execution) works without
configuration (e.g. utils/get-developers uses this).

The (de-)serialization could be simpler using a dedicated
@dataclasses.dataclass class, but the dataclasses module was added
with Python 3.7, while support/dependencies/check-host-python3.mk
specifies 3.4 as the minimum for Buildroot.

Remove the "fork" method override added in
3d2141bceefda32bef06ddda594eaf8665913276. This fixes a crash that
occured in combination with an incorrect [1] patch added to the Debian
python3-nose2 package with version 0.15.1-2 [2] because setting the
default multiprocessing start method twice is an error.

[1] https://github.com/nose-devs/nose2/pull/644#issuecomment-3902982437
[2] https://salsa.debian.org/python-team/packages/nose2/-/blob/debian/0.15.1-2/debian/patches/0004-plugins-mp-set-context-to-fork-for-Python-3.14-mp-AP.patch?ref_type=tags

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
I'd be happy to rewrite using @dataclasses.dataclass if a bit less
backwards compatibility is fine, but getting that crash fixed is more
important to me. That said, the oldest Python version still supported
upstream is 3.10, Debian Trixie has 3.13, Bookworm (oldstable) 3.11,
so maybe raising the requirement a little is fine?

 support/testing/infra/basetest.py | 33 +++++++++++++++++++++++++++++++
 support/testing/run-tests         |  3 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 13f9b2d398..55567448fe 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -1,6 +1,7 @@
 import unittest
 import os
 import datetime
+import json
 
 from infra.builder import Builder
 from infra.emulator import Emulator
@@ -33,8 +34,16 @@ class BRConfigTest(unittest.TestCase):
     jlevel = 0
     timeout_multiplier = 1
 
+    # name of the environment variable for config transfer
+    CONF_ENV = 'BR_TEST_CONFIG_JSON'
+    _CONF_FIELDS = (
+        'downloaddir', 'outputdir', 'logtofile', 'keepbuilds', 'jlevel',
+        'timeout_multiplier')
+
     def __init__(self, names):
         super(BRConfigTest, self).__init__(names)
+        if self.CONF_ENV in os.environ:
+            self.load_conf(os.environ[self.CONF_ENV])
         self.testname = self.__class__.__name__
         self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
         self.config += '\nBR2_DL_DIR="{}"\n'.format(self.downloaddir)
@@ -44,6 +53,30 @@ class BRConfigTest(unittest.TestCase):
         print("{} {:40s} {}".format(datetime.datetime.now().strftime("%H:%M:%S"),
                                     self.testname, msg))
 
+    @classmethod
+    def dump_conf(cls) -> str:
+        """support/testing/run-tests builds runtime config in class
+        variables, and then uses this method to serialize them into an
+        environment variable. On instantiation, tests use load_conf()
+        (below) to load this configuration. That way configuration can
+        be transferred into multiprocessing worker processes without
+        requiring the "fork" start method.
+
+        """
+        conf = dict()
+        for c in cls._CONF_FIELDS:
+            v = getattr(cls, c)
+            assert v is not None
+            conf[c] = v
+        return json.dumps(conf)
+
+    def load_conf(self, data: str) -> None:
+        conf = json.loads(data)
+        for c in self._CONF_FIELDS:
+            v = conf[c]
+            assert v is not None
+            setattr(self, c, v)
+
     def setUp(self):
         self.show_msg("Starting")
         self.b = Builder(self.config, self.builddir, self.logtofile, self.jlevel)
diff --git a/support/testing/run-tests b/support/testing/run-tests
index 1c4d2b4a85..8a79cbb104 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -127,6 +127,8 @@ def main():
         return 1
     BRConfigTest.timeout_multiplier = args.timeout_multiplier
 
+    os.environ[BRConfigTest.CONF_ENV] = BRConfigTest.dump_conf()
+
     nose2_args = ["-v",
                   "-N", str(args.testcases),
                   "-s", test_dir,
@@ -142,5 +144,4 @@ def main():
 
 
 if __name__ == "__main__":
-    multiprocessing.set_start_method("fork")
     sys.exit(main())
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
