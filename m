Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B5BCD8CB7
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 20:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3B626137D;
	Tue, 10 Oct 2023 20:33:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3B626137D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RRL7kMYesbi1; Tue, 10 Oct 2023 20:33:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4B5E60F8E;
	Tue, 10 Oct 2023 20:33:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4B5E60F8E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E8C01BF389
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 260B44193A
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 20:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 260B44193A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ngGt-keB8d9U for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 20:33:46 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F3AA4191D
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 20:33:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F3AA4191D
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9b27bc8b65eso1022115766b.0
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 13:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696970024; x=1697574824;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WAS8Jplr3UTvLiHHrfw3G3Alrs6Ai7tvf1YuSoGw/ME=;
 b=QfK1ugpk9fulIJDR2KxTPmfFmBfsJWSShoBWQ0x2mLq6Ja4TkiUGHaulFg2Um9rek/
 xd51bcBwNdWIh6JBe6Hja6Ke/Ish0uzWCBiWXKXw/KyUxLHN9RWr5wv7xT8RbklKbKro
 czRq2Y7j3yG4iGWG0d9VXl8M9H3sIwXq1RqE3KE8uG+Ed16xlJGmiXNpibSCyzPtn9YX
 5t4CAh4YLmUdODEXW2dzB+3/sJS6cRfqjxS4aqL+pwnyNUmF+lSXD4ym8A7+H6CPrj4C
 SnFxBm4N9GAZu/FYY6mIKJhuu/6wDB9er/vNyWmnED/tUkXQHcpaex/g36+TY2qslK74
 kB5Q==
X-Gm-Message-State: AOJu0Ywa1VlauP0Kuo3WeEV7bQZ+lsQ0829+i1htADZYQE7fy3l3wAms
 mtJS55boxEIN4iiViFKrVvduug==
X-Google-Smtp-Source: AGHT+IFrkIQWlb/QdOAkJ7DvzxGQ/VOjrnmmvBePkYSssBcgdxavGBKirA2liNVLZIBFbAAlusBk4w==
X-Received: by 2002:a17:907:7787:b0:9b2:6f52:586d with SMTP id
 ky7-20020a170907778700b009b26f52586dmr17733996ejc.50.1696970023758; 
 Tue, 10 Oct 2023 13:33:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a17090613cb00b0099293cdbc98sm8986222ejc.145.2023.10.10.13.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:33:43 -0700 (PDT)
Message-ID: <1d3a588b-ccda-d232-e968-632d9fc54172@mind.be>
Date: Tue, 10 Oct 2023 22:33:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20230115125253.280257-1-nolange79@gmail.com>
 <20230115125253.280257-7-nolange79@gmail.com>
In-Reply-To: <20230115125253.280257-7-nolange79@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1696970024; x=1697574824; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WAS8Jplr3UTvLiHHrfw3G3Alrs6Ai7tvf1YuSoGw/ME=;
 b=Ty3Yok6Cw6uooNTNX3aAlqLPbO/RzdLvZBRw2XGbt4IebPkbxdlT4hgx/N/6CaP7i2
 DLsrhSjaVRVALOpITguLKDqYhgZHOvygxAGP+2p+C+u3QUxLwtVhg12mQ8FNkI+yo0TC
 7raLI19p5UBoW3T7Qt+2ysjP6oyxNsqsjR9TnByVL273D5xHLIM5N90JDSy9GTMudHsw
 uQATlHh4ISysxOlfLybKlIbfQrnxE3rtS4BJUnSCOWns0ROEimcK+toBD24U3/JtzKCx
 ZJezOC19pkKd7GSkVlfMbKAUDSTKO8G5mp9TAWj25/dqhGq6HMXPi9ShuaSFXy5DyH2l
 qukQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ty3Yok6C
Subject: Re: [Buildroot] [PATCH 6/7] package/systemd: handle creation of
 /var/log/journal
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Sen Hastings <sen@phobosdpl.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/01/2023 13:52, Norbert Lange wrote:
> journald will always have a runtime log in /run/systemd/journal,
> and a persistent one in /var/log/journal under certain conditions.
> By default it will check for the existence of that directory.
> 
> When /var is not backed by mass-storage you typically dont want your
> log duplicated and journald should be tuned to account for
> having only RAM available.
> 
> Buildroot will now create this directory conditionally together with
> it's handling of /var under a read-only filesystem.

  The patch now only creates the directory if rootfs-rw is enabled.

  This is actually not great IMHO - we have too many things hinging on that 
config setting that give meaning to it which doesn't really exist. Still, 
there's no better way to do it, really.


> It is rather easy for users to opt-in by either creating that directory
> or editing /etc/systemd/journald.conf.

  We really should have documentation of how to do this, and a runtime test that 
proves that it works.

  But OK, I anyway already committed this to master, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>   package/systemd/systemd.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index b96873b73f..420197005c 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -61,6 +61,7 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
>   SYSTEMD_PROVIDES = udev
>   
>   SYSTEMD_CONF_OPTS += \
> +	-Dcreate-log-dirs=false \
>   	-Ddefault-hierarchy=unified \
>   	-Didn=true \
>   	-Dima=false \
> @@ -100,6 +101,10 @@ ifeq ($(BR2_nios2),y)
>   SYSTEMD_LDFLAGS = $(TARGET_LDFLAGS) -Wl,--no-fatal-warnings
>   endif
>   
> +ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
> +SYSTEMD_JOURNALD_PERMISSIONS = /var/log/journal d 2755 root systemd-journal - - - - -
> +endif
> +
>   ifeq ($(BR2_PACKAGE_ACL),y)
>   SYSTEMD_DEPENDENCIES += acl
>   SYSTEMD_CONF_OPTS += -Dacl=true
> @@ -603,6 +608,7 @@ define SYSTEMD_PERMISSIONS
>   	/var/lib/private d 700 0 0 - - - - -
>   	/var/log/private d 700 0 0 - - - - -
>   	/var/cache/private d 700 0 0 - - - - -
> +	$(SYSTEMD_JOURNALD_PERMISSIONS)
>   	$(SYSTEMD_LOGIND_PERMISSIONS)
>   	$(SYSTEMD_MACHINED_PERMISSIONS)
>   	$(SYSTEMD_HOMED_PERMISSIONS)
> @@ -782,6 +788,7 @@ HOST_SYSTEMD_CONF_OPTS = \
>   	--libdir=lib \
>   	--sysconfdir=/etc \
>   	--localstatedir=/var \
> +	-Dcreate-log-dirs=false \
>   	-Dmode=release \
>   	-Dutmp=false \
>   	-Dhibernate=false \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
