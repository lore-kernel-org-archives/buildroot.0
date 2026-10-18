Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E018CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 18:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D042F81053;
	Sun, 18 Oct 2026 18:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6nYg7ktn9Ei; Sun, 18 Oct 2026 18:25:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D751681008
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792347935;
	b=ONxFnuZtYWGdvtt1SHwIbAaKJnuof+fcB7df9P7rOTViRyOaNGUKeo0RYixotsbH2Pcw
	 wjZg0ZNJzHxKF4JXJ6/f/UZ3iWgQWOgtCY0l2dPlzAckh041B3KCc+XTUXSVi1fpAUwNX
	 4r+jzOGWCakh4DDByYClXByJXMean9s+XK2k/e9uCk58UFZrqQ8ZXwTxe820t515h7q7s
	 PvBvXEVd8WS3AZ6ws7xqL76RUAEXybf0HjryEvGmIuGk9mWIT39+ETnFOb8Bk6YVoIeXH
	 FgjVgARzFRasIw27eUZqquCiDJrNaRxX8CrQXqB5DA8tQpeEbPQC7qPQlWrfdESqCkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792347935;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/fBoeWWK1ltRlVBlHMYZq1D33kVk4CBreVMwiesloW4=;
	b=rbTHGuPLMLX9RKPNHvI0IFwnV0QhUNf18YdjGB1sYwdTkOYR4sk+uTD1mXYxV4Orje/E
	 JSKI1Z4JGyo5APizfDuE/2Wwdy8+EZ03lVkQd181IyDHwPS7aGvXZqlRzdL5jSq242Nkc
	 yPtLSI+0GMOf2YExrS24Q7tXZIlXPjTELs7pFPsV1X4DCsXn7JdsnPy1S9YahnLEWkXuc
	 kPz6MduleSWwlIS23yiy6hnFQmJ6aGt48PKgF/fBU3tPl0+8VpeMQKvIZ7raGVS2VjThv
	 Gh5PUdNcd1fAiglyaA05zERMEJ8zqjCknDgZXPW1aYPprdJZg4kdQDeIBXzTW8ZQkZg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=J4O7M6Kb;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792347934;
	bh=/fBoeWWK1ltRlVBlHMYZq1D33kVk4CBreVMwiesloW4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=tDgvKhTH5QZ+o/tpn9vlfgxIWuJCQfmHyULJ4MkOW7+i5KtacpaUQVuO4NumUdVzT
	 myoMzSeqPkvs1pH6MOxIywfM/O566ZD+Nhkb4BQKiFDSCuAX3TeB7po6aXUVuabugT
	 rVa87zBvdtwwVbM2xa6wPB2kQzaQqBmltQhZ9QSt7/aH7J49xZSM1GA/DXb+HaWFHd
	 fTm6ch0owNj+o47+udh3VD2NNwy7+cSGCZc+pjMZ+P/U/KVtbynpM+0SuZDgjZ9McB
	 eWb/dx9NWM85gzHfSTKmH6vHg7WxcHaoZxzi3QeSeXXU33zeht/t09nu+W2kETeUp5
	 +FtN+Aq9UMQXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D751681008;
	Sun, 18 Oct 2026 18:25:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 263891AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22DDD80F75
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRoaUno1ywVj for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 18:25:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3522C80FB1
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::232"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792347930;
 b=WyyJoIDKRJN1lnqmUKNhprRN21+gfm8PzaQrAYfS0d1rCY5Pw17qCP6iJ5n9g1F+ScFT
 dRRIiAnCXNdYyBJQD3WPF6GpA0l0Di4ujp/9QIxyTAnC7ZfRRUi55lPIyHK7dftpGAUH3
 I6sb90/6D4hcLLtQNACstHdYaRJ6NFzd3XCxaMKbu7r22GXL2MTttHndsOpCzOI6Tm+qr
 EAT+zI7nxwf7pKHuyleW63ezTcjvrA3YHswh6xLrjVvudiaK4/3ZAGyD06xa0TkMtJYSN
 WGQ9LQpkYzH0zor9yWobehGIjUPnIJNoLVjIMthrWgAPt6oqmnbeoqS/2T93SKctM8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792347930;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=w6Q6RQ4c+YvSk1c4UMck5iCRlBxV/4hvCYgbvpkj6hU=;
 b=tP1YtrUS3+0T/jVPjUFpYKwzD8cYa1wUDnZZ6XC6+GaOTiuT+556+cRL7e5SdkuWT9LJ
 tfycn6c9aKE9sUwBRtw77c0D/faRj/oWQhiZCqvw9T+cvIw5ckr1NKe7j0qFvyJrtgeiY
 n4PUXHJ5MKXaemXUtKAMC/m/MQG3IuH9Fx7OU9DyOPhvLc60LG8UWHZMIGaTEw+DSo0B2
 SymkUkFNzUkAsWw8LTNoJR9is7IY/dpvDdQBukbwQJVlftLqSHVZpyEj9NGxZv4b6YK+3
 mvUug++VXB6RvJPAgrNlqrpEidYOCG2Y3IaPoTITZx0NKnRq/0VKHqmX7Xm/xSjcPtw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=J4O7M6Kb; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::232"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=J4O7M6Kb
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3522C80FB1
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 18:25:29 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id
 5614622812f47-4a4cb36ae00so879063b6e.0
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 11:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792347929; x=1792952729; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=w6Q6RQ4c+YvSk1c4UMck5iCRlBxV/4hvCYgbvpkj6hU=;
 b=J4O7M6KbKxVvV0Jddo2h0g29L4PhlPC0rpim+hXem6A+60bylkQJIU/UWS7xHuU8NT
 mUPSJT0q9T+W9hJXIFJQpiNhmlByYlkVXuKdLAqP8vhoyeM+WRaR0Yvhm56zYvd6XQ+Z
 yAZFhWpYjgWS6iouLn5kBNcjq0pemQa6wNRIgp+HycUMonu5vngv8Jup7LYX4QtEZ33Y
 qaaKW3Zo8q+5MDWorS0vMQYSSCIDDCsyufuM3GedT+vw+Jyl66sP5/1SdQGnnfrEAOFK
 zO6J6qJfw4v+QMRypnXey8f1J4rTNK5vkThNiWmX2Ef/cSwvrfVH2RDVaf8Mut63Glyl
 IigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792347929; x=1792952729;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=w6Q6RQ4c+YvSk1c4UMck5iCRlBxV/4hvCYgbvpkj6hU=;
 b=T3mSlGqK0OED78ld4qCdf66A/ICizV+VOqqr1gwMjK4LQsS1JF9fwdfN5AmQdD5wR+
 LSW4y27973UAQkXTWepvGzTrRL5LDTKSM8XompsMd52+5NXcotgB6MqWRh4QrfGiiR4W
 H+kpQdrtU4CAcz81SjKDEATOaa2Sa+szcE0sal7HlWxm0No/4vrt3nKREioZ8jXg0/X+
 SDMF+RYlJBTiUanduuJE9qSKYp/xohHOPl966JOF5OOK1yVa2aSjxXLOMVk7namlx0qH
 yBS64EvY2TRCtCOYXRNyNzwPJ+nKgGZZKhZckZzLGamM5K0/A+8zpwNz9MHge9knjgU6
 hwpQ==
