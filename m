Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D60D68BF9
	for <buildroot@archiver.kernel.org>; Sun, 17 Nov 2024 12:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FB0F80A7E;
	Sun, 17 Nov 2024 12:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EwbGAeOJ7BM2; Sun, 17 Nov 2024 12:45:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC05F840EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC05F840EA;
	Sun, 17 Nov 2024 12:45:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 76BB0B14
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 12:45:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5635B4054E
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 12:45:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8ZUF1ZDmgVl for <buildroot@buildroot.org>;
 Sun, 17 Nov 2024 12:45:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 329D540519
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 329D540519
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 329D540519
 for <buildroot@buildroot.org>; Sun, 17 Nov 2024 12:45:36 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1F834B00539;
 Sun, 17 Nov 2024 13:45:32 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Julien Olivain <ju.o@free.fr>
Date: Sun, 17 Nov 2024 13:45:04 +0100
Message-ID: <20241117124504.539423-1-ju.o@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731847534;
 bh=7CgkZjpMXxCAL62Fvktb2cUATK1wRDePIUc4c7SSSe0=;
 h=From:To:Cc:Subject:Date:From;
 b=CCr0Yn7cAVAHqC+DylojC3YlTm67VFWXEEmVU1XSj+ZUveLpmoE8Sz+63yg9jTq1Y
 4ihKXM20+jTVByVZcdpBaj3j06Qf10f2wxmVw5OzUZE2LsLJnZ6FDL/wYfgUccBhiZ
 tLfJ41kne8v5ceBdgqnf34i7oLW1OkwFM4+MGlqBEQLkzpGHaBEIz8ZDBpi9d4f8uB
 4qeM5gNMJcFliLntnBLjKnpa4c1Y0zCTltlbL0VmcIM8SdPw8GUY7xIHTeeKYQlzTU
 0ICZufOwqYGCgiXM+AmIDtU9nC7neqw/8eyEfH+Ssc9taOW4Bw8CDzHvQNsVrb5xLg
 JUomzb74eVDzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=CCr0Yn7c
Subject: [Buildroot] [PATCH next 1/1] package/freeipmi: update _SITE to use
 BR2_GNU_MIRROR
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The freeipmi package is distributed on the GNU project servers.
See [1] and [2]. Buildroot has the BR2_GNU_MIRROR configuration
which can be used for that purpose. See [3].

For consistency with all other GNU packages, this commit updates
the _SITE to use BR2_GNU_MIRROR.

[1] https://www.gnu.org/software/freeipmi/download.html
[2] https://www.gnu.org/prep/ftp.html
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2024.08.2/Config.in#L286

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freeipmi/freeipmi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeipmi/freeipmi.mk b/package/freeipmi/freeipmi.mk
index e28f63f715..fbbfd536e4 100644
--- a/package/freeipmi/freeipmi.mk
+++ b/package/freeipmi/freeipmi.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FREEIPMI_VERSION = 1.6.14
-FREEIPMI_SITE = https://ftp.gnu.org/gnu/freeipmi
+FREEIPMI_SITE = $(BR2_GNU_MIRROR)/freeipmi
 FREEIPMI_LICENSE = GPL-3.0+, BSD-like (sunbmc)
 FREEIPMI_LICENSE_FILES = \
 	COPYING COPYING.bmc-watchdog COPYING.ipmiconsole COPYING.ipmi-dcmi \
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
