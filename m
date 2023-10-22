Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6574DCDB474
	for <buildroot@archiver.kernel.org>; Sun, 22 Oct 2023 20:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 006D3403A5;
	Sun, 22 Oct 2023 20:34:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 006D3403A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqPxRs6bX3go; Sun, 22 Oct 2023 20:33:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A44D940399;
	Sun, 22 Oct 2023 20:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A44D940399
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5938A1BF40F
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 20:33:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32BC160ADA
 for <buildroot@lists.busybox.net>; Sun, 22 Oct 2023 20:33:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32BC160ADA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Fj8rTsaZYA4 for <buildroot@lists.busybox.net>;
 Sun, 22 Oct 2023 20:33:55 +0000 (UTC)
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2E20E60AD4
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 20:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E20E60AD4
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c515527310so37022071fa.2
 for <buildroot@buildroot.org>; Sun, 22 Oct 2023 13:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698006833; x=1698611633;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2sSr3KuAGCF/50oLQAfA7KocrTEPXonDkE/Ye+Apsgs=;
 b=GjYqf50SaM/cEWYAYOQo+4Q06S2ZiPoN8Vw8PCJ9nCqZU81YovNJvPuUdAb3TdlxTS
 uCnIKOnVM3JX1TcNffxdXFW0np8lnSHVjMz32fzHxvKsjf6x/gILFFTi2oCD73I5VWPu
 5yJO7jP9RJ6qPFMWREloq0cNoVdacccWweJHvJaCjvxq/W6l13qmV6G0TQlu4wCdtnOB
 QyyQ1RDkqmy+nKKbUH3PKodTIw/f/pSV7bhJg1T8XDE2XFeF4J2d7rREs3Fr2hrGXVso
 Ryn2BfkxGipYOqihspvZZs2OlpyEsVZiuMY+oRvecJ0feBvzVG2MCviNCMWg70c7odOf
 U0uw==
X-Gm-Message-State: AOJu0YzPIf2I6OYPq6FycYwYWG/cYPIpBmIWtJhHBXpZdgooxoKdsHkl
 crGzSrPsHsySkzhzdY42HXxfbgyFhNI=
X-Google-Smtp-Source: AGHT+IEAKAkoUK2tCSSXhfYOmXuhiJzHg1caqRLg8Mv0rK9Er09UzLFSd8ChusSSLiwu1bGF9cISSQ==
X-Received: by 2002:a05:651c:220a:b0:2c5:12c4:9f1d with SMTP id
 y10-20020a05651c220a00b002c512c49f1dmr5893026ljq.2.1698006832533; 
 Sun, 22 Oct 2023 13:33:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 y34-20020a05600c342200b004063977eccesm12491795wmp.42.2023.10.22.13.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Oct 2023 13:33:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Oct 2023 22:33:48 +0200
Message-ID: <20231022203348.55926-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698006833; x=1698611633; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2sSr3KuAGCF/50oLQAfA7KocrTEPXonDkE/Ye+Apsgs=;
 b=XK8nbvqOp7SMkg931EBVSF2s8Y6YpNGUvJx1q3Jzf+IOBIYkufmhA8CQQT3voZysJT
 twG4+87knJlVSahWcf52omH8Zh9Z/bd/St7OeQYJy/WHoTEiWXuVoAgCL0b84Bo49D81
 Vf5jukza0H/8vpBo3WU6Sh0pyQMLVtxsrKXVAzA8Qei/sBA4Qnepq8Vkzg1bQa5+bCT4
 OHz08p/xGdTvdYvhUaJZsWZWsjz3uVAuCxNNeBZyfgHGumfW4Cj00POc1j5YqlgQNZGN
 KVjS1J0Hk8/ZGoNhpRaq0egyU3oOX4XH9GTMpigL3KfNnJ05SPGYg5MMph/OW7C6dzIr
 tmTA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XK8nbvqO
Subject: [Buildroot] [PATCH 1/1] package/wireshark: security bump to version
 4.0.10
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

https://www.wireshark.org/news/20231004.html
https://www.wireshark.org/news/20231004a.html

Fix CVE-2023-5371:
https://www.wireshark.org/security/wnpa-sec-2023-27.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wireshark/wireshark.hash | 6 +++---
 package/wireshark/wireshark.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireshark/wireshark.hash b/package/wireshark/wireshark.hash
index f044f99483..c9b693c9cb 100644
--- a/package/wireshark/wireshark.hash
+++ b/package/wireshark/wireshark.hash
@@ -1,6 +1,6 @@
-# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.8.txt
-sha1  8ca1cc4471d0cb835cd5216833c393fa23bc154f  wireshark-4.0.8.tar.xz
-sha256  16663585c0ffefd5593a6628d4a20cc8241b9703b11283cfe71ead2b750888c8  wireshark-4.0.8.tar.xz
+# From https://www.wireshark.org/download/src/all-versions/SIGNATURES-4.0.10.txt
+sha1  830ba7ff602da90323bbc5ec15941c0878d9ee4a  wireshark-4.0.10.tar.xz
+sha256  b2e3ff03fa2be9058a9ffbedd12b0a670433bd16c8cc6c432ab48dabc2df1898  wireshark-4.0.10.tar.xz
 
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/wireshark/wireshark.mk b/package/wireshark/wireshark.mk
index 500bdbb77a..2f563950b2 100644
--- a/package/wireshark/wireshark.mk
+++ b/package/wireshark/wireshark.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRESHARK_VERSION = 4.0.8
+WIRESHARK_VERSION = 4.0.10
 WIRESHARK_SOURCE = wireshark-$(WIRESHARK_VERSION).tar.xz
 WIRESHARK_SITE = https://www.wireshark.org/download/src/all-versions
 WIRESHARK_LICENSE = wireshark license
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
