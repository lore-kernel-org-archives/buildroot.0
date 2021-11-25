Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051DCC433F5
	for <buildroot@archiver.kernel.org>; Thu, 25 Nov 2021 21:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 638DA401D7;
	Thu, 25 Nov 2021 21:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CHsf685EsMq7; Thu, 25 Nov 2021 21:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3BEDD401D2;
	Thu, 25 Nov 2021 21:37:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7AF8D1BF3FC
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 21:37:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AE2582726
 for <buildroot@lists.busybox.net>; Thu, 25 Nov 2021 21:37:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZjZNJepgqdna for <buildroot@lists.busybox.net>;
 Thu, 25 Nov 2021 21:37:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A65D980CB1
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 21:37:11 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id k1so7053541ilo.7
 for <buildroot@buildroot.org>; Thu, 25 Nov 2021 13:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m8B/PT2HcCy85XifilQSWOeBIISrb4+1IXwSl7jtQ8E=;
 b=Yga+WmdTNDWEf+QGtOpVtb0F4Uh6AhCFIUx9CkzxhwKEu1cFfP8Ui3X3K+EewmB8cg
 tYJm7IleLmIYomG7VGvLxN8Dy/EHyoHzVE7Xtbdf1azmxUIavDiioko2zovwzRdhl1/r
 2PnQpH+cZ9XZPDrz8SKoQqKeLk0r0Zv/dBbwIIGJ4qYeGVQ/UrZt3IovFK2iIO8O7gcf
 6oYl9xjFRNgZTpPhFRXIKtjr4fSK7qzJt/LhcWmnDvij/u69nbmkLEytn097WIvyx/3U
 lM0eq/YupLUUFByJgFIN2tDzfQBLTxTwRpG8xxFbvbnZ1iWkQ9dDxIndohHwUrD2KtXM
 MrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m8B/PT2HcCy85XifilQSWOeBIISrb4+1IXwSl7jtQ8E=;
 b=5st5Ayhq9gtL+JfcARqqBEZH9TTPF7mv3YDZVsA9eR4SVSPRMt+CzaM15W4FdG/ORc
 RavAK+2SFTJPx2gGBn8f5U05o1LWbRL2yr8B/sqcVpDtwC01/B7LHgQHxGrPrTim5epT
 XGGKGTo9QEWNOY4e2qq5E/gOMsZ6PStHWr9sOUklh1haN2vfvWdZgH9GW/ZvH2F3/Ian
 Qsb/J9hht4iQEbr7mF/QU5jDRJBP/PvfzbJyhBD4UxHyzU/OVZ0YaEKkhwON6BchNymb
 iEKu+mlbdTj+7gO4gANd0DIQWVYF9Vu7X27Xd/v9WO+woNjmbJfDkOos5y6rZWQBIfE8
 c7Vw==
X-Gm-Message-State: AOAM5301m5ILdHRwOGNXLgz48FWUVIApZdOZ78VRDWnRXbGoZl6KN5Jk
 mUcY1nZUC3I0ICruhSMp6hRvjXVKu7g=
X-Google-Smtp-Source: ABdhPJzGuROAfIKYlAOepQMEtGRnjDN0ph4kUsimWOhS80lGGscjqRWZERyHVgkMvblZq8Qs9c0TTQ==
X-Received: by 2002:a92:2a06:: with SMTP id r6mr26269488ile.34.1637876230512; 
 Thu, 25 Nov 2021 13:37:10 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id w1sm1741579ilq.1.2021.11.25.13.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 13:37:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 25 Nov 2021 14:37:07 -0700
Message-Id: <20211125213707.2050547-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] utils/scanpypi: fix buildutils check in
 python3
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

The message attribute does not exist in python3, see PEP-0352:
https://www.python.org/dev/peps/pep-0352/

Fixes:
Traceback (most recent call last):
  File "utils/scanpypi", line 743, in <module>
    main()
  File "utils/scanpypi", line 693, in main
    if 'buildutils' in err.message:
AttributeError: 'ImportError' object has no attribute 'message'

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 utils/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/scanpypi b/utils/scanpypi
index 1f3326cf4d..17d8a0017a 100755
--- a/utils/scanpypi
+++ b/utils/scanpypi
@@ -690,7 +690,7 @@ def main():
             try:
                 package.load_setup()
             except ImportError as err:
-                if 'buildutils' in err.message:
+                if 'buildutils' in str(err):
                     print('This package needs buildutils')
                 else:
                     raise
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
