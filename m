Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA2AC369D9
	for <buildroot@archiver.kernel.org>; Sat,  3 May 2025 13:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F99C60B34;
	Sat,  3 May 2025 13:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-TpTnQ4CwDr; Sat,  3 May 2025 13:53:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D88F6607B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D88F6607B8;
	Sat,  3 May 2025 13:53:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 820C3C8
 for <buildroot@buildroot.org>; Sat,  3 May 2025 13:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 723FA4117F
 for <buildroot@buildroot.org>; Sat,  3 May 2025 13:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aNQbptC6g-1B for <buildroot@buildroot.org>;
 Sat,  3 May 2025 13:53:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=josephzik@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B98A410CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B98A410CF
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B98A410CF
 for <buildroot@buildroot.org>; Sat,  3 May 2025 13:53:26 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-43d4ff56136so3667005e9.3
 for <buildroot@buildroot.org>; Sat, 03 May 2025 06:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746280404; x=1746885204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BdWZzWbPmm5ak+CP24M89SZwDLt07QAymWJvw/uggDk=;
 b=F6rJU/rJIE4q7uB1CTA/JiOOm+aYhLTFXsB1s7oKH2BTJuKUYnu3Ioyz3gmIOdnvVR
 TJ3RXXV53HBSMwhsUTtrFnV5S24WqRZhORbvB6oZdBf0Nldra1WcCI5d0p1DYRgPETo8
 sTJBEH7uw6rfhdCvnO0OAGS+ZDcx3/AgKzctW20WfwrqdYYpO6pVD72qoZZNd2hyM16Y
 RVVkxVfL+b6Wu2jU3+imbSU2tITxISbQVcqZPo7mitr5XtbEGJY3KnCz0lrsjJcP2f3c
 QmPa/Yr748k6jFdm1ipl3u+S9FQh34sarPmjqYXRpOTxLvw/Zhl0gjU5A1F+cQjXlstm
 mYrA==
X-Gm-Message-State: AOJu0YzNNG6W5T11wfcwcRXbxWt36Wu6dfgOpqe6p20qMI+8clGjfVmG
 TGX9LDLPRR+yTpcxXh/6FRkxcEipwxtjVOkwlXEP+9F3OQwciZOSjWpR2lAu
X-Gm-Gg: ASbGncvgbVpA4SIEqQyhvUlo32TQhqNkLZHL87+QKgVuH+j/yC7thJTxcV6Ts3cJNf5
 wOuRxveDLEVqZw8lu9LP37kpfN9KtYqdg5gx8prjZ8MyMrPzsltfU16YOU+1OOoTAEuFVwVcaPn
 ebm89FnG6SZCjX6BHJFqz5GQqeMOYoxdjzkngm2DJUe6G9QaKWeumNq+wAv3hYxTvywT72LEo/Y
 IwZKzgy1d5EKYuneBpLRSOipbB7V0pEK2Rzhb+siWAjC/aNti1Bf6enV/G42ffy3w4IVdCjpr5K
 17mq1aoT6EXoUhwv2G5f7AVnK01htQ==
X-Google-Smtp-Source: AGHT+IHw51VCCacAhoTsVcqyqaF/h44jEBbr6BEuEOIkbCDfGPnXHwfC8WJW4OdQOftJ4uDB+UgVUw==
X-Received: by 2002:a05:600c:1da8:b0:439:9fde:da76 with SMTP id
 5b1f17b1804b1-441bbe25a83mr23725815e9.0.1746280403953; 
 Sat, 03 May 2025 06:53:23 -0700 (PDT)
Received: from kampala.. ([41.84.201.45]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-441b89cc4f8sm76451935e9.1.2025.05.03.06.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 May 2025 06:53:23 -0700 (PDT)
From: "Joseph Zikusooka (ZIK)" <josephzik@gmail.com>
X-Google-Original-From: "Joseph Zikusooka (ZIK)" <zik@jambula.net>
To: buildroot@buildroot.org
Cc: luca.ceresoli@bootlin.com,
	"Joseph Zikusooka (ZIK)" <zik@jambula.net>
Date: Sat,  3 May 2025 16:52:09 +0300
Message-ID: <20250503135217.490404-2-zik@jambula.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250503135217.490404-1-zik@jambula.net>
References: <20250503135217.490404-1-zik@jambula.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746280404; x=1746885204; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BdWZzWbPmm5ak+CP24M89SZwDLt07QAymWJvw/uggDk=;
 b=W4/8x9GtHuv51kkbphJXpL64JRLHQ9w0qikA9M5bKqr6uY7CZRiusmVBymnYUDSg7r
 HGVOdbdRHQueWHTpbCIw8GZTH3ixjQOXQBTeA0yfFKSR7xh2k9vNPo5ZuoQEjn+NXnBg
 WLboBpmZTDAOYehv4BdmLLsjZfDy7E6z+dGYkM37ujmwGODpYkV88poequt7wgVHuoRQ
 +mv61zeadLHB0z0qcnE8GWcUvOn59igEKBK9s3Fm8z4cRkgz2wxcTdXPYYMezR7niMhK
 TfTKNx43g8+jDX8Hv6V6fDjmz5Jzs0xhuszIYnp5vHREJBjJHeKGGWDChP0TNph6A+W3
 oA5A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=W4/8x9Gt
Subject: [Buildroot] [PATCH v2] package/m4: fix build failure with gcc 15
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a temporary workaround to address build issues with host-m4 when using GCC 15, as encountered on
the recently released Fedora 42. The issue stems from stricter compiler behavior introduced in recent
versions of GCC.

A proper fix has already been committed upstream and will be included in the next release of GNU m4:
https://git.savannah.gnu.org/cgit/m4.git/commit/?h=branch-1.4&id=a22c9802dd7e724eaefb21dc21d84ac2d3a49c89

Until that version is available in buildroot, this patch ensures continued compatibility and successful
builds.

More context:
https://lists.buildroot.org/pipermail/buildroot/2025-April/776922.html

Signed-off-by: Joseph Zikusooka (ZIK) <zik@jambula.net>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
[Tested v1, but v2 has the same diff]

---
Changes v1 -> v2:
  - reworded commit message (no diff changes)

 package/m4/m4.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 39ad898b10..ab8e194b06 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -10,4 +10,6 @@ M4_SITE = $(BR2_GNU_MIRROR)/m4
 M4_LICENSE = GPL-3.0+
 M4_LICENSE_FILES = COPYING
 
+HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"
+
 $(eval $(host-autotools-package))
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
