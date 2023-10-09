Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14D3E95A96
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97E1F61329;
	Mon,  9 Oct 2023 15:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97E1F61329
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LNE1-wTUHL8l; Mon,  9 Oct 2023 15:20:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C79326130A;
	Mon,  9 Oct 2023 15:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C79326130A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 23D8D1BF364
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F15AA819B4
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F15AA819B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uXmrjBAYJ3pF for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:19:58 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC3758176B
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC3758176B
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399Eiwtp006006; Mon, 9 Oct 2023 15:19:56 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmkj917qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:19:56 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 399DqdJg023064; Mon, 9 Oct 2023 15:18:22 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkmc199y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:18:22 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 399FILNP60883220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Oct 2023 15:18:21 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 417B358058;
 Mon,  9 Oct 2023 15:18:21 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27DC358057;
 Mon,  9 Oct 2023 15:18:19 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.61.33.25])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with SMTP;
 Mon,  9 Oct 2023 15:18:18 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 908BB2A37A75; Mon,  9 Oct 2023 10:17:48 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 10:17:29 -0500
Message-Id: <20231009151729.2223963-9-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231009151729.2223963-1-arbab@linux.ibm.com>
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5WBFjIdB3z9sZBsWa9d53W5vmJ8zOJ3v
X-Proofpoint-GUID: 5WBFjIdB3z9sZBsWa9d53W5vmJ8zOJ3v
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_13,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 spamscore=0 mlxscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090126
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=9fFchYENiANiBJY/hcvTeRIROlXAS9M5NM8HIJXwGEk=;
 b=llkBbYTDYp6L2jl4VCQ/J9Y/wYC2SE7J9fLtfocBbprNnGDgz+hJUoLVIgpz0Dusg/vt
 dxsZETfuXJkGtyxUw/DzDDExVhrJ3ougJVpSCdgkbXyB4irYdTH8uG6pYw9y+tt/ttxG
 bZebazErhec5DOnVERXYDagtl7RmunTJYej5k1hgeHgoPfUTIl89o59/QNVDnCEjlw13
 X2dpcyAdZJ5i8dZdUCYkKXmd5FBDeVUlZYhJfH9vOBOEb6AF8K2D/jngIDFqaHTU+SEE
 ofxVI8xLJOmheQg771iB5Zee05hI8ap24sCQbeHXg8Ilc4EmcfkBqoZND7HVh385k9lK Og== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=llkBbYTD
Subject: [Buildroot] [PATCH v3 8/8] package/petitboot: prefer UTF-8 support
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
Cc: Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The petitboot UI looks much nicer in a Unicode locale:

* Items in the language selection submenu use multibyte Unicode
  characters. In other locales, they say "Unable to display text in this
  locale".

* The combination of TERM=linux with a UTF-8 locale is required to
  trigger a special-case workaround in ncurses code[1]. Without
  this, line-drawing characters in the menu look like q's.

Add a reminder that a UTF-8 locale should be generated for things to
look right. Assume C.UTF-8 by default, allowing $LANG to be overridden
(by /etc/default/petitboot or otherwise) if something else is desired.

[1] https://invisible-island.net/ncurses/ncurses.faq.html#no_line_drawing

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/Config.in      | 8 ++++++--
 package/petitboot/S15pb-discover | 1 +
 package/petitboot/pb-console     | 1 +
 package/petitboot/shell_profile  | 3 +++
 4 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/petitboot/Config.in b/package/petitboot/Config.in
index 0f965e71e628..a449ed87872c 100644
--- a/package/petitboot/Config.in
+++ b/package/petitboot/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PETITBOOT
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # lvm2
 	depends on BR2_USE_WCHAR # elfutils
+	depends on BR2_ENABLE_LOCALE
 	depends on !BR2_STATIC_LIBS # elfutils, lvm2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, lvm2
 	depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
@@ -11,6 +12,7 @@ config BR2_PACKAGE_PETITBOOT
 	select BR2_PACKAGE_ELFUTILS
 	select BR2_PACKAGE_LVM2 # devmapper
 	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_NCURSES_WCHAR
 	# run-time dependencies
 	select BR2_PACKAGE_KEXEC if !BR2_PACKAGE_KEXEC_LITE
 	select BR2_PACKAGE_KEXEC_LITE if ( BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le )
@@ -20,12 +22,14 @@ config BR2_PACKAGE_PETITBOOT
 	help
 	  Petitboot is a small kexec-based bootloader
 
+	  NOTE: petitboot needs a working UTF-8 locale (BR2_GENERATE_LOCALE)
+
 	  http://www.kernel.org/pub/linux/kernel/people/geoff/petitboot/petitboot.html
 
-comment "petitboot needs a uClibc or glibc toolchain w/ wchar, dynamic library, threads, udev /dev management"
+comment "petitboot needs a uClibc or glibc toolchain w/ wchar, locale, dynamic library, threads, udev /dev management"
 	depends on BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR || BR2_STATIC_LIBS || \
+	depends on !BR2_USE_WCHAR || !BR2_ENABLE_LOCALE || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
 		!(BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC) || \
 		!BR2_PACKAGE_HAS_UDEV
diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
index a37e33521f1a..15b428ce0e42 100644
--- a/package/petitboot/S15pb-discover
+++ b/package/petitboot/S15pb-discover
@@ -15,6 +15,7 @@ start() {
 	# shellcheck disable=SC2174 # only apply -m to deepest dir
 	mkdir -p -m 0775 /var/log/petitboot
 	chown root:petitgroup /var/log/petitboot
+	export LANG="${LANG:-C.UTF-8}"
 
 	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
diff --git a/package/petitboot/pb-console b/package/petitboot/pb-console
index eea40163d02f..55e5462f0457 100644
--- a/package/petitboot/pb-console
+++ b/package/petitboot/pb-console
@@ -13,6 +13,7 @@ start() {
 	# shellcheck disable=SC2174 # only apply -m to deepest dir
 	mkdir -p -m 0775 /var/log/petitboot
 	chown root:petitgroup /var/log/petitboot
+	export LANG="${LANG:-C.UTF-8}"
 
 	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -x "/usr/libexec/petitboot/$DAEMON" \
diff --git a/package/petitboot/shell_profile b/package/petitboot/shell_profile
index 1ca5e6364dba..6bbe49e6d113 100644
--- a/package/petitboot/shell_profile
+++ b/package/petitboot/shell_profile
@@ -1,2 +1,5 @@
+[ -r "/etc/default/petitboot" ] && . "/etc/default/petitboot"
 export ENV="/home/petituser/.shrc"
+export LANG="${LANG:-C.UTF-8}"
+
 exec /usr/libexec/petitboot/pb-console
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
