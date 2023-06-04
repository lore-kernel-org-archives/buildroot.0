Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3A6DC7EE23
	for <buildroot@archiver.kernel.org>; Sun,  4 Jun 2023 15:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29C4E81318;
	Sun,  4 Jun 2023 15:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29C4E81318
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2tLhhBUV_6g5; Sun,  4 Jun 2023 15:48:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A26AC839F9;
	Sun,  4 Jun 2023 15:48:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A26AC839F9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8905C1BF4E3
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 15:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6156E60AFB
 for <buildroot@lists.busybox.net>; Sun,  4 Jun 2023 15:48:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6156E60AFB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zzxer59gRC3g for <buildroot@lists.busybox.net>;
 Sun,  4 Jun 2023 15:48:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1368F60AE5
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1368F60AE5
 for <buildroot@buildroot.org>; Sun,  4 Jun 2023 15:48:24 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f5f728c4aaso4352527e87.0
 for <buildroot@buildroot.org>; Sun, 04 Jun 2023 08:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685893701; x=1688485701;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MPIResnkeF31qy20slidPy0PohzXgxhjvj12UljJgyY=;
 b=Ok+r1DNFShya0P3xb0IhudEsYoZlf+Y2q2TIjJglIAV2Np+NGbARJJaN511PIZ0onr
 ycdow5d7HWPhcXoRtm69sHcmVTZmXnT5o4enULHBX+h4RNM1sedCdwnt5KrCIve2qxjy
 nYScQ8nEqgYuWPeQ+VG/QgmWdtRLzqb7dw88hUyeqH+ozSxwAQUxUkdHtfkcMsDQmDVS
 Rwt9wfyLnuZDb9Gyg1V77BPRY82QJwglQiOP6WiHvayLcWxKeX4MFqzkgjCsFNTtaxBl
 YY1t8EnrrRhnS5aIX2vcC/lD6rurLlyj2aArQP9cROMbT4+Qlnv4dEY/gY3FL33CM01C
 FmBw==
X-Gm-Message-State: AC+VfDzsdxRYDki0LBAbvOsbtaz9JoEZME6C/3qemmi7LiALlA4qxn9O
 n7ubm/ujt6s2HMi0HlYaE7APgB6WXHY=
X-Google-Smtp-Source: ACHHUZ4GiON2+9lOpbg9kSp/gVdd9sgxV2+VjEcaA2LomLfQ5PrZglCi4FYUOxANXvqtuSSpzk6PpA==
X-Received: by 2002:a05:6512:ea7:b0:4f6:e06:50bb with SMTP id
 bi39-20020a0565120ea700b004f60e0650bbmr1923661lfb.30.1685893700830; 
 Sun, 04 Jun 2023 08:48:20 -0700 (PDT)
Received: from gimli.lan ([2001:9b0:21e:3500::522])
 by smtp.gmail.com with ESMTPSA id
 j7-20020ac24547000000b004f5a548820asm809636lfm.156.2023.06.04.08.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 08:48:20 -0700 (PDT)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  4 Jun 2023 17:48:16 +0200
Message-Id: <20230604154818.3681851-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Addiva Elektronik
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685893701; x=1688485701;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MPIResnkeF31qy20slidPy0PohzXgxhjvj12UljJgyY=;
 b=qwzSHNggBvlrcku3UcjCbILNhvLriGPeIcWwBt/t9GAdINV72+JBjqyR2kXkZBr8T4
 xJ3LfLeu77TZ20FdOy+n3j6vXXl52+bHTmNCRIaMVEVC7O1BeXKCmdc9eIUIjYnInbmL
 k3HNbzFNqZMM5DjcH+6VFBWEfFd0H3j8Vb1w1hO2U2WA/e17SJ/0Upu/KVEyKT/h5mjP
 pqR+V1CBaeLw6W3yJMbHorAvp/gxiPw+06peZp3X7bg0UQwW3ywE6H8lLn6SmpSPbOpP
 Qws8QiMx6l2wbp0mUSR7P4Pi7ZFBCasW/JcQg2Yxs/4c5fKV6Emb5cV8mHOk3POF4B+n
 R1JA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=qwzSHNgg
Subject: [Buildroot] [PATCH 0/2] mrouted upgrade with systemd build fix
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
Cc: Joachim Wiberg <troglobit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

 - Bump mrouted to latest release
 - Add missing /var/lib/misc for persistent state on systemd builds

Joachim Wiberg (2):
  package/mrouted: bump for v4.5 release
  package/mrouted: add /var/lib/misc for systemd builds

 package/mrouted/mrouted.hash | 4 ++--
 package/mrouted/mrouted.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
