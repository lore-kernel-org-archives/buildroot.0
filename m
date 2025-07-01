Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DACEC7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 20:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 119C380F16;
	Tue,  1 Jul 2025 20:48:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0qJ_X2RYt31; Tue,  1 Jul 2025 20:48:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2785680E83
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2785680E83;
	Tue,  1 Jul 2025 20:48:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AA9B128
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CC8D418B3
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:48:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Ejp2EYi4une for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 20:48:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F4C9418AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F4C9418AF
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 20:48:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4DA48852CA; Tue,  1 Jul 2025 20:48:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 1 Jul 2025 22:42:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 394a8fb406fec6bcf65f8f924b107920eb9405fb
X-Git-Newrev: 184a1b94a589da215282aec9f515914ba7831804
X-Patchwork-Hint: ignore
Message-Id: <20250701204804.4DA48852CA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tinyxml: add patch for
 CVE-2023-34194
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=184a1b94a589da215282aec9f515914ba7831804
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes the following vulnerability:
- CVE-2023-34194:
    StringEqual in TiXmlDeclaration::Parse in tinyxmlparser.cpp in TinyXML
    through 2.6.2 has a reachable assertion (and application exit) via a
    crafted XML document with a '\0' located after whitespace.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...chable-assertion-via-crafted-XML-document.patch | 33 ++++++++++++++++++++++
 package/tinyxml/tinyxml.mk                         |  3 ++
 2 files changed, 36 insertions(+)

diff --git a/package/tinyxml/0002-Avoid-reachable-assertion-via-crafted-XML-document.patch b/package/tinyxml/0002-Avoid-reachable-assertion-via-crafted-XML-document.patch
new file mode 100644
index 0000000000..802d964e15
--- /dev/null
+++ b/package/tinyxml/0002-Avoid-reachable-assertion-via-crafted-XML-document.patch
@@ -0,0 +1,33 @@
+From: Guilhem Moulin <guilhem@debian.org>
+Date: Sat, 30 Dec 2023 14:15:54 +0100
+Subject: Avoid reachable assertion via crafted XML document with a '\0'
+ located after whitespace
+
+Upstream: https://salsa.debian.org/debian/tinyxml/-/raw/2366e1f23d059d4c20c43c54176b6bd78d6a83fc/debian/patches/CVE-2023-34194.patch
+
+CVE: CVE-2023-34194
+
+Bug: https://www.forescout.com/resources/sierra21-vulnerabilities
+Bug-Debian: https://bugs.debian.org/1059315
+Bug-Debian: https://security-tracker.debian.org/tracker/CVE-2023-34194
+Bug-Debian: https://security-tracker.debian.org/tracker/CVE-2023-40462
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ tinyxmlparser.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/tinyxmlparser.cpp b/src/tinyxmlparser.cpp
+index 8aa0dfa..1601962 100644
+--- a/src/tinyxmlparser.cpp
++++ b/src/tinyxmlparser.cpp
+@@ -1606,6 +1606,10 @@ const char* TiXmlDeclaration::Parse( const char* p, TiXmlParsingData* data, TiXm
+ 		}
+ 
+ 		p = SkipWhiteSpace( p, _encoding );
++		if ( !p || !*p )
++		{
++			break;
++		}
+ 		if ( StringEqual( p, "version", true, _encoding ) )
+ 		{
+ 			TiXmlAttribute attrib;
diff --git a/package/tinyxml/tinyxml.mk b/package/tinyxml/tinyxml.mk
index c6150b13fe..2f57b8a4f1 100644
--- a/package/tinyxml/tinyxml.mk
+++ b/package/tinyxml/tinyxml.mk
@@ -17,4 +17,7 @@ TINYXML_CPE_ID_VERSION = $(firstword $(subst _,$(space),$(TINYXML_VERSION)))
 # 0001-In-stamp-always-advance-the-pointer-if-p-0xef.patch
 TINYXML_IGNORE_CVES += CVE-2021-42260
 
+# 0002-Avoid-reachable-assertion-via-crafted-XML-document.patch
+TINYXML_IGNORE_CVES += CVE-2023-34194
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
