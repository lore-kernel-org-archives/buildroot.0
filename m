Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072DACA0EC0
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD73E80C9C;
	Thu,  7 Aug 2025 17:01:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdyGEakyYeKK; Thu,  7 Aug 2025 17:01:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B893080C4E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B893080C4E;
	Thu,  7 Aug 2025 17:01:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01CE3233
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC60180C3C
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdEENn0XzKs4 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7335280C0D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7335280C0D
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 715C2868A1; Thu,  7 Aug 2025 17:00:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:38 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b1c9922b2e094daea734def33f339ee68552ed4e
X-Git-Newrev: 96df7f1b017284f32b348e513793f296269a5b40
X-Patchwork-Hint: ignore
Message-Id: <20250807170021.715C2868A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-starlette:
 security bump to v0.47.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=96df7f1b017284f32b348e513793f296269a5b40
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

For release note, see:
https://github.com/encode/starlette/releases/tag/0.47.2

This fixes the following vulnerability:

- CVE-2025-54121:
    Starlette is a lightweight ASGI (Asynchronous Server Gateway
    Interface) framework/toolkit, designed for building async web services
    in Python. In versions 0.47.1 and below, when parsing a multi-part
    form with large files (greater than the default max spool size)
    starlette will block the main thread to roll the file over to disk.
    This blocks the event thread which means the application can't accept
    new connections. The UploadFile code has a minor bug where instead of
    just checking for self._in_memory, the logic should also check if the
    additional bytes will cause a rollover. The vulnerability is fixed in
    version 0.47.2.
    https://www.cve.org/CVERecord?id=CVE-2025-54121

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Reviewed-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Julien: add link to release note]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 8945ea3e671954ec7c36f0000a707184c7686234)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index be23e4ccb1..5939eb198f 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  b876ddd8665f70bb74e45d1fda053699  starlette-0.47.1.tar.gz
-sha256  aef012dd2b6be325ffa16698f9dc533614fb1cebd593a906b90dc1025529a79b  starlette-0.47.1.tar.gz
+md5  b58c9f8d38df9946689cb3e9f94555da  starlette-0.47.2.tar.gz
+sha256  6ae9aa5db235e4846decc1e7b79c4f346adf41e9777aebeb49dfd09bbd7023d8  starlette-0.47.2.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index eb49230600..4037903cc5 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.47.1
+PYTHON_STARLETTE_VERSION = 0.47.2
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/0a/69/662169fdb92fb96ec3eaee218cf540a629d629c86d7993d9651226a6789b
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/04/57/d062573f391d062710d4088fa1369428c38d51460ab6fedff920efef932e
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
