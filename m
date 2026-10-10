Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A37ECA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FA5560ACA;
	Sat, 10 Oct 2026 09:23:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PWIdHJvo9bda; Sat, 10 Oct 2026 09:23:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 401D360A59
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624198;
	b=mS9F3J39JEg/f/0JxDWep+LDc1gtVfJj11Fclpk+Dn9KT+ejKN1wX5dQsnF9uUJqoUTs
	 0yaaubRP2gO9VrjVJGX/enLq6YbHt3GD/rqlCULkv+TdEE6FisGs7cghDP/EdM6BE7OLj
	 Pu3U//4qDkRRWycdzd+trvzA6VJlQjDWrLts66Q4xxQiC5EGdh12+sFC3M3F8KjBmJ/zq
	 2dtTfobOwsQ/uuN7x+PenMQzMhnSw/CKK6W0o59rmrYPVBXgG8HqTuu8XHTkmOvhDWfmy
	 bFyphysa20DlC3PHZSgryqf6amgJVFvNwdFFqucTqS+v2OxXayMuEXtp1gcMOmvMJag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624198;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=3cDT24AYM/WF2Mdn6CH9YFgC5fLSWXVr4hFzWTuU78Q=;
	b=fTFkkXiTAer9wAoZTt4MT06PYywo6s/l9InYbiD3x63jIhDDD1K2rUPHkJTnoi4REbfl
	 RyMtEF6Je5TXXvVsEe59zF45xvIa9g6dat0mGMQd5e2r4o+td8oqhGozqW3tSXSoatvGC
	 LY4mOoyPszwWq47nnJY9NieDYIztNXls7hNak1AA4j5W1VCh5TnqX38Wtv/Ggq7z/xxcF
	 d5fZEZTPyaoOia9blnb5rz57UfVZK4OIpOr20WGNcMDoQftJSK+N0AauC2Mof/pzSjgug
	 6jtViwXWemdbK115Zab1y2h6fEQoewAJZk31l9XU5doaLfRN5n2exDGqFapL78bLnZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624198;
	bh=3cDT24AYM/WF2Mdn6CH9YFgC5fLSWXVr4hFzWTuU78Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AfdWxlJcoTYzG3AWz+b6qqj2og8J3dWZluzekg0H/IkfmsMo0CU53XsBp6+yORGEQ
	 yC9FiDC5Uv2JfGR1KIXHfUYgwPiRiT3mv8ho6sZ0gjRDOT5Jn4cEqobW/D3LJcWXzJ
	 AtbrTbHZoS54RQz36uW+wiLeSqE/FCAdzWz5d///6Ct08gWQzjsv1AZmH0Hun66zQV
	 bwK710C6XcAg6torYZ1ZN3hBTdbHrclN0DGgb7k/hKI5y0S0vEqtKwsaTy1fmq29sV
	 6EXZfJz8wNqcKBZ07P2mYOAR5ORZvo47kN7ZTwt5gjLhqZYAeOJMbhANBU6siaJq7I
	 FHnRM7GCyfKQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 401D360A59;
	Sat, 10 Oct 2026 09:23:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 244F375
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21FBF40518
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BoslZj3l2y7d for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:23:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F08044095A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624193;
 b=DEhuUjjF1kr7WclrJbAug6PRcdZo2YmmS6pLQPFxa4hd43RI79ZKvIIel4puv15zYCff
 cMv0uVVfRBS8peZ0IzeVwywS2TcqKgVjJPOx3nyTg4n3ZKgpgCOR68WXRgCD1nUDJnEu6
 Ff2UT+NNR0HMs+bW1CcPe69BzLIi/0TbzjzaB0bvEmQDEWhHiZkaq9cedZ3JGBdZhoXn/
 D3fjxkBqfVeiLaVnGsWOlhr1Pd0lnwVGOoP6Ldzq0fbP8T74JGvppk2kfS2RQ9T90J5Wg
 cI+9VQ1F/su/rOw7wG7c/cUmELMJoPvkC1y77cnLrKm99TFL3ComI6o4PdvZ4PZ8shg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624193;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=bjRlZPFH7Dtf7R+RN2caNw96yLFKjtwF6/nYRZWBhck=;
 b=d9gQXc6BJSo4rUyfeDgk5eTxjRBqxkiAldKaQDQmFQL4g9Ifo0WdpGs+ftjWG43Yc4zF
 20u4WxpJt/do4kzs1619C7FeJ0XM+0wYCPAaAn3vtc20N98+6NCzxyiRW8J4Eq87UjOmH
 aAz4R/6TgNULzCkPzGuo+7vCCkErjatfBC7URR80X3xgWN8C2Kteip83QgO5Rt+5tSobt
 4HBzwpjbjNrwshyklJS7EDw/Rb7tM/HTP1pxVMHvxv2PWU/dtX0hlNm0iaNc1iaAVt4/l
 JcWCqfR6CmRIljFZaJat4olf1VYvAgmSBvKzVfAOetgTTET6dPyY7K7HPtvbHpImpnA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=DCLTAQM6; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::436"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F08044095A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:23:12 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-48c411d6615so235409f8f.3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 02:23:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791624190; x=1792228990;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=bjRlZPFH7Dtf7R+RN2caNw96yLFKjtwF6/nYRZWBhck=;
 b=Lu5t3tjXYKZp5TMf3bjzh0v9E8ENARlaB4MSAN5fDd0wwUBcTxBfEP2+ww7dnqnyl9
 m1+HN9FbR9grbN0ACtTFQU/ulD47m/lQnmHsp+oCmAfqb7hcOoU2GXNx1MHgEwEq4cun
 BZPF3jw0B6iEqdhfEjy46Eq9RsTtFMTZMnEgxxEvHWCUZRuwIOCtfEOEgDXuPSgGAFti
 pUKnBcxraRNhneBEg8C7YtURYT1O68npB9mWvgbbzbqI2HxPDVuCIYogU0DPmvAieZ9w
 fuMRH08FfNC3Lwoq/Ax8kzwJknLolUeolc/o27hpj3dTMhVGz15+5eN6x2yt450uudWE
 m+gA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwDIBaG1jsmF2Q1CvfEmsKcbS3gcK16Z546qxkDAhImpuzqMS/CHew4YpzdZkF6S5qnkegYWk8ZfGY=@buildroot.org
