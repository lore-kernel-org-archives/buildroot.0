Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79BDBCC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B6F280CD9;
	Tue, 13 Oct 2026 16:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wA2ZiiJo3zW7; Tue, 13 Oct 2026 16:43:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3BD4480CEE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909786;
	b=FNGXbkpDREpo71pDInkJHQcDvquCe591vdXQ/budsPTDQw7g+yPlFvOGkwKnK3mQSUoM
	 O3aefKctE7/P7b0zdOnPBiYBLuOq3QoC206m2uULarLXypV+AFb1Lr0lANiMlkTNAG/j8
	 LQH+MKahspz/siCYoGRYL4eTlUds8QQeSert8LmnwppN+PAijd35Rwre0CNehhsOnG0ms
	 ZhGNLZdWL6zLSAu15qtre6B6FKJAUHruUwFAySiFwf/TS9oaKRCTrYkwRQKu/L33w2nqb
	 OTVYtOz9VWvaNga4dJiWLwlIyv4pA8853QwT4uF4Rr6QWwMceUPn6Mm5ZFJAt6tVv0g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909786;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=rRux6BrdxTrY52yRX7aV8TxPSF3izZ1oXYtJZjYd9wU=;
	b=j09VnYkz5Gqn0WorQeXiqA04sE8+EfCWR9dmg0Ep0k5gVlwvGTO2f59Pv08Y8Y/r9xw9
	 r8kXOMy4OD+UXZHnPXq+rTMAMJiCEvjDYR2kwnQoX49BUOCFnNELhz03pFjo1jk2+FIHq
	 vnclJwvecWD1YIaN/QTevSy1FY4qZGyU2sLA0UQ2ELD495Ef38b+tXS3BGgtksckatZp8
	 OyeE8HaFRkFErq6aRoJDCD4lWj4G/mRDxKFsBODQoM5/ix7VhY/GwUh9wXJNQ8pzfwm08
	 e3+ARNYGyrR1ZxQJzPzs3yFf04uxeP96qxKhKQJA2ncmTNM0huq5/tfvUQ6IvlOQPFQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909786;
	bh=rRux6BrdxTrY52yRX7aV8TxPSF3izZ1oXYtJZjYd9wU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=b/AnoZfY9CSJChqKvWaYnK173TRXYJwU99IR0L5cSzUsIyE2+7lnLPT/p16SVQlUO
	 PwKaOLEDwZzQ0I9J1Ka/c+9at/yC5KJFPpYlX2BkdmHCElDkCEzpfVBg5+6yhE3hSn
	 oI56By1BCGup35XcxKyjfmtKG2Cevb/+OEPxkRMRsIHx718QI4GXL5pwCPTtvtIiQD
	 e+B/GFmyO4K6WV3RrJ8lBOYEIfvAUm8ERe3uMNx5A6+TxO1vYRuSN/EgUefqLb4OGO
	 nu5TKw93fEIOgj2tJjULIvQwo1oYI3zt2FnVI0zPaPmDI4tgNf6/NCpNKkrEH0AOuL
	 6dIwOwnEFScTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BD4480CEE;
	Tue, 13 Oct 2026 16:43:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DA9B0DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCF794009D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78VXXzFblrkU for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org D3FAB4007D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::30"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909782;
 b=K50bZHchg1ZUIhOkx/qw3sjvJcepFCzVoQzYl/KQcg8Idv84Hr754NukOM3lUzpHCpPk
 yuOw8fyx7bppY21QaiOsbKIRm5qRsLwZA1sUEIgEcpJYgdfCXyyruSO3Ww239eu9Bm8EH
 sIf9L3UL27xTF0nMp4Sd1/pbA5sdnv3ppY9yt5/XKSssS3rt+ZLPXSFx8gkxgBGYQIdUy
 4ZW6UzT+McfkqWwLl0h5Ku2s+XhgOwOlpzr08IU7m/JCA5GobXynGgM7GqH9ylbUXlYQ+
 ASK58CXut5iUwaFHCPHGXN9r+wAJgLPvOuuLk4qd//po9TvwFCVwGyGjqyTFcsKo+/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909782;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=s7l9YIHv/bLUgFm1H0JnmbAzxbye1PcPPfRkcvCPhL4=;
 b=KtR6w+mvKLW8EE+1nbpMP1ECNQqqNHpDNcZPqPFPnODX5I5EQceQvSFT3XLabQR9gKxH
 jAxVYK9ir68z4BYjUBbYfIS5ThS7OpYJK2wnawiTyJqXoKUL6aioz4nGdBBhWZ8YSUfSl
 7xSXjv4DCeqxH1DbQrs2NrICloHco8iG3DI1u/OQOVZKXj3dNy4vGpo6VvsEjv5ton0an
 1A8E7bsuXyDFYN/eKqxTHUIR5mvGME6h3lTS1AmcX6Lg97ah0za2TyJ/e/IkNApbEy23i
 uj6voWWt3/FaYKNiTKcj9tdk1UJHpqMFFAF161hIpse90SEhEHhB6joU7fmgPmTauAA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Tk9pfHeo; 
 arc=none smtp.remote-ip="2001:4860:4864:20::30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Tk9pfHeo
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D3FAB4007D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:01 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-4949f037131so1695082fac.3
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909780; x=1792514580; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=s7l9YIHv/bLUgFm1H0JnmbAzxbye1PcPPfRkcvCPhL4=;
 b=Tk9pfHeoLRBFIg/Plj/vHeMUh4NR9MQijRG7hKykWrN/7dcD+bcZgd621VSfl6XWtq
 t8gYooz+hIhIFvH85YKgwGKPUu5UqE9qmm6pCOEaOHdiLPH8AkEprNjlW4Sd+IK9iFgF
 vc4YTR3lnFsiMmDVdDEd8eI+tryB/QW4H2/JFNrcos04/3v/YtaY9ZQ07rqa3KUjz8IO
 SCkZO4j6smlNGSUCWUKsjY9+UJM015/7WVGcZiH6YATxZGdROoqvrjnjrpHZurmDoc1e
 yp9y9EvCDTSgDChbxbscyB7wjuEEExhk6tg4QBjF/59AFwU6o2d6VfsJLKJMGIqLqMpa
 yoVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909780; x=1792514580;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=s7l9YIHv/bLUgFm1H0JnmbAzxbye1PcPPfRkcvCPhL4=;
 b=B5rPn1wNOrtDQ9zTqp6hpBVc4JF3Vi8rs82wq/HhbBTdWfMaJOOaESeYOSz/8P1dF9
 shA0mDaQ1Sp/0Kk6dB01x88ube0BR3IOliXm+AQikg8behU9xXmT2Utp9HLlJGZ5OvJp
 W+0S/sHenJu3XTE8EUAyrXDz1x4GH8X46W6utF8Cra+xxV6aYNp2S+cxU0Ba1+qsgJF4
 g7oJtiAyD5W3rcbc/eow94YN99cLUVvbd7FnqA5Y++FKUDQUykW1UavAgUxJc0tNQJKC
 GMajuhvVfnzZAB6a4tPS3dY7bL4YcR4GuIG/mnOc2jsRLuxr5mqJ56QgSk4WGf5aPByD
 oszQ==
