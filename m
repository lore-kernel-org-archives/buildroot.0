Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C541061B06
	for <buildroot@archiver.kernel.org>; Mon, 30 Mar 2026 14:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C2E440C9C;
	Mon, 30 Mar 2026 14:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oFaAGR6R6Pax; Mon, 30 Mar 2026 14:45:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A9B840C5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774881959;
	bh=xUdBSQcqvr0J5l06I6OTtk6xCuaVk/hH/WHtT34/MEo=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NvbMzZSKT1kcaItHT8uiqe4uNHw9sNgrycnV3EVcIk2M+kSHf2WaDxKoTG83yPKeX
	 R6t/aP0TR55VlTrUECppmMIfAQeAeQsaCH/SmwtQK6CUxCFnycvBEGLtoA4AkHD2JU
	 j6eq5JGVxgtmG3rMdeVZ5PjLfiuNOehbOCFZ7TL+u2MOpq55qw1JKzTTNXkK+jpjQ/
	 vPLgwjivt5yOg2S9vj2YpM63PRpg3Jt5+niMk2aOHRB6QDNItYlPoDyZVOzu2ZMjr3
	 AtmxlO4K4DqdT5RYD1Ma4TOrXCpK+rAGcBXAhU70RZa15pTBJ9rRbyv5Joq0lxt0JV
	 smI4tv3nmzn8w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A9B840C5A;
	Mon, 30 Mar 2026 14:45:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 472FA10F
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 14:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 388A160B8D
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 14:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TE0LuZAq5pXB for <buildroot@buildroot.org>;
 Mon, 30 Mar 2026 14:45:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com;
 envelope-from=a.p.dicarlo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5AF4A606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AF4A606FF
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5AF4A606FF
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 14:45:57 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id
 d75a77b69052e-50912a097b0so26250621cf.1
 for <buildroot@buildroot.org>; Mon, 30 Mar 2026 07:45:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774881955; x=1775486755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=U8d1gq4E2aNVElGp8ATbSqsuPmBHmE6l7hlMRL0obMI=;
 b=ZzebzOvM/P7xVqWHYxuJxUPTwSIX3w3nh4WGXlmm7tb/W3vfOhPZJOsV3L9hnE3VpM
 +vlEYnONO6pMNRuuI+0Ym/4wOsCQ5sHdYcxvNoW2aSn6DFQkHo4Bq3U9zJdT85NF7kiV
 lM/ANIhQOaAE3KIiHWTDIWe3IKZtLXuvVEIqmYZsWRFlp9EWlKbbBTu3MtUhaBQdEAf2
 5UUWPVoWsN0HUSRqXsCBdRywDNYDI4y+aCS1z9n1rc2bUDTSt5PauSAYI6ZNh2n+0ZSz
 jtNb9PDYk4RNLPLenxkb8IEDhvmYIgrQMRvwqkf9C8l5PGMzzT0Kk6Z6zR9CmfuTL299
 It5A==
X-Gm-Message-State: AOJu0Yxw8sTKZ4Z9YlCsvDwYLx20QoSZ4Dx5SWUX+aRSJjl76xS4VgSB
 gvUqjdxqsu1MUHT0fi+2WqmQxUW9bZYrNtiZ0v3sfodLqz4SFqeXHwTSOiynkEqo
X-Gm-Gg: ATEYQzymJnSbQb9TJ9jFBDl8k4rnc+E5IXofSsDKuy4FGgvzKFBDk2dcCTMQFRAtY0t
 zTgsZyYlPMcUWsh7f512Kbij1VO661fQOea/F/0ATWSRGRqgHVgB5aeqt8ufG0C/NCSHYRMJuq/
 awpuzVsY5xOTzohWAdQxyiwtwOoUvn2jfNf8LdQJNwnHa2PMkvXRxvPzooKE2mhRL/TLuPEp8iz
 WEa3eRQXEkJcUjucy2ByK0K6syynAz5U73wjjDHtje7NaCWQQc/84kRjMz5HaskQA4pbB38PCut
 eW9v5HKIvcXoi/uj71qcNmF7xsT8N+82w6T9AmrqzWcEpl+S0NrRcH8FYnO/DVFmNB9k+SCzKfT
 O/nuKG6DgDH7kRn7uCTaG/vpSYaU8sjfXfbITlDCy3bAEOeLJrYkdxA1hLkSwDTL9kGPArIjUZp
 zsjpm8K76DV8VyNJ6lfPd6
