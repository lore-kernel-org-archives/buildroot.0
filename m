Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D29E4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:49:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95CF360F94
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95CF360F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73BD881A18;
	Sun, 26 Sep 2021 19:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UClXYMsavyaG; Sun, 26 Sep 2021 19:49:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7839B80F24;
	Sun, 26 Sep 2021 19:49:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 81FDD1BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 724C24029D
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:49:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YIjyWJ3bkZsp for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:49:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E6144018E
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:49:26 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id v10so55465126edj.10
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9VtJg8dwEPfUgLLeMpbbGkNRU0rIa9+4eQkpX9coD3U=;
 b=c+CXuBPn3BS9Loi+5KOx7i52cq+DoVnUIGqLnCM4qrQSfwuI9FoFOCeWTvUJz/L47g
 wQjeOcA4YLC3mK8dYXY3ftZ5wC3ZmoZtBmA7inHHAj0Ac4uGnmZTiDmRpxdu2/2IHNEB
 F0Xl0EGVbBUCErptGzis+DCMV31GIgV836HLxeqb9AdBBIuJD2GETOEQaQrrR6rFv7fy
 XmL3aKRTdOCLbMFFjXba15KU/8+K6v7wZI4aGW1aaKDGyHfwIGZB8ToS4GMnDygaRJrM
 I104edo4WGuhAj6hcNgbH89txLJKxu3TJMFWq6VH/NYT9ogXYuNI5EW5SseUr4BV5Swq
 7kKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=9VtJg8dwEPfUgLLeMpbbGkNRU0rIa9+4eQkpX9coD3U=;
 b=IQ4B80JS8fiLenJ0IdP7POh63kgLacrwrcwalutogE3OGTrjgdU9mW9NmV+bQp2p/m
 zbtVqSDUEAtu0oqiSfz1M94yx0KmlyFt1r9hoOHefexy66XCe3PbStE4G51/RPiZqzxk
 aNjeDHwvEk4z0AkxwPeXEDTUI7015J69sNzEw8AYuhBoOxha9XEH6tO/86WIsmbrK1i3
 +km9ooVb4jzJh+iCb87Z2IMoeVVLgux9pP1hr14zibDi+OeOXwAjDXjbsP1Qgp0BON0L
 Es3goWfn5bhLeIvrlBcsfJwflAuFEa3LyRYuZuNzY117ovGmQLNS6tPaHsK+xrItUuWl
 iQSA==
X-Gm-Message-State: AOAM533/CQGCCxpuzFWKzOGWt3XOW8gM8v0+WuRraSVeDVxUToSKnfgT
 ejC1ULXCFcBoAjcdTU/CYMSq9w==
X-Google-Smtp-Source: ABdhPJzZKTAwq4a3FN+GdIJClHyWCw0wbfgvDa65OcRqtLqzm2TaWRQMfElKYlpUhDiifgUMBUjHZw==
X-Received: by 2002:a05:6402:646:: with SMTP id
 u6mr18783576edx.127.1632685764464; 
 Sun, 26 Sep 2021 12:49:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id f27sm1508570ejh.13.2021.09.26.12.49.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:49:24 -0700 (PDT)
Message-ID: <b5bbfa15-11a2-3f23-911a-a02d75225bfb@mind.be>
Date: Sun, 26 Sep 2021 21:49:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210926081450.3502798-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210926081450.3502798-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv3: fix build with
 protobuf 3.18.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/09/2021 10:14, Fabrice Fontaine wrote:
> Fix the following build failure raised since bump of protobuf to version
> 3.18.0 in commit c28924920d6df13a61879e3b301f71dd5edf2880:
> 
> /home/giuliobenetti/autobuild/run/instance-0/output-1/build/opencv3-3.4.15/modules/dnn/src/caffe/caffe_io.cpp: In function 'bool cv::dnn::ReadProtoFromBinary(google::protobuf::io::ZeroCopyInputStream*, google::protobuf::Message*)':
> /home/giuliobenetti/autobuild/run/instance-0/output-1/build/opencv3-3.4.15/modules/dnn/src/caffe/caffe_io.cpp:1114:67: error: no matching function for call to 'google::protobuf::io::CodedInputStream::SetTotalBytesLimit(const int&, int)'
>   1114 |     coded_input.SetTotalBytesLimit(kProtoReadBytesLimit, 536870912);
>        |                                                                   ^
> In file included from /home/giuliobenetti/autobuild/run/instance-0/output-1/build/opencv3-3.4.15/modules/dnn/src/caffe/caffe_io.cpp:93:
> /home/giuliobenetti/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/google/protobuf/io/coded_stream.h:401:8: note: candidate: 'void google::protobuf::io::CodedInputStream::SetTotalBytesLimit(int)'
>    401 |   void SetTotalBytesLimit(int total_bytes_limit);
>        |        ^~~~~~~~~~~~~~~~~~
> /home/giuliobenetti/autobuild/run/instance-0/output-1/host/mipsel-buildroot-linux-gnu/sysroot/usr/include/google/protobuf/io/coded_stream.h:401:8: note:   candidate expects 1 argument, 2 provided
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/4f2a4e769c826d44fdec61b049d3d30a7e39a4d2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...gument-version-of-SetTotalBytesLimit.patch | 39 +++++++++++++++++++
>   1 file changed, 39 insertions(+)
>   create mode 100644 package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
> 
> diff --git a/package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch b/package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
> new file mode 100644
> index 0000000000..d169e04ef2
> --- /dev/null
> +++ b/package/opencv3/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
> @@ -0,0 +1,39 @@
> +From 9cfa84313c5833d7295fcf57be93d5d2aaadfd88 Mon Sep 17 00:00:00 2001
> +From: Vincent Rabaud <vrabaud@google.com>
> +Date: Sat, 10 Jul 2021 00:21:52 +0200
> +Subject: [PATCH] Use the one argument version of SetTotalBytesLimit.
> +
> +The two argument versions has been deprecated, cf
> +https://developers.google.com/protocol-buffers/docs/reference/cpp/google.protobuf.io.coded_stream
> +
> +[Retrieved from:
> +https://github.com/opencv/opencv/commit/9cfa84313c5833d7295fcf57be93d5d2aaadfd88]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + modules/dnn/src/caffe/caffe_io.cpp | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/modules/dnn/src/caffe/caffe_io.cpp b/modules/dnn/src/caffe/caffe_io.cpp
> +index 2fc4d84f4604..ebecf95eea3a 100644
> +--- a/modules/dnn/src/caffe/caffe_io.cpp
> ++++ b/modules/dnn/src/caffe/caffe_io.cpp
> +@@ -92,6 +92,7 @@
> + #ifdef HAVE_PROTOBUF
> + #include <google/protobuf/io/coded_stream.h>
> + #include <google/protobuf/io/zero_copy_stream_impl.h>
> ++#include <google/protobuf/stubs/common.h>
> + #include <google/protobuf/text_format.h>
> +
> + #include <opencv2/core.hpp>
> +@@ -1111,7 +1112,11 @@ static const int kProtoReadBytesLimit = INT_MAX;  // Max size of 2 GB minus 1 by
> +
> + bool ReadProtoFromBinary(ZeroCopyInputStream* input, Message *proto) {
> +     CodedInputStream coded_input(input);
> ++#if GOOGLE_PROTOBUF_VERSION >= 3006000
> ++    coded_input.SetTotalBytesLimit(kProtoReadBytesLimit);
> ++#else
> +     coded_input.SetTotalBytesLimit(kProtoReadBytesLimit, 536870912);
> ++#endif
> +
> +     return proto->ParseFromCodedStream(&coded_input);
> + }
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
