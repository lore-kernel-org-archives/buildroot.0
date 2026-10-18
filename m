Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A411CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2871605F4;
	Sun, 18 Oct 2026 18:25:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sHcAEFnpz5mi; Sun, 18 Oct 2026 18:25:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0B4D060644
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347922;
	b=mSNQOhtI4jow/6foYvt84LWUN811YNhoffbKL48JlPUMhF0wTju3MvvTmCT2sj3MvoaQ
	 ytXsghpcLdDeSePVPaAT+k+C4qOzzIqjZOuD4f0AeXQUKtQL47E8yxdzQua04hQq9frvr
	 8bMBpgkRqsJbA+C2Mm8duq7DYp/5+F15duHLIjRG6WaNBNWQiraVhZHjFMEnS1U2ZFv0M
	 zr/MHkWitSKkcMXmvPPuEeaKUr4757dLXsQYvQ/ho9v5HnFxZthf8wSGJd8t0OyM5+rw7
	 +iufw2TAi9sLpYBjk0Xk8jrI+67VMCst2rCVrtqWX+6VXBEp5PrLGkGGvEIpNX+FVUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347922;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ge5sBGa06rhKjv0aKKa+NVCUcSvQCU+PhQAWE4aBnAA=;
	b=DLeAu4053BiMwGRhjXmvCHaPMN59l4OtiX2e23ZT9uMjM3cHPgrudWBJPUwt0JMoh+gK
	 MmFpTHMBpd6dALFes7sG81HP3oxlRsnrh6xgkr3JLUn5B4O+n7YSM65dJ16A61m3Gz0cM
	 nLb4WLldhFjigscKbCnW+Vve4HkhkFZSlrRePW6FDgz1yEUXfyX5pgpq1Qv3IlMMDZKT2
	 rVBjY400w3PdVgYCkh2ODpRR6lIo+CVE/LujhZWwsYyn2iw11PeUhoYgVShmjVOmOqcjw
	 bPRthYkv+axEgn2Geuk4JABztp7t7jZNWLr+VIm8AGJKX0Q1eHtu8mvrLsQrQXK8KEQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347922;
	bh=ge5sBGa06rhKjv0aKKa+NVCUcSvQCU+PhQAWE4aBnAA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=rAeVt+64/jtG1A70Ve7XQnaSW9xpGOelln9eh7bu8ynvX2waD9G+cxlEhbnOvVIOS
	 EuLS1iN7HxmfsxymPaf098dgDbmgnsG5Ge/ubhcPr7mieLGEIKhmCB3SCw5XTgyvtB
	 SWlLe+XbGIVKF3Ulk5zVuOjvBkXLoxA03d2O6gbkVYiz5xt2znFDvioNiAZAvGF06K
	 6AGFhEIodPmls113ELVADHhW5e3+/kQwUcFjNQLLgeMHR+5e3Ha0x0V3YqymFXQ/VU
	 4fb8jy3LZCL67sOygK8wAjrG5BE77gLNFkbDIug4hZl8sO3C7tmuAGIBCQSivpFJcn
	 XoZsUenIk5aqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B4D060644;
	Sun, 18 Oct 2026 18:25:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ABC3C1AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DBB64009E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiG7p0G3vGox for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org B21064008E
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::230"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347918;
 b=f4ltA8w5DEkX/JEAFZvGrNatgGxSOeLEjbMT7HUiHuYt6HtIvnmmJxoK7tELZ4Ok32Rg
 ZWbahQZzIJBYunt3g/DkIF6mYM1G0GlhNkVeA2ng9u2y6bDEwOI/pPp7LmyogMmxdftJe
 Q0IP9dsCw3c0Mz1NtoDNayLgAAUB8JQsW7knDhl7+mCd+EYlrqWApcKhW9cHMrznIicrb
 4UBD9aGHvGF0LquVAV3wp8eqx5pnS6iWVGhmHbTctd0ixILrSjmqcDSXHCO0pKNNIYnqs
 pXnqpCcGs32rUVAQDY70EaxM6r/ywH5WzmndoGxjpR6xNLTxhh5OkJlhXu6wX2Fbexg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347918;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=ekOrS2tOYOUK8EHvszCqgD4SQ7RFElUkqFEQfNOjnNc=;
 b=dKADYs832+zMfarsDfwXl64QNFBLHiLRRfQAN7mDSgmwQzc/hZsXo2ukzdjxwTtyNJPT
 RjrFz7F6fQf6MgFhobci/KT7GlsDkzRhkTqRr80U5NRdNQ3bPisUJKq338/7LGxbf4Szl
 1KNItL8WtB5tfJCc2iJg7jJftHztSnITYnaJX2pU7LHm/y23SKJEKR8mJtvNv0E2lTv9W
 o19DUwKfCFUDyPgcWNzJqbiXg3WsA84ljcchIDx35QWXRD/uH1IqQBjyCrgynJh1/vguB
 UFn9EvNYg6I+CA0GN0JEGVOfhENabl+ErsMvKf5vO3KUrU8bkdt3jbYqDxxGWS6ZnVg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=HXqeym6Z; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::230"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::230; helo=mail-oi1-x230.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=HXqeym6Z
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B21064008E
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:18 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id
 5614622812f47-53a448f86e0so862275b6e.1
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347917; x=1792952717; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ekOrS2tOYOUK8EHvszCqgD4SQ7RFElUkqFEQfNOjnNc=;
 b=HXqeym6ZShOFGd64HUpNWLoJdl6GJy44rbZLYW3uTETz6HDLOCc6O8ei/pSjC33AOJ
 cQQdu8bcm5RAYF4Vdv0Mv1HBQHFu16A9RxuG6tytHK4IBMeeNa1uVsARZB3hHvU1Y3k4
 9Bo/sfWwErcbFocH+mSaUNJR1A1JxvP/+mg9oVh6v0UN4o/LQ47XzvrzOa1ACzeMTZpE
 na4xmEQU/I1q3c98915ODZBVBDa+mlkwoLAJbSueFrdMGeTQuj4k7GwucPBOMiZ9tcGh
 vk6oqzXbGxmXxXgXwtX8AytQHZufG4tELndSXY8eMDTk24/wH+zEvWgJUBgqMzZOr5GJ
 /liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347917; x=1792952717;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ekOrS2tOYOUK8EHvszCqgD4SQ7RFElUkqFEQfNOjnNc=;
 b=o8ZaBqXfgYqNzBjf/EumxQwt5Xov8E3L/41Bp8q6CbOUnkRiWj5006kATwlBlKIGnN
 0tTMESmwZPzPcfQtio6lMzpyx9OwNFH9YxNLH2ZzwRJYJgBfGZd2xCPH3YiRInSP9KYK
 jwIy6Qz4tUtsmk/oD+8qMWXS0ng7iu5SxKCUfe64xvjwLMw6LX8nmOec5F+5nAYl9irh
 3MYKH6HoCj/lNe8PAMzCVYurJalVSzrrfYjdAR5gqQp8cCdjHcz8cYpcn4PNjCIts4b1
 Q50O4d+ORkTwAgt+evJkZCWcM254tAu/BHbDkhnjSCyqSQDG8dxdXMSiHB1gFcxbT4xy
 f0Zw==
