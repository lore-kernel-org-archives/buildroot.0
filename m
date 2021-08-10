Return-Path: <SRS0=7M6N=NB=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57145C4338F
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 18:22:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A8E06056C
	for <buildroot@archiver.kernel.org>; Tue, 10 Aug 2021 18:22:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A8E06056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADF6340249;
	Tue, 10 Aug 2021 18:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ulvCEemAWbrh; Tue, 10 Aug 2021 18:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F30740325;
	Tue, 10 Aug 2021 18:22:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA0611BF479
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 18:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 950EC40106
 for <buildroot@lists.busybox.net>; Tue, 10 Aug 2021 18:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tK6nQ2858tZg for <buildroot@lists.busybox.net>;
 Tue, 10 Aug 2021 18:22:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 067A6400C6
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 18:22:26 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id q11so9326194wrr.9
 for <buildroot@buildroot.org>; Tue, 10 Aug 2021 11:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=owFSinrExyfM4dW1Wh5siojz/265GGwqOsNaJm5vndA=;
 b=sfHH3pyrSdiA2zAqP75TwH40RAgQxpHW5BiFhjVxfpOj8CH6FtbmwxrY9sZhjGAw6O
 UEgD4FUBL+0xMHgDaSY9cc8NwoJ47LwSmdOCRqJy5DxrtYlfiHAWDBA6mWOeaGMifq1u
 0+s/mkwSsTAtABqrBeCa226+GUy5pYIZeex+l7SyFkWt6H8GOvOgBL5DovFVS840UxTx
 Wnr5uDc0/ejesZLRyU8RW9MlQe8xYkLp/Pl6Dpy1dvF5APjxJK3hc6gDBWLsbwGikSgW
 L7FFVsE+xpi7GcA1n74EthBbO6/qF0QCXitFji+0DR3bSjKn+1WUflZ3cL3Hsp7NrjO6
 DUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=owFSinrExyfM4dW1Wh5siojz/265GGwqOsNaJm5vndA=;
 b=FzczpX9fpwDGE4OX10UROnNwio6RjXq5d3Ek6SeKXlm3Id5aNPAYq1AQMz0JklVEUE
 6Fikg9pi/yb8R6pyXIfcEFwlomydaz909Z429PzaxccVMAaTzlYm+tkI3thAmkxtZl6y
 Qq5bkjJdFaxsS23/YxD9XuE/HKdw0pJoXv6c9YTI9rHK86QJIDimrkORpaduJyIZeZtn
 nHBXXxec+IXeRBbJWCFf3SExLjuBfeAL38WjWOypiVMf84/iOQVwDoCKiNFb0HiSRwDe
 5Th9LFG+En+2Uh97EXcc7mzi+SmJJJC3a322FTXGEPCRxJynTewNaE+FF9N8tqVxllNh
 WZQw==
X-Gm-Message-State: AOAM5328xf+2K7yv9QiS+bcA0v2h5FjrmJ5ioEuHCsLHhHA8XxOzKLDs
 pBaLZUvwWT1uH32IRhymsKBwZ6MzWxHNag==
X-Google-Smtp-Source: ABdhPJytVAqmBkwVmjSXmxGdyBDk2UdlxcesSK63ZjGqvJ+DJQaQ1ASUUJO67L2OTO1eJWHUwRB0Wg==
X-Received: by 2002:a05:6000:18b:: with SMTP id
 p11mr3600894wrx.366.1628619744823; 
 Tue, 10 Aug 2021 11:22:24 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id d7sm24275663wrs.39.2021.08.10.11.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 11:22:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 10 Aug 2021 20:22:16 +0200
Message-Id: <20210810182216.426739-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/osm2pgsql: needs std::future
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

osm2pgsql needs std::future since its addition in commit
46c42042867e672eb21b386eb5e29747c30e80ca to avoid the following build
failure:

In file included from /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.cpp:12:0:
/home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.hpp:218:24: error: field 'barrier' has incomplete type
     std::promise<void> barrier;
                        ^
/home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.hpp: In constructor 'db_cmd_sync_t::db_cmd_sync_t(std::promise<void>&&)':
/home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/db-copy.hpp:221:37: error: class 'db_cmd_sync_t' does not have any field named 'barrier'
     : db_cmd_t(db_cmd_t::Cmd_sync), barrier(std::move(b))
                                     ^
In file included from /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/middle.hpp:18:0,
                 from /home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/dependency-manager.cpp:11:
/home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/thread-pool.hpp: In member function 'void thread_pool_t::check_for_exceptions()':
/home/buildroot/autobuild/run/instance-3/output-1/build/osm2pgsql-1.4.2/src/thread-pool.hpp:49:19: error: invalid use of incomplete type 'class std::future<void>'
             result.get();
                   ^

Fixes:
 - http://autobuild.buildroot.org/results/69528232ceba128a2e60aa778bb0943fdefc2ed1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/osm2pgsql/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/osm2pgsql/Config.in b/package/osm2pgsql/Config.in
index 1f1200cf46..f9fafb857c 100644
--- a/package/osm2pgsql/Config.in
+++ b/package/osm2pgsql/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_OSM2PGSQL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11, libosmium, protozero
 	depends on BR2_TOOLCHAIN_HAS_THREADS # boost, libosmium
 	depends on BR2_USE_WCHAR # boost, fmt, libosmium
+	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_SYSTEM
 	select BR2_PACKAGE_BOOST_FILESYSTEM
@@ -24,3 +25,6 @@ config BR2_PACKAGE_OSM2PGSQL
 comment "osm2pgsql needs a toolchain w/ C++,  wchar, threads, gcc >= 4.7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 || !BR2_TOOLCHAIN_HAS_THREADS
+
+comment "osm2pgsql needs a toolchain not affected by GCC bug 64735"
+	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
