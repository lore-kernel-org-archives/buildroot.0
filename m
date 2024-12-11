Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF40E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 13:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77C0B60A64;
	Wed, 11 Dec 2024 13:24:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p07K8MgvYlS1; Wed, 11 Dec 2024 13:24:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A372D60AFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A372D60AFA;
	Wed, 11 Dec 2024 13:24:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DEBF3962
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:24:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9F5F80C4B
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:24:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SCEwZw0CozLx for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 13:24:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c2f; helo=mail-oo1-xc2f.google.com;
 envelope-from=andreynech@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51BE880B2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51BE880B2A
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51BE880B2A
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 13:24:36 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5f29db2614eso345039eaf.0
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 05:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733923475; x=1734528275;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SeZ0yQOrbvtk6snrdEej4pWo0wosYvxlgNCV7Ekpx50=;
 b=YA24ZsD2NDSL/IBC79M1V6NAXevXytaHef4tVrD9ypgH4cBnIw2lWRHvOzlYiIKN+J
 RIn/Xs8mOi7YQnbg6hMMRnjynpAG7RCTvXTYO0Q3n0xZfiOUw+GSKakbXc1LHhAh7p6J
 vjEWsk3Giz8siSS1MNo4UX/HwGV+htBMIYRzSZsmHwfc79EEQmBuMthJSjLSpq4swIxR
 3RmZNd4rrpyID0fZrXp5WlN9HJhFzEjaf3zi7ZA+Qq44snT28V3ofApYrxkeSn7694AH
 6o/lw9XrN1TUyVOaxBZTo0lD1VqN0Res0Q0H7u+buCqx/SEzCdm4O9nmT+Tuhlh7uDkb
 ZYog==
X-Gm-Message-State: AOJu0YwnPvb357RPefk/0KAt/8AFUKCvD/nd5xeudThVuiCMNzYJQ/KK
 xhJtTqZc0cqBDbNYNO8dPuZD1ztPI7N/j9G5R46f2gq6xE17LeX0bKfjENkI/cgy7akL4ItIRNv
 TBUxoTq9yekH5oXGG/M1bB2Tiu4gW8A==
X-Gm-Gg: ASbGncuRS97oTuS4BEPJSZGoW3/ldKrWvHVmhS8iwA81HlexEu9tITcUwpALra9BgKG
 D6qbPV5oh5X+4i4t51vnNzhAZ1C55jLSZtV8=
X-Google-Smtp-Source: AGHT+IGH1Zq7Z3m+WZ6OHXBjVkQ45NvipWLhXg3tVPMEAh7mDoU8xPd/IdOtJ0/Zzrp2OR7i0qj4JgYMVpEAcotx4os=
X-Received: by 2002:a05:6820:164:b0:5f2:dcb6:74f8 with SMTP id
 006d021491bc7-5f2dcb676d9mr1165579eaf.0.1733923475025; Wed, 11 Dec 2024
 05:24:35 -0800 (PST)
MIME-Version: 1.0
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Wed, 11 Dec 2024 14:24:24 +0100
Message-ID: <CAOiXNkBXaWBGL7D2FAbs+HQ-CQvF6Gt3Xw3s3Zr8T8Br5AvoBA@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733923475; x=1734528275; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SeZ0yQOrbvtk6snrdEej4pWo0wosYvxlgNCV7Ekpx50=;
 b=aNP4E+5koJz6SIDymE3xRPjm7HUseb0gXpDWc00/RU/Z7T7QnmAaORHZOjg8A8H1PV
 wWJmFqUuDIF2cZ3NZEZ3fXTtWANJGyq6vKPjjGGa2fSQnz+xuZczB2jX7B7pmqAM64W/
 bVmddlA6GqVj/bbtOGD4vLWk/AFSlsXrif8IDhaUkQCYkz5A+qKBNatLduZ58EM9OAoH
 c6muGvlark0JGtWb7F3rEo4JTypQX254Vm0pE/zacsTUhzO1eo53/UJpSsEmcDO68531
 1YCzmgM0vKZzdOw/mAonMySc81qGSq+vV8C6pvh25IuYr+fpsRexn71IQyuHVe9Ow4LU
 s8Yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=aNP4E+5k
Subject: [Buildroot] Problem compiling grpc package with BR 2024.11
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

Hi Buildrooters,

I am trying to move our project from the older Buildroot version to
2024.11 and facing a problem compiling the grpc package. As far as I
can tell, it is caused by incompatibility with the version of Abseil
library (missing absl::StrXXX functions, etc.).

It looks like 2024.08 does not have this problem. So my question is if
someone else is facing this issue and if there is a solution for it?

Thank you,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
