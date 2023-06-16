Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55364EB64D7
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 06:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7C4983A56;
	Fri, 16 Jun 2023 06:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7C4983A56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CuDSxlyFwBIX; Fri, 16 Jun 2023 06:04:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEFEC83A51;
	Fri, 16 Jun 2023 06:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EEFEC83A51
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B39ED1BF616
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 06:04:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BB8B41D65
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 06:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BB8B41D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lVdqXvwrwnoB for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 06:04:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44B7C41D62
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44B7C41D62
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 06:04:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D27E60003;
 Fri, 16 Jun 2023 06:04:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qA2ZW-00F8As-Dp; Fri, 16 Jun 2023 08:04:34 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jun 2023 08:04:19 +0200
Message-Id: <20230616060421.3606283-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-docker: needs
 python-packaging after bump to 6.0.1
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
Cc: james.hilliard1@gmail.com, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit d680db0ba77dab (package/python-docker: bump to version 6.0.1) forgot
to add the new dependency on python-packaging, leading to runtime errors:

  import docker
    File "/usr/lib/python3.11/site-packages/docker/__init__.py", line 2, in <module>
    File "/usr/lib/python3.11/site-packages/docker/api/__init__.py", line 2, in <module>
    File "/usr/lib/python3.11/site-packages/docker/api/client.py", line 10, in <module>
    File "/usr/lib/python3.11/site-packages/docker/auth.py", line 7, in <module>
    File "/usr/lib/python3.11/site-packages/docker/utils/__init__.py", line 3, in <module>
    File "/usr/lib/python3.11/site-packages/docker/utils/decorators.py", line 4, in <module>
    File "/usr/lib/python3.11/site-packages/docker/utils/utils.py", line 9, in <module>
  ModuleNotFoundError: No module named 'packaging'

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-docker/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-docker/Config.in b/package/python-docker/Config.in
index b2296f42eb..ae5a7a5181 100644
--- a/package/python-docker/Config.in
+++ b/package/python-docker/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_DOCKER
 	bool "python-docker"
 	# docker-engine may be running on another host, so no other dependency
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
