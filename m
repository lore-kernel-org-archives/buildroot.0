Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C627FCC068
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4436942074;
	Fri,  6 Mar 2026 19:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0zfoR1PQkat; Fri,  6 Mar 2026 19:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB6B64206B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826802;
	bh=0DFhanHb73KO8L46fOcuh/8Z0oEtoxOmQ1/x8LX+KcI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bz4KfDykDs9MQPowwbahlljtopBTi6zBAwQudLXCpGO4cPZevaCwQXYq5nM7fRqnT
	 Kxdj7LaQZNbuCb331t6Fw7gLtjmIp3mwfyioGQmEEop7qhTUlHCmyc8UsLBmBpDBmG
	 71tkRd8CSW/TN6P9XhD+YJffFfOrlYg29HWMTuHGKLyLEdIuLpez4+sNBYfcPtRXwZ
	 92zVZSgFKD9AmtnLGDl3CGEgke9EQ06erj0AIMWoqLu75gMV7KjWClO5BK39hZZLb8
	 rUOWWssNdlRYUpap4iQSs7VmT8fYyv9ZuiZau1aDO7waeN6KXe6MPLkLywU+SCUn+0
	 M/psz4JDnB2pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB6B64206B;
	Fri,  6 Mar 2026 19:53:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03022223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E909361498
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5r63vA5NqXli for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DFF20613FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DFF20613FF
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFF20613FF
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:15 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-439baf33150so4617479f8f.0
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826794; x=1773431594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JbkDJSASqesRc/UpnzbvID2Z16GIRrqHHvMztZEpDB8=;
 b=THLg9xYWjP3l52UaAepT9M3A79/IklQyHgkshCtaFP/eMRj3ou3BHOdoNSzJSD+PCx
 jOQnjLIxGrh//KM7U7AOayt2u845oZxN3EFgjltowNkBqE7jAjOij2ktZtzUZkkwBo9+
 gceln4eTZUiEj9dlkk+kOTagcnlt0o+IgYVBIqg70ldERYYTGoYqRAusQsLs8sNK1ovM
 xxU27d6oYSWGlHMLKDZGhDOT+G2/VVLg3ovGhN1kHarGrPN97S4u7fL+X1iRMdZsJTDJ
 QYejpmFpugdhRuaprp1zp6aMAr1SRzKeF5R5p2QHW8LExRM+nRfTOYulrqCIygKriMrG
 yfyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKXiEzADW1xmXmRf/ceRgXhUErVXnn18rJuS4xJhgN9wUBQv47xzopREyQWRDNndgU4qeBWpiAC5E=@buildroot.org
X-Gm-Message-State: AOJu0YyOxkRhjdfptT8y00LIz6zIHg7WYXl5K+42T6syxKLru8SJrOBa
 URZsHBXMuyNylg2H5gYD+9vov9uow7kvfmnVFXxkT/TbyxGDCyAhKq5HsLCWGR7hBk7WPdyVoOI
 82eaI
X-Gm-Gg: ATEYQzzRq0XuBrC/Im52XKVCkp/UjPi2bpR/pQQdw+DFCMingMAUNRCbVkrhGJD9Zy3
 AaXxuBunhIN7OMiEW87gi5Dsc8uMfRLLzW5tzABFQ/gVF7H4zYsjxuGIrgm36r/gUAMD//SGII8
 zoJWg898lHEYtnlcbNINDpXeM8y4VYHsTfxckUW0KVTfkhPTNTXFfc7XuSi0z4Y9y1XknnEynfg
 kyG/leVm11VIGJEhbAF3Gbv/xB1sltiMmB/pSeY8QSJ+xgw0zagQryDz268bCH1jp48dSB/4K/+
 D+adJa/J4n7k7Qx8vOusAG1h+bCj+1dn9phH/zXqTeoR85WBsOzFH3ybT7onsHgYNpxiSuf8UZh
 40XAsmNUsMRGjoPh6OdOygJt/L7AgJSxtnHZ88ORZ2j8mm4rfTzBweC7Qs21y25ISTVibyKCiAh
 f7U9IddPK/YwhZ0cI=
X-Received: by 2002:a05:6000:4009:b0:439:c4d1:8735 with SMTP id
 ffacd0b85a97d-439da556c6bmr5854477f8f.20.1772826793848; 
 Fri, 06 Mar 2026 11:53:13 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dadac2a7sm6031918f8f.15.2026.03.06.11.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:13 -0800 (PST)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:13 +0100
Message-ID: <20260306195313.7856-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228215636.3939665-1-bernd@kuhls.net>
References: <20260228215636.3939665-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826794; x=1773431594; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JbkDJSASqesRc/UpnzbvID2Z16GIRrqHHvMztZEpDB8=;
 b=Ui5XEC9ytxfwjOe9MrLoVbAF3G+9jiyA0Unu1CFo056OiJCwyshilM4Cf8FOyJqghy
 jUuaw/noW3Pnh9RkLJGvy4XbiluX9GjVaY+jSyDCQB1sTd+M3fRq9wxK8kq4dWGCcb/W
 elBmi24p0bXxD5H/DhDeU44CN0ExBwuFyRQwrGT37CXn3LIJ9vUhGaaBcktr4iUvh64E
 mG3qIqlKZ0qvBUS1m/5Tlr8LF4VbYokXQapBERPiEzAD55nowHRIFYCzXHL3fuM+EAKI
 nNIoSu2aVwNTATkJKAK1DsBYPBAkBU7Vu/zYBSAe/ZEVyNWPT7lXx0qWDEW4g8Ew7RRY
 dJOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ui5XEC9y
Subject: Re: [Buildroot] [PATCH 1/1] package/poco: enable parallel build
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
> Buildroot commit 126162b9159a185ac1897db1a9956f0379fc1428 disabled
> parallel builds in Jan 2017 due to a bug which was fixed upstream in
> Nov 2017:
> https://github.com/pocoproject/poco/commit/1724e8ba53d05ce688dcdb5176b128f116af2682#diff-76ed074a9305c04054cdebb9e9aad2d818052b07091de1f20cad0bbac34ffb52
> https://github.com/pocoproject/poco/commit/076dd9679bf2e77f1df219287f0eb42ea36b7371
> 
> Building with -j100 worked.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/poco/poco.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/poco/poco.mk b/package/poco/poco.mk
> index a471a24adf..fe1dd29855 100644
> --- a/package/poco/poco.mk
> +++ b/package/poco/poco.mk
> @@ -77,9 +77,8 @@ define POCO_CONFIGURE_CMDS
>  		--no-samples)
>  endef
>  
> -# Use $(MAKE1) to avoid failures on heavilly parallel machines (e.g. -j25)
>  define POCO_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
> +	$(TARGET_MAKE_ENV) $(MAKE) POCO_TARGET_OSARCH=$(ARCH) CROSS_COMPILE=$(TARGET_CROSS) \
>  		POCO_MYSQL_INCLUDE=$(STAGING_DIR)/usr/include/mysql \
>  		POCO_MYSQL_LIB=$(STAGING_DIR)/usr/lib/mysql \
>  		POCO_PGSQL_INCLUDE=$(STAGING_DIR)/usr/include/postgresql \
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
