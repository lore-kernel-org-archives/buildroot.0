Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C610C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 13:45:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E60D660B5E;
	Thu, 11 Aug 2022 13:45:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E60D660B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lk2pkD6aOJ23; Thu, 11 Aug 2022 13:45:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7CDE60AAE;
	Thu, 11 Aug 2022 13:45:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7CDE60AAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36FB01BF2F6
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 13:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D34F60B0B
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 13:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D34F60B0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wgtR_VpAEzI7 for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 13:45:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CF0C60AC4
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3CF0C60AC4
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 13:45:43 +0000 (UTC)
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.95) (envelope-from <john@metanate.com>) id 1oM8VH-0007Go-Ua;
 Thu, 11 Aug 2022 14:45:40 +0100
From: John Keeping <john@metanate.com>
To: buildroot@buildroot.org
Date: Thu, 11 Aug 2022 14:45:33 +0100
Message-Id: <20220811134533.508348-1-john@metanate.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Authenticated: YES
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:Reply-To:Content-ID:Content-Description:
 In-Reply-To:References; bh=bjIYuCVG49vAscmp4+b7Lg2KL/GCpNqhxQ+aqFzl1NA=; b=Ld
 wYdGIvTsdyHvFnNceZJbAEcgUZZeRQ7lF1WcP9UZofHYdNXfebOZMvmEF+fak8+lZhsTLYZG6G63G
 70ES4/9liCouk1uaU0oVmcVNRM2Fq0ZYmlERa1QddKqg0fa5rNT3K6sMbHBTUmpXu/8ZpC3pPy8F7
 /UIYE1v6GxbeKyOHXnPvRKl95yz7+uM8TdrKLpkJJKg2asN1ir1C9xyYIuUGD15SfiS4uFAsVCI03
 XX5izx9Ldmtzd4yYMk9jPFMTdprqGleJ1WeSN8oHdTqwB2z8zFB6Hn4p5hT9GZOztuB/OMLxthgOw
 V3+RE6T6u8nXOYNZwmh7PimxHS6WPOKw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=metanate.com header.i=@metanate.com
 header.a=rsa-sha256 header.s=stronger header.b=LdwYdGIv
Subject: [Buildroot] [PATCH] support/download/git: disable global & system
 config
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
Cc: John Keeping <john@metanate.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The build environment should be isolated from the host system as much as
possible to keep the build reproducible.  Git's global config (usually
~/.gitconfig) and system config (/etc/gitconfig) can affect the
behaviour of all Git operations, so should be disabled.

An example of this is that `git lfs install` will add the LFS smudge
filter to the global config and thus always checkout LFS files ignoring
the value of $(PKG)_GIT_LFS.  This may mask a bug in the package when
the initial developer's machine has LFS installed globally.

Signed-off-by: John Keeping <john@metanate.com>
---
 support/download/git | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/support/download/git b/support/download/git
index 1a1c315f73..b0a677c3a3 100755
--- a/support/download/git
+++ b/support/download/git
@@ -82,13 +82,17 @@ trap _on_error ERR
 # being expanded a second time (in case there are spaces in them)
 _git() {
     if [ -z "${quiet}" ]; then
-        printf '%s ' GIT_DIR="${git_cache}/.git" ${GIT} "${@}"; printf '\n'
+        printf '%s ' GIT_CONFIG_GLOBAL=/dev/null \
+            GIT_CONFIG_SYSTEM=/dev/null \
+            GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
+        printf '\n'
     fi
     _plain_git "$@"
 }
 # Note: please keep command below aligned with what is printed above
 _plain_git() {
-    eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
+    eval GIT_CONFIG_GLOBAL=/dev/null GIT_CONFIG_SYSTEM=/dev/null \
+        GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
 }
 
 # Create a warning file, that the user should not use the git cache.
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
