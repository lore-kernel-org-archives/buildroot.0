Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC67C48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 17:28:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F99041606;
	Tue, 13 Feb 2024 17:28:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJ3rOZxFk91G; Tue, 13 Feb 2024 17:28:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E65E54161B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E65E54161B;
	Tue, 13 Feb 2024 17:28:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5BDDD1BF30E
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 560AB41586
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 17:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SMshYNmSgOsl for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 17:28:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2265D4157F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2265D4157F
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2265D4157F
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 17:28:24 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-337cc8e72f5so3272315f8f.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 09:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707845302; x=1708450102;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mOLh0RsIFJ1lNpZKv3g/pkFhpAvbE74KoQbd+ITTrTw=;
 b=vcE/5eWXUWrwszu1iwjZsHO5+XrtNF8Ak8srEiG72mOVcsPF5yhakGrpChuhVS0ISk
 re00SX+Gcoz7BoGk9TQQN2ngSjloFuSARZZgR+UIE9voEynR63lAk9Yh4qDtH2GbSETm
 a7Bc7Q4irrWCTPk76oQP9jsfkq1cr2LYyzXcdzDnZnEKN5Ru2fFWYVzYlgCQX472Ggiv
 rVQW+h3hc13DXlvBfj9Fxz53sgzmVDlxmQ5kE6Zx100UVUuK/YPqzol9ol27bTmC0RkS
 wYOjPp/eqnLgyr16Ooffn+W/mmYq9NarQisMXvLsurIuVpunD/dGDj4od8Acw4kv9C/m
 EvNg==
X-Gm-Message-State: AOJu0YxZ9I4GAHKTns+B9k31r2/ZjAteKv0geat4LN1jmNUf/+F0esbK
 1PUGDwVbfbM/4ApjuavcSJq21gevkLZ9iQwJxeFd13JgCkzI4GRjOWmHd8Ec1KLJiqB2r1JE/U0
 8
X-Google-Smtp-Source: AGHT+IFnRjmcDX14htdaGbI2Tivjb4MvTsvxmX9vDfbQuGRp2p62hXuDJxd7rnZpkngWq65+Z7Wvhw==
X-Received: by 2002:adf:e8ce:0:b0:33b:7b43:4ea4 with SMTP id
 k14-20020adfe8ce000000b0033b7b434ea4mr4812064wrn.28.1707845302259; 
 Tue, 13 Feb 2024 09:28:22 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUjjw7Vijq9bk3kRegGpqN/zo9+2hVdfTr6ggMCQcXgefYMJ5j3AxpX6Jc6359k8jirXUuTY0mprT0AcshEduEFFLtJF5DZzZhhxCvVEkiVCh/Yvs0ct0yOaXM/nR2wksM8yw8=
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 by19-20020a056000099300b0033b79440fa9sm7850146wrb.111.2024.02.13.09.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 09:28:22 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 18:28:00 +0100
Message-ID: <20240213172817.2872849-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213172817.2872849-1-romain.naour@smile.fr>
References: <20240213172817.2872849-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707845302; x=1708450102;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mOLh0RsIFJ1lNpZKv3g/pkFhpAvbE74KoQbd+ITTrTw=;
 b=2piENZ5wdB3RPpxwu6atw/vb6GP8YOFqkbtCJxV8+T/A56koksTCCYuei6HUxB0l8Q
 XT/ooxK3e6lL3ybRTHB0DzXManABHz6jotHNf8Q/bxXl30RmxtmFZcGtvIYHkLeSomzx
 KnF9xLH3hL2Ha8s5xSxvmmWuR2s1e25RKlBXdsRDE6Cs27JtBN5AOKy+LZaas7ut9Zll
 +QRi/d0b1k1EKrIMz4bqhr6FVF5qmUi0y4acsbt5Wp/5rKbAJe5Clp0L7c8KuGY7ZHe/
 LxugsxfGJag1bAncs88LIr8inAsvuvRK4BEg1VSu4oYCpAmeBF9pmDwxclaeh+UMp2Zf
 TAjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=2piENZ5w
Subject: [Buildroot] [PATCH 04/21] package/python-attrs: add host variant
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Recent version of U-Boot use binman to provide a mechanism for building
images, from simple SPL + U-Boot combinations, to more complex
arrangements with many parts. This package is required by binman.

On some plateforms (curently TI K3 SoC familly) binman uses
python-jsonschema [1] on the host that requires host-python-attrs.

[1] https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/tools/buildman/requirements.txt

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
[Romain: extend commit log]
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Changes in v4:
- extend commit log
Changes in v3:
- Drop Config.in.host
---
 package/python-attrs/python-attrs.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/python-attrs/python-attrs.mk b/package/python-attrs/python-attrs.mk
index 8a1236cc44..fb1729e62f 100644
--- a/package/python-attrs/python-attrs.mk
+++ b/package/python-attrs/python-attrs.mk
@@ -15,4 +15,10 @@ PYTHON_ATTRS_DEPENDENCIES = \
 	host-python-hatch-fancy-pypi-readme \
 	host-python-hatch-vcs
 
+HOST_PYTHON_ATTRS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme \
+	host-python-hatch-vcs
+
 $(eval $(python-package))
+$(eval $(host-python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
