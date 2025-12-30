Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367B7EE4997
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2453260877;
	Tue, 30 Dec 2025 18:54:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tZZjuBrUTxyR; Tue, 30 Dec 2025 18:54:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8BD860836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767120870;
	bh=pw3x70HabzsS9RlZ7uYJMf+FkuZ/1SXQkvk3bQ4fUqs=;
	h=From:Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rS7SRb3GAJWsKQJB5Bq2q8KOEdccfGOjqYUtrArKQRaZpeeBEK5XLmqU0mV2Q6KMT
	 8CgfGFDWMMA+RH/Y1vB14Vcov+EPivvr5csAVd26ysEC40AOuKZ48pUcjhuhjNCbFA
	 ZxOTAjAfnQ6N/ni7UdDWAO/RtEPCtE0sOPd3A+Fg+K10iVXYaNXHUmcfyj4/RO6NqM
	 QCbfuxiRjoZyuuD0jKY3jh6fjlzn2QEJnXG+4ZSPfKQ5B+SnKNuUOy6YJXMlCqcGQ9
	 DZCMiNms7XemXBoRYn8MwdTfIG63AjbPaS5iNj/NNyp8WttaR1AI2EOcOpOLnT9tsX
	 cMwtNddQ1Sxkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8BD860836;
	Tue, 30 Dec 2025 18:54:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEB1B177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0A824056F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:54:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DZYjnrXs_MxC for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:54:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=joseph.kogut@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D520F40555
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D520F40555
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D520F40555
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:54:28 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2a0d0788adaso91712735ad.3
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:54:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767120868; x=1767725668;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Ae2MGVLkQxqjt/HfKUHtb5zQEK3Er7RBAan/hnvSb8=;
 b=k9O7fO6A6J3NOPfqgHQZ45vm79EvMYwNEAuQf8HK3Ue6SEVEOwcNPqUiNuHi89yySC
 boRsSZNO5C66zXmGlufGt5T9L1QkOalB+eZPlwmfz1AtpzkIZSE8BZq1qYbfgo6/ug8A
 SR8wdmAKoGoqct28r9rSzIwRxYWrEE5AF1lOtaQHTKGiuvyw3c9FsxzxPqsZTPPAf9Pj
 6cj1x8keVlXfOafEqtLhPPzSx5xH3jBNdAqP7wJd2eAxh2iC0ekxzrsDuwKAhfQavX07
 uIkC0HhB3J+NQnPOtkbI8AxtPR9gVj/WLfm82PZmsBXORmfAyvX9DeQ1mNW0cRa90Lma
 oW2A==
X-Gm-Message-State: AOJu0Yy/IwbbLFnizrAYxJFYxQGZrfS+G/rdgMw8n+f6wmXjwLEmHjqi
 X96/loyyw2w8elPoEiSgBgPSu5EKQMPyDSraZ+QDggDVD+gzKm0F3ta9uqxZzfJ8
X-Gm-Gg: AY/fxX46Ol9Hf9Tw03STmK5IY0gGxs8lorZwMCM6I4TnKuzJaKHKO+4jMp+xr96YUk3
 3DyoqRlTdAdgYpPJvi5RrWyJz8sAHLIcPVleXKEHUB7BOXYEU9dLplFl0PI4Dr7v2OH+Z3OuAYV
 1TC+WnTyOJfbzg3AtQP63P2jaFu1w7MNjKFxKzEu6+648yqDi9rEgzhtCNG9tPpan8X8pMs5Bsw
 LKaIYZWyNhfKlyvW76fbHqVsL8wdCIk7Aw8r9hGmMh+4u3D83KhJCuXgl3XIesBRy5Ht1U1t7oL
 cncmFTA46qgs1AziUF/fjh856VadbtawSlgPnZKiaLm3AmLR/quFq2Ey+dnbc0aYtwP/AWxXXtI
 vXQYQDub6t6XczJCRdjc33ul9E6URyLm6Qh7K+ncKwqGAsFXUHZ5hk+6m05+ECD/Huedvz7A1EC
 okV8dBN0gDK+A=
X-Google-Smtp-Source: AGHT+IF4ieIvF3fTnOXCEvdjkWeH27yxK2u1yT2B2Vfp3JcJZkFH4ynj2Df8zCxWutUwLC4kqutxzA==
X-Received: by 2002:a17:902:c950:b0:298:33c9:eda1 with SMTP id
 d9443c01a7336-2a2f2a34f5fmr336173725ad.43.1767120867924; 
 Tue, 30 Dec 2025 10:54:27 -0800 (PST)
