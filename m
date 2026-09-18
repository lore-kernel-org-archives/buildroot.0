Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2968C88E75
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 07:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28F6E810EC;
	Fri, 18 Sep 2026 07:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id coJQ5LHn5MA0; Fri, 18 Sep 2026 07:33:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5822181196
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789716839;
	b=WymIP4vMkg46LgW0xzcvFOgbCVwFkUXZN5l3D+FORGwfcIK19yMBWigeLha8AFcMitM2
	 W8bGm4oPK42wJPriXyDzF03ucEfvrt98Wjhnfzg8ClAAoVM+fJ12XUOr0384FXEGbjlJC
	 w8bzFeagUohoFxLxRwa+PLAst1SF81TP92xwNaa5dXC1U1Q0+SeM2UfNW6gLP/B9mCk/y
	 5HZXJmZ12fhctfl+PDyEPpbznv6uOFd6JZUfbNkQjjbetwWMTWg4xon9/v9Oxor63s1Rh
	 ti/jolZrJTlawywxejjHSbBASCImtsagqtnWM7WSvnj/bGpthbuYi3o82AvL6EKsPow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789716839;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PwTfKq8wO7SWBN59CPeOZUve9LN18eL2gmSG8ii+Xm8=;
	b=UZSb83DZCW+FT7VkHHlDFOtUbuig4Lk8PmcVpXjVo2o63NGFwcnzcK/GzCQ+7TB/2zCx
	 r8j0dbx2A59AkoFFXbA4I4QLw+8eZbq2rpNKKFQQ6pWm9m7GkC40iSrNsN5SlTvbtjDSk
	 4xfJfQhGrPyUMEZGt/mKd9dggLzVGdCif2OcFfxCzQr3Fk1oUBx2PeL9KD6dINTNgMY7X
	 ei9v2IjOKnWZ35EKOBYrbFwBPdYiw30QyMj/VluLwYJ7SZZnHPc/B1L7hSoiZRl0jGuKQ
	 M/nz/3GnYMHLB1m+c+r1NJDd2ydk521Gj1fbmPEbBz5lfSO0D4hBkyY0YcHbglDUE9A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789716839;
	bh=PwTfKq8wO7SWBN59CPeOZUve9LN18eL2gmSG8ii+Xm8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DswB/b9zkKif01mF/0fE6spZKp0wQqWAhnf9U3m/kXAffcQ9Ijo86FOp+TK4C3y+c
	 EddGR3+B9aQvwupxJi7vNYl2Rmou81AkhzdanW7typcIWGJR+7BWFI0onP9fP4cCwJ
	 qsI9UYgnCysX4VSdogg1mVwNClImTZPdvJGvGp/0SflubUfqtYREW0+0SMOJLi/PjR
	 ZTZ2ECBoqQO31qZZZTl7L5dUI/OUSENcqQuY8vIlN1giRvdnGbvlemzjc22Wy6npW2
	 BXlN+lw0JV1MXWm7puS0gifejv33rTPAqy/uTnXwiXIG2p0dNBizHwlQk6US9qUvmH
	 7GFOL4L6/+7oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5822181196;
	Fri, 18 Sep 2026 07:33:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 90B3D37A
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76B8460BCD
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:33:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YiPwDJGSyPib for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 07:33:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C053260BC4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789716836;
 b=lom0sY2hcYbpU4vtogI0DngKmMgDiUyxFNa7u6oDEXWUk3K+941ws9Oq2C6pQjNmi1KR
 hT5PDzh6exoMwgKIUjFIf4zXYpoijU/rnRB6xzop7qquJDP88OYSw1XkTX+cv9YD5ryIs
 b5E5HCCOaa+Zx75mWrXMVDGRhDxPU2IjKm7KtfeZoFYiV/cv/W5Aa7coWEK4MwJRlx2LH
 j4tBgltAUJ+OFpDELT7YJ4lRlfRmyh1R05nqruhWDKfuKdUlpmQ2oioyjYXjVmiJD0/V1
 ti/AZ1mcvBrPkWcx4WbxECdcTbvfSuMkC6TX5NFW2Krx8keCBmb4eM/lBpTWKUdQ49w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789716836;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eaUJVzyPwslyy9G1CB/8XcrgXvSVDbiKQWUbT3WO2Qw=;
 b=j0EB5ipf/c+LXVT+zsRXkSppJR79xYC/imx/NCqLJVYqXT0T9NrInzfSuAIIsCGvRgYG
 Yj5xeMVjYhJMIeYsiKzudq3i4PHwksUMnXKAxpJR+FVuDhlCWUJHlReSSC+ow4LIHslq0
 dGG9lLkNuU5pNWq/6xLNyFwbWBtJAD/XWf+w0UVDbsiNmG+UAYgHaInyl5LGb8B4hfH8r
 PdWMngvzqK8TgyikKs0AJzdkgm4UEODbNlvP6ND3BNK2mfC553a9AprfsTA+i1BrpXS8T
 8eCmShFwfXFcgyQ30qD0YMErT9VVofWVRzRnCd3f34S0OaNedy6K9QKCNtp7GUdgboA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C053260BC4
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 07:33:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8514296D5F; Fri, 18 Sep 2026 07:32:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 09:33:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ca7fb5e7bf7b416b72faf709bf1220eef0dc352
X-Git-Newrev: c337b249bf14b136f667996df418be5579be6087
X-Patchwork-Hint: ignore
Message-Id: <20260918073249.8514296D5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsrtp: bump to 2.8.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c337b249bf14b136f667996df418be5579be6087
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/cisco/libsrtp/releases/tag/v2.8.0

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsrtp/libsrtp.hash | 2 +-
 package/libsrtp/libsrtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsrtp/libsrtp.hash b/package/libsrtp/libsrtp.hash
index 232c106387..89a5820f49 100644
--- a/package/libsrtp/libsrtp.hash
+++ b/package/libsrtp/libsrtp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  54facb1727a557c2a76b91194dcb2d0a453aaf8e2d0cbbf1e3c2848c323e28ad  libsrtp-2.7.0.tar.gz
+sha256  d123dcff5c56d4f1a9006f2b311ea99a85016cbf3bb24b1007885d422237db85  libsrtp-2.8.0.tar.gz
 sha256  8e19d42a1eec9561f3f347253ddf2e385c55f392f025bb0fd41b88dbf38db5ae  LICENSE
diff --git a/package/libsrtp/libsrtp.mk b/package/libsrtp/libsrtp.mk
index ba58b900d4..076270cbf9 100644
--- a/package/libsrtp/libsrtp.mk
+++ b/package/libsrtp/libsrtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSRTP_VERSION = 2.7.0
+LIBSRTP_VERSION = 2.8.0
 LIBSRTP_SITE = $(call github,cisco,libsrtp,v$(LIBSRTP_VERSION))
 LIBSRTP_INSTALL_STAGING = YES
 LIBSRTP_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
