Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 052C1E77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 13:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C603B809F5;
	Mon,  6 Jan 2025 13:46:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HG7cqsk16tz; Mon,  6 Jan 2025 13:46:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D047E8087D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D047E8087D;
	Mon,  6 Jan 2025 13:46:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FDA66B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5069A403CD
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:46:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9pYNWnTrtCN for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 13:46:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F36A8403C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F36A8403C7
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F36A8403C7
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 13:46:07 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-540201cfedbso470029e87.3
 for <buildroot@buildroot.org>; Mon, 06 Jan 2025 05:46:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736171165; x=1736775965;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iJ0ZOjkYYB5GwVILRJwkf6lwygeYF5V4Yw66GEUjk3c=;
 b=ev/Z+h1U9OdMf5UrfeYPsyS7+dnbcqRfUw8h2BGRDW8+OHzjOwDU6C9V+aqJFyuosL
 sS0ZdSWuxwRh3kh1IBgl6OSq3zNvwrSZOb7tLQO+ws8rm3eUxW03CAbwrWefO3LM/XxM
 /Kn5huPaS66RRvDBBzPeBTly2hp8SF3PrPKPANIcuZXzoydP0LYs5UgblsT8H/bjeAR2
 jPK5W4Cvaurbzvvr5F8H2qddJa7KnkXdMjHL4Ig5MPQvmKXGrTfpCnQwjq+CXsknJpYF
 rRFQyli3akxFTOSJlGUBcmDpAG4zLJ51o4T6cWw063ppaQmm6kWLthiIkftchwhX3nfx
 R+TA==
X-Gm-Message-State: AOJu0Yyb3Imf7nwKI3C8hWnoVyWozH6oAs4uW2lp/P6lPCYVYmNHZlZF
 kQvzJhB4qAavvSB2RiqAeEKrcgWWeR6D+zA+ZUmudQ57OLsxPI9i5QgTP5k1
X-Gm-Gg: ASbGnctyw2kmF8AQ3Yz/ddX88o9ldn86afNTkEnongEhIWzhymOMyTchCd9iFbiOLFb
 DLH8vLWNsTyq7JDjeH+MqX8y1Vjpka2AVwg7VERc3ZHORCrxkcGlMC3hQTrIb+gK7w7vFBSbB2C
 ZxBBW3UdHZ32l5lhDBMU7ejbJyxwcFVdVhJ2QNU1KBwVugidroR1tVVJicAk7G24JlHJSOKbW6r
 1WNEybTYZefcfacN9U1eWDQjQ15s6RPuqU=
X-Google-Smtp-Source: AGHT+IEF3EFA3jnBVoXueQ2QDUAmPmZf/G40sYbb0mIj2/Wd+Sai8RkoIBMe6E950mluIyAvKnYBoA==
X-Received: by 2002:a05:6512:12d1:b0:540:1b41:c765 with SMTP id
 2adb3069b0e04-54229598b36mr17645485e87.56.1736171164981; 
 Mon, 06 Jan 2025 05:46:04 -0800 (PST)
Received: from gimli.lan ([2001:9b0:214:3500::e19])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422381383dsm4969652e87.161.2025.01.06.05.46.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2025 05:46:04 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Mon,  6 Jan 2025 14:45:54 +0100
Message-ID: <20250106134554.2668609-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736171165; x=1736775965; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iJ0ZOjkYYB5GwVILRJwkf6lwygeYF5V4Yw66GEUjk3c=;
 b=f8yPGo3htbYOAdcDJH7tm+wF+qCQXia8l6jZtCO7vJPY1NlfYe5gDWKgJ5xNhcbokF
 skES7ZtoZV11z3ZDlKEJhcJqw1iKGmG54+uHIDXxOpi4pbTBFrweeYA5SA7697aO9Pr7
 H+ZP4jXmOIcDKQql1HiBzN/sFVnZjc46naIlwigP9yvwumFIYXD1/VYzAch4nZjRSFKJ
 kld5K7QafNr/1E5rv3FDQ1JtucY5DFucnqAGrzCGQEJihWWTUAIaUB7V+sgpcverpxYQ
 U1v8iaCHPqxMOXF311YsiwN+Y67UMKe9PXE5I/rnpeSAO8/mL8kfo8f4FLW7x2+vL37y
 W0CQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f8yPGo3h
Subject: [Buildroot] [PATCH 1/1] package/sysklogd: bump to v2.7.0
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

From https://github.com/troglobit/sysklogd/releases/tag/v2.7.0

 - syslogd by default now cap forwarded messages to 1024 bytes. This can
   be adjusted using -M size or the config file setting udp_size
 - syslogd socket buffering has been reduced from 160 kiB to 80 kiB
 - Allow slashes in process names to support, e.g., postfix/qmgr
 - Support for extended message filtering based on tag/ident, hostname,
   or message property. This allows sorting of messages based on their
   origin (program/remote) or content in any of the available message
   fields: exact match, case-insensitive substring matching or extended
   regular expression
 - Support for remote logging to a multicast group, as well as acting as
   a multicast group receiver of syslog messages, both IPv4 and IPv6.
   Forwarding to multicast groups support two new, per action, options:
   - iface=IFNAME to set a different outbound interface
   - ttl=1.255 to adjust the TTL of outbound multicast (default: 1)
 - libsyslog.a support for egressing multicast, two new struct members
   .log_iface and .log_ttl control how the syslogp() API works
 - logger support for controlling egressing multicast using a new command
   line option, -o iface=IFNAME,ttl=<1..255>
 - syslogd now logs the hostname as the FQDN in RFC5424 output format
 - Fix parsing of IPv6 addresses in listen .conf directive, as well as
   command line option -b [A:B:C:D]:PORT

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 5 ++---
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 8b1cd63a73..4024965e23 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,5 +1,4 @@
-# Upstream .sha256 from GitHub
-sha256  40a3bb593d7507e49a4379f48ae8a9bc4b68dcc583efcdbf3b9056128442c92a  sysklogd-2.6.2.tar.gz
-
+# Upstream .sha256 from https://github.com/troglobit/sysklogd/releases/tag/v2.7.0
+sha256  6ab74ab5001121bb32697fd2f7ab3cc4b4452c3f721677e06e5b60982a04d0cc  sysklogd-2.7.0.tar.gz
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index eeb3a3748d..e8b7fe2062 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.6.2
+SYSKLOGD_VERSION = 2.7.0
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
