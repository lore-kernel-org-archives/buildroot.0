Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AE5CD342C
	for <buildroot@archiver.kernel.org>; Wed,  6 May 2026 22:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF0D84001F;
	Wed,  6 May 2026 22:34:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRwcOn8s0BXo; Wed,  6 May 2026 22:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F89B40087
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778106842;
	bh=xGYBXrnWu1mMBzu+YyUKwILFDixE+J8P+1rknL7ibYA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZZZ+URJnQ0xFl+3RV3FJEnucI6oTEdskmzLAyru/62g6TXX2PHiqrO0RG1F+EGHFR
	 3+0Cx3EhXrdu5XS+WAlQZjKw6FO8Dai4thamRjyVMYKuXcaqrxnqNXitUzIz1yXiE2
	 RwhEEd18IfU87NhkujyIepqQAHa+e5zQsnd0PZJoIn0erBEXs1I35fmyj9X+NLzcsJ
	 NDaC5U6D7JX4KQt0G0YtYOhCMD3wsZPUqKmD+Al1ykHS7ZlbWEZC1tjzV54gB07xVZ
	 bP/bX3oslnXB1SePTMU0JepyQQtbFhjfTqWQfq+IP5KpJTK2ntlL41ioOo4EcNFafs
	 0LRAKYUv5BSqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F89B40087;
	Wed,  6 May 2026 22:34:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F91F317
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E9B580348
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKXKkFHGI05o for <buildroot@buildroot.org>;
 Wed,  6 May 2026 22:33:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 82C3C833CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 82C3C833CD
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 82C3C833CD
 for <buildroot@buildroot.org>; Wed,  6 May 2026 22:33:57 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-7dcd17e19b6so150417a34.1
 for <buildroot@buildroot.org>; Wed, 06 May 2026 15:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778106836; x=1778711636;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fzzcMZJRRT1Kfbi+hTDS2/XxhjL7f2AAZaaiAXf9rL4=;
 b=fAFvLS/L6mMjLmooUkd144P1fl2A7pnPjy8iJq9zNomna+TQPidOuTuiIYB6PlGRtv
 VMi8qoSFO7EwJ9nrVIoRq0iW/9EGsRUrYRryHo5Zm95+iOdKV3t85AK8iYpW+AO4a0oH
 hyE4UkB43NFnWHjxN/oH9n9MgIxJ4w0Ct9YzJJDaw2k/eGS4CYXjqBs9gbYpVrTUy/0+
 Y1E9eqphf1f0Z7noI7BpSY51XDiH3unfUxWq9yvhZNc/ID1uLRCFVwrhubk8OtFb/oLz
 BWAhUe3WqSjwA9MMvArDmaxaW0+OqgPh3m/g7XV4+IPLlvIBPaHdV4VO9Pzb2/wPtFzc
 Czww==
X-Gm-Message-State: AOJu0Yy4YRMUZ0Qk/Z35h0MZXDG2sxQOYga3JU1Oy/EFPlGGHULpG1BZ
 Df+Bct4HX5mM8gVmriillEfOyDg1f/vWrjvOPJ8ugYCcrry7U3SgTUtAJXHhT1Aq
X-Gm-Gg: AeBDiesCCTIkohRAxW9aFQN1Z8b20BdGs5ayK59kVAo8Xveln7ft/OrdND4LWdHUJcB
 9YDnR4GXGYn330Cd+mkUFoaquao+CRRRu/U+xZlMDUB5b7ecbD5516whClwBwA+w0CTsNOd4e+O
 /a5VjN0QBjOLTpDa5jMJKSlao6fUMryCzkIlDulhsakPpRIW0F0rXv68kXsWDlHYpjewOHEsbrQ
 2HeTvNMMgEK34nLWVBzDkdnC4l+iwzXkwoCRdvYvB/jQY+O6nNuIAn53shIJn8nGNJyb6DCzkgQ
 9u7PX77PSglgVlja24T5HTxq84xPbCOnbe7llJmGOi/QqlSmlMcBuZwaUJ5EQ93IMLmbT4CodKi
 S5NHN/ueXJ1YHmYE8QkTikfzTF4RpDao2HmYqFUzeegSOfWGKQn9Y35kGUvmgc1Y6N92/oLvH/W
 E+Zak31vD8cSROIcOj85XyaRmhwRTRLIGkUZYRJEOt7IrQBHfsZIVcPPXRW6srpkWJcC3/apz4/
 gzH61i6zavkny/g7QhOjQxL0WkXgCxYkBGKfBA4B/DrZDbCTsxlQ2rZ/S+tdHwbO8vaZRYbXRDg
 Wg7fQ0KZ2+Cx+/GfJA==
X-Received: by 2002:a05:6830:438a:b0:7dc:d99c:c441 with SMTP id
 46e09a7af769-7e1def32d6emr3337850a34.8.1778106836067; 
 Wed, 06 May 2026 15:33:56 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-113-237.hlrn.qwest.net.
 [71.218.113.237]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7deca7a9042sm12722145a34.6.2026.05.06.15.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2026 15:33:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 May 2026 16:33:09 -0600
Message-ID: <20260506223341.1759760-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506223341.1759760-1-james.hilliard1@gmail.com>
References: <20260506223341.1759760-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778106836; x=1778711636; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fzzcMZJRRT1Kfbi+hTDS2/XxhjL7f2AAZaaiAXf9rL4=;
 b=j7PK+Htpkn2DEN8h0rEEqiac+TurEPAXRhjj3RAjVEZVrk9jLK+BgPwf7JzRVrqrTP
 4qNYpZTvDQtLHh/O9QNrwX+0kY8QBXc3wjSZO5OKCzAg9wie3eLrO0X7UgfSclvFClQY
 YIpA2XYJXkt2FrlcuCFwvHJo2o0vOvOQt1myJyIC0Sy1Rg6BNo/to4xmKoo+tDK8r6CC
 ZyHWotc4QoEEdcw/4l8q1+LTXfGe7Bga6b5iCXEJtkUa8T3Iq+Qo9qEaBkRbF153bJwp
 8l5idLdnOLhYT2QDl4sdT6LkgqA7dcgAPyGjd7I5WiT1kIC94aMRX0IhILBaR4TRawP5
 CGPA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=j7PK+Htp
Subject: [Buildroot] [PATCH 08/40] package/fmc: preserve /usr/sbin symlink
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
 package/fmc/fmc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fmc/fmc.mk b/package/fmc/fmc.mk
index d88fa9614d..b0fd0df38f 100644
--- a/package/fmc/fmc.mk
+++ b/package/fmc/fmc.mk
@@ -32,7 +32,7 @@ define FMC_BUILD_CMDS
 endef
 
 define FMC_INSTALL_TARGET_CMDS
-	$(INSTALL) -D -m 0755 $(@D)/source/fmc $(TARGET_DIR)/usr/sbin/fmc
+	$(INSTALL) -m 0755 $(@D)/source/fmc $(TARGET_DIR)/usr/sbin/fmc
 	cp -dpfr $(@D)/etc/fmc $(TARGET_DIR)/etc/
 endef
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
