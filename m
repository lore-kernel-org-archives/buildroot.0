Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55735C5518F
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 10:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8FA7405C0;
	Tue,  4 Aug 2026 10:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OkpsW8j0j7hP; Tue,  4 Aug 2026 10:38:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D050406EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785839923;
	bh=y3idUKkegVHjolhcJQ+4aKjZdKT77ft7fuGPsr7MIjY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NgKeiSskP93p04IhMzY2wSRHgXUFbM3WgB9B1uAiAdu0B6VMyJIjiaUNYug3wPR6l
	 Yxpmx8kunOfFFeOwmg9iFX4JybtlZnVazrCR4KS2znzrKM3Ei0LfOnvr4+vkudSPck
	 D9BtFOR5qi/pZTVHIH22/ncEf4LSjXWU+RhXpJtlQ99iOTcjKH8+VQzd+jiY4vy53z
	 neQrNsz3qwTATpjh8+imrXd+/ZLt0zPDCVsLRBdIElZEjkGlNVVOs5QgZd3XdyC8Mo
	 olJmouky0PsfGbKIF0lXJqXMbn89L/Gepq7P8jaf+mHvRd3Xk4cyhA9EkeebQ8/3y0
	 Jy7hSaVue9BgQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D050406EA;
	Tue,  4 Aug 2026 10:38:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92FF9296
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:38:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 798E860731
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:38:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W5oxgs0qGGyc for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 10:38:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B6F716072C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6F716072C
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6F716072C
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 10:38:40 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-51c928bf172so25659021cf.3
 for <buildroot@buildroot.org>; Tue, 04 Aug 2026 03:38:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785839919; x=1786444719;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=69pwxinFac6SVTG1yn1VRibC8IKgrfgelq+v4lCdwj8=;
 b=gvhDZlZXLknujdlxl7PUNNYPJoGQYsW8L9h0z27TIwb5xOBR82stHan4zuFLRxqkBr
 FT7l2w+fXBp4pls5qsqvDYbxSnVdZzYzlo3O6pYiakzr5Py9LzeviNlbRo63ATa9bvjd
 e39kaLFsQQo9mRwn0lwCssGsLvHFmO5kHBJHyb0mXFsxpsRCW15RYdslSwKQMSXZTbtr
 uRPxpYVppJPXKJXGGtrosRaW7TgkJdfK9ggNfOTGaAQr4CDr8QEUrC0eX6zc3/XV7EzR
 ozEg8ufeqXmruEOV5I3zjZPO/9VdH5m0zTobmc74ARNcpKnZLiNYJI2zKAFa//iwJ7jt
 3TyQ==
X-Gm-Message-State: AOJu0YwNHpkGtkRzFo+WzaG7SRfgnKd1ayqmCMKXJOnl6i/eOUUgMOq5
 WFynPzwJAAd8isc6sTMHQk2gLtxY8T+GE47xG1VAEkwMBMFmc4JMyxxQT4b/ww9xGnM=
X-Gm-Gg: AR+sD129djSaTxdcDGxQcwrWYrYuxHoDbiCgwzjFvtGxBHuBnQTqdqay9NMsp2uJGb/
 fTKUhkejU9xTcTxYPSuLtmrV+qUXpZsbG6FOcACE0Oc+Fb22za/pcMzLnaioMJF86DxuRaniDBk
 b3yykHDrZ8SiOUS9rmaL5soKLl8Hq//QkUB6P4g6X0f6G8/8/2Dw0GOm6/gDOp8miR+zh8BOjzu
 bcwipOzAkdh/zV889BmTzePyiQubfkZ1kN8Auhw1DCTioh9SNvt+sNnQ6FqL26lZ6twFKarjkPF
 dO8EmV6CjvGpanVrYw6D08VFxEOEka+uKSpbJ6LMChLt8/1YUyYDATSbmRa0jvw2wlZqYff3hQz
 MPzRsMR6bjqIZiP2H8w6C9rOKLGSaNLvgMlXMNSNUHtappQWi569nZCuGySpSS/J/bwNvqLf/1K
 OSh6wEOYODtJBgJzNBb+vBLx5Ej6rx6GTKJIf4y+vTIRH+dUhgvEbiExPLV15M6nr6iPyXyE8VD
 XkG97TzZiKzpa0=
X-Received: by 2002:a05:622a:5145:b0:516:d955:ea6 with SMTP id
 d75a77b69052e-52b566afcc1mr275387661cf.14.1785839919475; 
 Tue, 04 Aug 2026 03:38:39 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52b4e7edd06sm79871711cf.2.2026.08.04.03.38.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Aug 2026 03:38:38 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Tue,  4 Aug 2026 06:38:52 -0400
Message-ID: <20260804103854.429758-1-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785839919; x=1786444719; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=69pwxinFac6SVTG1yn1VRibC8IKgrfgelq+v4lCdwj8=;
 b=n4z5cn+WlwEX+Zo+kJmf2cg52Z+CxvB1D8v1jl+kRR2SUgmo5xO4CvHZEa+xX/QXSv
 Qgdp/S566qR8ImGGnGCPBUpfJFxhaMbTOp3f9hnwTzcW2wlYKwX30wTgGAGZNyXTWmXj
 rEooz1v0A7bIaxl7ynl4TAOObtKbmwGktLlUGPWdAh8hncJoQmz7IOA+9ITbOHCYtFOp
 C3UDuegHNqGZLRnuAzVZ8KVJ+W5TTeW/WSaIZQQ3xWgi+gBRm2X+ACjUiEg+OAogzO4h
 y49/8VQNu5VsldJo9NkCTYuz9taVUDBm6G8+S7eH5WhTub12ff8kT3kH4HTP9izDZZ2j
 DzRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=n4z5cn+W
Subject: [Buildroot] [PATCH 0/2] Add liblc3 and enable the LC3 codec in
 PipeWire
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

LC3 is the mandatory codec of the Bluetooth LE Audio profiles. The
PipeWire bluez5 plugin can encode and decode it when built against
liblc3, but -Dbluez5-codec-lc3 was unconditionally disabled because
the library was not packaged.

The first patch adds liblc3 (the Google implementation), the second
wires it up as an optional dependency of PipeWire, following the same
idiom already used there for the opus and aac codecs.

Both patches pass utils/check-package. The tarball and LICENSE hashes
were verified against the upstream v1.1.3 release, and the two meson
options used (-Dtools, -Dpython) exist in that release.

Alsey Coleman Miller (2):
  package/liblc3: new package
  package/pipewire: add support for the LC3 bluetooth codec

 DEVELOPERS                   |  3 +++
 package/Config.in            |  1 +
 package/liblc3/Config.in     |  8 ++++++++
 package/liblc3/liblc3.hash   |  3 +++
 package/liblc3/liblc3.mk     | 16 ++++++++++++++++
 package/pipewire/pipewire.mk |  7 ++++++-
 6 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 package/liblc3/Config.in
 create mode 100644 package/liblc3/liblc3.hash
 create mode 100644 package/liblc3/liblc3.mk

-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
