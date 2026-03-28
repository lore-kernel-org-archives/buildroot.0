Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671D410BA421
	for <buildroot@archiver.kernel.org>; Sat, 28 Mar 2026 07:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C6A583F97;
	Sat, 28 Mar 2026 07:47:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RWOppnXWGos; Sat, 28 Mar 2026 07:47:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1838383F98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774684046;
	bh=myNYc26asjQqA9VpF8yMG4/28HGh73eLQlQXUTXlfG0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a4/B/dT3L9ukIADTWSI/TdDF2Kjr5c8LTE4m9n5pThdauhmxKNKjRmKrk76CmsVVe
	 qFmqGCnlhIBqzIhuMfuIfD6XJL7GPwyZK7LEbch0eMWbgfp9k+0t2+IT2g/mmn+8Dk
	 mZzZzlpxkbCecMGc6PFBnMs9yH44hP+Wj32GFjTcHZvkdc7i3RQZK1VKMkKCk4VP9j
	 5uiEwvAftBtAmxTFzyhFF5F7ysmldkSbjO0hJAoEGZZKFFA1POarX2eKKFViva+/Ei
	 IxtYoufoO+KV6Jyqtac9GkIzHuijRuGGOnAbYZzbzrQwxGIp2WfcQJVbRXwsAE9q4F
	 sGoFGUPJfwDqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1838383F98;
	Sat, 28 Mar 2026 07:47:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EFDD71D3
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 07:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D5BCB83F98
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 07:47:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-hf4Cg-1SeP for <buildroot@buildroot.org>;
 Sat, 28 Mar 2026 07:47:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E79083F97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E79083F97
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E79083F97
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 07:47:22 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-827270d50d4so2610564b3a.3
 for <buildroot@buildroot.org>; Sat, 28 Mar 2026 00:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774684041; x=1775288841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J+MXU1PjKE4xadIOYw6iYCyOPxZccQQMHK9coQyJo4A=;
 b=S1rb/A2KG75yOtmGdqiNbbcZoO6fCr/C5AYXvhdy6F2TGwoClz+i5PuE53maYt4tfm
 iADmFZdcCDUPVowAY9XaxeFur/Y4yw5i0UkhJN7EyZsQfb5kYt+FJLpU4r9oh2FYdsFA
 /jsB2/zOiB67lV4ZH6pt+j7mB4wBUdzrYqFsQeeBusVje0E4p8EaP1EmcRy/uPepksib
 TYRSRV/4K5sCM4L/+7opytKFJ9gyLFd0Zv9U4ElzTJe4O47O2dJDsUFYDx5pp5Gf5DLy
 KnOATpImXGEqaOfBM4io9IMxtwoXWNOOcc4fbxixCT0SNAuniAWIy/UD3Ly59z4KY8c/
 SQ9g==
X-Gm-Message-State: AOJu0Yyv1Y3SXhnfE8f0J6ghGN+LW/l97cxTPlceC7/MPSDpObQJ6ZBC
 7sYa/WMG/5tgo6BGWLJ/SbV16zrB+UH3BKVEO7UTAcoTkjr9PITvuG3JkRTVptKT
X-Gm-Gg: ATEYQzzsx35ZSP/5rOWWPeoi8jxzYgfs8m+n1+z1WwLvE3OhLBShMTbGjeMsASS4Miy
 hxrTjgbfhBGdih3sRf+seEcZUaLNTOtwN4WZ0ghmVpBj13XNDiNn/jqU6/4rXr45Zb0VumB1I97
 dKgeP36/nwAoJAKWEqPbCsePO1ZWVIadodiq2amj7hiIKIMLB+0eBLoy/UaNDcQuhvJx1LZAKYq
 825ZFq5jKq4DwMaEbL6QAf+TBxVZ2Lb2+ZWDu52xp5BW5lNy9YKFRTUaM5BYayQfZ5TrSmzEzUv
 gAd6XBImgYpN6PzRJ2G+f/l4KADi3cA1j012HetkzID8U9QBWDWcseDzhnCS6g2bbbnpHL4+xND
 xaTgr7ruRJz4LGR8tUPR8gTJGgKStKdkFJoPYnsTLavU4GyzOnqaA8Q8yCNEy99HS5BYJ/DrgaY
 wfnodFUeeBvzrqZAnV7S5uZzx8BllQZD9GAnkKElbMDLcNs34=
