Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC271C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5522C60ECC;
	Fri, 18 Sep 2026 13:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hz-5iSQGRuQ0; Fri, 18 Sep 2026 13:07:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org EFE1560E0A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736875;
	b=JiEAxKEJoBeA412ASRe/X3gm9OmVqgtPYvR+wg1O9UlY4A5zII14M2zBMYYJ6X6M1eSC
	 lv3tRnEGKhA2UM0HiQomVX1BoGq5iBWpGjYGBg7IeeP3L/9fnZV96UbIBrvOXW4zmgQ2G
	 wGt4B5zauqLjPzPFui4wkz+rNO5QlJicuetXhfJqJtI0DZtWW+243ayF0KRXbwk27zSXW
	 rk/yj0Zjsu3EJVjOygslADP/SakBmtXM95UBYDC8r6xuiCuc8Yq6CqT4BaMPBaXxluytw
	 ugv058AjYgsAs1DOpOF/140U5T4ky9ebJ5O2NVZrfIvwzyd7LipiHPG5xI4idsE7Hjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736875;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tM9/1XzdtuiaYXptkYD17AG1YXmpbGIV2Zdg3FWdj2E=;
	b=baOYp30rz4Rj461mDrSNAJlTbisHTXjFhigU5oidET5mnzwM+fSL1HilfOMz/0fTfyRf
	 U8MWiai69FL+BzsHon46Bpz+eIx5Pdbx5ErnLP4ZvvBuiFUsoNcMiuSIrRn+r4c2HKE9K
	 iqCoagqWvjNJe0CNIDOA02knSwwu7mZV/iU+lPlMk8+VJvlIFWcH8IUg9HmoRCb/SE39x
	 4y5Gxv446Obvp23WkIvPEPVqtti/aE7jt/6Nl1sePqRtASf+wNfAEVJmVuIyw/QZsoANm
	 DwIW2wpL+5poHtZ7PGE+oDWsS1uwB5vzwAuwccUko6O0cFsmbyO9Vg8dCWmwguqIK1g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736875;
	bh=tM9/1XzdtuiaYXptkYD17AG1YXmpbGIV2Zdg3FWdj2E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jGjP+Xan9uSEK/meOksyry2/SCXnNO/k1oLy4nSo1+SpzLHENOGQEUxiK8wzndMId
	 WcI9Ad38ovqnTQ5QDQrgscrDN+HHIqVLhfyGcoHWhcGMJz2X/+p+YexXmcZHFMkjn8
	 btFbWwhHPADll8gL+gSTV9KkbNQh95x6ggfBXNvyFIBUgqsrIb29veHNWqAXSgOL2y
	 kih9gk2RpKm/mwuqKlQ63/EMEJ78PVsFDT6zIJJIrwqTskO8frCTkEbWRhpuKnUbtp
	 vjeP+TBoxjRWvb9Vjn7dMg+05lbbyHOJ4i63sgDUszhHf+xGCqFRAdarbHW9KRDFi3
	 R2km6B0WxZpsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFE1560E0A;
	Fri, 18 Sep 2026 13:07:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 347F6224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 276D060DA8
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DQDeN2vx-ERz for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6943A60D77
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736812;
 b=WkcrP5XsVdOJQIOlYFngNtWC3s2yjNOpAvzyh5SwUzp75wqNA+0iWoS1r2mAnFfH8vyH
 wDo0wwIdc4S3xMZ3ZsS1ePwKHd69D6r5tEi8B59Ra6aTuBcsLF4GBDM8PNUDOtRTtxsIx
 HU0cyLqPpCDCWs4q7wnYV0JUXcRx80EBo9U5ZvxxWe8g7mXc13UP3QA7TPRabAoNM+eaG
 ScSMP+DxU2YlohhVFFMyWkWcsJQIU/zbt/QNsRhwx/dn73UJii4zco4qZ6GsZtsXuXgg2
 WOnQB/di1zu8I8hHgq0mHVu9YlIzKEhahbIlpyisb1i9NuWVe5ZmO+dTbVnRPMNxAWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736812;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Fq0RmAaULthK5n+RxQPY2DdaOJG2zYZJur4KxcG8SbI=;
 b=KYIWXdC1BQqf9V1bc3lrF7K2culH9iWZAp9QCn1TUIaMOQxSAl+WnfZ2jylhYSzU1YG2
 UeyIv3wp+6Oy4JQHSAAN1kr4NjX+YIoX714813hD5iVV9lGh82Wc3pYrUa6lHYjzdjU89
 4Oep2Lpo3J3hwYcuzcnZ4d5rrj3+pgOm4tXhenO8C96Vj+yrffNW5LgNDgC7tjLV+1gPP
 QVm7SJkIX5OWTeWA98e5UM1KCpBA3WwSUITMbCxVq5WfxXxP6sycVHO66dmTvHBBdJub5
 c2JSLMrhxpgN7Yj6wGLx3F4423h2Qwbi9JKaNGWjpTyfy98LuFGtE04UdYxT9xVWGug==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6943A60D77
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2252197698; Fri, 18 Sep 2026 13:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 12:13:25 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 7cc8e496a245ec182a042b29a6df56647711e065
X-Git-Newrev: b1661d3ac4409d75bac589aa080e3328f122e643
X-Patchwork-Hint: ignore
Message-Id: <20260918130545.2252197698@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/znc: security
 bump version to 1.10.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b1661d3ac4409d75bac589aa080e3328f122e643
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/znc/znc/blob/znc-1.10.3/ChangeLog.md
https://wiki.znc.in/ChangeLog/1.10.3

Fixes CVE-2020-11022, CVE-2020-11023, CVE-2026-82373 & CVE-2026-82374.

Updated _SITE according to
https://wiki.znc.in/index.php?title=ZNC&diff=3493&oldid=3460

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 43558e103b50bfaad42f8d265ad971479de42af8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/znc/znc.hash | 2 +-
 package/znc/znc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/znc/znc.hash b/package/znc/znc.hash
index 128c84850c..08cefa6a47 100644
--- a/package/znc/znc.hash
+++ b/package/znc/znc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  5b7561f3b100234d58ae4946eac0262ab305d275c094e64ae723e45d07be08ab  znc-1.10.2.tar.gz
+sha256  68f3f6641b480c041010c5596e1234043e05c9137eda06233845017603095f5b  znc-1.10.3.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/znc/znc.mk b/package/znc/znc.mk
index 7ddfd64715..1144762469 100644
--- a/package/znc/znc.mk
+++ b/package/znc/znc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-ZNC_VERSION = 1.10.2
-ZNC_SITE = http://znc.in/releases/archive
+ZNC_VERSION = 1.10.3
+ZNC_SITE = https://files.asokolov.org
 ZNC_LICENSE = Apache-2.0
 ZNC_LICENSE_FILES = LICENSE
 ZNC_CPE_ID_VENDOR = znc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
