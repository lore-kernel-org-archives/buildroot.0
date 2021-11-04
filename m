Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F059DC433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 05:05:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06106611C9
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 05:05:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06106611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AE7681010;
	Thu,  4 Nov 2021 05:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y0otlzJwWkeb; Thu,  4 Nov 2021 05:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9DA180F7A;
	Thu,  4 Nov 2021 05:05:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5AB4F1BF334
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 05:05:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 49BD9607DA
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 05:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bhax_rPBRNe9 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 05:05:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EB3D607D0
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 05:05:29 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id g125so7371323oif.9
 for <buildroot@buildroot.org>; Wed, 03 Nov 2021 22:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/lVGRjGxkTAdQ8yEcRbKaH/ogxQd/YTTUG4iFgGrEc=;
 b=PjtfWYsSTREqSt4u4UjcrhnrpbIA45j/9vo5kYzgedJ6yseZ524c4l8sMMGkvwShey
 lLGi7QNRapl8BfKqaq5F6l3iu4uDCg9tDbVtNKlRZG5uCBrWtj4VSxaKjtqQX5ry1h10
 YY3av+X0btGn0HBeBtqVwayysLyBOLpTMvF9sa6lXMS/gPqBAymh1ORjn30UWE43WLhH
 w4mY5Tw7flAIultQcxNjHFjyBsHWx4fnrHPJZVGyNgw/MiKtYK7f8KW3ZLiGsVWz/Cun
 IqWnIDohZdhTI2Opo1aqKHDGVxmlZNQfqLmcQj6/p5igXZSV3RyOQ4TSz2fJb1rXYQTC
 o5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/lVGRjGxkTAdQ8yEcRbKaH/ogxQd/YTTUG4iFgGrEc=;
 b=axAeanUDC4PErF15p7oOmw6Hn6JFzEfM7F2+LpEYCuWiFDB4Yjz7nFKMov4gOe6nTk
 ik7JrfOFYZpBerdgyV1hdEYhTZuVTPuXin/fBU4H+y9t8VEm9Rta9DZMfepxpsNZM+f/
 VJGAdwgaVbfNpr/Q/NLpoKhfooEE+xhauY5upkgZQVUYn1ZhVCrqsWvXOmrVph4Pyzmq
 JaRNln61TYGFo56Zoqe5hyjZwwhxRBrqvtHQeddTEjv6/fLCZAs7mEAQ6BA8SXcgmpSS
 2l1chE0R31KCU9OtWgHPDKqYFSgxo+sqiz9Y7cR0tcq1f6mWRqKjP3LWg9rkTUTdDx2s
 mh7g==
X-Gm-Message-State: AOAM531QZOuanV5oge751j5cWg2HVuH1XPWe6jjQzRdXlPjsTIhzFbTn
 vUQRdDSdMoB+W9wV8Smh+P6dq6JaQhgoZnhQMoE=
X-Google-Smtp-Source: ABdhPJwhXbPeztPXKr0R+HKIwOBeM005rsUY3J31YS9EBV7bHLevyONJhlYQaU6mosZmLED0eIf1yb/HE5u+nEaLihw=
X-Received: by 2002:a05:6808:3027:: with SMTP id
 ay39mr14635754oib.39.1636002328338; 
 Wed, 03 Nov 2021 22:05:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211026163222.3912644-1-fontaine.fabrice@gmail.com>
In-Reply-To: <20211026163222.3912644-1-fontaine.fabrice@gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 3 Nov 2021 23:05:17 -0600
Message-ID: <CADvTj4oL_nLtrzXjax893M5P6jnVJj0w2oR7O9X3AbQHe+aOzA@mail.gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/python-cryptography: add host-python-six dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Oct 26, 2021 at 10:34 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Fix the wrong assumption that six is not a dependency with python3 made
> in commit 95a63a34ac9204c4fe069154783bd97ed48c3ae2 to avoid the
> following build failure with ca-certificates:
>
> Traceback (most recent call last):
>   File "/home/buildroot/autobuild/instance-2/output-1/build/ca-certificates-20211016/mozilla/certdata2pem.py", line 31, in <module>
>     from cryptography import x509
>   File "/home/buildroot/autobuild/instance-2/output-1/host/lib/python3.9/site-packages/cryptography/x509/__init__.py", line 7, in <module>
>     from cryptography.x509 import certificate_transparency
>   File "/home/buildroot/autobuild/instance-2/output-1/host/lib/python3.9/site-packages/cryptography/x509/certificate_transparency.py", line 10, in <module>
>     import six
> ModuleNotFoundError: No module named 'six'
>
> Fixes:
>  - http://autobuild.buildroot.org/results/2b6872eec31362bf3edf88c69b67d681b2f016aa
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>  - Use host-python-six instead of host-python3-six
>
>  package/python-cryptography/python-cryptography.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> index e21b9db042..acc21c1227 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -14,7 +14,7 @@ PYTHON_CRYPTOGRAPHY_CPE_ID_VENDOR = cryptography_project
>  PYTHON_CRYPTOGRAPHY_CPE_ID_PRODUCT = cryptography
>  PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python-cffi openssl
>  HOST_PYTHON_CRYPTOGRAPHY_NEEDS_HOST_PYTHON = python3
> -HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-openssl
> +HOST_PYTHON_CRYPTOGRAPHY_DEPENDENCIES = host-python3-cffi host-python-six host-openssl
>
>  $(eval $(python-package))
>  $(eval $(host-python-package))
> --
> 2.33.0
>
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
