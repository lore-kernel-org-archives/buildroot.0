Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C118C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 22:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7924560F4C;
	Sun, 19 Feb 2023 22:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7924560F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3kle_YkkGgH; Sun, 19 Feb 2023 22:20:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC8B360F2E;
	Sun, 19 Feb 2023 22:20:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC8B360F2E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51D121BF404
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 22:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3929140B9E
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 22:20:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3929140B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MOvu8fgDGR_e for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 22:20:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 378A640B48
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 378A640B48
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 22:20:54 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id br16so1629930lfb.2
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 14:20:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=od3vBgYK//9Xus6H7Xyzd1LGiT350r91S4c852xJIpk=;
 b=SSbWqNAPUHIlD67YN6OuxJKEv/YJfgRzi21qQeZRyVXH8bOC3v8t6JnIvwSkK1w1Qv
 6onapeE7WidCDmCpA0lgDtqotM2TooDX8CJLBTNId7oeP4iBH349u6mo6zq13JnTne8K
 K9HGPnme7XSpudQDp0l8x/DZ9wf9Y05lSeUqb9XZYBRijei7kytQTwptKQ8yLfd46/el
 0GZv6tgG6evlG3WfOaHzqXdMsn4296Su8kInDMb/BRfJQMcwLrHRmJ/vQ2OIOySdU408
 5t+NyQ8V5oEUMuYA1Q+A0KsDtRrH+YJo0nWpT0jS8g5szN+8MpYepgVW73YhIiF5FbGL
 sqGw==
X-Gm-Message-State: AO0yUKUKuQKl8asOHG7bDtcWj6++S1f45WRI1iCanCKV+K/lyupV6CZN
 oZkeE8JqEShWTHkZh6qluQY1QnJq2Wo=
X-Google-Smtp-Source: AK7set/F+l0XZfRwIyDEdPxa55pb9jzgwvNSwVguTMke2BWanyp/SfCUfdWzUkOq+zm8hRZgO9NVhA==
X-Received: by 2002:a05:6512:3b9d:b0:4db:29c5:6524 with SMTP id
 g29-20020a0565123b9d00b004db29c56524mr771986lfv.25.1676845251580; 
 Sun, 19 Feb 2023 14:20:51 -0800 (PST)
Received: from luthien.lan ([98.128.186.100]) by smtp.gmail.com with ESMTPSA id
 u6-20020ac243c6000000b004db3900da02sm151498lfl.73.2023.02.19.14.20.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Feb 2023 14:20:51 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 23:20:46 +0100
Message-Id: <20230219222048.22093-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=od3vBgYK//9Xus6H7Xyzd1LGiT350r91S4c852xJIpk=;
 b=Q3urY7gf+/0T5Z80U7KOfn1uYe6bLk6KVoLgq1vZahbJaLe1i5l7CP9pVKhxb1sp0d
 MmUmlmzc29B3iavDDmLWb5kUQ9dl7qWkVIUZZ1iHtLinSJik1d1oR2iZWMqMfTYNMD7l
 WVqwFOlZUw05GL/ql8CVly625dEUmepwq+pHIY5117ywpVn9UxB+ThP8bU/wrxqKC2Jr
 iJvRGYTGwY7NfJ1/bw5PJF7BZwDRIg/GCyTkOR/qI3h62SvcW+rvCjXxVL7CfWkxwQhP
 8xefWf0m3v4Jg+S39ZIg3VWX/y0aB0qfXfgRjjVZ/DGgATBA7ypnln1yAadKxu73ux8o
 C7OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Q3urY7gf
Subject: [Buildroot] [PATCH 0/1] package/ssdp-responder: bump to v2.0
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Meta data:

    $ ./utils/check-package package/ssdp-responder/*
    102 lines processed
    0 warnings generated

    $ ./utils/test-pkg -c ssdp-responder.config -p ssdp-responder
                    bootlin-armv5-uclibc [1/6]: OK
                     bootlin-armv7-glibc [2/6]: OK
                   bootlin-armv7m-uclibc [3/6]: SKIPPED
                     bootlin-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
    6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Joachim Wiberg (1):
  package/ssdp-responder: bump to v2.0

 package/ssdp-responder/ssdp-responder.hash | 2 +-
 package/ssdp-responder/ssdp-responder.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
