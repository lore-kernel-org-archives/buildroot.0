Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F1CC98302
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 16:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF39040687;
	Tue, 22 Sep 2026 16:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_IJTVKY-QCM; Tue, 22 Sep 2026 16:37:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org DF43F405EE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790095066;
	b=VRc7CiP0qPC8oubfgXPoz79apEOhDszHrgnlA2mhnEVE6LbAnbdKGDP+AQTcV4tJvRbw
	 yEZcApCNHIouuZ+/0Y+bfAMdFhCUzbksgjZadQHqJqhKRzaI9kIhqk5QgILze1LZ1qm4C
	 aJdzsjACZukkjFOX3TK+dlJhcTOjQ+H7he2nWpNehg3n78u6hHJDeY7MhaIm3ET9/lQ+s
	 vLlM63aT5fFXESuAJFikpdHGrVnxwQGcjUONVUPs/eiKOvUz0D0eLH2YCK7b+ZBInhDd+
	 iSHfnecnxQUZ+Z2Oc7SZBLwIf4EbAxNToWzjwayEfLhX2ROIt48KKTpZEtCmK3g4Jyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790095066;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3pkvCTXZqqQjb3dYlimOqj2EBlVfDVYtv2bnRghwyAQ=;
	b=tL67/XOV/0c5pJba985oW6peRak5vBf67Nn5iyHvn6gOBEad64gUs2sEIyUkMJHxsCpX
	 5Q1NeW4Nze+ERssArINz/D+kYprNBAgN7Nor7ZLE4mhNRqBy/g9nnuHzWUK6vyMnqy0af
	 GdPo6acttqDfxyCiwbhclpmxk0rCZEhoqZkgeaT9IIQTPhbYIrK1X/mxQcHIJz5ypHJDc
	 1WHUZbV8Ttij0KkqfQUAd2lCvb8/3C+I4/pWsbuABWZPYVHeo3OEDw/ev/MmeicDxfxFC
	 VTL0ohoNLet0aMm6WyevrGpLVbMK93yYRAYobn0d4Uj2erwDG6PJQrr+RH+AsEhis3w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790095066;
	bh=3pkvCTXZqqQjb3dYlimOqj2EBlVfDVYtv2bnRghwyAQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=p/TmH5gwumvv+M05aBVapVCcqA/5FyPJ3DaOX2sRQ40Fruqgui3ftMWQxXqsPJoTv
	 278xiMeKK2b29Prf2sasmRiWsDe8GUic0MXUyXMzuheaigw0Q41vzykepVSbG3nZaz
	 cwi62QA++dgc+ONL1ppTz6MXYNfC5c71puX8VOoKkL2t+VzsVnhuW6kkIAkFAXeL0O
	 l1SX8dqelPhFyRTiOFcz3xE6GAeAut4ZD3WR+SMHDsNKSwsbjsQvKa8lzEF52U+fav
	 BpuWImJqmdHOBVBoFHelGWC/avvYQZY8h1+FwsA8IFQ4/DUo37Nrk7ENWBIvDh1a8G
	 aZc/3aLb4BeOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF43F405EE;
	Tue, 22 Sep 2026 16:37:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5744A35A
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D8A280B5F
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UNpCeF7O38tQ for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 16:37:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3F4D8809B4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790095063;
 b=Khogk8qxpjfh21mKFrEDoXpeU8I/aQJg34FAK3AAAQEOLqowsdGiAY+ZPoJ7Vf1+qHmY
 44N2Zdf2rJq7n6HkRF6Vc/NhGiyn+vdBYCLKQ0JkNxw3is5Ag30XZhQ2F2aa3g7tPeeyS
 TVCgnJlRQF39OCiR5Rzno7dSjdUMgMEiznaUj899TfAfey+V67oWDj/StlFrX5WKaerIK
 9cdndzDETWEK4o4H2Cj1heKvVTh1mDBH+cZfMxCFGo8smhZvuC1ymEguB+Mc5243JWRPl
 4I+Fzyq7kWB76YUBU3HIIITEubTgJ/DTkac1fw/t3RL40/6MbekC4qJKUkbv6enWCVA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790095063;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MkwJZvQuUxH81/vHwmj8Ny8YWRCT5RD8jVuzWKPp1pM=;
 b=I8rJIKCONpq7KFJ2Vvq7vBNQO6bWqWY4CalyyREnPupCeP2XaKkMe0gick3rDjRlphYz
 jqTfKEHA1ad7Tj8akRIhqcPazLEy8G5OH9FREIx/YUj+UL7NQRNAJ3wSUlR57R6UGKD8X
 MCPieJs2qGkKIQ8mSpIQwIj0WpiIlSkSiS4jBpVFIWhjC2zr9JNt2lrbRe3PvNyHK+N9d
 daUwFK7H6ltIlLxxDuHs8picrgZFXQCoHWif1slyg8HxMjGut0cA7VKFT4JdFymG0eczc
 QtzmexFIcht6kMfeIP/Jpsw+MTvAWPy605lnYLACYCR1jpCYmPVdKW+5Iu53JQmubRQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F4D8809B4
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:37:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D916A96CA0; Tue, 22 Sep 2026 16:36:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Sep 2026 18:37:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0511042e8921a4cc9fb01ced9ae65ba31bca8d5
X-Git-Newrev: b5ce8971bb8fa5cec8e02dfeb381554efb37dea0
X-Patchwork-Hint: ignore
Message-Id: <20260922163633.D916A96CA0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump version to 14.5.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b5ce8971bb8fa5cec8e02dfeb381554efb37dea0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/harfbuzz/harfbuzz/blob/14.5.0/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/harfbuzz/harfbuzz.hash | 4 ++--
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index f8ee98e172..bd025fb515 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,4 +1,4 @@
-# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.4.0
-sha256  2357ed966c6ced7bfa720b0640c0231065af01158fbea215093ffa15aed44371  harfbuzz-14.4.0.tar.xz
+# From https://github.com/harfbuzz/harfbuzz/releases/tag/14.5.0
+sha256  b7132e148358a45185c9feafd049dbaf243649d3c44414b3534d9c95d18592b9  harfbuzz-14.5.0.tar.xz
 # Locally computed
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 184253949e..71eee8f93f 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 14.4.0
+HARFBUZZ_VERSION = 14.5.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
