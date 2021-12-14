Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC09C433EF
	for <buildroot@archiver.kernel.org>; Tue, 14 Dec 2021 12:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 420CB4026F;
	Tue, 14 Dec 2021 12:55:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgQJOA_LsUV1; Tue, 14 Dec 2021 12:55:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA9B240266;
	Tue, 14 Dec 2021 12:55:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D3AE1BF30C
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 12:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AABE40182
 for <buildroot@lists.busybox.net>; Tue, 14 Dec 2021 12:55:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fiZlaN1bkg9K for <buildroot@lists.busybox.net>;
 Tue, 14 Dec 2021 12:55:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7973440146
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 12:55:20 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j3so32270087wrp.1
 for <buildroot@buildroot.org>; Tue, 14 Dec 2021 04:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CSAoQxkiUJpjwRgcGWtWvC5/8QM0EvzimOF5kLTo0a8=;
 b=U1EFJvC+9nqDHSiOT36xlSl8V9PvcydfZOwyoSiVfqxSuuhohk9dCAKpQT5Vm1vRCd
 fhaLd467uL//7v6DxXcf4dJ1r/PWeqcaH3cXMq5gFZGAkZh4ce+mwGB8miyukl25G9I/
 ab/T6wbSwjykyHvsVzOlfARMAZdSlyJOYLFeeWkTeO49+bAxr2M1stw4JD3nd0AMrVMS
 VBQVmMXuQA65CLFyIqZ8fPBxlP+P8DoGQ4f+KGi5KVM9vbCKBuszOGSVemzGuD22PSaB
 rq9ac4DzjFy73ROzNojLPyc1mnV3FbbFFKmiRrRS/l1Dvld8NWX/qcHoJ/jxmNI7nBJO
 fjCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CSAoQxkiUJpjwRgcGWtWvC5/8QM0EvzimOF5kLTo0a8=;
 b=0lSD5Ix1GrjQZcuK2ViNZVfShaRWOkVpMrkZr8f+CwL8IsCprJhtWf48yTu8pbmksj
 YNQHfQxNjfuYcfpugBIxOVdNlTPXEISSeQRUKEtgzB4OplbM7YwOQfmpQbp8DgysBvSP
 70MRywKL0k06IoTpttMi+/UVd81tu5IoNoWqZ1EuWcLeH/1XpsQm4oULRuEjlTJfZbfx
 gF7E+AnDT1SijhF9xNzJbbOArq8h+VWVXi3SVXzLkWF6vqpB4JC6yrCjfPrFAySO6i4q
 I9vjLgAIjBZ2GeQmrQWRPDGZwxHg84XcdM7JPwn6rxxfDkZ6FLTlJg3+OstnAaPyIslg
 KPig==
X-Gm-Message-State: AOAM5327FWRIiuTFW+kH4al6kjziYkwRUEdw8q5fvTEPkzCWDoKZnvx2
 Ik3gj3Y9FsW1YUXGG2nBAQEM2v+HEwy8u2MK
X-Google-Smtp-Source: ABdhPJyylVRyeG14BZGq+EVq3ubpOlcqGYjbAJcGzuQPfW02GTxinG3M2myjY4KNqj63qXM71Vc85A==
X-Received: by 2002:adf:c70a:: with SMTP id k10mr5507494wrg.652.1639486518381; 
 Tue, 14 Dec 2021 04:55:18 -0800 (PST)
Received: from localhost.localdomain (p5b2cd55a.dip0.t-ipconnect.de.
 [91.44.213.90])
 by smtp.gmail.com with ESMTPSA id w8sm11319036wre.106.2021.12.14.04.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 04:55:18 -0800 (PST)
From: Andrey Nechypurenko <andreynech@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Dec 2021 13:55:10 +0100
Message-Id: <20211214125510.13654-1-andreynech@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] support/scripts/: remove -E flag from patch
 call
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
Cc: Andrey Nechypurenko <andreynech@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

-E flag instructs patch to remove empty files. However, in some cases
empty files are essential. If they are missing, build could be broken
or other bad things can happen.

Signed-off-by: Andrey Nechypurenko <andreynech@gmail.com>
---
 support/scripts/apply-patches.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index e5a2fdd09e..6da83f6826 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -114,7 +114,7 @@ function apply_patch {
         exit 1
     fi
     echo "${path}/${patch}" >> ${builddir}/.applied_patches_list
-    ${uncomp} "${path}/$patch" | patch -g0 -p1 -E --no-backup-if-mismatch -d "${builddir}" -t -N $silent
+    ${uncomp} "${path}/$patch" | patch -g0 -p1 --no-backup-if-mismatch -d "${builddir}" -t -N $silent
     if [ $? != 0 ] ; then
         echo "Patch failed!  Please fix ${patch}!"
         exit 1
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
