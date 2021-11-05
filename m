Return-Path: <SRS0=Jxa3=PY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 148C4C433EF
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 12:46:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D267060F21
	for <buildroot@archiver.kernel.org>; Fri,  5 Nov 2021 12:46:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D267060F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0ABC823E0;
	Fri,  5 Nov 2021 12:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UzCz8cwwH83q; Fri,  5 Nov 2021 12:46:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7663823C6;
	Fri,  5 Nov 2021 12:46:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CEAB1BF372
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 12:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C25E605BC
 for <buildroot@lists.busybox.net>; Fri,  5 Nov 2021 12:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFjqUVA8NfuB for <buildroot@lists.busybox.net>;
 Fri,  5 Nov 2021 12:46:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A45B6152F
 for <buildroot@buildroot.org>; Fri,  5 Nov 2021 12:46:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id n29so1828082wra.11
 for <buildroot@buildroot.org>; Fri, 05 Nov 2021 05:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ix2aqwAG7LvssSbFGU/JbT5awKsiaOevGc/jXDdOp4Y=;
 b=PAc3UCwTYu9wUvW83jmNpjMMuF5ZMl7nmZQaKgtHNEa/zAqeE9RpsA/dNMlwDXpmoQ
 wmDze+DpvDt79vW6C3o2uyPEy+ZF8AyLWRaDftgOSCi4+GoaTLYxgRDzSUpOng6wpA1S
 Uhu8rr2lF15dfSfblZmVj3YG4T1DvOQOVSVfAkiA4h5vtfz/4PnX2UQe6iFJSFrkqTEJ
 99/9aw6zpp9lUxbn5LwdEYsV0DfKozC6L0jKPcMUrG+P5WKbNR1uNV3PSQIEhUx2tssl
 yBj6r8sVynDsP5+snTm7YoDnojtKXG99ow+Syp+csZ+u6IiKI7gz6PmLav8f7p+JLxVU
 ANXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ix2aqwAG7LvssSbFGU/JbT5awKsiaOevGc/jXDdOp4Y=;
 b=JGihVk9YrA//6R94m6wNfo7wIHBRXw6II+JPWkWxd814iTOYvF/hFGHNKC1HCH1pmj
 cVHOA6o0tcW0yuLNc2/Go9GDd+a8vTqA54mGCltmIT3oNVV9FOdxNq3NAQWZPC7VZ5gn
 01V8mJNL8S39P5OcdSmHuI5lC4jYMHC2C68rz4JMbhQdtH17TRRgUCh6mnCtdSoFIH3U
 Aahrbq2baJ/597FFmYKUnpmMim50Y7HRibB05F3E15s3xgty8Ku+VYmM7XOkfTS0uctt
 04aKNL339S6Rqj3oqkAKdbujJ3jvuc1TuuAdQV50Nh6V/kRbMlq/x0lshkFREfUV0KJ5
 JaaA==
X-Gm-Message-State: AOAM533C4bieB5JDqJ+fYzyvrpzLMYQD6SOHrU1e3eL4aibxDZ922+Gj
 UoY8/BqUq6T5gLp94F1cinCg97RsBF0=
X-Google-Smtp-Source: ABdhPJyW9zD69ctGHFoGFQwUd9mV4R0cqG3MDqZbIkkcuaK+wA/tv//98tnyGsfSeu9Bm2eKwG8bpw==
X-Received: by 2002:adf:d20e:: with SMTP id j14mr64375679wrh.220.1636116399029; 
 Fri, 05 Nov 2021 05:46:39 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id t8sm7712822wrv.30.2021.11.05.05.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 05:46:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  5 Nov 2021 13:44:45 +0100
Message-Id: <20211105124445.2275022-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/snort: security bump to version
 2.9.18.1
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2021-40114: Multiple Cisco products are affected by a
vulnerability in the way the Snort detection engine processes ICMP
traffic that could allow an unauthenticated, remote attacker to cause a
denial of service (DoS) condition on an affected device. The
vulnerability is due to improper memory resource management while the
Snort detection engine is processing ICMP packets. An attacker could
exploit this vulnerability by sending a series of ICMP packets through
an affected device. A successful exploit could allow the attacker to
exhaust resources on the affected device, causing the device to reload.

