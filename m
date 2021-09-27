Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4979C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:35:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AC5C610E8
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 16:35:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7AC5C610E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 280C76084D;
	Mon, 27 Sep 2021 16:35:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FSHCHag7SkH; Mon, 27 Sep 2021 16:35:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E9F60623;
	Mon, 27 Sep 2021 16:35:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF88C1BF955
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D00AF81024
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 16:35:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wtZfqrtSMgN3 for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 16:35:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DFF568101C
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 16:35:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 c73-20020a1c9a4c000000b0030d040bb895so457668wme.2
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 09:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1POTAGvGMQkWPQoknkmNwgFaMpcgBviDDN5AxSsmzXc=;
 b=hAK1+R5l6g8nqjKVWeyEjm+pM5ZH2z6Y++gavcUQHGZ7ZGxkCpkMQC3FhA3SGg3X1E
 LKv/3xLPj/PhbSxHbW4Op57jpsTHLJbcA3FcDEfR0nhoH40hzlqW7Q23Ot6pTfvKBtA0
 5LioLoG7FCXDYW7W7Iw0TkAvTO6tnxY9ucoycQvLdhpZi8LAYdkKr2RJEJhXej1Ak4dn
 T7277oSSAOIAasdSeNeQuYPd4yHRNfLBbZYQx7zdv4Ab7M5K5L0g1iBTWMZKYges3/BM
 qYuxIEjv+/SC42F+KD7szsB9jUgH9SOElS3eSf8zWRLybwOR3hhkR59Wn7h2Q7CDMYI6
 Y0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1POTAGvGMQkWPQoknkmNwgFaMpcgBviDDN5AxSsmzXc=;
 b=Gk4C85bf52Ic1yBinVWl97NjlvxK4pfowTc0dMOUssuD0V88Dm4VbACLPY50K/Lonn
 WMmS8ys0Jeto9PiHHJESbZEduUrneVr8xDhMvWkYi1A7W+0lOVVqYRwhozuM51wStCof
 +QtxH9tjBEjWhHrEcaN5+qSFSkjw+T+c8QQN/9l8VzIA4+OJPKVZXas5hidtThcZ8zx8
 ShRRFzr6DYAFSlCfKEMpp2qjzyUtHPqi4R8BfqdYcDRiVmzA2V/DAffNHwxk1AqjpD48
 6Ev+SZuVcfrnuLpYMpQiIuyY0MkJHRDzcZ3YXnOa7hpYgeD1YZloBGQAtF/1/ggMOs7V
 +oPA==
X-Gm-Message-State: AOAM533vZVqbyPblOnrp9erjzPvZBdMVX5IM1H2UTxtQTBeeu5UI90c2
 7OILT7qqfxot/Wa+RQbmHa1CawtuRMw=
X-Google-Smtp-Source: ABdhPJw+1krYXH3okI+IQQf9vR5dSLzEZiuCGWNpH208W2q6SeD8ol8SwYTyeMm9b/AsvQQxKgRq+A==
X-Received: by 2002:a05:600c:210d:: with SMTP id
 u13mr13948wml.102.1632760551886; 
 Mon, 27 Sep 2021 09:35:51 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id u5sm18511886wrg.57.2021.09.27.09.35.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:35:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 18:35:16 +0200
Message-Id: <20210927163516.1472524-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iwd: fix musl build
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
Cc: Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with musl raised since bump to version
1.18 in commit 1a7be12e1e10cc09e3a28a8d04a352bbbb63ba3a:

src/netconfig.c: In function 'netconfig_ipv6_to_string':
src/netconfig.c:188:18: error: 'struct in6_addr' has no member named '__in6_u'; did you mean '__in6_union'?
  188 |  memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
      |                  ^~~~~~~
      |                  __in6_union

Fixes:
 - http://autobuild.buildroot.org/results/2c4e6cf22e6fb5582470930241904878070f1144

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...nfig-Remove-usage-of-in6_addr__in6_u.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch

diff --git a/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch b/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
new file mode 100644
index 0000000000..f6b3d24516
--- /dev/null
+++ b/package/iwd/0002-netconfig-Remove-usage-of-in6_addr__in6_u.patch
@@ -0,0 +1,32 @@
+From 42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7 Mon Sep 17 00:00:00 2001
+From: Andrew Zaborowski <andrew.zaborowski@intel.com>
+Date: Thu, 16 Sep 2021 01:58:29 +0200
+Subject: netconfig: Remove usage of in6_addr.__in6_u
+
+in6_addr.__in6_u.__u6_addr8 is glibc-specific and named differently in
+the headers shipped with musl libc for example.  The POSIX compliant and
+universal way of accessing it is in6_addr.s6_addr.
+
+[Retrieved from:
+https://git.kernel.org/pub/scm/network/wireless/iwd.git/commit/?id=42bd5ba7c2665c5bf95ba102a8115c4cf01d31d7]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/netconfig.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/netconfig.c b/src/netconfig.c
+index ce95db0b..421270c9 100644
+--- a/src/netconfig.c
++++ b/src/netconfig.c
+@@ -171,7 +171,7 @@ static inline char *netconfig_ipv6_to_string(const uint8_t *addr)
+ 	struct in6_addr in6_addr;
+ 	char *addr_str = l_malloc(INET6_ADDRSTRLEN);
+ 
+-	memcpy(in6_addr.__in6_u.__u6_addr8, addr, 16);
++	memcpy(in6_addr.s6_addr, addr, 16);
+ 
+ 	if (L_WARN_ON(unlikely(!inet_ntop(AF_INET6, &in6_addr, addr_str,
+ 						INET6_ADDRSTRLEN)))) {
+-- 
+cgit 1.2.3-1.el7
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
