Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BF3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:32:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A05A60EE2
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:32:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A05A60EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39E7D81B35;
	Thu, 14 Oct 2021 21:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gfe4WASK88ge; Thu, 14 Oct 2021 21:32:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9774381A73;
	Thu, 14 Oct 2021 21:32:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 232721BF576
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 112F94011C
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:32:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DUo1SP_ibsil for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:32:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4AF5400D9
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:32:09 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 b189-20020a1c1bc6000000b0030da052dd4fso652032wmb.3
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 14:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RV5eBFirfgWlJdLDTcUMk4ztzXnxxezVuRPzcc+ogT4=;
 b=cQnzweQpVaZXO5mSn///PaNlk8R72wOtz6aM5coxNpzK4QvPbDDxxnASPAMyqbiwP1
 52U910KbsjzQAGVHXxDCheAwZw90FCdOyr8Rn/Sktsd5X+prjzzpGik4KtXgWq7qTkwE
 l1Bv7eLhQ4Qkd1XWSksHU3W/xITyDidQfS741aDN/ttQMIGEFTjWA7QDsj05kBksQIdn
 O7ZiyCkCXNtUHfJ3YyJms5pnafQY/cxHLsHmJHB2C4M0kCU9VjxtblMva4+1Hl5u/n81
 TNmgfWvXnAfHlg0UdM3JYF3vD6JSkwrI9+fedh7gzD4dznJ7kFQAaywlRrsGfZbtktun
 JvlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RV5eBFirfgWlJdLDTcUMk4ztzXnxxezVuRPzcc+ogT4=;
 b=pHSrHWJhfGd8rQ3aY2j0XckNLRQDJ2PGG4Sv0GnDQyq1gEUFSnntggrcmfUdyI6VJo
 GyDAqMs00ANNgX6QKx7UBElRYhHmlTdtN89jPVVicE/ScnNxxIkkL92CM/ehj9vEbv03
 mCi2cknOVp02Zcwlp/Dd7dWrclPg5dfRG0uo7b/drwcFCk27kH1DCCh6fSwdUZ3h3s9n
 8Z3IJpIDrKKlIB1DRn2p7tCL2l5QdQcP56rFOiRL6z8PyddUYUVz480R8eYH+2KmXXMG
 Q+Wn9rEqkuv4ZmoYuwD/qgJdcQxBJh49SSUamXXFAjfmHbvb7Ba2cxHP+kAp3pbqyj+i
 bfqw==
X-Gm-Message-State: AOAM5300MCwhZxhNFcYDQJpGoueb3bzJANn0/rAv7VA0KLJY8PUWBDyq
 bYiG5hs1kUc8PAkqZY2DSR5PQUMH5zY=
X-Google-Smtp-Source: ABdhPJzWxaJ7TqeUb+73aVu7ip9kJKIdHZT9cBS93VnAWlhgbmMmpGK/9dr1CbW+u6gCHIN1LT8xww==
X-Received: by 2002:a05:600c:4fcd:: with SMTP id
 o13mr22740447wmq.158.1634247127676; 
 Thu, 14 Oct 2021 14:32:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id 143sm9257844wma.37.2021.10.14.14.32.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 14:32:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 23:30:25 +0200
Message-Id: <20211014213025.66942-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/micropython: depends on host-python3
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
Cc: Chris Packham <judge.packham@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Replace BR2_PYTHON3_HOST_DEPENDENCY by host-python3 to avoid the
following build failure raised since bump to version 1.17 in commit
32b2a03745785afeb496979aa3c0f654bc6063ce:

Traceback (most recent call last):
  File "../py/makeversionhdr.py", line 117, in <module>
    make_version_header(sys.argv[1])
  File "../py/makeversionhdr.py", line 79, in make_version_header
    info = get_version_info_from_docs_conf()
  File "../py/makeversionhdr.py", line 67, in get_version_info_from_docs_conf
    for line in f:
  File "/usr/lib/python3.5/encodings/ascii.py", line 26, in decode
    return codecs.ascii_decode(input, self.errors)[0]
UnicodeDecodeError: 'ascii' codec can't decode byte 0xc2 in position 2154: ordinal not in range(128)

Indeed, this build failure is not reproduced by host-python3 (in version
3.9.7) so it is probably an issue with python 3.5 (which is 6-years old).

Fixes:
 - http://autobuild.buildroot.org/results/96f7b81f5d14715b0b6673a8016a31e9e1552d0b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/micropython/micropython.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 3d69e152e5..c49ca23449 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -11,7 +11,7 @@ MICROPYTHON_SITE = $(call github,micropython,micropython,v$(MICROPYTHON_VERSION)
 # and most of the copied code is not used in the unix build.
 MICROPYTHON_LICENSE = MIT, BSD-1-clause, BSD-3-clause, Zlib
 MICROPYTHON_LICENSE_FILES = LICENSE
-MICROPYTHON_DEPENDENCIES = host-pkgconf libffi $(BR2_PYTHON3_HOST_DEPENDENCY)
+MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
 
 # Set GIT_DIR so package won't use buildroot's version number
 MICROPYTHON_MAKE_ENV = \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
