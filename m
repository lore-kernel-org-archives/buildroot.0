Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1E5CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 12:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A075810D0;
	Sun, 18 Oct 2026 12:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpGUQwT6j3jw; Sun, 18 Oct 2026 12:44:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3685A810DB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792327485;
	b=o6G5mTUatF2HUjAIs1zIXAmH9ge1pAKPqR2Bb4UVmzkTpG++Rlw/VBQix127ynakH3iv
	 +JJJximkbEpRQlDEuPQCsJQKf5AbhLbpky1aQYL4iOoNVJm4dPPKPRBrl7J1C7Xiu7AhC
	 cDBhFETyK3cDYLzGhUn5up7OHR3/xqSPmBjU1CF+IED9kydFCyWhWTlsRksUARnyX2bAG
	 wbUKhwYR2ZlFlQI7ndriPWrel1omm76r6Uk8/TyTrU7fdZWAuKhFWJKvF5tH/M7Za49d4
	 zoDIuFMfmYC3OKiBv46WWcQaKHUZIVaCHspLTDVqok39WvugOtY903i/gnIaiI9v2vQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792327485;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=UiZDZM0eSlDFXuuieGmM5Q9kuMly40JN+ypic7CGx+0=;
	b=X1czoS4XF+yPkYRkBauAB5FZtJJx+olRdjTg6I1vsLGFjRBR0wW/nkajHJ3UMzURTmo/
	 Ze3bH81pK7pgE7YPypDibEeJVfFHzv/olzAOI6mRpTVWlBgr/TBMjVJljYt6Hs5dAaCTW
	 lnWSKiIuJiZoFMkd9fZzRDE0k5yAhFWPTEq6R4q4AhR0piLVtDqgFO27ALrQqIpB718N+
	 ArcIxmfTEgkCY+7MFYe5hclO0nkMUbDgRZgrUHm9mc9BDtLtH5r9ltngNqwa37IXZ4tr0
	 /A2iXpKplF13sMimARnkJWgAqXraFFW7u8f0YImhkNDqQiPffKh7tZdEVajK4/YN+BA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792327485;
	bh=UiZDZM0eSlDFXuuieGmM5Q9kuMly40JN+ypic7CGx+0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=h/NEjotMa6WD4x6Hudp1T+8+6FGqWJ0G+zVKcZ1Su6DmSwpLkWyda2w7acxettLn9
	 2fx8l+I+eGjytOAbVWnauofEzQu7ckPvT/SkGJW5hXFiH4y75jIoU+FhLvh2vAVvpE
	 D7ixLAIid2a2VZryOm4HXe5RIr9RJMOvthh73wvhYGOTPqeCKCpgWfoY6PLRkuFSCT
	 ChmUGEunK5dvvMXwPaBavU51fXZsP14PSRMcmRSli6tSby65eF60tbH3AGy2Zwxssw
	 u0SXxjd5Zk52N/en6fGG3pUj6qbpKU+KyAKx4azoRUzEa5JZav4hgXGv4KaGO28l3i
	 mss7/CoAA1R7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3685A810DB;
	Sun, 18 Oct 2026 12:44:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 032F11AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 12:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F323F400EF
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 12:43:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VelCr_x2UUJS for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 12:43:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 187F7400BE
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792327434;
 b=qKNsr0w1DEDYlZxjp5ehs6osIK0eHcARk6Hzxj6X09/aLBqo3T938x2WMg9RP0RWSR4Y
 cY9TvFZw3OSTlIHVnywHZF5+dXLGMNzfMl41D2VrVPfwQhzI88L4scwiHPmm/rQHzM+2k
 oPRsDdhfnP5p0MWcGEHhVXFqjEZ1/8L5X4StwjgDYRPAT28+XHLsUDuEO912ijLu6oYAV
 cB+ILeUKdvPyC4t4VnFNPxFFC68RAwS7yPNRg+9uJczPU5CctsnbIXljgP1ThyBp71XUz
 21ddtLS/nFqaGd95ayGCqyXQHMBb0KprPBbHL/+7TDItW0FSuLHut9hc2jgn4CasGcQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792327434;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=delOhhsLjNhi9pPCB0AQyY40Xxwwc2EJ6B0ipozTw4s=;
 b=HG2kUpleMLRuzzXNupmq9VUetU+daeKayirIawGtPd4jZVce/kRDdOwfrhW6+Yvc2CXb
 otr7DahLbgMkszdDEaqKUpqVib09DvQHDY5PRpFzwZC2M0XgQiWa4lm1hKtC2d5MvOveZ
 pFbdu0ccJvxmv+J+YwZ9Vhk8OpE4jNcIi0R2jxGuVPILnv4EVou5S0/OULxhZ/vpH8KJe
 zGXfJ8wlH1P7QxRZwOfeTwcwvvmba95vlG45C3lVQrXiHTHyPKnd0QShgjzbJqvgg1Vhp
 gERsMDNod9qFLl5LqjyBPEj/I/rjfg0IfD+uARduHvrvIYMdtPOWUV2V3+0iStOSlRw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 187F7400BE
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 12:43:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 00CA596B1B; Sun, 18 Oct 2026 12:42:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 14:43:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f592d0eae9e44040c12cbff64008fa1ddc48b81
X-Git-Newrev: 42340d022fdbbe900e69461228b0e61666785562
X-Patchwork-Hint: ignore
Message-Id: <20261018124232.00CA596B1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/download: enforce
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y for missing hash files
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42340d022fdbbe900e69461228b0e61666785562
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_DOWNLOAD_FORCE_CHECK_HASHES=y is supposed to make the build fail
if any download cannot be successfully verified against a known
hash. However, support/download/check-hash would only warn if there
was no hash file at all for the package in question, and allow the
build to continue.

This is a security fix and should be backported to all stable
branches.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-download.mk     | 1 +
 support/download/check-hash | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index b38f0c7053..896fb59def 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -116,6 +116,7 @@ define DOWNLOAD
 	SFTP="$(call qstrip,$(BR2_SFTP))" \
 	SVN="$(call qstrip,$(BR2_SVN))" \
 	WGET="$(call qstrip,$(BR2_WGET))" \
+	BR2_DOWNLOAD_FORCE_CHECK_HASHES="$(BR2_DOWNLOAD_FORCE_CHECK_HASHES)" \
 	BR_NO_CHECK_HASH_FOR="$(if $(BR2_DOWNLOAD_FORCE_CHECK_HASHES),,$(BR_NO_CHECK_HASH_FOR))" \
 		flock $($(PKG)_DL_DIR)/.lock $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
diff --git a/support/download/check-hash b/support/download/check-hash
index d18ec8b134..669c3a0d78 100755
--- a/support/download/check-hash
+++ b/support/download/check-hash
@@ -98,7 +98,7 @@ for h_file in "${h_files[@]}"; do
 done
 
 # shellcheck disable=SC2086  # nb_h_files is a non-empty int
-if [ ${nb_h_files} -eq 0 ]; then
+if [ ${nb_h_files} -eq 0 ] && [ "$BR2_DOWNLOAD_FORCE_CHECK_HASHES" != y ]; then
     printf "WARNING: no hash file for %s\n" "${base}" >&2
     exit 0
 fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
