Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FF8C433FE
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 21:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF4094162C;
	Sat,  1 Oct 2022 21:21:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF4094162C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gLldQoq3-y3C; Sat,  1 Oct 2022 21:21:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76AB741583;
	Sat,  1 Oct 2022 21:21:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76AB741583
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1763C1BF4E6
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E72F260F53
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E72F260F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6N-iVLcyHvBl for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 21:21:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75E48606DC
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75E48606DC
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 21:21:38 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id bk15so11670328wrb.13
 for <buildroot@buildroot.org>; Sat, 01 Oct 2022 14:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=2PZ9uuXLb2IvZX6okYV9TcZ8SzIsIkh44pon/n6k04c=;
 b=DL0OdYBP9oEduNw+5uMf7aWjn98ilc+EK/y6BOIu5n3qTGTLdjqgyxRd6Bu70h1pld
 sIeuJxLGRmzEMeQDkrFSZsJua0h33JdKYqBKa4X9RESDJZMjJu2Y/LtQSe81lFyPZJgs
 dPAeK8j+dP5exU73aONujA/uYzs17oNKjW0/+mlDDp/G5cR+lKo8+IS55qt+/2U4iy5u
 h24yIRojQ/rFVqFA6MWpjM93/5+0qvqM4uxwQf9eiUpsuo+dBcfPPXxKU6FUar32MpeX
 3cDSlG8eKX8pk4WkZRrgbqbEQzL4iL/lr11ICPrgYljg0Zs002QwqpHXZMXhn67MQI9s
 v3kA==
X-Gm-Message-State: ACrzQf2473JcnVjlUYbterK0V6at65ftu3OYYEEjLPXO0bhXmiQZzAgz
 Hc+2VwpEaCOMB+0zvZ1uobJ+3TCM/5o=
X-Google-Smtp-Source: AMsMyM7OhccMSj9h2ZpEfi8PynYRfnxD/m5LvGhzOEh75yidV0xdZ1gqhg+gUQHNHs8/gJNcq3LzzQ==
X-Received: by 2002:a05:6000:1887:b0:22a:3c3d:75ea with SMTP id
 a7-20020a056000188700b0022a3c3d75eamr8723327wri.669.1664659296115; 
 Sat, 01 Oct 2022 14:21:36 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 x16-20020adfec10000000b0022a2dbc80fdsm6127688wrn.10.2022.10.01.14.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 14:21:35 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Oct 2022 23:21:14 +0200
Message-Id: <20221001212114.11912-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=2PZ9uuXLb2IvZX6okYV9TcZ8SzIsIkh44pon/n6k04c=;
 b=VDYYDKdK5t5Jk/TE6dawFDFr4kHEOFtbY7N76sJjPMia3UDEaCYm2Abs/ouCIr81jc
 f5i4dH/rSB+nzs5eHR1ZWR7vLLGxiCGm3s4DfTfYguhSm+yuXDwVwXsYshSCNGuS4pMX
 4aBaCTBpMnpWK45Aj5wPhxI1MyTo0lY8Rk7M0qnfANUTNBYW55bUeA8XR6rIvI/upnbF
 XkiWBel7srDiLpekuJith4loiO5z9HwT9BukWvp+YZEVe6ulJ3cpiDKzT8hxISW1V1gq
 SPZeD20JVmcpaj5ue702Ro4B35gnXariI6iLE461XYJOagfTTosJC4Ag8kt++UTkzkil
 Tg6g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VDYYDKdK
Subject: [Buildroot] [PATCH 1/1] package/bind: security bump to version
 9.16.33
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

- Fix memory leak in EdDSA verify processing. (CVE-2022-38178)
- Fix memory leak in ECDSA verify processing. (CVE-2022-38177)
- Fix serve-stale crash that could happen when
  stale-answer-client-timeout was set to 0 and there was a stale CNAME
  in the cache for an incoming query. (CVE-2022-3080)
- Prevent excessive resource use while processing large delegations.
  (CVE-2022-2795)

https://gitlab.isc.org/isc-projects/bind9/-/blob/v9_16_33/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/bind/bind.hash | 4 ++--
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 171edc8806..d41a9bbc5e 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,4 +1,4 @@
-# Verified from https://ftp.isc.org/isc/bind9/9.16.31/bind-9.16.31.tar.xz.asc
+# Verified from https://ftp.isc.org/isc/bind9/9.16.33/bind-9.16.33.tar.xz.asc
 # with key AADBBA5074F1402F7B69D56BC5B4EE931A9F9DFD
-sha256  8ca2cb6c37b605c70f7a25f0cf8a94d2040e025824db2341b92625efd96e7cfb  bind-9.16.31.tar.xz
+sha256  ec4fbea4b2e368d1824971509e33fa159224ad14b436034c6bcd46104c328d91  bind-9.16.33.tar.xz
 sha256  daf6f1eddf5983ed664a2d125b619e56e2e93917c19d0d41c7586ea153ba2155  COPYRIGHT
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index b1494d7596..abc3100e6d 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.16.31
+BIND_VERSION = 9.16.33
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 # bind does not support parallel builds.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