X-Gm-Message-State: AFq9FYKr7soq+LBw8DKeNK96gIntNPKiCA4Qid+coXc+3tALr0XisxOv
 t0EI9xKOCTHXJeQlgmQ9MZI5J6MRruPhivCjNtid+vRT5lUXsCHHc5B3UdTIvo5or4Q=
X-Gm-Gg: AYBFou1du6gWjFhG83LT3TBul1/9leJjifwjPNGinCnPAn94WOKPPcykQLEoadIqq45
 9tpYxzbzsnyp/EaL1aS1tSZACRL7adpFbLmzbJ3vHbbTIFn1H/DRfQ/A3Ee5bxHlj4eMZjCe6EE
 paGjV93YpD9vmPJDUErLkEmo6zTbo2PwSB5UqoKK/tmlaZRegmtRTwmDOH2S1BcivFrBXQvQ1fe
 lcXuGA1FUWC7OM72E2YLAj1RZoROUT2qXawUTeFyTdJaa4HO0qcBqXG3ExBoX73xRCtmrv9TaOi
 Fi9kDdiYLhmv82aqluYWZ+by8VsuQq9V/JKXQy+sY0WaW50xMwosTl6Mg6Yprr6I0JBx6lmlRlJ
 RgsPwqKJDYm/mK5IvXwm2FnT4fYOveTiMK0ZnWXQRufRwmOZsLg+3U9wrs3FbKkcwKNWn618zy2
 Tx7AkZbSUCHMUJrrzhVQqAyEaEuk1K3hrvtPh4dk4W/sf8/Zs7Rg7vKld4a3gpa1qLRpNXpkgM6
 OGE7KhpYynX/30NYMqOiSmI1OUaYn1vU4Zw74XTbcZb46Wo6wEHeDiP
X-Received: by 2002:a05:6000:2505:b0:485:8a47:5b91 with SMTP id
 ffacd0b85a97d-48dbacf6fc4mr7059484f8f.46.1791624190506; 
 Sat, 10 Oct 2026 02:23:10 -0700 (PDT)
Received: from mindpad (2001-1aeb-401-dd00-f938-e455-e8cc-7064.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:f938:e455:e8cc:7064])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db94e3519sm8708146f8f.16.2026.10.10.02.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 02:23:10 -0700 (PDT)
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Sat, 10 Oct 2026 11:23:09 +0200
Message-ID: <20261010092309.139183-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924131533.2302137-1-yegorslists@googlemail.com>
References: <20260924131533.2302137-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/swig: also create a swig4.0 symlink
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
> FindSWIG in CMake searches for swig4.0, swig3.0 and swig2.0 before it
> tries plain swig, and it searches the whole PATH for one name before
> moving on to the next. We only create swig3.0 and swig$(SWIG_VERSION_MAJOR)
> (swig4.5) symlinks in $(HOST_DIR)/bin, so a swig4.0 installed on the
> build machine, as Ubuntu 22.04 does with its swig4.0 package, takes
> precedence over our host-swig for every CMake package that does not pass
> SWIG_EXECUTABLE explicitly. With CMake 3.22.1, libftdi1 with Python
> bindings ends up with
> 
>   -- Found SWIG: /usr/bin/swig4.0 (found suitable version "4.0.2", ...)
> 
> Also create a swig4.0 symlink, and update the comment accordingly.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/swig/swig.mk | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/package/swig/swig.mk b/package/swig/swig.mk
> index e277f5049a..4dac64dadc 100644
> --- a/package/swig/swig.mk
> +++ b/package/swig/swig.mk
> @@ -30,18 +30,19 @@ endef
>  
>  HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_WRAPPER
>  
> -# CMake looks first at swig3.0, then swig2.0 and then swig. However,
> -# when doing the search, it will look into the PATH for swig2.0 first,
> -# and then for swig.
> +# CMake looks first for swig4.0, then swig3.0 and swig2.0, and only
> +# then for swig. However, it searches the whole PATH for one name before
> +# trying the next one.
>  # While the PATH contains first our $(HOST_DIR)/bin, it also contains
>  # /usr/bin and other system directories. Therefore, if there is an
> -# installed swig3.0 on the system, it will get the preference over the
> -# swig installed in $(HOST_DIR)/bin, which isn't nice. To prevent
> -# this from happening we create a symbolic link swig3.0 -> swig, so that
> -# our swig always gets used.
> +# installed swig4.0 or swig3.0 on the system, it will get the preference
> +# over the swig installed in $(HOST_DIR)/bin, which isn't nice. To prevent
> +# this from happening we create swig4.0 and swig3.0 symbolic links to
> +# swig, so that our swig always gets used.
>  
>  define HOST_SWIG_INSTALL_SYMLINK
>  	ln -fs swig $(HOST_DIR)/bin/swig$(SWIG_VERSION_MAJOR)
> +	ln -fs swig $(HOST_DIR)/bin/swig4.0
>  	ln -fs swig $(HOST_DIR)/bin/swig3.0
>  endef
>  
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
