Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF36E6F092
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 21:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A0B2402AF;
	Fri,  1 Nov 2024 21:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kltD-jENGi4h; Fri,  1 Nov 2024 21:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27C81402BA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27C81402BA;
	Fri,  1 Nov 2024 21:36:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6881F59D9
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49431606BE
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5DNYTrKYBXL for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 21:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A398606C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A398606C0
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:36:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 50C0D857B1; Fri,  1 Nov 2024 21:36:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 1 Nov 2024 22:31:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7f1de644272f359dcb0aba62e142663ea9720b8b
X-Git-Newrev: 1b968093045dec4256a90f5ca2c533e8e4a38347
X-Patchwork-Hint: ignore
Message-Id: <20241101213631.50C0D857B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-twisted: add missing
 python3-xml dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1b968093045dec4256a90f5ca2c533e8e4a38347
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the test TestPythonTwisted is not broken [1] since it doesn't
test all modules provided by python-twisted package.

But TestPythonTwisted should have failed due to missing xml in
twisted/web module.

Due to this, TestPythonPy3MagicWormhole runtime test is currently
broken.

Add missing python3-xml dependency and update
sample_python_twisted.py to load twisted/web that uses xml
module.

Fixes (partially due to missing python setuptool in
python-magic-wormhole-mailbox-server):
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992646

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-twisted/Config.in                       | 1 +
 support/testing/tests/package/sample_python_twisted.py | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 2d2bc30972..3254278fe9 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_TWISTED
 	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Twisted is an event-driven networking engine written in
diff --git a/support/testing/tests/package/sample_python_twisted.py b/support/testing/tests/package/sample_python_twisted.py
index b5540522fc..ec5ce2a31c 100644
--- a/support/testing/tests/package/sample_python_twisted.py
+++ b/support/testing/tests/package/sample_python_twisted.py
@@ -1,5 +1,6 @@
 from twisted.internet import protocol, reactor, endpoints
 from twisted.web.client import readBody  # noqa: F401
+from twisted.web import xmlrpc, server  # noqa: F401
 
 
 class F(protocol.Factory):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
