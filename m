Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161D3C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 12:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A811740226;
	Sun,  5 Feb 2023 12:08:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A811740226
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PP2zctf5vA7U; Sun,  5 Feb 2023 12:08:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A47C4022E;
	Sun,  5 Feb 2023 12:08:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A47C4022E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 027EA1BF364
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC3A840226
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 12:08:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC3A840226
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mJdF22wnperY for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 12:08:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B89334022E
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 12:08:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B89334022E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F59D8373B; Sun,  5 Feb 2023 12:08:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 5 Feb 2023 13:05:42 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: db058b26f0694742a12381e2075ef297cdff076c
X-Git-Newrev: 486eae3194824239eab90a71c61be4154ec1a0c6
X-Patchwork-Hint: ignore
Message-Id: <20230205120807.9F59D8373B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/git: security
 bump to version 2.31.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=486eae3194824239eab90a71c61be4154ec1a0c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fixes the following security issues:

 * CVE-2022-41903:

   git log has the ability to display commits using an arbitrary
   format with its --format specifiers. This functionality is also
   exposed to git archive via the export-subst gitattribute.

   When processing the padding operators (e.g., %<(, %<|(, %>(,
   %>>(, or %><( ), an integer overflow can occur in
   pretty.c::format_and_pad_commit() where a size_t is improperly
   stored as an int, and then added as an offset to a subsequent
   memcpy() call.

   This overflow can be triggered directly by a user running a
   command which invokes the commit formatting machinery (e.g., git
   log --format=...). It may also be triggered indirectly through
   git archive via the export-subst mechanism, which expands format
   specifiers inside of files within the repository during a git
   archive.

   This integer overflow can result in arbitrary heap writes, which
   may result in remote code execution.

 * CVE-2022-23521:

    gitattributes are a mechanism to allow defining attributes for
    paths. These attributes can be defined by adding a `.gitattributes`
    file to the repository, which contains a set of file patterns and
    the attributes that should be set for paths matching this pattern.

    When parsing gitattributes, multiple integer overflows can occur
    when there is a huge number of path patterns, a huge number of
    attributes for a single pattern, or when the declared attribute
    names are huge.

    These overflows can be triggered via a crafted `.gitattributes` file
    that may be part of the commit history. Git silently splits lines
    longer than 2KB when parsing gitattributes from a file, but not when
    parsing them from the index. Consequentially, the failure mode
    depends on whether the file exists in the working tree, the index or
    both.

    This integer overflow can result in arbitrary heap reads and writes,
    which may result in remote code execution.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/git/git.hash | 2 +-
 package/git/git.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/git/git.hash b/package/git/git.hash
index af09ea817b..9a472b49ec 100644
--- a/package/git/git.hash
+++ b/package/git/git.hash
@@ -1,5 +1,5 @@
 # From: https://www.kernel.org/pub/software/scm/git/sha256sums.asc
-sha256  dbc80f88d36fcde2c7acaaa9343cfab0f56effe9aee60e5eb00f3f36b8a619b4  git-2.31.5.tar.xz
+sha256  e0fa851e4ccb990c57793a3cfcbf7c8981fbacab175025ea15db9ecd57434cee  git-2.31.6.tar.xz
 # Locally calculated
 sha256  5b2198d1645f767585e8a88ac0499b04472164c0d2da22e75ecf97ef443ab32e  COPYING
 sha256  1922f45d2c49e390032c9c0ba6d7cac904087f7cec51af30c2b2ad022ce0e76a  LGPL-2.1
diff --git a/package/git/git.mk b/package/git/git.mk
index 653b4f46ad..0b4e93a8b6 100644
--- a/package/git/git.mk
+++ b/package/git/git.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GIT_VERSION = 2.31.5
+GIT_VERSION = 2.31.6
 GIT_SOURCE = git-$(GIT_VERSION).tar.xz
 GIT_SITE = $(BR2_KERNEL_MIRROR)/software/scm/git
 GIT_LICENSE = GPL-2.0, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
