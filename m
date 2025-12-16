Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD21D637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:45:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04754404A6;
	Tue, 16 Dec 2025 19:45:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Wn8t_DRUjwn; Tue, 16 Dec 2025 19:45:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A45540597
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914315;
	bh=kNXTN0PK7kjDJFYAifil9tDV+CsolNOXU0ZMT3/bxT8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bjHgVUyFyitLlMFkF2hbl3qtlrjG9NY7IcEDzKRcf8l+CFccAjD2vP6MjN4aue0YL
	 80qj9m+pgLlQfoJPJGTRa052dsF5sMrbvSe9cZHVoNWNTTNacF9LUW7Ypn3kCJbmS2
	 +vGhjc4rmT36roClS5MKk5wiEE4zyRq1dQ6eOgGdurCmNhNHB8qivVt+4CL1fnb/Lw
	 uUKjBbrmAZKLmDUSSl1MHv27+T6v1GRf2ZGLvQezorlGf/aZ3sEKUNeuPAidTzKGK0
	 m1nSeSHO6h0YVS9env/tRfNcDKKZbBylZtWyrOo4Kd79RL7q7IeRMLY1WGiUHJO/8f
	 zNXzCjh0Ic6aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A45540597;
	Tue, 16 Dec 2025 19:45:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A087372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CB46404A6
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:45:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pfBIoiQzLant for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:45:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F5B940597
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F5B940597
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F5B940597
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:45:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ABF1AA4C45DC;
 Tue, 16 Dec 2025 20:41:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVavA-000000000Bj-1YyO;
 Tue, 16 Dec 2025 19:41:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:13 +0100
Message-ID: <20251216194119.3020421-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914091;
 bh=fPHAxDm8i0fRFCWhbXs8ZSsXrYcCOa0jvVc5BjEt09A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=VDDZQw7CPtt58jbhbTBxo1T5TgDf6do12OQczpMieSTwWDpsmynxJwyOFdVVrDZ4S
 BtQA9C40sIoUqMvaRZu709g9fSDdKleS8k3YIluQ5lI4x1CRA5BndZAhNuwVsV5H/F
 r1eJXIAHFDYjTiVAfoLEKXXkqc8aisZdWPVSu0QmPeIFl0Jeyy5De3WsP/kZ7Jk6tD
 3qteUceW3TXchbk6S5JUWsvDythshBo67ZAyyDm99bMLo52fR0V1J5r5gZoDnfz2DN
 90j7jMrSqmCLlnsrlw1wqNvSi7mxGRmn9+zrXCRDUgVZWfB9FEgtObjy0bDd8jZtCL
 G/HGY1loX+zvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=VDDZQw7C
Subject: [Buildroot] [PATCH 20/26] package/python-webargs: bump version to
 8.7.1
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/marshmallow-code/webargs/blob/8.7.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-webargs/python-webargs.hash | 4 ++--
 package/python-webargs/python-webargs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-webargs/python-webargs.hash b/package/python-webargs/python-webargs.hash
index 3416a441dd..a774781ea3 100644
--- a/package/python-webargs/python-webargs.hash
+++ b/package/python-webargs/python-webargs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webargs/json
-md5  bb65a1f2964f24f77650b8a14ddfbdb1  webargs-8.6.0.tar.gz
-sha256  b8d098ab92bd74c659eca705afa31d681475f218cb15c1e57271fa2103c0547a  webargs-8.6.0.tar.gz
+md5  2c62d994f03da6ff81454c186bdbc808  webargs-8.7.1.tar.gz
+sha256  799bf9039c76c23fd8dc1951107a75a9e561203c15d6ae8f89c1e46e234636c1  webargs-8.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
diff --git a/package/python-webargs/python-webargs.mk b/package/python-webargs/python-webargs.mk
index 9edca07a15..f77eedcd21 100644
--- a/package/python-webargs/python-webargs.mk
+++ b/package/python-webargs/python-webargs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBARGS_VERSION = 8.6.0
+PYTHON_WEBARGS_VERSION = 8.7.1
 PYTHON_WEBARGS_SOURCE = webargs-$(PYTHON_WEBARGS_VERSION).tar.gz
-PYTHON_WEBARGS_SITE = https://files.pythonhosted.org/packages/8c/51/e9ee5d8315864adf65e92f858f826514538e30db542d4782dd94c2418464
+PYTHON_WEBARGS_SITE = https://files.pythonhosted.org/packages/37/64/17afc4e6f47eef154a553c6e56adcc9f1ac3003305c7df978d11aa62937e
 PYTHON_WEBARGS_SETUP_TYPE = flit
 PYTHON_WEBARGS_LICENSE = MIT
 PYTHON_WEBARGS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
