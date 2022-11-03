Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161D8C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:24:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B58FA80DCB;
	Thu,  3 Nov 2022 21:24:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B58FA80DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TNDQENBhpfDJ; Thu,  3 Nov 2022 21:24:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7522B80D80;
	Thu,  3 Nov 2022 21:24:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7522B80D80
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F05991BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBF5781EFC
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 21:07:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBF5781EFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S-2vHLMB6r86 for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 21:07:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F8681769
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2F8681769
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 21:07:24 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id s10so581441ioa.5
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 14:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ujRsw8/68JvQqGzq35VVYrO2FF0effHazKhxtAkkEC0=;
 b=pAaBftlJAZKoC6rWB+oZyJYd1+wh76UmC0f5nV77k3Z/FH+0DH2hKaXXU+XUaR3cTK
 Q/9ezd/jpRKj2WGJJt0ru9dMSYjqSTtVlApIvtNzr0oWOTb3Av1GBRABx73lR5KumEhK
 tDfhxN0jCLA0y68hUab6uVdE/usqClMI5RpQBcVM/4wDXjs17IUSyPEU3XDKu1ikTbkD
 PIbh3b3eNaq494IHacpFRIVEF5sB1Yg12276mMRB/VKZ4Y37OnwkvBOaEqd2SVkMV+Hy
 N9JUI7GadAsQ7yvzdXfhQEZdFlKoCsmzI3meDx4Sf3hAmyncNQcfiRZ3Y6AhYiUQk9ur
 hY9w==
X-Gm-Message-State: ACrzQf2yDIgLqkvzBNABMTVDKUz6vuUqGocI7/oLbOX4VVBdkgCTNH3v
 fZwni/hvnhfQ2enr6rCPXnnHlRW1s4SQxDWr
X-Google-Smtp-Source: AMsMyM7p8VYzAsxCuLU4SCGArgp4TWPQ8seus0hdqdsbDDRFnlGWVl8PNmzh+wvXcr4L5U+sNL6xqg==
X-Received: by 2002:a5e:d506:0:b0:6a4:b8b3:a6f0 with SMTP id
 e6-20020a5ed506000000b006a4b8b3a6f0mr19751316iom.138.1667509643663; 
 Thu, 03 Nov 2022 14:07:23 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 l14-20020a0566022dce00b006afe1d84207sm751692iow.25.2022.11.03.14.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 14:07:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 15:07:19 -0600
Message-Id: <20221103210719.3477688-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221103210719.3477688-1-james.hilliard1@gmail.com>
References: <20221103210719.3477688-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ujRsw8/68JvQqGzq35VVYrO2FF0effHazKhxtAkkEC0=;
 b=gPBmAQhnfh+LZaMxjLoRbJtyDbjc6U1lCPf2jYk35oduAanTRq/kPJ6nad50s0abdE
 x4aIWCI6Ee+ioUA4qPeGUMiXxqlZTG87/Ts1qxcjbKi6j8AMASyzt1l4J9ysVIQfzYa5
 m9+m9LWSzqFr4dC3fbHsxd/4iYdkm90+/lyg/3nH878T8AwZnTpDvRQVb7OvzLeTWwp4
 F/AmW/TKL/Duz6ueg9VGfsu2bPfCdFqvQguZ8w0ncNL261kWRuHvT3qREBd5i3n18Vb+
 ntl3Z83qML19T2kkpK5ARL2iyylD1NFb4DwNlui+ToY032Cie+/S8ztrlsCBO+bWQGK/
 a9mQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gPBmAQhn
Subject: [Buildroot] [PATCH 3/3] package/python-wtforms: bump to version
 3.0.1
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-babel build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-wtforms/python-wtforms.hash | 4 ++--
 package/python-wtforms/python-wtforms.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-wtforms/python-wtforms.hash b/package/python-wtforms/python-wtforms.hash
index ed9bfd1a23..12b980de02 100644
--- a/package/python-wtforms/python-wtforms.hash
+++ b/package/python-wtforms/python-wtforms.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/wtforms/json
-md5  2b6ea167a71c6becf20f0934417fd06c  WTForms-2.3.3.tar.gz
-sha256  81195de0ac94fbc8368abbaf9197b88c4f3ffd6c2719b5bf5fc9da744f3d829c  WTForms-2.3.3.tar.gz
+md5  509a985769df13938c8307b55a614773  WTForms-3.0.1.tar.gz
+sha256  6b351bbb12dd58af57ffef05bc78425d08d1914e0fd68ee14143b7ade023c5bc  WTForms-3.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cf40d60ff34f6b2b68a53d220f8b66567b5ac8dd1119b37b62fd15e9518fe59b  LICENSE.rst
 sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-wtforms/python-wtforms.mk b/package/python-wtforms/python-wtforms.mk
index 23280a6fe5..65b5748b6b 100644
--- a/package/python-wtforms/python-wtforms.mk
+++ b/package/python-wtforms/python-wtforms.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_WTFORMS_VERSION = 2.3.3
+PYTHON_WTFORMS_VERSION = 3.0.1
 PYTHON_WTFORMS_SOURCE = WTForms-$(PYTHON_WTFORMS_VERSION).tar.gz
-PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/dd/3f/f25d26b1c66896e2876124a12cd8be8f606abf4e1890a20f3ca04e4a1555
+PYTHON_WTFORMS_SITE = https://files.pythonhosted.org/packages/9a/7d/d4aa68f5bfcb91dd61a7faf0e862512ae7b3d531c41f24c217910aec0559
 PYTHON_WTFORMS_SETUP_TYPE = setuptools
 PYTHON_WTFORMS_LICENSE = BSD-3-Clause
 PYTHON_WTFORMS_LICENSE_FILES = LICENSE.rst docs/license.rst
+PYTHON_WTFORMS_DEPENDENCIES = host-python-babel
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
