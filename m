Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4941C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A4298225B;
	Tue, 13 Feb 2024 21:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZW_DgS1MedH; Tue, 13 Feb 2024 21:16:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB9AE8232D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB9AE8232D;
	Tue, 13 Feb 2024 21:16:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA16A1BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9760960D53
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OFVwb6ObB66n for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d33; helo=mail-io1-xd33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B2C5260C1A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2C5260C1A
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2C5260C1A
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:54 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id
 ca18e2360f4ac-7bb5fda069bso231625939f.0
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858953; x=1708463753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cui12cYZUDQtQ8YaQrMt0Ei4PYCEecCA06FpUmltf9s=;
 b=Ld6s7eTe1IIb/hXUp4QckbNYsW6yO/1vS47KyOaQaTKuVJr5Isvv6HcnTpQp+vtd1X
 DJXgnE4LUCZFSm73V5+Z3Xn0eHIri9S3QWgvPlurG51ruUS2D+KUrNJtlrbGlEB9txaf
 /eN1+vOHEQ90s2vQgB2q4r6uo/adFRtSLJ+QiodsgBcnJPlcOtT+M7wvCBLE+MBr5SES
 0ErwA5wbCM11E3opxDfmROpiu3bClOd6uW+pT/2ReHNy4YH9cZWTMGDX4pttrZi5I0iM
 vFu0B8lTGwsWrelp0rwG1bwroDz0DIVAlptuDVzY9zQDX1Mg9KXtlytRNqdDR8qM/Adu
 fCZA==
X-Gm-Message-State: AOJu0YzvFFIjHtBifpgkcxIqOCwxv9/7lGsNe5ZY7N6hDhYyp720Up6f
 9o5grU3TT/Zfg+yxPdAn2tvgN8PESEeVtpBGPgfv7qOufDdnnk/KwD2FaHigqvdPyw==
X-Google-Smtp-Source: AGHT+IFQtLYf+9IcVUGQdFx02D7Hru9wC9QHitrTei77ipZCTHPgUfho6h746NXBl7T9WIJNOzDafA==
X-Received: by 2002:a5d:9bd1:0:b0:7c4:80f9:f0c8 with SMTP id
 d17-20020a5d9bd1000000b007c480f9f0c8mr610431ion.9.1707858953403; 
 Tue, 13 Feb 2024 13:15:53 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWAFpMJ+KVB2Zc7UVQk0RQ4VmcV2+VNlbK3+S6v+AOBpYdZETOgg9DtqNHMQztiN4Ls5Z4SdmJkEn9YFULUm6CMST/xxXTL5aOStMpbs6bLaSaWEJlo52KYrBWcZtrRKEe82SR6UBKZTF/R3bN7a8ginsrHkVIOm+vTLAKA0f/GNKufhJUx68VH9/4IQ8gooUlzj47+lGAeeF3kAp2896qLesSb9LExa6WG53BRURlNQGGD0K1j/O4kobzS+jxm3vIrrQ/DF7rXDw5ex8BEK8rUYdr9/v9zwbQYHaXlw4aoIVPAMwRrMNC/J3ZqpvxXf+8rntkAlv/Ww9ishFI6bFXOF5KMxfaDranP5s+c94hRSr6/wDE/viWFM+EDmew+Uk7Y6K1XxDTwMO8lbfC1x4JbITmPMZGqwK33m69R0cABDaDEuF6SKrdg+dSj9dVtvcp3ZlNPMYKkFEg9wGgCkK3AS56C27smvKv/nilqnvhgiyumszYSVkOMfkC1+TOn27fgDtcBPINPjOekqFct6We8o1Jr6CrKM/exgL8etnufXqHYDoz3RuiXP039mWm5zJfAKNnLAVXcgspKrSgMx5JnJyo+8+QWjkN1XgK4q0N4wr+0368nS70EDrqCq+FFsRsma9Y7OBr5STEliB7g0+eBE3L4Ce+WmQBSdiRPdc4G4lzsnzJ2Hrbo+W0zMr2HgMpSjSKKbQ9kKnstzOMbHVFXYYoxvI2qOoj6Mq9XdAvwMAMzBquUNw==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:52 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:15:03 -0700
Message-Id: <20240213211512.3918044-17-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858953; x=1708463753; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cui12cYZUDQtQ8YaQrMt0Ei4PYCEecCA06FpUmltf9s=;
 b=NERXaZfeLW+YO0x/WorrwO5htJyJ7eA3Y4YiGSujJxFO+mvHTKUjYa/YQxAhoG3h8I
 AnZcoXZ0M4NLbaKPeWMA80ALgPUkwjQxyrIvuDwIQO1YoH4HLP9BaTEH27rM++vQbw1V
 gq4aT3irr678TK7sTbMuoPteNQSp/oA9WaluHnCbWgHj//dopcoQoJIuPYQq1WPgXqra
 Be0vtTzlAS0fS1Se4sj+ypyk6ChkoBHbQyavvkZfnGDHdkyVh8hcJ+DZKBXGIaA2rUw4
 vM1lil++Dxm/OEhXlFHs0kjb2+tydIuToRTyHm9MX5YnW2XlTyKCDZKQwD3tQm6uCDYC
 gT1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NERXaZfe
Subject: [Buildroot] [PATCH v8 17/26] package/python-iso8601: migrate to
 poetry core pep517 build backend
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

We need to migrate python-iso8601 to the pep517 poetry-core
backend as setuptools is not supported when building with a pep517
frontend.

This package currently builds using setuptools as we do not yet
use setuptools with a pep517 build frontend. The package contains
a setuptools fallback which only can be used when using setuptools
without a pep517 frontend as the pep517 frontend will only use the
build backend specified in the package pyproject.toml which is
poetry-core and not setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-iso8601/python-iso8601.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/python-iso8601/python-iso8601.mk b/package/python-iso8601/python-iso8601.mk
index ce25a2fb28..080daa4693 100644
--- a/package/python-iso8601/python-iso8601.mk
+++ b/package/python-iso8601/python-iso8601.mk
@@ -7,8 +7,9 @@
 PYTHON_ISO8601_VERSION = 2.1.0
 PYTHON_ISO8601_SOURCE = iso8601-$(PYTHON_ISO8601_VERSION).tar.gz
 PYTHON_ISO8601_SITE = https://files.pythonhosted.org/packages/b9/f3/ef59cee614d5e0accf6fd0cbba025b93b272e626ca89fb70a3e9187c5d15
-PYTHON_ISO8601_SETUP_TYPE = setuptools
+PYTHON_ISO8601_SETUP_TYPE = pep517
 PYTHON_ISO8601_LICENSE = MIT
 PYTHON_ISO8601_LICENSE_FILES = LICENSE
+PYTHON_ISO8601_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
