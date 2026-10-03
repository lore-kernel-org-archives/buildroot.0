Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF8CCCA5FE4
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 01:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86F8060DA2;
	Sat,  3 Oct 2026 01:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lxMAPIcewf-J; Sat,  3 Oct 2026 01:33:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8B9E760D6B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790991205;
	b=k2zEgqvluo1WqV+V+b3SrxUhwKccp5FrlXV8cSf9ywgh/JnJujX/GOvQp0Onucq40UQS
	 Dmbn9eoAptYiOlwab2G2VsCj/BVW9JNjuR0legyeRByi+JHcGQ+HrP4puHYASyytNHKfM
	 R2E7PWPOoKeiEjUw69s/ME5joloGnX8yRMkxB4wFAKWZhOqDmpTRqlGpDSc7emarQCUEm
	 5ij5dyO0X+7oazlUaKliS+woti6G7AlaLcPUHBDD0EnVa5o7BUjU2F+ZBGMnOVSLPo7n9
	 E1BhFwCdTc/fWxzi1WtGLniT1VoHteCNtFU++ILhCOZZYAueoZSu1E5aBH2jRM3dqAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790991205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PTY7cbwn6g6cbF7otH4bk7kodRSG0YhlFY4O/5rACqY=;
	b=HyjoW6NJYvfWTVCCFrJg6h529boAoPBBXFAEP20qERrnnYONilD8SaYIn6FvFhjjlSi/
	 XrCoyFv/ETmseW20u1nlYoCw9Ht9aopD/EO0sf09Wz7CCCTZJZh2bN4D33WqLz8/kpNSa
	 RcqiZTolZINTUJJq+caLHOSA6nrI5FDxNYVhz/mvcZGNOM+4rJzbQehyLXvt1u6f/9b4o
	 8Jg0u/zPqrWKmyT47PojI3UxHblmsQlk/qIvQ6eJSTaZqwHG0Gm8X3dRqnrojA7VXcUfD
	 dVQOK8IuaCzt2rlJTmYgERZ8cTI7x18MnIih+r+XqvQSwUnXPRGZKuiP8gqCQ6RU1Pw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790991205;
	bh=PTY7cbwn6g6cbF7otH4bk7kodRSG0YhlFY4O/5rACqY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=gxEJyN2k9hyJ2vYvBDcrJs15biKiJ/RgKnQwC6+EBJJU1DKAWd0WLPLPvoaAnSWWj
	 o6qrHeY0ZoPnnNgsAmGmcJddP76k+deRJ5DpZoUxdFFwoOVVl7nobgVb6RXPh+iY2S
	 nUy/IOpZfBJagk8l/GtpH3QYpuLQpQ8V5ci2jeoUGV/l1QuREvqpYkmNlxxMT590cY
	 PjX+0tQA00q9SmfhZeApXKJVLqffD4VlssBrN/umdz2e1wYIUveVJ5RoNDqllZlldN
	 71a5PJsoqB8hOAYK3ADXJDMfo1Y+z7ScGo1d+1hC0XDh3WHgDtdk+JwFCOL20EDZxg
	 GS38Of7V6e5WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B9E760D6B;
	Sat,  3 Oct 2026 01:33:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 00364179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA962400C5
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01_hM-sC0CSF for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 01:33:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org EBEB4400C8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790991203;
 b=hMO0ITQ363ZRXpZ2Nj8j4jju8xhgjnDJOc6C96pS/OBZmoZ32NLfO6icasZgNadWrPhg
 G54SYlhTRx7zk+LlEnl+NcH0aoI8pMOs6erAaUIhsD5mkmuVkGWhUhCel7Kb8iRgGqOaV
 wr4QkwGRqT5JnxOLLWQs3zyU9lvmTUmXWhD3XKVOlbKOgnfmlSByHj8BKP5XFNy7vfYOB
 eiWBvzV4/BzppEHL5LebnwhgClS2bjmSWJI7XhTQERLhzINR04BXvmunejry2cQ16efJQ
 6VrLFJzUsb1MCqLAKZIph7x2fCQW5Xcnlv4NtvfXJ2pSvPWfqazKytrXqarKllstNjQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790991203;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=qn7OIGHh6Pra2MVwryK7GB90YCcHNQ465K7dVDDLaBc=;
 b=apa3c4ttCw4KXWzS6NwLAcG2Gjg429SXlzzW1V2ccP2tFdl7UBATloQWuPSm8q48bpiX
 Yf2b6S7voguko91cTnW58MBFptw40o5XWgnjm99iYFN6zXMXEQehv+kZILV/rlRObCX0Q
 gh0Jl9XASt5D2Lm2KxSVkNosqnOyB9DuGTGiv/8mAeRbDz5ec8PGca3hsTKP1RDf8bVTI
 Q9YmEB96EecJpUj0Oa/0Ma+HtHFq/WGyoaHeDqhFw1FC5jHvzGHnKQDRSD8QQpCdjHUV0
 uxP5mSTLAuA0IY1JJiF8Jv22Ew0TQc20LB0SCMWcXWnWhxWAyFOnUmmUsVGtXuuJZtg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fUaxEvSn; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=fUaxEvSn
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBEB4400C8
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 01:33:22 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 46e09a7af769-81b0fe50b37so286843a34.3
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 18:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790991201; x=1791596001; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=qn7OIGHh6Pra2MVwryK7GB90YCcHNQ465K7dVDDLaBc=;
 b=fUaxEvSnTsdV0nmeC7OFeqsO3NICgOPPWnJcv7F/9j93EYXPwMKJHmmdUDos24FP6H
 3ITWDAGPpDdGLNFTMaHDVj6Exl2Mvgp6L2VIMNCD6gu1ghIdoC7dc6o4+e9jhiaFIOkg
 qJEfbWQxYCTKuXFxYF+l1bV6c9A8F4sipZ2AScHHhTCFunIU+qryZqy4GjVqhfI79rWF
 5GPewyJdQjMMmzJM1CuHXs5ZtCe2SrTSv1kTGuSyFHN9JZC3M4ieLkrBOjpuA6/mlJOs
 BZntcn7YrYuWbSrxad7/FOBPir0EpiYXWGKJD4QHw3C9iwpmpmlJyiNoMcouSnMGLlmp
 zJbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790991201; x=1791596001;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qn7OIGHh6Pra2MVwryK7GB90YCcHNQ465K7dVDDLaBc=;
 b=cZ6LyJRK+qBCxS2eFjAjQbQKzSyvermLcszhvxs8LjtdAbHxrZppuW9+/4KWpCA8o4
 F6ns2FnPcYzCbL2w4u79Z7d6ZC42D75KX7Njv97oewr/glrh4bXtcbS5OyXFXeoALP4U
 dEqyTGua6D92t8c1q0mZWlbIPn3Q2bbG3SkLlY3ba9D8+YPOh8QX1H2e4Uet91G2G7N1
 20AzrTm2PWnl8UFDKPUssPOlNisKYYXf0c1K+e46zAvN9CcZkxUP+H29PLgNGApCNJy9
 omOZt0I6Oy3AtPFVjbIFtFH2gotz33ysFjiMX8JdzIpl58hmBHjSM1PXvAcBNzDgQB2J
 1j2A==
