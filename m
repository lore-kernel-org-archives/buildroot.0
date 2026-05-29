Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13587CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF7AA614E8;
	Fri, 29 May 2026 08:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ROE9No6VDXOR; Fri, 29 May 2026 08:29:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F2A161341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043349;
	bh=+mIzf4OVzCaqk4icciBNKeYRk5NlMTrYE8Ptudb3rgU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SMZDDXqzP7P1rIvZNWvizSCHfazfcIYY/tOttO4EIWhUJTmV5u6zpxVaKQn1Gj6TG
	 /qEtdo5dB2mgl6FgvfsrwVckfsFvVC6G5n+SEBCeUjfmo7v4S3yL/yK0Ic2xtVroZf
	 VCKRZ49Y1GDGnc+aXNSAjuMolvg7XNqOkg6Im+fYrwzo5yNRbYVhyew54cKxhTeJGU
	 791FKkD7jQV6KMyBaqJpmzzWloRiq6lTek0OhmJKryrfLk69SAPRPQQSZJ0gs5+0o0
	 6pU7LqK1oSvsf/o0lFBdT25r/ZI5c2MNLYL64XkncZ1WXZcYLnhqr8tGXlB2N6cXJD
	 CnuVGaz0QpMvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F2A161341;
	Fri, 29 May 2026 08:29:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A83EF28E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 968E484203
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s_MDJl-MF6HM for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:29:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB3F684200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB3F684200
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB3F684200
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:29:07 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4893940bb5eso73528395e9.3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043345; x=1780648145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/HLNhabFyd7mlbFosxxt3MuAyjZ7TxnThOfbA2tnur0=;
 b=NtFiHTV4JoiIerTcpOQytPWsgjtp3rtPUgH9QxGVd0/FLz+YS8UbgSGg1UO11fe591
 o/HbfNbL50iGYVK5JkhLNI9lnP1THVOxJHSJ+eT2kUtIEinV9TILUpiWwUdm/pZjdLXP
 yZCgwn4BvsRBHlMxOnHeuWhg8FHeKKb3I35AvFOmnkhLYPiOwR0n+AOkHzMTgDkbOoaj
 lVOhAXeTR/3t6fQuW6X3V8s6LpBqdszAQc3V6g3W6HHoX8/hvuNa1BnY4REQTJs7JDLm
 /I074cJynWtuNkGeFjrnZk3DjYH2epgFPb3/CL0LbVuhL7R5vN06OroWutlnb4skxQ92
 KVAQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ95Hw163vCXUKQnbZubg2Dj9kO9K5gAVjBpGhC0uZiQJQPwpkb9f393NcJ/rvtJe2ugC0ezcPL8UTg=@buildroot.org
X-Gm-Message-State: AOJu0YwVET0uRPK7cY+8p7V7XYxV9GdidJDBB+4kWnNHuAljAWOlEYuC
 BpdoLvBbserw7VO5ceA/94pp5GjrBi+98qpUMeoSjwN20x448oWCZLh5B0BZQeugjuw=
X-Gm-Gg: Acq92OEB3bo0sbMFlZEohUC9Z8FRU0GyFXnYKErbKPiXo2O85Uu4zjGrdSSxiUbnl+z
 vw2RMk7rd4qRvvUX+9j0OUZvvfU2xaWK3J44YTyWiRyeYRjR0HWomfLXgZE1IsxKnW5uIUhZH6O
 rwStiGPVKMXzKCUnKhAyytA8v+FkX6aNI6GcE5QOgaO++X5YLaNfyoybRgBjqJLy8MYa1/hwXH/
 eP13r9aelJ2N8KFQDy53J9Klxl4mfvoAZHZohh7qf/RHmuFi6Acn274E/i8ksTVvZ2O90OvxAHA
 5mwM5rIh6qj0XVIR73D2BBITVNb+CHM1Z1ebTZYfEMCuimga3zzn1JOol7SitiYinu86COytIbc
 QCq89G5GIpvBPJKFAZPZNKFoE0MQUYQQdydfPUAdFIkzVKvl6z6y0rb6EMl4AH3IdTweritNktx
 O7ehTIzUsjhmWfJlcDkoxPGYYcD3/ZUrbdK3zSTVHuf2zsbhc161X0PkIumg==
X-Received: by 2002:a05:600c:1507:b0:490:48b7:c1ff with SMTP id
 5b1f17b1804b1-4909c0ac8ccmr21302655e9.17.1780043345477; 
 Fri, 29 May 2026 01:29:05 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909c09abadsm9625455e9.1.2026.05.29.01.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:05 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:29:04 +0200
Message-ID: <20260529082904.56344-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20251003201335.2430390-1-bernd@kuhls.net>
References: <20251003201335.2430390-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043345; x=1780648145; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/HLNhabFyd7mlbFosxxt3MuAyjZ7TxnThOfbA2tnur0=;
 b=QRk3ArE9QLtgs10KIUR3EMiInzMmc5+sxm/dYN1UMAX7dAM6dnwckjiyHG0Q8DlUV4
 zn87ta5TlsjGwzAm9wYq+Ifi1Eumoxr85rHXY+vNT04Dn68t0wFMKQzHHLOcXD0nweTc
 Gk6geve7WuOTUw1w/bdFECpgWcSgGpwtSr5/Y9xGmRBHqvoXQnZiplLPEr5J8S2f2DxG
 pHPVZFj45FTU+EnCEqFGY54HCPybk1nIWvU8ccqzO9YkQ473PoxdDm6GH1ZCS9BDWg7y
 EHLlcnqRS4A0xeYddg5jRB9+GOTUIoKGKZWg45nnjBfvcjVrlLsvdRajI/ta6f7O1bRc
 mv2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=QRk3ArE9
Subject: Re: [Buildroot] [PATCH 1/1] package/libheif: bump version to 1.20.2
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Release notes: https://github.com/strukturag/libheif/releases/tag/v1.20.2
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/libheif/libheif.hash | 2 +-
>  package/libheif/libheif.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
> index 6c129873cb..da2516a583 100644
> --- a/package/libheif/libheif.hash
> +++ b/package/libheif/libheif.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  55cc76b77c533151fc78ba58ef5ad18562e84da403ed749c3ae017abaf1e2090  libheif-1.20.1.tar.gz
> +sha256  68ac9084243004e0ef3633f184eeae85d615fe7e4444373a0a21cebccae9d12a  libheif-1.20.2.tar.gz
>  sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
> diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
> index f6e14888eb..13e8295b0e 100644
> --- a/package/libheif/libheif.mk
> +++ b/package/libheif/libheif.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBHEIF_VERSION = 1.20.1
> +LIBHEIF_VERSION = 1.20.2
>  LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
>  LIBHEIF_LICENSE = LGPL-3.0+
>  LIBHEIF_LICENSE_FILES = COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
