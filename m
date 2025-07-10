Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60EAC83F24
	for <buildroot@archiver.kernel.org>; Thu, 10 Jul 2025 11:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8690782F06;
	Thu, 10 Jul 2025 11:28:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ms7LbbOjc-6a; Thu, 10 Jul 2025 11:28:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B17D480E7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B17D480E7D;
	Thu, 10 Jul 2025 11:28:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FE5F69
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 11:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35F6A60F04
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 11:28:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZxLo3IyvXdLZ for <buildroot@buildroot.org>;
 Thu, 10 Jul 2025 11:28:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=tim.soubry@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4303960B17
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4303960B17
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4303960B17
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 11:28:53 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a531fcaa05so467413f8f.3
 for <buildroot@buildroot.org>; Thu, 10 Jul 2025 04:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752146931; x=1752751731;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mY7sxzhmT6O1HQuIvb17scgctsqh5kXpgM6sgFflA7g=;
 b=qDviTzotYadUdIbwkwCvE6rI/12kUlV2HqebGvjSnZM+rbI7V8FZNYBjDlkfZJJkOi
 hDafArdqdAbWFL4M2aWM9m7lfBTECCjSWSn7+unkxCw67xduZoeswQiOUzDBhYjiVkmY
 dWXYv+rm/ewyG+t0uypo8biADXYehoEgapqY8FLb9IxwHRtc1ku/r+MGR7HiDm41Q6/G
 CToYdbbIHgMMOA+QgYU2qlrhxA0zaComT+LaDjE6A9El9D5M5Ji800Wrxy/dc3L1WHDR
 OmQht9N7yQ2IUVKli9AzTGUXKYWjluiUIAncWapoxfHIPh+/ekh+yYKJEp9jQEMoK0MX
 98Jw==
X-Gm-Message-State: AOJu0YwFBemgI+VtDFtwoC7WzA11ApfQfyEBvYwOM68XuI7V0V0NXLp8
 5uoxNjSWL3o2fSNVMFMi6SUbB938vAZ8IvVTYgJcOEfa+w9iAFejhIZV2cSRNgMErc064gdHq2i
 4emXYegg=
X-Gm-Gg: ASbGncueX7x+Vj0mv3+SWYztFeD42uWCoPyidYuTYgfjB255JCIM10vHodPJUQ+gQXc
 4KMmuKv6P8RfREz+vPSqIU93wygFP3tWBJAnK25PCy78NKwhEJxLMtQRui5zqx+MqUmY5AmDmiX
 IM4tgTOiYyGMQlecmSjp1bAcgjEq2arZ6/HLtrUTXUIKnPEliDn2NdE2fqkDa8Ssn2KEpP8U9Fh
 O7dPySB4p9KCyUPohU1bA4q9pd8ErvaJK86I82yg+5C9JbHGt0GnDX/ns4sKqL8jLwiLkdJpw/I
 Rqsz2FU47q2tAQWIWHoYFPvDj6HLUsGpM7EaRh7CXzh3iPls+HuObTWr8AyywZlm7b2/jqVVSWr
 Lj1dfkeq72dzaY6c5Jsq3SgyVpXRHQOF1lysb28BgKAvQ8/nik0A8SS6XZw==
X-Google-Smtp-Source: AGHT+IGMiWBH1syCda8ZpR94WDQklgZPI0i7wmrk5pNYISS5EWtPgfkR1UUubrBDv4XeWBnTRrP+Vg==
X-Received: by 2002:a05:6000:1886:b0:3a5:39ee:2619 with SMTP id
 ffacd0b85a97d-3b5e86cf341mr2130211f8f.47.1752146931455; 
 Thu, 10 Jul 2025 04:28:51 -0700 (PDT)
Received: from TimMind.telenet.be
 (ptr-377wgeyf4tq7vco44vbx.18120a2.ip6.access.telenet.be.
 [2a02:181f:0:4023:f979:8572:d806:db9d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d5easm1608263f8f.48.2025.07.10.04.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jul 2025 04:28:51 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 10 Jul 2025 13:28:49 +0200
Message-Id: <20250710112849.341011-1-tim.soubry@mind.be>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752146931; x=1752751731; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mY7sxzhmT6O1HQuIvb17scgctsqh5kXpgM6sgFflA7g=;
 b=QLknWEtpcQLFIUCfn1tbwAa3PRXAXFO+o7nHKw6Jb3q5FyR+8z8CfGRz/cT9Rsbzu1
 aiqeKw36JN4VW2J1FlBDbAAkApfjrlVxF+gw75jZabYvkYDJIzbTzdJXu3WgM/umYEbA
 V7Fdyllk68Hb076YPLpSbwVwpuSuhk5T0rP6cM7BGNhQOTxtRRdkewxjaVW9p/faOugi
 Qn4OG8f0hC2WJb6NS5Trf3o7gOfrHMjz6o8iXEp3wRPfH8tFYiY3B+RT20z/eYZwnG0/
 sICDxuYb2a5+WtgBDWuoGOuAIHk7A1Ffv89K8dThU2VcHyxytQhikIXG/lbhEzDt2m6T
 5tTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QLknWEtp
Subject: [Buildroot] [PATCH 1/1] package/libhtp: security bump to version
 0.5.49
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
From: Tim Soubry via buildroot <buildroot@buildroot.org>
Reply-To: Tim Soubry <tim.soubry@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a potential Denial of Service as described in [1].
Release notes:
https://github.com/OISF/libhtp/releases/tag/0.5.49

[1] https://github.com/OISF/libhtp/security/advisories/GHSA-rqqp-24ch-248f

Signed-off-by: Tim Soubry <tim.soubry@mind.be>
---
 package/libhtp/libhtp.hash | 2 +-
 package/libhtp/libhtp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libhtp/libhtp.hash b/package/libhtp/libhtp.hash
index 1809bc93a3..2e93586f7a 100644
--- a/package/libhtp/libhtp.hash
+++ b/package/libhtp/libhtp.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  7f0719732fd0c82f9915e3df27e31548798590ad624fbad24f58b50885248ab8  libhtp-0.5.48.tar.gz
+sha256  214395f8b42011154e133dfb4e94d15e4e3e3e12535e744a4c1eec8687d12c18  libhtp-0.5.49.tar.gz
 sha256  87c93904e5434c81622ea690c2b90097b9f162aaa92a96542649a157dbf98d15  LICENSE
diff --git a/package/libhtp/libhtp.mk b/package/libhtp/libhtp.mk
index 8735f593d9..bb6559bc92 100644
--- a/package/libhtp/libhtp.mk
+++ b/package/libhtp/libhtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHTP_VERSION = 0.5.48
+LIBHTP_VERSION = 0.5.49
 LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
 LIBHTP_LICENSE = BSD-3-Clause
 LIBHTP_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
