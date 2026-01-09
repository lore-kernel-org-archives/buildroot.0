Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6BAD232D5
	for <buildroot@archiver.kernel.org>; Fri,  9 Jan 2026 04:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 492578343B;
	Fri,  9 Jan 2026 04:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jfBvF1GFfRy; Fri,  9 Jan 2026 04:21:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5065F83196
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767932510;
	bh=PUdDSJQAK0tQI0BCCr4dPmgPZ+PMR2T0HMCI6OzXSCE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cdZGHpKmM902X/aa0YEraPydOQWk4tZZ2Lux2r99fRx4hDPyo0cGzJuopXrOaiffu
	 q0MnIYq7j/ZQYFItNcTQuYB6mNbvnXtGSW+dzFLf/2O5qxbxByWOiU0CvEncCImsHn
	 DzAVjb4BZFAII9/cVhO0RDIiF127p/6OawlWuuPdYEQ6qWjRTs0iXjvvkAP4+aZbXy
	 kv3MKgmixOSExrOUH9BGoK6u8PwIhyXQN+Gu7VqkQGC2NPrVy6thJj/oOhjeQ2GWMk
	 ofoe9mAqOE0y9aBWUOBwTs6rVK+mWcDEheQFFq7zguzwBfw0E5M0zzzCcQq7B46yR6
	 rUuHokX5Ndw3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5065F83196;
	Fri,  9 Jan 2026 04:21:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F8DD278
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 04:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 45F786081E
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 04:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HxbMp2gz8Ax for <buildroot@buildroot.org>;
 Fri,  9 Jan 2026 04:21:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47ACF607EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47ACF607EA
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47ACF607EA
 for <buildroot@buildroot.org>; Fri,  9 Jan 2026 04:21:47 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-42fb03c3cf2so2019334f8f.1
 for <buildroot@buildroot.org>; Thu, 08 Jan 2026 20:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767932506; x=1768537306;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BjO6zGQjy3zyFoTH7VOSvnk8DzZe7ZV+/jkMZvkNLCA=;
 b=ITeZTWzrWvXhRaFMguGK/xS+Uq8pmC78rVdQR0cUaLHsw8Mt5KQr9cc2sNX+z+eKaJ
 NE0O9oUq9DQZkYrF8kBO5dibREcW/UtJKrtV2nAf+m+3DCX3r0RJ0v3uUJGktHA2PjqW
 ZjohTBpx8EVmkgXmOGYDMFUqHZw34HWG0RBoL9qqPoy5qukyPgOt+jtPGUu343+aNCHt
 Ix0rfwp7zRfCEI3OeuVgKfQcVp5uSsQYv9dvYnf97IpqFXi2lr85JK0JhHn4yv9We50B
 y0fe2D2lRIoYNU65e2LGXMpEdneXYj0HDEHVsB1LSCuwIzmnOJqcUT3ziel7ojgjoS41
 B52A==
X-Gm-Message-State: AOJu0YwwQuU3u0VsgHZQ3YpF4uwIPN1o+5b+o3hQaHiP0Tik5uZGUv53
 gaatyrBJA72+Cw8Pgi9Dg9pau3UpQe06hcZbzPT0/5uJXx8mG/mQYDTzJArPpg==
X-Gm-Gg: AY/fxX7R/NZvH8OULQGOtohv+QRZD0eGoR2WhwLhKogLtSypFztldZI9hx0hvCa0xnx
 6voHxwY+Z4MeuLinzb4ivz9Z+2J/PbtgxEQJtlEhO5i/kSDYL219neKQJXGqQS6fGByxVIkm53L
 F5Ut3aQ9Osml6ApemcQDHQPVovijjJbavmLdycjAipulyMs5WFZjNGFWXkHgsgtXQUewfzeKSXw
 D0FOO8U+wCJ7quMMcoVefOjoWrNPQLv3+9FAdNgg0vUaLBCQmFx7K5KzagYJLvTiz54xSqZIdon
 weyI8twxkSiE5fe8IEc0uT69XEYVvR/ukQQycp0/L12jyBti0czTECLUATg/cVQ+T0SijypaPxc
 vRIxzC1glk7uStc6wW563eMZ8GkrSYPlGqf9QGyaqe/3uA20ZDZnfjxP7vgO2RfvhYT80uSHkA5
 6Ghd/BrG77d7J/efMCmQ==
X-Google-Smtp-Source: AGHT+IFeSQ2ftWhxAJVz0melOcQXI8CeGdvAslSq+rZqA+4Ic0pA+0kFlP2PfHb9fEDsJiyM+7J4DA==
X-Received: by 2002:a05:6000:616:b0:431:9f1:e4c7 with SMTP id
 ffacd0b85a97d-432c363418dmr9630071f8f.21.1767932505915; 
 Thu, 08 Jan 2026 20:21:45 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5feaf8sm20064217f8f.39.2026.01.08.20.21.45
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 20:21:45 -0800 (PST)
Message-ID: <69608259.df0a0220.269984.5448@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 09 Jan 2026 04:21:45 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767932506; x=1768537306; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=BjO6zGQjy3zyFoTH7VOSvnk8DzZe7ZV+/jkMZvkNLCA=;
 b=OL216+ckEyDk6+URMlG+gwzLM18ZoLo/8ZGX5MiWDorG+IOyjLUMV0UhvmyFScEo3K
 7vHaVLL75mlHoJqIrdnDA+VtZseIKwGs5nts22dWdxPVKkpz228H+++sRiQ+LGsQ+C6a
 mj9hE4EHFJ+fygyf1ORWAWGMxpMg+sfBPU1v0HSpK7aGCqrxdszhXDqzaXv+BTxK3wpf
 Klo7Je0+BBwl02tAPqjRppD2GGJnLdpEYpzRWVkTunsZgNcux9wpKIAqtt8iA53WmLQz
 OKO8T5U3UeoRzZsqhBhLExhnDa7XMlG7fMVbJ0fzCjCrMN7/3yPt4aOB0gnSv9gSro+R
 iRyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OL216+ck
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-08
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

Hello,

Autobuild statistics for 2026-01-08
===================================

      branch |  OK | NOK | TIM | TOT |


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
