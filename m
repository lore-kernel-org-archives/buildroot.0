Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F46CAC598
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 20:27:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4722A41260;
	Tue, 16 Sep 2025 20:27:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9axTjVCBv4H; Tue, 16 Sep 2025 20:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71DE741281
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71DE741281;
	Tue, 16 Sep 2025 20:27:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 656DC7AB
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C5ED40515
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFjv0YmzhdBj for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 20:27:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1739E41183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1739E41183
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1739E41183
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 20:27:46 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b9edf4cf6cso4180131f8f.3
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 13:27:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758054465; x=1758659265;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6UbtabtKeFsHl7z+lV4T2t2I8JmctXze/Q7sVNv/bFs=;
 b=b/5dXsyd8Cn2PWM7g+5wJextGkSbimfgqiUvHNwrDlJqgEGNkypZqNR1jVPrODl8Ot
 m3Yny24PY7jP1+P2Y0l1v+9qFtFb193L4UROdqAwNuOmwqUUNDN3DjNEXKPSoKpei9GM
 ji3WSjvLcoo4m2VBxQcOXZYl42lqEp1hXXfOY4LRWDphzdrRhVjgz3WIP/HBZbW6oLim
 67K/Kkfd7L9ydVdQbmYHHqadOfqTZcjyXnqE7L14EZdzy3SFTvT4ambZ57mUb1lemQ+L
 sfVHWgq1KMG7nZFkMlbBuzDbwiEwG+JQU/hvxXbDWFWKdZzAi8vCzGwwmiGOp2ZWt96U
 JuAw==
X-Gm-Message-State: AOJu0YzJIRDoOXLv54qGor4m97y/flzQ1nym+tuZE8ljMgk8SCtLNgHv
 ylGBZhb/179H37E+vWzm2uOsXlBdUSfiibfPckjQPl0vvqYtsIPOjDISOGrfb680v21tttcJ8K2
 2qbj3mcI=
X-Gm-Gg: ASbGncsioUhM789a0gEam1KwYp0BwQt723oj89uvaxb0maML6UKRSdveQxuzvVqnpFt
 LlUNA3dzM2XAtpef+87i3qwYpAeJ88SkChus/MULIF54NzuIc/OaoWhuoMXXVo6J2hecjskkaGO
 BRCD1dsQfmBG8DTrnta/KB1atdvBBMzfsfKGPPyvB52C5B8RcU0u/lOoixi1biHMU/Z9OU4oSKh
 4W2k5iZ7JJXwxpwYdviT9mjX0/+X7gtuimqsiy1/WA+thaGo3vA4pD/2WAEaZFnbu+7ncyHa9lJ
 gzsTjwxFh22OfygNOf0jset0HJKR2vzX+9rDBZ7ApTy0iVycY3QICZTWZ5gDRYkH7BQHzwGjVe4
 dvxm4JRRLQ9EM+5g=
X-Google-Smtp-Source: AGHT+IG0au6DLEMYeGjgwX2DomPoQKEQTd+xxjmt/UZLhQDlL0O0RzmcsF5FGSN8/9hWDG0x/BE0dw==
X-Received: by 2002:a05:6000:2302:b0:3e3:e7a0:1fee with SMTP id
 ffacd0b85a97d-3e7658bc9b8mr18918028f8f.5.1758054464842; 
 Tue, 16 Sep 2025 13:27:44 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3ec22b16adesm5497723f8f.13.2025.09.16.13.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 13:27:44 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 16 Sep 2025 22:27:33 +0200
Message-ID: <20250916202735.1121872-10-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250916202735.1121872-1-thomas.perale@mind.be>
References: <20250916202735.1121872-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758054465; x=1758659265; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6UbtabtKeFsHl7z+lV4T2t2I8JmctXze/Q7sVNv/bFs=;
 b=h0mMmYtX5Obwo3Epv0agbqsSiAsPmNX8bgjfmBlkMBKXdnZ5XEZQ9ab5EkeHHk6z5S
 oLdkKkWu4E2u/hTRELuQOTLFCNSAaZdKCuXlgOZKC9sqqQVGiJAotZ7jYJiPOGF7wcwE
 icgkx0pWSh6Qs23mUdb5FaHVn04D58n+wXE5EXpfgrxHdHXjRDtYK4MfV75UkJXaM8+g
 S8aiflJeNfAHtMgty53USGO5HEU+Z0cyE30jiFFHIdvL1rtVv4QiXQPGiZNF5cSNLrEy
 xisScNsEp3wMKqA316Dg86pmQsv6l/QPfGDpM5Y///RzgUL7cAEPBieIPIGh//f7HBtJ
 4tgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=h0mMmYtX
Subject: [Buildroot] [PATCH 10/12] package/python-aiohttp-session: fix
 deprecated CPE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Michael Fischer <mf@go-sys.de>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Anthony Viallard <viallard@syscom-instruments.com>,
 James Hilliard <james.hilliard1@gmail.com>, Petr Vorel <petr.vorel@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE 'aiohttp-session_project:aiohttp-session' has been deprecated in
favour of 'aiohttp-session:aiohttp-session'.

See nvd.nist.gov/products/cpe/detail/667389BF-3561-49F9-A61A-6C86C7B82922

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-aiohttp-session/python-aiohttp-session.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-aiohttp-session/python-aiohttp-session.mk b/package/python-aiohttp-session/python-aiohttp-session.mk
index 8b8337e68e..1a69e55ca6 100644
--- a/package/python-aiohttp-session/python-aiohttp-session.mk
+++ b/package/python-aiohttp-session/python-aiohttp-session.mk
@@ -10,7 +10,7 @@ PYTHON_AIOHTTP_SESSION_SITE = https://files.pythonhosted.org/packages/c2/c4/d73a
 PYTHON_AIOHTTP_SESSION_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SESSION_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SESSION_LICENSE_FILES = LICENSE
-PYTHON_AIOHTTP_SESSION_CPE_ID_VENDOR = aiohttp-session_project
+PYTHON_AIOHTTP_SESSION_CPE_ID_VENDOR = aio-libs
 PYTHON_AIOHTTP_SESSION_CPE_ID_PRODUCT = aiohttp-session
 
 $(eval $(python-package))
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
