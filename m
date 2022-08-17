Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244A6C25B08
	for <buildroot@archiver.kernel.org>; Wed, 17 Aug 2022 06:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F6658143A;
	Wed, 17 Aug 2022 06:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F6658143A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWXAMQMvpdjc; Wed, 17 Aug 2022 06:12:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24E9281C04;
	Wed, 17 Aug 2022 06:12:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24E9281C04
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE43D1BF9C6
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6B97404E2
 for <buildroot@lists.busybox.net>; Wed, 17 Aug 2022 06:12:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6B97404E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8C3O2ZBpiJv for <buildroot@lists.busybox.net>;
 Wed, 17 Aug 2022 06:12:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FB074013F
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0FB074013F
 for <buildroot@buildroot.org>; Wed, 17 Aug 2022 06:12:01 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so14142320fac.2
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 23:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=PVKj+wC6ZNeKbwsPh9Hi2g1NDxS2KRTmcwDZqiLoceo=;
 b=J082q8h3bxU/5p2iu1a1BQlEHcYQRJn6ge1NGQLt5/AODdXNd/g9nZ5Cb62sTniv5V
 iQucmS0rrdWuvo9OsOhhMtJP+9MTT3BbJiEHcTSXB8q1oCbPKCQ25tqFghfMS62K/dcw
 g701qi2gPox+oEYpdTxaGCYuMQ9KnGxlWdi/PBnLdBlXNd7C7KZJgvOjUritZqlp2/2q
 0YdTBhw4E7OIILO8WeDifAtg7K9O8L3wYrl08uCuuFKflNCZSNBwYP8sFdDxdrHqylWz
 wCFVOrBD6TTn/KT1hSVGUUtbx8orckebyRY6PKnHDPjbQvhEiKqZgXE1iWOJB8GINEVE
 mf4g==
X-Gm-Message-State: ACgBeo0e1YQDWvp+zrORO2aFDG9sWFNCuMUVpk6eKrZVID+ULyyzaPhS
 oskDtn+vYec4YrIaZ8v4x+x9WAhNffA=
X-Google-Smtp-Source: AA6agR4vwNC1KOlNQ1ZBo0KYE08CZS3ukKfciVpO+biVj09jKlD3XAJ5Aq6rqi4X14glgu+odgNikw==
X-Received: by 2002:a05:6870:40c7:b0:10e:609f:dbdd with SMTP id
 l7-20020a05687040c700b0010e609fdbddmr1039568oal.226.1660716720291; 
 Tue, 16 Aug 2022 23:12:00 -0700 (PDT)
Received: from james-x399.localdomain (71-33-138-207.hlrn.qwest.net.
 [71.33.138.207]) by smtp.gmail.com with ESMTPSA id
 q67-20020acad946000000b00344cc0c4606sm1194849oig.58.2022.08.16.23.11.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 23:11:59 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 17 Aug 2022 00:11:57 -0600
Message-Id: <20220817061157.4120650-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=PVKj+wC6ZNeKbwsPh9Hi2g1NDxS2KRTmcwDZqiLoceo=;
 b=osODCICZ/Ielo18JUwx02cg9cx49KdGLsdgZcxpPsZB+8kKxVvUj3+JhK467zpWed5
 bevwyQbEqsZgAyPlzPROl7BOr0nPdj0vb94hRrsHLGb3JlZ0dLZkFdun1dc+vwQHkSQt
 5koZsaZ+58SlXzuxyYIkRPcfX77FZd1SB4qft+Dc4kp7GZ/qH0+QNY/sZEGxaH6tOjVz
 HCJjogTzVM7/qK23rx0choRSpm3y1DLAOObZzswjvnMnN7L1+pssi5XqXVZYVusA+32T
 tgEvMtTGzkmKPGLQMZkW88cq4RmwcFptszOPHbn95aK8LPmPSiB8SSkP/x0R6T2rsKaB
 Zojw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=osODCICZ
Subject: [Buildroot] [PATCH v3 1/1] utils/scanpypi: restore modules search
 path in case of error
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We extend the modules search path to be able to load the package
metadata. In case that fails, we need to restore it to its previous
state to avoid leaking the path further.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - add more detailed commit log
---
 utils/scanpypi | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index cc13701c0e..452b4a3fc3 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -296,23 +296,25 @@ class BuildrootPackage():
         current_dir = os.getcwd()
         os.chdir(self.tmp_extract)
         sys.path.insert(0, self.tmp_extract)
-        s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
-        imp.load_module('__main__', s_file, s_path, s_desc)
-        if self.metadata_name in self.setup_args:
-            pass
-        elif self.metadata_name.replace('_', '-') in self.setup_args:
-            self.metadata_name = self.metadata_name.replace('_', '-')
-        elif self.metadata_name.replace('-', '_') in self.setup_args:
-            self.metadata_name = self.metadata_name.replace('-', '_')
         try:
-            self.setup_metadata = self.setup_args[self.metadata_name]
-        except KeyError:
-            # This means setup was not called
-            print('ERROR: Could not determine package metadata for {pkg}.\n'
-                  .format(pkg=self.real_name))
-            raise
-        os.chdir(current_dir)
-        sys.path.remove(self.tmp_extract)
+            s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
+            imp.load_module('__main__', s_file, s_path, s_desc)
+            if self.metadata_name in self.setup_args:
+                pass
+            elif self.metadata_name.replace('_', '-') in self.setup_args:
+                self.metadata_name = self.metadata_name.replace('_', '-')
+            elif self.metadata_name.replace('-', '_') in self.setup_args:
+                self.metadata_name = self.metadata_name.replace('-', '_')
+            try:
+                self.setup_metadata = self.setup_args[self.metadata_name]
+            except KeyError:
+                # This means setup was not called
+                print('ERROR: Could not determine package metadata for {pkg}.\n'
+                      .format(pkg=self.real_name))
+                raise
+        finally:
+            os.chdir(current_dir)
+            sys.path.remove(self.tmp_extract)
 
     def get_requirements(self, pkg_folder):
         """
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
