Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21768CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC1C160F1F;
	Fri, 16 Oct 2026 13:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m84saLmSRWO6; Fri, 16 Oct 2026 13:10:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org C3D4260F47
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156193;
	b=gHI+iULS5sDqb/rdUH51QYBCYcRA6Hk7fNGe2gMrfQE6buVceq08VUC+We7QVr+lDd0f
	 svp4VcqyhEx9gY3l7E1Z5Y3I9anycDGtF1kOo3LNXJtiR09PlKJIem/okjfxKvMOzcAev
	 E58uFBSRomO9dgtKQ3Gk7JaCe6V1ZXFUR/SFRBGZOy5COzN1jXeWmqikdFIJvRNyGTkqq
	 r1GQ0jsJiCdLsliuSf/oEWbs7vIKaBfvXBbVQjNsHAjiGelEjWMvvgsNZokb/IWvuVUJm
	 kPl6/BYNtSLHXnbltWdsg8oi1ZS1RfavXONjrjfHb0sfv80uBRT/nAu86TnZkSA2lpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156193;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=0C1GxLmOm9vV9NIQUbCnQgo4V0GnRqyqNiRTSzLyxrU=;
	b=Aeg3Hp2N0WeZCW7Z31ThHOTcwECvHZB0JBBgZQNBySvwLOV07XJtNsAwHe9epHm/NSlX
	 MnzffOl8psN8CCvD1D6noSK3WKXu4pIWSLT6/5/YA7hY2GZo4YaqKdYGi7UyFF4IGyPIv
	 Q7TFMs8WzfgSZI6XTaBjkisi6RUXKWymiMti1gmncGSCg+R5PcBPtygc7Sv9QhS/Gjpoe
	 rT8e4LS3zg317lNDWHzgkq6PLtYs8ada5N0AZfOlk8k5ZtOlvz5H6JIBFAQVcR9yH+rQZ
	 tqAhGe9Pat2kpJhK/rC7ld8KMTtfkgcri6Tub+oeHGG6lOkrIuMmqXfK3u0+pcXkwCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156193;
	bh=0C1GxLmOm9vV9NIQUbCnQgo4V0GnRqyqNiRTSzLyxrU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cBXXPipDa1yyI0oHx6MeQNtrNQtWW1nE0jjSyxRJb+AlT01ipd5yRjEF4M2CekbHI
	 E6WblhklSiK1sOYv+n5GtCPm6wR/GFie2MSpHlri2FP0xEVCFOGQ7DfHYv5fzOAiBF
	 dXcZdPntASmaJaImJzT1OptHRXNL7lfLxkcG1wh3+/DRc/akHgXxyTHmCm3eoJq+lA
	 t/CZQUDdWnFxzMMSM2cdcC7E6HCMQG7e91oqMO00dnWuknz7EMHhKQBucEyiY4zwOg
	 qML6jhfubV2xdXy+242UXW8EZj58i5uv/dkzQIWdEM/3+AqdR9NZeflHclqjNcvX/p
	 qKLXpUbHM90pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3D4260F47;
	Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D1A3B255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCCFD814D6
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RJlND58YPJQ for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:08:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BC984814DD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156107;
 b=ixZYS7elESI8LMnlkrp9lRaEass+HMAn3m5gYcVVJzAglCFygXnodkYe3F3o9SeUUf6J
 uE8BvfpLAWhhBIqFz9Sa72JZkoGsCs3i43Nde1a6lK7AWT69d+duvSluNwrWLf0bh7FAv
 VUtLFKTIGmI5glELXUlN9SK+dI04uWFTxTIjlKDaN5ceMj/ebzq3atR171Xwwc5tXOVwg
 AMTl2AgVfdmIJk7UUQu3g8A47p3qQc3uo+Grs0a20e3pcbp7Yr7pnvLF5lOWCEUCcup6y
 sL0RrHQFdqIwmO3uLjPbz1nnSbIQ3txu+VJF65G6cLbBNK7dpib4MMrty1QhsaXOZlg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156107;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3PG18UCLT4dWr3AUwkG74y2RnYiReBIwLPg1xoLWtjQ=;
 b=L5h0YzN1rVOAsiNZSR+vXA78UlACPMGiCb3sonh+DnMRWy3IuHWjtc0KueYbkmqRW8cI
 eCyWqPMy6uZ6D959nFe6a5A4+dhO0ODx7SI+sssxPrzflDG8WN8A+cJMDYhB4x6tjQj2v
 S95gN9nn3/6t9+g0JuF0oFxPNIw0wcIct9/jnXvji24Xjmwhn/siCOu13wdQTNL4JADj/
 Lc4NijHVd2yn5r0z1smCPzvMewZ54JcwHll5ULXxYt20907MqnpxbWx2oAtWcl0it+ml9
 ppNI6c1jO+z3g0oG7uQmqTLHawhry/eGKsbO0odGHY/VMtXFqnyTYLaNjYqo6+qMSCg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC984814DD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADC88960D5; Fri, 16 Oct 2026 13:07:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 Oct 2026 15:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 03ef11f0b9c6d0e590406f1aca8d4d23e0738ecb
X-Git-Newrev: e834f75618e9ed0809a2683577d3fe588dd8dd76
X-Patchwork-Hint: ignore
Message-Id: <20261016130706.ADC88960D5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/kbd: reorder .mk
 variables
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
Content-Type: multipart/mixed; boundary="===============8608670806867450880=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8608670806867450880==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e834f75618e9ed0809a2683577d3fe588dd8dd76
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

We usually put the metadata variables at the beginning of the file and
the variables related to how to build it (like _CONF_OPTS) later.  Apply
this principle.

(alternative to commit 35dc65563dbe9ecc226c09473289f3e8cdb8855e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/kbd/kbd.mk | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
index 953adccd0b..c460779467 100644
--- a/package/kbd/kbd.mk
+++ b/package/kbd/kbd.mk
@@ -7,14 +7,16 @@
 KBD_VERSION = 2.6.4
 KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
 KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
-KBD_CONF_OPTS = \
-	--disable-vlock \
-	--disable-tests
+KBD_LICENSE = GPL-2.0+
+KBD_LICENSE_FILES = COPYING CREDITS
+
 KBD_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-pkgconf
-KBD_LICENSE = GPL-2.0+
-KBD_LICENSE_FILES = COPYING CREDITS
+
+KBD_CONF_OPTS = \
+	--disable-vlock \
+	--disable-tests
 
 KBD_INSTALL_TARGET_OPTS = MKINSTALLDIRS=$(@D)/config/mkinstalldirs DESTDIR=$(TARGET_DIR) install
 

--===============8608670806867450880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8608670806867450880==--
