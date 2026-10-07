Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4172BCA5FFC
	for <buildroot@archiver.kernel.org>; Wed,  7 Oct 2026 11:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDF42606B0;
	Wed,  7 Oct 2026 11:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0TXXZonHM2PO; Wed,  7 Oct 2026 11:15:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C4A4B606CA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791371732;
	b=hI+p4PHsQFjV0xHFNOFPfCX++QB361J9gmIr4irkdwhvjPOVr4C7kkKlMZ+qsf2tCiJa
	 epZB7WRcRqnfBSBcwJru3r+ehhIw4cGKcpt3h5GMWBHPB+qfn4AlE3jj+avLiAzvjnseK
	 AQUyV/01OLrAGOTr4vzWmkLVtXewTUnpoM0Al/KVoZDwW0xOvVNQPlUnQhu2y+0nhlWkQ
	 d8CkWUj+LOZ+E7SEt1vJFWtvFOh3/2fceQsniWLaK4GnQ3Gkn0P7Ai/6xYjgH/OuCug8c
	 VthAB5AYJl8gJ8ve2VAsr4IODIra4xfoe87WM0tg79WaKwLa4J/n0QaEoNqiD6SaKnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791371732;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Date:From:To:Cc:Message-ID:References:
	 MIME-Version:Content-Disposition:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FCpfOs6drnY0RR6/xo6b3yyCdRLfK9Np5QEJnIlEyYs=;
	b=lrXogBkYrzDHihT0kwTMYLts6dr51yRXGX3v9D4x2d3r9xwDh5Pgrazuuc+09Bap4K7O
	 0uqHwdHYvFBE3VhCsGODJAVJwbKODHlBxGMR5I2+Nv9C6Q7yOpNKhDyTNnqE90DhIIl3v
	 cjZzDbUD7dn57soyqnzfdLiPFu+dqTI8b48jmVbBTYKJo2tlXN42aEi/e/eHkeQ4lJIn3
	 nN2B0NB8URbjfKAwnxYwIjBFHmYFW7Hm04xn5ZhhD4D+t0YwPr2JWcE8PYTaURCg/RCnU
	 HtZUF/b9gS1z9KHaCLILCRen9GGK5WXKaLYHAlFauPolxkej5c5PzfvLcmpFb5YNyWQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791371732;
	bh=FCpfOs6drnY0RR6/xo6b3yyCdRLfK9Np5QEJnIlEyYs=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KpOeMP5TTMOmgx0XZ9K2uRqElSLpbVKaXFZiQ38esDXMQPxihHB25HcZOpHBCoUtl
	 1w27Z18vW47vScbpC50aHl6hFoTxkqjbyNmuNpoQbIJ591CvhieZxVJ1+SlnucgXHR
	 Jvwxse32uVCnSHgQz2WZ/Lo4oQrrh2Cu54hd0rRdLSWV0hgr/U7Z5WlYLFYgbSoAOw
	 zum+FstGBIK9rsrvb5XSVbRyQOiejzLFhFxY1cfWTbaIuNfvl7b8+5AYfZAtFSndfR
	 AlZL9tblpL+47kGWmlP/MCN4wRzJ04Em8oLKAzcVCflGouZLGi8LZ3OaQ863aR1liH
	 3VJ3NX8SqcAcQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4A4B606CA;
	Wed,  7 Oct 2026 11:15:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 594CA22B
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 11:07:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F38140080
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 11:07:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 71weTycypZnH for <buildroot@buildroot.org>;
 Wed,  7 Oct 2026 11:07:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 1882240057
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791371244;
 b=IyF7RWaAyqxlPB2yP8DEDavaOccTHgFJvZyVEWt0AHBYv+5qiHeOiVZnNSM7YeCXwzz9
 Z37gjOGaWNHk4TVWo5EJ0S6i/rI89wlN7c/aLJ2O1eqOt44DhkiUJ4XK0gEPy1HGc2qLC
 c3Whm1JRADWAwNf+A/iHPh2YSKp4LgJ/dbLq0fyn9C4lm2WZrW7zp0jKSDQEyz0N5YH2n
 uVtyfLzS6E6sk79SAW4d/QXiVEqEqLtbpdeEbX7b5Q1oyZGhHVEYUY5Z7aOho7GG6Tcjo
 uaZxHH92wfDZy7D1xQFSdK4BcYzKpqEyTHY6DtEmtKVWg9Vpo0vjC2ottCBsS8/9lEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791371244;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=nuKn91qxNRc89cXJrw0XdKvpYgtI7DcIk2+YRGVOZ5Q=;
 b=PuPi2R62V72+ndeQyAQ4cwSg9vbSdGM0vmAb2fWP2hsRUq+fY09+xCLnTO5shsfEOIJm
 NbZ4NmLhSvMqUl1tXX7BE2alQm5Szxesx+ld/neKjKlxPjIsUzB+lbdb7u5jzRC29Cnot
 lUzb4vbpwqQwcbqGIKfWdIQODwjHM3am68BSCnBMcFSFZzKigTCeBA6XfckXrc8qUNS9l
 xou9eOU+QGUbFth8o+GW+DaX6q0wlCUKqRQRpVeeWc2dm+2R/CpwG/0nzblLMz+WDv0h2
 QBd66TTL519OYP0e4gdtalwRej/ynNX8O4AL6NUK2lKIOspnIZmzPDl25+fU2E1/FXw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="pY/99WC/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thecharlesjenkins@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=pY/99WC/
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1882240057
 for <buildroot@buildroot.org>; Wed,  7 Oct 2026 11:07:21 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso11254925e9.0
 for <buildroot@buildroot.org>; Wed, 07 Oct 2026 04:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791371240; x=1791976040; darn=buildroot.org;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=nuKn91qxNRc89cXJrw0XdKvpYgtI7DcIk2+YRGVOZ5Q=;
 b=pY/99WC/OdKAMIkaT5QS5nKcqy2ENmaTF9MuMHheMVvoZwpBF4qOs9d9tuBB4JXimn
 ScfmCiv4jn7rDfug2ZaTjF+wL3/dOU08btNpPvhnznTfe4jdIpUUduJeKuDrum4538cr
 NNe9Y+MlS2PLPRwkllMS4ht9nP9IdVGMKzxFbwSmuqHj1hZ8F1nlyCSbQNpYnXmg6dWx
 oGh8Ni4lP5AYaexvOdTfpQmYQo+RPeDVg1RgzdmqddKqr0CEXZQfBVeIjI3OW34vJc/P
 z26NlGR4//YO+/7jHAKY79AlUvAzch2n/5G+Hb1O6xJ0Z79Cy6sthj7YqOdHO0PCyEva
 43kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791371240; x=1791976040;
 h=in-reply-to:content-disposition:content-type:mime-version
 :references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=nuKn91qxNRc89cXJrw0XdKvpYgtI7DcIk2+YRGVOZ5Q=;
 b=gzmJ9q3ft7t47Xqmh0uHMZi/GxjBi8rO6D0m863Hzs0aZ/A/yEtgDZS6qu9NtEOBWJ
 O+C2ThVwYUPOLm5VhJBYmZFGzNK2CEbgxvhG3rkmABROk+3oQ+H7J7HhnDqR38nBIxN4
 i7cnwQF9OF/aW5p9uETPQ/JAjuZuHjOIl1H5pVw8kRSTZf+aI+4fIZXB09Hv//n1LEcZ
 iQQlOyxvq/Z+jwv8Dq8GaOmfiZJxBHHFyJHVXSRgYievPUSZQob/Pprw+Xsy004xQuKc
 stmhxHEo7AehceEkMZamIWHLfZgG+a8TnN1d4OYClnHWEFRsyX5yBNluJSubcFXzj1jN
 io6A==