X-Received: by 2002:ac8:7dc4:0:b0:50b:5727:6a7b with SMTP id
 d75a77b69052e-50ba39186f7mr168652231cf.33.1774881954972; 
 Mon, 30 Mar 2026 07:45:54 -0700 (PDT)
Received: from adicarlo.nyc ([67.245.157.254])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50bb2dd8d8esm66259111cf.14.2026.03.30.07.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2026 07:45:54 -0700 (PDT)
Received: from yogur.coo (yogur.coo [192.168.7.134])
 by adicarlo.nyc (Postfix) with ESMTP id 321D0A980E3;
 Mon, 30 Mar 2026 10:45:53 -0400 (EDT)
Received: by yogur.coo (Postfix, from userid 1000)
 id 0E6868A; Mon, 30 Mar 2026 10:45:53 -0400 (EDT)
From: Adam Di Carlo <a.p.dicarlo@gmail.com>
To: buildroot@buildroot.org
Cc: Adam Di Carlo <a.p.dicarlo@gmail.com>
Date: Mon, 30 Mar 2026 10:45:49 -0400
Message-ID: <20260330144553.2525883-1-a.p.dicarlo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260329154709.539516-1-a.p.dicarlo@gmail.com>
References: <20260329154709.539516-1-a.p.dicarlo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774881955; x=1775486755; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=U8d1gq4E2aNVElGp8ATbSqsuPmBHmE6l7hlMRL0obMI=;
 b=EpK1V8h/IVGFTIjnbZ3hrbSf9f7Ti/gtern148IkhnY92jt27iwFJUfqsX1yIcrg1h
 oQtG+vX6OmwNELf7YWDS0h8VmzpKc0vItT/YfjHm5QAA64U1NJrZoEHaBZyy0DenP+zC
 jDLJRtGFuWpI0mgUYMH4R91o/Jjakag8gWAzsXlKz+br9aehrBXz4YjbV8YrH3mMF73K
 3fDVv+94EKh15QacMmbKBaK93JeXY39Ts48yU3DGasa8UbQLbBOGZonu5N6LT/cgrzSe
 lhdmYSLgdabANp4t4Y1m6rjdE7W9MgNbXe2LQ8gM/NZwhBJNey9QUUxeVGzYNHy+JOHf
 zzfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=EpK1V8h/
Subject: [Buildroot] [PATCH v2 0/3] gstreamer1: enable drm and udev
 independently
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes a problem impacting at least the gstreamer 'kmssink' when built
without libva, resulting a very limited capability sink.  These issues
are addressed by treating drm and udev as first class dependencies,
activited by their associated and packaged libraries.

Changes in v2 -> v3:
 - Corrected a mistake in a comment pointed out by Fiona Klute

Changes in v1 -> v2:
 - Improved commit messages.
 - Correct some alphabetic violations.
 - Linked to original V1:
    https://lore.kernel.org/buildroot/20260319022906.47253-1-a.p.dicarlo@gmail.com/

Adam Di Carlo (3):
  package/gst1-plugins-base: if libdrm is enabled, make use of it
  package/gst1-plugins-bad: decouple va from drm and separately select them
  package/gst1-plugins-bad: presence of libgudev enables udev support

 .../gst1-plugins-bad/gst1-plugins-bad.mk        | 17 ++++++++++++-----
 .../gst1-plugins-base/gst1-plugins-base.mk      |  7 +++++++
 2 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