X-Gm-Message-State: AFuF++lT25x7Q7rUnvjhTvaBQggw0yN9/090amw00+oKRQif2Rnydqce
 HXQZb5PDcjkj6fI7UoX1zHplyP/Gi/j0csDlMzCKCvo+uAR8gD/122MxaSlktw==
X-Gm-Gg: AYBFou159S+Ix0J/quKoo9AcNJbcWdjcW1aYp5TRoXT/tFeusqjtv9BsFPTYB2heiV7
 chMgyeIM4rAvXR2wKk0Pfoia2vz3DQHJOcDWYUDpYKdUNWjvcPRuViwkqkcV01UgQ6GjfJL4gum
 r3SYStS4EiYZb1NQol2nS3189wWW3Pjd1pyFwQGpT9P7yCb3fbqnh2t4yzgxiZ3Kede31m/N/Is
 IkO3mMF960n2aWn3dPRbdRCPrsXuLgHeEGeUNsKQcsgbxNtqYFW/F0OlGUlMK827x4dd2NhtBu5
 gs4IAkdZzJW8s8Djr8vj346CyAEhD/PJYRqrnxRNBEs1TMOL9RdxQNFyz6nAOObPYJ0CkYDkHmE
 LnZHjfdX9u0WwfVMeUhO3WUvAcBcAGQnZ6hYyOqZmMxjkzbBVjxntE/3ETy1CwN4TubuTobfMOO
 7px3eAjj1cVd8XMOWgIgpaOSoGZlP4lY6EHm49foNnu9njxD+nCFdnS+xjx/0Y8Ty+Qiwvi1Ojj
 dlrCpVsI2BA9wyvnHuQlOhIapZdBdkQCql/TDWfWkyO/NxqHhGZgM5CISmhvXo7dYdUYJYNzOFo
 lHrMmqkol0mYiyzsnTcRGOxUmkxT9m+XiQtI41Vj0fh+IgvmiA5qEzrcaR5jbxNLUHhxyVUvBmI
 C8E+7yyBsM4BcbVUbbVktVT7F5wkGoKusLOoc9A2n2iU=
