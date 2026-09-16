Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84670C982DC
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DA3A60B7D;
	Fri, 18 Sep 2026 13:06:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Co8qzKwsk6Ng; Fri, 18 Sep 2026 13:06:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 353AE60DA0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736761;
	b=XU7lNsvptJfvHoIowzpkg3l+b5WwbqAWu2kXKMbOuZPJeXl1p0cEAxTSBt6s0el/6Z7t
	 KEkEzIXW3ifwLPXXh70CbplEbVoI2SgiqZl+6ZP0UWv9+vPkjwAoQDjF3Kv2z/jzCZVYb
	 aF99WUtgXjcdUwiB1WXrAqavnVawNm0bBKsNBChTATpu9jZAym09P1mIta4aJ6BhJQRY0
	 xBWzjNeaKoKzKa9Q28/BqeJuTocU7BHTcM2LSjKGQBFwcXuQUWeKeDZ9hlf40K48D049M
	 xQ/QFbZqdLAo2uM5yTi15a9ltvv/cReGLniVVyQuLi9NhTcEa//+qh87KIeCwA7bd/g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736761;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3vFAo9U8MqepccMsXj8nYI8UEAR7WmBVpR+EK6Rq8wA=;
	b=oSBvmt68x6uVJir2DdqeqDetzHEOPkE+BrY36/8PC76voexcdHN7hZj31MgIjJnV9qcU
	 97we3yklJXUfW1jK9NnC98/rxRlKQCfzBKhZ9jd6+R7dCYyxEV4ACFJIumNQOm0YYDCMj
	 q48sfbBZyblN/COll4NE+YKQ8TyshHT4Y9huLawhlJUXNiqqvH7++I++t/Xwyrd0jdILF
	 qxIfiUTejijLVfn8TXjRNd6VAgSs69iSiSTyC4ThTmS2ONE1de38N9xVisB4Cr4TUFjPO
	 zYXYFGlAuuxVg8FQ5LE8jIJEcLgLF5SsDHHIl0F5kd00jgBMYKpornXV855KeaJ6jxw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736761;
	bh=3vFAo9U8MqepccMsXj8nYI8UEAR7WmBVpR+EK6Rq8wA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vo6pU/LihbB9/JjUNfXEoRHpagIMUlCdNwUk6xSWuXc8Wn7AnwRcUugtr+moQsx2i
	 Zdmoo3v5qKfwzXyMzPpckAI4iPZttqvRGJqoSwSvPo5eP9seUntJNaitBhA9wij9RR
	 Y/IVgWu9KRH7CGRaQSZGX7+ehFuWW22g4L3HGIUV6a8bwLBUjyBZxKhXYaXgbSXGlI
	 y3pUzWqzBlBQdyDfDh1zVkq/LhXzKQHhdCh29/21OWxq4iwu9jfE2cdD6DbpudiGYU
	 J+gJMLxlby+xn2ouz04SKkFsqDLhxdbJRszl5nXXuBI72PzWPxsZvqpeqTwOgBqGHU
	 uw21KfWTs5CZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 353AE60DA0;
	Fri, 18 Sep 2026 13:06:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E28812FC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 49EF88124D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xfvd4YmTbjmM for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 50BEE81292
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736747;
 b=FLULTgNxzQ02cYybGF4xq9AaIGHRqaCzjKNsmaxyifHt05SYST5T97NPPYQ9tMMuWjy2
 VCXxH89ERSsT6/yP2g/Aq8cYMrxbnn4Say4AgJxvoC7HxGWisLSoIZUItCK4aUnYZHMtB
 ovS20gidFoUxRvl9p4yVFEw7dFvKX6M7K+GleW9xoKDLAWmoWypPF2oLRLX/NOHJ/6+Bh
 LEmMW5ToaSwi2vacWbJdyCgkdC4pnoEFH86VaDjUpzLW9Bi5aAdVgxsJfHBWr5uAKrgoT
 8H6v/FOBmZ6Ur97rchnfvW37o5XyRS7p4zulguAd8h7T4jrTDpgp1WYMeBdwvoXZ7iA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736747;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WoekhyrW4tW3EYLr4XhM8mo3oa6mJ5UHb4tjeSmFY8M=;
 b=G/FHd9eu67LcT25ntFuKpDYZS9O8yO1KjoyRe3VntllM+CrIx0QKK2V1yE6wCP4mN0h3
 9YRbuAb2rbVGpXuNV1lH3+pFy9IEiKuaF0/wm+wT0f7n1yL/3c1j3p6/htfCYehBCSXwQ
 oAdEPv29qlZjwJfOyCrpvJ3LlnXPmXCKL1MMo3uIGXsiX1FQzNO8s2cpLc/1Y4SP7OUb2
 8Gsf6/RhlZvLwkIwJyNjR6RiOv5Ppg3YYGUtvTfmIfPHboOKUC6Gpuq5ogbjJIyYokuof
 uc2bkBJnieasqT6ejivoctCgNsaqd6o1GEN5UOKnP3pZY7q1lJ1NbYZDJ6Gz9BB3QUQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50BEE81292
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:05:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0B33976A1; Fri, 18 Sep 2026 13:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 11:21:55 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6b9d6f0d5046af9ef168dba5680b891d07b90b22
X-Git-Newrev: 3f9399577b6bb5490f45db81e167b4399a909d4a
X-Patchwork-Hint: ignore
Message-Id: <20260918130439.F0B33976A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/pcre2: bump
 version to 10.47
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3f9399577b6bb5490f45db81e167b4399a909d4a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.47

