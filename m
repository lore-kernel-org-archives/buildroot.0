Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9E5CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E96A9814D4;
	Sat,  3 Oct 2026 13:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wGplg9mitiSk; Sat,  3 Oct 2026 13:57:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7F851814C0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035830;
	b=JiLCWVJqiPJvnbBcheWavgBCyKEwAHmCEoNYvjql5vMXA+yH5xec201ZM5R4M6QkkucY
	 62JgIRG/wzYkcPeTkMbSsJEUAFO8VG8mzZ2liYIv1k6hk5mNje63bwQC8wa1Qnb760hL1
	 MvH2BSytKhLn0LX0b5bfjQwLvH7lxbOingSKOgJJbaWGNjVfg7Ud3Lwz0REJPs58pa9Z4
	 J9Qe+ki8yQyFQoq5LlYXClBZ4Sqx7HkuYI9Zf8G5vqt6W8LCLrqkAKMaxC9ADu60v8ddN
	 sXZ90E4kEAIs9aI/UhbhCHAblmhdl7Ncs9wqt6pwdzoCeElx05sK0DMYGJL4JS61Xxg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035830;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=H1gsLUhJJlwZKZWLLXte70qzqWQnYvuRog20S4A8hbk=;
	b=XEvNae4yP2K7+zBp2rxCb0u1edKiybsczAWoSarVcGqngdin6i6HllmL7F7Ih7Qhn36+
	 1XK9FNzuEKSo+l7CKtLHPCJnkaNYhU5FRkiDVXNz4JLf6P+ucVWDU8tw1lKFhiHcUo3iN
	 VYzoLG3vHM2LvhXvlEv2fYGKsYc0qb6IsuDWeSA9WWwX+WTWthtD5gL/hPHfNVf24JzcQ
	 Dg2mt62wZR6rsYXi7MLjsyJcOiym7TluahqOb1XuuWWdsWMaB8K8FG3XpkO+p+ixOM6PN
	 ioK/40WtO/vsxU3o3It6uGck9haBtQD/7iXJgIfKJIHEFEkyRTePbAlf9agiukFxq5Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035830;
	bh=H1gsLUhJJlwZKZWLLXte70qzqWQnYvuRog20S4A8hbk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rjvpi+9/oIxqHjwFAmPvCPCOkK2eEZDxYpbNZt0jxBzsAL/DTRTtP639yz+lks6Yu
	 p3OxqBscf7Dzy2G9HP0uM0LA0r/NXixoCjFfF4gaOrsT+MrHavZ3dXqupBBYj+Zofg
	 xgOb6yXTuJc5gW0v/Wi4c+C6EythKs4OxpPmuY1xQc0KqJlfReOatNZLDbRPZffh1b
	 3iVKkwbaPzydGhf7a8PomnbOSZ5N59UW7hZQEfGAl6CovwZkpGcyCE3GOmaHc1f5tO
	 qbISwm8bvbj7I6zyKGQSP2WMghNdqNtuy57sIHXV1D1zwtLDSpwiVyixGfpenCwevF
	 RiV22JL2OozxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F851814C0;
	Sat,  3 Oct 2026 13:57:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A60C179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41284414EF
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKR3O95UXQ4b for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 57306414E1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035815;
 b=XyN5zVLUicBAyG2fbfCEPbqCV7mh0gUULO5yz2OgBdcWID/c78qmNVsM3cOFCtq42wTO
 qVPZNbmTIvIhU3qNzEgLAIJzuzouW0NkzJKaDbvUxLO6anWT3cQOYBoLkgb/2p8rzxoE4
 5QpFlN3rcS9nklP1tiNXpcZraHKWZ+HRdLc4GJ6lV/UMJJZLRQulzrYoiawNlFwKj/Lbj
 8mjYUdMGyjzbKjAjMTZfuPtR/TjxzMDd1dkOYu66hFK7293T2vdE7XkAn0UodmH2XEmGb
 k9kojgiYyrO/kkMmt1xl+AaWLzUcwMH6FPqV/Jc8vDshvvPeBMtuUzZWr1wVtPJTIkA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035815;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=dZJUUH38L3rSZzM3LnxJgfj9UlLez7gnh/FJWUgHccE=;
 b=iSHmt4nbZkNHvDHm8mPhuv0sDIo7+bwKN9oV3lehXPhBF4yrYmnaVDHAm2rGz73nnhZ9
 467b5p8oy/354uRFwTEHhG8FqouKp8MJZC3IEJ3cwg3gPjFp8qmT41j8ziw1drQfaFcij
 24grCRpRWwyCRnS1U1DYnu7evKhaPfXnwMo1WsK7t+P8DEcNz7mCUyt+ZnlHY3lNcBtps
 pY1Z/kDV89HrbmbJTztKHiGri5Q5TfsfRcyRC8TLZ+wiv5K7LgihWb6cil9qQrBZ4ay1W
 y0RPowrFQ2B5w0bQF8IU0M/wj/gMTvxkQcUFqNY3oD33yRPjVvsLck+rg5NkJ3VFqXQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57306414E1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A1C5A8A318; Sat,  3 Oct 2026 13:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:43:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db76d4ce8028656987298dd0dbb03e5087b1f3d1
X-Git-Newrev: d64414c712dc6f871441fcfbdc51eb2662918fc0
X-Patchwork-Hint: ignore
Message-Id: <20261003135540.A1C5A8A318@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/meson: bump to version 1.12.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d64414c712dc6f871441fcfbdc51eb2662918fc0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 9c36164589..da1eaa15d0 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
-# From https://github.com/mesonbuild/meson/releases/tag/1.12.0
-sha256  88afe0c20e52030218924ac37d0c81c59b4b5f3ae3752c8c6d7470c7d365886c  meson-1.12.0.tar.gz
+# From https://github.com/mesonbuild/meson/releases/tag/1.12.1
+sha256  ab0a6ca09f8ef70c564c8241fb5a23957886a0b53fb58412b5e07eaf07dba743  meson-1.12.1.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index cafbff4578..ebb2adf3f2 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 1.12.0
+MESON_VERSION = 1.12.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
