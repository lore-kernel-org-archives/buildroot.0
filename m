Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49034E6F091
	for <buildroot@archiver.kernel.org>; Fri,  1 Nov 2024 21:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6D8A605D8;
	Fri,  1 Nov 2024 21:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyH4g0fcjtGg; Fri,  1 Nov 2024 21:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ABF6606D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ABF6606D6;
	Fri,  1 Nov 2024 21:36:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 377F4112A
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18909813CC
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cOa0gHaDO4EW for <buildroot@buildroot.org>;
 Fri,  1 Nov 2024 21:36:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56FBA813A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56FBA813A2
 for <buildroot@buildroot.org>; Fri,  1 Nov 2024 21:36:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C3B4857AE; Fri,  1 Nov 2024 21:36:31 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 1 Nov 2024 22:31:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7cd3741b5a69d6a90cd00ee27e48367f5d0517a
X-Git-Newrev: 7f1de644272f359dcb0aba62e142663ea9720b8b
X-Patchwork-Hint: ignore
Message-Id: <20241101213631.3C3B4857AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-twisted: add missing
 python3-zlib dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=7f1de644272f359dcb0aba62e142663ea9720b8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently the test TestPythonTwisted is not broken [1] since it doesn't
test all modules provided by python-twisted package.

But TestPythonTwisted should have failed due to missing zlib in
twisted/web/client.py and twisted/conch modules.

Due to this, other runtime test like TestPythonPy3MagicWormhole or
TestPythonPy3Txtorcon are currently broken [2][3].

Add missing python3-zlib dependency and update
sample_python_twisted.py to load twisted/web/client that uses zlib
module.

[1] https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992685
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992687
[3] https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992646

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992687 (TestPythonPy3Txtorcon)

Fixes (partially due to missing python xml dependency):
https://gitlab.com/buildroot.org/buildroot/-/jobs/8199992646 (TestPythonPy3MagicWormhole)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-twisted/Config.in                       | 1 +
 support/testing/tests/package/sample_python_twisted.py | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/python-twisted/Config.in b/package/python-twisted/Config.in
index 84786689b7..2d2bc30972 100644
--- a/package/python-twisted/Config.in
+++ b/package/python-twisted/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_PYTHON_TWISTED
 	select BR2_PACKAGE_PYTHON_HYPERLINK # runtime
 	select BR2_PACKAGE_PYTHON_ZOPE_INTERFACE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Twisted is an event-driven networking engine written in
 	  Python.
diff --git a/support/testing/tests/package/sample_python_twisted.py b/support/testing/tests/package/sample_python_twisted.py
index 47d6c5debc..b5540522fc 100644
--- a/support/testing/tests/package/sample_python_twisted.py
+++ b/support/testing/tests/package/sample_python_twisted.py
@@ -1,4 +1,5 @@
 from twisted.internet import protocol, reactor, endpoints
+from twisted.web.client import readBody  # noqa: F401
 
 
 class F(protocol.Factory):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
