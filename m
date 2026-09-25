Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31392C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3AF98135C;
	Fri, 25 Sep 2026 14:45:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DeGNPf9jncoe; Fri, 25 Sep 2026 14:45:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 146B581336
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347522;
	b=fls8BJzp8qpM4bwFa726g9k/ZLL/3Q9dYutZlifxwVn8aqJtnALmY24RwaNTspLX2GTN
	 d/g6wAt8EJsV3RWF9YbbQPFijQhHy91X5wKSD2kopG0MF1a+ofFQ9ZgnSY+xw3WKWGB5z
	 Fn+MJ+NVXDFpzyhaxHQJmGySycumBjQyLvAQDw05hyuBotyPKdGKDswt51xHdYYiHBAvc
	 uoyu20BjDD5nRQbxb+vaRup/o7fe5j8KqP1lUaj3MV4IncCmPDVUI1TYnG3MmLDGNiPIw
	 /DYs8brHmo3knh2qDnO/6ssWdnhhWpgxANOGEEawrPYyJYgbWN89chGCCBAbzH9oyNg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347522;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OcVl/ymnFs7P0xs9kxPrT8GF5sJZWI+ij6dEb4qmW7o=;
	b=j1S3LjKacTY4xVMevKnm9eUtVQT2r2Ege7ycuuBm3UWQ6fh+knaFp6RouiTxneChCojH
	 WGBl5oS4IbdHNDxe962CVDkANE2NbPGgl8Z/Ca+dLN08xfwcgux5ofvpkIdQD3hMZk3Ck
	 rqBSNKZSQIuM84NZUSemIBae9EftBAy2TdhR27VUXxyaRwKIv1m29JSZ+LO87XqkdIGXm
	 EQT2af2eR7zk1Xo0gpr4/QGYeIs5IvA0TZ4XBT7zbPrwI7fIVntUz845apdUYtJLKSdfG
	 Zm6D+nNQnMV9xW6dwpS9B/g1opXaKpJnM4rWA6e2ty1s1s5zCxN9ExZGJ5r4Bfm5UVQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347522;
	bh=OcVl/ymnFs7P0xs9kxPrT8GF5sJZWI+ij6dEb4qmW7o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MCjYPrqu2ztcrbQpT2CggWL/KtQ30sK9X02IOaAguk1U4CaWtSL3D+RhlLUq6eDvL
	 6lSuC6aeKtXWkD9bBfc/iII3YshNBwYjDFyvwOvCv0DODuf934skdeqSuLIKCBL8vg
	 5q+42ddAX6rR1K1hPl/vjJNTj6sCYye6Vt+9vqWPfsceXx260WBvT/6S9qbCEpEpI8
	 HMEyv3Rzh9xCjA60iOrvB7J2VubDbXBMd3l27KAMEEMh5rH1x2PRRzWvjCvtDEavzf
	 uFfwue993xrMziTW7ExBFqyrX15pa973dmYkrygvnRD54F6nY3slJMrapEV7FGMzEv
	 bE/g8Cg/7Xr4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 146B581336;
	Fri, 25 Sep 2026 14:45:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B3C7C334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94B5660DBB
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PtLRyJELsSag for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 87BBE60DC6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347516;
 b=QqUsSoCkyeJcT6Gqpxd0k96is3sEl2ZactIkaLJ2uLLvZBI25ooe5pUq0X7VkA15Si8R
 RydnmhDKQr8yWOCWHYXL6JhCuYUWN6kuvw+EM9jyNXndCLsr99c2GmZt9ZLFlSa0YjWrH
 cCMtX7lwC8rYJXtHBfRfXzowHRvUldrdsvAXx9IUWLCPHMJ9SkaCn8Gdz3fziNzZp3HRB
 kn6WlL4e91cYaclG+WHeKRVHMEWWHdZPaipT6NjckUeUSmIBYH+R/EIcmYFabF5PBodPK
 aI/1NHqgBRQBZKen0Vv/6bToaSv5Jh72JES1vSeN184ltdcJDe+rH8Eec0+F8HBGA0w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347516;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=FZn5KXnBPiRV3h/Sk39dOAebnqG7rz9kzIUkiEoNbOc=;
 b=G0VYkDZW4YUME2V/aA2o4qKAuZCYPbzodKPkOssNDOYsYY/5qPWSom5NxaSQsDgQmXFT
 +TQvDTQF+Kav6GZ6XMTeGL3UYk9OTi+gjna3dm1rzikVXFARFxr8DB5FGUOkgwWL7PsLn
 j9Sgxbn4q+cSVz3q27qm1WPXR6h6xS6BnLS5ar2+yJgTGaAEtkhS+Z3T2ft5XtGzRodrQ
 01Wk/oe2DIUJGcxhhCFpbajee0b6FSkh1tixg+oypAk9t+WJjqZP1EObfbyptyKS645rt
 VOvjbCqZUnalxvf+v89SfwZ4DwI9SJFrA+jYKH5Xhf1iGWXQqwti2Yl3cUkYBlQGNBQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CJ5ImAvX; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87BBE60DC6
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:16 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e6c0fce17so5402575e9.1
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347514; x=1790952314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=FZn5KXnBPiRV3h/Sk39dOAebnqG7rz9kzIUkiEoNbOc=;
 b=IcDjbIYgv7XNAY5LKuhNU3DFVl5fsRH/slSiG9RXuYf6lb9plhEMUCaK4kfla9DuVn
 BPQSsriQTWtWgkmW9Cn0JKFpvTsm+iN4xUKJK/BFYWDh3EvqJyw/hx4EoXD8Sz/vub4f
 eoWtZFMrXdGjk3hqpp10GxHjGdTbE/9H1Z75hJ0Bmt5iD5og8flOGHJzbPYi1cyC3x3f
 AqG71zrw/ODG4zIarvmD6YxnqAfLCFghOueijhSc+E6q+O5mtpYsAeCiQOqyTfFwNTgt
 BY+JECQAVcyOwv5RdXFxTbKWKC1uZLQ03zAXQfeaEtMA4wU1Qq7rAlZaffFeUk2INFG2
 Ae+w==
