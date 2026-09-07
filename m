Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE95DC79FB9
	for <buildroot@archiver.kernel.org>; Thu, 10 Sep 2026 13:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 994128104B;
	Thu, 10 Sep 2026 13:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B65hSBG2m9b2; Thu, 10 Sep 2026 13:56:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7A4FA8100D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789048616;
	b=avY4miym+b19SVu3W2mg9h1wT1PEctN7qOqpwTv4XyWZ/dOPM/DCjYSQSzUi7ADE4lbf
	 7S97qGVHYGexfA8fsn4K05QQAgAS9xIrjPs/9uDHyK/QUK7MeR+O/oTbhxQEBeT4Kii41
	 /5keClXRYbYr4bEuvMhEDQgVFgmQEs+7Em7cn0UPNN6I0V85al8Ryg/bVbrA90Cb5nbMM
	 W4//tyvvGZHrc2igAkhlh3IAsScI3OLKqblRLaljRWGzOrby9yP5fGHV39dHnpTjW2yc+
	 3cuGUts7LBmoi8x8Lig3dy8jf5XwQ0HXjYY63eZKwxI7gOFFa8zeXVHOyyTdkLnh4Hg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789048616;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=J3USDneGUFTHvCypQ1Nucp0q7zqRVGio3q+PY35XDgM=;
	b=FNOQJR+bE2+pF8Px/1NkNMgyeDGVpl3au22GTeRzI+38m3YENs7xbifoTknl1/tFy1yK
	 2gUk9NChlTCyDF2sXX2ccapiQii4z5d5jJoXnPKb1nWy+MqOtNJCAOpLC9T5eMlt0918J
	 4IWfUjXzeMoT4i52gE4lpwU94pB4AHEm8YwvthX1rAIKsvQcEFfihHvm3JNdsyqQGAw8t
	 QVOffqk0oYPuUmMtzee9aBqGV3r/uXFeulgkzEFUdIvp/aGetlNk4wthdi0otKlME/bZ5
	 NsKtIW/PfGITonl2xloBp3A4tuJLNu5dzLIjJk5ZvYRazfdPYBWi4b4djKSW8q2DiWg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789048616;
	bh=J3USDneGUFTHvCypQ1Nucp0q7zqRVGio3q+PY35XDgM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n7m9bgiU82o7lhNjKO/rO0UrduNry06Rr9nK4csm0K2qjA4g/BZU7Y+58hVlD9hmQ
	 /IgugHWdVrG5izbtTMO5t1dk1TGAx2Jp5pZ0TVmOnhQ8S1OU46Z7UjrBZuS7vqWYmj
	 4PLALopNnFhFUC87j/+XdXwzbzaHqEdhhetoAnC83hk5jKW5kS+WIIhyeTJKdsZHwt
	 qsfQo3/l1aTHTGvVMYBki9KyS/t2VIdJ7oHUY8O3RYpdvij3J4JgaJuOfwI2Ac2Ctr
	 A2JVIc7cjuekkl9YIld9lWSXhtmW7wFdyJmc8qGYX71ZLDWuW2RHE62kWMI+3nyKQK
	 IxS5LTaleHcEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A4FA8100D;
	Thu, 10 Sep 2026 13:56:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 47D25268
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 13:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 381028104F
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 13:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgKOI0bKb2VN for <buildroot@buildroot.org>;
 Thu, 10 Sep 2026 13:56:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org F00298100B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789048614;
 b=cm5BqeVb2MgPhhXKS8VpTDw18wy2Kkwnr/hDYu9OJyrV5Wr0ZUm48W7L3G0M9rYddSS7
 EmyD8o3uf3NNkkyGvqhPnk3Y8FyCFwQNgO9ED3odiuOtKv+5Bm71YwAcPaTOYW7VDoZPU
 FyZ/Y5feXzLdFHl92ycJqIGaDAiqX5JqgLK/kPUn7h/N2NBUPUtvQP+1olcoOTucLbrw7
 g4yJ6p7J2uFgyj6yKpiJAwEyEHBR6R8/kJZrqFKa98cwLoVlAnv8Xo2dOOJIRE6DbjZGW
 WaF6D6rGXqYJwGTLXRebkcd3ocDI26Jfv75UBEON9qfXYoZm4AowpdhTTDCKnikLRcA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789048614;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qbt2oeAvjT17NYS/blfIZUmcoivXCD1ImPqxcpAAdXw=;
 b=G2j0X6rq5F+xTpUexiHjYWnS8NdUUhCD0GQ7wthDn6X5GoBv2k/611DRyeMSE+yZ17Gn
 nFWdIO1BIpRFAbAJv4W7qaVsBmT1KELg4jqMRutN3O5PmHmMXc9PRCdCyu7Yv4oiXgUdD
 IaC/U2jI1QFdx+0nYSSQU8HGWX2WJ1ChvyYUQGaCzNiGna/BONEImufvIVpJ/qucwcTkr
 1B7Fy+c5U6Rh233xNJ3ywjTLpzCMZ50ZpdvUQsLV254dfatXobNremSRbBcnXXKM+RgaT
 XpjqbeChYxX1PsQo27y7Vxf/X8lnphGO0U+S1NRtp6bX4Za3eiemv2snazy2XwPZgCA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F00298100B
 for <buildroot@buildroot.org>; Thu, 10 Sep 2026 13:56:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85A759554D; Thu, 10 Sep 2026 13:55:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Sep 2026 19:17:55 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 99c6a4c7289e8e38a41200e0579727a03cc56fbc
