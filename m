Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E61C5C369A5
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 20:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B923C413C3;
	Wed,  9 Apr 2025 20:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h5Umnn-JqO0o; Wed,  9 Apr 2025 20:04:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0284A41394
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0284A41394;
	Wed,  9 Apr 2025 20:04:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E448201
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E07C413B2
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QexARNSTEJAE for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 20:03:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F1DC14123C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1DC14123C
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1DC14123C
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 20:03:54 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso515305e9.3
 for <buildroot@buildroot.org>; Wed, 09 Apr 2025 13:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744229033; x=1744833833;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RYbAwh+xXXYdJw0BuIzDTf944bHmvt023iTElyJr05A=;
 b=HZwdiZLJVIBqGyAXJRNEdrc8rpLfW2wl/0F3nIVS4Z9id9uP2rjLN3xX1umU6SZoel
 Bq6vACqPrnDE3UDnHjnBAvk0rD7Z0oTa7/WsP40ckz2jXdGsLJVSfipkE+vsAYiHueCc
 CQTtQpzUEQh90/ZKn+v9PhYON0d0yvMV/Xp9fnRHwa3PZDpKOBp/XlTGIQLFNLSXUdio
 r5a1zuk67q8i67swO9YfmZqmcEx9qFAULACBDYOAo0jNAGvbmvHHajIOd6aX8vZmnm/w
 tpil9Pl36c62/qYPqtE/z8K/8cjrXOakCbfgnih+dE/hLhhehjWklwOLIbNtibXuosbT
 U8gg==
X-Gm-Message-State: AOJu0YyvH0eMcEgNIOluZD5t8fHW7adrKRlQt4EjzJDbbmJql5OO6zwf
 pWC+6ja9m1r6RFPYvT2YKpIo4pBiFY8qhqCTXD+XdevbRWbYUFEpQngROg==
X-Gm-Gg: ASbGncv0uq9lHVCAsUMIms6O+hUcNCNZhGEf8u2OOibmGBT+h8DYx9rIW6eAJ0XgOA4
 o6dY7AcTsviO7OD/4mClanUVT89OuL5BjxWyYD9pQAH2QOVFm8ZvvWV/LKpctUegfJjG9W8y1Ow
 NS6QcMsEzwuG6yDPSPzwEldOnEZK8kqx6lzDmxLwwa+Q9ScuySMw0ddVkQVnidp6JwagvJ47f0W
 KfFPCyIXvn75YmdbRXcuMrDZIh2+j/7rOMzEPtcQ+XJDBqEoB1OgwCNyKytNFyMcHV68zYhPrfA
 yahpfjCjWYu0O81mEeoFqvB/VqjSzhtJgKmyIBDESqz69hwRHOD69bXL0YhYHA==
X-Google-Smtp-Source: AGHT+IE2LAhQlLTHmq8VtXGNsrdY/M4iEZP9fHsZBFPldoQQJ4qRL9bb3XrFwAzmwd2KIlDbSU9Rbg==
X-Received: by 2002:a5d:598e:0:b0:391:47d8:de3d with SMTP id
 ffacd0b85a97d-39d8f46ae59mr70883f8f.16.1744229032859; 
 Wed, 09 Apr 2025 13:03:52 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8937734esm2526113f8f.32.2025.04.09.13.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Apr 2025 13:03:52 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  9 Apr 2025 22:03:33 +0200
Message-ID: <3773df5c77e0f6c75bc2fd51320e1e801bf13d46.1744229017.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1744229017.git.yann.morin.1998@free.fr>
References: <cover.1744229017.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744229033; x=1744833833; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RYbAwh+xXXYdJw0BuIzDTf944bHmvt023iTElyJr05A=;
 b=YEaVAiI4xj0oIgYsPJyxP4D5TYjWvdRTYdZ6UqP1Jo73tiRTuU1JEzZ20Ckzindmgt
 qfP1ofWs54rtvxKogLiE+1CaEfCYCIfeyjoJxryqNjlbAr5bRr6qHE+TOnNgsCO1MPmR
 id3xVyzWMWoYCyA0vdhmIdGo02bq0gg6yRvlJbM+m3Dp9f28Xz9CAX6n/Vgrr7wnTa6D
 V6DZ9DQVxdBDMAhbYxx/KtznbYaM7z0nxDwdLiAKmk+DUESa1e8WyoEWKtUKhRtre/tO
 e9w6HtVwDLMEeq08dV6N2iDWt9PhBGSE4f88yGHtT0mVWmFUqUGtspZt2aMMYCYn8mmp
 65JA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YEaVAiI4
Subject: [Buildroot] [PATCH 18/29 v2] package/boost: add graph option for
 host variant
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-sdcc will need that option.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/boost/Config.in.host b/package/boost/Config.in.host
index bf69287383..c378c0ce74 100644
--- a/package/boost/Config.in.host
+++ b/package/boost/Config.in.host
@@ -5,6 +5,10 @@ config BR2_PACKAGE_HOST_BOOST
 # an actual host package needs it.
 if BR2_PACKAGE_HOST_BOOST
 
+config BR2_PACKAGE_HOST_BOOST_GRAPH
+	bool
+	select BR2_PACKAGE_HOST_BOOST_REGEX
+
 config BR2_PACKAGE_HOST_BOOST_REGEX
 	bool
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