X-Gm-Message-State: AFuF++m4oE6QK5EXwIB9b5+mIA/0EwSSTpn3wbFb4FGYq9hHpL51YMzU
 KAoA9tq1ZHreGZdnZbAXzDQylMorxRl4ABoFP+v6EBFigCoNzjiVXPImsXYBd8AeFK8vIYC4M5d
 UGaRN/TKefQ==
X-Gm-Gg: AYBFou24bbbgFRHHZvuER9icg8otbZRXT48o61DWf0Os67Q17AiKT97NAxPtZaFMo6X
 z36uGdGiQdNXJha5llB8Oq1B7b05lM3JTRtPl8vxGdPXgNSb6t+Svh42WKki8dZSMzosNhqw/WK
 dw/5A+72sV028LeSlcpBxpHru4X7m/Rw2JCOg0JC2dpHu6+uXgRCmo5zl4ji+N/4zi6HVEOzpGn
 TVASK/Ap3t1r86wqvh44FpiJ3HQaXWSPc7Lzh22Qje6/7OKTG3MWi92kIH/yg37lSPgtGXkUpuk
 h5Y+IglATT6lyeTr5hHGtVcq6wEFAd2Sui0PhdcR/7kzrXfQCb9gUXd8M2cJXvrTRuzDe3owuvB
 OgO/EbaH8B7j82Ooyx8Sdy99SS+LHOYzmA7KAREenD53QbuhhcC41lm1wegA1NULLo7mR4L7j/s
 vrIVYq/hbAwXs8xhzCX2/lj6EXo0p03mUZAxbWIFIUCI5/bhTrqEWXB6Ada4QWd3FxUxmArtUKi
 Jh6niw5eSZDWErmVw2FAlY8n+C66bdAdhCxGRO+rg==
X-Received: by 2002:a05:600c:698e:b0:49c:fc6e:a3dc with SMTP id
 5b1f17b1804b1-49fe66f1491mr111528585e9.27.1790347514377; 
 Fri, 25 Sep 2026 07:45:14 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fee9203f0sm50901125e9.1.2026.09.25.07.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:14 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:11 +0200
Message-ID: <20260925144513.4097427-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915110904.1918014-1-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/netdata: propagate gcc version
 dependency of protobuf
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Since the bump of libabseil-cpp in commit
> 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c, it requires gcc 10. As part
> of this commit, the protobuf package was updated, but not its reverse
> dependency netdata. This commit fixes this issue.
> 
> Fixes: 76241e89e1fa7a7b46e23d0a22c3d4fc11a2475c ("package/libabseil-cpp: bump to version 20260817.0")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/netdata/Config.in | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/netdata/Config.in b/package/netdata/Config.in
> index 527d4d39af..2c7d456528 100644
> --- a/package/netdata/Config.in
> +++ b/package/netdata/Config.in
> @@ -23,14 +23,14 @@ if BR2_PACKAGE_NETDATA
>  config BR2_PACKAGE_NETDATA_PROMETHEUS
>  	bool "prometheus remote write backend"
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # protobuf
>  	select BR2_PACKAGE_PROTOBUF
>  	select BR2_PACKAGE_SNAPPY
>  	help
>  	  Enable prometheus remote write backend
>  
> -comment "prometheus remote write backend needs a toolchain w/ gcc >= 8"
> -	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
> +comment "prometheus remote write backend needs a toolchain w/ gcc >= 10"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
>  
>  endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
