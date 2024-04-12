Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3851C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 21:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53B6641C9D;
	Fri, 12 Apr 2024 21:44:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q32oKUqVuaBA; Fri, 12 Apr 2024 21:44:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1468541C97
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1468541C97;
	Fri, 12 Apr 2024 21:44:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4239F1BF37B
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9263F41C50
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bYP2mG2s9nj for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 21:43:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=ben.hutchings@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB4CE4196E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB4CE4196E
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB4CE4196E
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 21:43:36 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4167fce0a41so13558845e9.0
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 14:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712958215; x=1713563015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+iv/8hK/86mTGrVFukvlO8B68ngleFjyz9J7TIQJyis=;
 b=FKH5OPSSgdNY1dpUqBa3cUXIwdaK5GJbRkIRb53BhYpQOBXISktd7CAEv17OSivKVE
 Qyu+ngezWRyC/1THv344WpcWseWl0ID6Ehy2OIc6VA0qM9kd1H17s9hp9a2Y0YiYn+Fm
 jukThy8YkVynrnjudlT5GBehgueWH69sArJJuKL4uUKcg3xIaFgsVMZC8aKDyvmt+7ue
 DBlkYQSomj3TSkWlpDkrPAxG6z/LdeRphim5Eo19cC45TBs6PnTrNUnCh4Ae7D5vxmRs
 BDr95yhEKENuxkG+LNlv3YW7Xz+tiQ+vslXHVbKCBVcGM/uaG60wJgBAweXEFUhMGjNf
 4GeA==
X-Gm-Message-State: AOJu0YymRuFGe7X39wVpyWG2kBdT4OIn/V68iE7S1uHGuTZP5AiLQjS1
 ptccg+ATGvIBEh6JVk7lAvwDldHWXelpiDrmlAkTxnqCTLxvGwlw0NNXjWr+nAu7gsNENV3D8Km
 yeXY=
X-Google-Smtp-Source: AGHT+IGf3o9ulKnnzb/Op4v5AS3iW198/eRRarOtOXAq6C6XWcRXcL65JrHyv8qi1QSJPJKo1a8aRA==
X-Received: by 2002:a05:600c:19d2:b0:417:d7e9:f328 with SMTP id
 u18-20020a05600c19d200b00417d7e9f328mr5441588wmq.15.1712958214825; 
 Fri, 12 Apr 2024 14:43:34 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk
 (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c1d1700b004163ee3922csm10034597wms.38.2024.04.12.14.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 14:43:34 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 23:43:09 +0200
Message-Id: <50b8003c4466222765fa343b71bcad2da8478a37.1712957992.git.ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712957992.git.ben.hutchings@mind.be>
References: <cover.1712957992.git.ben.hutchings@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712958215; x=1713563015; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+iv/8hK/86mTGrVFukvlO8B68ngleFjyz9J7TIQJyis=;
 b=IgEFopkpRAh5+JMROeonFRN+zM6p3pHNPn6Xk1C4JNiOfEiPdVnKmUvA5be9wPIAPM
 fcw0G76zojFJaeaFs/kvyJ13yLOkflDi7vPwEGmST1bsU7ehZ+d3Zz8wHlaqsfwejm7o
 70+HhC5qL796H/SWxV/6Th3ZLs9mRd0NZq7FZVyJgV61l22dlDJ2riTvnjCyBw4NrIsy
 k1UvOsTeY5leT9kzn5EceZzG0122XyMgIVXzSXzTkXTAS73s+u6ELw/ofekLpz+T5JkS
 GRgL/cFGzbThbLdy6DXXhTBef7DRTPIl0m7ttGCc4cezFbJwrsC1856SJ4+M7hrpmMBA
 x69Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IgEFopkp
Subject: [Buildroot] [PATCH 5/6] package/libksba: Add host package
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
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed to support a host build of gnupg2.  It is not directly
selectable.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 package/libksba/libksba.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 52ad5fbeec..dc4ad8d241 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -13,9 +13,13 @@ LIBKSBA_CPE_ID_VENDOR = gnupg
 LIBKSBA_INSTALL_STAGING = YES
 LIBKSBA_DEPENDENCIES = libgpg-error
 LIBKSBA_CONF_OPTS = --with-gpg-error-prefix=$(STAGING_DIR)/usr
+HOST_LIBKSBA_DEPENDENCIES = host-libgpg-error
+HOST_LIBKSBA_CONF_OPTS = --with-gpg-error-prefix=$(HOST_DIR)
 
 # Force the path to "gpgrt-config" (from the libgpg-error package) to
 # avoid using the one on host, if present.
 LIBKSBA_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
+HOST_LIBKSBA_CONF_ENV += GPGRT_CONFIG=$(HOST_DIR)/bin/gpgrt-config
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
