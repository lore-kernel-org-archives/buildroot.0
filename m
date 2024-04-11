Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6318C4345F
	for <buildroot@archiver.kernel.org>; Thu, 11 Apr 2024 15:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9416340201;
	Thu, 11 Apr 2024 15:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vBJaxy_uHFlq; Thu, 11 Apr 2024 15:20:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 90FFA4044D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 90FFA4044D;
	Thu, 11 Apr 2024 15:20:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A020E1BF2E4
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 15:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C1186088F
 for <buildroot@lists.busybox.net>; Thu, 11 Apr 2024 15:20:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N3ueTnhYP90x for <buildroot@lists.busybox.net>;
 Thu, 11 Apr 2024 15:20:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=ben.hutchings@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B3CA606C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B3CA606C0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B3CA606C0
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 15:20:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-34641b7c49aso1915973f8f.2
 for <buildroot@buildroot.org>; Thu, 11 Apr 2024 08:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712848835; x=1713453635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=foBkFoiSYoxQd/YoNOr5u/2/f2he70I26XV0c9zzjHs=;
 b=hIdn5O11sVXjD/FK8qF/QirriXcauaNKVWSb3i6rMhb5M9rLCL8X7r+/GnDD/7xPM/
 ioJ8+ct+u2+i8/GDmxlUHTdG5JtZ4b+2iubhoL42NCY9ooYPJpzHvivvr28J3fQqMdy7
 DtdKLo/E5ZQAuAO5xsB5GA9gC2pmfLfTyKQri8OKEg+Zh0FKGbNU/+amWLa4wqBPeIKn
 myoYx9Tw7h4fs4mAHa4NCp8+ru7muBHN5GwEZnA7S7N7BGPdWaDs7FSADVir7O8cJ1YD
 8E4k2jaMjAdk+IH3gkFVIZ2e5L1WmwxGAZiBtfPPhsqkcM5NUwJQB/K537J80BIezzU8
 stwA==
X-Gm-Message-State: AOJu0YwYkYMBnFLPtTFyiXz7JqL/kqb7xR2UzeCjyPm1jMdH43PdRiZV
 0aRTuljshKueCuRDCt7jtgMt3X3h7nUGpoQwp8VkbOq9OCKf8+Rit8XWtYx3Eai8e4euqJCh5sY
 65Xw=
X-Google-Smtp-Source: AGHT+IGtjM9P4ylpXDtobYCQGe56TzOPzUyHunhEELGo4rgcinE7Nf3V5sy9N48gIYAJ4W6Lff09hA==
X-Received: by 2002:a5d:4bce:0:b0:346:b95f:2783 with SMTP id
 l14-20020a5d4bce000000b00346b95f2783mr1300088wrt.52.1712848834731; 
 Thu, 11 Apr 2024 08:20:34 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk
 (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
 by smtp.gmail.com with ESMTPSA id
 gb32-20020a05600045a000b003462b54bc8asm1980356wrb.109.2024.04.11.08.20.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 08:20:34 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 11 Apr 2024 17:20:16 +0200
Message-Id: <20240411152016.1185109-1-ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712848835; x=1713453635; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=foBkFoiSYoxQd/YoNOr5u/2/f2he70I26XV0c9zzjHs=;
 b=FiOMVjszFCqbzXtsR4BSQNmpM8QX2EJDo6q9q6ZOJe2TPqvQ8fnTPOMEVb60avNtSu
 wfv0WDKILxiXerE3W/lARScQ5jfIUBwq/4whAVv1FIN0Da3R9kfwXu61UZ0yY6Z3tos+
 ktTWlSyI28Rp256cFQ0Q6Uel/AkCZ3yFZBd14TokW8JEkgatEkuFHeJh0d5Q+O2WqYZl
 rvrjKI/kNBL3Y7bmCg7yhH1Qf0IaXO6PVzqQakquGKCwG+Pw9e6EjUJB73+NQc4YfOkW
 RcgQe59lIYn9k2ebErCUJgXo6bM0J3r1BNYyUJYq6SBK1s372725oRcE+/LPy1ZRk7S2
 jUSQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FiOMVjsz
Subject: [Buildroot] [PATCH] package/skeleton-init-sysv: Set sticky bit on
 /dev/shm
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
From: Ben Hutchings via buildroot <buildroot@buildroot.org>
Reply-To: Ben Hutchings <ben.hutchings@mind.be>
Cc: oss-security@lists.openwall.com, Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

/dev/shm is a world-writable directory, like /tmp, and should also
have the sticky bit set.  Without this, any user can delete and
replace another user's files in /dev/shm.

This bug has been present since /dev/shm was added to the skeleton
/etc/fstab, but appears to have been fixed for systems using systemd
by commit 76fc9275f14e "system: separate sysv and systemd parts of the
skeleton" which went into Buildroot 2017.08.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
Fixes: 22fde22e35f98f7830c2f8955465532328348cd1
---
 package/skeleton-init-sysv/skeleton/etc/fstab | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skeleton-init-sysv/skeleton/etc/fstab b/package/skeleton-init-sysv/skeleton/etc/fstab
index 169054b74f..06c20fe9d5 100644
--- a/package/skeleton-init-sysv/skeleton/etc/fstab
+++ b/package/skeleton-init-sysv/skeleton/etc/fstab
@@ -2,7 +2,7 @@
 /dev/root	/		ext2	rw,noauto	0	1
 proc		/proc		proc	defaults	0	0
 devpts		/dev/pts	devpts	defaults,gid=5,mode=620,ptmxmode=0666	0	0
-tmpfs		/dev/shm	tmpfs	mode=0777	0	0
+tmpfs		/dev/shm	tmpfs	mode=1777	0	0
 tmpfs		/tmp		tmpfs	mode=1777	0	0
 tmpfs		/run		tmpfs	mode=0755,nosuid,nodev	0	0
 sysfs		/sys		sysfs	defaults	0	0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
