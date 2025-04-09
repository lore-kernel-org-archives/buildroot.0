Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F34C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EB9140907;
	Wed,  9 Apr 2025 20:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPiWnxHlqZGK; Wed,  9 Apr 2025 20:03:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BCC841397
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BCC841397;
	Wed,  9 Apr 2025 20:03:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2565FD6
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BAE1403D7
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S3IHL0wIvFrI for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EBA7F40907
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBA7F40907
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBA7F40907
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:47 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-39c2688619bso4530696f8f.1
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229026; x=1744833826;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UHIyxHLUiG4DaP/KwKHHINSe9ayvkx9LU+VWGogoIvA=;
 b=wT0+oSr+HpCOIGRrISl7hrnNdAK5GkIT54IwaxT8IYtly6eZQJcHwvnI4reoaN7Ssd
 R6kKS39mPN2cvPZBhjFw+Uq7AAtiWMa2pFPuFAhwwFjYzOivGCsZBIsKak//llM7yP2u
 nqJHHCKrjWR189sohFj6w82KaeYwmexFnruqY9I1Wck7aPVJKcHBmtpfYGkQYMm6LsaY
 stJV98nubyRwiuOo3dCmIjIsd/++hJwdY+K3UHy+/NP5cMLM3tW8EW/lHTj1dsh96jMi
 jBQLUnfZjWTnq0fgZfdVkI/Zpskfi3JvS1fMEzIJv2uW2JrdChqUiMOfJkXk0j2HVk9V
 synQ==
X-Gm-Message-State: AOJu0YzW6FJ1zYiyBrj87ocA94LENh74i65Uv2xcXO6Cq+1Bh2ezMUoa
 1ONB8mEg7VR7LEOHR0P6H+5SbYf3X8GsRBKZpt/7gFlbk2izTIngwIK7FQ==
X-Gm-Gg: ASbGncvleiT4ehOceJbttlvKBUD/X9Z6hhOtmn06afOYW7mQ2cQCdtzt7TIRZJj1ivm
 FYJjegX6drvg6NNjblEwj7zA+wsRKHJBKbgpaTRi4gn2DcIbu6EXWD4w9rZpRa6ZW+v6z1n2iXI
 jFNIPeDeRqRet+y+QkCQqH6jpGut1+ZGkFICUVeFYvtxeMlTJcMdo3SV8Qfiz5Enh0hvKE2sB7/
 6Uw8+OQInYXVWVTRiCsOGzxGNhBvVFEd6HiyAzM3hXsPTObNzmAZ/WH0q1KTHyVnnVWJcVKe5Hu
 WufcorJCm5jdw/M+AVW/jqOfIhjJqE6fm9BzP26g3rTS1gSs55Y=
X-Google-Smtp-Source: AGHT+IFmfAeZ9S9mdgoEgrYQb1w+UWSRBi/76hPEBpAAi4S84sWMqoYZ7axuPRGmT1ufV4AAihjZpw==
X-Received: by 2002:a5d:5846:0:b0:39a:c9ae:9efe with SMTP id
 ffacd0b85a97d-39d8f46a00dmr56143f8f.18.1744229025756; 
 Wed, 09 Apr 2025 13:03:45 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:45 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Wed,  9 Apr 2025 22:03:17 +0200
Message-ID: <138d9e88a9127ed4ade6d0e33d62f91bf0bb3c81.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229026; x=1744833826; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UHIyxHLUiG4DaP/KwKHHINSe9ayvkx9LU+VWGogoIvA=;
 b=mjw8ftaJK/VUcTBtk15lohDFnttcXzzu6nGS/imUj+r51ff5wSpSCLg3kYbz1ePbae
 orTbrYAdyMEkUCeaoMUtUZYoitY9R7DKy81AEsjBeEoVaZvbOfFoxvet9K6qZS9Q9ln2
 5jBxgOJHcRzuCtQJzkPg26ZrH6XbDf+Fv8zptfLw4N1r8+skIHVstM0EFI2ioasaC1xl
 rUNGqRDEb8JULaLx4z9GshHat82CB+9Ispd9Xbb3DCEc66ttAzBVoYXonLIz7XtwGmD/
 7ulzHygs4EfK1YNgIUvwDzBinCbVZEuWVK3byltG5qVugs91ER4dhdVU3oJ3jU5YhZ48
 3SeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=mjw8ftaJ
Subject: [Buildroot] [PATCH 02/29 v2] package/dejavu: update homepage
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

The currently referenced homepage is a cyber-squatter. Switch to the new
official homepage.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dejavu/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dejavu/Config.in b/package/dejavu/Config.in
index 5d21e56088..ca549d30e4 100644
--- a/package/dejavu/Config.in
+++ b/package/dejavu/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_DEJAVU
 	  maintaining the original look and feel through the process
 	  of collaborative development, under a Free license.
 
-	  http://dejavu-fonts.org
+	  https://dejavu-fonts.github.io/
 
 if BR2_PACKAGE_DEJAVU
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
