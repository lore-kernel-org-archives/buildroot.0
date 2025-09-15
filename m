Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E426CAC592
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 13:26:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E71680CD5;
	Mon, 15 Sep 2025 13:26:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fh9eXc7hUPVh; Mon, 15 Sep 2025 13:26:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC88784015
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC88784015;
	Mon, 15 Sep 2025 13:26:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FC2B1F7
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 13:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 357FE80D10
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 13:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EeTz96xk74o9 for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 13:26:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE3D080CD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE3D080CD5
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE3D080CD5
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 13:26:11 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id
 4fb4d7f45d1cf-62f0702ef0dso3604861a12.1
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 06:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757942770; x=1758547570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rm8u7g89fNdfSfwhPyLjRlkbUBxa6iiSPQ8EjkPgQkE=;
 b=KdldJa4L6Gquw60nPqUXeKfyOOeCcVGcnPI0ZL/Hx+J+OK0SMB+ct+2ypw57rTTlqu
 m6cYJuh0uTJfSgFWrCSu0tNFzaJBM/+Qxi1m62Df2XdxuIqtxOr1wlAsuVZurCjWmnnO
 1uZxBta7zjlfyTrzn294s+Q7nKVoYtqG7B8k66Wx1qD7NbrdYuklgv4GoR0G8VVu30zJ
 8uuuIJbpWj4zIC5M+TQh92oFFyHkeDLMUMS9dJ34fb32IqWZqZ/1fBXg/gee7qRrSW8v
 izO44auHDLeJt5jYvvBCKxKeGALoEni0rl9CGI28tAEPq+vGa3mD9Tt2irB/EAuUT8b1
 v3nA==
X-Gm-Message-State: AOJu0YwYXTzp7PYIM9w4n02j+8diB0p5NBsqY96EY+co5k/1RSGclsmD
 yAQKtzCj6SKY2X9Nw33c+TGqyoZ26STlU7XPsWxdhn/SZ+CEa5ojGafCeskybdX+eEguyaI3z88
 fl7zgMX2Gcg==
X-Gm-Gg: ASbGnctrtRY+4whARD12GxAm1tc9/Q4ie53UF5lUa3HX9lO3InpYdHTgtbK5NVVvBj3
 SQo8I5KRBmrlCFS01PVoMB0D3AP0gGFiMXsHMA89Z/HUEXWxi7d2rxxrexqWiJ2SBN9baraJOdU
 0VwbG7hG2moxxZKWUF1cj8FPtsoQ7/yZBxEe1bbMgjctl3F/kUWkXLTVIYBixSKoGsAZDIVNsLf
 QHerMqTT7VLT6cKwOeQfW6yi+kx48bsM1IWFJHD0onBkKF3BiZdxpQW3XdrRDPt4IRnX+ElkjAB
 WyamtSj/iCJNBoYQIIH8BMAXTNa49AJzh50IpJQQR4Q9qq+aaZ96EBOrzkvG9f/VJp9/JoO1edA
 Se4cyHRC+ONpbuUwNltc/I4rri15awHApTLXHk7WAmMWtBCc=
X-Google-Smtp-Source: AGHT+IEAmUpflBLwKrza9tdgC7cbfWuaIohh/n+IiqqlbrSZz7czLx3YMb2K+Z7AaoDcGxu0GQN8tA==
X-Received: by 2002:a05:6402:5194:b0:62f:1556:25a2 with SMTP id
 4fb4d7f45d1cf-62f15562806mr6971229a12.4.1757942769745; 
 Mon, 15 Sep 2025 06:26:09 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62ec33a51fdsm9149479a12.7.2025.09.15.06.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 06:26:09 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 15:25:56 +0200
Message-ID: <20250915132556.47191-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757942770; x=1758547570; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rm8u7g89fNdfSfwhPyLjRlkbUBxa6iiSPQ8EjkPgQkE=;
 b=QP1UOMrIVSP5s67OKI+hFel5sWFHGWujtF4ST3XgB23p2SCfkkA/14ixt4bFids6hQ
 Cj2ACTEV5YQZUUnS/y5/bFxh3DGrq8+x3LQTHO9YcMqrkq832X2s3K0CClllh0fZVnLL
 PT2y9oY1OWLwoeHQheJ06s1SFguUyNAOO/nkZ43TkhtpykVPI+DJnUakvqhopfD1JniI
 /1BrQR6cBROcIHDVcnqXIbp0XB1rEvrS4jGtdeseQqSu0HfH83T7aPX4MwSXJ5BSU+uB
 5LmAXF5CDDAPsC52I7II1WQKqjCdK0zYeaAy8ugwVkZ/rjD+OajziqedTeI1FQbAxfpk
 R+WQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QP1UOMrI
Subject: [Buildroot] [PATCH] package/python-flask-cors: fix PKG_SITE
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python-flask-cors was security bumped in commit 04cd135b26 [1], however this
commit did not update the _SITE url; which changes with each new release on
pypi. Therefore, downloading python-flask-cors would always fail.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/04cd135b26406dcc31cb66af1480d53fffe81e59

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-flask-cors/python-flask-cors.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index d0923d665b..26198e6fb4 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLASK_CORS_VERSION = 6.0.1
 PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
-PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/4f/d0/d9e52b154e603b0faccc0b7c2ad36a764d8755ef4036acbf1582a67fb86b
+PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/76/37/bcfa6c7d5eec777c4c7cf45ce6b27631cebe5230caf88d85eadd63edd37a
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
