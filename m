Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2322CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9806384294;
	Fri, 15 May 2026 13:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id faD72BnvY1V3; Fri, 15 May 2026 13:34:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF68D84341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778852054;
	bh=+I2lLDS/5vGFbCkMQeSyuVlqjS/ht0sn95BysmhAih4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LFU/efQL0pzJrzmw3jhqTwtqaaf3Df7CH6uPzMJ05dlBFBh9rRcNpqt+5tTMEdkA1
	 8dFqHegaxcHHsAhND1u+93VdavNSWUGzwDXWft7ok1jMTmKFkli3xMdn7sWu1bgLMA
	 atZf/f7NyyWG0ABjM8qphYrpTUx4qSpSY1UifQWBOhhRauuIAH8FGDGRHKsoiDCpWw
	 7FGi4Rn7IjX/MBO9jhRHr78yAay4nLd3RW79sYkCQPRgpQxotKFab/m6BpjEOjnzSE
	 AvmpU6S2jbrbfRx5daKQBWFBJkWtqXn7k8iegu7DmfMCl3pU8Zpd+y1lGCTDdNij8j
	 CH4Kdt/HhYPeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF68D84341;
	Fri, 15 May 2026 13:34:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A569736E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8B1EF40E24
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0K4lDikDNnj for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:34:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 91F1E40E23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91F1E40E23
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91F1E40E23
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:34:11 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-488a14c31eeso62012175e9.0
 for <buildroot@buildroot.org>; Fri, 15 May 2026 06:34:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778852049; x=1779456849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JXG1ek3r26NXR7bSmNb6Hs62KJBd2YaNGSJmb22LmZ8=;
 b=bJ/E+tKHWD0etunWfKPyeJBoDgaDhIBWSLiVfOZTp17+EhxDUqPdcYmhWcro8QD3H4
 wF9fW5o1em7uSvhf1hAdAoZ7NH4Y/NT2WUSRwhc6fIR94GViiRh/cOSoSyljLITKQUw8
 1SIMhJUOmSzLIqxO/ebqtfhICDs1Xm2lJiWqiM71CF6M9L/Ixi3XvSvGo8SL1Diawwjh
 ly2kFC+Vhc9ZUby7b5yB5G2LSTgAIFQ1xz2LSoV6BGECE7BubeXd6Wu+d9W7aT18zbBi
 Rr2cuimM6ArqK2s34UItew+ECCYNBZKs+O2ZFPDK7aRtfGtKjCR6dsVQbAXgoi9cyjbu
 HoVw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+aXgOc9ldacUMaY71Ix9iqOm5e1VdgOnVRTng6m3lBcM7n2y8NKNjjEgFb334kcmFkN45YOexsRYY=@buildroot.org
X-Gm-Message-State: AOJu0YwYQ0ISwg/sR2leUEdSMPppHT84HTFkf9r5q3Pq6QLMcm7xorNX
 LRuUKeF2A2sE5oml3LhHiONT89R2Ti8IdN+ganhy7r5385M7mJKX45GT3rEYsrrYg+k=
X-Gm-Gg: Acq92OE6vZh3FbZWmXBGSyhEKWXqG7rXVs6FqxQX0X26IDrdKTYMHUAQNCok5rvHZXJ
 +sPkuRTekmr3D5O4wdJwCLwDfzxwRkuxnXgAA9yddVhhNjCtsgYq3E2Pnjldn3ZO5U7RH4pXBq6
 B4UXbwl+fV5fseuxaBdgtr5bzAzVbG5zaNbgHU44uJqKf6+m5GlaxvVLX6H9osg6yOcodm9ysjV
 7wCYyEr4dp8OgMWf4l9phBjClqS/1HxChnNEGYK5+PQsQJUdZStWNDSgFOW5ivkwqrxROKId6sI
 Y2UsY/6Q6IM3gFG0JVHIiglCt4On8S3p/nh0/cJqQu8I0atecIEOWPcYDLF23rEJwrJR8yNzJQE
 vtSvekPRLbzpNh45z46dMkuMeaJWs7CXtSW+DZF+RXQzTMrJPcqOoaV+y1nwSLe6aPKniQW8TKV
 42WwrZJDBOT0+F2zSEgIo5OPUgRGOMqr+8/YDT6xbryZ61
X-Received: by 2002:a05:600c:c096:b0:48a:563c:c8d6 with SMTP id
 5b1f17b1804b1-48fe5fd4b51mr40660085e9.7.1778852049529; 
 Fri, 15 May 2026 06:34:09 -0700 (PDT)