X-Gm-Message-State: AFq9FYI0U+T4yRvKvl6bNghUJC0k/+CwfxBEFl7yQ06jyELYalFlpkQR
 7mLUQ2WFsE0fXtU+kFZjN4BpWZovpAN40w6FSyh3tkt6dcKzWoWfA+VQPTXs8A==
X-Gm-Gg: AYBFou19uia0QlrEhC58m35MwkqswMONss+kTAxw/+AddGsCC1k21KuPVargR7dP7qa
 N6I2xg58Sr28aABn/AZLig6xsG+rG7aT8YV9+Tdi8rFk224X1OvSufTSr2uXtBvP82pTqKUXqhR
 DJaRjXHy5atO/yNrQdTxlxXhXg3/nswHSO83R7R9zT88nrPaqRQSwRf/oDTFhrPd2mn/HHDw4lp
 nJwO1ylYMhpA30jd0wBOnAJD/UQICRpxe7m4rSZNold7WwOVUNkAzp3EYF1xOjeA62GKNbl/x4i
 KsgJNzoQXWN10YdlCVohM5mRN5Qab890VarGGFF/+sRzAzGMW3WCBX3CIMQCK4m38dia0WbOcNN
 0/dRInQ26XvaXE5OD96uYF8fJDFKug7S9CCe72LSp2vfq0VDlOTf3DKZ37RfkvABBrjusnLp2ij
 wkV3p4JWDSrH+RyyK2WHzSKbqFEyaLOWeITUzqZ+2YeQd9G63iUyUGEFaKgeqGdvnkDMkbWiUOj
 PQj061dQ0UFSE0YXiVZTVxPmXiZZ4r5s9IB8/N3tie6gxqNJ4dQAsYAY0j7IbeVdUtsmXoE8oxS
 thsLTFxrkq9HHfIFjfCn/+rlQ/ctw5FZjCsuHngwOxOrIspSvKivKpFAyeqL6Pzw0r1QxCel6Wd
 yyD1eMXpsTMc4FoMKR/MqBFoxu1bSeFx/K5GwAq0Wcu4=
X-Received: by 2002:a05:6808:6b89:b0:4ca:8d6f:4258 with SMTP id
 5614622812f47-53cd42a86femr4694782b6e.37.1792347928917; 
 Sun, 18 Oct 2026 11:25:28 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-5388a5572b4sm5715659b6e.6.2026.10.18.11.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Oct 2026 11:25:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 18 Oct 2026 12:24:51 -0600
Message-ID: <20261018182507.536698-11-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-sqlalchemy: bump to version 2.1.5
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index aec7295d88..49c20184ea 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  9f267c2c350584b2b9a52d17611a4d25  sqlalchemy-2.1.4.tar.gz
-sha256  7bd7ad604487daa7eab8716471c29a7185f17b5287ce73bb7bc79fea050d8cfd  sqlalchemy-2.1.4.tar.gz
+md5  f1e2f4edfa4fdca60ca9eba308cdf610  sqlalchemy-2.1.5.tar.gz
+sha256  0df76cf1ca680ad745bd378a6299a058611a8a784eeaeb4ed78ad4a0b7ce2003  sqlalchemy-2.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 2920680517..fd152963e9 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.1.4
+PYTHON_SQLALCHEMY_VERSION = 2.1.5
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/1f/44/311bac6b6ef81e4dfd0287d04900108b1f5c00c9761dd3c0a2b7b9d0f86b
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/08/bb/28e3106ee586e5b2f5ecf211eec1348055f0f926314b13fe23b9cffa9039
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
