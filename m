Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48446CDB481
	for <buildroot@archiver.kernel.org>; Wed, 24 Jun 2026 14:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF32760D70;
	Wed, 24 Jun 2026 14:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7hdp5OyztVA; Wed, 24 Jun 2026 14:07:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C149360D67
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782310030;
	bh=xQ8szUma5xLofRGbn6PaQVUZONxBjgCsB8yTr4pbnfM=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=SgH5lJYMqKEpmiCqVjFeBTE86Fdne0iLf8gDSnGPl+l1ClvsL7+PCEQCJmu4jofTW
	 bNGeam1SpQui4MqWG1G9/Blcn5AhYbDIc8LqBHm2JRfMsgJqaYDJejEZn/czzXi9im
	 CA00MQPYA/n8kPZOLqOEsf0ZjaRKU+ruSE94r6QGo0/di7H4wWMETw8aTWPy7DIjiZ
	 JZENTZGZv97g+m41IaWLyYAcSSBDyKli3WVcwzmqSZkNSjRX/GEvUUYvEfx7a3qRZB
	 F7PFIAoRf1okptzver9jJKQuGe7fuFvRvOQ9YgMK49yZhDpe4u+C8Iv9h7h9fESo2E
	 nPc8QzGw5W4PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C149360D67;
	Wed, 24 Jun 2026 14:07:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DA3A4D1
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 634B9408EE
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVJoP-oBtHBn for <buildroot@buildroot.org>;
 Wed, 24 Jun 2026 14:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AF629408AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF629408AF
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AF629408AF
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 14:06:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-490b613a17bso10508025e9.3
 for <buildroot@buildroot.org>; Wed, 24 Jun 2026 07:06:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782310016; x=1782914816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IRGEZITvU6KDSRAdY3Nl6F4TtG9CRmX/ZxGQ0bw6rog=;
 b=S8q3tGzlXn1mkdyzUPzc217Fh2a8yjOqVVLma/ke6XYP+9nspfqhDJDaCl2yJjDO21
 cZNhRbsz4cFHBu0rS6BTN56m0c8j573FReAiyxj1CWY6cz7SEpvbXGUWn/SzYOzWd4uS
 Py04/l3xG479O0ooYZNR9j1ST4VHxaxyvn5p/T39BNflchrokzisx8OQSJdtEKzSGkDi
 vpbtowoL34qATVdgl9MFUH7AddqFdVtflcSFnZ6k6UqjYyJABShVPKj5mahmLHIUsUDx
 +AW13ayM8vC8y9W0rJ+Z0YWBRwhYcS1yrmYFWVCnxAIgvD5D/4KecsOy94rR9NVsobF0
 Sxdw==
X-Gm-Message-State: AOJu0YwNeyEWKhpSLU+hxsuv8fijWswhyuFrGQm1VvWl+CtUNB777RPS
 0tDkfxQ65PtP9134FxLdfrL3oOgr6Aa9XYLtSsDvyJUgHk3Zg2JYTvGtdz5W3WTj3ymXoD04Lep
 7deyZ
X-Gm-Gg: AfdE7clKuuh/SdOs9q+pkuDSkHBwOhGePnwSi2isL+ztT9abe+vvhGjs00Nqsh8UUiR
 7wKAczkCxlLXY3/gJpWdSSDoyEymTtc3YkzfvK+GlRkJ7LSCtZ7YQqFSJB1eGRwkcMcmAScs9jD
 t2IJxMCvSEpNadJrKgyq6NMQs0Gqv5yBtK42N/o3X8B0w9CEQYOukL1kQGZ5J794s4DzxAkPI18
 SeUYCFfyAfcL8eACY6z5NLeYCctUjNnpLmQJNUI2efCDOFH0igsc14j69LtEOXDcb9FlBh6XweX
 kGDQrcLCOswLTzBpOxjPaxxI0EnKhWFsTNHUAF86GZcdOtNoJjt/ZAT3yfowf5ztBnxiaXJuNq6
 Z3DdH31BbHC/tGuFOvlUfxizW8z3SPNKHt2iW6JrpZ/IslCwQFDup3dOIRSK5KGLVLPVSZy4oSj
 woowC7
X-Received: by 2002:a05:600c:154a:b0:492:3e66:6c84 with SMTP id
 5b1f17b1804b1-492490af5c2mr299472575e9.30.1782310015625; 
 Wed, 24 Jun 2026 07:06:55 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49260e14d0asm43700205e9.0.2026.06.24.07.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 07:06:55 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 24 Jun 2026 16:06:44 +0200
Message-ID: <20260624140645.185318-14-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624140645.185318-1-thomas.perale@mind.be>
References: <20260624140645.185318-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782310016; x=1782914816; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IRGEZITvU6KDSRAdY3Nl6F4TtG9CRmX/ZxGQ0bw6rog=;
 b=RAFxdGhGZzIdvC9cvVDvgxhsPx90zhedwcjOcK0ziM1TWTESB9RDZBMCnRRZSS45+7
 uPT7YXaBqIlufIRihVH1Q8cW6sb/6melKqm11DJs01usP6XgDAVTAqgSQyS2JCElSPd9
 25+WkRKfGu/xxR7l6/XLQVNVdBNdSEthAiISb2/Ow41nJgNutTwNUEMZv/MGntvY8mlb
 OMcDqBRcU5pPL0LD+g7HTfCbFtPHXa1vyM4zJe09c3CxfK17e306ZrMHPEkFTbh4vTAt
 4M7GI9/imQWo8mnBDb7hia6PdYVzMwcpaL6BHkR4XBejoSSXJy4LLYQlxz107az1PUe8
 qSOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=RAFxdGhG
Subject: [Buildroot] [RFC PATCH 13/14] package/flex: add vulnerability
 details
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The upstream project as discarded the vulnerability as it works as
expected.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/flex/flex.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/flex/flex.mk b/package/flex/flex.mk
index c6417fea83..2acd6d1e3d 100644
--- a/package/flex/flex.mk
+++ b/package/flex/flex.mk
@@ -10,12 +10,13 @@ FLEX_INSTALL_STAGING = YES
 FLEX_LICENSE = FLEX
 FLEX_LICENSE_FILES = COPYING
 FLEX_CPE_ID_VENDOR = westes
-# bug does not cause stack overflows in the generated code and has been
-# noted upstream as a bug in the code generator
-FLEX_IGNORE_CVES = CVE-2019-6293
 FLEX_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) host-m4
 HOST_FLEX_DEPENDENCIES = host-m4
 
+FLEX_IGNORE_CVES = CVE-2019-6293
+FLEX_CVE-2019-6293_STATUS = not-affected-vulnerable-code-not-present
+FLEX_CVE-2019-6293_DETAIL = bug does not cause stack overflows in the generated code and has been noted upstream as a bug in the code generator
+
 # 0001-build-AC_USE_SYSTEM_EXTENSIONS-in-configure.ac.patch
 # 0002-build-make-it-possible-to-disable-the-build-of-the-f.patch
 # 0003-build-make-it-possible-to-disable-the-build-of-the-d.patch
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
