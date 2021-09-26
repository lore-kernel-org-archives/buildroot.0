Return-Path: <SRS0=Tewt=OQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0851C433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:49:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B8EE60F94
	for <buildroot@archiver.kernel.org>; Sun, 26 Sep 2021 19:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B8EE60F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4810481A73;
	Sun, 26 Sep 2021 19:49:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9_ZwWLKeZRot; Sun, 26 Sep 2021 19:49:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44EA281AAC;
	Sun, 26 Sep 2021 19:49:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9622D1BF383
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84F78402A5
 for <buildroot@lists.busybox.net>; Sun, 26 Sep 2021 19:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E-0M2TkAoVsW for <buildroot@lists.busybox.net>;
 Sun, 26 Sep 2021 19:49:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A7784029D
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 19:49:36 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id ee50so60018603edb.13
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 12:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=6Gq9cOoIxMnxKLxxwCKKZ8TqkEd8BvXZ9cnf4eWA3AA=;
 b=YaBgFXzsKjPxzpgDH21Z/bY7pCOTUXPRfhOPoNtSjBBFDZqTI4znNeqbMt+WWjtaf0
 ehGeYA5ZG385ZyjB7r7GLRGSBcBpsEjgoRX69/GFUMKAxpU+k8XGYqQhmpzEmV2m/uXy
 h0i3Uyh4/L/cEmSIi9icR8kKnvtdfOo6SkoxouEMmrR44fKVJ+gqBVhUTwXSpIRgeTEL
 97EmIlpsOqUZb9sOLXOYhQTwSFmU4DnhK4gYKYMsoVxkPab+Xtu+dDVZjsY61z90W+KW
 s05VOwIIP0uTSfZ+5sqVFjQxT462p/JOSKY62hYNUgsvl93Zq7QVBfPYYjRa3fNnfxS0
 EKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6Gq9cOoIxMnxKLxxwCKKZ8TqkEd8BvXZ9cnf4eWA3AA=;
 b=MwqhS/aNPDPqDQEDJUl7MhJZaOBHYXMT/oYpP+OWYaCbizQNCX54YnKd86uNJl8A7l
 gk6HtS4MuQ0I4VB0+bDU58j6U5Au/aQ/3zfPEhhJ4Mlv0YBhlL+2gcOv7FHp734eSsih
 zIsqccY61+oSDB6FKJSz2SvMhq087n5pVxJiKi+41fywu6I+L7vklmBrzlTWuJOB72FM
 W6oUNVsDgpnX8suwc1hiUZOeklHXMTvvrzlxpabM8dODNxiKQynEd0E/2ZEg9sApEBnr
 QMdW28xM0XXGfD49TGRTjOkhWZuk4kvLzB5/E+QD8Libzn16MLLBkCNJjdxZMvV+RHzi
 j76Q==
X-Gm-Message-State: AOAM532am+l1YOkdOlBCwEnu2bCyKDb/K6rpsvXnCZ0ttIKzBdyvlCZH
 kK95eZRzeex2CaNIg3mCp2G4hpAvYflTQQ==
X-Google-Smtp-Source: ABdhPJzkfTuB/23WebTa1fPavzdgV6V5IXwuYcJX/L2KC88Rs0Mhr7fz1nboD1vdS/jDQuWIonO6jw==
X-Received: by 2002:a17:906:79d5:: with SMTP id
 m21mr23078537ejo.437.1632685774510; 
 Sun, 26 Sep 2021 12:49:34 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w2sm9382367edj.44.2021.09.26.12.49.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Sep 2021 12:49:34 -0700 (PDT)
Message-ID: <dee10cf0-ce59-078b-a82a-97c608405b79@mind.be>
Date: Sun, 26 Sep 2021 21:49:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20210926081511.3503079-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210926081511.3503079-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: fix build with
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/09/2021 10:15, Fabrice Fontaine wrote:
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
>   - http://autobuild.buildroot.org/results/2856060cb59250f4ef7ab75a848a3dc0be9b821b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...gument-version-of-SetTotalBytesLimit.patch | 39 +++++++++++++++++++
>   1 file changed, 39 insertions(+)
>   create mode 100644 package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
> 
> diff --git a/package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch b/package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
> new file mode 100644
> index 0000000000..d169e04ef2
> --- /dev/null
> +++ b/package/opencv4/0001-Use-the-one-argument-version-of-SetTotalBytesLimit.patch
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
