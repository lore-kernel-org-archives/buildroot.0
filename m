Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFB8CCA462
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8BA5840928;
	Thu, 15 Oct 2026 21:52:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIwmTIoDkrrk; Thu, 15 Oct 2026 21:52:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org ACE4640931
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101157;
	b=cePfOu/p2fdeuwSdXF7sxcq0+f2TmDOCEnLWbqv93l24eZVvUjZdIvK5Ttc1D8u/iBsJ
	 oBZsVM+4iblv5ZTuL47P6JzOWprXrFWqqOD50PSuV5DYFRm/++RgIUoRVgamY5dIbbk0H
	 QjvniM4ODFhN3kJ/py1UVdmKfMSh7DSs4CYKPT7W1gQHAUDvR7tbgU2nCEX33pITpgnQM
	 PpHEeovwIsFLkM6tRtnYWNNPxPdc5alSTfot41/ZXgqewhr7gv0fFUSNMGYSbNoH31tgQ
	 99gJ4VfmPf5CtxU24OdKBp7bLv6JsVdSl3PPsfN/knqK51KppeCL+w5owoDFXH7nvIg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101157;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=RLVYUxhiC7iBbasYucMP06TPvZfW/4Yz13lONqn6nSY=;
	b=JoKp3pbJEkLOzso2JV3Ho/woz7+u+VvOgNHl5535gbhU/RAFyWb5HDlrZ6/pk+hdd3d4
	 pGLQ5yGfbYUeg8US2kgXXoq/U20p2rLukyJCrHhC8pOgTmUcmtMVrSovPt3OBesfHXx96
	 mEFlorP7YvYtMg5TZgVvcuacaj4Gs8Nc0hmV2SNhGpq8cKo6jITU2xBry93PGUQSTH7qr
	 MUGuHQqVKRDCvzww54zyDSXiU6UgYmDzCxnfDfWbNX0hOBFSlNu3PNTy31BQZKZSmtFnD
	 /ZWvxcUXHftIC0+gXMEk7X/CAdZbeUSqoFcd89grq5blOZdS9+MgtPR+JfbASsAF17A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ay7Pccv0;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101157;
	bh=RLVYUxhiC7iBbasYucMP06TPvZfW/4Yz13lONqn6nSY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=jNw+mniJdp1s0flVkTJkQjKe0/FRw2GEDMm6r52ANTvfOhrs6Sp3SX1h69Fp5kfEm
	 ghp+HMLwiMaUWijj5jd0XT8khvxsgiJ3Vd/JyS5W8Kfj3CJ5QnjsqsuAAQthMFNpdp
	 H1i6dP2JUgm2I9XusvEDslMO37Z5VcqUjwAbi0NQMA/Zgp8j02YPyw4esgY6Cf7l/E
	 fFm/j+q3i5eYuqqbr/xLAoWWUD0S/JuWkeTrfnVa0i3GzE9aItAeozQJFNBTxfXg8E
	 2etWQidzVx020jV1hvooLxazWIFfS1NI7Gxy9sHlLv1al8LIjcpbHM25WJ7eruU/tO
	 FtE9sc/OsRHAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACE4640931;
	Thu, 15 Oct 2026 21:52:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EFAD9332
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E0B8B40766
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7AY3CFbu-4y5 for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A305D408BE
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::235"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101153;
 b=Pk393qfdrpev61mGqrVk3Q71vH2iaJTcBgZLQf/Wc1sxAJDtWhAxwm4CVO0oXP9RsSkD
 z/vuiENsXNrfEjuV9J+A0P+qQwsmgN00k6FCqQ1Pg74SXaJpL+4v2HQO5tb/QoT+fOoCy
 S+SLt9jG4DMFMSR/gOxyA+dWtyz13lyZUpjzb+/TX3BCw7mUAu4/K3qkJu1FZgyzoiuuG
 mtUCu8PqG3iwTkecZkbNF9YOpX4xenOYqxP6yuPgMk+I2ddMrpnpEeZtz6Y8LYbY54p7B
 knk6HNa0+LlaZ311rDPawExW3boIDmKR2QItMVzAG1/fsrUWijOC2q3rvz90xWPg+MQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101153;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=M3IkVU3bvhewaeIjBV/t+o7UDEI745pwh96jmSF96tA=;
 b=fuZ+/QkNYcsG/nGRZDJZZo3z3fEugVPmsfobMnlRxDNcLlNERkedUKLZ+rRbYdrNWf6Z
 sTKPDRJI5Jlf++zzoFygN2Tg7XH2zDixrlT7rhhLq32lCqimQATMHP+m9BYYMdyMc03ul
 x2Ye9psHdhXGButBJ5WDu2n1uIGOhMq0nqj1UUp77N6yEIA5IsfBvMZich/4Q8lM2mk8z
 Xk+kWll8l2/4vTz6n7hg2g6ag435+gOEI3q13i1FD7NaFbqhhiBcPdqZuWUbNljCCWF/0
 EJloROv77UNzUBb+DvXlNZ/qW4/LbkalA4GrL8bifYXHyNQE93ZCyNPFgQ9l8HAI+dA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=ay7Pccv0; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::235"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::235; helo=mail-oi1-x235.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=ay7Pccv0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A305D408BE
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:33 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id
 5614622812f47-4f5e6517982so2293729b6e.2
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101152; x=1792705952; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=M3IkVU3bvhewaeIjBV/t+o7UDEI745pwh96jmSF96tA=;
 b=ay7Pccv0HiHZP+CcxQM80bHfuabCHsGtDsbmfibbAI+kyZSSec+zgIsKPpdjRuM6S6
 XsdQFc34QrjRlOEBEKGufy3jcBliEQROS9X0Capq2TFU2JAxA5vXe3a0Z06OgMHQzTD3
 sGUaaeG4wqqNA9HdzaC5aDvgXnjXDUt4G/J4nQBjq0eg9etwOOZRXZpnIGeAm8CQ/Nrt
 xIOOhDQ6TPBc/hlVXNEqUOv6ck9syaeW1GvXBSXJkrRz4j27d+L3I8fE1Hm3ZYJtxIWq
 hkoJkSOXQEKMsggW0Qp+xaE10i/ZWQs0Uvgan1SDRx7CLWDkRQaghd2tnE5AUb+9Wt5V
 gENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101152; x=1792705952;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=M3IkVU3bvhewaeIjBV/t+o7UDEI745pwh96jmSF96tA=;
 b=DsPeh/Tr65JkchBn6K1ibdwLkZOoh9rKvfVyq84nMIRtJ0iLYGZmOxQN7jSdcTzYs+
 3IgP7SI4AjRLjUTl1pMVELgZgURXgm9tdLPx/cmV7taC1TBRtrxwat3aWNq+L6EU7wCi
 5Avuirm0cEPyaiWYoO8HtR3tbZDEo2p6cq19M/ccPsAYpui618MqkkQd4yBfP5BDiA7Q
 TiE7n5j2v1uOxrdfQQHBgCIOSV8ziAAUf9cDeDzWeKLmV3zgxhwJP/1+CHetVeOvP2kw
 4B3dXfJ8RwOR+YiOGKCKelkBolvl9Yvl6yrIi5LCP+DkAVg7wS//FoWce2/0D/Xn68RO
 3G8g==
