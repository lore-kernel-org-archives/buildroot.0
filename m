Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0899ECC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8CF680D2D;
	Tue, 13 Oct 2026 16:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CbFmaXqq_TGr; Tue, 13 Oct 2026 16:43:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C293B80CEE
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909801;
	b=VNQXZB0diHiNIXIL5+ucDkJrgFg7VSgHpr4ibAZwwH0q7tKXq9cLLvevGbwCHBeg8s2Y
	 X5HgKvWmIr5EaDWnny+irN+J2YEXlw4yOcFj+b0VkCwzMpJLWhDnF0Koj1LnaWlu2TXEU
	 P0cZgclCS9W8kJpHBnhoL6+BJ+hNC0w2/pTv4GeUaAj8WLnlmtsOxdcvV/KcPo7i579pG
	 UfgdbS/igMl+khKCUAyhm50ktLfjXCQiGsuiQq5Jf5u4glJInnyGBPhBOHtl3vvkRI83S
	 TWkIWuoUuLaoqXzyiLB7/ohX5v+5LsKjdigPd0SzB+RejbnEqfAg7CtmmMGhFb1qnrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909801;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2ZXw79LhntfPJhV+5EitRa0E7Rdx7R2tw8tgrUfYZMw=;
	b=eMgHzK0yHt/3Wj4bdFokIvvNJjetCN9bYO0u6/q3L4l5j/Hf6O5KYTBw/DsKwQ0quwrx
	 bXaVMG0GULxMEqxxCsukTCll5kzYz+ZQf6f4HUpfZwyc8IZ/7cJgAnGlhX2G5QWTXKFf2
	 5TTqRdG5ZQFBONerGvrfX1TzRGXt/7IwoCxx3znr+8Ij47b45GYaY8Canr9JPsjHE7XEw
	 tBjPMuP4R9ve/XaX2jbzRzh7WlTDiEbOveB0Eo5TJ01kajY6ggO0pntNLirP55rqRl45r
	 y8Ej5EMhPBTkAkftCdlFx/7FAC70QZ7nQs3qYLMtNk9MkWrLFaqDaKycJrw3UesCwnA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rhl9sY45;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909801;
	bh=2ZXw79LhntfPJhV+5EitRa0E7Rdx7R2tw8tgrUfYZMw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=EY7MRAN6xwp32hZkYXx6GkOrdDWnTSxCHavQOSiwx38naUNSJ0coiUjZb9fhjZdHr
	 ovUrq8bKO5+8EKKUIMtOlVdIEUs01NAnaDdVTtZsfXamFX/wj2HdQovn4gSpnUJU10
	 Ge7/5zCw/vq/YI9axLXiObtJkWIn8SMkNSxx367fWM955jzNtsMfpXnEwMswbNGXbf
	 uW13dhjyEDFlKwu/MyLgSwTmHt6TNrTkbe1XfmKsT4HSKpHpRelEsWvzPaAXC2fBsV
	 ceSR1mRWwoWw04tCKP9p9g3CXiKbSzVJeaAiXSeBIHTbqqehOjDTjzo+J+g3+dtt71
	 hs5mK5eOEidvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C293B80CEE;
	Tue, 13 Oct 2026 16:43:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F21A3DE0
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D662580D7B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8EmPpP8a-dvs for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9AE6780C71
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909794;
 b=JmL9t2u6McpINYDQtXPjwsnn0lG84WCoucMqREDPiZZVk/bByvRG1O/jO4wSHWkDWPVL
 NT/DBRPJBUtmvIpZExth48vqXqj8++z6BS0ygtqfk59k6pOiqRZ9pjzGQsVwkJ1oiuM6B
 pqzavg0WKD05w1sjsmmxH4ElanOx0Sl9nudP3oWsAXycXEs5fWCR1tWsNa7BPYEmscSdK
 01dFuL7gZGaCq2UeHWb7H0/XtUwMbgGCSEF5v9HaGn/TWkyLRF639qrmaUsBP2Y6kKvem
 Q51LnQqKUfvIgmZxUeZ7/Izv5ipfEBV9i9TUFimQxwC2VoDS6MjNAzt9jF02ZzN7ZZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909794;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=F9PSaos8c+vfztZNQPZnKy31eN3Hj9cQNWLynv8MDzk=;
 b=KK55yUjfZHm3ZU+yutNjoDXuNV/+9KBmozTRM3lsDIE4rkcrCU+C3oQ6qcaANOVyUr7j
 B/RuI9gMU+UcQrNx/FPmMzLXoSHk6WV+ZjI42M4/9B+E2J+KoM4SZeimgqfeV82Bqm3T0
 yM+NSONJbe4U9eaqrfvJagSW3Es50XDEYVLlWlPAgdE6M67pU04XHZRBJKi8nYSBOJKiN
 jh0Th24eXGvQFD5RRKLETelFYFQOeLUZ2/2WsENHTb8I0D8YrWFvVUAy5mOmH6vgZKrcx
 Y8W3r8RLksFMzxX6cPwGugs6XKgSYH94DvrrZNfsqIIHHUFA2ilIAzS5XC3DVuo1VTw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Rhl9sY45; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c2d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Rhl9sY45
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AE6780C71
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:14 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 006d021491bc7-6df1eeb43feso1340896eaf.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909793; x=1792514593; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=F9PSaos8c+vfztZNQPZnKy31eN3Hj9cQNWLynv8MDzk=;
 b=Rhl9sY459y4TaWFedBHBUhbNANFyL/WGXZhyrrqewNg9PIKhwB0qHxx1EOqUWxwLTm
 hMJLLt6uxfmX2ZFlO8i7T8T1c93er+ZpqZ2JFJepo5SvKPGjYNhmeBBihyTWCydm7S/D
 Xcesl8c2VPezLV9/uQPT8oNHxSp8bTJCdYZyD7t11Cm2X+rOob1TS7b2pqYHex1PiHL8
 F3CTFlvEEbC/c9A7U8LpzxisqKe3N9LkLASjm0iUqOzx5J3SjYCSLHahzd70+wo1zy+W
 3irx7WqxMBIpYk4IIq6d9KfHJuS5yaSwUdPmPYF6d8eCLK5qmZG/ADrimGOarIf7Ae1p
 xocQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909793; x=1792514593;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=F9PSaos8c+vfztZNQPZnKy31eN3Hj9cQNWLynv8MDzk=;
 b=YAq2QRCNnyCvQPG29wK1w0XQ2Sx/wRQ7wEV3x+YqgM8gc2sEE4kIaEKI5nyzImtV8m
 66mZCvFkz07AC/fKWWhJ2AiAG3ep8PPaQ8/wSvTmY7ajlZc2S1qHC9EciRTZXxxP64Wi
 QSM6c60dV9ga2FOQmuY3Z40YiC6NQRSwOuWPZ8L6uoLmUteqtPeLtwpa7ERrueMvB7kR
 yfZaCaO8s0YdTTXkwXagiAQ5tRclJ9qyrl+0EGur9tCMq3byR1WF95bqj+I/M19shxcz
 56sUT5BXTxxoC1ccwEI+lE0KoJ1FW/El1QNG/7rAh/K/h3U+cU5qfmHCFa2jH5sBH24R
 abyg==
