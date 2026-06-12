Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A638ACD98DA
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 20:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49B9540639;
	Fri, 12 Jun 2026 20:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qjbak2h9mQ7o; Fri, 12 Jun 2026 20:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7312540642
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781297476;
	bh=dAzyGuVqkC0QvdkEqPOfrM9VC3QNK3FNKhrZgoTEFIU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LH5gt5Qjarj2WwbeHFFa4zECy790Q25jFFXcAnb7fVcvRucH8ffljIS2WPE4aYKqP
	 Ev4QUScpiRxCSffSuzeC39XSkiw6i6UbPPjexeDqmqRz+08pTyO7/wDzcrHc2LNV72
	 6Tjp/QG5EvFODHvTHFto5XgPQTniP/WTFTHgch8ZzmAGoAAUxy77hdmEpxUDwzp3aJ
	 nbAsT2w/hHh5bN4+jR0U3WhIP402/qxdQBMm4rGJF8MelyShJbqciWKWxYSciR+Vrr
	 gsl3SW0hX3M9drAcdK7y/j8a1XdBT9g0NGcA8V8E4MbdbB3OdLiXwxLPJIiJNo2QJE
	 EKc9rFNt9Jerw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7312540642;
	Fri, 12 Jun 2026 20:51:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1B9461E9D
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1729983EDE
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 20:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_ERaQ7CEaCY for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 20:51:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 35605815DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35605815DF
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 35605815DF
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 20:51:13 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-490bc6a7958so21691745e9.1
 for <buildroot@busybox.net>; Fri, 12 Jun 2026 13:51:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781297471; x=1781902271;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IsxXek7lIiY8iS/wBIW9xqQV6oqM0eULzQQNHQ+z4LI=;
 b=b3Heeabs0CgbVaUxzNlPbu+lF9OjyUzKP4yoxbWeftoC2zfIDluGWewXRukuH8muOF
 IUFz37FoHjjhJrlHdZz9ZEklsWmKO/mSXupFn+y0jfh2oDMFAOhnvn6kL9khIMi0AGQR
 IvfTuKLqreUkYHUS9+1eED3WYuXK0qu084+JZmBe9F/mUmg/mzRobJ9HtwJrvWa03fBd
 +EHKFxb4NZwAgrhG7GS6ieWGCUqYfP/MWahnwvVr2zZuIJFdfDi/WjLqhvFWDUW7Dx3T
 qxAJahKLx5fMyyJAPGpwlh53lZQJcX99SEYy6Tk61Z+B3ZQYLIaTXpntj45wfW2xBKLv
 JkJQ==
X-Gm-Message-State: AOJu0YwOHkulsZAHfn6tQeALPDsrMTRD1qizF9gMjvc055gejXE5ul79
 Lf/pUkz/uPg1kaGNz4pPg7Ef1ey4aihmF2kjCLU6uHcvQIKB3Im6ScGvs5ULlxQ6Nlv1DbuDx8z
 yKTPGsw==
X-Gm-Gg: Acq92OEYxiuNJZEdGQ9v/O8q0DS0l2GT3gTfLP+zz9VxcblCtLuR6R8mSOa5xh+CSP8
 2tVlQxdr+5jFIMviISN5BhOeasN4Xx+brxLHqe/azRad6v7IkBjnEiwSbLTz+siV+ituDmOTM4K
 aMlq1OrmJ6Ww26BgqN3x3oH0DY/1keX5cBN1fm2cmIiMP+V74id0yJd1xshvv5eLkfGmoN6O0m/
 LcDfHd2ycWFebCFpG4o1GZiIz40WCIWErLj3s6rTp0cPX9WW9vRxYBxv4Wdm2KKprRCFhTgCdf1
 dQ4h9/2e+Vazq2fpzmbKeZFX/BthrN1qkgbHLY9G66fpv/PZ7yMrJQzuBCYCktdDweIUeMZ33pE
 CHGO3s/DopGdNIB7YRe39Qjr8uLQqbpMc81BgwcZNlGMxGdve1Fmpx4RupJBNbpgsV0Vlb42DMn
 Eh/JrUMGUXkZDNF9HrmrPz8Zskqz4lrhqB56XH9DKLaCIIreofbw==
