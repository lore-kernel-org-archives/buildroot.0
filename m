Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D035C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 21:56:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC3956103D
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 21:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC3956103D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 736254015F;
	Sun, 24 Oct 2021 21:56:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mczSItIxqYnv; Sun, 24 Oct 2021 21:56:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDD1D40153;
	Sun, 24 Oct 2021 21:56:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5C5631BF315
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 21:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BD8040153
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 21:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XKpo4A03RN31 for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 21:56:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B6784012F
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 21:56:11 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e4so9145946wrc.7
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 14:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BvpZdg44+Ib8Wp964CbnK3yobAO3kbapPsYWXVs0Gs=;
 b=Fu2TcOaZ0NNsXM9WgR20xKn4BlUYgdyDlDrZQBWOqxDOIfC0T4zm1gEIEXali7ie6B
 lS3n2z88f5wh2irwu/d/g5Uj/lysNXI6S4+kQVqU6f4lUENteZ+z1trZ1/cGM1DgnqO1
 x8mCSZwSQ9SrIbKA61EVo71QLyDZ8T4IabcpcjiOkQlB9U7jlZCWYSu3AQ4AqHI+cpgq
 LOg0B/haGAYhjLUqhNXxSxtLBTZO3ikvMYcG/JZBuBltPnv/2IFovUb0nLKDVweHvDnW
 D/oCH3txZ/E/uqFHeu5c4OUSEU+p2K9uTxHX+dlNqn4if+T5vzng7vR02QxtVPHII4Oo
 AwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/BvpZdg44+Ib8Wp964CbnK3yobAO3kbapPsYWXVs0Gs=;
 b=wLnhblqrLJXV4/n9dpyliBCoRsbvQTqd6Dm3pEkjFtzxQh/xz/uMOfbt69v/7kdgl0
 /bZKUiSBhPL39/37gs+t3ISpol1S/MbGXqP0DLY428iY2l3bcESDDRqJvhbH968A4lhY
 9L1N1Z23PIhE93z9KnEfvPieIjP6QMLjKTA+VwC4ykqcpSnJEArWOnxgTCm6Jt5U1ajL
 Jhx75xKQh4ts9eFH31oOkumizzSrT2pwqSiFvrypN3PUk42ZuwjxHUwbbiG0VMwz/OPF
 rNOkkAZf8GHcYImzpkKYyre/x8lgU71PLK9tppdpuabxCDfZBGQHo1Il4cM4g6ggfj6D
 pOcQ==
X-Gm-Message-State: AOAM530jDsmojjkOhHAIJVl4YxvfbeQwCQlwESzeM8D3fL6D3e+pf7NQ
 x0UCRcGm3gCxjPfxrRp/vfX97F/4AW0=
X-Google-Smtp-Source: ABdhPJzA0rlQXQdXVRItWrhQKE8S8swjiiQRYDiD3hc43nKU4KU/SX188wzP+O0EvngCMiWQxTJSHQ==
X-Received: by 2002:adf:9b97:: with SMTP id d23mr17302743wrc.53.1635112569231; 
 Sun, 24 Oct 2021 14:56:09 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id d8sm15302043wrv.80.2021.10.24.14.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Oct 2021 14:56:08 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 23:54:38 +0200
Message-Id: <20211024215438.3551045-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/strongswan: security bump to
 version 5.9.4
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fixed a denial-of-service vulnerability in the gmp plugin that was
  caused by an integer overflow when processing RSASSA-PSS signatures
  with very large salt lengths. This vulnerability has been registered
  as CVE-2021-41990.
- Fixed a denial-of-service vulnerability in the in-memory certificate
  cache if certificates are replaced and a very large random value
  caused an integer overflow. This vulnerability has been registered as
  CVE-2021-41991.

https://www.strongswan.org/blog/2021/10/18/strongswan-vulnerability-(cve-2021-41991).html

https://github.com/strongswan/strongswan/blob/5.9.4/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/strongswan/strongswan.hash | 6 +++---
 package/strongswan/strongswan.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strongswan/strongswan.hash b/package/strongswan/strongswan.hash
index a19b311458..69b3547f91 100644
--- a/package/strongswan/strongswan.hash
+++ b/package/strongswan/strongswan.hash
@@ -1,7 +1,7 @@
-# From http://download.strongswan.org/strongswan-5.9.1.tar.bz2.md5
-md5  1f4db969d072e120dc12d1c116a0f658  strongswan-5.9.1.tar.bz2
+# From http://download.strongswan.org/strongswan-5.9.4.tar.bz2.md5
+md5  9c387eb77f0159fdefbcf7e81c905c35  strongswan-5.9.4.tar.bz2
 # Calculated based on the hash above
-sha256  a337c9fb63d973b8440827755c784031648bf423b7114a04918b0b00fd42cafb  strongswan-5.9.1.tar.bz2
+sha256  45fdf1a4c2af086d8ff5b76fd7b21d3b6f0890f365f83bf4c9a75dda26887518  strongswan-5.9.4.tar.bz2
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  2292e21797754548dccdef9eef6aee7584e552fbd890fa914e1de8d3577d23f0  LICENSE
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 2967682767..850bb7326e 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRONGSWAN_VERSION = 5.9.1
+STRONGSWAN_VERSION = 5.9.4
 STRONGSWAN_SOURCE = strongswan-$(STRONGSWAN_VERSION).tar.bz2
 STRONGSWAN_SITE = http://download.strongswan.org
 STRONGSWAN_LICENSE = GPL-2.0+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
