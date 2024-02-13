Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4454BC48260
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 21:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A349E82279;
	Tue, 13 Feb 2024 21:16:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 18X-D201mthT; Tue, 13 Feb 2024 21:16:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C55A88220A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C55A88220A;
	Tue, 13 Feb 2024 21:16:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 386DF1BF909
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAA7A415FE
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 21:15:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d9UgckC56ra1 for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 21:15:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5B369400DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5B369400DC
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5B369400DC
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 21:15:50 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-363ba083d84so517345ab.1
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 13:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707858949; x=1708463749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KnbhPrY13WjsvxSNbDdvbSpvZVXn2QZQERjvF9bT180=;
 b=mcpcjgIvMeq/kU2d6AOVe0jpZ3R+bYPXdKZ6Ne78mUjVKED3Vjl3+gC4FbZst4ZnV4
 DSjfPj29BtqwyjTASKDzxNcYoeTKQORhWsO3rh+iGoKjMaI2M3++VsWMOAlx8xM/h4Xx
 cW70YYJqsDBfp1oZb6tG9vlklJeWdmlQXSxDeSo07ErtXpMsGCX4D8V5R5IlhRkrs67V
 Qd8aSC1N7k6kwJrt+GtU+s8BS5C5Mvd8n6hHPBdSX0MHDmNyp0hNxoqbNoQf6E/1S8iD
 dkVap7/UqZRtXmCZ6byBv2kU+9d77KGijx4M/Z1HXKjKsRFmxnmoW8yjUfRlynFLdc79
 yFag==
X-Gm-Message-State: AOJu0YxwZxXJetBaPXyF3A7Vg8ewKv/+H5Lgm5oKc/fqlrYzNleJy9dQ
 M+0SXrtBE+opjAQlnbRjbdmCgGRIJXtizOiOfTT6ungu9D4RePyBcO891zqNx6y56A==
X-Google-Smtp-Source: AGHT+IEev3GyfYVHntcFJcqJP1VlgqfdDej6voyISrZdriIVOUONs03n9lnWDMiGp4ea/pQG8oevgQ==
X-Received: by 2002:a05:6e02:1c05:b0:363:8607:1fe8 with SMTP id
 l5-20020a056e021c0500b0036386071fe8mr21340ilh.11.1707858948878; 
 Tue, 13 Feb 2024 13:15:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXbaCChrd+JjazGpAEMhaGz6u3zBf4jfAS5ORiZvZBUO8ZmePPSRtvVYigqQC6NNV2yBNZqUv4nts/q1agQniIDjO7wd9QQ1UiOBuylsCw8Zvpfh91WlOjiX09ewZJa/di338qaBdaiwvxfIMvIl/yNXzUmtYq96OZq+DtkmyiPuiVcFe1dgL0KRN8Ct3Sml/hLxQMNx/BHYmW9Vs0heuABnW5ya0z1hOix9kpHDkMeFmLBhHCt9aGMIX/zDv/y4i2l0AFpkzdxKdqb0fVyihclDbllIgsUpakYewKUlLk1lV8bRPGrA+7vbMLdTbl5gzvi8gSJ5uJZHfDE98nUAG5vH6jhHNKk6qIS4ZvrBlCb8fsI2jJoxo/g65kyg+9Gg7fJu+4mNBtlrlqOPQ5g3BdoTKDHuQCYQu3Hm+pxwaTNysS5lqHKNXuohPjfGIdaHZay4jC8P0TW7tJyq55dux2pv0ioK+7MOvgj/89OpGrCU/MnjUtr1o0/f3VrUWBCx6zQtB++DM0K6omViFGbsMlB5QbfvJsMBJTpkRLYqxl22DxEtB592JV9M5X1srYLO3HkBifkkVejhJ7DfRvfP5AgRsJ3ZU25tZdRIZdO2Q6+GSb79wPh/AWbxMINzFYfZXfOeUt6k6AiEX0JL5QhmNYN0b1cuyZBk+h5mn9yRIcQP48VPLacu9s1tLK+BaybKXuFRHxRUFMshQQZjTtq7ojF8poIbFrvHEUyMdl7QyKU34XeeFR6Lw==
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 ei14-20020a05663829ae00b0047151636e0dsm2080336jab.10.2024.02.13.13.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 13:15:47 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Feb 2024 14:15:00 -0700
Message-Id: <20240213211512.3918044-14-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240213211512.3918044-1-james.hilliard1@gmail.com>
References: <20240213211512.3918044-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707858949; x=1708463749; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KnbhPrY13WjsvxSNbDdvbSpvZVXn2QZQERjvF9bT180=;
 b=V5xjAIPMGyV10d2evxN6xTQugazQO6DhUfQlN/fJrC+1iIFM4IADo4PqEd1b7WzCHX
 GjgOKXw2Tsi9MpvMsr6swjAJOZ93+ixhGzRPBpyYoduqPEoTN9Ng5rCxNH+XjYg33tZb
 Yl91TYiPyM/2H8KqsSHsrAGG/jOlw8Fc8a37fl15bV5viR+312+QdbGvWAryGoYj7CpV
 /39YdbwLl91C+qhWARSkXk/XnZG8TWq8rEA8KRWXfMKsXg8djI0TUABle/8T7l1UV94q
 po5HsWHZlNJuIXCpggh8ANQfbpO9ss/Rs324sl7TnIlzom6fQNPbCrPJI6KOXnyCFrnu
 M9FQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=V5xjAIPM
Subject: [Buildroot] [PATCH v8 14/26] package/python-expandvars: new host
 package
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-expandvars/python-expandvars.hash |  5 +++++
 package/python-expandvars/python-expandvars.mk   | 15 +++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 package/python-expandvars/python-expandvars.hash
 create mode 100644 package/python-expandvars/python-expandvars.mk

diff --git a/package/python-expandvars/python-expandvars.hash b/package/python-expandvars/python-expandvars.hash
new file mode 100644
index 0000000000..0123ed5420
--- /dev/null
+++ b/package/python-expandvars/python-expandvars.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/expandvars/json
+md5  8091f578a547e2b4b9df59100a179266  expandvars-0.12.0.tar.gz
+sha256  7d1adfa55728cf4b5d812ece3d087703faea953e0c0a1a78415de9df5024d844  expandvars-0.12.0.tar.gz
+# Locally computed sha256 checksums
+sha256  b8a43c35080fc5855e4f8171e4d0d002f6ff1633d8cfc0b5dee0ac4ced2deac7  LICENSE
diff --git a/package/python-expandvars/python-expandvars.mk b/package/python-expandvars/python-expandvars.mk
new file mode 100644
index 0000000000..5c9a7249b3
--- /dev/null
+++ b/package/python-expandvars/python-expandvars.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-expandvars
+#
+################################################################################
+
+PYTHON_EXPANDVARS_VERSION = 0.12.0
+PYTHON_EXPANDVARS_SOURCE = expandvars-$(PYTHON_EXPANDVARS_VERSION).tar.gz
+PYTHON_EXPANDVARS_SITE = https://files.pythonhosted.org/packages/2b/a5/46d1f58edcae1d632fafdfee313e378240e002ae45d26502bac938bd8751
+PYTHON_EXPANDVARS_SETUP_TYPE = pep517
+PYTHON_EXPANDVARS_LICENSE = MIT
+PYTHON_EXPANDVARS_LICENSE_FILES = LICENSE
+HOST_PYTHON_EXPANDVARS_DEPENDENCIES = host-python-hatchling
+
+$(eval $(host-python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
