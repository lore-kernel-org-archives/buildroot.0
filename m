Return-Path: <SRS0=a43l=QF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E747C433F5
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 21:08:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5D7961546
	for <buildroot@archiver.kernel.org>; Thu, 18 Nov 2021 21:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B5D7961546
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64C1480C27;
	Thu, 18 Nov 2021 21:08:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IJwXmbfxmbZ8; Thu, 18 Nov 2021 21:08:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CCDCC80BE9;
	Thu, 18 Nov 2021 21:08:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6AF031BF397
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 21:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56E9940255
 for <buildroot@lists.busybox.net>; Thu, 18 Nov 2021 21:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oif56LqkcZoj for <buildroot@lists.busybox.net>;
 Thu, 18 Nov 2021 21:08:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 631AA401EA
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 21:08:36 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id y196so6559347wmc.3
 for <buildroot@buildroot.org>; Thu, 18 Nov 2021 13:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=quLktL8bYL2sTGsr+nuopyGuYZI5Qpr/1ZxMfE6uDlo=;
 b=MHBPHXNU4YXvytXgclJkDr+XrQkOLQ3ukzUtEP25o99mxBLMzteo4xKz5KtH9qQzdE
 Uj62pc1xLNmX48OUdWL7disWmsVc4QxKX+kVtpntLc3naI9dINcVB1yeDmqgGmTbfhem
 xNhw6LTNKjBLqo5x74DXHFFcudW+5hSDetzoPJ7tJKwrsNd+TxW/NPQYuZH1iXBF3stx
 tqqk23Gby561CiPzjfGU90cydU3jBFnx5RvrRsif3Ut1CwjQLWB6BZGnkCdGypoStWyb
 aMicXZ4Ed2wYUXMMAlAzORId4E5fqNMSO6ci4vXDV0BvPIsT51xRn53X1/g8XYAYdMHG
 tg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=quLktL8bYL2sTGsr+nuopyGuYZI5Qpr/1ZxMfE6uDlo=;
 b=H1gJJznCeSrQxRpGWfI8nacCulgm+F+j+3+BvTn5lnKCEcz60hFgi8w0051hcQMPn/
 xXiSToXTjjZqfbzhYLQAjO/nuv6TFrwMBHHNxAnZr65LyJA7glg/VQIfWxNovpTCLDsE
 jcUY6Gc+2mCyf2CwGKz48bOedVGSIuRfYyhZu7gK5UdkNPY5AfnVDRrXTXuAUk3G/luM
 TTIEGKbmGu48qQNFw5MOd83EJQ5oAY4zL3IY6yWXxPgg89i5KCBMtt5iXPnN2lt3Q5zf
 p3+Otut36Ncw0ZMhDZhX78T8naX4D4oIxnhf1JUL3ANppuBAFLbPAB0H1aT90xC6ifPE
 /2Qg==
X-Gm-Message-State: AOAM533GDkpzW0b/p8o806bqhae3r2RpquYHgVFfKrE04sLflAHdmftk
 O25TqhmY8Chwj5PulnNaZ2yKwxgh/2w=
X-Google-Smtp-Source: ABdhPJyO/+uhuBw86usJA8rZOCUvWjyBYIkj3dXUyncbaujLTuY7ZCcpQhqHcuhrPUobwcR+PMrVSA==
X-Received: by 2002:a1c:1fcf:: with SMTP id f198mr151075wmf.66.1637269714311; 
 Thu, 18 Nov 2021 13:08:34 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h15sm819246wml.9.2021.11.18.13.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 13:08:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Nov 2021 22:06:23 +0100
Message-Id: <20211118210623.1598934-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lighttpd: run autoreconf
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For an unknown reason, the build fails since bump to version 1.4.60 in
commit d62b7f54f00291a50274409fb5510527fd725ffe on:

array.c:140:2: error: 'for' loop initial declarations are only allowed in C99 mode
  for (uint32_t i = 0; i < sz; ++i) {
  ^

Running autoreconf fixes the build.

Fixes:
 - http://autobuild.buildroot.org/results/0349d8fed35b0766796dd9ba3b8de6ff8bd68fe7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lighttpd/lighttpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
index 9c18a6038e..c39a5db20f 100644
--- a/package/lighttpd/lighttpd.mk
+++ b/package/lighttpd/lighttpd.mk
@@ -12,6 +12,8 @@ LIGHTTPD_LICENSE = BSD-3-Clause
 LIGHTTPD_LICENSE_FILES = COPYING
 LIGHTTPD_CPE_ID_VENDOR = lighttpd
 LIGHTTPD_DEPENDENCIES = host-pkgconf
+# Issue in configure script provided in tarball
+LIGHTTPD_AUTORECONF = YES
 LIGHTTPD_CONF_OPTS = \
 	--without-wolfssl \
 	--libdir=/usr/lib/lighttpd \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
