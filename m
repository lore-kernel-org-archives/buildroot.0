Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06BB6C25B0E
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 14:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 792AD4051A;
	Tue, 16 Aug 2022 14:40:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 792AD4051A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgjIuN6fNNP8; Tue, 16 Aug 2022 14:40:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BC7D403F9;
	Tue, 16 Aug 2022 14:40:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7BC7D403F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5DD51BF4D6
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E5E682983
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 14:40:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E5E682983
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uk8Y1AlbwOnt for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 14:40:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAF2681D4F
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EAF2681D4F
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 14:40:26 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id bs25so12910444wrb.2
 for <buildroot@busybox.net>; Tue, 16 Aug 2022 07:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=6dASX9ehbUfaBORWhrV0/BlLF9SfyEu6ed3rMr6SocE=;
 b=F8sEXfa1mmJsonio+4k7R1cj1AXXVg7G6jc9ps2hZTPOmf2eeNv06w98+f4+brD6zo
 oB6TOVzsbwKLw5QGSnGVxODSYSlCzLYWCFgAoGkS9cYXGbABSqqjMh8GQs++NLmtrzgC
 4R11f921kOFjRCEcuaLDhA0bPFi1bfC2zym6RD0nzAWw1dWxLqq/48ckoZ3h0tsaDuBz
 HV7mPmQQCc7o+swePjwZm0eR9SPfaiKPx7D2TMiKSr87zjzwlBXpW8rjt8yszSCMEknk
 hAY6CISUUxYBA848CeKeWUnwcbxbMkvY4zgaWnaO3g9X/07mQV9bzsNykODeQfYMx8e5
 DGAw==
X-Gm-Message-State: ACgBeo2dTQ3Xwc5TqvIXOS+XU9hXSgb78MZdlE0wa86HPRPB3p/ASGp8
 jf1HnlUgdeGM0KT3x77gX1+AZuMgUoY=
X-Google-Smtp-Source: AA6agR4D7Lg0NXCrA6MBLMv9NS3IDq198Wma1PV30h0jqqLNhTV9U/ctc9X02QVikqPJrRC1UYFa0w==
X-Received: by 2002:a5d:6988:0:b0:21f:bbc:65f8 with SMTP id
 g8-20020a5d6988000000b0021f0bbc65f8mr12094854wru.537.1660660824881; 
 Tue, 16 Aug 2022 07:40:24 -0700 (PDT)
Received: from pc-140.home ([2a01:cb1c:794:2300:d109:33e7:bc94:49e5])
 by smtp.gmail.com with ESMTPSA id
 j36-20020a05600c1c2400b003a4c6e67f01sm13844300wms.6.2022.08.16.07.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Aug 2022 07:40:24 -0700 (PDT)
From: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
To: buildroot@busybox.net
Date: Tue, 16 Aug 2022 16:39:40 +0200
Message-Id: <20220816143943.16142-4-guillaume.bressaix@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
References: <20220816143943.16142-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=6dASX9ehbUfaBORWhrV0/BlLF9SfyEu6ed3rMr6SocE=;
 b=pbDqECEN6B/sS0/eTb4OcLVD9dNtYm+o2k37lH95ZUEK/pJqL7NZcHVi4u3KoPNw+M
 s94ja58zz8P7v+Unv0MI+72umVn7JKN5pRvq8PF287OyFUX4VA5Mv9+OdeurwSue2zzZ
 uD9WAvIObojLYRybtXj58dwzMpZPv8E4qPjtlM33bgYscy1vuK3HqfyrPopmT/5Pw37c
 oMEhKqN3XLeA1Pe4kqYvX99+UhYN//s7kFS0nG5fkqJYl5tFjKVoX+D9WPt217J7w7S6
 zNqSyOCD8N+Z0RoLUTYbEYS6xqObyhg+F619TLrbtsvLBuI6sMZRgMq9F4K1v3p295AS
 VMcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pbDqECEN
Subject: [Buildroot] [PATCH v1 4/7] package/python-pybind: host-python-scipy
 needs host-python-pybind
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
Cc: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-python-scipy is a build time dependency of python-scikitlearn

Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
---
 package/python-pybind/python-pybind.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-pybind/python-pybind.mk b/package/python-pybind/python-pybind.mk
index c5bee3d0a7..24b3fc3f68 100644
--- a/package/python-pybind/python-pybind.mk
+++ b/package/python-pybind/python-pybind.mk
@@ -26,3 +26,4 @@ endef
 PYTHON_PYBIND_POST_INSTALL_STAGING_HOOKS += PYTHON_PYBIND_INSTALL_MODULE
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