X-Gm-Message-State: AFuF++nwYtXKJHMyLu1xKVN4Ms94mHGbMJ0ewvX4t9Kcp26cITSsn3fy
 nciDQi29f5SWPD59t3Zo0wVXTUuyhpzXhCUauxFGh6wta/udlM7xBI02EsnMtfRb
X-Gm-Gg: AYBFou19JPNX4NXcZtFe9nDt/0Fk81qNsBgS5CGZ8ofFJW9yRsGQ1yZtGKcFJuwI5Lg
 oB+HDOcBS7MuTOQsBFhdAQrbPxAr9VmQJqsZpl3/fD+zr2yX5+CrP4SuYQ2ZUYx7EmKKvPyCUxK
 f9SI7vYknVHJQZJq2LcUjeS81eWWXmWAsNzEbUf/vSE9idvbR9H0zjWoLizC8RZJhvrvHy1sxhB
 pNoAfiYFJoEo0NvSKy6ciSTkvDWbNm2pxvdlNzmz8avnMNG4xb/bPO9Dj24QvYa+Z1AGnd4zYH3
 qGviBOxX2QsZ1UxJHWT698c2qY4RRMNszbu0vKZdvWkR6fczWGNEwUkLiFrtIyPHpqZyQYojUiI
 9qzyVWqQVGgD18hspL3xeDAwArrgSge2fN0TM8WUpJ84L+IDpX7vZB2FryDqVu9dy1lYQp6uE5m
 S3v8hqEtM/ZP/hcFqYARCMcWwPrLBKnbQ7qIBOciYhmX31AUFdgF3Nto7zKcwuQVVYHiEnMmDGz
 JUvAJR36rqT0Rcey6OzzkAzz+dgr+g/+4ebd7qh7+aGxmquTVpA4gumgzRdw8U=
