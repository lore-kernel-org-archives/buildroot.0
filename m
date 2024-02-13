Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB3DC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F41782184;
	Tue, 13 Feb 2024 21:16:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ut2wfx88P3Ae; Tue, 13 Feb 2024 21:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2EF482362
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2EF482362;
	Tue, 13 Feb 2024 21:16:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC0021BF310
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6D9D415FE
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOu7vXiH6_6C for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 07D03400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07D03400DC
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 07D03400DC
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:58 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id
 e9e14a558f8ab-363ba083d84so517715ab.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858957; x=1708463757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L/ea4G80Bn+tzKw2w6IunQDRqdrtOFXuuAAC6fXvp7M=;
 b=sdrWgLhyx50K2QdCYAW0deLBSO8NMbyo/IhrSYIpnrG4XSbOznxRlmRI4xmaaoWQhP
 rH5W5l4kLCIyRAa2HVOQTvgHcL8mxAsF8XyOxvdrBdu6e/9fUFJ9FY1gLdviwENIBPMH
 Zsw0wc/k8wEOjE7/qQaMhFDtA2XeYfSLr1CV7bExJBnpckLlJdkAJgffHtjL9MfYsTAa
 zGC4qUh2bkRA8AkI0+e/GwLV/eSwGaDRd8eB31JxVV5p9ezDFgTd5DqvtKtMRmwrAhmF
 8JoD8PggE2kBrWwnUSS9WVrLXN+gCWKtEVJgTPpZhf4RsGy2JNa+TT21bzq4oJixU2uc
 ucDg==
X-Gm-Message-State: AOJu0YzbTpzmkp2O+nYQg3nCqn3ePNeaoL/ywAkqX4yqwQEMmJdu2AxL
 ljnLcP9okCj9uxJsjEV5d+9IXeGgOfamlRCPfk/XoF3MhYsLyEqcZH+hhC/WpLsDNg==
X-Google-Smtp-Source: AGHT+IFuUEQFoQEHFXbMY9uxb4B4HMYeH8wekFP6QZbvZDtcTfbgVh6GD1XxHxXZc5l4lmH6VoWsSA==
X-Received: by 2002:a05:6e02:1aa9:b0:363:cbc0:ba9a with SMTP id
 l9-20020a056e021aa900b00363cbc0ba9amr15121ilv.16.1707858957651; 
 Tue, 13 Feb 2024 13:15:57 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUixxkjAFldv4R83LGZekoi3FR0POlTjP2ETqXemvt4eqwlCpQ/1YATtyep22sBGZPDMCkKioj35W4aK038YIbD85zPSQz8xAGAj9JsBT8/Mpcao1L4bnfCgEK/N8rRLCt0yjeTVbvk2ZGJe52aX8gS7e3JZ/j+ECrF49xVOEbsuLez0oa26jqeGP7zpvMJBXg3GbTdNk8vnm0hdzwEt8q312ajX2ZFF/Gywks3Z+LVcHWwZ/UBwGjYSxYZWtltdJPvCX/Ca7bVPzICcOvJl0jIUVKO0FRV3l4Q5KgqehthXczeXKyyxuiu0Hc5EyjwSUXwvNrnrJrVo0VkvOxRXvrReglWP/fzQ3SNvH6o+BsVaQItz6h3SR9y23PsOQ/JmqzGDyJPo78hvWrEAAN6rNcwkHByerZyJpEg5D1A1XTf4NF6yQSxplVoAJD+htAakjUrGfDIJdZVVoKhIhRTe1kwiGLBE5FKvkBKQskQ+41BwZyUlFkaes3KfwY4MAZW4xA3jW+bgsSsT6l0Psd3hV+Co1S6rXkh+VSSap8ZkMfHuS/dhe4Mx8jJP1Di1zkuHxlqq8cD9DKVP7JKDv2vsswxUMyUF7oWaB/NjS9DAPkc/G4AYtePJnOMaHgjY1DmxE34Za3SygldsWyMIEOVF8guQOOCNFO1TMynD/YVXi97eM8xWmMMV0MJSESOAMqAwZ3Jz7RRl2vxN3V7gZiJ44B5RjhzWy3zo6dt6CuuKuA9ti4LBVqrew==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:15:06 -0700
Message-Id: <20240213211512.3918044-20-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858957; x=1708463757; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L/ea4G80Bn+tzKw2w6IunQDRqdrtOFXuuAAC6fXvp7M=;
 b=idX2bvSQvQ/Qfg0z0cVWL+ZEn6jPmyMn/iU1jj+ESY+RG4uyJib1ke3fmKZ3utyTja
 iqqRy4Rh2EYqcdR32CP+5leq/K6bMFY/jnVaFpZRyqo/hEyBDI+HH5xSu9ZtYu93xhYL
 +TOGMQLEqP7I0xjHcPcU1KeJO1U8PmL2x19mlFRTf3Jf/JGleoZgUPRBwI/O4wQ688RI
 FrEv3dYm+g/bQJhFzrwzr9sVkULkQAQdlvWi0wyhXYn29IsBEzaaaXNeXmWTa/xojrjr
 2dnozmzpf6HDsIrtIu7vDQsdwC60+gk2AbE8KbSikmIy9NQ6s4hTzHa8W9HUKJYtxlEG
 o09w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=idX2bvSQ
Subject: [Buildroot] [PATCH v8 20/26] package/python-sip: add missing
 setuptools dependency
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

The python-sip package requires distutils which is no longer included
with python but is now part of setuptools.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sip/python-sip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-sip/python-sip.mk b/package/python-sip/python-sip.mk
index 3e015fa16c..392928f01e 100644
--- a/package/python-sip/python-sip.mk
+++ b/package/python-sip/python-sip.mk
@@ -9,8 +9,8 @@ PYTHON_SIP_SOURCE = sip-$(PYTHON_SIP_VERSION).tar.gz
 PYTHON_SIP_SITE = https://www.riverbankcomputing.com/static/Downloads/sip/$(PYTHON_SIP_VERSION)
 PYTHON_SIP_LICENSE = SIP license or GPL-2.0 or GPL-3.0
 PYTHON_SIP_LICENSE_FILES = LICENSE LICENSE-GPL2 LICENSE-GPL3
-PYTHON_SIP_DEPENDENCIES = python3 qt5base
-HOST_PYTHON_SIP_DEPENDENCIES = host-python3
+PYTHON_SIP_DEPENDENCIES = host-python-setuptools python3 qt5base
+HOST_PYTHON_SIP_DEPENDENCIES = host-python3 host-python-setuptools
 
 define HOST_PYTHON_SIP_CONFIGURE_CMDS
 	(cd $(@D); \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
