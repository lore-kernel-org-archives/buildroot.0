Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B4DC3ABC9
	for <buildroot@archiver.kernel.org>; Fri,  9 May 2025 23:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A54B41692;
	Fri,  9 May 2025 23:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TA1sxLN-uVN9; Fri,  9 May 2025 23:09:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A252D41694
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A252D41694;
	Fri,  9 May 2025 23:09:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3A49154
 for <buildroot@buildroot.org>; Fri,  9 May 2025 23:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4B7383CF2
 for <buildroot@buildroot.org>; Fri,  9 May 2025 23:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JusPqbPBVYZ for <buildroot@buildroot.org>;
 Fri,  9 May 2025 23:09:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2a; helo=mail-oa1-x2a.google.com;
 envelope-from=rdkehn@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D58C883E48
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D58C883E48
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D58C883E48
 for <buildroot@buildroot.org>; Fri,  9 May 2025 23:09:11 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-2c2544716feso416281fac.1
 for <buildroot@buildroot.org>; Fri, 09 May 2025 16:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746832150; x=1747436950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cbqPxh4fBWa2SJvZ/q5pE0m8Jjn4jf/Z5Lpp2Jnbd6I=;
 b=nYAsPJ2TQc8gu6BJgDMxxBitTeHl7hw+CAVq/cNJ4V6Ry43mf5kzVxAne1qEA7TYw5
 h6kwYr8KW4Zs8jXZ/aOoNt0WmfJnv9r82CRo5613o5s8uSwnTXQ7DjmY0ILCcMbS3uyK
 yvt1s6K/QgXYIyXVVw9zNawmuFUclRsEvWo2qtJX/VO5mB1Awq+hILbQtAaHvQUKvS8G
 pkrOAEJI9pfwnstIqyavp0QIqp6WBugpcJFH/kaenKidM+BuLhjOZVznR5F6zsCtuX36
 odc3+pPYzBXJnr2e5C5xTBQ+JnywK6koUguhW9Gy9b0AFqDX2mKSCZoO8WEd7ybtWV2D
 Z4lw==
X-Gm-Message-State: AOJu0Yz6TltQjnVzMGZdLOhZO+4lZvuZ8l9DinzDEqKvw4XK0pYkScpw
 itM7lA/ctK9XwaflKX1e8a+JttFwPRksqhTN+vxS+GtNfRYjnFbNMklCd3d3
X-Gm-Gg: ASbGncubNG2tzcXSNHnpJeePgw4xhvQp6D14d5bdlRh+WxCefg6vmcOsm7Smimt96ap
 IdbHWNpa4r5Pg7aBsAnbYSHv0gsqGcX3TuGVzUL6Jr/h3ixKC6Ixh+27O/cVKPoGLkGj+C15zN2
 CTQTLSbd/viaGyDnV34LQc12/zJzuzJM9ErICMi68W19ad+7pYXNjfx8okEWUEzBlvjI4ihaFW6
 VByYNbH5D6Jmvc1KgZgTU8iq4NJeWef3foFZIdZunvSNrCXD4qb4s69A3GzKcobrhhxDdH/A7jz
 DIWIbRNfdH2VwBrR+lboa0D1KOVNZMhGnnw7aHyThgTjF1vF0uT61lC3Yja543wpzLBjV7CwyBi
 x6JM2M82pDbFOABUgoLbVWae+H6o9JB6hHW8=
X-Google-Smtp-Source: AGHT+IFI/hKSc4nnuQmBMO4E66P43SbRZ4G7cwqHhYbJj/Dnqk47yoSsAEdmkpJ0hZpVOJYH/osH3w==
X-Received: by 2002:a05:6870:af89:b0:2d5:d5f:3b12 with SMTP id
 586e51a60fabf-2dba42a0bb3mr1118461fac.6.1746832149845; 
 Fri, 09 May 2025 16:09:09 -0700 (PDT)
Received: from archlinux-DESKTOP-IPGM1GV..
 (72-48-206-228.static.grandenetworks.net. [72.48.206.228])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7322647f29csm724291a34.9.2025.05.09.16.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 16:09:09 -0700 (PDT)
From: Doug Kehn <rdkehn@gmail.com>
To: buildroot@buildroot.org
Cc: Doug Kehn <rdkehn@gmail.com>
Date: Fri,  9 May 2025 18:08:43 -0500
Message-ID: <20250509230843.334094-1-rdkehn@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746832150; x=1747436950; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cbqPxh4fBWa2SJvZ/q5pE0m8Jjn4jf/Z5Lpp2Jnbd6I=;
 b=kByE4XcmaTaRdCczT2A0NzUKRO5UQyACtEU9dnpelh8oFHp1duZi3gaz3BL5OnFGl3
 zJUW98l3kZQ/n/tcBtpIHmjikIfNSWsVXa2H+VdoS24UlAfFsvhwu9GKe766wdJiD4P8
 HZVUjhN2O8bgKHRjJ7N17eIdTG72aDGxVd4pMDfVizZwYKV6FevWx3ukVTxqOTGTYJO9
 xCVeWTJe3WNnQPpjsD7r4npcy/KFMgh+jmJEKQMuVjteiy/NW2O8U+5rGEA21jDfqo+J
 wUhWu+4lOoAgNOwyDe28ducYN6rMtMv+Ytq3pNfgCVrziI3gcM88YP1npuIiNnCA/SLo
 +J8g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=kByE4Xcm
Subject: [Buildroot] [PATCH 1/1] package/nss-pam-ldapd: bump version to
 0.9.13
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Doug Kehn <rdkehn@gmail.com>
---
 package/nss-pam-ldapd/nss-pam-ldapd.hash | 6 +++---
 package/nss-pam-ldapd/nss-pam-ldapd.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.hash b/package/nss-pam-ldapd/nss-pam-ldapd.hash
index 3286f127dc..868c737ab3 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.hash
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.hash
@@ -1,5 +1,5 @@
-# From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.12.tar.gz.md5
-md5  cc30ee0ab91d6c94b7a343ae09b5dc69  nss-pam-ldapd-0.9.12.tar.gz
+# From https://arthurdejong.org/nss-pam-ldapd/nss-pam-ldapd-0.9.13.tar.gz.md5
+md5  f6fbb61e537029804c401741ecb76224  nss-pam-ldapd-0.9.13.tar.gz
 # Locally computed:
-sha256  c6d661e74693cbf531a790631ca93b73f291fb23cc39465b09deb8da2bfb0e14  nss-pam-ldapd-0.9.12.tar.gz
+sha256  e01784e17cb533bb66bd0601e205e785263445c3c2df7a6f90232ab4131c716d  nss-pam-ldapd-0.9.13.tar.gz
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING
diff --git a/package/nss-pam-ldapd/nss-pam-ldapd.mk b/package/nss-pam-ldapd/nss-pam-ldapd.mk
index 60f6328496..92f9ef079e 100644
--- a/package/nss-pam-ldapd/nss-pam-ldapd.mk
+++ b/package/nss-pam-ldapd/nss-pam-ldapd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NSS_PAM_LDAPD_VERSION = 0.9.12
+NSS_PAM_LDAPD_VERSION = 0.9.13
 NSS_PAM_LDAPD_SITE = http://arthurdejong.org/nss-pam-ldapd
 NSS_PAM_LDAPD_LICENSE = LGPL-2.1+
 NSS_PAM_LDAPD_LICENSE_FILES = COPYING
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
