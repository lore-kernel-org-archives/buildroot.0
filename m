Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0489DC19F2D
	for <buildroot@archiver.kernel.org>; Sat, 13 Aug 2022 13:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52CD7831F1;
	Sat, 13 Aug 2022 13:07:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52CD7831F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7IZpeRYTgyd0; Sat, 13 Aug 2022 13:07:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BFB082B9F;
	Sat, 13 Aug 2022 13:07:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BFB082B9F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F201D1BF59A
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 13:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD3CE82B9F
 for <buildroot@lists.busybox.net>; Sat, 13 Aug 2022 13:07:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD3CE82B9F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y8emaaugBy-O for <buildroot@lists.busybox.net>;
 Sat, 13 Aug 2022 13:07:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEB8E8278F
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEB8E8278F
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 13:07:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 186-20020a1c02c3000000b003a34ac64bdfso5531949wmc.1
 for <buildroot@buildroot.org>; Sat, 13 Aug 2022 06:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=OErNp7do+SXF/J186o+BLgPtk5L6Zuk2D7kW2T/SEpc=;
 b=xmm0sF5sJRfPcXk8I9C8+j5T7lPN11p2Wicp6Xnix+EXzYyd7/N5x7eRA9rCEjD/DD
 4XsKk5YBtSrHZR8rrR8MA12+utxx56QpuUZvFxqRh9EnXCFxdF3Xkz+LBbsd0XPCASY/
 yHyS/yOGU8wLeP3kpKzR3wxAo4fbkF99OBVNEsCWfhsy3JfYcIwOQBbgrsq52C8f40B0
 HTQdk6Nnor0CiKUV0SHD+xh/8o8vtUYshR9+NynWGEFshVrT7PJNkGknRoWN8hUBmYYF
 d++WoTnRm/i6fzrbjcuKT52TuWD3kmclEC97Z+uzzOR5h4MSB7csNX9ToHwD5wzX5S6P
 WNMQ==
X-Gm-Message-State: ACgBeo3gwyNUPeBVeo0cicghousnX6OsbMQekkgvuBRs85fQXVHtIbBH
 Jcmq46hEw4swiyDckL+XIDaSQhSFCcc=
X-Google-Smtp-Source: AA6agR41IlyYJkLct4Lv3B2Dan2CWaG4t/c6+uCORUEU0tnYSEL4wummC6Lq8pvSD1Pnvs2diZ9/Lw==
X-Received: by 2002:a05:600c:3551:b0:3a5:dcf3:1001 with SMTP id
 i17-20020a05600c355100b003a5dcf31001mr2131312wmq.58.1660396068560; 
 Sat, 13 Aug 2022 06:07:48 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b001c2477c403353e95.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:1c24:77c4:335:3e95])
 by smtp.gmail.com with ESMTPSA id
 y24-20020a7bcd98000000b003a3442f1229sm2824113wmj.29.2022.08.13.06.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 06:07:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 13 Aug 2022 15:07:09 +0200
Message-Id: <20220813130709.1773465-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=OErNp7do+SXF/J186o+BLgPtk5L6Zuk2D7kW2T/SEpc=;
 b=Ft+aMb8OY3QtGaEYcBBtiSIw+XpEsAt/63yzfHvWt3yOAtxiipi99G+sezf3rCAZGI
 /twZQc77dEGndjvSjrnBcFoeBMVec0EqruHM34Kfq8Z+Mr7vipLecOoelWnFemvjKy+g
 PItURnKARLttV5kpa7wpW1tTPLHJv5faQV3sXoNeLBDDEb73euIXBGLMoL3+hy8V0eT8
 znK156KpZql52fVDA69sX3YW+XHyGmeMeNpCXL5ADdkb+TD5uxGdPlQJllja6wz5UeLi
 OCrROsWmvABzDlxkLmtzrrgc7dSol+dEfd/S+/U0C14kitw6csm4NelRJ6LDMjmONIVB
 UUzw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ft+aMb8O
Subject: [Buildroot] [PATCH 1/1] package/memcached: bump to version 1.6.16
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This bump will fix the following build failure with gcc 12 thanks to
https://github.com/memcached/memcached/commit/4df826aafdd6abf0fc483d52774047c3533206dc:

In function 'complete_incr_bin',
    inlined from 'dispatch_bin_command' at proto_bin.c:1010:17,
    inlined from 'try_read_command_binary' at proto_bin.c:119:9:
proto_bin.c:272:31: error: array subscript 'protocol_binary_request_incr[0]' is partly outside array bounds of 'char[45]' [-Werror=array-bounds]
  272 |     req->message.body.delta = ntohll(req->message.body.delta);
      |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

https://github.com/memcached/memcached/wiki/ReleaseNotes1616
https://github.com/memcached/memcached/wiki/ReleaseNotes1615
https://github.com/memcached/memcached/wiki/ReleaseNotes1614
https://github.com/memcached/memcached/wiki/ReleaseNotes1613

Fixes:
 - http://autobuild.buildroot.org/results/27ae4bc1ce0d37dee09613b1145023f0d96d8c55

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 22c794d07b..3bdd1e5e33 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,6 +1,6 @@
-# From http://www.memcached.org/files/memcached-1.6.12.tar.gz.sha1
-sha1  40d43e98f149e13e6c81eee813e6734f23413a01  memcached-1.6.12.tar.gz
+# From http://www.memcached.org/files/memcached-1.6.16.tar.gz.sha1
+sha1  724f31c3462fb6b07264d72d0043fd65545fd84a  memcached-1.6.16.tar.gz
 
 # Locally computed
-sha256  f291a35f82ef9756ed1d952879ef5f4be870f932bdfcb2ab61356609abf82346  memcached-1.6.12.tar.gz
+sha256  3051a93bf1dd0c3af2d0e589ff6ef6511f876385a35b18e9ff8741e4a1ab34da  memcached-1.6.16.tar.gz
 sha256  bc887c4ad8051fe690ace9528fe37a2e0bb362e6d963331d82e845ca9b585a0c  COPYING
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 00f892c96a..c7d89054bd 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.6.12
+MEMCACHED_VERSION = 1.6.16
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
