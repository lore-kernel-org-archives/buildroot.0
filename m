Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AD8EDF16F
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 14:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC80681DE0;
	Fri, 13 Feb 2026 14:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Ub7NLfUjmIR; Fri, 13 Feb 2026 14:35:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B744381C58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770993306;
	bh=SG/mnnbWjZxvdhn1isJIZZhDBJ9uuykuK2R0B8G+Ox8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=s+pJ7rNfmPznhB775QwQNNjlaSeaoJY3o6J0ZQs5ST7AxwhenV93XkdcLFAC9gCBD
	 MUx4UOfwEV7tsnO4AE4i1f8jb9FXv/Jls1vm17OtnTCn+fqZ6QZeHpTjiDQ5iZ08i/
	 atNo28+7Q5MlTKOQpNUmz2o3lrXOXWutrsAFHXy4YyTbT34yLFocJQYE6wsAlMbryM
	 YAyuyUXu0LyLTL1OjWfznRbMrH/zjYHrv627bj6ay/5319cvIgrxLBG2oZVZX+VzDA
	 doWj/q6ywocyKixwhNyFS57GeerIaz5kkjNmbCw7QJMcylrY4xIkVIWRscJOc92HnI
	 MrmrHssiOcUkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B744381C58;
	Fri, 13 Feb 2026 14:35:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 273A569
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 14:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 213416124E
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 14:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wQDX7q7xkQkw for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 14:35:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A16BA60711
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A16BA60711
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A16BA60711
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 14:35:04 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4837907f535so252005e9.3
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 06:35:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770993302; x=1771598102;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C1QVuwjYZ4IdvUvy8ekN6w08n0+NeETXlBadQXbHU7w=;
 b=U0+9uR1COaF6D36oFEmhxACNM8aOR0qcXU54CoDDXiOtCAowjt1NGJ3ph/bM7AVcQO
 8voSTuqwvTutyiRbW9YfaGvgW6mOnw1LD3mTGaZ0NaciEqJXVzF8Uk3qJG+9zsRmXgOd
 lsF/mluz1tzsOhRU1NL8pyrT4nU2SIrK7/luRtICQFbj2ivizd1XBzOYmj9eY+LfPld4
 Ulh6uKex5XkzjPARP+R+BJ+WXfHwUTFVjWfRDzhnsC5sAsKh9Skh4lLphneL48qUT3C2
 OmJ++6ZJfIf/VE7RPBPD/RxxPSIWN7W2RT2Dez9adOZcsd/T8IeDLT8BO1qhJWNNHfSs
 MxQw==
X-Gm-Message-State: AOJu0YzXCxCIx0CEp33rwG99rTRnxN2cNGs8jYCH8YlONWq3Bja/mXQG
 m49cyqEys8o5Z6Jdj+JflUpvza0r8YC7KE2tOez/wY/hQtLOSgWxS9QwZVUwFS+qyY6iLjHI3yK
 mn7jP
X-Gm-Gg: AZuq6aLZ5FD9byErj885fjwiY6tT+aYavcNJJYGGgTurN+NQImIPYj3Oc67yKzF2ZXI
 A27boJZrSs7bo1cgQHnHpWEgjc+gKg4yzsgLHEjDZROK4L/W35xgTkg5PBnEfd4ei7LjMG2AdjS
 GLrnHZ341ebD+ht0iB9R2fzLOnNPxSjsOyDUwfJkCL9/tgeyD2VRW7PRTcCfZjF+1jMzAYu+rVr
 ZJlMBVNPcqpa6tYDKJpranqlgWRUGpd8rILtH1xSbkUvEv8DVPz6k8TDdqHW+ZOEt18av7U2JJR
 NbSKPlJTcQ/6wQXZbjC8+jg6hlaQW9sp6gXaNhzvZ1Psd9CpEzFwwOAomZSLw3UNmc/+7cxgEx2
 UCwfivqJi0e72RIhG3SWw2yo57+YvcWws3IwCbwl/oBCgJLnWDY6WUaB00ztOcGM0zEEwqaUKBA
 wAbHtHKTpiC8G2wLo=
X-Received: by 2002:a05:600c:6211:b0:47a:8cce:2940 with SMTP id
 5b1f17b1804b1-48373a1107cmr32061045e9.14.1770993301808; 
 Fri, 13 Feb 2026 06:35:01 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48371a02a79sm41320725e9.3.2026.02.13.06.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 06:35:01 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 15:34:58 +0100
Message-ID: <20260213143500.528726-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770993302; x=1771598102; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=C1QVuwjYZ4IdvUvy8ekN6w08n0+NeETXlBadQXbHU7w=;
 b=XLluyTNjK1cabecKNpABeTIttiSEj/W2Eil6kGYAhCr2gIngDnkNusrPW+8hHNbAIr
 A3ZPdKdY1uc1GECwEd7ZXgOxwnyoGm2zXabTRWYE7ZrioI4H23ZCI91D3ciWye0O+XDa
 zw/o8vjlGBWYoy0uxGhcXCRPBWifpFeODMwc0lALaofk9cdJmKeHal4S/3VY1tpNP2Lg
 oiuNkXzRuLog0UdSxsbPyVtKRNsns6muhLvVXL0ekRVSS8lf7N1ZB9YR4YA0Nhzv3YkM
 oFiv9alMYAjlA99bJ8gLx2DOFnl+LdCU3YyEaZMoQoFnMMg5YnzD0mFMluQYW0PGq0Ar
 zNPw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=XLluyTNj
Subject: [Buildroot] [PATCH 1/3] package/dash: add CPE
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Vadim Kochan <vadim4j@gmail.com>, James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CPE `dash:dash` is valid and has a single CVE associated to it. See
[1] & [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2009-0854
[2] https://security-tracker.debian.org/tracker/source-package/dash

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/dash/dash.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 78effa791c..143972f01a 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -11,6 +11,8 @@ DASH_LICENSE_FILES = COPYING
 # We're patching configure.ac
 DASH_AUTORECONF = YES
 
+DASH_CPE_ID_VENDOR = dash
+
 # dash does not build in parallel
 DASH_MAKE = $(MAKE1)
 
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
