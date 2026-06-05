Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB781CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9383C813CA;
	Fri,  5 Jun 2026 12:51:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1DO-KG4Ql6j7; Fri,  5 Jun 2026 12:51:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 115E3813AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663874;
	bh=2vMNNjjCIYGYZOiQw6+ZvJ8o3/Pl2BG8CIOfnohcw0U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MmpZoU90iYpM/cHXGK5HXlzbfagawCp2+FqE3mso8dlPn/sFV8yU4d7td2ZgJvXFd
	 SKb8pT8mG/o4/ibpqJLIawI25oQNwbzikhYBj4D+tQ9yO6qGqP3T3pjeHuN1XOaYY/
	 PnMYEHMKkpoSH4J4/6t841e8L5asQXgDuqIzZia98CV4sfzDwV6Ls7XRLgwchkKK28
	 IMY7RdbXHNB4DY5mIQflgFkoHVtY4KLAZWJlitJurjROfPnLGfpSXibIQj7PtxvB9V
	 amzQD11UzegdNJA1TR1bjvpVfVQNxfu61eoOheMkO1IYWkOQdNg1yIfDsWQwirBF6L
	 WUC/l4oW23mGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 115E3813AB;
	Fri,  5 Jun 2026 12:51:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 64064F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A6A58136E
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7gP8qOl8Nent for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:51:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 302E2812E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 302E2812E7
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 302E2812E7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:09 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-45ef82204c6so1051084f8f.3
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663867; x=1781268667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HQSJ0nweAWfac2gfTwT+ob0XdJKwR4/0Va7zk2T9gJM=;
 b=GnLKfg+YrYg5axD8nsiC5D8db4EhLeHKLqSZqS6Qkt8BBOWI6voeWu9/TdOr0Txjq2
 8WI2n+A7YpLUGjMAlDp+f72fiCPW8pQmScAW/hMteC2cLe9IkWvydTIX9o5MwBt9Iaiy
 lAeUsyY1cMtiZm+gxXKCBqUQ2aqh+WglSNJdK0JxxEUsYNf812gDa9Tz47fSADrxx9R5
 sbHDgnGKrd6pf9vFlmx1pG2f7tAqKLE6gQXlaG6jrT0IoCbyroC+XvOFbYwN3j+bKt5u
 aO2RfYTww11FzmDVBrffT45D2SmbtZnJ5U5BaRn2UFa0EZjOyXvCW3t6exmpoE6+rq+R
 XsWw==
X-Gm-Message-State: AOJu0Yw2v+5SiEucYfsCUNVXv0DijCHUk6zobFOr+Bm5iWg3nGS2PV58
 XChVGxLp+FPb0vkTX+Uy/Q0snRLWjZl6ZUNnhOsNadQAn78wyCLlOagM3pRjjSFlYgael5zcohH
 4jp58
X-Gm-Gg: Acq92OEyXulvYYLgmKnLAa4Pkx8M763N5zVxhIXmQLOWuTzgymgAOMg+9yZIAxTF9VG
 WeJ1P6vcPIZAiZshD3BgLTVmyXbmv1UFmWv5fQHch7cC+pcmzPVBBqWbwIpK2PbO4SQyhkARuq9
 Egj0diPVWW4iXuGYHmgo5RzMfy1+vCrY1Nb7BS/Zuiu4Tf7EfFBeOthstvB8snq4ORwW4WytvkE
 0DA3SS/r9xhZ/9ZgIbfOhzbDyvo6PHPyTxn4X28oN+8Hl226xqqyv1lUAVvYqzNOM14QGXDT7SW
 dWKmTqXEbI529l6hv3cF4ZHW/jJr9LWuLG/J+eh3M73OswQ4V0iODx2XvUh2knus+Q1ft1Va8yB
 GF3UqecofDL0H6pgk7LiEE/vXhMQxa5uF03+DFrm7X+oSnzNMhmxj0kbU7yW6FFt3X6Pp3r/nNV
 in9GpCqQ5MwC8Xs59e/LFHFnOF6A==
X-Received: by 2002:adf:e406:0:b0:45e:eae7:7f4 with SMTP id
 ffacd0b85a97d-460302e32c0mr4350527f8f.11.1780663867223; 
 Fri, 05 Jun 2026 05:51:07 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f3529e0sm25880170f8f.28.2026.06.05.05.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:51:06 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:51:06 +0200
Message-ID: <20260605125106.275301-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529175156.572429-2-thomas.perale@mind.be>
References: <20260529175156.572429-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663867; x=1781268667; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQSJ0nweAWfac2gfTwT+ob0XdJKwR4/0Va7zk2T9gJM=;
 b=QpjBv+bNcMxnFVOsOLJP8k1IRNE2Ym9hp0XBmljEU1UikLoKzuCMMXmxBeUDxjA9bB
 KzIQSeK1EfDpcJW2UBSDN5z4y46VLhzE0/eoTfkiC/lXncHGsst2aHAn0V6WxRRyjLVU
 Qt5ZU55tupP26+YyfB+mglG6Oy3WDvN0Q/0cPu4e/aEQPwgsJi60a1cSQ7/GSl7AuN9e
 5VBMjR5d6s/wzo23RrG8hxm6qOWAuLkJ30v+t/dLJjqPdObbamlt/a/wDUuLAMpaIQUp
 7C+V6mC7n3YqjqA6zcOrfSG+itqbmB8Anv8lvTv8LY4yCv3fNNqxNAYVjxxsq1PGh51H
 xWsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QpjBv+bN
Subject: Re: [Buildroot] [PATCH v3 2/2]
 support/dependencies/check-host-cmake.sh: verify version argument
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
> When running 'make show-info-all' without a '.config', it is possible to
> trigger this script without passing a version number.
> 
> The 'show-info-all' target is special because it forces the reading of
> all packages without requiring a .config, so BR2_HOST_CMAKE_AT_LEAST is
> unset and the script is called as:
>   check-host-cmake.sh cmake cmake3
> 
> Without validation, the integer comparisons below would produce errors
> like:
>   check-host-cmake.sh: line 37: [: cmake: integer expected
> 
> It's possible to trigger this by adding the following file somewhere in
> you path:
> 
> cat >/bin/cmake3 <<EOF
> echo "cmake version 4.3.3 CMake suite maintained and supported by Kitware (kitware.com/cmake)."
> EOF
> make show-info-all
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  support/dependencies/check-host-cmake.sh | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
> index fadeae9f6b..ab577008c4 100755
> --- a/support/dependencies/check-host-cmake.sh
> +++ b/support/dependencies/check-host-cmake.sh
> @@ -6,6 +6,18 @@
>  major_min="${1%.*}"
>  minor_min="${1#*.}"
>  
> +# When running 'make show-info-all', it is possible to trigger this script
> +# without passing a version number. The 'show-info-all' target is special
> +# because it forces the reading of all packages without requiring a .config,
> +# so BR2_HOST_CMAKE_AT_LEAST is unset and the script is called as:
> +#   check-host-cmake.sh cmake cmake3
> +# Without validation, the integer comparisons below would produce errors like:
> +#   check-host-cmake.sh: line 37: [: cmake: integer expected
> +# The following lines checks we have a single digit number from $1 before
> +# continuing the script.
> +[ "${major_min}" -eq "${major_min}" ] 2>/dev/null || exit 1
> +[ "${minor_min}" -eq "${minor_min}" ] 2>/dev/null || exit 1
> +
>  shift
>  
>  for candidate; do
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
