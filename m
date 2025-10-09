Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6329CCD183
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 20:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21A0C613BD;
	Thu,  9 Oct 2025 20:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ts7GxnH1AxhL; Thu,  9 Oct 2025 20:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 927E8613A7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 927E8613A7;
	Thu,  9 Oct 2025 20:34:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B54C5226
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 20:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B2D9613A2
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 20:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wasb-TnJzRp0 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 20:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4950360ACE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4950360ACE
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4950360ACE
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 20:34:28 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-62ec5f750f7so2432754a12.3
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 13:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760042066; x=1760646866;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ncKJVhoIJDMI65tinVGsGRuuqwyEBek1k/6ok+6rdSg=;
 b=XJQG913oNugTBHrJ+yszClokSM7zDWTALCIE1geqJpXlCiKdesxj0iZsJkeH7H1Y/z
 LAAKtOcc9ZGaLNGiZ/JLDfK6WynRSviDyp+lmG5s5WusEDaYOLgPX33Tcz17jhzsDxI8
 siwrngC4uL8buYSHBkO67BGzl81pAswhi27zmfiTznHY275rwcLTEfUBiFo/lnnkC0ii
 4Ul5skPTDtWieCzVpCnkdhqV1KI/7gtS4N8p0r/R+WZRh8sB99T0avk6dSVYcFFYAW6k
 7qJRR3tWdwD3zVnU8hG6JLsLy8gg0w3cirIlmOUAhfPtpsnfEmr/H/3uaIVuN3Rd7Jli
 zxbw==
X-Gm-Message-State: AOJu0YyhXM73aS2N5AQ6QtQFZ7Vov0qnPcmWvNR63bO0uDK7BlA0/tzR
 57Q18LDCQL3yjXsxgK1vJI6nuNmKxkhIBG/1kWctkOJPjtl5F7nlJjlzeqIsbEUzBgkqd0DtTeK
 j2mso
X-Gm-Gg: ASbGncuzLYyvxZbkOHbmq6CUsjJHNXwe30IA5EIOjOMW4oNTek0DwFW9X7PWJALkjdF
 /Q5HFJSMnSJ26lyTu7oe0C5qD12RxeYr42jSmy+cAVquBzFT/28PUF2KkCGzG2gmDvwKPr85yof
 uwVnYsWjYrIp5zOwnA2XQgvHVl6RKIFg3sQq/0NxaQrpq+2zPyX7glH1R5t0YRcbmnZAKKtkfKr
 MPznFTRIgM1PF26Xs91t1KRa65l/f9cfAtS6/HYUWevvmN18k9C5cQtYvK7diemFPlmiMWYokOh
 McIJfXNqNopVNY/aJcKlpp+FRh0OqPczrXPBmOJAeI35q/YmosXmCa9iH1CRw5TEQF2b5xdrn9z
 6+muwNraApk81GNBdY3N/9bfbPtRVx4oERe03J3q2lo49QvU7VFs=
X-Google-Smtp-Source: AGHT+IGZYjbs9rgbL8D9g2u7jHgXbRCAnKVLQ1uzmJqYVN7k/wvSa5+cPiMl8LpjqHcpQj5Alde31g==
X-Received: by 2002:a05:6402:84d:b0:618:528b:7f9b with SMTP id
 4fb4d7f45d1cf-639d5c514a7mr7162281a12.31.1760042066534; 
 Thu, 09 Oct 2025 13:34:26 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63a5c322e91sm497826a12.45.2025.10.09.13.34.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 13:34:26 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu,  9 Oct 2025 22:34:25 +0200
Message-ID: <20251009203425.126975-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760042066; x=1760646866; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ncKJVhoIJDMI65tinVGsGRuuqwyEBek1k/6ok+6rdSg=;
 b=GSNEVj2BGROeRuJ81ktw5bplBhjH2BpFjjPfvjCym01g3LdTqvNLbv94Z7n/nTLY/Y
 1BuW9+e99JVCtZVrH5FHl7I1cmY+aVECWMqU8EGCe+9P2d0OexltK+vHYP1xz5Uubp9p
 P75dHDnkMjL0j5B1We8GJs0Izk9bRMlVKXNl9XXnCp68nMMSU1hfMSW0YCleFyqKsmJv
 Vwnzc1UTAKou9giPZ0H4yy+LxSG9GaR32+Qcs+f42dM5LXSYGqZOZYrGkzLWYEhpwvVL
 4nQLO/GR9jrseVzllI3tCBg9+XOKBmvYMW983964NC1bQNgMxnrafJ0T+BqXbLI5Kh1/
 5S6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GSNEVj2B
Subject: [Buildroot] [PATCH] package/suricata: security bump to v6.0.20
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The v6.0.20 is the last patch level version bump of suricata version 6.
This version is now EOL since July 2024 and other new vulnerabilities
apply to this package.

For more details on the version bump, see:
  - https://suricata.io/2024/06/27/suricata-7-0-6-and-6-0-20-released/
  - https://github.com/OISF/suricata/releases/tag/suricata-6.0.20

Fixes the following vulnerabilities:

- CVE-2024-37151

    Mishandling of multiple fragmented packets using the same IP ID
    value can lead to packet reassembly failure, which can lead to
    policy bypass. When using af-packet, enable `defrag` to reduce the
    scope of the problem.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2024-37151

- CVE-2024-38535

    Suricata can run out of memory when parsing crafted HTTP/2 traffic.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2024-38535

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
Newest version is 8.0.1. The following CVEs still apply to the version
6.0.20:

- CVE-2024-38534
- CVE-2024-38536
- CVE-2024-45795
- CVE-2024-45796
- CVE-2024-47187
- CVE-2024-47188
- CVE-2024-47522
- CVE-2024-55605
- CVE-2024-55626
- CVE-2024-55627
- CVE-2024-55628
- CVE-2024-55629
- CVE-2025-29915
- CVE-2025-29916
- CVE-2025-29917
- CVE-2025-29918
- CVE-2025-53538
- CVE-2025-59147

If someone that uses Suricata wants to bump it to be able to test it
properly.
---
 package/suricata/suricata.hash | 2 +-
 package/suricata/suricata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/suricata/suricata.hash b/package/suricata/suricata.hash
index 58ab0d93b0..ea5ba01dc0 100644
--- a/package/suricata/suricata.hash
+++ b/package/suricata/suricata.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  98c812faef466d337f107f13ae37843f1c719942b93832d70f1a2fd7ee1b5c2c  suricata-6.0.19.tar.gz
+sha256  c1515754924b618914fcb3cb98873af49996b920f2389a1998f89604f227a807  suricata-6.0.20.tar.gz
 
 # Hash for license files:
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index e60ed2fce8..8840853054 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SURICATA_VERSION = 6.0.19
+SURICATA_VERSION = 6.0.20
 SURICATA_SITE = https://www.openinfosecfoundation.org/download
 SURICATA_LICENSE = GPL-2.0
 SURICATA_LICENSE_FILES = COPYING LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