Received: from wash.local ([50.47.123.62]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c74490sm302956035ad.5.2025.12.30.10.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 10:54:27 -0800 (PST)
From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Tue, 30 Dec 2025 10:54:27 -0800
MIME-Version: 1.0
Message-Id: <20251230-libxshmfence-shared-memory-dir-v1-1-03a64fed2269@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOIfVGkC/x3NQQrCMBBG4auUWTuQJorgVcRFkv41AyaVGZFK6
 d2NLr/NexsZVGB0GTZSvMVkaR3jYaBcYruDZeom7/xp9MHxQ9Jqpc5oGWwlKiauqIt+eBLldAx
 nh9m74AL1yFMxy/ofXG/dKRo4aWy5/LI12gtK+/4FtOyfDIkAAAA=
X-Change-ID: 20251230-libxshmfence-shared-memory-dir-b4370ef20303
To: buildroot@buildroot.org
Cc: aford173@gmail.com, Joseph Kogut <joseph.kogut@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767120867; l=1799;
 i=joseph.kogut@gmail.com; s=20251022; h=from:subject:message-id;
 bh=HS6j5cflH4o2v7EMOs/jGvbqnZSYCIALX5XB7AKnD0k=;
 b=njek0uv1VW/JkK+LQQepu9BGAd0VYyQaNxECYEEEm77uUp91YTrcs0GJ7RCYNI1e1HQRXGWOe
 YFB8UfWWbmVDlnoKul0Xic+uznZO9E6JzVR0QHXizbnZZ1LS1Pg7skW
X-Developer-Key: i=joseph.kogut@gmail.com; a=ed25519;
 pk=pkWqHIjgowoQ51cQZTl6aTwJnXIFThap40f4w8cEsxw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767120868; x=1767725668; darn=buildroot.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3Ae2MGVLkQxqjt/HfKUHtb5zQEK3Er7RBAan/hnvSb8=;
 b=A+iQ3ZJFaKG4/Qufkap7XBJ8fL6O2z6WqHEuTLBsUiS8daKmvdiix5FLATXvTIZ8ga
 aCfHA3n6yOlp/gsTVKPJoKKI+itnc6/zN6RMC3QxLprdzEt6hxx14RnQgTe7GsrOsWFQ
 /a0W0P5iXiHk6hzGBsvCw3Pl1Cep2PVDCDxiLudzVTS2AXW0By7YWG45NQ6Tcslbk5Bh
 CBDJ3BVB5Auszae/M5/7ynxeedn0oaheQIhrmOrauiPdLcqnTKG1wrEvRMWjQdJzezjY
 ovjZVUiXZEHLRRI9NDFrCvnOE/Tn4esKseXBBABJH2+kEvoxR+8/hBeuqFNWmw2FK9w8
 tKAA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=A+iQ3ZJF
Subject: [Buildroot] [PATCH] package/x11r7/xlib_libxshmfence: set
 shared-memory-dir
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

libxshmfence has multiple paths available for the shared memory
directory, as some distros [0] opt to mount their tmpfs in a
non-standard location such as /run/shm rather than /dev/shm.

The default value of 'auto' will set this path to whatever the host is
using, leaking host configuration into the target.

With X configurations that depend on shared memory files for futexes,
(muvm [1] is a notable example), this results in applications silently
breaking during presentation with a blank window, as the configured
path doesn't have the required tmpfs mount.

Set this path explicitly to avoid situations where the host context
leaks into the package build, causing feature breakage.

[0] https://wiki.ubuntu.com/OneiricOcelot/ReleaseNotes?action=show&redirect=OneiricOcelot%2FTechnicalOverview#Upgrades
[1] https://github.com/AsahiLinux/muvm

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---
 package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
index b8c9ebfe97..6461348891 100644
--- a/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
+++ b/package/x11r7/xlib_libxshmfence/xlib_libxshmfence.mk
@@ -12,4 +12,7 @@ XLIB_LIBXSHMFENCE_LICENSE_FILES = COPYING
 XLIB_LIBXSHMFENCE_INSTALL_STAGING = YES
 XLIB_LIBXSHMFENCE_DEPENDENCIES = host-pkgconf xorgproto
 
+# default 'auto' leaks context from host
+XLIB_LIBXSHMFENCE_CONF_OPTS += --with-shared-memory-dir=/dev/shm
+
 $(eval $(autotools-package))

---
base-commit: f1e3a29a5b11ea373aef3260afcd0d1203fa2c99
change-id: 20251230-libxshmfence-shared-memory-dir-b4370ef20303

Best regards,
-- 
Joseph Kogut <joseph.kogut@gmail.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