X-Received: by 2002:a05:6000:240f:b0:45e:8526:7dcb with SMTP id
 ffacd0b85a97d-4606f219f31mr5569851f8f.7.1781297470338; 
 Fri, 12 Jun 2026 13:51:10 -0700 (PDT)
Received: from vm-2404.. (165.186.66.37.rev.sfr.net. [37.66.186.165])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f26434dsm9353447f8f.1.2026.06.12.13.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 13:51:10 -0700 (PDT)
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Fri, 12 Jun 2026 22:50:21 +0200
Message-ID: <20260612205029.269642-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612205029.269642-1-francois.perrad@gadz.org>
References: <20260612205029.269642-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1781297471; x=1781902271; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IsxXek7lIiY8iS/wBIW9xqQV6oqM0eULzQQNHQ+z4LI=;
 b=ZtcgLo13d/s9mS8V1EUU90snHUA/nx62VVQogPjAzc18quDqPvoUERaEdFXzPODHHb
 pRFZonoICQ6uWgeDhGRmSW4ZNrNts1Omj8310KsH1A/Y+3zm6RsaL3y4lY+Q3SK9CrVr
 sRdtXLV1zkOhIXGrSOaDugBEbneztMb2rAzt4iMZrwLz4k/6lSqzE7UOyzIS3BRoCA2L
 ahLXxKt/tGGjdXnZ6uiG8/KsUx4IXrK5kleaMasqslRsA6hx464JOPVBBa4L0OWqgmoH
 uxVw6RoLeVC19LKVT2zAus+/9F6sUc8gW58hEzKib3FV0J15E/7hzKscbg/PiVjPMRtq
 R/CQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=ZtcgLo13
Subject: [Buildroot] [RFC PATCH 2/9] package/scdoc: new host package
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

dependency for host-hare

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS               |  1 +
 package/scdoc/scdoc.hash |  3 +++
 package/scdoc/scdoc.mk   | 22 ++++++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/scdoc/scdoc.hash
 create mode 100644 package/scdoc/scdoc.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 317b960da..56be32544 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1197,6 +1197,7 @@ F:	package/pkg-perl.mk
 F:	package/pkg-luarocks.mk
 F:	package/quickjs/
 F:	package/rings/
+F:	package/scdoc/
 F:	package/wsapi/
 F:	package/wsapi-fcgi/
 F:	package/wsapi-xavante/
diff --git a/package/scdoc/scdoc.hash b/package/scdoc/scdoc.hash
new file mode 100644
index 000000000..8917b4038
--- /dev/null
+++ b/package/scdoc/scdoc.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  e1a9c2000f855123a1a50c8f897073e0ee95fc41787431efe3864c2f1c2e7092  1.11.4.tar.gz
+sha256  ad227c56bf22c9fa35be3d383789d065698904b61161f6a8339b91bde5a3e48b  COPYING
diff --git a/package/scdoc/scdoc.mk b/package/scdoc/scdoc.mk
new file mode 100644
index 000000000..80ee9ce76
--- /dev/null
+++ b/package/scdoc/scdoc.mk
@@ -0,0 +1,22 @@
+################################################################################
+#
+# scdoc
+#
+################################################################################
+
+SCDOC_VERSION = 1.11.4
+SCDOC_SITE = https://git.sr.ht/~sircmpwn/scdoc/archive
+SCDOC_SOURCE = $(SCDOC_VERSION).tar.gz
+SCDOC_LICENSE = MIT
+SCDOC_LICENSE_FILES = COPYING
+
+define HOST_SCDOC_BUILD_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) all
+endef
+
+define HOST_SCDOC_INSTALL_CMDS
+	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
+		PREFIX=/usr DESTDIR="$(HOST_DIR)" install
+endef
+
+$(eval $(host-generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
