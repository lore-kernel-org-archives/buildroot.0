Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EDAD25032
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 04:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2014F81469;
	Sun, 11 Jan 2026 04:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Olurj67LUajc; Sun, 11 Jan 2026 04:22:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56139813B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768105325;
	bh=b/UwquHxCoww2A61QoxNURulF9XL0nxoniwxbEtEjHg=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J3XPZZppkDPnSyBvis54dPmhilHyhYQckKB6FeocyhoPa2+uaHXJCYCuD0D+ZcrVs
	 PFnX1EEQF8xU0ZguxC0L/jBeo69xBniKASXt05Spstu0xZmjBMnEI13pAoR9NJuhlO
	 JqtkqPldzOHGdJoS6GDPQXXY483nv87IgujgnCdqiLxjA1OvCjf364UNuROTo2vQ9n
	 dpBFVR18JoANlk7VG8a29b4YB0Ivoc4U8evkgBWDJvhlk5hchcRQsoKsXyV3Z5Uc8A
	 wR3YYpOhroLNkjrX+6L7mC6r6/9bLHXvQ7RAOtyq6NIMtp7wC0c6gTvPnJDUnQcWzW
	 IUekDH2Ylpyag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56139813B0;
	Sun, 11 Jan 2026 04:22:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B21ED18D
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 04:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3CDF403D0
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 04:22:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ASZlC2L5hr7 for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 04:22:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8EEF740088
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EEF740088
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EEF740088
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 04:22:02 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso57795805e9.0
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 20:22:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768105320; x=1768710120;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gz7uE2B3aUyXgdS9s8WhEU4i67ZedgfVn7Kn00kIIFs=;
 b=eBFV1osBw6XPATubktG+txLyAAwkYfKWhjvw26NcOzYmsnapF0xkBb47JszPU3m1eZ
 Y9hRKHiyNqb36CQ2KPYkagjPhIn/4LQJG1AQbaBqDwWMDRUdZYlzv/llD7RRgdhxftZY
 S8eQhDMvekayrPCyVJrJWWcVhN2rqwFzaCDtT4rRJKSR9U8k5ZpGHCiUSBbNBu97KqbF
 XQfeX00YsrbnnE/dkEpaR91NC1UGZLL5Bl5uxlCm7eaZ/egeSQEZFHnwBrb/7MLDBxGS
 5Y0WrFY9NDuj8291gW0wwos5A9TBKbXzNO2xureQg29hGNguE6VYrstaKDPvcKKkA2P5
 vJ5A==
X-Gm-Message-State: AOJu0Yw7cVma8pqLAGxyzeb6MkprIGss1AzUuSlLgn6lLkd2kBfoy5En
 /Z1RxynU+iQyxLwX+KEHlsxfrwQ3FW5KaYisPdX64J/vzQSIMjOR4GJHXYrmLQ==
X-Gm-Gg: AY/fxX7VRzk/eXGAQ0iLGJjhjHsLAMU63S/vROPPLHmN1/4VaMdyJXD8T3oDNt/wpAW
 ps8XsvXxnX+Es0K/68qIXfly+UlgaIhtlGPqV0iU2ACmqNnaoMSWbdYygPuMooM3vVyYbJVZ6fq
 nPfixZ398erN01UoFsfQdbF6zQKk6tMEDx5I6Vx5QL5l7muOK6OBHbmaN0RKyTKKp5vDOIsA3WX
 nrH2g+4NHdjmXyRfr8QffBl8wzrGuaZtssyPtc1kGJ2unasT37nRyMElIp320CKqsD0j4Wbmoyf
 l+HtWtr52OAEMn0nOkOZcTekhsnNP9HsU+9LYmYGTmvCgiDLCPFraWKbx6qW3eNFS7pop+NvMba
 YBbHyHMwyS4yWL3K/uUzGgcdA+qLfaQzga5QG/lQUJCRCZJ4OQS6QsRjFgCEGTPSWCkXtfTEMKf
 wKhfxTyvmCSHrASQdcnw==
X-Google-Smtp-Source: AGHT+IENw3gXdrcfmqbPruKP628sbHJTyRLsgyObtuAUNh5pVPVnfiYGUVomJpnXg0x8oRSPMuyvfg==
X-Received: by 2002:a05:6000:22c7:b0:430:f6bc:2f8b with SMTP id
 ffacd0b85a97d-432c37d2faemr15729399f8f.45.1768105320438; 
 Sat, 10 Jan 2026 20:22:00 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5feaf8sm31137707f8f.39.2026.01.10.20.21.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jan 2026 20:22:00 -0800 (PST)
Message-ID: <69632568.df0a0220.269984.70a0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 11 Jan 2026 04:21:59 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768105320; x=1768710120; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gz7uE2B3aUyXgdS9s8WhEU4i67ZedgfVn7Kn00kIIFs=;
 b=ATDg6y9OS6GZYB3w35nPV0o9Y/10TIF94Yz7BwPumJS2FgWWJqpfjyK+/buBqQoZSk
 Avmnexb3vjHyM/S4AOo8UrVY9FIhBgiuv39GcdCeU6pTVHDrxq1iqTKDTKXN1q4ITIbu
 mKNo1Ore8ZesrHQHXKYrXWyidHwxc2rrSbDmuwo224yGaeH+5ADw0PcVmBeOE+UgU5tt
 yV6AnC+qfNZMA20CMg3QF+zPBztri6aHN6MKmhi61OjCQd8KUNFAQ7iSasSpOvF4mIRL
 dleReS494J+pjXx7BCzaNht/FosAL4QrP1wqprSYzfQ+qI77dyMPHwEz08VakoS4/WAD
 wCEQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ATDg6y9O
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-10
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

Autobuild statistics for 2026-01-10
===================================

      branch |  OK | NOK | TIM | TOT |


-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