X-Git-Newrev: f545eadabba159e411c52d39e2649c5e4563c750
X-Patchwork-Hint: ignore
Message-Id: <20260910135550.85A759554D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] {linux,
 linux-headers}: bump 5.{10, 15}, 6.{1, 6, 12} series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f545eadabba159e411c52d39e2649c5e4563c750
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Update the latest kernel releases:
    - 5.10.268 -> 5.10.269
    - 5.15.219 -> 5.15.220
    - 6.1.186 -> 6.1.187
    - 6.6.155 -> 6.6.156
    - 6.12.107 -> 6.12.109

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 10 +++++-----
 package/linux-headers/Config.in.host | 10 +++++-----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 334ffaeb6a..1e306e9827 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -139,7 +139,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.12.107" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.12.109" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.246-cip66" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.246-cip66-rt29" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 6d92a2f601..3b0817f2a7 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a5f8c5be3fde2d6d9ca14e9631642cf1f44487143f11059da730dcd5892e307a  linux-6.12.107.tar.xz
-sha256  4e67a9263f2c19b070112109c9a282ee8e8ea49f1641e41faa5cca2c41654982  linux-6.6.155.tar.xz
-sha256  eeedc32bbf2448205aff50ee2760a4d87172cf8f8279c1e5930069ad36f6236e  linux-6.1.186.tar.xz
+sha256  5484e552a334e15019f4aeba89e5b58f04651cf2f4e24e04de9f152f1c38e3fa  linux-6.12.109.tar.xz
+sha256  aee2264a4eaf4a14344b47a0469bd42e8b4885b24f110b724262b3da956f411d  linux-6.6.156.tar.xz
+sha256  1b6e798aeaa708ca670a426ad5a6c86dc2237b8e59e8822876976c383873642b  linux-6.1.187.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  d04a4f798cc26f81170b5ecb27a3d8c8b4838f3aaf2a431b577043e2ead05ca4  linux-5.15.219.tar.xz
-sha256  7b164daadbc3743e61946631a924eb234d5136d7923dd4f3b40a18b91e52263a  linux-5.10.268.tar.xz
+sha256  b5b2992505120ac864cd9ccf7cc44541684df46c5a0b09ccdec93fb7f9aa6723  linux-5.15.220.tar.xz
+sha256  9c5a168119406674ff3bcf366a3a235206eecfa7b79f04629b31a7cc678cc6e9  linux-5.10.269.tar.xz
 sha256  ae6a3207f12aa4d6cfb0fa793ec9da4a6fcdfdcb57d869d63d6b77e3a8c1423d  linux-5.4.302.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 158e5192d3..3f46be7e01 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -429,11 +429,11 @@ endchoice
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
 	default "5.4.302"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.268"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.219"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.186"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.155"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.107"	if BR2_KERNEL_HEADERS_6_12
+	default "5.10.269"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.220"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.187"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.156"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.109"	if BR2_KERNEL_HEADERS_6_12
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
