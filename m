Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8A8CA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 10:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86358409DE;
	Tue, 19 Aug 2025 10:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGsWuXIxmBz4; Tue, 19 Aug 2025 10:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3EFF409E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3EFF409E2;
	Tue, 19 Aug 2025 10:20:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 912C7E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77E2D80A57
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 10:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMJRB-ETpYLl for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 10:20:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C40E180A4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C40E180A4F
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C40E180A4F
 for <buildroot@busybox.net>; Tue, 19 Aug 2025 10:20:35 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b9d41c1964so3431636f8f.0
 for <buildroot@busybox.net>; Tue, 19 Aug 2025 03:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755598834; x=1756203634;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VvrnwM/7pDHQz8c8Zc3ebCC5AnDzj10jzH9+9MCB8og=;
 b=b7t4vSZgUcuyAZllsFOy1e0gVOnjSzcEj/Las+TkvFGzminM6fbaQtjIfvBPZGRXol
 d79yAQE4utAa6WeQKXXhGeswRaoyx9wuOPcvW8hVUlfIyDd6Apfm/JO5pG1ITky/bFaZ
 q31kNCibAU1mIOcJEZSPsOEaq+fg7P2tVMnRt+nphgk9sZqJG/k9vhL61064W/Z78Ku3
 EakkpePXiXe5+4pF6pMksykip4jrwlP+8bcphmxjrjDnTj/aJR6a0Z7pBzmWTDUraimF
 CmrAfo2eYRst2PAGmcpnLM/of8DRHJV6stqSZgsVJsAKtrfpcsxhMPpFPocspwVzc+9l
 QfMw==
X-Gm-Message-State: AOJu0Yw2Ixp4KHUKISPHB0vRgi0jk+XYfJAGWQXZkRQ7pj/5OnoKDK5o
 WlwLGbSpmQbQWu92g8bMWZtSPYU2zHt6c6sm3dcrofxpdAPUafq6Y7T/7lay4oJugPKA41TLJge
 w7F5cCw==
X-Gm-Gg: ASbGncsR3pMBEd2p42kmnoN5X3eRhwhw9fw3+M1UZ1XLTsYWDcYoSinpDVmemE6xxkk
 RIlkRGerH8/uG7/+XM9TV/QCWoZzSPqL0ie3G3ll6z+AgwPhJPaBqh3eG1i+ZDTJOnMzSPyyko0
 73MXvro0rGVRgt5HKTmFKyA/sLgNwRoYbEydA6CLY1z/EhH8R4EL3Hr1Cf63NwGZvFOJaE12fWZ
 iQflYxgEkXnx5cBw/lnkN+wqtMpG+bPKHgu8/SHYGP2FMqD7G9gInrdSS+azZrzeFCQaXVP07GH
 +NMsmxNRIMeqp1URhU94boJawvnMJo/TS/dWDRYhdNOrTdixpOTIUtqImil+uzqKnYeu2QkaaIe
 40AXCOcVwtC0iL3iGxvl38pK+sIzTSfbWBWeqdqxLH/zCDa5CyF+NVREKMrbHVAE=
X-Google-Smtp-Source: AGHT+IF6Y8Eu4SN3SL8aEaKOmgQWyfcM0ODnwTEVSSlPX04yG6WxjU6jd1WUIcii2WvrYYT5Heqwsw==
X-Received: by 2002:a05:6000:26d2:b0:3a5:3a03:79c1 with SMTP id
 ffacd0b85a97d-3c0ed1f30fbmr1615764f8f.48.1755598833007; 
 Tue, 19 Aug 2025 03:20:33 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c0771c162bsm3116235f8f.42.2025.08.19.03.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 03:20:32 -0700 (PDT)
To: buildroot@busybox.net
Date: Tue, 19 Aug 2025 12:19:55 +0200
Message-ID: <20250819101956.2709125-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1755598834; x=1756203634; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VvrnwM/7pDHQz8c8Zc3ebCC5AnDzj10jzH9+9MCB8og=;
 b=DzKGtI+5gghbdc07jjSgQfoVkAyMR1VkMMkpdSphtBIkTFf/034NtJJTa2fIThM/qo
 b/EyZ0iZMNjOsMhzZE7AnfXavzqOxZk8/wtg9Qtk+CwjYUBoSC6NzqVZWwqbWZMGDASF
 7GBF7gWb/XsVRXqhuyUwPmZ/nmwclnMmh6YriqUtV2h+lBsv83TSC1XOh1zAiZPOPeJh
 Hr8hgtwdexH/Ehj5YcOIZwfeh59dqO4pgZcz6NEK/XUY949/7u6GVh4V+qs3kA4VA+kZ
 L9HBFfaqdDwlVQ37lkCbQDW/wZsNRIVCxL5GXaKG1OBIj+0Qf24Jj2fiUSGrE8qgGw26
 la0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=DzKGtI+5
Subject: [Buildroot] [PATCH] package/lua-utf8: bump to version 0.1.6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-utf8/lua-utf8.hash | 4 ++--
 package/lua-utf8/lua-utf8.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-utf8/lua-utf8.hash b/package/lua-utf8/lua-utf8.hash
index b4d455ceb..8973b4bff 100644
--- a/package/lua-utf8/lua-utf8.hash
+++ b/package/lua-utf8/lua-utf8.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  68bd8e3c3e20f98fceb9e20d5a7a50168202c22eb45b87eff3247a0608f465ae  luautf8-0.1.5-2.src.rock
-sha256  74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.5/LICENSE
+sha256  37901bc127c4afe9f611bba58af7b12eda6599fc270e1706e2f767807dfacd82  luautf8-0.1.6-1.src.rock
+sha256  74506285923bcc3e58aaca1b774db26461021783d02b2dc26bafcaa02ef7a00b  luautf8-0.1.6/LICENSE
diff --git a/package/lua-utf8/lua-utf8.mk b/package/lua-utf8/lua-utf8.mk
index 33c34a4eb..991ebfa2f 100644
--- a/package/lua-utf8/lua-utf8.mk
+++ b/package/lua-utf8/lua-utf8.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_UTF8_VERSION = 0.1.5-2
+LUA_UTF8_VERSION = 0.1.6-1
 LUA_UTF8_NAME_UPSTREAM = luautf8
 LUA_UTF8_LICENSE = MIT
 LUA_UTF8_LICENSE_FILES = $(LUA_UTF8_SUBDIR)/LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
