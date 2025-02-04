Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CCEC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F6EE60F95;
	Tue,  4 Feb 2025 14:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 72aGQB6kaiH1; Tue,  4 Feb 2025 14:00:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E66B660E98
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E66B660E98;
	Tue,  4 Feb 2025 14:00:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C6E212F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 008B641411
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAIrfLoAKeVY for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:00:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 60D1B41348
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60D1B41348
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60D1B41348
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:00:16 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-38db10ab86cso196697f8f.3
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 06:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738677614; x=1739282414;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Brt+Ksz8QVTetvtxaSaZ0RnXeJv9yX1Qg6s6HFd6v90=;
 b=RumXc6DLCEtYklcw1Uo/Ly7zXSG0VbIyl4xeg6vBzfGHpYSSoi4rlwMBwrNnI1Gdh5
 3WbqSMIxXPfEQMtxJRMqYDhyDM3cQa35oye7dFWIgF7MEPC0bUJ0okX+Z8oymOhwVVny
 zvnDjihaCLI+O8ilMZHYDI3ltplLm+ednddphDcgXPf3ea63M/o6t/pZy5Uk8QvCtDIg
 WjbChRCzBZOeKi4hnm7wuIerqN3M1ygUFAehTbrVIR5QEXHrJNZh3pXbzQGFEc+rGUHi
 cSLGSMRx5LfvRWg6W/PtE86A05b7RMxRrd8uJk3VKufJvip4+KS0a4aQvGsDDBmg+wOf
 AriA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4T1l2zcegFsw1BWWI0CinPWT1goeWlJJvAedxmpT/Xr8fApf1nHAafJ7nLp3kbwfAfLBm52ZlDRs=@buildroot.org
X-Gm-Message-State: AOJu0YyUXnKYJasAQDpzE6oD33k8PhaLH742FyxREBoJrAO6Meh3Hrjk
 ZdPA/eFcfDThd+Qzc0DkL8BOno/KjHBo9etSWliK1ILXMbtT2YHFJki+zb9u+vA=
X-Gm-Gg: ASbGncs4+SeFyd1jPeP4MYcCCAUF5Wr1hZxdYDAUw6TCnwHf9wdPwCqlTD2sdfV1Du7
 HFb/yOeC/l+2dGN3gPkYe1BO0xuLubimzw3Gaj6SlN2aN4nUeXn7Uh80xY+35aL2lzDePmk3t33
 Ak5dET4TIjXfMb5BcTqLRRuhDEgRRAm5/7Aos7flITAFsHPoDhkPPYMgEQs5p/mAqUB946UOmSA
 DygIVU8NNYR3ruOfKCCtAd/Pgc8WSGHZT8hSpCXW9JK6zH2sobEdfu8nRgMUT/+zEcZiXWcOfzo
 7KmLah4UTejuYCBZegWYX1AvG3Chw6sx4SKeyzymmEmDs1U=
X-Google-Smtp-Source: AGHT+IHUDLWzN6skxcxIWtoCyNuoSXu4PutNrRopp5PLMpdCDmGBn/KaR09r+AybaM0UGgkGYmQAmA==
X-Received: by 2002:a5d:64eb:0:b0:38c:5dcb:313a with SMTP id
 ffacd0b85a97d-38c5dcb3574mr13958248f8f.5.1738677614480; 
 Tue, 04 Feb 2025 06:00:14 -0800 (PST)
