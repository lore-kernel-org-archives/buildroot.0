Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A29CD6E49
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DACEC83BBC;
	Fri, 29 May 2026 08:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ge6zzM1Y7HjV; Fri, 29 May 2026 08:26:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 318B583B51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043163;
	bh=ZnGD9E26jmyJCTNBcrDxh1J8i1qGZHRPZ0ilB1EJjUM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lZmLc8dbVTU1zFaMuXig0llhKrTOPLLqtYchvv36W41pOQsBGUnoQ4uiENbMuFIHv
	 krT7AMs5KqWRvZ+jVD3JktLuuCqLT69JEdl7ucBwRO9Ge4a3D3tTouxy3bfDt7Zsm/
	 oXFUd++DgqpXQ5mxHi2V/xTi9p+r+wauRXXbAgQZCqZj8Io+6NURbmwM/lDlqS9X0Q
	 u1CYR/rZQDYvKSFzwB/BjRW3BPX8nkcxHkWTbIxThzAxhXbauuY1ECNMYPqNi5zaK4
	 KFvMeNEh8tg25DSHTaIyyI+cFI/WR0HjzMfUrbEGO2/vVoYzALGMtheNa6xYcFmUEA
	 V1cZyKkBlCTBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 318B583B51;
	Fri, 29 May 2026 08:26:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 128BB288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E41B141F80
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCBcjRMijG8X for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECDED41F8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECDED41F8B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CB5D870C6; Fri, 29 May 2026 08:25:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 11:56:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bf837fbf829b76516962bfc63135c7ebac383e91
X-Git-Newrev: c5a8cfd5811bcb1ce0b20cb770b0994eb98a28b5
X-Patchwork-Hint: ignore
Message-Id: <20260529082507.8CB5D870C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/linux-pam: patch
 CVE-2025-6020
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c5a8cfd5811bcb1ce0b20cb770b0994eb98a28b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

- CVE-2025-6020:
    A flaw was found in linux-pam. The module pam_namespace may use access
    user-controlled paths without proper protection, allowing local users
    to elevate their privileges to root via multiple symlink attacks and
    race conditions.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-6020

This fix was backported based on the work of the OpenEmbedded
community. See the link to the original patches in the patch header.

(cherry picked from 30e38505e4bc6f8313509bdee2418024693088fa)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/linux-pam/0003-inline-pam-asprintf.patch  |  103 ++
 package/linux-pam/0004-pam-namespace-rebase.patch |  564 ++++++++++
 package/linux-pam/0005-cve-2025-6020-01.patch     | 1131 +++++++++++++++++++++
 package/linux-pam/0006-cve-2025-6020-02.patch     |   37 +
 package/linux-pam/0007-cve-2025-6020-03.patch     |  189 ++++
 package/linux-pam/linux-pam.mk                    |    5 +
 6 files changed, 2029 insertions(+)

Patch is too large, so refusing to show it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
