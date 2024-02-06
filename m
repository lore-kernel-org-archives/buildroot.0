Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700A5C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 18:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F141831E3;
	Tue,  6 Feb 2024 18:08:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hqY6CHMasj9y; Tue,  6 Feb 2024 18:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 417A9831EF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 417A9831EF;
	Tue,  6 Feb 2024 18:08:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6882C1BF31F
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 18:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 55ABE831EF
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 18:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ct6FP6_HzxiN for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 18:08:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 59A8F831E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59A8F831E3
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 59A8F831E3
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 18:08:26 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-33b4b121de1so248194f8f.0
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 10:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707242903; x=1707847703;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NrM6/unW7kdkQuwCIxeNtG8RipnomuFTUZhZsW/ZOCA=;
 b=onip7rq0mmL5Fb/neIVZpkEJ07AYkqZ+u70bAFuOc1wLZ6KWhhzIdccP+hsA/4O85a
 YEELHWqkRKeFSTrSXqCCgNN61heJk/eKR5dsCVTgvaeVclpdnpeIotHtbQDxFi7BYk+1
 DrFQKqJYbMR6q8xz0zPK/na5YytSMMBNia6TfKi9rLff7TqQpvTyA6NbIxe19EFSg8hS
 feQhL7R3RsHdX9UwUZmSRGjTlg9FEeZPqlz85xv7QPGxSinO1UeOYUAeSk3D/KYnofN7
 VjT/y8X3oZp4Qh6rWnnWpAvpMf+tYhyBBCvIi427FTrcCk5FlYZn9Jr5gV7GNZZj55WZ
 nVBg==
X-Gm-Message-State: AOJu0YxVlrVOnUSFVeog9Ac7I9T+5GFXoe57abVrePysMkSmfeqfp5GO
 piXeVyLYzx2LJv9OIMoUSLFw/BnsN1zn0O7Q0MqIhJdjJNgjV9/VQ5Y2LjASR4A=
X-Google-Smtp-Source: AGHT+IGicbF7imm+NtNqon4VwRmRSQG2uMpQ/ydz29x2Pc5M/TngglmveRVQJEKbH24nFEvU5wYLlQ==
X-Received: by 2002:a5d:5150:0:b0:33b:1faf:a567 with SMTP id
 u16-20020a5d5150000000b0033b1fafa567mr2141447wrt.5.1707242903373; 
 Tue, 06 Feb 2024 10:08:23 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU/17Y2W33I3wqNNDU39zdaUTIT9DrMGEvJCaA/gwQBL7oj9CnQ+qUU36BdDBQ4RuNKJhikf7lZf5s+/tlC9kMdmdJnjUGkyDpzliUNY2ntq1VjOsNr7IwS6J+/V8mHcLQ0kqJKzhN5VbEaduWfa7y2vFaCr/en0+Jx
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fs20-20020a05600c3f9400b0040fd3d8ce5csm2675651wmb.16.2024.02.06.10.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 10:08:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Feb 2024 19:07:43 +0100
Message-ID: <20240206180743.6460-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707242903; x=1707847703; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NrM6/unW7kdkQuwCIxeNtG8RipnomuFTUZhZsW/ZOCA=;
 b=AUkHZhwKv+Ht/Ayefryzg9Bf4/iSpq2f/VqRAasOgJLw28j2CWMZ32jmuuOQCGocU7
 2/44yEw9YDJabPMqs9R6fFO200evvXRe7rFB4DfWKmQ9KJ639uE6oVKKywf88XUc63hI
 xvD6OxQr0f+3IQKfrkdBFZR+DuJhjGHZY06G3iWWpGOo1l++GiD0U/SPXX+k37AjMbXL
 aVnDs0Zgx6uA8M98rl0BCxyFkx6hWdvFMHsQQ5n9oGWM9NqeQBRaKoO4zbpQDnMtWRs8
 /Q8UF/lySxVkf9f0GXObydglRTCRV8gEErg3UHyBGo991EogZYvtIRixHMSTw7fO3Ktx
 ys8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AUkHZhwK
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic: add CPE variables
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:pydantic_project:pydantic is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/detail/9B7C28E5-ACB1-4252-AE8F-4225C1AF739E

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pydantic/python-pydantic.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 7ad7abeb8d..0cce5a153f 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -10,6 +10,8 @@ PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/aa/3f/56142232152
 PYTHON_PYDANTIC_SETUP_TYPE = pep517
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
+PYTHON_PYDANTIC_CPE_ID_VENDOR = pydantic_project
+PYTHON_PYDANTIC_CPE_ID_PRODUCT = pydantic
 PYTHON_PYDANTIC_DEPENDENCIES = \
 	host-python-hatchling \
 	host-python-hatch-fancy-pypi-readme
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