X-Gm-Message-State: AFq9FYIOPf1M6lTvgBXkeXF4RSBLVxFHEc7ZdXif9cK0Rt9UM5KgeZHL
 /u062Jf+MOUpZ5wGpkg+jP2m+uNUzTJM7bPQ+Wp4yzkU9YTmwDCZTeNKb0rLAA==
X-Gm-Gg: AYBFou1RZ3bkfoYbGqkDy/IvuIXwHLzgXWX4i9ZfxVZCIVXsouHMj/o6s27cwDb550I
 wxPaQ+Pa6tkS8NpDB80jRm1OlF7wtL2hX128EeDn6DJ7+b/nNv6PNwjolYwjIcLKHnrp+7ce5Yv
 0p4TKOm8M5QOsJcfH/iJP3xWC2vDtQ/P/uEoaIKYtUpZqOnYlSnwFvO3/BGhggk9QONo4KrwmM9
 BlL0Q04MHJfXP1jCPGryauXR4dVDx3MM7sbzQa7U9fgxH8sHEjMsYYcIJoUbn58orlF942jf3X3
 5EyAuYFk2Mxy93ld/5t9vfoZX5Y/1Mal/OThMW2eTrlyyDhSV8M7AgiBqI3WKhvFFhcZbJZECDa
 CF92HGaGTzFUho8IDp65Ef5I6CZHCys6YcOdLlhlLhO9FKilmDVSv7RSUQCV00ujGCoLoi8MaFu
 48ng8D/CLNafB3JGLBkUqK2kHg6VP1AqT8R3ocYFteNNYxDEm9LeRpx4P68UYLduFlZeEG8C7L+
 EYBMG4qH+Rv4Rb/3K7huDxaDhmi561EfdmTJgKLAWHc7/ue2PxTP9tivKqEouPXpGvCJkygOnfP
 6Tg/MkhwXWezBDZPo4k/6mVQ2hr0869ZAgQgIVcXBfz2ls3hCnNri/NEgs2qeU1qHZRwm8EgGvs
 Xw5nk5V4/Blt5jKXrDTlakf8XoGzGI/OGHph+nlXxYuY=
