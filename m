Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681B6C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39F23822B4;
	Tue, 13 Feb 2024 21:15:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLkiIAr2KkR2; Tue, 13 Feb 2024 21:15:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B17D1822C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B17D1822C6;
	Tue, 13 Feb 2024 21:15:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 679111BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54CD141561
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aHcznNd7k2E5 for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 357D0402A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 357D0402A8
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 357D0402A8
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:43 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7c01af010bcso192584339f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858942; x=1708463742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mF7KsER05OOi19D1svOWGm9Xtcbm/xShv3epkFsEfiU=;
 b=Xrz0jdhbKx5ll/XuImc8dnnBVEu2rayvdeNHqBUY4DaE4aaoI0nU031rqt7JsmkXsM
 Dhrcc+PQTXOqnfOhwggi8RdlPKQsy7eUxMqtLEwLGu5xbxneYDywPlGlmq4jCNVW2CW4
 jf07LpGH5S/+SDGFB8XsFvja3VZ678LR2FGfGVMVyIdVLH6oYPddTNDhKULTx6Z8dCkY
 irrjWbvPOf+Fb8k9DYfnEKrsZVcCZ/Xdv0JZ37Gu9f1B3p9Qae2sNKOsavSqOZbyzYk6
 OGIqFTyLAFLyP9M2mNZiUQDEywD8xp0uTW0bBzKXjq2K5o1fZED/omTZZNLCMYH9q/jN
 DQiw==
X-Gm-Message-State: AOJu0YyAVEDzMGsk2VJfTpGN9JQOsubz1wfs8U1pQjuzsUm+ukfrAEg6
 u6eO55dtrICGjrUzjQ2gHqGens2BYt3/aIuwQuLzFyQvvamhnXitLGel706GdEFq5w==
X-Google-Smtp-Source: AGHT+IHBUgVY2EuywU3JYW4ReUp8+oWL8Z5o/IBeimDRq07wrIIaFgLH0hQqBmPsPZHpDnKbktFmbA==
X-Received: by 2002:a6b:6513:0:b0:7c4:839b:bf7c with SMTP id
 z19-20020a6b6513000000b007c4839bbf7cmr68792iob.9.1707858941773; 
 Tue, 13 Feb 2024 13:15:41 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUo42qyl8qAzu4BJE3rW/epvUeELwmLxFcMMkwemKir7Bw6ytvfgZyox26R8suYxzEjMnQaolemq1a3X8qIcnolzRq6UNBXtTI3vc3XrplR9BbflZSGEcBEXtOsm3h8TAJ7Fqrow8w+iDgG0PVuiJTZ2WVeo/cZIdRTgStYzuttR851rjIrN4G8MU81POVhfTD4mBT8VFzNjs7MQZ1VFP/wgfWGpQJ7IObfgitsneFProsJFD+BLigWBOdjtKpbGpAJy9wGlb/d/Gkg/gKMcRrIlkXftCd0xn3IvFn1X/CZoF4ZS4G8FcOFr8LVQ0tqzLAtLvElp9WoW5a+pH3ozdHilbj3G6lsts5kR8QHYUQB90pXpf0JmQBPalRAkh/TDyf0hn2jCcWci7qkx4HIEctiaz73bV3wJTcFQ4vYdDl/hA+vHzejj7jWqnFvA1i32v8qlOeMvjHyngmuLGwrXyExnHzo14YlXWzm04u4dhkPN7BwFR4FzuqDk5Wxj6mZQje8Ed5o152jcFcC971fTZ8AHQlNgbr7+TnmJKZc3GxIeCtaT2CNFZqrAOiafu7M+dviU/Lto4KcQYMvwrRseeqNQIA/0FP0bAcUfrzBfUaOQC63KzOvF0SRgo1r0VGnewqxr9hSEThPvYVFFfRKLWb6ZY2kF6YN2SXBtBycbuQp4bm9GqhYPunprP70iZWhY6oZ12kBr8PoLmG3RinzFgvvUEBjJDqPblya0O7ijXq6y6vXH1PIyQ==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:14:55 -0700
Message-Id: <20240213211512.3918044-9-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858942; x=1708463742; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mF7KsER05OOi19D1svOWGm9Xtcbm/xShv3epkFsEfiU=;
 b=ikqYL4LqjaozaQ8fGMqCsxpwrIpF8p1x1dCJumaNQWegn6mXp+It9jy6yiGf0t90+M
 UtRysnDG3z3oYKszBcva78i6dsLGJNvs73nPGFBIoe3Jo6ORyVXHpj3Vy2a9Rq9CxhjZ
 W+DJMz1ZKhHG+OqvwRpok8FD0aAoiMRAO0UUdibwMdPvn9+8+wNuNQeBBalZ4Qqkr2G9
 lny3AM0chsawkMtTQa9TKz3Ea0fz8w31KPpJctZQgmBRjSjc5pRagFQaFMB+ltevoGVt
 6vLE1g4csS+NohYgqpejWa2KotrreBvw3Nc2KEC446vOtzZbuQkTxTVYhDP5fqJqll24
 bOfw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ikqYL4Lq
Subject: [Buildroot] [PATCH v8 09/26] package/python-canopen: add
 setuptools-scm build dependency
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Gustavo Heinz <gustavo@gsthnz.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Attila Wagner <attila.wagner@onyxinsight.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Louis Aussedat <aussedat.louis@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 "Wojciech M . Zabolotny" <wzab01@gmail.com>,
 Joris Offouga <offougajoris@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Kellermann <christian.kellermann@solectrix.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>, Mauro Condarelli <mc5686@mclink.it>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The host-python-setuptools-scm dependency needs to be added
prior to migrating setuptools to pep517 as this dependency
is listed as a build requirement in the pyproject.toml.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-canopen/python-canopen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-canopen/python-canopen.mk b/package/python-canopen/python-canopen.mk
index 963c4ab801..09ec595ec6 100644
--- a/package/python-canopen/python-canopen.mk
+++ b/package/python-canopen/python-canopen.mk
@@ -10,5 +10,6 @@ PYTHON_CANOPEN_SITE = https://files.pythonhosted.org/packages/49/55/67e555f6f4ea
 PYTHON_CANOPEN_SETUP_TYPE = setuptools
 PYTHON_CANOPEN_LICENSE = MIT
 PYTHON_CANOPEN_LICENSE_FILES = LICENSE.txt
+PYTHON_CANOPEN_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
