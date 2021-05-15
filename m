Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E56FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:15:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 580AB60F38
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 580AB60F38
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33AD7404BC;
	Tue,  3 Aug 2021 21:15:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6sAR6bxkM-l; Tue,  3 Aug 2021 21:15:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 700094044D;
	Tue,  3 Aug 2021 21:15:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 01D3F1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4595040249
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QD8GyO2e8WIY for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DC4340275
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D801887BB7; Tue,  3 Aug 2021 21:09:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 May 2021 17:18:50 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 8a86b50092be19dcc55c4f20c35138d6e378c56b
X-Git-Newrev: 12916827e0d4a31b29031102edf21fe5ab6a2f2a
X-Patchwork-Hint: ignore
Message-Id: <20210803210937.D801887BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openssh: security bump
 to version 8.6p1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=12916827e0d4a31b29031102edf21fe5ab6a2f2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Security
========

 * sshd(8): OpenSSH 8.5 introduced the LogVerbose keyword. When this
   option was enabled with a set of patterns that activated logging
   in code that runs in the low-privilege sandboxed sshd process, the
   log messages were constructed in such a way that printf(3) format
   strings could effectively be specified the low-privilege code.

   An attacker who had sucessfully exploited the low-privilege
   process could use this to escape OpenSSH's sandboxing and attack
   the high-privilege process. Exploitation of this weakness is
   highly unlikely in practice as the LogVerbose option is not
   enabled by default and is typically only used for debugging. No
   vulnerabilities in the low-privilege process are currently known
   to exist.

https://www.openssh.com/txt/release-8.6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index c50a49896c..0dcd725de5 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-8.5 (base64 encoded)
-sha256  f52f3f41d429aa9918e38cf200af225ccdd8e66f052da572870c89737646ec25  openssh-8.5p1.tar.gz
+# From https://www.openssh.com/txt/release-8.6 (base64 encoded)
+sha256  c3e6e4da1621762c850d03b47eed1e48dff4cc9608ddeb547202a234df8ed7ae  openssh-8.6p1.tar.gz
 # Locally calculated
 sha256  432abf7480fb31473a6706627212913fc70032e3fb71b90fecb28ae26a2d741d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 055c024cab..61b2c97cf4 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION_MAJOR = 8.5
+OPENSSH_VERSION_MAJOR = 8.6
 OPENSSH_VERSION_MINOR = p1
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
