Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD51C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 17:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 620B981458;
	Sun, 13 Mar 2022 17:14:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AWIBHCYi2abp; Sun, 13 Mar 2022 17:14:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99A0F813A6;
	Sun, 13 Mar 2022 17:14:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E66601BF41D
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 17:14:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D088760A82
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 17:14:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7r_MMTiE_WIw for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 17:14:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CADE606C0
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 17:13:59 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id r11so15650124ioh.10
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 10:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZFkowh15nnsoQpFSoO//Lh/2hUjJE8Y7ylpEer1qNZ8=;
 b=JAoF6sDfnNvKO+VDJIh9/VHeEYNyQzyZO67L3OWdBBuTqX9NEg1Pt5U1mxqpO2TelZ
 pQEhJp8T7ZFleNi8+9bKjSjd5vQKf7I4JWkqZbzlEKaNcsAyXvL1+8mmjBkOKL0dRzob
 s+JluSsYJkxW1hXSLtFAz74Tap5lT9Ia6Nf7bHFcRDTnCHea8YX5MpzmGYV7796c3joS
 OssqY8jHOA24msO4R56VQi1vqdbUjbreRn+AUz6GCOvkvlLaoaqPgApdU+dXOcgUnzDY
 32Jp+XJ+JtyohZwjrNYK7CQvOUy9aLGG59M1aWvUhz3jp9Ux5mkK+msH66vvJqCQ0zz6
 G8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZFkowh15nnsoQpFSoO//Lh/2hUjJE8Y7ylpEer1qNZ8=;
 b=btatALQ7otF7yWD8Hq4pAD0ltO9juofcKiOs07+WVBXWXbejDQSRy6C7+puxnVfBbI
 cXNC9Ulg6EATFJ7bzT/g4jjJGOVot0mJ/3Q611/+5lle0rCFjPHG4lSsQCHUBB/Og0rn
 yPJBtoGzkcVSV8fJq/cBcQjccdQy6DO68W8Ey0FGgT7djZY0+dTS3eyPzb+HDEDimzgD
 PzOeTNgIgCSRKCTcDRENXN0YQzYbNP0jc5op+sjBmvdg2u5ipckQWz464z5l3FoipMMM
 ey3kFIB3+/DOfp6FcQXykdlMdiLX43wJh4uMvFoir7zo6O6Mf+u809nGYM8Cx5H1toXz
 YX3w==
X-Gm-Message-State: AOAM533kqYjQG0Ik94/5aos7ix1zzHOpOZw5Jzv2tIWmx9WEiuY95o9h
 EOQXT66u27JlmXdFoBykkocIkHNW940=
X-Google-Smtp-Source: ABdhPJwxveCdsviiLqK456hjF2kteCpgO9gHrvKnH6QEdTqbLrhpC09XB1FNHoY4f+cgONkcTHgq5w==
X-Received: by 2002:a05:6638:130b:b0:317:cc10:1c88 with SMTP id
 r11-20020a056638130b00b00317cc101c88mr17373742jad.34.1647191638854; 
 Sun, 13 Mar 2022 10:13:58 -0700 (PDT)
Received: from james-x399.localdomain (97-118-243-247.hlrn.qwest.net.
 [97.118.243.247]) by smtp.gmail.com with ESMTPSA id
 k15-20020a92c24f000000b002c79ec214f9sm664929ilo.30.2022.03.13.10.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Mar 2022 10:13:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 11:13:54 -0600
Message-Id: <20220313171355.271345-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] utils/scanpypi: ensure tmp_extract is
 cleaned up on exception
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/scanpypi | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 17d8a0017a..724e59f759 100755
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
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