X-Gm-Message-State: AFq9FYIwRVy8dAabMB5483H3Loera5BZyWJZ/es+s9mHzs6UQbZRgxml
 RY6ZNos4cx7j7frm68CTfOoGbpnDWobVJSgTTSnT6FFXxmgQyWZtcyVqKPkPBw==
X-Gm-Gg: AYBFou0wXSJbkJLqt8jICeScAH0KL/YiaVqhVttAYku7TMpVHtP9GBhlehpzdj0fqZI
 WIfBZedhF23u76kgLpxRZH7lfmAuAJ1HcaS9eHkxu8CQ7wWAyCcuwqg4LkWq5s8cftxs3ytoiap
 pcgM7YDUvQBfiDpeGScGJhijKpUbyeZOvFzP8RzjV5phyAEeJArfcJ5/H35/Y2LGC7yuYbw83nN
 szWf8aaR6LiVtzJAl1tUJ5fxWxpcoVJ7/q8BGzQSPEKiLlv0pBnQOBKwb5nzeVEXq8UFOJ5wvOq
 Xs1XSd3doqGqD+xLyrfsRRU9KbTdsVkDP1mP1v+tfhBus4SZkeWdxgQLEPqM6ACm+7XISVxwv2v
 XBAVVauYpCcYu++rQj189VxvixM+10zoGU+WzmRtLj/5JZxJate517veNnBJcFV2bbve2m5kMR6
 FvVVbPF+Kz7PlPyBbz6FRMAGElys6bSF5FazHgE5afGU1nW6cwG0cNxqdb/AtrPFX3qLKFIASdF
 nBLDdWfDe5falny6OfUQw2mnJiu2cK/e6Adu1BprmPkZxem9WmqHVSfbHMFtuU+phX285rKtQxv
 cBNgYrbb8YokbfB6RAK12pjrVFUanSx3Y3ExciWc/C4U81MNVTcfEOnBfe0F1aojGnrFscHfCoR
 K+f9jr/ltk8AvUzuC1JPDPv9z1HasseEDT6ZOwRz/WdUv4c7WpewX2g==
X-Received: by 2002:a05:6808:4fec:b0:4f7:d324:bc5b with SMTP id
 5614622812f47-50c56de85cbmr21205249b6e.57.1792101152378; 
 Thu, 15 Oct 2026 14:52:32 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:48 -0600
Message-ID: <20261015215210.3426895-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-pydyf: bump to version 0.13.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydyf/python-pydyf.hash | 4 ++--
 package/python-pydyf/python-pydyf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
index d2f3f4ed66..f9101db409 100644
--- a/package/python-pydyf/python-pydyf.hash
+++ b/package/python-pydyf/python-pydyf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydyf/json
-md5  d840ef400aec3a6c8018eb76f361a251  pydyf-0.12.1.tar.gz
-sha256  fbd7e759541ac725c29c506612003de393249b94310ea78ae44cb1d04b220095  pydyf-0.12.1.tar.gz
+md5  dc4d366f8847273460318019483373ea  pydyf-0.13.0.tar.gz
+sha256  3c1bd536c7161d9f472b82a8aaa27d3359a9058ec12de15302d92b3690dae7f5  pydyf-0.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
index 8a22aebe22..dd5f987919 100644
--- a/package/python-pydyf/python-pydyf.mk
+++ b/package/python-pydyf/python-pydyf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDYF_VERSION = 0.12.1
+PYTHON_PYDYF_VERSION = 0.13.0
 PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
-PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/36/ee/fb410c5c854b6a081a49077912a9765aeffd8e07cbb0663cfda310b01fb4
+PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/67/1f/3a10f8d2d106bb68330c43a5cd0faf922d1816f65a1581f35015ac654a79
 PYTHON_PYDYF_SETUP_TYPE = flit
 PYTHON_PYDYF_LICENSE = BSD-3-Clause
 PYTHON_PYDYF_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
