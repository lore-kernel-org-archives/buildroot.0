Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3389EC433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:08:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C8B6611C1
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C8B6611C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4EC994033E;
	Sun,  3 Oct 2021 19:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YV5HOpSS_PgC; Sun,  3 Oct 2021 19:08:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B59A440358;
	Sun,  3 Oct 2021 19:08:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 824E81BF41D
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7176740320
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O-74Pon3KGOl for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:08:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DC8DB40305
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:08:36 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id r75so17806895iod.7
 for <buildroot@buildroot.org>; Sun, 03 Oct 2021 12:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yNg6PK+/r4Y/APqCmlMh8PxYnKhIBs/Vbppx+EKFrWQ=;
 b=d9Rnj+0oSnvtk/mLs4Zd3ksbyqeUi+icANqP9U6GVHHyodMVdOJYLZXdIyiOFJVdTL
 LfWs7B/Pe0HldcfQKQjycYGlb6CjEVg6qP54KEmbLG8LdKRpjD84Ot2ve/EqF4pNjwn7
 ScBSvqmrbyA/YE9UfS/QM6Wb0adbznvy9D+uZVqbj/Nm5U1F1joQNWqqRrr4hsyjzg+o
 azVuPtzYuWllfA+lLPL2w5b43UDVhtH5m9XxrCJR8PNqpJpVRWpn2+Jkg7rVW7GVJvGZ
 AxTJ+PLnLo6YZ0F3n21Tgu9scl34oRVK/L0jWoj89dPQ/js5Tar8Sdikv6YuKEM4wLY5
 i83Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yNg6PK+/r4Y/APqCmlMh8PxYnKhIBs/Vbppx+EKFrWQ=;
 b=xrNizeeIoDDK/D4qqz3NB9M8hDJUuUwSN7lUdGA+Z/2kUDV9mQ6bCxkch/tNZlTcaY
 EyS5+MhWpEDcVlenZaXVoQz9lkDF0EAmWujTV/8DIjrrjoBOxfgdkYMr9ETvf1FAlzjO
 /ZGMxEUMBohWb0tGLweNBIDjI5P7Ia3BZC1iyfm4gWmXZyIwE2bj9bSeAoLNXXIdXIrc
 eNKJxCRg5piv+QKl7E47OTMnpgnnmY0TCs6HeGPkg4IHoDdp3mu0fpk2QOvh7IyK7scY
 0h21P8epmJSKISrW+lc6KGEi4iddQ+p+wgx+Rk4w9qjNIqSaPUqc3s9Os4M6F5emh688
 a1mw==
X-Gm-Message-State: AOAM533ZzyWHXEozEoZOSRAg9NgrMZPvkNP4i8EaiX0PruWTzVn7/2W/
 rv5A6BtlvtEqP6OGH+bsrXxX58aDpkI=
X-Google-Smtp-Source: ABdhPJxHyoaAzVr41ZA1fKbIoWuz3tZFwZL/6TZJPFgUVpyVx88nPVQWT9tuMAR01G+sOfejsA+Rnw==
X-Received: by 2002:a5e:c018:: with SMTP id u24mr6764219iol.129.1633288115735; 
 Sun, 03 Oct 2021 12:08:35 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id l6sm7761975ilt.31.2021.10.03.12.08.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 12:08:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Oct 2021 13:08:28 -0600
Message-Id: <20211003190828.1629344-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: add pipewire user to
 audio/video groups
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
ALSA lib seq_hw.c:466:(snd_seq_hw_open) open /dev/snd/seq failed: Permission denied
v4l2: Cannot open '/dev/video0': 13, Permission denied

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/pipewire/pipewire.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 87e747e917..272cd046aa 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -171,7 +171,7 @@ endif
 PIPEWIRE_CONF_OPTS += -Dsession-managers='$(subst $(space),$(comma),$(PIPEWIRE_SESSION_MANAGERS_LIST))'
 
 define PIPEWIRE_USERS
-	pipewire -1 pipewire -1 * - - - PipeWire System Daemon
+	pipewire -1 pipewire -1 * - - audio,video PipeWire System Daemon
 endef
 
 $(eval $(meson-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
