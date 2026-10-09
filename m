Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26C3CA601E
	for <buildroot@archiver.kernel.org>; Fri,  9 Oct 2026 20:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 971A86067C;
	Fri,  9 Oct 2026 20:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dtAAQoL5jivR; Fri,  9 Oct 2026 20:03:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AB94A606F8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791576222;
	b=CHhuZ4P9j0RCDRZDW+2U/q5zPB6AX2GEmRkvdVZipxgUHmY73zcI6GdYEaTA2SMESHTM
	 EgXy2woIVzv8wMcqTUYxE2inBZqIq4dz31mZErTRmx9VA/mDiBspCf7KC5ZYjYUprvewQ
	 IVk7SnnQDhXDkGSFIbF2LHM0zqGVkHW1cgs59Mftf1BYCd6BEwzjbcHzwYNVEYkjsFp0n
	 8bo6IEdosas3XLlMkJPZfsediFFP5RB3GCfWFPkDVFEzmorZK3veh6aawNev3kN8wWS0/
	 nn2armJnc6mvMNNZbVNqbSusPQKyWXAvkoOcun9+9EZCVtTn6mnPU62ZzLHiiJDzrQQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791576222;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2RwanppJjGPfLhxKiViwGyFETgTYPXvtnk6Wbr3Dbg0=;
	b=soHdriaED/QBDPqW3CzCgWGq9v3qt6uLvGfyzNy8XxP6wdXXXPHxeZxfQ3t/EbcXU+VT
	 CDvP31Kk4pSmeiY6fP83WjxjGoXLO2CAt/EljFwyLbqMW1813bpEJQ7TFwHVFMVbAnOY5
	 KWn21NMp/zKq8XvPk/NiGpupVF2wwIANfIS8BnnseKdfOVbKFHnwEpCgszksteuMkqXgO
	 iI17vr9YVmnvo47AdGEU5c/EHOSuGngaatfPYf/2DjczrVARGr0I8EZyi1/4msrTWvOB0
	 BLD8nzBHZzsVPZbetYXEmsikDCgmJW6+q0AmMthgxc6YUYELUR1MrWHrsPXGNFKLGkA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791576222;
	bh=2RwanppJjGPfLhxKiViwGyFETgTYPXvtnk6Wbr3Dbg0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QNku1a+UW3GBN1urSQH1o9VEQMSj1YhGKYoLMV04N0RHJxgfVe0r5pd9WgRiEvb51
	 0jNpeegHlwFfWqAVf+UR6VclHjFLvM7UuUaJHfp0yWbRgH5D9gpziTntIt1flXpBKO
	 gdTFFk0F9BLG0EqGVEMvvtSTGN0qVStpxCU+jc8RuiOoAS67TaIhFaemWmAulkWmS3
	 NA28xrRBJBZ6HaP7PdEsMj8Txft7/rpoU52OzoIb+xyUoILNmVyypBQUKIAdrJeol/
	 AGOBpdhnVshnnA4SWxY1JNPiHPUC6CEZ3LXyBp2SXQ6IH43B+VZ43s44505Y1JwbXc
	 56BqDDezSXeKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB94A606F8;
	Fri,  9 Oct 2026 20:03:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B14F1317
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:03:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EA65606F8
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:03:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id caot0WOz94Hl for <buildroot@buildroot.org>;
 Fri,  9 Oct 2026 20:03:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CD25C6067C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791576219;
 b=d8WUmPO9z6VzTsi1ZMUzIxGl0YnM1u/LjKyrlU+55gUuFaQojmEy1qZ5/btp766tn5AW
 bQL5Byni/dNft1b6eBmGZSnpbws3SliiFXB0zdJQVyOpmlBSHL5MrU2bCLgYoP6yFxReR
 Q7/APjCifrap9cGbmK4Hlgq3p3jJH6Ho/HB3jkgK38imQZT0ovjuxAYT5Rg+ON+5MvCBB
 c9XofBjbQNBJMp4Z/1E8iIqJIJSc48enutX70NsAlUKVXb4PQzM/z3qb7NXUWHj3D6OgM
 eScNmvNZxfIeSg//5HiIbofFLKYTRN6CIqBztiIyMlCe0h2z+OlVZkYO2Fzp1SiiGYw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791576219;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=O7QE9boi5JLmS0GcqhFQetvGWS8SYzef09/5OgfarBw=;
 b=hOlEcS9Q0AVURwNR/MxrGUa9KwdBv5tM3j6fKam5+TGS893pLzDVfbBBhZeTIhrPh4A2
 +v2zKg9VXq/pA/diBpkRuBFOrdjMqPsTkn14mUrnTzLsiRL5DZQciWrXwRQyK+MUzrCbo
 QQx+obqozZxbOX6cTkC2iJ9XZcDX9W0c9N4Mt+Kxmfq1gcn0D/MN7KXx4bAqYnBl5q2FE
 HFD/iD0JwCDQ3G3EVqYUOOpFYENn4hnmLC6gkuFf6JS6d5MqBGtruQWand3Se6EctV6qk
 Yy1RK4n+BppLHL0GfmTJ5+aHnFhfmx/iwj5Kma5l+zDJwIVzL9R8a2W93PW3dcpbUgw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD25C6067C
 for <buildroot@buildroot.org>; Fri,  9 Oct 2026 20:03:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F40D08E198; Fri,  9 Oct 2026 20:02:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Oct 2026 21:55:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b19a12922b9785ad2b0558138415e5207bbf0e6
X-Git-Newrev: fa18f43882f52950b63c4f802016d7825dece068
X-Patchwork-Hint: ignore
Message-Id: <20261009200221.F40D08E198@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump version to 14.6.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fa18f43882f52950b63c4f802016d7825dece068
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/harfbuzz/harfbuzz/blob/14.6.0/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 0d465e7c6b..da30d531a6 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.5.1
-sha256  7e2fa4e8c7c98e8d8140671f5772542afaaa6acccfbd746506886b6d85f7f8d6  harfbuzz-14.5.1.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.6.0
+sha256  d07a007327277708a2a73ae437887cdbaf282937f6d03ca5467723e9099af586  harfbuzz-14.6.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index f8f512d5a6..556ae3db61 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.5.1
+HARFBUZZ_VERSION = 14.6.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
