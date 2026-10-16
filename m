Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44A7CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EB75608DC;
	Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 17lK4LLbpmNj; Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ADFEE60801
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156108;
	b=a+eYhWxUnASum933j49iAbAON8aujUVsWpmUccTNFapUtAx0Xw4atZdxHVKHqCPO5QDd
	 Szcl1qqvnJYAOenW7JUA9HHpm41nn4RXc1EC8e4PfKbBLejni4T1hq453sO1F1xRjbSxS
	 MYPy0GuvrlmOCpLbLaEpvT2uAllu0JoXV1m/RRuxw5fkzgeU8D6UDC1axnX5N58uvT4FC
	 uqQymPi41GdvEPqPMdpG3HYBUWK5UMmBYXBOi4T8ZZxXPmslrF6h7ircP5a+2ajQCRMKe
	 TGWPpxHo/9lCI2nFi/rsr9kXzNoCOQgYEU9IQdjXQAY8scsbHVTUnpNEcvU6McPcL2g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156108;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=DErqd7cqV6SfUz67/N18+adprxCRtDodt4/UwygSJJc=;
	b=T+fcqWbCCwsVDuijkf0HQnlNuK09BfU1A62bplyKLoIT05SOMDm9SprOFXNVkAysSkuN
	 V2Nj/oyuurIP2/7+5cj6t1FDyiEuqljw6JcfJr5UCwD/cVRHY0iW82UJsXHoIoxhmztoH
	 uF+a8CFBGviwmuyJNkc1an3GvVxJWU0r6QjIgQyamUYOC+tVTya3Y++hB6V/3DOQkNPT9
	 2fhchagdWreTtXtkbTG8+V2iCnZntqVbB35WAS1ghtAZCBQcGVTwfnHralsClahWyhHVH
	 u4+eFcIq/Lopc9Zo5ezeAVp3sY/GhxphaRj7wIzIgIivDib8FWJDuvUAeYEb57dXbdQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156108;
	bh=DErqd7cqV6SfUz67/N18+adprxCRtDodt4/UwygSJJc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y7gBImMIdZZKglDt8nlrNRWI8BqQueaZU4dv7XytBm6r5LtsnYge+mqRAixnHvQY7
	 o0A3p0KNNgYK7V0krhiSfpDsEu0aQ+AiJG4XFmNLbSooq4RsuyPBPzyJHZI0lKPk08
	 6vhFXrnkC6eGjCXGzkpAKWUwkn+rlGU8vB5lcvee+PsY9qu0nnzlV3VV92d905t7za
	 9cHRpVpdNGQmGoKboF2zJBfcCOnLE8Uef/PBAWm/DCqNnO0r6r9kqeHq4zpTEWNEtF
	 B6rDjMhgABT1IRUI45jbDv8OzJQo2KyBE7ZISMC/0BX9vLJ8u73rhX13ozFL7cofDw
	 Au+K84J2XDt6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADFEE60801;
	Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 977A2769
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 955C840474
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eEsp7D7-0aSa for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A6ED940042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156106;
 b=gcrKFAm22Y6k84Y3kyh4Fn+xjsl0918IxIv7WPxceuDrase/NN8mav4gXJDQQTio4qCY
 9DItk/eij/lgxbHuV1FLWwinBJi3CAh6DoZe3orUlxQgeeWH8ZUYONldG8kVTZ8MPDW3t
 zp3IdQGJl5YbHV7Rskq6MfWKmJPdhpS8Q1M3xqVq2YOvxKeLC1aVGW6bKgZ11mY9GzZU4
 fVsR6rOGUEKIViky+JEAZNvYOkOY/tytOfm/2QmmEQmkaMn6pR55wHcWZiJYfIAHm1kUO
 kGtmrKsHPwFaAUJutoGlj9j/YMhobd0dGntxIRl43VwTBkWURrKQwsTQXKxoA2YNdpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156106;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=rvGvD2n4yAwznygUVtgaVyTu0PqKOAHQZSYQxyuGs5g=;
 b=kvv4f4gWsx2c59/Tz5JLvve1JKYpyEshN/8XWvLEmCF3AVEj/DbaKe095ghe8HvH2xAa
 tdD6XND6Q89uVxeoighs1t1ZdYFt5j11NUQ0NO/r+rioD8hdtq1LZyqR0sh2IeljyScbV
 qHMAprj9DZGGxQ89B/SwkLK+NCaaO9OD6dmIPC0z9io4O57xohqx6TdW0sCJivWaLOFv/
 QONPmHhov6MnkpHxpgCMSzjU3usl2gcdLkDwfyyv5mJrU7SnDmk0vpPvOjvQol8tlQ2lN
 rrrBHtPw5radPMP8eTj2w5zLIaVWFBKJuGQk47nAY6Do/7l7mspx3WYnq12e0H7YdMA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6ED940042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94381960D7; Fri, 16 Oct 2026 13:07:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c3338ca728def2a45497c41346c57c0d275d4d04
X-Git-Newrev: 34dff36a1bba6b36b1b868badc56f01eda8f3f8a
X-Patchwork-Hint: ignore
Message-Id: <20261016130705.94381960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/hwdata: bump
 version to 0.412
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
Content-Type: multipart/mixed; boundary="===============2111971684705617578=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2111971684705617578==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34dff36a1bba6b36b1b868badc56f01eda8f3f8a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/vcrhonek/hwdata/releases/tag/v0.412

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 57ed2d0d6821971c62eee39696a748395502c518)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index 0046b56c75..a698a26265 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  d75462181fbd307228e0a48b8d1449f1773ea4b1f17e8a1d56346907f999ce33  hwdata-0.411.tar.gz
+sha256  f0c64cd7e31d70a5fb3a52e53ab50a61e74c0421a6381eaa45114eec3bde5fe7  hwdata-0.412.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 20ecd799b8..5858b821af 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.411
+HWDATA_VERSION = 0.412
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE

--===============2111971684705617578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2111971684705617578==--
