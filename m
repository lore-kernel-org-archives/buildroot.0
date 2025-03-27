Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB08C36011
	for <buildroot@archiver.kernel.org>; Thu, 27 Mar 2025 15:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A268E6FCB7;
	Thu, 27 Mar 2025 15:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7tIjhvLTL8vB; Thu, 27 Mar 2025 15:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1F6C611DE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1F6C611DE;
	Thu, 27 Mar 2025 15:10:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0282A1B7
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 15:10:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2B8582640
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 15:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zH2nDrIP4RaH for <buildroot@buildroot.org>;
 Thu, 27 Mar 2025 15:10:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3181782C4D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3181782C4D
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3181782C4D
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 15:10:37 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3912ebb8e88so136648f8f.0
 for <buildroot@buildroot.org>; Thu, 27 Mar 2025 08:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743088235; x=1743693035;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zmiZhfpLjq/ljKSjuoAuc9O4oSh1GtXmDQwBxG31DzI=;
 b=RPomD599b94Gjs5E8KKu4wjgF11y7UQz0MzjmCZuInSNuZNSNtsUTKL7gNZ1M4Za5U
 Ips0COlpRXp9Yn1PDueljVRfNqkw/RCYA/bKpA58aGeX2CiNngi3De8sHedIDd15F391
 JvAyYv9cnXjVvAqKi9N9EagSfiQUKyUfNNJOsD6K18UkYlcsyZmeLa61uSgmhu+eni4A
 dwgPtYV2CxPIFRhvQVWsXNfDsnPhCcDZ2KMuyuuJD3pbjG3YaF4Lu7uI3mpzuM4VvO/z
 m65jJeMJfRV5+j2x3u9O3Q46ydMYdaVlKyTVaoPGdKal5xpySFpQbb5Lx1LlFkIj4n5N
 2fhA==
X-Gm-Message-State: AOJu0Yzw/SDUoz2uB1/aTb3pz9Rr2+BQw9o1Gq5g+3zaFyDqSYUg5EgF
 XILH5pd/Oe7fHyX2mWbGaRVBw6aGjxLqtyEJnpF3LGNczvy8kHSLpdNCjwZE
X-Gm-Gg: ASbGncsYeDlGt8Bn/YOyzuoToEpvqpmmaYPHecvlJFpv+7a5hEmYloZDtoQrR+lL4nF
 eEEiVrSMGBYEbn/kh/xYO3a4MNebc0zE6MNaiOyN4wa21CPleGA8Lxb5EDeC7fdiL+csplMTqg5
 rJpHFCQRXSAnPESrJ9Q+RI/p9toKNjflCUmfLBzSz9nrzXCw+4LO9TRQUQDDEPmXKFNQQYG306r
 FTo3gW5PBbetvD/hQPTRMPy8qKPZVWV7dL4DtyAQyEhUbv7Sl/WXp5iYlFupmKGmL+13VKlVLui
 hZ4VRido9W3pZ8MDfcOlsTE9LHcS9lyWriotM/g4TrU=
X-Google-Smtp-Source: AGHT+IF3SJX94HXMegOKL3Jqurmjj9HBx5lzTAx1oXo5ihdAkCYqpW1u5i92V3RKtxjjiRA48rxaOA==
X-Received: by 2002:a05:6000:4284:b0:391:1319:9007 with SMTP id
 ffacd0b85a97d-39ad1749608mr1240798f8f.5.1743088234693; 
 Thu, 27 Mar 2025 08:10:34 -0700 (PDT)
Received: from skbuf ([188.25.110.61]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9a3c90sm20745520f8f.36.2025.03.27.08.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Mar 2025 08:10:33 -0700 (PDT)
Date: Thu, 27 Mar 2025 17:10:31 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>,
 Brandon Maier <Brandon.Maier@collins.com>,
 Vincent Jardin <vjardin@free.fr>, Romain Naour <romain.naour@smile.fr>,
 Akhilesh Nema <nemaakhilesh@gmail.com>
Message-ID: <20250327151031.no22snhbraftej35@skbuf>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-5-olteanv@gmail.com>
 <97b018cf657cc67f86699a2e2a5d8380@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97b018cf657cc67f86699a2e2a5d8380@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743088235; x=1743693035; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=zmiZhfpLjq/ljKSjuoAuc9O4oSh1GtXmDQwBxG31DzI=;
 b=ELwhahlfMCOupli9N/nB78Fh+vTnUmK83cD28PvBepK7ymXB4S1sTfLmX7Fch6npnr
 LuVjaLfj1IoZLceWV41SpEfwlc7qcYHMrSm3dMmpDwBIxWyNt9pWiUhIoqN3vSF6FS5K
 NfS9UNORP7mYOhPduYtOU+PsQMsTucVUkV0nHxWyr0TwL6WJh7F8+0G/fEd4YMVlV+s8
 sExTDPLR3DJ8q3k2FUHW6BpMOq99GQ1Vn3TiOzc4KID0fDh+jcBlbjGhBj+HVZet2M9b
 9eIPPJUMdZbmL3BrrI8rE/CYgUi+OPmue/jOzEn/GeZqfVGH6H0AZaEijMpCLLBAJ3MG
 8yKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ELwhahlf
Subject: Re: [Buildroot] [PATCH 04/15] package/qoriq-ddr-phy-binary: new
 package
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

Hi Julien,

On Sun, Mar 16, 2025 at 06:47:36PM +0100, Julien Olivain wrote:
> With this patch, running the command:
> 
>     make qoriq-ddr-phy-binary-legal-info
> 
> Fails with output:
> 
>     >>> qoriq-ddr-phy-binary lf-6.6.36-2.1.0 Collecting legal info
>     ERROR: while checking hashes from
> package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
>     ERROR: NXP-Binary-EULA.txt has wrong sha256 hash:
>     ERROR: expected:
> 7a223031d76339df0e4e5a94d193a270fb9963d42b577aa42fe130a4657f3e17
>     ERROR: got     :
> e7e5f4949f7ac9f9a5d4d68b8f835f3ddc93ad47b594a11de699d90b9175413f
>     ERROR: Incomplete download, or man-in-the-middle (MITM) attack
> 
> Can you check and fix the legal info hashes, please?
> 
> Best regards,
> 
> Julien.

I've fixed this, thank you for pointing it out.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
