Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687FBC982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3182960D94;
	Fri, 18 Sep 2026 13:07:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YbcDDCC5S0eH; Fri, 18 Sep 2026 13:07:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5A76C60E79
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736843;
	b=i5q1PJLRF6ab9VAgzbR3iW1JqJHehLuAfW7sR9bR/46oG7PlUGAI6teOo+SuKJFa9p52
	 EAfnCmzcoBQXC6O7mD6dSWJKgzUbUe+gVeI+OMdLqIGFb/pANLtN6t3uBA4CPAoHJW7dq
	 MOKUfuUOBYWau5z3O+fqizNX4JPr8fKcXQjxPHksb0YMt3fpPfKk65K4LTN6GhCSymYYW
	 ID54mrZEu4di1CJYD70NFwxwRorVkvkALNja1PIDMIWAD4of+EQEnFDjNTdmjEZTw/x7/
	 yJyIkkDv/FYvOHilUXBiUmmjcJ6dKteh8JcYvhp8DEHuCq9fb+7BmkWPK7YE7cZ2PiA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736843;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xlR1MiJhGANvG611aDyqOo6+N097G2y/Mo6TaOLB/vM=;
	b=XEc/xyBxEb9wjEdSRXRVm/hdfq9WTjlM6jVuWQBdojcqi36S1ODB/PsVcuhX43+oMUqA
	 yKgjdXaUMUFg1taciZIaMZ1y7VU4sqPe+Z295eMsq7ACV36MYAkiNdtPyEV9I7lo0B8JQ
	 zIJUimUeud5gQ5u7tYypsqIhKIzU1g6I6GONNEo0y7cAOKOqArygtcX90OrAxk7aU63E+
	 sTLYq5exZ2iasOW7GXKI9UT9CUmggNoVtK+F5XKQzXVvzD8NRBMgLGSR1gViOKa/VExOT
	 l1PZRHnlhkgZ4xMsg4UTzvC7jrBluffjdNlrE4N6Ff7iwyFa32fP0A/GM+nYE5ZiS5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736843;
	bh=xlR1MiJhGANvG611aDyqOo6+N097G2y/Mo6TaOLB/vM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CZ4jYhyr+bvIC+GNPciy3tcyjAgzJSxIOJwR/CXCkhNQXxMs/V8QNuAPpdxz6L6xR
	 WWgfXCxI3qYnvn5rPPNXEby3Yk7NmmEWXg2mJg1IjnJY1zd1NeTbwB0DQSc3GlBRHh
	 tcwibCE38eBIJrwuNiHcqOHxUfPNwDf8yYoFaLsDmITKPUbQcwAHHz9Z+U7vQMMPtn
	 9UPzpHlZh9vFyypo59qew9dYT2lOyWTR53qhvgSptPSDxcJxoKknHTVsh0wGAmrnz/
	 FRk8XKJJ4a05XOOPhBdX9pyUur3uAtZBWUWYKfuwKOpwZWwM/EOgK5t3wkAF3UU0gR
	 aRjL+ctqsI3vA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5A76C60E79;
	Fri, 18 Sep 2026 13:07:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17C9343A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15BA140BEA
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iNzUpU1gASpp for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 616A240BF9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736812;
 b=lK9XB9k7RwIs5P0kTI3yogz4at7zt97aJoNdhNkKfyWc7ajFza0e2yu/nrjTK71PX4EX
 enJgf4Cw8kcaXRoXnhKDoqAT9Qv8xK9orZKfD0tJemj3bCoOVjt8J7IUSjn0VZJrXX4Vb
 tOOvnmk0bUpq4IIHFJlXrZTKSf2OoFbtNEyYOFlEkE2Kf+sNXxpgSsV40BUCBxO8jrMWr
 3iELMeRAuRxfyX0yK++BmEr//F6gui1SuAP6Ss+6+Ckj+J9fivwXeIeoDaA78nKgVxkqf
 kpS0VHdtzkgatwfzwQn1bbMUaW6HfYJQvLW8m/4AoNsctWIPZ6IeydQOG9F7sHJBq1Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736812;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Nk8MzVKZX9nPfiV795/dMvzvWmz/X6QDK5X0RzodqII=;
 b=mA0WMsajS3MNQoFCEEfqIMzleMOyXYVwMEZzBUl0k81wX1vc7SbqRL0LfmQXEW7RXgbQ
 L/iR2ZlK9I6ME7SX5vBvZ/2MzuWRLiCCznvhXzXtz/J8uoe+wZrEbuHghe4GNSU39G+gD
 ClnA+tWbNvFYfhItaW9qDnVv5o1NiHMpn6nVHq/7eqjRxOqgRsdN3MT/YRfbT2pii4Mx8
 r7ATRAp77BF8wX5b+um8KOZP8sRYhK0Jk00AIRJO17vEBX3KXZZ+mD9w8AGxrwVT0iFR7
 zyBYL7VlqRSQRyuBMAMbmo0SXEadG7UEJx1mmafjUzmYQwdIPrZ+5Ms/RaTF0uPc4wQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 616A240BF9
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A96B97696; Fri, 18 Sep 2026 13:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 12:13:05 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: dea81ee76cb2fe8e1014c997c4b23fba923e4683
X-Git-Newrev: 7cc8e496a245ec182a042b29a6df56647711e065
X-Patchwork-Hint: ignore
Message-Id: <20260918130545.1A96B97696@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/pocketpy: fix
 build without threads
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7cc8e496a245ec182a042b29a6df56647711e065
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

pocketpy enables thread support by default (PK_ENABLE_THREADS=ON) and
then requires Threads from cmake, which fails on toolchains without
thread support:

  CMake Error at /usr/share/cmake-3.28/Modules/FindPackageHandleStandardArgs.cmake:230 (message):
    Could NOT find Threads (missing: Threads_FOUND)

Thread support is optional, so enable it only when the toolchain
provides threads.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 376daf3dd0ac4dda52ede3284dec59a92bb24130)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pocketpy/pocketpy.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index 23789dd620..c1ae075d38 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -12,6 +12,12 @@ POCKETPY_INSTALL_STAGING = YES
 
 POCKETPY_CONF_OPTS = -DPK_BUILD_SHARED_LIB=ON
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+POCKETPY_CONF_OPTS += -DPK_ENABLE_THREADS=ON
+else
+POCKETPY_CONF_OPTS += -DPK_ENABLE_THREADS=OFF
+endif
+
 define POCKETPY_INSTALL_TARGET_CMDS
 	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(TARGET_DIR)/usr/lib
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