X-Gm-Message-State: AFq9FYLn4eAgTZ/h1CJJIID6af2TI2HBdqGezg4ucw/drGY3Fq8nX9Ac
 gZwCFnbyZr3GBIE1QuIEV/M9GlKjenhCDnv5rPH0gWjgm0vS3qwyEzbnZvPIYA==
X-Gm-Gg: AYBFou0TzANITk4/IroBMBi6+I6vEsqACbkXKvk49+WOVdRlRFZpih5OiUZpjPvJJeT
 c3e61nXpyij7HBpbJV2sTeAZUY3X12Iw3rSs6iodKedK+pM2808vFbU0Pe0m/MDEj8IbbLRzgpQ
 VmafJgzEVb9n7lSYVIhQ1bPQlsulbOvlAGCS+GOAQnYTKhBnlH3uWHL+ZUXBnjDIoj1waouTF5O
 XO2tKJG+qduqkuLiu32At6oKhCAXIX8ZkVEXIasuHTc/VOcriify4GSSjldpgVKpvjFb2dGK4Xq
 TEenXGzOVw6O5aysE5jD4qGSTEVwpNUlZpTy1AoapIxDJIN20tjGDlCIoQXipllEl5HKiHp9nNd
 hQRJOzkrEICqABkSkQaQ4EUJ3oNGTCrIH4FQOyVD6Da4w6GlVQxVehPdR7JZCiKzVg1dJoFbjTi
 5lKtF73vgZ+pmeiCqZ6Tqu+MHAiojILzq2KvpLCCIddqTA/z08+UE5+isZzxBG5BZVZ8QIxGJ/f
 ac9bFyG8OEjhYqN8l6K9XuCHy3C2S4wQ3oqS96Q9BLs8Q3MgOYFvqfXVThMHDoLnnjI4zlXBkhJ
 06Jp8NLnaHyD5/gHIvKtu27IDtBNQVGzvk41FQ4IjpPRyQl8LlF6YJziS09b5BRkKKrj9phe7Av
 MhA8A119fB5DpDwl4I3bJMBDfirxHwivRDodlym5w5KQ=
X-Received: by 2002:a05:6808:bc8:b0:539:df4e:2d25 with SMTP id
 5614622812f47-53cd39ea43cmr4658650b6e.28.1792347917371; 
 Sun, 18 Oct 2026 11:25:17 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:16 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:45 -0600
Message-ID: <20261018182507.536698-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-fastapi: bump to version 0.146.0
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
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 97346560ab..8c4142b76b 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  de01fa672d0af011a4d534e5dfbe3240  fastapi-0.143.2.tar.gz
-sha256  e9e6d97018dcfd748da7d9e7c61cedefbe9eb91b1a3288e45b13fbae76df2d54  fastapi-0.143.2.tar.gz
+md5  1acee1cb23e9a402c5d8afc54cf5078a  fastapi-0.146.0.tar.gz
+sha256  e96047fc353ff43f7fda069c3578a7d94902a762d9aca2e065f7f801abd91a49  fastapi-0.146.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 1b373acdfb..6301b61742 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.143.2
+PYTHON_FASTAPI_VERSION = 0.146.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/19/f5/4bbb2df9bb6f365151f2c02795ca3f17f78d08e670a394df963f3d8881ce
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/cd/5b/f3b4277844c3ce66c16f62670cd2a26236489aa97115d04182171ce714a9
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