Received: from arch (94.105.117.13.dyn.edpnet.net. [94.105.117.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a17a22sm14927103f8f.22.2026.05.15.06.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2026 06:34:09 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 15 May 2026 15:34:07 +0200
Message-ID: <20260515133407.316323-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428095056.3024331-1-fiona.klute@gmx.de>
References: <20260428095056.3024331-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1778852049; x=1779456849; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXG1ek3r26NXR7bSmNb6Hs62KJBd2YaNGSJmb22LmZ8=;
 b=YGmHUgEQUuSMJA8AfxdIzdogmI3IZUXWb+2x9mXWQzov5CVKQWzcyGrwKzXryIS8Pa
 Iye47oIEZFScf0/EbLOl0zGPxM9rVNjxny2tSIZrvgYKjwCqyOjeYKeiVxDM+AwAnTPI
 /6x6jnA2bF3ccoUbk2ld6HR9Q/XMFgqkWvsJZBNpGkgrL3Ww+wKc+36JXyVrclQ95SoW
 tbUQXrawS4FLAD650BdRYKLAIN8o3P0litOEy//ocGQmI9df8USVnILdizLFvGrGv1om
 CKqS0LphVQ37Dj/ymUV6VLtzpdjExVfqi3glT1hKEwjgcVHgR9xFVyIRldq1GglH43fL
 z7cA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YGmHUgEQ
Subject: Re: [Buildroot] [PATCH 1/1] package/initscripts: fix check-package
 warnings & indent
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
> No functional change. Add package-level .editorconfig so indentation
> matches what other init scripts use.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  .checkpackageignore               |  2 --
>  package/initscripts/.editorconfig |  3 +++
>  package/initscripts/init.d/rcK    | 41 ++++++++++++++++---------------
>  package/initscripts/init.d/rcS    | 39 ++++++++++++++---------------
>  4 files changed, 43 insertions(+), 42 deletions(-)
>  create mode 100644 package/initscripts/.editorconfig
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index f24cc77e3e..9052c88e8a 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -441,8 +441,6 @@ package/ifupdown/0001-dont-use-dpkg-architecture.patch lib_patch.Upstream
>  package/igd2-for-linux/S99upnpd Shellcheck lib_sysv.Indent lib_sysv.Variables
>  package/imx-mkimage/0001-Add-unused-fake-version.patch lib_patch.Upstream
>  package/inadyn/S70inadyn NotExecutable lib_sysv.Indent
> -package/initscripts/init.d/rcK Shellcheck lib_shellscript.ConsecutiveEmptyLines lib_shellscript.EmptyLastLine
> -package/initscripts/init.d/rcS Shellcheck lib_shellscript.ConsecutiveEmptyLines lib_shellscript.EmptyLastLine
>  package/input-event-daemon/S99input-event-daemon lib_sysv.ConsecutiveEmptyLines lib_sysv.Indent lib_sysv.Variables
>  package/intel-gmmlib/0001-Drop-hardening-related-flags.patch lib_patch.Upstream
>  package/intel-mediasdk/0001-Don-t-force-fstack-protector.patch lib_patch.Upstream
> diff --git a/package/initscripts/.editorconfig b/package/initscripts/.editorconfig
> new file mode 100644
> index 0000000000..e616e5ae3f
> --- /dev/null
> +++ b/package/initscripts/.editorconfig
> @@ -0,0 +1,3 @@
> +[rc?]
> +indent_style = tab
> +indent_size = tab
> diff --git a/package/initscripts/init.d/rcK b/package/initscripts/init.d/rcK
> index 59e9c54ff9..521e9eb645 100755
> --- a/package/initscripts/init.d/rcK
> +++ b/package/initscripts/init.d/rcK
> @@ -1,27 +1,28 @@
>  #!/bin/sh
> -
> -
> +#
>  # Stop all init scripts in /etc/init.d
>  # executing them in reversed numerical order.
>  #
> -for i in $(ls -r /etc/init.d/S??*) ;do
> +# we need to reverse the order here, sort -r would be no less fragile
> +# shellcheck disable=SC2045
> +for i in $(ls -r /etc/init.d/S??*); do
>  
> -     # Ignore dangling symlinks (if any).
> -     [ ! -f "$i" ] && continue
> +	# Ignore dangling symlinks (if any).
> +	[ ! -f "$i" ] && continue
>  
> -     case "$i" in
> -	*.sh)
> -	    # Source shell script for speed.
> -	    (
> -		trap - INT QUIT TSTP
> -		set stop
> -		. $i
> -	    )
> -	    ;;
> -	*)
> -	    # No sh extension, so fork subprocess.
> -	    $i stop
> -	    ;;
> -    esac
> +	case "$i" in
> +		*.sh)
> +			# Source shell script for speed.
> +			(
> +				trap - INT QUIT TSTP
> +				set stop
> +				# shellcheck source=/dev/null
> +				. "$i"
> +			)
> +			;;
> +		*)
> +			# No sh extension, so fork subprocess.
> +			"$i" stop
> +			;;
> +	esac
>  done
> -
> diff --git a/package/initscripts/init.d/rcS b/package/initscripts/init.d/rcS
> index de411534da..67efe3cf7f 100755
> --- a/package/initscripts/init.d/rcS
> +++ b/package/initscripts/init.d/rcS
> @@ -1,27 +1,26 @@
>  #!/bin/sh
> -
> -
> +#
>  # Start all init scripts in /etc/init.d
>  # executing them in numerical order.
>  #
> -for i in /etc/init.d/S??* ;do
> +for i in /etc/init.d/S??*; do
>  
> -     # Ignore dangling symlinks (if any).
> -     [ ! -f "$i" ] && continue
> +	# Ignore dangling symlinks (if any).
> +	[ ! -f "$i" ] && continue
>  
> -     case "$i" in
> -	*.sh)
> -	    # Source shell script for speed.
> -	    (
> -		trap - INT QUIT TSTP
> -		set start
> -		. $i
> -	    )
> -	    ;;
> -	*)
> -	    # No sh extension, so fork subprocess.
> -	    $i start
> -	    ;;
> -    esac
> +	case "$i" in
> +		*.sh)
> +			# Source shell script for speed.
> +			(
> +				trap - INT QUIT TSTP
> +				set start
> +				# shellcheck source=/dev/null
> +				. "$i"
> +			)
> +			;;
> +		*)
> +			# No sh extension, so fork subprocess.
> +			"$i" start
> +			;;
> +	esac
>  done
> -
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