X-Received: by 2002:a05:6a00:3685:b0:823:9c6:1985 with SMTP id
 d2e1a72fcca58-82c95afd63bmr5471297b3a.16.1774684041478; 
 Sat, 28 Mar 2026 00:47:21 -0700 (PDT)
Received: from fedora ([2409:4064:4d81:53cb:f362:7305:74ef:5b70])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82ca85d4d90sm1529247b3a.36.2026.03.28.00.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2026 00:47:20 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com, romain.naour@gmail.com, br025@umbiko.net,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 28 Mar 2026 13:17:07 +0530
Message-ID: <20260328074708.98982-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260327094348.193822-1-chakrabortyshubham66@gmail.com>
References: <20260327094348.193822-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774684041; x=1775288841; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J+MXU1PjKE4xadIOYw6iYCyOPxZccQQMHK9coQyJo4A=;
 b=jIq+2k+haLuaG/TzhXgjfwlN6NCuxQLAXxrvsTttMhjSUwjrPYrGppyRfhrH8xp6ya
 VJV3O03KtOv/AJIv21aHxzlIg+KlWv1XnLPLvSJkcqEcpnSyDsN0bLmaSOiJEKe9NgMl
 g1fsHXQsk07dCVK73fxuRY1W6DeKeLtdMq1uD8MsztV6z0pqM9fP3YCy90QBtuhYgCyf
 fkjXBW0r71zUu8rQA7yX792RPDQeZc4RznQ0HGwYp6FgaoQPjWvRa1JZrLAJOdLzEvYy
 QkiAHNfbwCd5SksEVPFcPiUr/HHIe+eIrUjXtTST0B5Kb2/GG6oyLIKVPoOiX8DvX930
 JM0A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jIq+2k+h
Subject: [Buildroot] [PATCH v5] icu: fix static linking by adding -lstdc++
 to pkg-config
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

The ICU library requires C++ standard library when linking statically.
Without this, applications using pkg-config --libs --static icu-uc
will fail to link with undefined reference errors to C++ symbols.

This patch extends the existing fix for static linking to also add
-lstdc++ to the Libs field in the pkg-config file when building
in static-only mode (ENABLE_SHARED is not set).

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 .../0003-fix-static-linking-with-icu-uc.patch | 20 +++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/package/icu/0003-fix-static-linking-with-icu-uc.patch b/package/icu/0003-fix-static-linking-with-icu-uc.patch
index 36a3d1f696..d74aca8088 100644
--- a/package/icu/0003-fix-static-linking-with-icu-uc.patch
+++ b/package/icu/0003-fix-static-linking-with-icu-uc.patch
@@ -13,14 +13,26 @@ http://autobuild.buildroot.net/results/210/2107f9dfb39eeb6559fb4271c7af8b39aef52
 
 Signed-off-by: Romain Naour <romain.naour@openwide.fr>
 ---
- source/Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+This patch currently addresses linking against stdc++ for shared-library
+builds. Add -lstdc++ to the static build flags also, to fix 'undefined
+reference' errors when linking programs like xmlcatalog (libxml2)
+with musl static toolchains.
+
+Upstream: Inactive-Upstream [Buildroot specific]
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ source/Makefile.in | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
 --- icu.orig/source/Makefile.in	2025-03-13 19:31:23.000000000 +0100
 +++ icu/source/Makefile.in	2025-09-22 08:56:36.791792784 +0200
-@@ -279,7 +279,7 @@
- 	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
+@@ -276,10 +276,10 @@
+ 	@echo "Description: $(PACKAGE_ICU_DESCRIPTION): Common and Data libraries" >> $@
+ 	@echo "Name: $(PACKAGE)-uc" >> $@
+ ifeq ($(ENABLE_SHARED),)
+-	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
++	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' -lstdc++ >> $@
  else
  	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" >> $@
 -	@echo "Libs.private:" "${ICULIBS_DT}" '$${baselibs}' >> $@
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
