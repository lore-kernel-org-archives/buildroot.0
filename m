Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2A5C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 22:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 057A381491;
	Wed, 28 Dec 2022 22:41:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 057A381491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z4FsK16ARde9; Wed, 28 Dec 2022 22:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3537E81494;
	Wed, 28 Dec 2022 22:41:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3537E81494
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB93E1BF5F5
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:41:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93B9540179
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:41:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B9540179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r36fxX6qHlq5 for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 22:41:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B5E940162
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B5E940162
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 22:41:19 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 fm16-20020a05600c0c1000b003d96fb976efso9931075wmb.3
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 14:41:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KlZseTtU/MAfVvUoamm6uhy8dwcxKI0nOPvnk4hRyxI=;
 b=TA6bWZYt1M/2Wpkb4pOAnfaZ/sCyCxuN01zx4wQxJlqks9R/lV6Do3DibOJLcrHn+3
 mNFDcOuVrXZVr4L8ij1yiq5dV5Ji03+G85s5zz3Yh2JG+yMHDqWdar7wGH4DcDYcYHXW
 jbNcTvYq28SVJt2/OVvDGukcaODRqWjPzbaZUPbHaruW3AYsrDVu+Wr27BOWBx0zF6T/
 0QSbKFFgu29Ylaqu37s/ywwW8Geo1iS6v9rYMnGQgzhNXVFGdouIFo98/1moRslrvtqj
 WDppE83TOUnon8wbUXdCC6j/RufE2HB0hucbldnL9ZUhpkJ7arai6t703x9xLztdmtMq
 Tcfw==
X-Gm-Message-State: AFqh2kq+RJsowNP9i8tFxiluCdhVuuymxymGylsQTs5NVpT3AVOAf5gG
 FNnIofK+8ji46q/coz01+DoEAhSnKf4=
X-Google-Smtp-Source: AMrXdXuBYntya8WNbOocouo5o6KwBRD2Yw/DRc0COiieQMOo9kCzvPoe9OlEEjnKPNxMmXp6XKjh8g==
X-Received: by 2002:a05:600c:4d94:b0:3d5:3ab1:d630 with SMTP id
 v20-20020a05600c4d9400b003d53ab1d630mr18789735wmp.8.1672267277072; 
 Wed, 28 Dec 2022 14:41:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 c4-20020a05600c0a4400b003cf75213bb9sm31261412wmq.8.2022.12.28.14.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 14:41:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 23:40:43 +0100
Message-Id: <20221228224043.701522-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KlZseTtU/MAfVvUoamm6uhy8dwcxKI0nOPvnk4hRyxI=;
 b=FMk92PksQibfVgf5Pg/2TGW9qgjkoFIUehwU74T1kF/Q0D6vNblQJBroOgNVr/329O
 quT0Mae8Fdpk2MJMwJp4/MnUucVewpH6NPMeIl4MFjyn7p6QHqtrWGV1+GXrsQUQHvJC
 wtrwZ9KbYNWbltOCCFs6YqZ3NHc2wfTbbTFYPc9/cBMrxEJRkoChmRRJ/9GTeirXv1ww
 0AH5/LILAPJ/is4Wce/cT+unPBz7kBylXMZGM2AzevfPF1HUfW5uKF3Fq0WGS3zdUXnn
 nxBsuQ+DQLusGNiVmEuaoug9tkZEOxTR3J1sPbrm289sy4e3QnihwrgfgR1tC8sBs1Ar
 yMPg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FMk92Pks
Subject: [Buildroot] [PATCH 1/1] package/gr-osmosdr: bump to version 0.2.4
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure raised since bump of
gnuradio to version 3.10.4.0 in commit
e37c110bead8b7b35cd97915673fa785ccb39f2d thanks to
https://github.com/osmocom/gr-osmosdr/commit/159885f9e67101834c100ceb7affc122e3f98bac:

/home/autobuild/autobuild/instance-20/output-1/build/gr-osmosdr-0.2.3/lib/source_impl.cc: In static member function 'static osmosdr::source::sptr osmosdr::source::make(const string&)':
/home/autobuild/autobuild/instance-20/output-1/build/gr-osmosdr-0.2.3/lib/source_impl.cc:105:36: error: could not convert 'gnuradio::get_initial_sptr(T*) [with T = source_impl]()' from 'std::shared_ptr<source_impl>' to 'osmosdr::source::sptr' {aka 'boost::shared_ptr<osmosdr::source>'}
  105 |   return gnuradio::get_initial_sptr( new source_impl(args) );
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
      |                                    |
      |                                    std::shared_ptr<source_impl>

https://github.com/osmocom/gr-osmosdr/releases/tag/v0.2.4

Fixes:
 - http://autobuild.buildroot.org/results/5af61d6fb8f8c5d5f91c74a6ef66800236d7bf12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gr-osmosdr/gr-osmosdr.hash | 2 +-
 package/gr-osmosdr/gr-osmosdr.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.hash b/package/gr-osmosdr/gr-osmosdr.hash
index 95f1137e38..b5ac50c4ed 100644
--- a/package/gr-osmosdr/gr-osmosdr.hash
+++ b/package/gr-osmosdr/gr-osmosdr.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  11b1eb13725ced5ded9121a10aaf7bccf2430c5c69d020791408219968665b71  gr-osmosdr-0.2.3.tar.gz
+sha256  28b6f2768aee7b397b227e9e70822e28de3b4c5362a5d14646a0948a48094a63  gr-osmosdr-0.2.4.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 870db60c55..89907c1baa 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GR_OSMOSDR_VERSION = 0.2.3
+GR_OSMOSDR_VERSION = 0.2.4
 GR_OSMOSDR_SITE = $(call github,osmocom,gr-osmosdr,v$(GR_OSMOSDR_VERSION))
 GR_OSMOSDR_LICENSE = GPL-3.0+
 GR_OSMOSDR_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
