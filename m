Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471B8E7717F
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 17:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADAD384663;
	Fri, 13 Dec 2024 17:53:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AEPerAoFQiYD; Fri, 13 Dec 2024 17:53:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE7458463A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE7458463A;
	Fri, 13 Dec 2024 17:53:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60775ECE
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 17:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40D218462D
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 17:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s7gHHGqD2iLx for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 17:53:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BCC1D84660
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BCC1D84660
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BCC1D84660
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 17:53:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b472.dip0.t-ipconnect.de [84.161.180.114])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F36B0A4C10CB
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 18:53:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56674)
 by fli4l.lan.fli4l with esmtp (Exim 4.98)
 (envelope-from <bernd@kuhls.net>) id 1tM9qz-000000006zl-3C6y
 for buildroot@buildroot.org; Fri, 13 Dec 2024 17:53:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 18:53:30 +0100
Message-Id: <20241213175330.344448-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202412041019; t=1734112411;
 bh=ycFw0cQ6Iv+2hjHZN3XBgSdM7eHWIWsTiXbXF1roOso=;
 h=From:To:Subject:Date:From;
 b=emjJwJYWf+hLiyVNbUnp9uIyljcfiNTe1WJ6o/1Uo1ngNJzqPVCrh7NNDDLsUQfme
 c1gDEmN6tVu85zrSxp7zRR65OIXvOSaNQkR9vGrq9PhCTIKj6MRBhhYTH7OzudESm0
 GkICeC5Bhvb5c2P3PRMIcGzR7J2q4BRGF2FAwlXMzmMGZ1nPU415462LLnoRg+V7/Q
 qgUnX8wXs400updla5SjFVd+AEv3qmcj50/tlddJBTdCW7qHjrqjf+elNFoGJmLdjN
 4nuTdUz+aM85CXbVKQgjD5Rf3LO/xlr/U8HAIr1ikQaXi6c4KciaLXpjRZDAVmmrYx
 6YNSrCjjzoJug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202412041019 header.b=emjJwJYW
Subject: [Buildroot] [PATCH 1/1] package/alsa-lib: Make sequencer dependent
 on rawmidi
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add upstream patch and adjust dependency to fix build error.

Fixes:
http://autobuild.buildroot.net/results/9a5/9a53d3c1411699f581e3a90d7f517fcb6b9e3de0/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Make-sequencer-dependent-on-rawmidi.patch | 35 +++++++++++++++++++
 package/alsa-lib/Config.in                    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch

diff --git a/package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch b/package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch
new file mode 100644
index 0000000000..fb1d18df36
--- /dev/null
+++ b/package/alsa-lib/0002-configure-Make-sequencer-dependent-on-rawmidi.patch
@@ -0,0 +1,35 @@
+From: Takashi Iwai <tiwai@suse.de>
+Date: Sun, 24 Nov 2024 08:32:29 +0000 (+0100)
+Subject: configure: Make sequencer dependent on rawmidi
+X-Git-Url: https://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff_plain;h=6880219ad4ba55ae8a94a34b7a987b3369f7c96f
+
+configure: Make sequencer dependent on rawmidi
+
+The sequencer feature requires rawmidi implicitly, and it became more
+obvious with UMP support.  Add the dependency check to configure
+script.
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+
+Upstream: https://git.alsa-project.org/?p=alsa-lib.git;a=commitdiff;h=6880219ad4ba55ae8a94a34b7a987b3369f7c96f
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+
+diff --git a/configure.ac b/configure.ac
+index 1cd22a59..69aeb978 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -483,6 +483,12 @@ fi
+ AC_SUBST(PYTHON_LIBS)
+ AC_SUBST(PYTHON_INCLUDES)
+ 
++if test "$build_rawmidi" != "yes"; then
++  if test "$build_seq" = "yes"; then
++    AC_ERROR([Cannot enable sequencer without rawmidi])
++  fi
++fi
++
+ AM_CONDITIONAL([BUILD_MIXER], [test x$build_mixer = xyes])
+ AM_CONDITIONAL([BUILD_PCM], [test x$build_pcm = xyes])
+ AM_CONDITIONAL([BUILD_RAWMIDI], [test x$build_rawmidi = xyes])
diff --git a/package/alsa-lib/Config.in b/package/alsa-lib/Config.in
index 6df03afe0e..360122f97f 100644
--- a/package/alsa-lib/Config.in
+++ b/package/alsa-lib/Config.in
@@ -65,6 +65,7 @@ config BR2_PACKAGE_ALSA_LIB_HWDEP
 config BR2_PACKAGE_ALSA_LIB_SEQ
 	bool "seq"
 	default y
+	select BR2_PACKAGE_ALSA_LIB_RAWMIDI
 
 config BR2_PACKAGE_ALSA_LIB_UCM
 	bool "ucm"
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
