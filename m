Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F208C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 15:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03201605A0;
	Tue, 28 Dec 2021 15:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W0fvXAi5XD5c; Tue, 28 Dec 2021 15:01:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 58CCE60ADB;
	Tue, 28 Dec 2021 15:01:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4AF851BF471
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 15:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4801E60ADB
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 15:01:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8fs8gHeS_5xm for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 15:01:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76BD660AD9
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 15:01:41 +0000 (UTC)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
 by mailout01.t-online.de (Postfix) with SMTP id EC4768FAF
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 16:01:21 +0100 (CET)
Received: from fli4l.lan.fli4l ([91.58.0.156]) by fwd81.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1n2Dyb-3sEh7J0; Tue, 28 Dec 2021 16:01:21 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:35548)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1n2Dyb-0006tL-0U
 for buildroot@buildroot.org; Tue, 28 Dec 2021 16:01:21 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 16:01:20 +0100
Message-Id: <20211228150120.944609-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1640703681-0000BD0E-1018B8D4/0/0 CLEAN NORMAL
X-TOI-MSGID: 501d3f06-ce46-4e9d-9cfe-c7d675f862b3
Subject: [Buildroot] [PATCH 1/1] package/bento4: Add ism segfault patch
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ault-in-AP4_LinearReader-ProcessMoof.patch | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/bento4/0016-Fix-segfault-in-AP4_LinearReader-ProcessMoof.patch

diff --git a/package/bento4/0016-Fix-segfault-in-AP4_LinearReader-ProcessMoof.patch b/package/bento4/0016-Fix-segfault-in-AP4_LinearReader-ProcessMoof.patch
new file mode 100644
index 0000000000..cbcc62f982
--- /dev/null
+++ b/package/bento4/0016-Fix-segfault-in-AP4_LinearReader-ProcessMoof.patch
@@ -0,0 +1,27 @@
+From e5b37c1e0a7a84fdc7b403c5e30a5e93706104b8 Mon Sep 17 00:00:00 2001
+From: Dobroslaw Kijowski <dobo90@gmail.com>
+Date: Tue, 19 Oct 2021 14:17:11 +0200
+Subject: [PATCH] Fix segfault in Ap4LinearReader ProcessMoof
+
+Downloaded from https://github.com/xbmc/inputstream.adaptive/pull/856
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ Source/C++/Core/Ap4LinearReader.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Source/C++/Core/Ap4LinearReader.cpp b/Source/C++/Core/Ap4LinearReader.cpp
+index 61c3a9d..2464865 100644
+--- a/Source/C++/Core/Ap4LinearReader.cpp
++++ b/Source/C++/Core/Ap4LinearReader.cpp
+@@ -329,7 +329,7 @@ AP4_LinearReader::ProcessMoof(AP4_ContainerAtom* moof,
+         tracker->m_SampleTable = NULL;
+         tracker->m_NextSampleIndex = 0;
+         for (unsigned int j=0; j<ids.ItemCount(); j++) {
+-            if (ids[j] == tracker->m_Track->GetId()) {
++            if (ids.ItemCount()==1 || ids[j] == tracker->m_Track->GetId()) {
+                 AP4_FragmentSampleTable* sample_table = NULL;
+                 result = m_Fragment->CreateSampleTable(&m_Movie, 
+                                                        ids[j], 
+-- 
+2.33.1
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
