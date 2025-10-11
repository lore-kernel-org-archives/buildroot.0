Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D8DCCD184
	for <buildroot@archiver.kernel.org>; Sat, 11 Oct 2025 14:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05E068110D;
	Sat, 11 Oct 2025 14:13:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oApA5pQTvDgu; Sat, 11 Oct 2025 14:13:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2066A81116
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2066A81116;
	Sat, 11 Oct 2025 14:13:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 076CB119
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 14:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBFF481116
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 14:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u8JV_9EgPtWd for <buildroot@buildroot.org>;
 Sat, 11 Oct 2025 14:13:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CA0D38110D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA0D38110D
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA0D38110D
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 14:13:43 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b3c2db014easo551600466b.0
 for <buildroot@buildroot.org>; Sat, 11 Oct 2025 07:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760192021; x=1760796821;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PD68dBVPBcd2oBsEHE3JfnsIV2EglClJ4VY78h+GkRc=;
 b=O3Wr9qcnJYgUKHQxQdEhUIURnt2T3e76D7uE3xkfD4g4FkHy6r5JArTthSfNMg1JF6
 watCGXLJnBWVCXg0NqtEZMVFXVnOYgpivXn/omxyXmhSYzwiyjFZJOFovKGh/WdRDTTg
 Squ6YO5HGeql2NhhcsAWQfflPsG0MjTfoWPc3jSU5bBty4idcmfCLysqigX14rUWHXD2
 ZzY1uZ9+G4TX8RnKEBt5hXT93P2Bv1K+de0GiYRUANJdZUIapJ740Q3opuR72tP1e+kE
 OTMOlHgEVHpUk12kDF+CK3iq3gD9Iitl135jxeE1CUv4cVBI5cEmdi7HpalnMlv8a712
 FZfw==
X-Gm-Message-State: AOJu0YyJ+l1L9NLwB15fN8QGRGdpbvdW/fhEHTIPUZpHxg85mqXAfRwb
 kXs/vkPAFt256OztkYLIohnLMETGRtv/POX8VZPrMMox62cYq1nIA5VFbfTG7q/CVk2QHo/F2Bp
 UMjr4rfI=
X-Gm-Gg: ASbGncu7YcdC897upPJX0s+czdn5unXykR8G+skt16mgEfB0+HsdJdX3ufqCNgf/Hw9
 VNjSQ/5yCA0D/Ny0dRinQWw1gZErWTY1iRc5BGjufLsYqVHdlRIbCqZW70kOYfo3SSprFGtZdFh
 fkRa1Ui51pw8Hd3RUDwE5cMuR1WNnCB6Ee9ISVeotDpfJ8hm7s/yLjtfuOlp0lnBdGUPcKSxSDQ
 VuwwHppMCabvLI+YsZ7IAohsZuDYs+J7FSIfRqwBi7l9c6tp+djty71wohWsHiNX3/xNcrq+CpE
 Gziec64ew3hjxvlvLYWKaodjc7pgZ3KIC4qn6glh+aIM7b7dOEgJp9NQ4ZdoxmLhr0TBlqFq4z5
 6+nkOTfHKhnDWcjP2++mkZtK0NzIcQvVj7A+uAYgF3k4OJ3QjVSP8WNnzgNuk6cwqmYyKW6rXbe
 ECfKvw4fyyWYbxg+01Ae2OKhRIQjpMyu3jHxTVQ5bNJGw0YS+UMKQMb6zd+suGMnlgwSK7qy5db
 MTmhyCE3Rp4HEyWyDqx
X-Google-Smtp-Source: AGHT+IEKcdCk0R8L+AU15LdpKsv8W8DIwJVkAGCZiaaQ9ObJTS3urLXQBtqIk+bTnETeF0HxCm0bbg==
X-Received: by 2002:a17:907:3e8c:b0:b46:cc3b:65fd with SMTP id
 a640c23a62f3a-b50aa99e1ddmr1520168166b.29.1760192021363; 
 Sat, 11 Oct 2025 07:13:41 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-25-27-158.retail.telecomitalia.it. [79.25.27.158])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b55d61cbcb9sm498230866b.20.2025.10.11.07.13.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Oct 2025 07:13:40 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 11 Oct 2025 16:13:33 +0200
Message-ID: <20251011141333.2044458-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1760192021; x=1760796821;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PD68dBVPBcd2oBsEHE3JfnsIV2EglClJ4VY78h+GkRc=;
 b=Cjskw1SbCesInUxOy0UGJB6J311lDwKEOehRtlpPBw5wN8x43t24gFVLAiyKePgVTr
 CCsxrdk5LSItkx8AZ+ldpmTPK7mKiyc45x2F+0sqa/neVQsoLYYTdrWmgUpTz7JvUInu
 iq4HJRu1XLXFz8S+i0kZZgDv+QlY9rx54fNC8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Cjskw1Sb
Subject: [Buildroot] [PATCH 1/1] package/gnuchess: bump to version 6.3.0
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

Release notes:
https://cgit.git.savannah.gnu.org/cgit/chess.git/tree/ChangeLog#n1

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/gnuchess/gnuchess.hash | 2 +-
 package/gnuchess/gnuchess.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnuchess/gnuchess.hash b/package/gnuchess/gnuchess.hash
index 0248abcf71a5..f307ec249e6e 100644
--- a/package/gnuchess/gnuchess.hash
+++ b/package/gnuchess/gnuchess.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  ddfcc20bdd756900a9ab6c42c7daf90a2893bf7f19ce347420ce36baebc41890  gnuchess-6.2.9.tar.gz
+sha256  0b37bec2098c2ad695b7443e5d7944dc6dc8284f8d01fcc30bdb94dd033ca23a  gnuchess-6.3.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 630b3aefa74a..1b343acc997a 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUCHESS_VERSION = 6.2.9
+GNUCHESS_VERSION = 6.3.0
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_LICENSE = GPL-3.0+
 GNUCHESS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