X-Gm-Message-State: AFq9FYIUbDsI8PaTIT9a75xt89fSck9sxvTsfPOVpsr5xc7mBdiYWDtq
 CT3itT2NctJlGQiKrvi0cJxOSY3RLEqaPojWd9yrinUErIQlyq6E4fWu0LLNXg==
X-Gm-Gg: AYBFou15Vy2PSt1Oi47YmMgvfq37YJBWtlJk2Sh3WIHOlmvjdHS/UjYb3G/UItpDy3Z
 dD6v2rcTqnJ+VhKt3QKWt9nmK5DmVer6qiKt1BYCDJ2xeFyZaYMMAXbNLe3nskqYBV6tycnBj8M
 SDhAVSq7+Z+8mWhPWSDIR9qiovVguskU8GM5ZoXLJud8StL0Pvr2CIY0G0hVcW7JMfYpom1Jtl2
 AkDGYnpZn35GQmPlerbqEQ55M1LtEAvZV4qZB/hkrf9VTWIQysqX676YQ50YZ0S05Yr7gF1lPn0
 6PKx8kFhnRqYOruYiGL5eF8WcSTdJlD0w51Dyx3GZRCoxFwuryzZTlNDathRyT4HNkP+Ok5fn+b
 AphfTxLhle+9p3FiXB2qW40gYEQos3A1IXgMwo2eAI/g3osBU6g74PwQIAPYqqCA6vg8q+Z6nfU
 ODfINLRC+G3PavPD4Q+BJ+1m6ch45gt3Nt5BZ2fCifESxo7NkM2UCKfVfWUVSvw+X41/UHEMnC9
 RP7zIveYJo4ive7lIVoam5MgH8Oz5xPsAH5azLBbjxhXU6rpZr7jzpMDaFpUHx00iJuH5UTcmCk
 EUgxacMvSQfaGc/+nDBzBg10cYXTahIir0Di1PMpX0cU4wChDGu6cuczHdjU31bzJ62I+ipOdkB
 zl5ncYM7tbkJ6w/l/du2+f/tz5eKaSR4KnG/AU7jP8xg=