X-Received: by 2002:a05:600c:8707:b0:4a0:1b14:d009 with SMTP id
 5b1f17b1804b1-4a1800cb098mr32981115e9.1.1791371239580; 
 Wed, 07 Oct 2026 04:07:19 -0700 (PDT)
Received: from blinky (90-182-211-1.rcp.o2.cz. [90.182.211.1])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a17f51beffsm64746245e9.2.2026.10.07.04.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 04:07:19 -0700 (PDT)
Date: Wed, 7 Oct 2026 04:07:17 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <asYn5Z6J9aX3h1tS@blinky>
References: <20260727-perf-fix-v1-1-6bffb9146263@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260727-perf-fix-v1-1-6bffb9146263@bootlin.com>
Subject: Re: [Buildroot] [PATCH] packages/linux-tools: perf: explicitily
 disable rust if not selected
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jul 27, 2026 at 03:03:46PM +0200, Bastien Curutchet via buildroot wrote:
> Since kernel v7.0, perf uses `rustc --version` to know whether or not
> rust is available. If rust is installed on the host, this `rustc
> --version` works fine but then the perf build fails with following error
> (on aarch64) if the host-rust isn't selected:
> 
> rustc  /home/bastien/embedded-linux-imx93-frdm-labs/integration/buildroot/output/build/linux-7.1.3/tools/perf/tests/workloads/code_with_type.a
> error[E0463]: can't find crate for `std`
>   |
>   = note: the `aarch64-unknown-linux-gnu` target may not be installed
>   = help: consider downloading the target with `rustup target add aarch64-unknown-linux-gnu`
> 
> error: aborting due to 1 previous error
> 
> Add a dependency to host-rustc if already enabled, explicitily disable
> perf's rust part otherwise
> 
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
>  package/linux-tools/linux-tool-perf.mk.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
> index 3238948d76..9718d83121 100644
> --- a/package/linux-tools/linux-tool-perf.mk.in
> +++ b/package/linux-tools/linux-tool-perf.mk.in
> @@ -134,6 +134,12 @@ else
>  PERF_MAKE_FLAGS += NO_LIBTRACEEVENT=1
>  endif
>  
> +ifeq ($(BR2_PACKAGE_HOST_RUSTC),y)
> +PERF_DEPENDENCIES += host-rustc

Even with this dependency I am still getting the std error. I am
building for riscv64. Does this resolve for you?

There is the Kconfig BR2_PACKAGE_LINUX_TOOLS_PERF_NEEDS_HOST_PYTHON3,
maybe instead of depending on RUSTC when enabled should this introduce
an option similar to the python option?

Rust is also only being used by a linux perf test case so it's not
really even needed for regular perf usage.

- Charlie

> +else
> +PERF_MAKE_FLAGS += NO_RUST=1
> +endif
> +
>  # We really do not want to build the perf documentation, because it
>  # has stringent requirement on the documentation generation tools,
>  # like xmlto and asciidoc), which may be lagging behind on some
> 
> ---
> base-commit: cdeeb9b9c688b5bcdcc80bf89f2c046b0bd55bb8
> change-id: 20260724-perf-fix-f14d1c7fb681
> 
> Best regards,
> -- 
> Bastien Curutchet <bastien.curutchet@bootlin.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
