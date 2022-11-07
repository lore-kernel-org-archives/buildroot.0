Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F19C4332F
	for <buildroot@archiver.kernel.org>; Mon,  7 Nov 2022 17:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B3E781753;
	Mon,  7 Nov 2022 17:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B3E781753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z0NvJr3MBX79; Mon,  7 Nov 2022 17:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40A2981457;
	Mon,  7 Nov 2022 17:10:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40A2981457
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 14E0A1BF2EF
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E327181457
 for <buildroot@lists.busybox.net>; Mon,  7 Nov 2022 17:10:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E327181457
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uy7nON3sq4rg for <buildroot@lists.busybox.net>;
 Mon,  7 Nov 2022 17:10:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D83F8137F
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D83F8137F
 for <buildroot@busybox.net>; Mon,  7 Nov 2022 17:10:54 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id w14so17204173wru.8
 for <buildroot@busybox.net>; Mon, 07 Nov 2022 09:10:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NPsH7bpyarnxUWBy5bO0oi+yQMnm2aok5L9wYw8qrmQ=;
 b=BesfUSHMobVSlHIifYFA7tVzw2rPwWU+enghDclrcpxagHWDkq0usWNfJD6VIOS/uD
 i2Ta8+qLfCdfI/WoHbHvM7wXyKualhRcbxQ/EJbIOEEnR0zjwwa+30i16R+FkXAObamV
 HM24IZljObAM3uPoT+AFuywf0EeUsTlw8pFkXsBtvyX7RnAZ5XcQWBUt4u9Rp8g9xFPL
 kkY3gYFXiBszaK9vxJgaR9/2FkFOfGIKkUNT3O0o77umLUtfOcuGZa18LlN4YpsQ3Sju
 o3nKhSIwqkf8mdj4ib6LJ3gqYjbQNNxUU8nP83owPeQwQqUN5R9dr8f1rBiFDskOyZI4
 SW+g==
X-Gm-Message-State: ACrzQf1MRpE11KY4e9v5EBTte5xJsQAGV24q4uqf24ydrvXx3rLh39RV
 1BgcGxaTVnSFPsisGexo+qUEm3s2eFk=
X-Google-Smtp-Source: AMsMyM7vJ8ZQbVc24kIFOp7VgWwcRMKZFxyNZVzKJL1XdmRG1MuH0JJJeXE+PP7VnSGZZI2DkjqwoA==
X-Received: by 2002:adf:fc12:0:b0:236:9b2e:4843 with SMTP id
 i18-20020adffc12000000b002369b2e4843mr31742249wrr.620.1667841052586; 
 Mon, 07 Nov 2022 09:10:52 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 bk28-20020a0560001d9c00b002365b759b65sm7983794wrb.86.2022.11.07.09.10.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 09:10:51 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  7 Nov 2022 18:10:44 +0100
Message-Id: <20221107171044.1239145-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NPsH7bpyarnxUWBy5bO0oi+yQMnm2aok5L9wYw8qrmQ=;
 b=j8kN/0E/H9fHXQhpXoGwXtr5RxGSw9LZVutgGIiFjM/YofgnUpo/jaP5ZLNCOOYvwG
 Iw3/KKpzenwLoUGR3P+PdaBdV0lKwKeiwk8a7qKVnnA3sAfdGE/SeplazYh8REnx74or
 +K0ncwnHic02ekPUK0acHpxDqUx83vHHoevSQO9A/20o9iH1JE0WTJHaOnaxrly1qEIY
 OFD9ZBM8owhoJXZvAmlgH/l2UHg+2p7IQOS2hvbXHOJR8WnwD7nwGLqgvufbLuFIUGwm
 PeJK/D+9w0PpFu8kvzYhQj3ZcaqIWxiJwBxiPXObg/k1oEJV9nK4xq0wuplIUlDm4Fky
 /hVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j8kN/0E/
Subject: [Buildroot] [PATCH] package/lua-cffi: bump to version 0.2.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-cffi/lua-cffi.hash | 2 +-
 package/lua-cffi/lua-cffi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-cffi/lua-cffi.hash b/package/lua-cffi/lua-cffi.hash
index a532c6c7b..e71019993 100644
--- a/package/lua-cffi/lua-cffi.hash
+++ b/package/lua-cffi/lua-cffi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c30080d6309167f86d1a96d3ee33f33ef52e884052b7feac140b8c52db10ad7a  lua-cffi-0.2.1.tar.gz
+sha256  34fb4eea7a0abec2095f08596f604ac01c81b979bead7d2f5cb084b3e2b46cbc  lua-cffi-0.2.2.tar.gz
 sha256  f5653a4d5864a3920ea1e07dacfd646067314be647598f0acaaf685beaa2e396  COPYING.md
diff --git a/package/lua-cffi/lua-cffi.mk b/package/lua-cffi/lua-cffi.mk
index 964f49f03..ac351f7f9 100644
--- a/package/lua-cffi/lua-cffi.mk
+++ b/package/lua-cffi/lua-cffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CFFI_VERSION = 0.2.1
+LUA_CFFI_VERSION = 0.2.2
 LUA_CFFI_SITE = $(call github,q66,cffi-lua,v$(LUA_CFFI_VERSION))
 LUA_CFFI_LICENSE = MIT
 LUA_CFFI_LICENSE_FILES = COPYING.md
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
