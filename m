Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AF9C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 20:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6BDE881E90;
	Wed,  2 Nov 2022 20:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BDE881E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_YItY9srCU6; Wed,  2 Nov 2022 20:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91FB781E39;
	Wed,  2 Nov 2022 20:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91FB781E39
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 58C641BF476
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:38:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40D9C409FC
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 20:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40D9C409FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FZrIx5SbUt6o for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 20:38:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23C6D409A5
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 23C6D409A5
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 20:38:05 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id y6so13065772iof.9
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 13:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mv6fIy90qGEvITPk6n1kzr3F/5y6/k/cFxfG9aEsxe4=;
 b=IbHV1KEwCCmV45e9KJuClCi0RbEsi/4DU24rYgHOmnFdc5f//ODgjQC+ijY7a4AaqH
 13Qq9FfBkfPy59IWohn4ZzR/ZYjblzahWEVWTIeO9p/DWiD275JV/W/yx8KK+UssgSs/
 prLqwWwYf9vka+ZKvtyBwL9NkABnC5PU9K420M+WukLa/4VY43UJN+SRf2i0qm6BMeEJ
 xiVUb97q5fpTwuJYFyYJ7VDBXG7pHP9VGPJ01X2L8uYuPHmOd5+//yb/v+qbX2sKiz8k
 iSd90az6gjGMABP1Y5CAPIHRDMT3DBeelZGLaNmBK5lGYB2qATFeCe+r21/torOvoSZo
 J4NQ==
X-Gm-Message-State: ACrzQf2YvXLv6QVWdG/Opda1XWFm8+Sysis87ef6n+8n+VpKThKjsh2R
 XuwFj0/P40XJDkH14ABlLVp2mZAf25MZ4A==
X-Google-Smtp-Source: AMsMyM7IT0vhw1dOK36GWAO7xuuZjRKi5mcVH/1/gJWti/JcJADPkMrJCE1AV7nju//wAe3RfAvWcQ==
X-Received: by 2002:a02:8781:0:b0:375:3779:9061 with SMTP id
 t1-20020a028781000000b0037537799061mr16490771jai.308.1667421483406; 
 Wed, 02 Nov 2022 13:38:03 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 b15-20020a92dccf000000b002fadf9505b4sm4854297ilr.16.2022.11.02.13.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 13:38:02 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 14:37:52 -0600
Message-Id: <20221102203752.4053123-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mv6fIy90qGEvITPk6n1kzr3F/5y6/k/cFxfG9aEsxe4=;
 b=SQpmIMGLNA9xNkoNdwjvKDJ2NHFMHDuD4UvwknsdeGAjF3rE0MeVdMP2slsmc2EDye
 KMx/3BxjYlt+69HazCRb171SZP4qxZ4PM+Wq0f84dVlZ3JNzg8LkeqPq6Ov6Lr6LsL4y
 lzLXeuLOl9JX+KeCCDoFk5o2ZbdcBSMDmq/HtuvJaiKdsrDfhlm/UYODfsiwfLfRyvX2
 1G5O2gaIjsWrbpa1lojD9HJMC1IpQ4jw1P3V2I82uO4BpwZdCW5LcEkI8OV9GYVhEdkA
 mDCvWw3Dr3G7wE/DiZBn2K4TvEMtM/Nk7vxi03evkXZLxEyHJRrwZPXtZF0L58M9fzjW
 hRpQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SQpmIMGL
Subject: [Buildroot] [PATCH 1/1] package/python-flask-sqlalchemy: bump to
 version 3.0.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash | 4 ++--
 package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
index 4c2a701eb3..50ca14371d 100644
--- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
+++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-sqlalchemy/json
-md5  dcb6b62248ced71dab183f2cb2778583  Flask-SQLAlchemy-2.5.1.tar.gz
-sha256  2bda44b43e7cacb15d4e05ff3cc1f8bc97936cc464623424102bfc2c35e95912  Flask-SQLAlchemy-2.5.1.tar.gz
+md5  cbc5756b7e14683de1a540516159a81a  Flask-SQLAlchemy-3.0.2.tar.gz
+sha256  16199f5b3ddfb69e0df2f52ae4c76aedbfec823462349dabb21a1b2e0a2b65e9  Flask-SQLAlchemy-3.0.2.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.rst
diff --git a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
index b1d00ad6c0..ca6fd0c793 100644
--- a/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
+++ b/package/python-flask-sqlalchemy/python-flask-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_SQLALCHEMY_VERSION = 2.5.1
+PYTHON_FLASK_SQLALCHEMY_VERSION = 3.0.2
 PYTHON_FLASK_SQLALCHEMY_SOURCE = Flask-SQLAlchemy-$(PYTHON_FLASK_SQLALCHEMY_VERSION).tar.gz
-PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/35/f0/39dd2d8e7e5223f78a5206d7020dc0e16718a964acfb3564d89e9798ab9b
+PYTHON_FLASK_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/0b/b7/05a8f9c3f010775275f8dec53e40ff7ea1ae61bf1cfa4b524caf4d3da982
 PYTHON_FLASK_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_FLASK_SQLALCHEMY_LICENSE = BSD-3-Clause
 PYTHON_FLASK_SQLALCHEMY_LICENSE_FILES = LICENSE.rst
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
