Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DB7CAC5BB
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 20:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEA65614C3;
	Wed,  1 Oct 2025 20:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6JwnKHoYZnC; Wed,  1 Oct 2025 20:52:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F6A6614CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F6A6614CE;
	Wed,  1 Oct 2025 20:52:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4961DD9F
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30F0641421
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zg951-wfXpW5 for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 20:52:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7183C41173
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7183C41173
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 20:52:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 680CF866FE; Wed,  1 Oct 2025 20:52:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Sep 2025 11:09:04 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 20d4df73faa5f2220a25f92643a5ca970c232a5e
X-Git-Newrev: b06fe0eb204b3b83d7bf8f7fb3c64f87f1a78da6
X-Patchwork-Hint: ignore
Message-Id: <20251001205232.680CF866FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/rtl_433: do not
 leak Buildroot git info
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b06fe0eb204b3b83d7bf8f7fb3c64f87f1a78da6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The CMake build system has logic to detect the git repo info and include it
in the version output.  This unfortunately gets confused and adds the git
info of the Buildroot repository when building inside the repo:

-- Found Git version: refs/heads/rtl_433-25.02 commit a367362af00ed349915b0b4496ebeb9910fc86e4                                 from 2025-09-21T20:07:58+0200
-- Using Git version tag: 2025.08-283-ga367362af0 on rtl_433-25.02 at 202509212007

rtl_433 -V
rtl_433 version 2025.08-283-ga367362af0 branch rtl_433-25.02 at 202509212007 inputs file rtl_tcp RTL-SDR

Pass GIT_DIR=.  to the configure step similar to how it is already done for
the build step to disable this.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 817611686a12535aaa15b3e930be0dab95b9b60c)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/rtl_433/rtl_433.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
index 0af25c7936..60f90a94c7 100644
--- a/package/rtl_433/rtl_433.mk
+++ b/package/rtl_433/rtl_433.mk
@@ -18,6 +18,9 @@ RTL_433_CONF_OPTS = \
 	-DBUILD_TESTING_ANALYZER=OFF \
 	-DENABLE_SOAPYSDR=OFF
 
+# do not include Buildroot git info in version output
+RTL_433_CONF_ENV = GIT_DIR=.
+
 ifeq ($(BR2_PACKAGE_LIBRTLSDR),y)
 RTL_433_DEPENDENCIES += librtlsdr
 RTL_433_CONF_OPTS += -DENABLE_RTLSDR=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
