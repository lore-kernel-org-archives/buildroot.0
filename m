Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D48C4332F
	for <buildroot@archiver.kernel.org>; Sat, 26 Nov 2022 18:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D85AC415FF;
	Sat, 26 Nov 2022 18:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D85AC415FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3I75o4PgwCe5; Sat, 26 Nov 2022 18:57:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 985E441602;
	Sat, 26 Nov 2022 18:57:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 985E441602
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AFDF11BF85D
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C1D160E3D
 for <buildroot@lists.busybox.net>; Sat, 26 Nov 2022 18:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C1D160E3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f5T5_FbWuBvW for <buildroot@lists.busybox.net>;
 Sat, 26 Nov 2022 18:57:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95D5C60E34
 for <buildroot@buildroot.org>; Sat, 26 Nov 2022 18:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95D5C60E34
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84801847EF; Sat, 26 Nov 2022 18:57:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 26 Nov 2022 19:55:23 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 6dade24c431a63d2df43c53692391a1046235122
X-Git-Newrev: e5869ad653ace20b65cb9ada9bb7acb7ed42844a
X-Patchwork-Hint: ignore
Message-Id: <20221126185702.84801847EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/heimdal: security
 bump to version 7.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=e5869ad653ace20b65cb9ada9bb7acb7ed42844a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

This release fixes the following Security Vulnerabilities:

- CVE-2022-42898 PAC parse integer overflows
- CVE-2022-3437 Overflows and non-constant time leaks in DES{,3} and
  arcfour
- CVE-2022-41916 Fix Unicode normalization read of 1 bytes past end of
  array
- CVE-2021-44758 NULL dereference DoS in SPNEGO acceptors
- CVE-2021-3671 A null pointer de-reference when handling missing sname
  in TGS-REQ
- CVE-2022-44640 Heimdal KDC: invalid free in ASN.1 codec

  Note that CVE-2022-44640 is a severe vulnerability, possibly a 10.0
  on the Common Vulnerability Scoring System (CVSS) v3, as we believe
  it should be possible to get an RCE on a KDC, which means that
  credentials can be compromised that can be used to impersonate
  anyone in a realm or forest of realms.

  Heimdal's ASN.1 compiler generates code that allows specially
  crafted DER encodings of CHOICEs to invoke the wrong free function
  on the decoded structure upon decode error. This is known to impact
  the Heimdal KDC, leading to an invalid free() of an address partly
  or wholly under the control of the attacker, in turn leading to a
  potential remote code execution (RCE) vulnerability.

  This error affects the DER codec for all extensible CHOICE types
  used in Heimdal, though not all cases will be exploitable. We have
  not completed a thorough analysis of all the Heimdal components
  affected, thus the Kerberos client, the X.509 library, and other
  parts, may be affected as well.

  This bug has been in Heimdal's ASN.1 compiler since 2005, but it may
  only affect Heimdal 1.6 and up. It was first reported by Douglas
  Bagnall, though it had been found independently by the Heimdal
  maintainers via fuzzing a few weeks earlier.

  While no zero-day exploit is known, such an exploit will likely be
  available soon after public disclosure.

- CVE-2019-14870: Validate client attributes in protocol-transition

- CVE-2019-14870: Apply forwardable policy in protocol-transition
- CVE-2019-14870: Always lookup impersonate client in DB

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e3959a039059d6b3bc95100409975e87e9c14d3b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/heimdal/heimdal.hash | 4 ++--
 package/heimdal/heimdal.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
index 005447a43b..cf822340da 100644
--- a/package/heimdal/heimdal.hash
+++ b/package/heimdal/heimdal.hash
@@ -1,5 +1,5 @@
 # From https://github.com/heimdal/heimdal/releases
-sha1  5dd16703be7255f66a4d65440f0c622aeeca60d9  heimdal-7.7.0.tar.gz
-sha256  f02d3314d634cc55eb9cf04a1eae0d96b293e45a1f837de9d894e800161b7d1b  heimdal-7.7.0.tar.gz
+sha1  a33fdc957f84ab13f39f164b04fe1deeaab3179e  heimdal-7.7.1.tar.gz
+sha256  117cb1ede7848db24cf27311c46f7f735a99f9c836c22e80aec92b91efe56644  heimdal-7.7.1.tar.gz
 # Locally computed
 sha256  0c4b07bf5b98f7a1d01f8e60722d6c6747ef052c2aa6d2043daf690d4e1b0a7f  LICENSE
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index ce509c7afa..66f682e107 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HEIMDAL_VERSION = 7.7.0
+HEIMDAL_VERSION = 7.7.1
 HEIMDAL_SITE = https://github.com/heimdal/heimdal/releases/download/heimdal-$(HEIMDAL_VERSION)
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
