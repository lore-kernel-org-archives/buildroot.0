Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7D4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 09:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 09257417BC;
	Sun, 24 Jul 2022 09:19:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09257417BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dty0oxL5hZ73; Sun, 24 Jul 2022 09:19:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FEB241735;
	Sun, 24 Jul 2022 09:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FEB241735
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 92BF21BF964
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:19:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6CD7D60FE6
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 09:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CD7D60FE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mQyEl9ULtiSg for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 09:19:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA5AA60B56
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 09:19:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA5AA60B56
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D843C856A9; Sun, 24 Jul 2022 09:05:29 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 10:58:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48ff8d5a71fa7eb11cc882e9061cbadb6a460e13
X-Git-Newrev: ff3b5ca2c11bae44a5410da6f8630fff1971c063
X-Patchwork-Hint: ignore
Message-Id: <20220724090529.D843C856A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-lxml: security bump to
 version 4.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff3b5ca2c11bae44a5410da6f8630fff1971c063
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-2309: NULL Pointer Dereference allows attackers to cause a
denial of service (or application crash). This only applies when lxml is
used together with libxml2 2.9.10 through 2.9.14. libxml2 2.9.9 and
earlier are not affected. It allows triggering crashes through forged
input data, given a vulnerable code sequence in the application. The
vulnerability is caused by the iterwalk function (also used by the
canonicalize function). Such code shouldn't be in wide-spread use, given
that parsing + iterwalk would usually be replaced with the more
efficient iterparse function. However, an XML converter that serialises
to C14N would also be vulnerable, for example, and there are legitimate
use cases for this code sequence. If untrusted input is received (also
remotely) and processed via iterwalk function, a crash can be
triggered.

https://github.com/lxml/lxml/blob/lxml-4.9.1/CHANGES.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-lxml/python-lxml.hash | 2 +-
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index 3600d7759a..cd1943b0b4 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  f63f62fc60e6228a4ca9abae28228f35e1bd3ce675013d1dfb828688d50c6e23  lxml-4.8.0.tar.gz
+sha256  fe749b052bb7233fe5d072fcb549221a8cb1a16725c47c37e42b0b9cb3ff2c3f  lxml-4.9.1.tar.gz
 sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index 90935a7ee1..050495c3f3 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 4.8.0
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/3b/94/e2b1b3bad91d15526c7e38918795883cee18b93f6785ea8ecf13f8ffa01e
+PYTHON_LXML_VERSION = 4.9.1
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/70/bb/7a2c7b4f8f434aa1ee801704bf08f1e53d7b5feba3d5313ab17003477808
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