X-Received: by 2002:a05:6820:f016:b0:6f9:59ee:cfa3 with SMTP id
 006d021491bc7-6f959eedee0mr2239788eaf.32.1791909793375; 
 Tue, 13 Oct 2026 09:43:13 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:12 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:41:58 -0600
Message-ID: <20261013164254.1476592-12-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-google-api-core: bump to version
 2.42.0
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
 package/python-google-api-core/python-google-api-core.hash | 4 ++--
 package/python-google-api-core/python-google-api-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-google-api-core/python-google-api-core.hash b/package/python-google-api-core/python-google-api-core.hash
index c99105cd6d..d546dbae68 100644
--- a/package/python-google-api-core/python-google-api-core.hash
+++ b/package/python-google-api-core/python-google-api-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/google-api-core/json
-md5  96fb3d02ea327ff1051fe3a7a212b9f1  google_api_core-2.40.0.tar.gz
-sha256  ebee7d1b138b5362beecec260e6e8988ac97346562c7382ccb6f0ad8435c599f  google_api_core-2.40.0.tar.gz
+md5  d24f5de1ee29fe538f3b042188f7a51c  google_api_core-2.42.0.tar.gz
+sha256  82cf5daa2ef1b456d4e29ff1de1a5c2995c7be3ccf4fc608184326e03390c1ee  google_api_core-2.42.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-google-api-core/python-google-api-core.mk b/package/python-google-api-core/python-google-api-core.mk
index 0da2f694f3..55371ab811 100644
--- a/package/python-google-api-core/python-google-api-core.mk
+++ b/package/python-google-api-core/python-google-api-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLE_API_CORE_VERSION = 2.40.0
+PYTHON_GOOGLE_API_CORE_VERSION = 2.42.0
 PYTHON_GOOGLE_API_CORE_SOURCE = google_api_core-$(PYTHON_GOOGLE_API_CORE_VERSION).tar.gz
-PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/23/f7/0fb8c3618c783ad49da1aaf97f93a4bb9e4ed522135516b44d129a7f85bb
+PYTHON_GOOGLE_API_CORE_SITE = https://files.pythonhosted.org/packages/ac/aa/2aa84799e6920216f8aa2866d3b43daa20f7060dcb6efc8f0449e8be0ab0
 PYTHON_GOOGLE_API_CORE_SETUP_TYPE = setuptools
 PYTHON_GOOGLE_API_CORE_LICENSE = Apache-2.0
 PYTHON_GOOGLE_API_CORE_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
