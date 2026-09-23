Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DFEC9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22C2040BAB;
	Thu, 24 Sep 2026 18:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrh2ThL2mM1t; Thu, 24 Sep 2026 18:57:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1DD2C40B4F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276233;
	b=Jh7MtcAcWXAJuzwr5QywZQMvM25/GZ/z8SYCmK9J2BkGkVo+uCrJ8VMcagWelm3uif04
	 +E7sGiuqewbu3FTCaWi1x9eaeeyZoPhRoGFWsPbqKi7ykdWRyE5TKucBsRDu1Gum7IQ8Y
	 O+nL2F77kkaR6Ap9qN55w/T0wvrxQKu0vSW3iuu2AdHitMFLM7DLlvIJIWEMA+fYylkmz
	 w5aZsREz1ZXT1Sqj/6+7lL/rZRTTbUTVEZuEqr8FW+1gaqSCk3WV8RyhX7YZMisOEggaw
	 NQYcUymJYBTr4sxufjdZL8oMYTJVXEWTH8LE3Nif4NbDbubzq9Oh5nnjNb73xk9fCrw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276233;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=h2t8lkxz7XG9KlUi0F91gorwz9hJG9wn6updiBrBlVs=;
	b=nT/u8070lrpGOdafAnm/5llPM4i0B9c/HhJGKBAlt9oC/OKNYZGezf7WFkFBm4zy0XDu
	 hCYrs6Aw56Z+7EqUz9/1RxKe2pUwv6awcmgS1DCfBWY458mXXTpkr4k2FIo6HWNA/i8SQ
	 9IaFvGDaPUzJaHmOwjdMYgzYDt6M0vlMQL0QFyrPHvsK8TF7E2E6PoD3R8TgqFTYGFt2n
	 8MGnC+bs9/oRKj35nKzCvNdHzNYYRS3h9Kk4lyhyeBnlMXVkwuyjnvCmAyy/kW0JM7jUB
	 7wEIMH4Dv48d5MO4MmcYLsyMIGAlrwOLBz+KR3cMGwXrCSO6Tu1pn9iwJYC/lvMayLQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276233;
	bh=h2t8lkxz7XG9KlUi0F91gorwz9hJG9wn6updiBrBlVs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cf8mpiQ0/JH5T/6kFZR2WuRDSinx2DOoCcEvymQh6avUq1iRwzlom/8/jSTqgEX1U
	 nJ56+MNwRT03Aoy6LPTkMBHTrIdTii0+695RfO2p/7PvjyiqvHM7Y5ghFG+6ij1IVt
	 P6kzvKEHdXyCfz2BSfuhxU5l2JZ+SVai3LJk819xX7aIrlXC2V4tea1DAejbya7XED
	 YTbXzlSqW8IhdyjzD/AhQWJmHBsbWtoQ5ImUSQUps4kl/sf6Pi4v5nHOaNpVyzX284
	 3sn8DsGzvdFVBK6/a8HuSulf9kNFSlqb0Pdi6E4E+t3530U1QyMwrubym3Fe73oN8y
	 TgyaDzu+XEVew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DD2C40B4F;
	Thu, 24 Sep 2026 18:57:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D98E5332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D7201404B1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gh4Z8zggaPiV for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 903FB4017A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276203;
 b=iBpmNqSPFy6Lh2ksTR3bX22fF4nYj+25dU0EckZ0tFMXX8tH2j1fDtL8D+0XPgJHDGqK
 dwywRIFraPGnHRHcnnnpxITqre2cXPRVsb5iE661Xnn5X0xRAOj5HuOvhXSx0o21MdTZ+
 DTqJj+CqdvU63opYj7MzN8aQmyx6vtyVFOkmpchBw3JDdENrzl7rpdBD+IfoJjHJkTLXR
 JCP8RB9OGZNw0FbJnKCW+JNNVnhGK5a3zgsKCYyB+tlc4QryhKV3yrjN4IztGD0BYz3SQ
 Fkf18R2XxdIrvqFREK7cjqwfutxwFYccCn0/mdmEWxv2ejKXRlyAuy/BuoCrcm0RNqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276203;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=VO5COuI2T8drILvFDbH2602pNq70mW9gmqpxKHhfR+Y=;
 b=mPlxg0UgLMRCkDSzshoXKpfSqPEDdNWIHWuDQKg37sxjbVCfn028WWoqZpWdVUiHgybz
 uNEcDpI+/8svkBPyjjBB5VYnbt98uxyiri1ghq0phmSk7K+JQw7wJUZM9B3MWddX8Hjc5
 7dixvLWQxawrcKBpYLL0c9AG0k89qLx50Ca8/GXiGK+/Q0qnNBwIcHjUua8TbEmLecmo5
 lYqc+rnJ4Rw1z18fCZN0oRVNOkl4DL8p9gaU6IGQTcwWRcPmz01l14qdovNlLZxaWbFCr
 OY7PEU+qt7KM2ESRBK2NexTBeJf/vMKlHdTmxUmypvL9jH02bz62fckiNjCstgckC4Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 903FB4017A
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2807F98383; Thu, 24 Sep 2026 18:55:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:15:26 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5d1a9b07c0f293fb78f626df5ca5022db7c7df04
X-Git-Newrev: 707a7026fcb906fed9b5b959e282c294afe2eb0e
X-Patchwork-Hint: ignore
Message-Id: <20260924185533.2807F98383@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/exim: disable
 valgrind when building with thumb1
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2927497250474441592=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2927497250474441592==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/707a7026fcb906fed9b5b959e282c294afe2eb0e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

src/valgrind.h contains inline asm not compatible with thumb1 so we
disable valgrind support for thumb1.

Fixes:
https://autobuild.buildroot.org/results/720bfa00ca926a398e901366e7ab20d08cfa9a81/

Inspired by buildroot commit 26013972ce568e55a121c21a55afce45bc0675e9.

The oldest build error of this kind dates back to 2022
https://autobuild.buildroot.net/results/85d/85d8e725a31bc1a3c41b2e388a17ff439274d437/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6c4abe552f34bbbaac9139a0f5ca57de10d1cbcc)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/exim/exim.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 5e9746af4d..482c7ca2c1 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -104,6 +104,7 @@ define EXIM_CONFIGURE_TOOLCHAIN
 	$(call exim-config-add,HOSTCFLAGS,$(HOSTCFLAGS))
 	$(call exim-config-add,EXTRALIBS,$(EXIM_EXTRALIBS))
 	$(EXIM_FIX_IP_OPTIONS_FOR_MUSL)
+	$(EXIM_DISABLE_VALGRIND)
 endef
 
 ifneq ($(call qstrip,$(BR2_PACKAGE_EXIM_CUSTOM_CONFIG_FILE)),)
@@ -154,6 +155,13 @@ else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),)
 EXIM_CFLAGS = -DNO_EXECINFO
 endif
 
+# src/valgrind.h contains inline asm not compatible with thumb1
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
+define EXIM_DISABLE_VALGRIND
+	$(call exim-config-change,NVALGRIND,1)
+endef
+endif
+
 # We need the host version of macro_predef during the build, before
 # building it we need to prepare the makefile.
 define EXIM_BUILD_CMDS

--===============2927497250474441592==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2927497250474441592==--