Received: from [172.16.2.111] (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1d1d03sm16115099f8f.99.2025.02.04.06.00.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 06:00:14 -0800 (PST)
Message-ID: <2f9c7829-5d9d-453b-91cc-644b6470c668@mind.be>
Date: Tue, 4 Feb 2025 15:00:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
References: <20241014102123.3727883-1-adam.duskett@amarulasolutions.com>
 <20241014102123.3727883-7-adam.duskett@amarulasolutions.com>
Content-Language: en-GB
In-Reply-To: <20241014102123.3727883-7-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1738677614; x=1739282414; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Brt+Ksz8QVTetvtxaSaZ0RnXeJv9yX1Qg6s6HFd6v90=;
 b=dmsmDCL8XEBCdtoh6Ts5ft2cAQElYjka0djEsbNgTGK1oCnNo4IjqSWNAoL/SWrwXU
 jwP3mN62MEPDMCPWKC+O70DRd6ERrYBP+U1NdgsJxpm9GRvKP0GLr+qMzMqyh87SUqXH
 wWWQlAbQvwbbV2mmtW1059+aHu1EJzRNanBS70RpSJZwwwIRvlBvm2K/UJbhTWym4D9i
 KF02YOMof4fxnHjMgb9leXQhKE1fQgz16idgV/o/UcKOX2hCSDpp3ewmQp9CCQIQYjHj
 AJRGJjb0r3CGXijhULEcJjjtA5xDV7eothZ9dnoO8QuP1gCnWK/0FF5VZC4HKwxhx28i
 b1Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dmsmDCL8
Subject: Re: [Buildroot] [PATCH 6/6] package/mender: bump version to 3.5.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/10/2024 12:21, Adam Duskett wrote:
> Updating directly to 4.x is too difficult and complex, as mender 4.x is
> a complete rewrite in C++, with several new dependencies and changes.
> 
> As such, update to the last version that was written in Go, which is
> 3.5.3. The following changes are necessary:
> 
> The artifact_info file is no longer supported. Instead, mender now expects a
> bootstrap.mender artifact created by mender-artifact /var/lib/mender.
> See the following for more information:
> https://northerntech.atlassian.net/browse/MEN-2585
> https://northerntech.atlassian.net/browse/MEN-2583
> https://docs.mender.io/release-information/release-notes-changelog/mender-client#mender-3-5-0-1
> 
>    - Remove all instances of creating or copying an artifact_info file
>      from board examples and package/mender.
> 
>    - Add a generate_mender_bootstrap_artifact method to
>      board/mender/x86_64/post-image-efi.sh which creates a proper
>      bootstrap.mender file and places it in the data partition.
> 
>    - Add a post-build.sh script to support/testing/tests/package/test_mender
>      with the same generate_mender_bootstrap_artifact method with one change:
>      As the rootfs.ext4 file is not yet created; we omit the optional
>      --provides "rootfs-image.checksum:${img_checksum}" argument when
>      generating the bootstrap.mender file.
> 
> Mender expects the device_type file to exist in /var/lib/mender/device_type.
>    This is further supported by the following line in tests/Dockerfile.daemon:
>    `echo device_type=docker-client > /var/lib/mender/device_type`
> 
> Add a migration section in docs/manual/migrating.adoc
> 
> Update the package/mender/readme.txt to include a quick mention of the
> bootstrap.mender artifact change.
> 
> License changes:
> 
> New:
> vendor/github.com/klauspost/compress/internal/snapref/LICENSE
> vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt
> 
> Removed:
> vendor/github.com/klauspost/compress/internal/snapref/LICENSE
> vendor/github.com/klauspost/compress/zstd/internal/xxhash/LICENSE.txt
> 
> Modified:
> LICENSE: Update year from 2022 to 2024
> LIC_FILES_CHKSUM.sha256: Sum of all Licenses changed
> vendor/github.com/mendersoftware/mender-artifact/LICENSE
>    - Update year from 2022 to 2023
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

  Applied to master, with the following changes:

       - fix LIC_FILES_CHKSUM.sha256 hash
       - Better URL for bootstrap artifact doc:
https://github.com/mendersoftware/mender/blob/3.5.3/Documentation/automatic-bootstrap-artifact.md
       - Migrate to 2025.02 instead of 2024.11
       - Improve migrating text (editorial changes)

  Regards,
  Arnout

[snip]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
