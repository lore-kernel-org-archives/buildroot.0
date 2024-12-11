Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2BCE7717F
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 00:50:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 604A881E2F;
	Wed, 11 Dec 2024 00:50:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k0Ok6LJGJLKK; Wed, 11 Dec 2024 00:50:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D5C781E33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D5C781E33;
	Wed, 11 Dec 2024 00:50:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C6D4ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 00:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4790C60A67
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 00:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BYASj5jjjMvg for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 00:50:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9858B60A63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9858B60A63
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9858B60A63
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 00:50:02 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-216426b0865so27386755ad.0
 for <buildroot@buildroot.org>; Tue, 10 Dec 2024 16:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733878201; x=1734483001;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U9b5elXgje5XKST3/8g7+xEtamWoWMLDpjH1EsH6XtA=;
 b=Lx9eIyWakXsT9Gs+gy4a1Io7k5z8DwN9vZ3TkjcdJB3A3lYzjt6LZ4aaxOszRSxj3+
 vVovXp7Gsw+jtLUrnNYGJBFvRifcB1vNYL+n/ja4Flyp7liwq6IbN6NSB7mowXTCu6Vw
 YQCS0B9wcl606p9T3+MK9nyFcJvAzmwXO9IkXgzufg4LSG/9eKvIHPCKTFSCDKHz9WO3
 12vbo6h/r/uAVfAgpjsbzFhyq+dMuNmT80ZhuTpWsJZ32lasHxZyTH8Lee8yaFJG2gAT
 NHxgXfXolfOz4H1AtJrRyNkhAICmUlK7suZMRC8VO5Ydp5YbyHovZDwmEKcjN3JfNd0U
 bT/Q==
X-Gm-Message-State: AOJu0YwjISdTx9iBKvB18y9ZJDWw7PAMb/tPBy59AikAsquORmoPJUFk
 Zfl6CbPVPDNaaZaNeUbmsxNlrWXCnI2fSHtsxCdVygQ5TGp4dTKMrJO0uT76XM2tYmUy5oX2R55
 z
X-Gm-Gg: ASbGncvnTl9jaN8oUwD1WVSnc4yC1pz0Ne7T4AA9wf7IuBpsdGbPjgTigSvBkEbFFak
 IzPQmSnZutf1Gz3zc+OfB/UgTcTNlcDkWHlkVG1DdTf+xUlpzvf0fGjxlNyQjYbeWMoxMvEiRha
 KXjWgHEaKb81p8BuRRnNTRkFleFVpOqKGRXSaG9bhp3SLwAUriyydbk06d68RGN2kV1Jq49pPGT
 4UxJqWDfOGqzrLbllqOplsatzKk3WTEDU2RkRa2rM2x+HG7ejod+vWfAhG4PI4r3uG9kV4MreBL
 CbPOcC8j+t64e85nSW+Vmh9d0NLg1RreebGil1g=
X-Google-Smtp-Source: AGHT+IGMmtkdsUJ1bvYOVqqai85mlEBxYXd9PZabw6x/UMfwcCqJBBmi62jn9wEijTJhWVUcv4mr1Q==
X-Received: by 2002:a17:902:cecc:b0:215:a3e4:d251 with SMTP id
 d9443c01a7336-21778395944mr20687915ad.6.1733878201546; 
 Tue, 10 Dec 2024 16:50:01 -0800 (PST)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215f8f3d9c4sm95745565ad.274.2024.12.10.16.50.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Dec 2024 16:50:01 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue, 10 Dec 2024 16:49:40 -0800
Message-ID: <20241211004940.14204-1-christian@aperture.us>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1733878201; x=1734483001; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=U9b5elXgje5XKST3/8g7+xEtamWoWMLDpjH1EsH6XtA=;
 b=VaNyf5YNTsptJIqe73c8Xem4ml9wu7ggfjv8I28yuwL25D2NXodN5Pt8cfJPUgDH+Q
 z9p+ItFpj35C646NAnEQWGD79vtv9rByTr5bd6aPBxWEI97n976VNSFXJsvhmvXguCkY
 0nx1XU7bhmA/UaZcnmR8qHFZl5GY0pQLmfGIS0+qx1pQ3jeHwaPuG314A5Yyi0tpq0L8
 UJXgA6336pH56PuNhB+w2K9km4MMo4spsUoOKd6GvBhwoUbJxhIbRJBLlox+0dV43LUq
 b+YwHr6ugBGshVUNBbzUaPZPE1RupGY3mALcVruByu7kMtGnCaisdpKqK3tXHCD+YQOP
 eAPQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=VaNyf5YN
Subject: [Buildroot] [PATCH v1 1/1] package/mmc-utils: fix hash mismatch for
 readme file
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Julien Olivain <ju.o@free.fr>, Christian Stewart <christian@aperture.us>,
 Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit b03dc5: package/mmc-utils: bump to 523d8f3cfb21

The README hash changed causing a build failure:

https://github.com/skiffos/SkiffOS/actions/runs/12266361526/job/34224344838#step:8:60617

Update the hash for the README.md file to fix the issue.

Reproduce: make mmc-utils-legal-info

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/mmc-utils/mmc-utils.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mmc-utils/mmc-utils.hash b/package/mmc-utils/mmc-utils.hash
index 48bfd7bc04..3da95d8070 100644
--- a/package/mmc-utils/mmc-utils.hash
+++ b/package/mmc-utils/mmc-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
 sha256  1ae5706ce56bfedda94a01e87c5151ac750fb849987aeb74ff89d70f43556131  mmc-utils-523d8f3cfb219d800f45860892e742e3a355f1bb-git4.tar.gz
-sha256  4207d81122a02555f78c5a11b61c83a331ee03dc933e1ef9dd932ef9b434d12d  README
+sha256  49cd65f67b516078ff7e0dbe639972dad21ed3858246e3969fc8a8fc2a4dca66  README
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
