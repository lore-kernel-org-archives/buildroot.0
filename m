Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C907DC5AC9F
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 12:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B1358133A;
	Fri,  7 Aug 2026 12:55:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7-iv0T5A6L8E; Fri,  7 Aug 2026 12:55:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83F6F8133C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786107329;
	bh=Hw/DvDatDZ2BnA11K0RAVA9Yi7bdqhk70YsKM2dtLYc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aEBVeccZWnG4FKMMUFxT1ERwAvVtKdKZdov21skVDoP89DrYJ8cytHy1PFWAtoww3
	 jI7uertoB64bxPZSdlItzVZSgy8WFp8YqHIJPd3Z+otQ1f7/rcqmdhJT4G4t+D9+25
	 lq9CLQyDGVoWAKw94BYZMkTDtQSX5MFdczdu8eX8/sq3ujs/2LjMEegyIj7QKiU+fp
	 x7e2WoZBeVsCXvn3ji+328v++4LjUd8zdp4pHNEIuPcFQoZb3uFjeX5Y/VMKa3Zzcc
	 +mjiV29hXwROu1KODp9O9bD/YzvLevcIVltJmJHGAhUwvIp247EErVyU5FQO9TgWvr
	 WPDkIBv2bYMWA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83F6F8133C;
	Fri,  7 Aug 2026 12:55:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 55821D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B8D840ABD
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjJzbpnEWtDJ for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 12:55:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 57B6A40AB7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57B6A40AB7
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57B6A40AB7
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 12:55:21 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c166ec26696so36623566b.0
 for <buildroot@buildroot.org>; Fri, 07 Aug 2026 05:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786107319; x=1786712119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fkEC3a8sRNiSQPZQD4ZRgwszV35qMt6ZBPop+NdJzxY=;
 b=rRl0tZUVQlaRAPcTPDG5ml8iQ3KaBR0xETyo3BS47TJherNpg5NLKqWQwtW2Ph3K2f
 fjUgYjBpOLjTvMIVrIMZlWQ2pqEm3EQUt1XQFCb3ivUyuMjSX3dvOrwjCKaY18W5IerT
 rzLk77wLjLtbSpVCRHYLWNISeUa8GD9wOtQkChX5klr5CVo5jiCQRn7pG7S0UPp2PuwP
 BvSfYEz/HgREXvK7P8+OAaXtZgmaDBcqMOl7VizEo0oT9Hcq3FJinn8wc5NRq3QyLwws
 laMQATsWBU//cTNMu7FK0wDMq1T74TVV5Gkt/qNH7c6qQbah70iov5kqsTNoABPpYS3k
 OYcg==
X-Gm-Message-State: AOJu0YxKbTU+eMkjMijWOtkNRQKNBiQHwDUK3D0glndwimPsylAjz/KX
 eXdBghl9G7xUvLve+b/B2UxqpfM7/E/bgngXyng2IcNxh6Guwl0uCYf6oJxPUtgyx4ux2xXyBQ/
 Z144dyuA=
X-Gm-Gg: AR+sD125bbU0SAkYrygitanHyLxL+SCvnwQFT40sJcDUN32TZo5xY2ZlAq8F3W/MkQb
 dnzJgDs1amHmN0aMU/gR/LtbNTv7XHe28yabzW0PUZ0x3T2cWpH3sIATD1AYMmfiqAU44vSf+nA
 2z7TXYI5T9sA7O5RplH0ucZ5c3bj5yVpV7WqRj/cPnFdWVk5cgkScrsxfE/1xmnxzgDd8nWOXWS
 8c87BPwYuAoiddv2ceAjwLWvONoZWdCItMqMjOYztzKvJuCdH4YzZRd3EwzjVwoPUahFaOIymEm
 JycxZf0GzrtxiKCX0SbAEF27R5soTYt0d3rwoekoqFHSCTqyXh+R0pMPAP3iPI9hULhKf30+vNM
 ovTKr1NLOstErEjYJLjkRJ9f6xW/s77Sn5NKP4ow/RmqIGqRS7kl2hnbTe60WRiT7RBSEutdnJG
 MxeB3t4gWiRWi2uzkb730DCvRRhQSI57ey8ZQx/Rw5VS8mICpbV0DZXhX3fvf7PKRNuCfZZUvVA
 HzZQDsZBTQgA2vVc5TwqjHS5eyB77KcwalagI0/iSDhAagfREOK4QRWodmVVkCJgUjvKFOgP6JE
 RTbiwwwVqFsnhP4e6YqsqKweLrietRC9/QjBoAd/BaVwpo1KpmvbxYUpiSJp6sY4
X-Received: by 2002:a17:907:18c4:b0:c15:ccda:26d5 with SMTP id
 a640c23a62f3a-c2039de6759mr645742766b.4.1786107319232; 
 Fri, 07 Aug 2026 05:55:19 -0700 (PDT)
Received: from adam.amarulasolutions.com
 (2001-1c00-8183-9900-f185-b195-5f14-b7f0.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:8183:9900:f185:b195:5f14:b7f0])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2080a29a8fsm49539866b.4.2026.08.07.05.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2026 05:55:18 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri,  7 Aug 2026 14:55:08 +0200
Message-ID: <20260807125510.1285300-9-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
References: <20260807125510.1285300-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1786107319; x=1786712119;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fkEC3a8sRNiSQPZQD4ZRgwszV35qMt6ZBPop+NdJzxY=;
 b=n2gzAqsaAwiwhx2cpEzbuShasmJ4uRlvn+Xs6bse7PYQcMH5gF/EZWOwnrBpoA4A+1
 biPJxm0pz5AmVakOo/MNTfgr5QXxxSZu1C4IW6cnW9gn299n9dIhYu2c2H63DNPVO2FB
 6a6AP1eYY5bwRD0Z7RT4mfXE0Z5V+aMc4mACQ=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=n2gzAqsa
Subject: [Buildroot] [PATCH 09/11] board/mender/x86_64: add a udev rule to
 create /dev/root
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

As /dev/root does not appear automatically, add a rule to
create /dev/root. Without this rule, even running a simple command
outputs the following warning:

```
WARN[0000] Could not resolve path link: /dev/root Attempting to continue
WARN[0000] Could not resolve path link: /dev/root Attempting to continue
```

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .../mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules

diff --git a/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules b/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
new file mode 100644
index 0000000000..7d2ae8cb89
--- /dev/null
+++ b/board/mender/x86_64/overlay/etc/udev/rules.d/99-root-symlink.rules
@@ -0,0 +1 @@
+SUBSYSTEM=="block", ACTION=="add|change", PROGRAM="/bin/grep -q root=/dev/%k /proc/cmdline", SYMLINK+="root"
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
