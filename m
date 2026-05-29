Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDAE3CD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DB686158C;
	Fri, 29 May 2026 08:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOmbh-rnH6WU; Fri, 29 May 2026 08:30:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3893C61573
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043411;
	bh=5Hct2hOkGdI9ahPMoFWS/uiJ4OTtfwbHpkV3f+aTvbM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sQmmA/qHMw3vKXopzNNV47IR9JK8jTNz09lLsQsm+zh70v3Zw5DA+3pTphSfeFvi9
	 18O9PcRHLyzk1blZoTWz0L//9StVxKmo8Zg7BQhDfrQO9oiILXPGRlg9SdYCyGMv3n
	 fEsTxoxrikTZ2n5LYogPsF+GkJTDxRniOUJPG0yV30MMWFr00UDK/D2xW8OQZCUJRK
	 tKVmUwQYIcpjeeanyheloEEAkkl2gf1BR347HeqSrQtEMd62q89hm+CFdMq2OYZVNd
	 9y5DblcA8Zi8JBDl09pj21U0I6QWV9flljmlcDl8EjMnUE9/H/1zijojSNYmJs4CTw
	 WuR4R4aP3d3KQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3893C61573;
	Fri, 29 May 2026 08:30:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 12CD0288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0218C406F3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XH_Dw_WbjtTz for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:30:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 04EE940B87
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04EE940B87
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04EE940B87
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:30:05 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45eecb8bf67so991822f8f.2
 for <buildroot@buildroot.org>; Fri, 29 May 2026 01:30:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043404; x=1780648204;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YtRFJ4E9C1YxPw7ex5ENPGLmMeXysvvEM8DAV4wkQW0=;
 b=bp4qKfoecaD8mesjQSMIVtQVHqb9glAbfhfoFI6U+pr0W8MqxknvHjxIeaecSEj+x7
 oZXdKKzfLWMID+2HHnsqkgvuuEK/ZuY7gWD6g1lBkRdDCgaHe95dVvy+eHRuDekl5Y7b
 yRHdphtWGbfn6YVqlPGnw1nYxt9w4AG6A8wbhuWH35lKJ389bvetIFqLhlVrXtXN84H9
 y8ZXvJ9c+6+zrkSuAYYtkDTx8ljEEWreFivsNemJxpeE4ltInGoe+jtdeCBOpI8x+uZb
 5O+7aq8fCkWeCVDPZkATFfN1cBYKZJVTq9aje82KhM2ySjheP0/teK00Y6DmOIV3twe2
 /PUw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9FDlNKRwYeqCzDUBvJBNnlFhbQfhzmT63ri/ANDLcWD0l4/8aQsh2htgOULd6lbxcZXyOOq6H2EgA=@buildroot.org
X-Gm-Message-State: AOJu0YwWTz0B6lNobCgvECpSqNDCTmYCQuWzY8hWWlTEAUdLiLhQUfG8
 LKrs4qXUepfdllCTacn1R+PLDt66VPOV3E/tV++KsFr7vhSxIgK1C9zNILtpKCOVevg=
X-Gm-Gg: Acq92OGY+VslA7lmdmZgXz9HzEAWCzyKzGcT1HoWCP5yH8E6NwnrGq1LXkO8T0Rf47J
 gGlvnZsnemB/q4hyqYUaVk09PXy32aMOL4dcQnboqC0KcuhcgDk7faQETy1OtcqvoXG9ymzKmDc
 y3wCTaM5Sp2XQ0QkA3fJDJ+lLNaq2bdE60gelcBxF1xSnwJuqkk87Q9aOQbFW0gEn7UpvICIbSE
 Ana6EZ6uOwdseQFyiZs1BM5aDwOs4Pi60H6QH5Y7lnOu8MT7SXq1pJ7Kkz+YNzKvKYNQkUApqB2
 VaYzb5zB58th9x6D7BWqE+Y1AQoXuBMiM5W3Bl0TTmP5n6qqKuCWYw79nOW/astgBtDBy2vTJqb
 HhC9Ayx6Y2TeFDxt6M5eIupfX8ltjxxeDGDZ2wx32TXHUR+3hnIjcugtIYqWsYAZnnRwTAx1K4M
 JAh+xqqua1zB3FT+Je92Wt9kyV1ECYtAgBab8PScv6/ASGoKKZPtS+DwNVFAaW53KMLrTC
X-Received: by 2002:a05:6000:2982:10b0:43b:5672:efe with SMTP id
 ffacd0b85a97d-45ef140b5cbmr2445618f8f.9.1780043403756; 
 Fri, 29 May 2026 01:30:03 -0700 (PDT)
Received: from arch (94.105.119.128.dyn.edpnet.net. [94.105.119.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34bd320sm1747812f8f.13.2026.05.29.01.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:30:03 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 29 May 2026 10:30:03 +0200
Message-ID: <20260529083003.58604-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260304190435.3483370-1-bernd@kuhls.net>
References: <20260304190435.3483370-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780043404; x=1780648204; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YtRFJ4E9C1YxPw7ex5ENPGLmMeXysvvEM8DAV4wkQW0=;
 b=DJSw+SzxAne9k0GyNhenYet90CzGluxusw3531ZdKwmStkP3LbCi7sh/xMRSTxYSRw
 /HNh+idXwCU0Z6ZeSnEXA3c9EkzuUZrpsDszkHy9PO1dn4v791bNk1QFU7bLgGAWoY3t
 n89kjuZ7YxMeL2xbUIhngIWTcXtTFsgHnfgJzlXd4MOgKB8/m/3EDPy2Nwss3+e0iJDQ
 K7B+R9cQWkpVOAtPoFalbSHsvVpcQqT4KpJfgKy/5X+1pCa0LljrxQ2S1QO+Q7hRmloa
 tHfpbnT0Wcqg360h0lAap8krtdfHN6u/pLDef/jB/tsI+j2NaniHXa2F2UAqABtIrAmE
 oszQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=DJSw+Szx
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: bump version
 to 20260227
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
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260227
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/intel-microcode/intel-microcode.hash | 2 +-
>  package/intel-microcode/intel-microcode.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
> index 41041370e2..588cf7cde3 100644
> --- a/package/intel-microcode/intel-microcode.hash
> +++ b/package/intel-microcode/intel-microcode.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  9232313161ce9dee5facd2870a7bd361d6000b1d409552b5c12efc6498e7f402  intel-microcode-20260210-rev1.tar.gz
> +sha256  fcac5a08d7559a2ce4ad3b1ce5d59619c8adb364b9c51988fedd94220392bb37  intel-microcode-20260227.tar.gz
>  sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
> index 9f6592132a..321272e10d 100644
> --- a/package/intel-microcode/intel-microcode.mk
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -INTEL_MICROCODE_VERSION = 20260210-rev1
> +INTEL_MICROCODE_VERSION = 20260227
>  INTEL_MICROCODE_SITE = $(call github,intel,Intel-Linux-Processor-Microcode-Data-Files,microcode-$(INTEL_MICROCODE_VERSION))
>  INTEL_MICROCODE_LICENSE = PROPRIETARY
>  INTEL_MICROCODE_LICENSE_FILES = license
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
