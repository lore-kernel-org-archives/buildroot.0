Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2712E95A91
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 14:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5045611FA;
	Mon,  9 Oct 2023 14:34:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5045611FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QKGm7xDUkt96; Mon,  9 Oct 2023 14:34:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ED5F60AED;
	Mon,  9 Oct 2023 14:34:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ED5F60AED
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B373E1BF314
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97F6540308
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:34:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97F6540308
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1XZH1xnuwDeY for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 14:34:53 +0000 (UTC)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4BDE6402D4
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 14:34:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4BDE6402D4
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5362bcc7026so8192933a12.1
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 07:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696862091; x=1697466891;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eDqzpr9bTz/pacmXT9ZLNn9hR9+0dn1vyuiGQAxgwq4=;
 b=MIuEk9Uiu7VFDl+4JalsNLCZY8Vh6i4hu1+BB4qkLPE9O28MK4XHO41rSdvrMEevJv
 ZBnROdtP+mtvLfhq42GiF9jGTN2OgDXmSHxSKOeETCQi8g1VstM/YGUBsa+V6Y33MBw8
 LjsS1mvNC2IpjhhfXJc1RKGkNbYr750fhGitV/g+7CRv31ln5NWyZPKyPevT/VwoQC2C
 2AysR0K9754BGe1X2HVAma10QegGXrqA6iquvlPpmvluuGdKIWwJbFQb2J56YCrrGO5R
 yCecBq+lD0jg3ZluPLpZWqYrv5Fh/Qa+hUguOzbEaXxWYyRCwoN5UzMlSbvKupKzT8Zy
 0Q8g==
X-Gm-Message-State: AOJu0YwlkXEPf0UM9nLKoRYsHiPyY+W2O/1bCe/EhaMeohA7ww1lB1zr
 jsDROzlPReCayN5qekT+xXc7J45Hr8ElosMa8zEflA==
X-Google-Smtp-Source: AGHT+IFRXddSDuV7t9jXNN01wWF1m0a//snPtPW/uxNivpGpGb5Gp5XL1DIumfI4Gw+p5ByEIe2dzA==
X-Received: by 2002:a17:906:1d:b0:9b2:9a0e:9972 with SMTP id
 29-20020a170906001d00b009b29a0e9972mr14391961eja.13.1696862091122; 
 Mon, 09 Oct 2023 07:34:51 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 jw5-20020a170906e94500b009ae6a6451fdsm6818731ejb.35.2023.10.09.07.34.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 07:34:50 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 16:34:40 +0200
Message-ID: <20231009143440.1776155-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696862091; x=1697466891;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eDqzpr9bTz/pacmXT9ZLNn9hR9+0dn1vyuiGQAxgwq4=;
 b=YPEKuHNaSoCo8aGEAT7XARSo2NNXP2wcUhda7bGVTVrt5092Ewfs996Gly0Taijihm
 T/Ck6ItCBeC83mYMEk9t6Tojrx0HtZXM+6TR6pNH8LJCV8tYQxzNeiLwUTY7yUfpdAm8
 e24l+6mqpDX4p/rSVZajGwKuC2b8fjRifY2ho=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YPEKuHNa
Subject: [Buildroot] [PATCH 1/1] package/openssh: select linux-pam if
 refpolicy upstream is selected
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

linux-pam is required to login via OpenSSH if the upstream refpolicy for
SELinux is enaabled, as linux-pam handles changing user contexts. If a
user wants to make their own policy and use a refpolicy via git, we of course
should let them do so. As such, only select linux-pam if the upstream version
of refpolicy is selected.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openssh/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index 08d3c7d391..e7d8f46c07 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_OPENSSH
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LINUX_PAM if BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
 	help
 	  A free version of the SSH protocol suite of network
 	  connectivity tools. The standard 'ssh', 'sshd', 'scp', and
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
