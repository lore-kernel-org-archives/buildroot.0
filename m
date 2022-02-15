Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9CCC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 13:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF85E60FA9;
	Tue, 15 Feb 2022 13:29:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iyJkYlvRJvuy; Tue, 15 Feb 2022 13:29:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7E1860FAE;
	Tue, 15 Feb 2022 13:29:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 34A671BF2F8
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 13:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28B0D4098B
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 13:28:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fbj7UKZ1Ux9y for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 13:28:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3DFC4098D
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 13:28:57 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso1468826wmj.2
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 05:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Ai9p1NbwXyZST9D9FJGN1zWzcEsXWDoYA1svVbDoeI=;
 b=N3RPUr3aHzzYsrB3p77E8PIb0UBYxWFKCdzb/izjNNs01A80oNkdba/ii3k3mzJefF
 w2s/2V1W4n6x+/t6XCBIJXPTjtZf2yYJnZB5FSRjjf+qxx/7Hr+fBNC4GUclD2drpVy2
 mgS6KB21zsVxiFNzdkNvh0M/KA26LwMQHqDjKZyAS9JnmY70UJOgIAuTaf2PsWGUvrgr
 eOEiOCOnvETQP3vpZNBfJN4Zh1jS6WSd/QIG/XwBSUTKY0l+2sZsOs2RV7zdsLuWM/SW
 EGHWCs6uYcTZ0UzNRL4LgnCF43O2ElQXBGISJiFilf4vkFplQ+PgG1T/rJiHAVscwAeA
 wy1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0Ai9p1NbwXyZST9D9FJGN1zWzcEsXWDoYA1svVbDoeI=;
 b=K14f8+ntRAfJVvlu72NIbTbXfPMx61jQoKrJXMDrJeYmd/11Q88HRvgXUbdid5C4f3
 tOolcukxJ8QKE+TePouQSxPqr5Kb/Ptm4TcCmhrUs5eQBtI7+htI63ekJ/fNMd4cH9nR
 MEHIGcv9XKHtysrsPoekrAUe5WHn27LRHYtQe3xk9gariCULuWZ7aHimDXc2w0y7U7iw
 0Bjm3dMip/Ta+2paZJm/vr7kqhkjpKpITsJO01B5EwrCt+nqqYkUmHQgKCbutyj2fI1C
 lBUMapQBX+0pOyuenb9eOjs7Td/0JV8Ur6RFIgAB4pWiLCCjj0Lkm8MS0nd6GovXHTfS
 tCzA==
X-Gm-Message-State: AOAM531CRGceLigyF/HiCms8vi/mTJbS7oZ9TTA8NFRcqlIEuAqoRFr7
 Ov8r2GV4jzBfDzAo1JfWVMCZnbGgbtw=
X-Google-Smtp-Source: ABdhPJzufkUzfrY7lJUBv5hPbX0xhM8q620zld8swiENtpnemApid/8M6gAuKsjiJSZmaQkuxGlaBg==
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr3116826wmk.1.1644931735543;
 Tue, 15 Feb 2022 05:28:55 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id w3sm17108397wrl.113.2022.02.15.05.28.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 05:28:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Feb 2022 14:29:09 +0100
Message-Id: <20220215132909.2360674-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/python-pycli: fix build with python >= 3.10
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of python3 to version
3.10.1 in commit 25b1fc2898d68ddf2674b14c738045875fc5a2dc due to the new
"Multiple Exception types without parentheses" exception
(https://docs.python.org/3/whatsnew/3.10.html)

error:   File "/usr/lib/python3.10/site-packages/cli/app.py", line 242
    except Exception, e:
           ^^^^^^^^^^^^
SyntaxError: multiple exception types must be parenthesized

Fixes:
 - http://autobuild.buildroot.org/results/8d7b0c23472abffc9447e4a6de273bdd04486d39

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Add upstream commits instead of dropping package (even if repository
   has been archived)

 ...aise-exceptions-in-wrapped-functions.patch | 26 ++++++++++++
 ...pt-statement-changed-slightly-in-2-6.patch | 41 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch
 create mode 100644 package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch

diff --git a/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch b/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch
new file mode 100644
index 0000000000..7ac9d7af9f
--- /dev/null
+++ b/package/python-pycli/0001-Fix-problem-with-re-raise-exceptions-in-wrapped-functions.patch
@@ -0,0 +1,26 @@
+From 57c563f8b47a56feefc0a8bcbef05f4b54280549 Mon Sep 17 00:00:00 2001
+From: mmbutter <mario.butter@gmail.com>
+Date: Tue, 9 Jun 2020 11:50:41 -0500
+Subject: [PATCH] Fix problem with re-raise exceptions in wrapped functions.
+
+[Retrieved from:
+https://github.com/whilp/cli/commit/57c563f8b47a56feefc0a8bcbef05f4b54280549]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/cli/app.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/lib/cli/app.py b/lib/cli/app.py
+index 7b6db52..f487ab4 100644
+--- a/lib/cli/app.py
++++ b/lib/cli/app.py
+@@ -240,6 +240,9 @@ def run(self):
+         try:
+             returned = self.main(*args)
+         except Exception, e:
++        	elif isinstance(e, self.reraise):
++        	    # raising the last exception preserves traceback
++        	    raise
+             returned = e
+ 
+         return self.post_run(returned)
diff --git a/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch b/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch
new file mode 100644
index 0000000000..75869d6d23
--- /dev/null
+++ b/package/python-pycli/0002-except-statement-changed-slightly-in-2-6.patch
@@ -0,0 +1,41 @@
+From 2af95cff5609142ec14efdf13b394f9b0121ab2e Mon Sep 17 00:00:00 2001
+From: mmbutter <mario.butter@gmail.com>
+Date: Thu, 11 Jun 2020 15:50:03 -0500
+Subject: [PATCH] except statement changed slightly in 2.6. This could cause
+ problems in newer versions. Updated to the new format.
+
+[Retrieved from:
+https://github.com/whilp/cli/commit/2af95cff5609142ec14efdf13b394f9b0121ab2e]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ lib/cli/app.py | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/lib/cli/app.py b/lib/cli/app.py
+index f487ab4..45256b8 100644
+--- a/lib/cli/app.py
++++ b/lib/cli/app.py
+@@ -239,10 +239,10 @@ def run(self):
+             args = ()
+         try:
+             returned = self.main(*args)
+-        except Exception, e:
+-        	elif isinstance(e, self.reraise):
+-        	    # raising the last exception preserves traceback
+-        	    raise
++        except self.reraise:
++            # raising the last exception preserves traceback
++            raise
++        except Exception as e:
+             returned = e
+ 
+         return self.post_run(returned)
+@@ -420,7 +420,7 @@ def pre_run(self):
+         """
+         try:
+             ns = self.argparser.parse_args()
+-        except SystemExit, e:
++        except SystemExit as e:
+             if self.exit_after_main:
+                 raise
+             else:
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