https://tools.cisco.com/security/center/content/CiscoSecurityAdvisory/cisco-sa-snort-dos-s2R7W9UU
https://www.snort.org/downloads/snort/changelog_2.9.18.1.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...en-building-on-a-Fedora-host-machine.patch | 28 ++++++++++++++++++-
 package/snort/snort.hash                      |  4 +--
 package/snort/snort.mk                        |  2 +-
 3 files changed, 30 insertions(+), 4 deletions(-)

diff --git a/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch b/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch
index afe9672a3c..66d4fa2839 100644
--- a/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch
+++ b/package/snort/0007-Fix-error-when-building-on-a-Fedora-host-machine.patch
@@ -7,6 +7,8 @@ Remove the code that adds unsafe header/library path when
 cross-compiling on a Fedora host machine.
 
 Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
+[Fabrice: Update for 2.9.18.1 (also fix build on Centos host machine)]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  configure.in | 24 ------------------------
  1 file changed, 24 deletions(-)
@@ -15,7 +17,7 @@ diff --git a/configure.in b/configure.in
 index e6586f399898..fb35d4d7e3e3 100644
 --- a/configure.in
 +++ b/configure.in
-@@ -957,30 +957,6 @@ if test "x$enable_dlclose" = "xno"; then
+@@ -957,54 +957,6 @@ if test "x$enable_dlclose" = "xno"; then
      AC_DEFINE([DISABLE_DLCLOSE_FOR_VALGRIND_TESTING],[1],[Don't close opened shared objects for valgrind leak testing of dynamic libraries])
  fi
  
@@ -42,6 +44,30 @@ index e6586f399898..fb35d4d7e3e3 100644
 -        extra_incl="-I/usr/include/tirpc"
 -    fi
 -fi
+-
+-##################################################
+-# Centos 8+ does not have inbuilt SunRPC support  #
+-# in glibc and is separately availble in tirpc   #
+-# package. Make sure we've got the library and   #
+-# link it                                        #
+-##################################################
+-if test -f /etc/centos-release ; then
+-    LINUX_FLAVOUR=$(awk '{ print $1 }' /etc/centos-release)
+-    DISTRO_VERSION=`cut -d ' ' -f 4 /etc/centos-release | cut -d '.' -f 1`
+-    if [[ "$LINUX_FLAVOUR" == "CentOS" ]] && [[ $DISTRO_VERSION -ge 8 ]]; then
+-        TIRPC=""
+-        AC_CHECK_LIB(tirpc,bindresvport,, TIRPC="no")
+-        echo "$TIRPC"
+-        if test "x$TIRPC" = "xno"; then
+-            echo
+-            echo " ERROR! tirpc not found, get it by running "
+-            echo " yum install libtirpc-devel or dnf install libtirpc-devel"
+-            exit
+-        fi
+-        LIBS="${LIBS} -ltirpc"
+-        extra_incl="-I/usr/include/tirpc"
+-    fi
+-fi
 -
  Z_LIB=""
  AC_CHECK_HEADERS(zlib.h,, Z_LIB="no")
diff --git a/package/snort/snort.hash b/package/snort/snort.hash
index 115a8398dd..6df7ae5229 100644
--- a/package/snort/snort.hash
+++ b/package/snort/snort.hash
@@ -1,8 +1,8 @@
 # From https://www.snort.org/downloads/snort/md5s
-md5  006d6b0d71c6c7bd23eac74670f5b4e6  snort-2.9.17.1.tar.gz
+md5  2b4e30300ef6feca1f60c267e727c6c0  snort-2.9.18.1.tar.gz
 
 # Locally computed:
-sha256  303d3d5dc5affecfeaad3a331d3163f901d48d960fdd6598cb55c6d1591eed82  snort-2.9.17.1.tar.gz
+sha256  da8af0f1b2e4f247d970c6a3c0e83fb6dcd5c84faa21aea49f306f269e8e28aa  snort-2.9.18.1.tar.gz
 
 # Hash for license files:
 sha256  f98260a6d3e5ef4ede8a2a6b698e5ac91d64c09243f7171e1c5b17b920a835c7  LICENSE
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index e073a59a70..54017d3460 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNORT_VERSION = 2.9.17.1
+SNORT_VERSION = 2.9.18.1
 SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
