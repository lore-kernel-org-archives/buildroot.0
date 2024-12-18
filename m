Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29694E77187
	for <buildroot@archiver.kernel.org>; Wed, 18 Dec 2024 12:09:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C806B616A9;
	Wed, 18 Dec 2024 12:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xikb96rkaB43; Wed, 18 Dec 2024 12:09:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0728616FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0728616FD;
	Wed, 18 Dec 2024 12:09:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A80F2CE
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 12:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88D1D424D5
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 12:09:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2XQ-SL1CTim for <buildroot@buildroot.org>;
 Wed, 18 Dec 2024 12:09:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com;
 envelope-from=andreynech@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 64D96424CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64D96424CD
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 64D96424CD
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 12:09:47 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-3eb3c143727so352238b6e.1
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 04:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734523786; x=1735128586;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t7BXQXdyz9FePIzt2ChwL7YQeRAlmg0DDLzJi9GeLMs=;
 b=gIACP5w4ctrEO5NrYGWpRrSX2vW3Dv9uprkip/kK9b+qizEH59W1W9z8lYec7TwDAf
 0ARA+AG3GTQLZdhjWcyKj0BdsPXzz7+lTtlqdXY7Aie9lfjQ9myEaqiKLR6XnvpaQLS+
 EIrTQqmEXTUbeQh12hIUvHdl5SrEXBCcwlqzeo5VFB1Sm7D4FQQ0ci79M4vWR/DMRX/Q
 u0E7NPQyoHMy+y1m1POfE6JwuwiZR5WVlweut3EPpxD79VqWx3Dre29OAUGzyHuaZ3Zi
 4w6KAbuCIsXww4+J3aBKwJJpiSz8RFSGS7DP/I0YgEbpr+JR1ahBeEeoJaI5SRCnHSRH
 5fjA==
X-Gm-Message-State: AOJu0YxR1MVD7+IjIgFIq3JbsH9Gy+YvvYuBB7A43RInmU4mkigZpIwv
 5uiBkCnauIKWjyCpFSsh0IuH/VOp41ZgkSjCWPIPR6Dd6Lv1eVxZQgEddcBIBNwgZ8ViHS2wZZV
 LF7tqceI9L5Ok+0lmm/UUuXgf6TQ=
X-Gm-Gg: ASbGncuoNHVTi70Jr8RyUrNJDfVYFeO4HanoFF2+ZBu8Dsy+2OMb1TBIcElHPIDXeTl
 8arZ7pYa3uBfoVTdlwZ/MXag1FvWhwFtrJFr04A==
X-Google-Smtp-Source: AGHT+IFrIRyTB7WmAwkhhqHTC6m+2Jpf/aK8dOjOwxBofq+4okEmLj5OHUpu90QWIRWJWhieOss2COa66Q4RXo5KVdg=
X-Received: by 2002:a05:6808:2021:b0:3ea:4b5c:60a8 with SMTP id
 5614622812f47-3eccd22fc2dmr1300789b6e.17.1734523786038; Wed, 18 Dec 2024
 04:09:46 -0800 (PST)
MIME-Version: 1.0
References: <CAOiXNkBXaWBGL7D2FAbs+HQ-CQvF6Gt3Xw3s3Zr8T8Br5AvoBA@mail.gmail.com>
 <be38d9eb-4d8d-4da4-bc94-e4093a79c206@mind.be>
In-Reply-To: <be38d9eb-4d8d-4da4-bc94-e4093a79c206@mind.be>
From: Andrey Nechypurenko <andreynech@gmail.com>
Date: Wed, 18 Dec 2024 13:09:35 +0100
Message-ID: <CAOiXNkDqh6Q=s4o8u0SapkcajBKE=Sdd-X312N61P6md2v2EVw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734523786; x=1735128586; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t7BXQXdyz9FePIzt2ChwL7YQeRAlmg0DDLzJi9GeLMs=;
 b=PyqBpp1tc7PshdrvBt6y0y0BuGaFp/t71o9ju7M265KffY5wSXqua9UJrzkYikKao+
 cMWmGM3xioYDfGxhC2lUTFjUdsF3/0m09T9Hhhd5nIZh+YDT7bkIUuflz0DGmpX76t8y
 nbhPQTe/Upifjm9SDaauQDY+yOBusH9NxSTCVuqpYVnVo+5SvVI+vOR5Wj3wqwCH3xfp
 VWXlnNILUn7QAS8+/pbKIF0RiipQxmTwfNVBRXzZs+NOny5h1feyR7WzMt+yepjMCvdw
 xP75GqG/VkoRcenbLta3YMjmF0W8f7je/Nx0fKSWh/vfK+kERQStLkdzkiRHogJRaINL
 gU8g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=PyqBpp1t
Subject: Re: [Buildroot] Problem compiling grpc package with BR 2024.11
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
Cc: Robert Rose <robertroyrose@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 16 Dec 2024 at 21:24, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 11/12/2024 14:24, Andrey Nechypurenko wrote:
> > Hi Buildrooters,
> >
> > I am trying to move our project from the older Buildroot version to
> > 2024.11 and facing a problem compiling the grpc package. As far as I
> > can tell, it is caused by incompatibility with the version of Abseil
> > library (missing absl::StrXXX functions, etc.).
> >
> > It looks like 2024.08 does not have this problem. So my question is if
> > someone else is facing this issue and if there is a solution for it?
>
>   You're not the only one, it also happens in the autobuilders[1].
>
>   It might be fixed with a version bump. Can you try to apply the existing
> version bump patch[2] and see if that helps?
>
>   Regards,
>   Arnout
>
> [1] http://autobuild.buildroot.net/?reason=grpc%25
> [2]
> https://patchwork.ozlabs.org/project/buildroot/patch/20241107191634.378670-3-james.hilliard1@gmail.com/

Unfortunately, it still doesn't work. Building host-grpc failed:

CMake Error at cmake/protobuf.cmake:58 (find_package):
  Could not find a package configuration file provided by "Protobuf" with any
  of the following names:

    ProtobufConfig.cmake
    protobuf-config.cmake

  Add the installation prefix of "Protobuf" to CMAKE_PREFIX_PATH or set
  "Protobuf_DIR" to a directory containing one of the above files.  If
  "Protobuf" provides a separate development package or SDK, be sure it has
  been installed.
Call Stack (most recent call first):
  CMakeLists.txt:387 (include)


-- Configuring incomplete, errors occurred!

Regards,
Andrey.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
