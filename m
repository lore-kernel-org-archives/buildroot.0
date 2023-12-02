Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84685C4167B
	for <buildroot@archiver.kernel.org>; Sat,  2 Dec 2023 08:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E94D400AB;
	Sat,  2 Dec 2023 08:39:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E94D400AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ferFNDqJq3w7; Sat,  2 Dec 2023 08:39:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 44F8B416C7;
	Sat,  2 Dec 2023 08:39:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44F8B416C7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8D6D1BF3BF
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 08:39:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8028884953
 for <buildroot@lists.busybox.net>; Sat,  2 Dec 2023 08:39:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8028884953
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WgD34T9InG-f for <buildroot@lists.busybox.net>;
 Sat,  2 Dec 2023 08:39:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6EFD84917
 for <buildroot@buildroot.org>; Sat,  2 Dec 2023 08:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6EFD84917
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DB3287535; Sat,  2 Dec 2023 08:39:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Dec 2023 09:37:23 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 03e66a35eabaed9f258b8670eba2e8fc13dd3eb5
X-Git-Newrev: 6358bb3a9bcf8d4c66893e8df513d18bf0022c35
X-Patchwork-Hint: ignore
Message-Id: <20231202083948.8DB3287535@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rsyslog: add
 libdbi-drivers optional dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1669128830402117806=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1669128830402117806==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6358bb3a9bcf8d4c66893e8df513d18bf0022c35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Needed in order to use omlibdbi module

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rsyslog/rsyslog.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index cf9f2c0e79..8ea92ea785 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -151,6 +151,13 @@ RSYSLOG_CONF_OPTS += \
 	--disable-omjournal
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDBI_DRIVERS),y)
+RSYSLOG_CONF_OPTS += --enable-libdbi
+RSYSLOG_DEPENDENCIES += libdbi-drivers
+else
+RSYSLOG_CONF_OPTS += --disable-libdbi
+endif
+
 define RSYSLOG_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -m 0644 -D package/rsyslog/rsyslog.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/rsyslog.service

--===============1669128830402117806==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1669128830402117806==--
