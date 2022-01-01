Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB6BC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 21:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 649B9813FD;
	Sat,  1 Jan 2022 21:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XgPIMoHt7dir; Sat,  1 Jan 2022 21:40:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB6A4813FB;
	Sat,  1 Jan 2022 21:40:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 703401BF376
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D8A640186
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 21:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LRFCqGKyuZP4 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 21:40:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF2AC40184
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 21:40:37 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 3m79nJpFONi3c3m79n5QIb; Sat, 01 Jan 2022 22:40:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1641073236; bh=cdZOBYSMBJ5PpG4v25APQ4hezWLQ3k+GbMgF2futHcY=;
 h=From:To:Subject:Date:MIME-Version;
 b=SZI2RGFCFUznWJCST6Oao5ZG5WEl9woW9mpda9xOpYKC5omn0/VSC6GyjKg2oFMnN
 aPlgYhsqNUR8mE397C+aLYRHnOv2r+RjanKCWVUhsfi+VXdeQUXZ3etLXbF6UP6kxF
 1c0jYs2WcpcQ0iIsa428zN7wmpU3CjMMv4ENNP9R+YKYpKKZMM7nZWqATLACYDY05Y
 ys7g1n5Rfmogk1hjw4SUQMAyI12Uh+1YlNOjGbWT9imn2qVd0+OZNzsJTeBWKLrfHc
 6uoqB441eHOx9rJba7nOE+SA6aeohtQHp9XFFKYxDhq/QWX0YMOqyxkSMq/61SzXpy
 IMdc0lQxZi0HQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 22:40:34 +0100
Message-Id: <20220101214034.2152144-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBpJ6/oWi5YUZ5FYSAYsXYDcGZrlC7V7XFuyRBstI8YWYSiUcpqB46Z1SEVDzr2an/cWcQX9KG07M75RlR0pafj/4r9lykarp2RpapYXQ+pEq9/I6XJv
 NFbDkWTBunUYWKQTqIJ8zbhSkaQnu+fdKXAKz6bRos3O0+/Z+TETMbozh6/qp8TN/bqqx7Adek9iVqt61Bgr/uA5d7q4qpXKSXHs2A7BtGP6HfeDcq9HHFmo
 Jr5ymOkpR9IToZmU7Mji7uWxDMhQFfmbF6DM5vGHCQuGvJtpZJtiDQeLKQW8UbD5uwOP1AVtlMCAlTqEVZYa5Q==
Subject: [Buildroot] [PATCH] Makefile: disable 'printvars' and 'show-vars'
 recipes for Make 4.3
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make 4.3 is buggy and leads to a "Segmentation fault (core dumped)" when
calling 'make printvars' or 'make show-vars', so let's refuse to execute
those recipes if Make 4.3 by adding 'check-make-version' recipe as
depedendency of 'printvars' and 'show-vars' as suggested by Yann E. Morin.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 Makefile | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 0b8c7b2867..ac98b84425 100644
--- a/Makefile
+++ b/Makefile
@@ -1058,13 +1058,20 @@ ifeq ($(NEED_WRAPPER),y)
 	$(Q)$(TOPDIR)/support/scripts/mkmakefile $(TOPDIR) $(O)
 endif
 
+.PHONY: check-make-version
+check-make-version:
+ifneq ($(filter $(RUNNING_MAKE_VERSION),4.3),)
+	@echo "Make 4.3 doesn't support 'printvars' and 'show-vars' recipes"
+	@exit 1
+endif
+
 # printvars prints all the variables currently defined in our
 # Makefiles. Alternatively, if a non-empty VARS variable is passed,
 # only the variables matching the make pattern passed in VARS are
 # displayed.
 # show-vars does the same, but as a JSON dictionnary.
 .PHONY: printvars
-printvars:
+printvars: check-make-version
 	@:
 	$(foreach V, \
 		$(sort $(filter $(VARS),$(.VARIABLES))), \
@@ -1077,7 +1084,7 @@ printvars:
 
 .PHONY: show-vars
 show-vars: VARS?=%
-show-vars:
+show-vars: check-make-version
 	@:
 	$(info $(call clean-json, { \
 			$(foreach V, \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
