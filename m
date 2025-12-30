Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F48DEE4990
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 17:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF2A78176B;
	Tue, 30 Dec 2025 17:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1r4-EIRDfeqn; Tue, 30 Dec 2025 17:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0911816F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767116430;
	bh=h152GB/NspO0jPyKWv//l/CawrfWFXxDGTZ2KpTfYRg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=ZPRR2BSRS7kPJuL8bsV3R3cdZA0tPwso3Evn0wjkI1H+PgFr0BCIxnzJrOGfwbzOk
	 emw6UFzt/bflMQm5l3Evy4z7X75ItBXXd+3JXVxtDmKQo+RQVfyJSCe0oTFPupV8js
	 SmM2DFrb3BfuHNk+HIfVcYYoSr2CpSyDE5F/QzAoaCXxsyizTrG80H3Wb/szRxMAc8
	 sT2LM8tCgUhUUUhNTiKTHVUyme9EIBYPRoZB6xjlqO0w+aRfa5zb+laUiYWHgr1NQn
	 hoIOCNaTuaiWbaS+9jSdUMF4MklRGbL5KJKyPUxkv7TemrhZ1xWO3lzfphvRN3DFEs
	 5j1uTSNFDUV4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0911816F3;
	Tue, 30 Dec 2025 17:40:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF731277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C5B72816F3
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:40:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwe_alM_Ov29 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 17:40:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECBE4816DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECBE4816DF
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECBE4816DF
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:40:26 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 46e09a7af769-7c76f65feb5so7612230a34.0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 09:40:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767116425; x=1767721225;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=he3nslelI8T5ISs+ediGxrm/fgMdwAAbmMzG/hE6v9A=;
 b=CVH9GuMbQ84785glwm//jlZneMe1fqQVhh3zJzueICsmaYJi/tiuR1cm8QQItXicLW
 z0jtGJzFPc49oK+oOo8vjk1ZwRv9ZDV+dP0HOCxWYrN7Th+tOcXq/fyBGdsXtC3qM3xR
 5NfedIjtoNPus6ReHFPN4YkaTQAvzQoqAz8OACHN+wg7pR99N9hQISTutyIP0IbL+2v5
 3NopOlpeB+7jfJktGVTYoG4DmFyTaIa/B2/OT8vOih+5QF0ukAHRuBholpNIAL72nfe5
 5TI1FAIMBVvphkx93pYJXryiD07VFzMfUubvPc/civxltFIKNuP7jVTAJ+3p51uoJQ+O
 B1mA==
X-Gm-Message-State: AOJu0YygFWkq1H83ePjq5ZHghg3nPsIzM9j7KOCJzd3rnckDqWEEw2uP
 ube7bq6PQjJpxlVxhT1OCan1jPPziJzKa3nJD5u/G51aMSCpTsnC953N/WQjZMlXsj8=
X-Gm-Gg: AY/fxX7byR35ftv3CpR5mU5dFpAg3a8EzMbvcrfVth3XebSR/xH2CnX8XljLQv6arBs
 L+URu9t4RFEw5agh1JdVHm569s9XDFAze0HKIKeIFyScSQmYZUaG27TPU4yz5WnLkut/yfEgV4T
 YGX9TJUMZ5z434Dz3HYdhMKnGhNZbvhncSPoo7+yttRvhAg7hhm3M2wzw+1jJntcbcF1m8DYzv2
 rvfdwa6KdovW9twCFIHBlR3lkwnrDKxagp55tdhobjobAYEtsELlxzzM3dSDJsz5EZMEBXD4pCj
 j71YEZuYVGjyvga4TGkXBnE4j+dJq7xTxyfNYLvllRQnlKxiLDOlQH+7lCpgOuAxBOocWplqcLh
 o6H0dI7is+XpnNw87Vj+TJoba6Zpa5h45eB6p4ul0zeeu/bl7doLWXujtCHxIrMJv46y1ja2MlE
 2qZVrlZ6LiqtLlTFj6ZHmUvY/ktaHs2qHUcl+3moY4JU5AKkThgTharpfjxXr/B/eO99+ZTqS3b
 UlGhfmPQc20OX6T+BZQnGZ+faZq13F1sSk7DcAY5Mp5lm/DvBXFT+A=
X-Google-Smtp-Source: AGHT+IFGZg26LLGvUwGFlEyA1zCOlrRRyeeZ68qs5g0D3hWnN2sVmokg2jKVpPJXlDWqmRmrc9fDpQ==
X-Received: by 2002:a05:6830:905:b0:7c7:261:6745 with SMTP id
 46e09a7af769-7cc668ae21fmr21304607a34.8.1767116425540; 
 Tue, 30 Dec 2025 09:40:25 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667d6b04sm23025051a34.16.2025.12.30.09.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 09:40:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 10:40:21 -0700
Message-ID: <20251230174022.1945745-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767116425; x=1767721225; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=he3nslelI8T5ISs+ediGxrm/fgMdwAAbmMzG/hE6v9A=;
 b=HGh9l8pYGjwmvUJo5wmT8IuIYfRPnwca7O8zQnY8uoKgt6LQoEm9sc6DJwoW6OkJBd
 UhKw7M9rEfehEd5A4je2Xbe6jV+4gp6jEeYQsjFhlUnrVzdJGNpZLmgLf0I7Js5jDMnW
 6+XxkXxtKfZgu8EUXssee1hZOGpdvPlrzczsPLBW2MYABdMSUTCVR3utNf78p0/7Ux3Q
 1YGpCpKEiG6N+SG0Gez70GhJmb8ApbBy2XF9+wVMBJTAZrEika+sLnxNs4b/raMZZghS
 kyqsE118Fl266yJE7SVeTIpuIk67iABFCphAE5sV7jT9OscfAkeft8VHyeAXghim/YVM
 o80Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HGh9l8pY
Subject: [Buildroot] [PATCH 1/2] package/python-propcache: skip dependency
 check
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The python-propcache package specifies an unnecessarily strict cython
version, disable the check so that we can update cython.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-propcache/python-propcache.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-propcache/python-propcache.mk b/package/python-propcache/python-propcache.mk
index 88d1f2cfba..d1f659498e 100644
--- a/package/python-propcache/python-propcache.mk
+++ b/package/python-propcache/python-propcache.mk
@@ -10,6 +10,7 @@ PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/9e/da/e9fc233cf6
 PYTHON_PROPCACHE_SETUP_TYPE = setuptools
 PYTHON_PROPCACHE_LICENSE = Apache-2.0
 PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
+PYTHON_PROPCACHE_BUILD_OPTS = --skip-dependency-check
 PYTHON_PROPCACHE_DEPENDENCIES = \
 	host-python-cython \
 	host-python-expandvars
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
