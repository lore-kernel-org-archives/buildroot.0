Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE34C982FA
	for <buildroot@archiver.kernel.org>; Mon, 21 Sep 2026 18:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2C716074A;
	Mon, 21 Sep 2026 18:45:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4kYubkvrkJw2; Mon, 21 Sep 2026 18:45:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 97A9D60743
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790016311;
	b=r/HrY61qcxsXSgN+sPFbniYxLVScJ2nI0uuHWLpa1exFx/P3dAk45pMmlkMYXcFgwuHq
	 j+pLuYA9CxoWaKLiYfB3lZeovJeWXcd6ZFzcaThZIKLX9JTimfmxcRFu5vmx2+pDY39hP
	 gKdiC/zymWZXWl72BMzHOG4dwbOhSSWSHxdavu7P8w+ozAExEFhMomD4VrvbUGRObSx6N
	 U7Xxj9GPDS1eqzf1d2O9nNnM4wM9bJpBmNSIqBk2fIIflUlGHr2Je8w6h7VHZsZyL6LTM
	 dRrRbeSFydCIQDgY5TNNCFaSx7h0bgnSfiG1+PuPY2kLPK2Ad6nkfLOGVO7GGuxC/wg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790016311;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jCwxarcE//SHQM6XcbX0FCXXT68bTUZheMJt26QHd0Y=;
	b=D//7kz4OOVcYPcp9vFFgCV07fCIlEh+yjAHIL4G8mGFKVZkD7iMAinrcT3k11jq+Ac8i
	 TYFcHzHjUVYXxal3KsI7veBUumenkuxbzspJIXqVxCR6/2COiVqt1TFIxZVja9hArL4rk
	 sCZG/0P8iK3JdDMs5vA6K2+RXg0FHXy4JaCo4YAaHySwBsnzcyhjOJYVD5kr65lpmYIKw
	 ztjojmGMLOUM38H7jjHp2qPOryKhtNcGrW7fguX3JPHixv1Y+KOuTfTZrpwkjaOSmaFTf
	 AFZMf/MXinnyrmjAppmbZh2PPkEDBq1uXw0Kf2XQhWHFkvOM/iMDv/d8crGkVX7dqFA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790016311;
	bh=jCwxarcE//SHQM6XcbX0FCXXT68bTUZheMJt26QHd0Y=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sPKb61VyiBranP/Ghie4F26OD1H3CqGqZmiwCiMYiv4VOXoZLIXVCsx0aHqYc2vaI
	 ykP+JIhs9TwrtGUAUP8Oo7zWx3HnnuP+PdVe39LpMH9jsNkRzscPCANyJnhX1fWFQ5
	 6j4linsQX4F1HTyKNM1TrxGlNc2nGKRux7qIuKHKylz3qhWE0eKgvkOo5ehwcWMpES
	 N7pxEfHxEmHpqSpDkzmhgkRx4Irjl8V55rSjhpV/kcGUkCafrYYCcE40tw2C/lksM9
	 GBN+XmXYusR4rqD0aAejYyPnSzGmUb51Ns0N5KUzOozohby3CBlFwCqu9TfI0iQitk
	 WZQpUad2tWT8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97A9D60743;
	Mon, 21 Sep 2026 18:45:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6AD8E9C5
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A62E401DF
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hFBgOG0rMTfu for <buildroot@buildroot.org>;
 Mon, 21 Sep 2026 18:45:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 49C5A400D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790016307;
 b=CXfwKx1xp8zZm92p105pSMVRTEDZJ88/6vM+fPOwhce05jM4GdspubEuqhRdf4nr/YJI
 ZTzCVBupe4JVl5ggWOEYswHsXt/k9GOurNBjjI8uRHl2gAcZ+msck856CGk9gt16gUJN0
 OAVIDDPUhkQH3AE5avfXtoE7QtEg/DR+dcnUdNcatWKKoDMzOnyHbr6F0H67+GvvvGe6H
 Yuf0fqs3f0+J+8eQPzGnKHrEsr0uyT9S+2oZhlbPLfDjzx+vr65RkwzptWZnRfx85tYO3
 stYLgc+J9//9WYjr1xHYTeMCeFjayZsdZcuC3wEt7dxOWudg/PKTqPJADKcCB/SmjNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790016307;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=16p4RJA1uQFieiRMRrfEz2Ul+nYFQf26b4Z33D5/j9s=;
 b=GYOO7AjzDQHQFcqcNZ8/72Dedwo3K8BgO43urEmkcepq1M4HIDiMJBb5dYVkrLMf+4dt
 H8dwNEEmVCIvyf3GyZxuIVtvnLcw0ZsQquUowlsn/ETUzDrFPU730+pnkyMxOYeFew+7G
 COZAFuRfr0TB3dhTZIPz4mxmMdSchK59Jub/koAEjVRmAsMs0nv+ZLv7EYAfJROXNOpif
 jNkSGDY0AN76PX13LIcBC06pgmjAXb4anHjOW3wcnIDvKZToJuBXG9JZaynxn6RnRAOMi
 9eRj26sRPTEnKrMXJTQrd9OkJTfSii3c2MNTb6NlyFGqbV0VAETz9kGdIf7kn21v1GQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49C5A400D2
 for <buildroot@buildroot.org>; Mon, 21 Sep 2026 18:45:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5826A935A7; Mon, 21 Sep 2026 18:43:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 21 Sep 2026 19:43:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbf3c1f7bf8a38ea9d3db18f9261cc74c27be73b
