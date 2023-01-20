Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ABBC25B4E
	for <buildroot@archiver.kernel.org>; Fri, 20 Jan 2023 19:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C69F41CD9;
	Fri, 20 Jan 2023 19:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C69F41CD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R1iceXKPltf9; Fri, 20 Jan 2023 19:31:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F32C41CF3;
	Fri, 20 Jan 2023 19:31:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F32C41CF3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 894BE1BF2BB
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 19:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 711BB612C0
 for <buildroot@lists.busybox.net>; Fri, 20 Jan 2023 19:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 711BB612C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cey8SvK-Cmz1 for <buildroot@lists.busybox.net>;
 Fri, 20 Jan 2023 19:31:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48AE0612C6
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48AE0612C6
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 19:31:19 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t5so5761346wrq.1
 for <buildroot@buildroot.org>; Fri, 20 Jan 2023 11:31:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hGFe3WXJPBVoG4hN5WHf8Ke4dH0KuQpeSMyJ5gkl7qM=;
 b=69Oy/aoZ650XeUAS8mFchLvXZwcymkjE7qh3j0bvN3p2pK7k0KgNYviwd704pszROq
 J4wqYvGuRIAOBwtf7mmy1aJeGszTekjoRpEqKwd2AiwrqOa/UrsN7cGZDOux+k7VhrC4
 y077olhXyFma8VxQReeMsWYZi0O5YU8hgAvVuHJtvXcSoUoZ9h9HsZVZC34B29to4vmN
 PhrRbxRIo5/PcJYuVJWxqFWq83vdltu799AUxip09RG7CzFlmZ9uFtKi1i0IlusFax33
 rqImwCfbKVCNVrN0/5enrE3XcMQfWRkQeTNKL113sueIos6MxsJvdJlVAr4QqvIqxLpV
 4byw==
X-Gm-Message-State: AFqh2kq6LF1XUloxLCi/Et5HZJYU3eClGO8us7kH8CD4fnj4z+64gHzU
 WmUhSmQqAjYanu1sh8FWykDYQyWMShs=
X-Google-Smtp-Source: AMrXdXsDotuuHiPmdtGSHNFCqNb32xmk+DmnUSHwrw0DYWePQ6b060jbMhESz+hAROPcoid+M2TC0w==
X-Received: by 2002:adf:ce06:0:b0:2bf:95cc:744c with SMTP id
 p6-20020adfce06000000b002bf95cc744cmr1257949wrn.0.1674243077226; 
 Fri, 20 Jan 2023 11:31:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 q16-20020adff950000000b002bcaa47bf78sm27128664wrr.26.2023.01.20.11.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 11:31:16 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Jan 2023 20:31:11 +0100
Message-Id: <20230120193111.9280-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120193111.9280-1-fontaine.fabrice@gmail.com>
References: <20230120193111.9280-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hGFe3WXJPBVoG4hN5WHf8Ke4dH0KuQpeSMyJ5gkl7qM=;
 b=XKhW3d6hmf7s8Syn8V4p12mj7SbmgWwJXi95ObPXynr2ei47y8XKfCXh2qwOz99vbv
 TFzQ8vbWf25jECHHIufTLU/EJ/kqt5kSqkbTlj7szYdij9OfonLyhBvPSBCmiSlZkrFW
 X9c+QN1lHZaer9JTbr+u3UNOWbIqV9egICRz2K1iaXvy1AQRh+kyjkkv6+NhJxOCtl9q
 +oQdvAZkw39cJ0KLbjRk7vflIIi4abpx+klo742143uFiwkzqINtvAU6YZqA+3H6ur6C
 OcP2V7FXH+d+sVIUw5eI+EAi7vx9dMqjgohIBSmFKpQaAZTf9Wbm9FT2f8/VMQFozOY0
 syZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XKhW3d6h
Subject: [Buildroot] [PATCH 2/2] package/c-icap-modules: bump to version
 0.5.5
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

https://sourceforge.net/p/c-icap/news/2021/03/the-c-icap-modules-055-is-released

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/c-icap-modules/c-icap-modules.hash | 6 +++---
 package/c-icap-modules/c-icap-modules.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/c-icap-modules/c-icap-modules.hash b/package/c-icap-modules/c-icap-modules.hash
index cc7949a092..110ffd4de3 100644
--- a/package/c-icap-modules/c-icap-modules.hash
+++ b/package/c-icap-modules/c-icap-modules.hash
@@ -1,7 +1,7 @@
 # From http://sourceforge.net/projects/c-icap/files/c-icap-modules/0.5.x/
-md5  2f8c174f7a5414616f5a0a976ac4a221  c_icap_modules-0.5.4.tar.gz
-sha1  ec7bb138d7775895cd8b2e12adc41dbf48eba1b7  c_icap_modules-0.5.4.tar.gz
+md5  ca6d5d124a4668d63affcaa5ab083e57  c_icap_modules-0.5.5.tar.gz
+sha1  67be484a93fe662a7735ee06e1d34d82b54469a8  c_icap_modules-0.5.5.tar.gz
 
 # Locally calculated
-sha256  87409920c66027204e9cca5f20e137b63cd12daf6dfcd85c1fa62ab2bd1c57cc  c_icap_modules-0.5.4.tar.gz
+sha256  6a42f1fdd8c35ad38d29f7d3c10f925471977f217086352e146cf95e45f2b5b5  c_icap_modules-0.5.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
index 2eaa141afe..e9bbbdb284 100644
--- a/package/c-icap-modules/c-icap-modules.mk
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_MODULES_VERSION = 0.5.4
+C_ICAP_MODULES_VERSION = 0.5.5
 C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
 C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_MODULES_LICENSE = GPL-2.0+
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
