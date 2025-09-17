Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17865CAC599
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 15:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C54C382322;
	Wed, 17 Sep 2025 15:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e7GDvih94gxV; Wed, 17 Sep 2025 15:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0172583DBF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0172583DBF;
	Wed, 17 Sep 2025 15:20:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F32EAAF1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 15:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D86E9615AF
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 15:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TQ-a0Jjb5rlE for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 15:20:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::543; helo=mail-ed1-x543.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9DE5C605ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DE5C605ED
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DE5C605ED
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 15:20:38 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id
 4fb4d7f45d1cf-624fdf51b44so8254723a12.1
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 08:20:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758122436; x=1758727236;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=c85EQh/S1caWGFr3MJdnjvwuB8AI4GRS2L/K760GYTU=;
 b=Hi0OTzIJAnCeh0zEqBt2fqmrza+0ahuhY3ND1OaBuhGUCvS603PEZxkazhMrpG+9qD
 ZseKuI/2OidCfrn10/r3W6c6pk4715k1ZMBvTiZet/xYV/7YpxzXLKh0V3wzH7wyJkQS
 YpuzYLHVUS0xTeHMQMJ4zmCUpW6bCUYe4KiO2aICs1a3XGrHTUQ4idEKPX3b+G3IBP9S
 EP0J4ni8R98eEBbPpWsHRBvB84V6DsX+0jVbfC6tl0EEeXMROwhD95EPsb8aDXpf9ZMg
 NWvkiJ2TPl3dRx+TQSXAb1jPc+4A+dsphEYjxQceQMbOF5aiacn3/SiuKA6y7cEbKlRE
 wvsg==
X-Gm-Message-State: AOJu0YxDu1tnzpSwuf+4V+czLEV4+Mo2lCh0Vs4Egy7k278qLBr+7So/
 uBCDqQp8cyEv2Qcb8RjjYuR09QeoTEnieav187rpriluf3lFHI1XTcIAkqide7yU9cVVwkMrBxv
 OwkXBmAEUUQ==
X-Gm-Gg: ASbGnctqLuVJgxn5TmaCtfO+T7vxgWoyamA1V2xBoC2R+fckf0SJBg7PxG41SMqj7xN
 Ob7zPUEGqEcdS6oSF4OAoWXF4kQj9p/V5Y0I9ZDWXTMa3451k54qj631Ouuj+4RVI/y/ACpJkV6
 2c7+IKF3MkhPol9WYbN82a4mlRPy+L2uTzJZN4N+o7Tq+Anhx57bGj52ScdJdvulyuWPViGul9v
 x6m031DxxbB5DDakB4+hTGq/flCo6W7NfmpHKBYqu/itBewSpUcS15nD4T1Up5wh9hrdTJ7YI9I
 RNV0JRrTFnDAqLdrMrnx7DKfM4UxJgrokCyrrdbqi/CFj5YEIPJqhbHwpNDCZlJoFXBUB4QJbYJ
 NgvJGsqBGhYWrJ4NJ3EkNsCtnd7GxYJdz5w3tPJwFGJoGn/AA1+URGBcbCDmXWagw+95LqnnLZ3
 DeSMZ+Kws=
X-Google-Smtp-Source: AGHT+IERiuWPC8rIWNjqwUi+nnohtMbUPRk5a1892rQtsdvUk9pPnQcSwFnzrykA3IF6A5Ex+6hF5w==
X-Received: by 2002:a05:6402:1e93:b0:62f:48e3:223a with SMTP id
 4fb4d7f45d1cf-62f83c3f3ffmr2956279a12.3.1758122436532; 
 Wed, 17 Sep 2025 08:20:36 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:73a7:c001:49b1:76d4:3e52:5347?
 ([2a02:a03f:73a7:c001:49b1:76d4:3e52:5347])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-62f86ecf183sm1462709a12.12.2025.09.17.08.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Sep 2025 08:20:36 -0700 (PDT)
Message-ID: <59c225f0-289d-4f14-b9d6-053ea8eacf40@mind.be>
Date: Wed, 17 Sep 2025 17:20:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: securitylab@github.com
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1758122436; x=1758727236; darn=buildroot.org;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c85EQh/S1caWGFr3MJdnjvwuB8AI4GRS2L/K760GYTU=;
 b=evAcN7gLYPHMJvhUb6XeI5mw96NmZQht+a2c3kdrFD80UOD+0Zg/SJgD41I0+gkptn
 sy9gfn039lgYmmwZo6S+0Bq5tun8kHMsOlbPYUqGGa8EQ4echnZiAAbtK0Kr5EeUhCsN
 lVSReZ0JRG58+B7Pg62qjWv92304h1DNRIS5bmebaMiK4BsPNyobDwTtt1m63suMZNfl
 MboE2A4qU9F6omFo4KJCg1bklGnQvu0F538UelLbVrYOXin+cqRyvihaJjgUc9dDq5qJ
 +M4Lw9MEmwcRQ/92xdARn10F9BaaEcAL6SNt3i6rUHLk3ukP2xjdwvvQwyR3Vlsykk1t
 XANA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=evAcN7gL
Subject: [Buildroot] GHSL-2025-057 - Does not affect OpenCV 3
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear Github Security Lab,

As part of the Buildroot (https://buildroot.org/) LTS maintenance 
program, I am looking at the issue CVE-2025-53644 [1] / GHSL-2025-057 [2].

In Buildroot, we provide both OpenCV3 (currently v3.4.20) and OpenCV4 
(currently v4.11.0), and the above issue is reportedly affecting both 
versions of the package. Looking at the NVD entry, the vulnerability is 
marked as affecting OpenCV up to v4.12. However, looking at the patch 
that fixes the issue [3], it updates a file that does not exist in 
OpenCV3 (3rdparty/openjpeg/openjp2/jp2.c).

To the best of my understanding, it looks like this issue only affects 
OpenCV4, do you agree with that finding ? If so, could you please update 
the CVE entry, such that it would only affect OpenCV>=4;<4.12 ?

Best regards,
Titouan CHRISTOPHE

[1] https://nvd.nist.gov/vuln/detail/cve-2025-53644
[2] https://securitylab.github.com/advisories/GHSL-2025-057_OpenCV/
[3] 
https://github.com/opencv/opencv/commit/a39db41390de546d18962ee1278bd6dbb715f466

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