X-Git-Newrev: 02cc32ee5c66708b1f57c3aba1fc357c3429c2eb
X-Patchwork-Hint: ignore
Message-Id: <20260921184358.5826A935A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/distribution-registry: security
 bump to version 3.1.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/02cc32ee5c66708b1f57c3aba1fc357c3429c2eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog since v3.0.0:
https://github.com/distribution/distribution/releases/tag/v3.1.0
https://github.com/distribution/distribution/releases/tag/v3.1.1

This feature-release also contains security fixes:
* CVE-2026-35172
* CVE-2026-33540
* CVE-2026-41888

Drop our backported patch, included since 3.1.0

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
[Julien: add info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-s3-aws-fix-build-for-386.patch            | 45 ----------------------
 .../distribution-registry.hash                     |  2 +-
 .../distribution-registry/distribution-registry.mk |  2 +-
 3 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch b/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
deleted file mode 100644
index a725ab8e92..0000000000
--- a/package/distribution-registry/0001-s3-aws-fix-build-for-386.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 6970080b10a53d858dd444a643a2bd911de12940 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 29 May 2025 11:28:38 +0800
-Subject: [PATCH] s3-aws: fix build for 386
-
-When building for 386, we got the following build error:
-
-  registry/storage/driver/s3-aws/s3.go:312:99: cannot use
-  maxChunkSize (untyped int constant 5368709120) as int value
-  in argument to getParameterAsInteger (overflows)
-
-This is because the s3_64bit.go is used. Adjust the build tag matching
-in s3_32bit.go and s3_64bit.go to fix this issue.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-Upstream: https://github.com/distribution/distribution/commit/6970080b10a53d858dd444a643a2bd911de12940
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- registry/storage/driver/s3-aws/s3_32bit.go | 2 +-
- registry/storage/driver/s3-aws/s3_64bit.go | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/registry/storage/driver/s3-aws/s3_32bit.go b/registry/storage/driver/s3-aws/s3_32bit.go
-index 218e3eab..84161fcb 100644
---- a/registry/storage/driver/s3-aws/s3_32bit.go
-+++ b/registry/storage/driver/s3-aws/s3_32bit.go
-@@ -1,4 +1,4 @@
--//go:build arm
-+//go:build arm || 386
- 
- package s3
- 
-diff --git a/registry/storage/driver/s3-aws/s3_64bit.go b/registry/storage/driver/s3-aws/s3_64bit.go
-index 55254e49..2ed1f92f 100644
---- a/registry/storage/driver/s3-aws/s3_64bit.go
-+++ b/registry/storage/driver/s3-aws/s3_64bit.go
-@@ -1,4 +1,4 @@
--//go:build !arm
-+//go:build !arm && !386
- 
- package s3
- 
--- 
-2.51.1
-
diff --git a/package/distribution-registry/distribution-registry.hash b/package/distribution-registry/distribution-registry.hash
index 38d7b5a487..9c2fa922ee 100644
--- a/package/distribution-registry/distribution-registry.hash
+++ b/package/distribution-registry/distribution-registry.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6330e6b625c0232b43cee8ea32800a660a7d7a0c79f4f53e4d9a8a6707138d46  distribution-registry-v3.0.0-git4-go2.tar.gz
+sha256  5ed3891ed90c7d097304f49aec2e1f16299770309e2f424b5ee9531b1da2429a  distribution-registry-v3.1.1-git4-go2.tar.gz
 sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/distribution-registry/distribution-registry.mk b/package/distribution-registry/distribution-registry.mk
index a01a3c1710..1119132b48 100644
--- a/package/distribution-registry/distribution-registry.mk
+++ b/package/distribution-registry/distribution-registry.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DISTRIBUTION_REGISTRY_VERSION = v3.0.0
+DISTRIBUTION_REGISTRY_VERSION = v3.1.1
 DISTRIBUTION_REGISTRY_SITE = https://github.com/distribution/distribution
 DISTRIBUTION_REGISTRY_SITE_METHOD = git
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
