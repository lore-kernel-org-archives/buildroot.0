Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CC6C02196
	for <buildroot@archiver.kernel.org>; Fri,  7 Feb 2025 19:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A47281760;
	Fri,  7 Feb 2025 19:35:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OuCEJhTNlPhS; Fri,  7 Feb 2025 19:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 834628176D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 834628176D;
	Fri,  7 Feb 2025 19:35:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD1781B5
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B1DF704CD
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 90l6uFqzHsns for <buildroot@buildroot.org>;
 Fri,  7 Feb 2025 19:35:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1E9860AAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1E9860AAE
 for <buildroot@buildroot.org>; Fri,  7 Feb 2025 19:35:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9598687163; Fri,  7 Feb 2025 19:35:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Feb 2025 20:33:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a85c15e31906aca1e1a290808c0539a84e628294
X-Git-Newrev: d9d76e035164b0e781a826999fa293f126134a17
X-Patchwork-Hint: ignore
Message-Id: <20250207193542.9598687163@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-waitress: security bump to
 3.0.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d9d76e035164b0e781a826999fa293f126134a17
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Both 3.0.1 and 3.0.2 fix security issues.

In 3.0.1:

* Fix a bug that would lead to Waitress busy looping on select() on a
  half-open socket due to a race condition that existed when creating a
  new HTTPChannel. See https://github.com/Pylons/waitress/pull/435,
  https://github.com/Pylons/waitress/issues/418 and
  https://github.com/Pylons/waitress/security/advisories/GHSA-3f84-rpwh-47g6

* With thanks to Dylan Jay and Dieter Maurer for their extensive
  debugging and helping track this down.

* No longer strip the header values before passing them to the WSGI
  environ. See https://github.com/Pylons/waitress/pull/434 and
  https://github.com/Pylons/waitress/issues/432

* Fix a race condition in Waitress when channel_request_lookahead is
  enabled that could lead to HTTP request smuggling.
  See https://github.com/Pylons/waitress/security/advisories/GHSA-9298-4cf8-g4wj

In 3.0.2:

* When using Waitress to process trusted proxy headers, Waitress will
  now update the headers to drop any untrusted values, thereby making sure
  that WSGI apps only get trusted and validated values that Waitress
  itself used to update the environ. See
  https://github.com/Pylons/waitress/pull/452 and
  https://github.com/Pylons/waitress/issues/451

Full Changelog:
https://docs.pylonsproject.org/projects/waitress/en/latest/#change-history

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-waitress/python-waitress.hash | 4 ++--
 package/python-waitress/python-waitress.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-waitress/python-waitress.hash b/package/python-waitress/python-waitress.hash
index c1663a351a..40564457dd 100644
--- a/package/python-waitress/python-waitress.hash
+++ b/package/python-waitress/python-waitress.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/waitress/json
-md5  b8c671ed131b84a0099493f445c98014  waitress-3.0.0.tar.gz
-sha256  005da479b04134cdd9dd602d1ee7c49d79de0537610d653674cc6cbde222b8a1  waitress-3.0.0.tar.gz
+md5  da30daf4544fafe0f43e1ba4a1830bf5  waitress-3.0.2.tar.gz
+sha256  682aaaf2af0c44ada4abfb70ded36393f0e307f4ab9456a215ce0020baefc31f  waitress-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-waitress/python-waitress.mk b/package/python-waitress/python-waitress.mk
index c1618817dc..660f839a4d 100644
--- a/package/python-waitress/python-waitress.mk
+++ b/package/python-waitress/python-waitress.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WAITRESS_VERSION = 3.0.0
+PYTHON_WAITRESS_VERSION = 3.0.2
 PYTHON_WAITRESS_SOURCE = waitress-$(PYTHON_WAITRESS_VERSION).tar.gz
-PYTHON_WAITRESS_SITE = https://files.pythonhosted.org/packages/70/34/cb77e5249c433eb177a11ab7425056b32d3b57855377fa1e38b397412859
+PYTHON_WAITRESS_SITE = https://files.pythonhosted.org/packages/bf/cb/04ddb054f45faa306a230769e868c28b8065ea196891f09004ebace5b184
 PYTHON_WAITRESS_SETUP_TYPE = setuptools
 PYTHON_WAITRESS_LICENSE = ZPL-2.1
 PYTHON_WAITRESS_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
