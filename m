Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F43CD6E51
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DE3B8427E;
	Fri, 29 May 2026 13:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtHKUMMxT8_G; Fri, 29 May 2026 13:38:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C96C984265
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780061890;
	bh=CQJ6Q6nNBWhEIuiubCENdfP6stjH+Z5CLPbjMdLxCbw=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=g2ytE+ci/7Nq8KF4ivoN9t4rPWiYqU55dasOFRl5E0G47xNxAH0RBGn50e/yoVu8l
	 eZPKyHqL3ZzHZu0QefaD7kkCBseBqTSUtkgWgRwO5qrEyn6OFJe4MCKtUxfkeV4FRN
	 aL3BA+2pKgLZxwFubs5JuAnT/F3jXetxVAJXcyRl6luhPxhumZpsGu7o0r8rvcsZWV
	 ocdrkSNcRW6IjcUQjYf/SnqMLyqRnW2amNX+yB44EA5s7/nplGeNvPd80y99XS4mn+
	 r2FM0RGR3r2Ld5SI0L/2vkupZ+hFLAWIHX5+mcZ+4EWSakUPWjauFUFvSBs47NSPHJ
	 NYL6CJ72KtjGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C96C984265;
	Fri, 29 May 2026 13:38:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DD6B288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6F07B610CB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:38:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSQ-IJV1_l3d for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:38:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 51B20608F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51B20608F5
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51B20608F5
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:38:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 88FA9B97C6DC; Fri, 29 May 2026 15:38:05 +0200 (CEST)
Message-ID: <1f4c78fe-9df2-4703-a17e-17584fd170b2@rnout.be>
Date: Fri, 29 May 2026 15:38:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20260506184057.665854-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260506184057.665854-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780061886; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Mzd6mq6CR8ArefqFvZxYSJVLBWUytTzGgKSzl+RiFmQ=;
 b=cNXl0CL8fnGpjqOzPLmvKGp0uyFb84vOeSbSf+4u1AIGPAzLkXg3xi6fKJRqXLo5tzAYAx
 SJ0sZTi+z9D/6e5eFxa0KR4q1oBCLEEnUZL1RN7rdCdBo7GN/JlaxbqTAX5mA4lFSF24LU
 wfDDtQIzGGWT/pYvxj08YHtSHXsucDPBkjY2DVYKFBo7ZInS2UXiFmZroz9iXQGWz1bibg
 LaxiqdFVuANvLHwO81Xi35HB/fjaE8cHzB/1zKmINRRlqj734J2UNVcc5weDYUM9eM/+AJ
 JgBB9Tfqmn+lAIHqOetN8tBZes665XbFwdZnvf67C9D9dnsgx9w5q0h2z0bOVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=cNXl0CL8
Subject: Re: [Buildroot] [PATCH 00/12] Add libudev-zero as provider for
 libudev
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 06/05/2026 20:40, Bernd Kuhls wrote:
> Hi,
> 
> this is a new try to get packages which need libudev, but not a full
> udev-daemon, working on systems that use
> BR2_ROOTFS_DEVICE_CREATION_STATIC=y.
> 
> A couple of years ago a patch series splitting the eudev package into a
> non-daemon/with-daemon version ended up into a discussion about space
> saving and complexity:
> https://lists.buildroot.org/pipermail/buildroot/2023-August/735616.html
> 
> This new series still introduces a new virtual package, libudev, with
> eudev and systemd as possible providers but otherwise keeps these
> packages untouched.
> 
> The third provider is the new package libudev-zero which is a daemonless
> replacement for libudev.
> 
> Run-time tested kodi with libcec and intel_gpu_top.
> 
> Regards, Bernd

  Series applied to next, thanks!

> Additional note: eudev seems unmaintained upstream:
> https://github.com/eudev-project/eudev/issues/296#issuecomment-3651442802

  With libudev-zero there is less and less reason to have eudev. OTOH as long as 
it works, we can keep it.

  Regards,
  Arnout

> 
> Bernd Kuhls (8):
>    package/libudev-zero: new package
>    package/libudev-zero: provides libudev
>    package/eudev: provides libudev
>    package/libv4l: optionally use libudev
>    package/libcec: optionally use libudev
>    package/igt-gpu-tools: only needs libudev, not udev daemon
>    package/kodi: only needs libudev, not udev daemon
>    package/mesa3d: add optional dependency to libudev
> 
> Yann E. MORIN (4):
>    package/libudev: new virtual package
>    package/systemd: provides libudev
>    package/qt5base: optionally use libudev
>    package/libinput: only needs libudev, not udev daemon
> 
>   DEVELOPERS                                    |   1 +
>   package/Config.in                             |   2 +
>   package/eudev/Config.in                       |   4 +
>   package/eudev/eudev.mk                        |   2 +-
>   package/igt-gpu-tools/Config.in               |   6 +-
>   package/igt-gpu-tools/igt-gpu-tools.mk        |   2 +-
>   package/kodi/Config.in                        |   6 +-
>   package/kodi/kodi.mk                          |   4 +-
>   package/libcec/libcec.mk                      |   4 +-
>   package/libinput/Config.in                    |   6 +-
>   package/libinput/libinput.mk                  |   2 +-
>   ...01-Avoidable-OOM-on-small-systems-62.patch | 176 ++++++++++++++++++
>   package/libudev-zero/Config.in                |  18 ++
>   package/libudev-zero/libudev-zero.hash        |   3 +
>   package/libudev-zero/libudev-zero.mk          |  29 +++
>   package/libudev/Config.in                     |   6 +
>   package/libudev/libudev.mk                    |   7 +
>   package/libv4l/libv4l.mk                      |   4 +-
>   package/mesa3d/mesa3d.mk                      |   4 +
>   package/qt5/qt5base/qt5base.mk                |   4 +-
>   package/systemd/Config.in                     |   4 +
>   package/systemd/systemd.mk                    |   2 +-
>   22 files changed, 275 insertions(+), 21 deletions(-)
>   create mode 100644 package/libudev-zero/0001-Avoidable-OOM-on-small-systems-62.patch
>   create mode 100644 package/libudev-zero/Config.in
>   create mode 100644 package/libudev-zero/libudev-zero.hash
>   create mode 100644 package/libudev-zero/libudev-zero.mk
>   create mode 100644 package/libudev/Config.in
>   create mode 100644 package/libudev/libudev.mk
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
