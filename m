Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F7BC98324
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53E78410FE;
	Thu, 24 Sep 2026 18:59:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0oRWRoElcQOc; Thu, 24 Sep 2026 18:59:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 46DF0410F0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276348;
	b=AS+ubb24DnqxeJOufouTr8+Xn2fH5oOmt1LaZXMFjR07WbJViQt/GONLRc13wjx3RqIe
	 RIi7WLfV8xJ7JuioWXZZG49S+yuo4AkvREeTFlB0NOh5PWWuGiZlq7ow+vXts7GU0Yaiy
	 cediLWnrt34TPIf38HfcWs/CvLbI0rhzPn+6W6msofE4VqL5NXm5tIJoy+pIs2yo/Pl+B
	 2nsIylC3F7NFiQDAmnFKmkurGtl0AN4f6YZ9n5xLLrIWGeL3YYdklVTNGFesyqxaMrMoT
	 Th97wtEgRflxkenPNkMQ/4WW33ga+zesQotXECV1ptLHHZ/W70mM9V3k9rInZA8Giow==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276348;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=PDvgj4GIl0g1Cth3SaOr70JXLTyUlVYYMK4/7JjEQcg=;
	b=J9K8Fh1LNm6Qo7Mfvvv7PJGTSggivfNAsHG/GxwLxtq2hEmjh+v1ojzUMIB233oZaz8r
	 u1Ul56kVx7P+NNTvbO6n1Mj9fBxzcn1+pHugMgdg+DFaJO2QeLxhKQxHxeqI5+Pq0Cvfh
	 ajqSwMgKhb3tYhELOSPriFp9/bdkHCxep0dJ9cXxwL6lyoJWlfeAhisCWW8ZeBbcXMsX2
	 sENF/XROSyTk/2e8QY+rOMQ/+yJ84v7nrsTF0rmcZLkyXj6K4zHllj3zSE0i+WT4txQix
	 zEQGCDjZTxVj7vpXjFntRzn8KRisRu6uo8MtKtzSLoZQaWUYKJMJy3KE7YvmrK6c5ZQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276348;
	bh=PDvgj4GIl0g1Cth3SaOr70JXLTyUlVYYMK4/7JjEQcg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=QmerP4Q3fTMYFMr9J6YZh+sB/HR6OQ2/ulJZCZzVA6Du2FLVCYl0kXg4yyp/tqWKl
	 zH6uJjesN9fXyx5sRdWtFQmoTlJ4kVwlhthBJ+QJWpE83nGC5sLP3AmDStllEj9bd1
	 85YO+W3hpa2VUUXmBt7TWPJc5LyXbkuxyk31UyRNJ4yTjku+VGsRBxeq9NYMzrqp+N
	 7jdOBCBkpzwIlc1Dpzmw1HZECrW7Sn7Zgb7zMU6mYJoWbFpTw8q9Iir90h9xBgF9od
	 fJ27af7OBkGZvvle1SxMjdEgEQ+QCYaPOSqd80D08wIFu1Qte49htQ3QYBOPp9dYrV
	 xyL0Hy6Zfhp3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46DF0410F0;
	Thu, 24 Sep 2026 18:59:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 34305332
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A9BE60BBA
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwCIjDGpO1Vg for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 47D1360847
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276212;
 b=ncFMW9Hf0elzTYoFOIHD4oCH0faRcDZX7jt51k4r4yZfs1KRM6TVczqp01RDAsOy8J9u
 Aq+Hc3YsqT0YOFeM7qwW9lvU/csoJP92LUdUD99atQxzsirkoDzFRXqeU56smxQZOeRGR
 SYoqdcXQfqsz8LleiHrkhXvhFyRh3R6t32mzAhwaIP4BzQFB12BRptYdJYBhR6ojpDBza
 GNpzbpIiWqnv2bsp5dL29Uhm1aVhYFU6Az6XF+2In31kMIvup0aWQEYAknv/SgCwX3Oa8
 xjn+a0YOmvWzWA96k+lQ4aK/TFAwi3ayvQYtrvGmqH3QfjnC58+W7mCUk3lF8Rm9B/Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276212;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OEeYkR7TJsTmRFxqVz3v507o1ErLuV5dyxs/G9A1i08=;
 b=Oysi/VxjaIQetnMq2DU9uiAVfVOqxfBfKCBBRAtqdXl0HrS3bJdfnzf5ajOAKtoG+ohS
 ftqPGi7iqIPuG8nR6OBQzE3HqSkZNVmsknFzsG4IqcbmK1ZyBeXdq8XP/v7fMKnHd1UKc
 4lypBAlb9D9GMfU7HPGfog7QIneA2RjUTaK5fRJ/iWlcoCKZ5ZAL/LNMpDNcupUFhmjeQ
 px+Uh7WSWn00blI01L0IYEXF+I2DsMvg5E7QKRmk8yqRFNxazZDEV3tYFN726UHpN9rcu
 wjPmhsckPWMZRQkFvu64xHe/NZtmM+jDDGnontNV/7/6elB2bZRwKXHC4BRpA556Tnw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47D1360847
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D27358D5AB; Thu, 24 Sep 2026 18:55:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 18:15:29 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 768e3720fc74404b41519c3ee1a3eb7d463c9c1b
X-Git-Newrev: 0f4211f335804c0a471504c9e93e02be7cf455eb
X-Patchwork-Hint: ignore
Message-Id: <20260924185541.D27358D5AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/exim: disable
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
Content-Type: multipart/mixed; boundary="===============5802901175467223535=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5802901175467223535==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f4211f335804c0a471504c9e93e02be7cf455eb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============5802901175467223535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5802901175467223535==--
