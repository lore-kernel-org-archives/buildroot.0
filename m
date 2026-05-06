Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA8DCD3444
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2742883440;
	Wed,  6 May 2026 22:34:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id idEGZA7lIIf1; Wed,  6 May 2026 22:34:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03306835A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106856;
	bh=cxPDWplXxsuSgl7aof2DimD2+ek4eZrsuZk6S9Mc86M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=TasaIqkJ1/W14Xr5O/tPMZ1FqX4KTcuGWUrDAFQNzSBp79R5Sq2KTQ6sLmMingYti
	 oMKT33U112xDpWqat6vMMyAtQWS1FLigkYyG4mFAQvQHfCGzKT9V5u0XZ6JET+orRQ
	 NQDy1u/Kl4XRA7VAx/J6TxzHC4NhV+1M6LT8cIG/+uopAqg+UgOpP7g+cWczQL5dvW
	 irmMe3LNXZ6br8la7aGIUhUEJPh79xbmI1wsY1mDjg8t3IskKNhleyo09BmkYJLOuG
	 2Mz2E5sbBBAB/9hHnXfhHHmEwuEsuYgQggj+et2+zNs1LDaYwz0T2bvN2VaH+uSfcG
	 1kfR4qshDqjRA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 03306835A6;
	Wed,  6 May 2026 22:34:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 993A0280
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F73960F65
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4o_ybZ-PzoY for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:34:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::336; helo=mail-ot1-x336.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6751C60F99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6751C60F99
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6751C60F99
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:34:11 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-7dcdd1b492eso176817a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106850; x=1778711650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Y68s2LDbCAxBFGXjLpHh5FvPyBcGEytSaWETNb1VTlw=;
 b=rnbQWlFpFwuTHuPzwqBRYKdahtt0mEX0Rxp6qCfwXvA6YzdzVQ1krgj/t0BjNAeUl4
 YzNN205m/ENQj8gaHRMXtiSkvZuwez8CnEeo86ZHWYKwi7DIDMewGROyd5sU5DQ4E1qY
 kPjP3PPGoci8aAEv+tJOv8XdLbZ2LQYCdIMMiwg0SBX4ZVzf+yQ74sUki8c2m7iOjiO5
 jgMbo1DmCbA4Fqvk85uWv7CgzS514zQwdQO5exU4LJ4giqlL/XsAnRh5wWvoLx5jaBb8
 uDbPZz72c3uth5hW9csrsJBRR9Y6xpvZRL3q2+eyXO/FZri6gRJPMuM/HlHJvVGg4Mnm
 D+xA==
X-Gm-Message-State: AOJu0YxLqKXm44EI7jesThm5Cy2yVXCCKRkRHEeBmjSbl6kZTE/5WQ/I
 R4fE4N/LHHhUbNV7rA6+EXVA36HnShVjcWxW0rzgWDO6SjqTrdISjGv+0a1Tx/Kh
X-Gm-Gg: AeBDieulha0qrTNigibtty3HYLnPn9zVc/gY4uTQZGW9IWcPLub/YqTm/YfjohbW6Ns
 7kPK61O+ZgDVEQqZ99ibD7WLRi9LfZlDiysAFgtFMqOm67ClYQjFf+oDikkP0FaR3hGu/hntwMd
 /9eDJDaEK8tUhAOgsia8qkLyDANG2vBa97rw/Tcc1O/XEqHlWA0uPQt7wKFnEZ7l1DYNbi0SEjN
 mcE9Q+73v1endX+/FTZifosgCh0UlSYucHGA1rXiIxp7Z/+xLay581wOv/GLxgB5IGB5ql6p95y
 8OTUAPdeKcwV4YkY7WRujoliGAXgyLzcAFblCdqV3wE2IXg8Wth3GAOjApLDrMXmmHNsbHc+Pv2
 yj2FFZD3AW2KBNDAoplGclvFV7r5ugFqB5dufRNtYVBGGzLI2D7rJXxNIR7Jqt37/RKz0jmXOzt
 RiYm5AdMXfex6OlqvCYBdFTXzVqwa/h+wxvNlcauzNQoGfr2b6aRasbk76lVxsyRiAPoOELLCGA
 Y44ZkXH3AJxh470YAYWHG5XbUUkuxAXE63LK3f7tl9wIizsk3TBU5xkoon3D5D6fazzY2Q1pipp
 IiDFvvk=
X-Received: by 2002:a05:6830:d02:b0:7dc:1bcd:43be with SMTP id
 46e09a7af769-7e1fcf1fb7fmr251593a34.5.1778106850141; 
 Wed, 06 May 2026 15:34:10 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:34:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:22 -0600
Message-ID: <20260506223341.1759760-21-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106850; x=1778711650; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Y68s2LDbCAxBFGXjLpHh5FvPyBcGEytSaWETNb1VTlw=;
 b=GBbv4otOMSSjozfRHUDhdwyzflNaRNVYmYs0ORHeCMHDlCCNRortgoDWl9k/GBr+zD
 HBoLf38Mpoz1GGSYfugq7mdT9Vc4cgfUXnbVZcY4FMuiWaPHTCmSftuCAa/njl7pWihS
 LgSsW9NLrbF9mxodV90Bjlu4U/uIuaMrYmGu0X3FpcTk6lfcQjuCzxtcE68nzhuv9kGJ
 dNP9XTx41SDqfkWcjhHR1jksgm1qia6grOJ5QATseT9u1QB5zbw/J7aeZkqYSHpqCuBD
 FdOsi2SasCe7N2tjzFZQ+LyJ7ULm7GB95jMoYcgJnFovtB7bzymRMk0RzDWVsbe8jYKh
 Yrig==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=GBbv4otO
Subject: [Buildroot] [PATCH 21/40] package/openssh: preserve /usr/sbin
 symlink
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Gary Bisson <bisson.gary@gmail.com>,
 Alexander Clouter <alex+buildroot@digriz.org.uk>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 Brandon Maier <brandon.maier@collins.com>,
 "Alvaro G . M" <alvaro.gamez@hazent.com>, Paul Cercueil <paul@crapouillou.net>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Doug Kehn <rdkehn@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Pascal de Bruijn <p.debruijn@unilogic.nl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With BR2_ROOTFS_MERGED_BIN=y, /usr/sbin is a symlink to bin.
Using install -D for files below $(TARGET_DIR)/usr/sbin can create
the parent directory path and replace that symlink with a real
directory.

With per-package directories, this can later make rsync fail when a
package target directory contains a non-empty usr/sbin directory and
the skeleton provides usr/sbin -> bin.

The skeleton dependency has already created /usr/sbin, either as a
directory or as the merged-bin symlink, so use plain install and let it
follow the existing path.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/openssh/openssh.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 8f46d886dc..ae3ebdb320 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -117,7 +117,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_OPENSSH_SERVER),y)
 define OPENSSH_INSTALL_SERVER_PROGRAMS
-	$(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
+	$(INSTALL) -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
 	$(INSTALL) -D -m 0755 $(@D)/sshd-session $(TARGET_DIR)/usr/libexec/sshd-session
 	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
 	$(INSTALL) -D -m 0755 $(@D)/sshd-auth $(TARGET_DIR)/usr/libexec/sshd-auth
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