Updated license hash due to upstream commits:
https://github.com/PCRE2Project/pcre2/commit/4f5a2ada2ec070896f96a2652ae05df41c4be14c
https://github.com/PCRE2Project/pcre2/commit/1fffb0d44e7a62ad290cf24586c78bc04b689144
https://github.com/PCRE2Project/pcre2/commit/d8a9f2fe55b47934cc6095df6e113e7986805064

Added license file for sljit:
https://github.com/PCRE2Project/pcre2/commit/d8a9f2fe55b47934cc6095df6e113e7986805064

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1023741fb17863b645cbc92b643dd5bba361c9a5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/pcre2/pcre2.hash | 7 ++++---
 package/pcre2/pcre2.mk   | 4 +++-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index bd2422d991..17f15c0fdc 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,6 @@
 # Locally calculated after checking pgp signature:
-# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.46/pcre2-10.46.tar.bz2.sig
-sha256  15fbc5aba6beee0b17aecb04602ae39432393aba1ebd8e39b7cabf7db883299f  pcre2-10.46.tar.bz2
+# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.47/pcre2-10.47.tar.bz2.sig
+sha256  47fe8c99461250d42f89e6e8fdaeba9da057855d06eb7fc08d9ca03fd08d7bc7  pcre2-10.47.tar.bz2
 # Locally computed
-sha256  9cf7ac6976099a1d856826d3ef1b093bd6b84489dc6100628ac79e740cf9885a  LICENCE.md
+sha256  197d8a73ffee0d6b09adba2f9c677b5f5aede24edf89258a68e48248d010d811  LICENCE.md
+sha256  5f216505c0f6ea3273caec89e766eef93cdeb7bbb0c429f9360116d7c938feeb  deps/sljit/LICENSE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 1d0a3b845f..f2b5608150 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.46
+PCRE2_VERSION = 10.47
 PCRE2_SITE = https://github.com/PCRE2Project/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
@@ -22,6 +22,8 @@ PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_32),--enable-pcre2-32,--disable-pcre
 
 ifeq ($(BR2_PACKAGE_PCRE2_JIT),y)
 PCRE2_CONF_OPTS += --enable-jit
+PCRE2_LICENSE += BSD-2-Clause
+PCRE2_LICENSE_FILES += deps/sljit/LICENSE
 else
 PCRE2_CONF_OPTS += --disable-jit
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
