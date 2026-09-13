Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02997C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 10:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B684480E3E;
	Sun, 13 Sep 2026 10:02:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RvrFW6IjmhOw; Sun, 13 Sep 2026 10:02:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org BE95B80E76
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789293725;
	b=ZmVN5rEtiQUcIUensZdZsBOfzXyAB4jXzn63tSilTiQPsny1VWX/xuxdGDz17tYmzQ7k
	 qHUi+X8bUX9UcPAZ97ROPizpKwkT+4XMRFSekaOkM/Tgq+ZxDqYO4XAa4jBaMhTOYmoB3
	 z0jlqIUJLGcQRhW9XoYeIigjvU8lpHTqmm3qm/7SWvCURnScCbImaDrmjZnf206isd9ja
	 59mZvjnMJLWLqzGNQPxGt75OOx5bt8+S2djAY/Znc49UZzmhIF0RPtg1W80Pd4OQLSo9B
	 c4CYxcU1OQYck710+FLj/9nKUWoCZjikX56OOcK18GqgFBqxcrgwUrizQPSnjojFENw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789293725;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fpNEAw0vmhBaatiCinEfmD9aNGqb4iyN7k1cJEuHqRU=;
	b=UEgfa9Bw9j+C523rGCxr4RQ/K28WOEOwC8td1aYs10wh73nqLh7O002ZQwuR+T+Fy9nL
	 aCDdBRKkl5YxLYqfPchRGqU8tiIXb76luvn/lkeix4BZ+GlLYaJKKit8KsjX1CbrpncH+
	 YDWdSHCK+Ma27eCWJfOXv9huBTcT2hGfGAk8Jvh7x8QRn8JunQrRsCSqMfmw2PQoxP/iL
	 lq3lraYkFAIFh6Q2nO/FYcRxyuSDbz1zm1he71lT8vJlHXbAMDes2Lj9kov4kdIkU2kPh
	 k7q/JXgaVJljKJ0TFaUQaUjKGUQWlPMZCGrDIijEgWNyVmGM81VAU/ERD0YZTSXVH7A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789293725;
	bh=fpNEAw0vmhBaatiCinEfmD9aNGqb4iyN7k1cJEuHqRU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=md7IYUk+5ewAYaD3tWKn+gIddXwD/0S2orc8kYrndmiHCii3nvrfsx1s2cYbUk5mR
	 I80M54XV6zvIHawchKx8qLTcU9GvROl6k6NgasDgPix15hi8KW8dmzZkJ1RF5VBI5O
	 KN1IdwrI/gvbrcXk3Q/WHVhmLgLODiz1O9dR6/NjFkqbpp2UzdisLKD1yt8zIqNePy
	 LybmH5xMBKfuKsdHnTBnBRlsppc0lTfPY6cRuM4A9Fnps29KglDQnDrmk3dk8o1yf+
	 wQXJwuORTYm302POxTxf6ULIMovEVBH9xqXqSTqzDBQ4munEVftfogh6ky5vc1tt8B
	 sos4ZzEUotwCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE95B80E76;
	Sun, 13 Sep 2026 10:02:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 03B14EB
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD7BA80E76
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDjwcHfJOqaZ for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 10:02:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E511280E3E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789293722;
 b=kqI0rl5RESJuf1wtLwsYuX0x7Vop18+hw72xih811EN0Bnq18gDevwc1bdUmxPSQ07C+
 XyQmUQItWM76vllkByqPeW60+WOKzZk213qNj7wN2ukW/s8gtzUuHLszEuBMsLjAd37uN
 36JX9Sa6WVu90GCO4tACPlWZhvf2K+xngIrtiEmiy4XF7BlJ14WOPynRA+Z2GtOy/mV8L
 yBhJyrO8tPrg1LAEmfj7tIw8sqOpAypbMUeva2UHLNCHb+v6FMn9zsp0Q5fnrbEfb3Oly
 PoZR+jq0uOZeZ1s4zCWPADs+PNCIkuexmUyJvMUziWsy9vLovGF4t2Cf6wQpJyAVKew==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789293722;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tY5qIKhgEQU611BiEFeggH0EikYQl622gLs2Doo9u6w=;
 b=PMSbia2fF49SYpd0RiTfPcML85IDLl/WUhnPBhmn21aKosT2EuSIK/cFjww4ct5npIIe
 3QW8Brlf/9+OkT6YrybkNRZ0M+wAbyVzwrftLdMS6I8LdCdJ9MXM0bJzVx81iQsaLuJni
 zKKix3nxmx12bnBaqlYtoaYLrXASTsUmn0oNC9Th1weeWzIbmc/4By5Bg5kCd5Yo0V0ui
 ZBIYaiVViW4mpc0Wk8dD1yyGsX7k6BB9PiAbtIhlNzQUwcvJyP7W9JDLQycBDCfSnTTb7
 rPAclITj+if1NP9XrynHJrfI02NqyuFzTwYGx2goryoXvjLTxUheGpQHBJzz0rkzNDQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E511280E3E
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 10:02:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 200A795B8F; Sun, 13 Sep 2026 10:00:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 13 Sep 2026 11:56:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: acd98af32e07d0ae10adca355f4ec9b182eb4214
X-Git-Newrev: 43a8c35a383e53cc81ef4b56d346a5501178d7f8
X-Patchwork-Hint: ignore
Message-Id: <20260913100058.200A795B8F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/gen-bootlin-toolchains:
 fix ARMv7 EABIhf toolchains condition
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/43a8c35a383e53cc81ef4b56d346a5501178d7f8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The ARMv7 EABIhf toolchains can currently be selected with ARMv8 cores
selected, even when EABI is used due to how the condition is
constructed. This obviously fails as those toolchains are EABIhf,
causing the following build issue:

Incorrect ABI setting: EABI selected, but toolchain is incompatible

This is for example what happens with:

BR2_arm=y
BR2_cortex_a32=y
BR2_ARM_EABI=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE=y

In order to address this, we adjust the script generating the Bootlin
toolchain package so that EABIhf is required for both ARMv7 and
ARMv8.

Please note that we already require BR2_arm for those toolchains, so
we are *only* talking about ARMv8 cores being used in 32-bit mode.

This will be needed to fix:

  https://autobuild.buildroot.org/results/3ce1dbd480c71b782ef722c39034cb039a036523/

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/scripts/gen-bootlin-toolchains | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index 4579949d18..ee64a86902 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -53,12 +53,12 @@ arches = {
         'prefix': 'arm',
     },
     'armv7-eabihf': {
-        'conditions': ['BR2_arm', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
+        'conditions': ['BR2_arm', 'BR2_ARM_EABIHF', '(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)'],
         'test_options': ['BR2_arm', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'arm',
     },
     'armebv7-eabihf': {
-        'conditions': ['BR2_armeb', '(BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A'],
+        'conditions': ['BR2_armeb', 'BR2_ARM_EABIHF', '(BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)'],
         'test_options': ['BR2_armeb', 'BR2_cortex_a8', 'BR2_ARM_EABIHF'],
         'prefix': 'armeb',
     },
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
