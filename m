Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCDDC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 16:14:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B777360E46;
	Wed, 27 Jul 2022 16:14:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B777360E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0s2fdF87Ve2; Wed, 27 Jul 2022 16:14:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C410F6058D;
	Wed, 27 Jul 2022 16:14:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C410F6058D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B66B1BF422
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76ED46058D
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 16:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76ED46058D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pp67shP4iVUU for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 16:14:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7072060071
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7072060071
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 16:14:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id i8so2215094wro.11
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 09:14:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lAX3d6Z+PLmsD4qTHMVzhyvz7h1NwQ99pczPoxj7SXU=;
 b=LLiZiMTa4kJAfqQblCQhFFGspkfIikYOvklaL/bokC0bx7gMPkXgD5HtYEMlcoxlpv
 qh1lM8J+qsXo5sHOrLpHbj2q+HQJsJ5bSY7Q0/0A3U4cmzS5KiVpKMXsUSiUTGi3BvLn
 /XaXOYjVtE3Z+k8gUcWCmCT+GOrLvxxSZNRzI1+6sBKZDUaBfk3InvIPgyqEuTZeAhw7
 7VcvlThIR5RnzgTo8MUDmZt3Vpikv8xBbIGWPTt9e48QwGEQT6NfrloZa8kjzX1ALt7L
 XbyRxpals0p1w8QHy8bx3h4I4n0d+sjuJyZbHgG++GthjSTZfoy+V+X7UL2LlIbmqk2A
 hZiA==
X-Gm-Message-State: AJIora82KBJmfFHclVKyuLVxuGqhcHWu3yX0SGtFVo9oUdlRwwmwbyuy
 kilqCxZpzua9X+MhVB6o+latrUaEZX4V6g==
X-Google-Smtp-Source: AGRyM1tN3xnQRAPCZYUG8m7tYCwrMKj2bydq7f1CBpdBFprTSsJdIhqp/+7BI/NE2GJ1c9TNH9483Q==
X-Received: by 2002:a05:6000:1acd:b0:21e:7e8f:a714 with SMTP id
 i13-20020a0560001acd00b0021e7e8fa714mr12543215wry.322.1658938451486; 
 Wed, 27 Jul 2022 09:14:11 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 i205-20020a1c3bd6000000b003a320b6d5eesm3094685wma.15.2022.07.27.09.14.10
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 09:14:11 -0700 (PDT)
Message-ID: <3ec50b5b-6009-18a2-7f79-a539d987ada7@mind.be>
Date: Wed, 27 Jul 2022 18:14:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: buildroot@buildroot.org
References: <20220727161309.3616285-1-arnout@mind.be>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220727161309.3616285-1-arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=lAX3d6Z+PLmsD4qTHMVzhyvz7h1NwQ99pczPoxj7SXU=;
 b=IEs2bSXV+hU1EPpwLZxv++kwpN+g2dfntSW3SiQhb6kXyNFO4mdNH/imOczPbgdbL7
 hvZK3sgOmrkHJzZTcQccoYVfTyky9q1QRiGI9OTU30n8H2mJZHQkBGnx4oY9RDC9SqBV
 RQQRCGCCpZWRM7q4uLUSNIYk3hkFAYb6kZWBWIt0BoHyBHmB9qoF1pth4tNUssGUQmb9
 TcVuiHSg+f1tJeUQG3Ab8z0l/f5ksjZZAqUcDawJuDsI6PHr8dDTK1bY3aK9EbciDnVB
 +cROrK3a+FxyE1bQLCAOUTv7eTXHU04++MDCAAq8DxvuAi852QCvJ6nHrlGLnXvfnKEX
 CU3g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IEs2bSXV
Subject: Re: [Buildroot] [PATCH] support/testing/tests/init/test_systemd.py:
 use downloaded kernel
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



On 27/07/2022 18:13, Arnout Vandecappelle (Essensium/Mind) wrote:
> Since systemd requires a relatively new kernel, we switched to a
> self-built 4.19.204 kernel. However, since then, the downloaded kernel
> used by the tests has been updated to 5.10, which is certainly recent
> enough to support systemd. Switch to this one. This reduces the test
> time significantly.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  D'oh, I was waiting for the pipeline so I could add this:

---
Runtime tests: https://gitlab.com/buildroot.org/buildroot/-/pipelines/598368431


  Regards,
  Arnout

> ---
>   support/testing/tests/init/test_systemd.py | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/support/testing/tests/init/test_systemd.py b/support/testing/tests/init/test_systemd.py
> index 80c6776f59..be28209ba0 100644
> --- a/support/testing/tests/init/test_systemd.py
> +++ b/support/testing/tests/init/test_systemd.py
> @@ -11,18 +11,11 @@ class InitSystemSystemdBase(InitSystemBase):
>           BR2_TOOLCHAIN_EXTERNAL=y
>           BR2_INIT_SYSTEMD=y
>           BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
> -        BR2_LINUX_KERNEL=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
> -        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> -        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{}"
> -        BR2_LINUX_KERNEL_DTS_SUPPORT=y
> -        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
>           # BR2_TARGET_ROOTFS_TAR is not set
> -        """.format(infra.filepath("conf/binfmt-misc-kernel-fragment.config"))
> +        """
>   
>       def check_systemd(self, fs):
> -        self.start_emulator(fs, "zImage", "vexpress-v2p-ca9")
> +        self.start_emulator(fs)
>           self.check_init("/lib/systemd/systemd")
>   
>           # Test all units are OK
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