X-Received: by 2002:a05:6830:6f83:b0:81e:b506:592d with SMTP id
 46e09a7af769-823fe0160c1mr1114788a34.27.1790991201570; 
 Fri, 02 Oct 2026 18:33:21 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a56e124sm4759667a34.21.2026.10.02.18.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 18:33:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 19:32:10 -0600
Message-ID: <20261003013304.400979-10-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-gobject: bump to version
 3.58.0
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
 package/python-gobject/python-gobject.hash | 4 ++--
 package/python-gobject/python-gobject.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gobject/python-gobject.hash b/package/python-gobject/python-gobject.hash
index 6b26e289e7..755b51bb32 100644
--- a/package/python-gobject/python-gobject.hash
+++ b/package/python-gobject/python-gobject.hash
@@ -1,3 +1,3 @@
-# from https://download.gnome.org/sources/pygobject/3.56/pygobject-3.56.3.sha256sum
-sha256  12760e4a0e3d04b6eb95e06f7a27e362c826d567ea613373a92c003b6c70d2d6  pygobject-3.56.3.tar.gz
+# from https://download.gnome.org/sources/pygobject/3.58/pygobject-3.58.0.sha256sum
+sha256  45068697de3ffe46840ca369705f23118b34db4f7deb63f6eff079a6734ddcca  pygobject-3.58.0.tar.gz
 sha256  f4cac31434b287b10a70b81c62cfa973d250417f8f248c4c1b5566d061ecfb2f  COPYING
diff --git a/package/python-gobject/python-gobject.mk b/package/python-gobject/python-gobject.mk
index 310cde24a7..f15129a076 100644
--- a/package/python-gobject/python-gobject.mk
+++ b/package/python-gobject/python-gobject.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_GOBJECT_VERSION_MAJOR = 3.56
-PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).3
+PYTHON_GOBJECT_VERSION_MAJOR = 3.58
+PYTHON_GOBJECT_VERSION = $(PYTHON_GOBJECT_VERSION_MAJOR).0
 PYTHON_GOBJECT_SOURCE = pygobject-$(PYTHON_GOBJECT_VERSION).tar.gz
 PYTHON_GOBJECT_SITE = https://download.gnome.org/sources/pygobject/$(PYTHON_GOBJECT_VERSION_MAJOR)
 PYTHON_GOBJECT_LICENSE = LGPL-2.1+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
