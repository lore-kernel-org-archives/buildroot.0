Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C661AC88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:12:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 90009405EE;
	Sun, 13 Sep 2026 09:12:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJWhJsbIrdSU; Sun, 13 Sep 2026 09:12:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 93A1940608
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789290744;
	b=H3F0G7LscU9m4EqOeurC1FF0VXmnC5gYdnAJtKKy7S5zOwfFEILPqwfbKnJQYpdR4U8k
	 A3AAgg77gTh3zHBkGbNuJeg/EzXLi+qLh0EwwxC1LM5URT8zVhuhf54QEX8lGedEvp4Ym
	 YXTFAI2CXE3C2bHZ2sb5fRs8WwIWj7Ze7157VYr8vTaT9d6whJCpg6D04PwTPLLtg9wfJ
	 lXoGlxAfPB/CqPRQ/slAv2vHLlpZnuF9id2+c+mZiAAU5c5PBBD6IP8gbGcceOjd+y5sQ
	 oK/C13Yd6Jnqj0ugnme60Be70yZn/QneaQret91DhieOG4t5EB7S0vNupVRrUxidzrQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789290744;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ym2/3ZsqZ4GctZxjbm+l08YLmJNXgccrMR2e/xWqnhg=;
	b=a7Wqp3QjtgH8WngNVjsPMWPuMRYGKdI4N5WSK2KJZxv2sUQufU1qqZh9LqvCzsikuDGW
	 fwG6+jHfxuhPyVNBMaBNffg0pU4QBBWSHFOkqVjq00E7so7lJytaBzFTcEQgCad4cSd/K
	 9HBqd3OH3vpPo+38iRCzvYt20EZ0Vww4lacBvy+AsJR0bWK0WqldJ08mtwdm3ecJ2n0pi
	 cpcdzSuqux0vjeoFmcsG/IgF8uaD2n0ezcas+uRc4HYxm6ZqmHSTvJfToYOUgLehwjc64
	 m2L/QqDx3/gnw6CflYm5OYAlsZ9YTvjaElq2m2lEVW3dZ5vbkQ544/TEP3RJew8hFXw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789290744;
	bh=Ym2/3ZsqZ4GctZxjbm+l08YLmJNXgccrMR2e/xWqnhg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dzP0PICNufzQ1bFoiDlQGtRQVjgmTVZSFgYsX4TSXBgTj6NYWG2/NfaLtSIwss0OR
	 6PYUQzmuzeZgWqiUD9uXyrCtnoQtUzUO1nrjsnWNp255UDkzQu/4+FiW1+pdLAqyeJ
	 6TmbGksjHeMQirmEZA8FJ5cmetzLPwXAh/54YP0jFghxVuSzJ7B2K2XYpB+da7LBmn
	 e5YkxfaYFL9CKbb0uo25AIhJeq4iWMOac0RWpuT6pNukWnvcRdJHESOmrknQsZrTmS
	 NY22iCQmsVUwSgnqv5PcnMM24De8QtzwBDlsRgBUVRpmdKh0+0pmMBeCby+vn3B5EC
	 89dHUvnJ4YVgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93A1940608;
	Sun, 13 Sep 2026 09:12:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6587632F
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5163140049
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:12:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Go9mn-bC2A0 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:12:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 9FB7940022
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789290742;
 b=XqwCjtBA/DN3T6HsoNJMkBgArsdeF2yvBZfacqlT4dsMbjM5tgDttoXQDpjRTCfZbDFa
 /WcwfgyjSSqKAeujUpjEl/g+raHzW2mHELRGPYFpvEVImpErvf0x31vTgoPJPx+COQN81
 ucdGu6Qt11Uc/R7erv6qy7zSMeBAYR+957JwcfuwSDEFGg3MoazoMdKSgkJ1T1E6r0L5f
 qpO8CmWr6+vrC/hHbNn4+/6eWy9ImasHNatb+e68NzZnmeUkkqDvUJsJnbcutqsAHNb1n
 UlbJ1UA1I9r/ldfiFKkON37B6gebicniyqNBSEkybS+vMBhTjCgx5xt6aZw5Y9Zi6yg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789290742;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=blo/Nxm2Hl+HswOY/tYrnz5Vb1HcR0eAVLmb0E6m2sA=;
 b=Ctn+xEYDiCajblSXV/xFfxOt4uyoJrxefvxmsr0sslqcsk23vagHJOjIw2rMtt++qCUp
 1rXwT/d8faMHbFRcGcUwCys8qpiua7iEDOW5P8WM3oTdCWxIs31Vpb+pACeOieBPEQC0O
 UKISDKUNZV/LNjsu1bMAEd4flmfl9C506rPacc57hJzmV5mWOFDNZK4U33C0LQrbr7n1O
 Vy1ovRpn3Lh0M/YWdFZkBsgKwYLiGdqD5yY84lD0gOh4T4o8EHDSnYKMVmmaAX3hxAOmn
 3needPWmwCJ7X7hfmU7zJ++2UOKU2ITWf22hCj2FTzzkOjp9bUdL5kQ7v3zWyzmJccg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9FB7940022
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:12:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D287395B30; Sun, 13 Sep 2026 09:11:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 10:52:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e36370624d761579b38df95c93adf3fa8addb67e
X-Git-Newrev: fa38fea91c4677af141f8012723f9263a4f00ae1
X-Patchwork-Hint: ignore
Message-Id: <20260913091117.D287395B30@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/intel-mediasdk: add missing
 BR2_TOOLCHAIN_GCC_AT_LEAST_8 dependency
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fa38fea91c4677af141f8012723f9263a4f00ae1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

BR2_PACKAGE_INTEL_MEDIASDK selects BR2_PACKAGE_INTEL_MEDIADRIVER but
forgets to propagate the "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8".

This issue was introduced in commit
51b60c8acf3f4b534d0954b801f1034491b59c94, when "depends on
BR2_TOOLCHAIN_GCC_AT_LEAST_8" was added to mesa3d, propagated to
intel-mediadriver, but not intel-mediasdk.

Fixes: 51b60c8acf3f4b534d0954b801f1034491b59c94 ("package/mesa3d: needs gcc >= 8")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/intel-mediasdk/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/intel-mediasdk/Config.in b/package/intel-mediasdk/Config.in
index c1f609e3f8..7738dcbbeb 100644
--- a/package/intel-mediasdk/Config.in
+++ b/package/intel-mediasdk/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_INTEL_MEDIASDK
 	depends on BR2_x86_64
 	depends on !BR2_STATIC_LIBS # intel-mediadriver
 	depends on BR2_INSTALL_LIBSTDCPP # intel-mediadriver
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_THREADS # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # intel-mediadriver
@@ -20,7 +21,8 @@ config BR2_PACKAGE_INTEL_MEDIASDK
 
 	  http://mediasdk.intel.com/
 
-comment "intel-mediasdk needs a toolchain w/ dynamic library, C++, NPTL"
+comment "intel-mediasdk needs a toolchain w/ dynamic library, gcc >= 8, C++, NPTL"
 	depends on BR2_x86_64 && BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_STATIC_LIBS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_HAS_THREADS_NPTL
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
