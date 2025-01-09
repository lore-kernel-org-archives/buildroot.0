Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC85E77197
	for <buildroot@archiver.kernel.org>; Thu,  9 Jan 2025 20:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74B1960AD3;
	Thu,  9 Jan 2025 20:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiEI-tbOnNXS; Thu,  9 Jan 2025 20:47:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2302E6076C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2302E6076C;
	Thu,  9 Jan 2025 20:47:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13AE676C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01F91605C3
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kV2CPO7UFw7A for <buildroot@buildroot.org>;
 Thu,  9 Jan 2025 20:47:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 147156076C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 147156076C
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 147156076C
 for <buildroot@buildroot.org>; Thu,  9 Jan 2025 20:47:54 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-844e394395aso42348339f.3
 for <buildroot@buildroot.org>; Thu, 09 Jan 2025 12:47:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736455674; x=1737060474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MZP+JgCD0RyHdAopmNl68i98OQZkuwlX0XyX0digYag=;
 b=mzqaAzd0vbTTXlYyudeoWS1FqRB+0LQdzNyQVpzlZ/SEm3ajXrERwm2l+qOQgjJ+wU
 wvhYgW329btVMjWklxS86JxfGYtV/7lcQlmkdcfDYtHPdCtik3kXClxDN+9FkjjpL6Vd
 QkGYZmgyHo9DzCjfVmnVSJexB/FbdWPVCnnLyu6YcH/43r0YQGjhZVDSpWiQxWBZ2pnf
 PqDlzA2XhU8qgEWIgJKbzfigejTa3FeGmlUz7pdPibXeTUqfwB6/pv48HzvNTgLnpvps
 1qj+1C995Z1+2zXYBpjwZQHQ3JkOGDTrJcMaTrlv0zYPkKR+raV62Sfq6eXGm90gmKER
 Ij7g==
X-Gm-Message-State: AOJu0YzmoTa+QubZ4KcubVla1DfpgtHNMNkFVCgnff7YjZTA5enMZmnm
 5m7mVa3ozLIoaWh/HUhEBW7UX6rEz9Wdi2ycCaP0jFQN0/6N6OUBHqIP7UIEOns=
X-Gm-Gg: ASbGncvGeVBtb14WJOsz7KfY/NPBCxnLnIDDw3wB5xWHozM9fXerC8OaFjUnDmIcvW7
 +nocXr54HcHoFYAkYzTJ2TKR3SaDUWkXUPjfClD3kNvLvTomRBw7T634MBGNQdgaPq9eFf8nvbH
 PmQt2iZHHq+n6T3xdVv70g9S3WKuxz6rV2/Gp+mqiatuGIX0611GqeizjNIxcwfoJP1dwKiX1xx
 439DCTD0Uk1R2dH8V+bklhaLTtgFuKcUKQQXpstyXqH6yuoaw8hmJtyfCnQGnRyPe/rOPIW4N33
 K9yrCdS5bczqxI4/GBkq/vYAHgDUIVk=
X-Google-Smtp-Source: AGHT+IG5NgAw6Rh8RsDmrT7RsOJ42eB1fK0uupjYh/X1t+v4STYOb7Hns6xzslVKEKkM54ACBfo3SQ==
X-Received: by 2002:a05:6e02:308b:b0:3a7:9736:501e with SMTP id
 e9e14a558f8ab-3ce3a9d0941mr59873265ab.14.1736455673935; 
 Thu, 09 Jan 2025 12:47:53 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b7178dcsm494880173.104.2025.01.09.12.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 12:47:53 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jan 2025 13:47:52 -0700
Message-Id: <20250109204752.2391765-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736455674; x=1737060474; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MZP+JgCD0RyHdAopmNl68i98OQZkuwlX0XyX0digYag=;
 b=aG5YSB0NJ+ShyIlF/i3UBG8EDFmNwvqbzM6XqCGxXpu735PWRVrW7Zul17cqBtx9GN
 xMKIraJX4jsq053X0AE3AnyXMsCAOIj3EaGwU/8fiaC6WQW07OCBoPG5Kw2HojZAsDGm
 FXHsr0lqn+pOGqzgdGc3ritI89K06IlRRvqV3gjBomPzRmq5LY1DasBd7110w73HLHE8
 BBpWQSRhj4rD1b2scEMBcjwuUHBcF28uDCvu8V1c2JvoDI1sFdBbWL8HIp98tMK9iDgg
 BOXQHOu1G9I0r5NCS34GeJZ25/Bh8REH5L+Mo5HFeUONJctiKG1SkowQmXXRA1f62urJ
 1KwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aG5YSB0N
Subject: [Buildroot] [PATCH 1/1] package/python-dunamai: bump to version
 1.23.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-dunamai/python-dunamai.hash | 4 ++--
 package/python-dunamai/python-dunamai.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dunamai/python-dunamai.hash b/package/python-dunamai/python-dunamai.hash
index a2a92b8699..9c0fcc1810 100644
--- a/package/python-dunamai/python-dunamai.hash
+++ b/package/python-dunamai/python-dunamai.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dunamai/json
-md5  1b3ca932416961ea6953dbbc21e6d42c  dunamai-1.22.0.tar.gz
-sha256  375a0b21309336f0d8b6bbaea3e038c36f462318c68795166e31f9873fdad676  dunamai-1.22.0.tar.gz
+md5  5aa5f8aa470a4e8f67430b1a8a6ff801  dunamai-1.23.0.tar.gz
+sha256  a163746de7ea5acb6dacdab3a6ad621ebc612ed1e528aaa8beedb8887fccd2c4  dunamai-1.23.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cd75c5564078e3aadf662a9df3d23430f4705dfeedebbd0ebbeef53998ad94a8  LICENSE
diff --git a/package/python-dunamai/python-dunamai.mk b/package/python-dunamai/python-dunamai.mk
index bd6c71fd6a..ba422f5b2f 100644
--- a/package/python-dunamai/python-dunamai.mk
+++ b/package/python-dunamai/python-dunamai.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DUNAMAI_VERSION = 1.22.0
+PYTHON_DUNAMAI_VERSION = 1.23.0
 PYTHON_DUNAMAI_SOURCE = dunamai-$(PYTHON_DUNAMAI_VERSION).tar.gz
-PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/a0/fe/aee602f08765de4dd753d2e5d6cbd480857182e345f161f7a19ad1979e4d
+PYTHON_DUNAMAI_SITE = https://files.pythonhosted.org/packages/06/4e/a5c8c337a1d9ac0384298ade02d322741fb5998041a5ea74d1cd2a4a1d47
 PYTHON_DUNAMAI_SETUP_TYPE = poetry
 PYTHON_DUNAMAI_LICENSE = MIT
 PYTHON_DUNAMAI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
