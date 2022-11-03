Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D91C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 18:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 784AE41835;
	Thu,  3 Nov 2022 18:27:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 784AE41835
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pmHq3FiXBppX; Thu,  3 Nov 2022 18:27:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55C7C41831;
	Thu,  3 Nov 2022 18:27:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55C7C41831
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F1F581BF3DE
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC73081EEA
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 18:27:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC73081EEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IyFROyfdunvq for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 18:27:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2BF881ECA
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2BF881ECA
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 18:27:10 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id m15so1510225ilq.2
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 11:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MoZdhjMvN6rGFpifILAIW4oS2JDTVUaIWBRZAuxttFg=;
 b=AYbVbIy8LNRPR8TRp00uV+UqM/FQ9COfkCn0PywNgTLzh4E1fPygZ1Z4TxkgTB1EbW
 Bbxg3NptK6LgqcZWDhrD+v5rSohOZhBi2bQh3jih118DAiMtZ6YT/MJJR9qYwR03ly5J
 N1aZlZ5RPbs76KS6GkBLHrrUr0xVb4zRv2hmCbDrM9KwrCn5zTYyWpUbIdH2kMWc2XDx
 LJxb7Y9odC/C0PIiPgJT4hoam7FFntt5R35MXOSYDxfviN/eH+dC+q45HQgYsIIqOEyz
 D+QYOG+ktFLLTwl67Z6QWaR+rr6bmsVMZgpZgw+dIoFMbjqijBZB1kIzjnV38ntKL2RN
 AiSQ==
X-Gm-Message-State: ACrzQf1bQfZvq/pWS9izjld/7Q/tnNg1VxGA/wIZliQVj50Lt8SPofwt
 tsGZj08J45E6Ota7+DUWKk5L9QGCwY6w7r4F
X-Google-Smtp-Source: AMsMyM4Pyzje0y0qHosX0xol/K0+trQVFLIqOoA4YSvkSJ52Y/y1VjishuEJraUHsO5XcnF+1ohTtg==
X-Received: by 2002:a92:d243:0:b0:2ff:c2cd:ed61 with SMTP id
 v3-20020a92d243000000b002ffc2cded61mr18318245ilg.287.1667500029433; 
 Thu, 03 Nov 2022 11:27:09 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 f4-20020a02a104000000b00374ff5df5ccsm422260jag.167.2022.11.03.11.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 11:27:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 12:27:07 -0600
Message-Id: <20221103182707.986394-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MoZdhjMvN6rGFpifILAIW4oS2JDTVUaIWBRZAuxttFg=;
 b=k8c8bxkq4hx24Ab3IDISjB4nYfUo07b2u7/VuvUCP//JqGdkM7lZ9VQNDAaV/b+cJj
 lWwOraYLAqZaRpTbOkuHunCChBy+T/DG4Re98fmk2RDj4BcbKffufytkK2szUr0b25Cn
 qyWlL/berwZ/0KzIVZ/EdU8Q0clqOtd4cGe7pcembXtHYkbOEZ3NPnKKlOfwnWTl5bfs
 PV72WA56+c+MmT/YIWJZqjnnZeGrIXml+/gshIuN0tfI6pDUt85mg7MT5JBZq3bXJcRo
 LemzMVTIhFxQUIUw9zlJ5S1jKpfVH7HkB81KwFeJOETa2K5Ce3LyCCMe47gOw6Xw7uCr
 +Tiw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=k8c8bxkq
Subject: [Buildroot] [PATCH 1/1] package/python-pytablereader: bump to
 version 0.31.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License verified as still MIT after hash changed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pytablereader/python-pytablereader.hash | 6 +++---
 package/python-pytablereader/python-pytablereader.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pytablereader/python-pytablereader.hash b/package/python-pytablereader/python-pytablereader.hash
index 675ce5680e..2034cfd61e 100644
--- a/package/python-pytablereader/python-pytablereader.hash
+++ b/package/python-pytablereader/python-pytablereader.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytablereader/json
-md5  23ba6121e2f916dfbf4015516779dfcd  pytablereader-0.26.1.tar.gz
-sha256  f2e1477de8886267b765af7861baacc65606761bfabb0689f118cc5d27861f26  pytablereader-0.26.1.tar.gz
+md5  8d732b706186666a4c28d14927c26754  pytablereader-0.31.3.tar.gz
+sha256  e292b81ecd96546fe0f53d9c83e716a4682d07d7ead6d9be8beb14ab0591df11  pytablereader-0.31.3.tar.gz
 # Locally computed sha256 checksums
-sha256  7fcef461a93fea587224132a865d1285969c9bec15baf59caeb7a8c7638a8744  LICENSE
+sha256  7588265082eed5e9f4afd5090c57e610b740ec547b16aaaab739ba07c5eefb15  LICENSE
diff --git a/package/python-pytablereader/python-pytablereader.mk b/package/python-pytablereader/python-pytablereader.mk
index 0f9e4c593a..daa484d393 100644
--- a/package/python-pytablereader/python-pytablereader.mk
+++ b/package/python-pytablereader/python-pytablereader.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTABLEREADER_VERSION = 0.26.1
+PYTHON_PYTABLEREADER_VERSION = 0.31.3
 PYTHON_PYTABLEREADER_SOURCE = pytablereader-$(PYTHON_PYTABLEREADER_VERSION).tar.gz
-PYTHON_PYTABLEREADER_SITE = https://files.pythonhosted.org/packages/1e/bc/f60da8a733cd87215d8533f28536f8149eca3b898bbca346b37b6c915d8d
+PYTHON_PYTABLEREADER_SITE = https://files.pythonhosted.org/packages/b5/c8/67590578e27cb1716c7b71291946d685b5bf63fbfe7a254a7cb3f6f8aeab
 PYTHON_PYTABLEREADER_SETUP_TYPE = setuptools
 PYTHON_PYTABLEREADER_LICENSE = MIT
 PYTHON_PYTABLEREADER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
