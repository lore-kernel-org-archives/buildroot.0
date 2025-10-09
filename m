Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5853CCD185
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:55:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AF4961308;
	Thu,  9 Oct 2025 14:55:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzzEiD3mQHK7; Thu,  9 Oct 2025 14:54:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80CDC612FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 80CDC612FB;
	Thu,  9 Oct 2025 14:54:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A047119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E48958114F
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id INPW3jy-HiZ0 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CCCCF811E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCCCF811E0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CCCCF811E0
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:51 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e33b260b9so11033955e9.2
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021690; x=1760626490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PtfZf/yYJn0SM4JTOKXNDsThNwfSJbEMxA7g2J392h8=;
 b=fB615CslRh8I6aX0YyeUJZh/8nDpE2XNrDjLKm734f2SnQYmtDT0Ke9drAkWvzIEKb
 QhqImmepl0DcGbVTO3OxZo2c4aO0fzJKDrpjRp//hyeLCAjBMQ9drM5YG2H2yuH/QxNv
 V6I2VXkAXtPkGZ8rXqm+XfRNPlPjj+gj/lT5CoNp3inib58C/RjVbxXhzaz4uTWxg2fd
 wHsLlBg0k4RBJ3UIt+WVwDoEKYEI2VLw/uqBRwMyygKsbp/buu4Xr8EyM1VANR+Z3YiS
 2DEH5iMb0f9RxsSeCsiWa59KT6B24735sL7z4D2H2LF0Qtpx34etQJ5BK/jBvD8GuY1T
 L2Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVykh6TiDuTlsjKOnHj9peTWX4arwxE0s1/MPVjH6VOK+3BDM7z05JnngPxoemOFga5GvYZkWgiB/U=@buildroot.org
X-Gm-Message-State: AOJu0Yx1QQV8Czk3w6mUeyAYfwNdrsyGXfUH4Vl+NIziSvw5ITg97OJ+
 EUwQ32tROK+2bfue4NnTjk5hOiy2w6arsqkzkO5VRrTjCwqs+q/F9FkSkCiWThMBZOE=
X-Gm-Gg: ASbGncuUB/6LG05DQR4msPTK6TCwFJXl/wpxRvXU5Qbrc21DPevfsi7xjD0+miIIc1Z
 BQYNAkQI4RmobvM8J7/anH7ODkMjlKiGStnQlq3HrGMxTtOf9oUc60sZ5g+abMYowSWNFJhWRWO
 Gbmy9zgyJNj/jgW1hzrnWwe3xvB+WxjaSJzsgluxDmpzAQf8lWSOY2hI6Nswqbbk7xTDvEns7DS
 fxZX5hxUCODBgk3dguIh9Ozb0T2/WlhDnYLXMPP7w2DrGBU1DUQX8s5p/pR760MurGhrQ8lOwJq
 O8wGqYbtXNjbG+ENFlhT5g7xcBJOJ93xUg6mLBgkT5o/0z/qyfOepDnTXwZe1Z934siwp7A4LnO
 oz3dB/QqXkQw42gindA6UbvbfjQFHEMHth8gDctGp
X-Google-Smtp-Source: AGHT+IGZEp6QyV/w+sV8dG9P4WHutFAhYX1D+SmscycrqDCwBJ8mIw2snwAXKnSkbNBfU97gAf2PBA==
X-Received: by 2002:a05:600c:3b11:b0:46e:4c7c:515c with SMTP id
 5b1f17b1804b1-46fa9b182e2mr57774775e9.34.1760021689447; 
 Thu, 09 Oct 2025 07:54:49 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb48530cesm1067635e9.20.2025.10.09.07.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:49 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:48 +0200
Message-ID: <20251009145448.482682-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251003201200.2430182-1-bernd@kuhls.net>
References: <20251003201200.2430182-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021690; x=1760626490; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PtfZf/yYJn0SM4JTOKXNDsThNwfSJbEMxA7g2J392h8=;
 b=GLOi6A3GP/1B9mQ4WOpxtmpE38s+EICr0nEdRQTKkDcnAT5zMG8k2Y1vPq71h6vcbA
 DnKh4vtPVH1ptL94Wv8ZKmbaKiYKNvquGSl0ihi7kPYS7C1UWKft0seRDTXc7XeMGPRn
 c5UzPldwtBlt2LKCxQcaETOS9Bru+HBq+mhwAdtt8FNITcPJ2p7SQ4MJ0R1oiBoLDI+a
 bH7GIgCyDALmhmW0+Pbn9WYupabv8rGperanJAs57IUkoW2LYYWhABZ0TGCPQbd2oIpj
 OWcYDh2s0RkT35Xq8QQqiKUm6ng2hPejJOWkxra7i56gFuTe0i+pxVfbOryHByWol1OB
 t9+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GLOi6A3G
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20250812
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
> Release notes:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20250812
> 
> CVE-2025-20109:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01249.html
> 
> CVE-2025-22840:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01308.html
> 
> CVE-2025-22839:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01310.html
> 
> CVE-2025-22889:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01311.html
> 
> CVE-2025-20053:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01313.html
> 
> CVE-2025-26403:
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01367.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/intel-microcode/intel-microcode.hash | 2 +-
>  package/intel-microcode/intel-microcode.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-microcode/intel-microcode.hash b/package/intel-microcode/intel-microcode.hash
> index 9504f7a786..735b352d1f 100644
> --- a/package/intel-microcode/intel-microcode.hash
> +++ b/package/intel-microcode/intel-microcode.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  041af7d2f5791a47c1e914abd7d6255de4d4fc61b0f8e49ada6ee7014bcc3614  intel-microcode-20250512.tar.gz
> +sha256  a8358422c68cc4d15c26db1ef682fbce332c3f46c4e087a79c132c437ec5f407  intel-microcode-20250812.tar.gz
>  sha256  03efb1491c7e899feb2665fa299363e64035e5444c1b8bc1f6ebed30de964e12  license
> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
> index 1fd09e6a6d..2850dd01e4 100644
> --- a/package/intel-microcode/intel-microcode.mk
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -INTEL_MICROCODE_VERSION = 20250512
> +INTEL_MICROCODE_VERSION = 20250812
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
