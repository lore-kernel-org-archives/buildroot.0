Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBF2CD8CB5
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 19:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABCA4408A2;
	Tue, 10 Oct 2023 19:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABCA4408A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NhPoC5rFSE6N; Tue, 10 Oct 2023 19:32:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80ADF417EC;
	Tue, 10 Oct 2023 19:32:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80ADF417EC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC7701BF32B
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 19:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92B0782230
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 19:32:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92B0782230
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5aic60GUGazQ for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 19:32:26 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1698C82226
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 19:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1698C82226
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9b2cee40de8so36842866b.1
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 12:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696966344; x=1697571144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZJy/2ilu25rA9JrH4f08BlURnEsT1Uq0ItcXeHurqFA=;
 b=DVbGqCxn7dY+HMNUdiW061vTWNqNfIXOMkmzeXIL/8cARx6oy1YguLxgr7gSgaSQv2
 P/0i8UAy2AJtvgMCOYIqSnHn5GzfOuiiSrgH5b/65mK+l749XjVubdBScefH5lR44Veu
 V7kkUs+VajhnKzXZNIHnngMRmvgjinvx6qHV+UPvc9dxVpYlOgzsTyYstAPgzdQv89Gd
 HpS8wM6AHYrvB9Pe8rSOlPeXMjaaqR4wGnIy1KQjADP14gv3hTqSwmjMp5pPe6W0SWIJ
 VRrIVdVhJJkHX3NHNshJ++aFhCwNPR74gniPjyFrDaVD4cfPEfvz9fIfVM7+uHuDhlIi
 eHdg==
X-Gm-Message-State: AOJu0Yyn38l/0r8cG/qg7CUx9mbK1xsc5xIKU42arGYhlievqgRCRTFU
 itgPIrh51dXUOvbRe1j6KCCPUyj+3pfNo6icSEc=
X-Google-Smtp-Source: AGHT+IG9zUJT7XpnvjbSy5318XbP635BYzTUZi9NqvQ8gszCv4BW73jQEHA2mSdWoelbiTFtMs1NLw==
X-Received: by 2002:a17:907:96ab:b0:9aa:1dc9:1474 with SMTP id
 hd43-20020a17090796ab00b009aa1dc91474mr14279876ejc.33.1696966343830; 
 Tue, 10 Oct 2023 12:32:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a17090628d000b009b654ba498csm8853390ejd.90.2023.10.10.12.32.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 12:32:23 -0700 (PDT)
Message-ID: <42d44a84-66e8-65f5-8e06-92f95b381291@mind.be>
Date: Tue, 10 Oct 2023 21:32:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20230115125253.280257-1-nolange79@gmail.com>
 <20230115125253.280257-4-nolange79@gmail.com>
In-Reply-To: <20230115125253.280257-4-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696966344; x=1697571144; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZJy/2ilu25rA9JrH4f08BlURnEsT1Uq0ItcXeHurqFA=;
 b=B4P+XsgOuQR5MpRE04w8WI2DL27MiFjUD8BHozV6AD+zmHCXJkVYmn8TFhY6gH+70E
 Dhfvd4psCFm9gKUCAWGAfW4R7phNhmnElKfwjzTd0rVEjWPVP4CIhBr7+GXtOUhnTe7c
 TNSzLp3xA5LJaOBQdItbupevHKryvPdPGhs2R4gl8ujp8UMa1YKK+o6jprD6Bz6YNpJg
 dIZoiWWv16nbWl4qO5x/g99AK2RmP9UEaFhSW4veHHwlwXwNjQt58VzDSK4u1aJV8HfB
 SPYABEpzXq9uCi3vCTs5L3sZheJVY2kli9oheuCgivCjdRm9vmqGfHarxVXbJg/GNgJN
 m75w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=B4P+XsgO
Subject: Re: [Buildroot] [PATCH 3/7] package/skeleton-init-systemd: force
 permissions for buildroot runtime dirs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Norbert,

  Obviously, this doesn't apply any more because I committed a different tree. 
However...

On 15/01/2023 13:52, Norbert Lange wrote:
> A previous commit introduced /run/.br and /tmp/.br and a few
> subdirectories.
> Add a tmpfile to ensure the existance, ownership and permissions.
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>   package/skeleton-init-systemd/00-buildroot.conf        | 7 +++++++
>   package/skeleton-init-systemd/skeleton-init-systemd.mk | 1 +
>   2 files changed, 8 insertions(+)
>   create mode 100644 package/skeleton-init-systemd/00-buildroot.conf
> 
> diff --git a/package/skeleton-init-systemd/00-buildroot.conf b/package/skeleton-init-systemd/00-buildroot.conf
> new file mode 100644
> index 0000000000..a4c7bf0576
> --- /dev/null
> +++ b/package/skeleton-init-systemd/00-buildroot.conf
> @@ -0,0 +1,7 @@
> +# Create buildroot API directories and fix permissions
> +
> +d /run/.br 0755 root root -
> +d /tmp/.br 0755 root root -

  I don't think this tmp directory is used anywhere?

> +z /run/.br/bnd 0700 root root -
> +z /run/.br/ovl 0700 root root -

  What's the point of doing this? These directories are created by the overlay 
service file. systemd-tmpfiles is started after local-fs.target and the /var 
overlay mount comes before, so it's the overlay service file that has to create 
them. You could say "hey maybe there's some other service that makes use of 
those directories" - but if so, that's another service that is going to come 
before local-fs.target, so it _also_ has to create those directories itself...

  There's a bit of a problem with systemd-tmpfiles, that it doesn't allow to 
specify dependencies/ordering. That's in fact one of the reasons the factory 
approach doesn't work so well. systemd-tmpfiles only works for services after 
sysinit.target, really - and therefore doesn't work for anything related to 
local filesystems.

  IMHO it would have been better to put tmpfile blocks in service definitions. 
But that's not the world we live in :-)

  So, I've marked as Rejected, but feel free to argue my points.

  Regards,
  Arnout

> diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> index ad529cddf6..f431ec4612 100644
> --- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
> +++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
> @@ -91,6 +91,7 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
>   	ln -s ../run $(TARGET_DIR)/var/run
>   	# prevent install scripts to create var/lock as directory
>   	ln -s ../run/lock $(TARGET_DIR)/var/lock
> +	install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/00-buildroot.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/00-buildroot.conf
>   	install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
>   	$(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
>   endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