X-Received: by 2002:a05:6870:d61e:b0:494:8220:8349 with SMTP id
 586e51a60fabf-4a2a8866363mr10336112fac.26.1791909780408; 
 Tue, 13 Oct 2026 09:43:00 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:41:50 -0600
Message-ID: <20261013164254.1476592-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-cchardet: bump to version 2.4.0
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
 package/python-cchardet/python-cchardet.hash | 4 ++--
 package/python-cchardet/python-cchardet.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cchardet/python-cchardet.hash b/package/python-cchardet/python-cchardet.hash
index f2e72a0bb4..63ab2a276e 100644
--- a/package/python-cchardet/python-cchardet.hash
+++ b/package/python-cchardet/python-cchardet.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cchardet/json
-md5  e8a5838c4d705346489d4335fda539b2  cchardet-2.3.0.tar.gz
-sha256  e08fade06af9aa4888ad99609a66bbce99ad01c1269c0ea673af75a15a6f762e  cchardet-2.3.0.tar.gz
+md5  112deebf0ead57d5627038c06b289aee  cchardet-2.4.0.tar.gz
+sha256  7b062e7e92e5ab1a00aaf5c164d5f056daae648ba1f144082baf5b4c229b794e  cchardet-2.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  107a29ccdd2d778aa2df5462f85dddfa099059abd22e064e07ec2cc9bafc37cd  COPYING
diff --git a/package/python-cchardet/python-cchardet.mk b/package/python-cchardet/python-cchardet.mk
index cadd892256..e9102af82c 100644
--- a/package/python-cchardet/python-cchardet.mk
+++ b/package/python-cchardet/python-cchardet.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CCHARDET_VERSION = 2.3.0
+PYTHON_CCHARDET_VERSION = 2.4.0
 PYTHON_CCHARDET_SOURCE = cchardet-$(PYTHON_CCHARDET_VERSION).tar.gz
-PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/86/80/6b87429533a8a6fc5b970c44a3a844c315c3313377ecc4fb9efeb56a3241
+PYTHON_CCHARDET_SITE = https://files.pythonhosted.org/packages/ae/f2/4db3f22a942ab99fbf4860bfc8594ac753ff0601e84d82b20f670e55280e
 PYTHON_CCHARDET_SETUP_TYPE = setuptools
 PYTHON_CCHARDET_LICENSE = MPL-1.1
 PYTHON_CCHARDET_LICENSE_FILES = COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
