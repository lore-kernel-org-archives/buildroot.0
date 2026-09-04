Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE52C79F87
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0A2E60DA1;
	Fri,  4 Sep 2026 12:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aopMm0psqO_c; Fri,  4 Sep 2026 12:19:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0DA6660D89
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524336;
	b=lrKE3OgRr+u+p1UQFMb5E9JcsyofO9woSJsUVujxfcnhJ0ebibTxn2k1lP8q5Dl7w4Yo
	 39UDWjRFr5g5oeJqFXaJV8WrBYKW7bBNW6SUBbC4G3hAM2fkqlk6qbLTFNBdgyouyl1+9
	 iJbISQbEnZO8MwYxw6xVvunuAfHKkhkS7oCmF/xk2OEkjJjyW55+T86FKEyczJYomtSrP
	 bI+v2L+IoPBDnglzlIpq476pvM+WJV/40M/7aWH3E64T5geBp7qFpyLtVg0gIDiHRWWad
	 j5r9FqYn+5vBIs/tX9d0YZh8VwfUxZQx4VIudkOCqbW6WQTJynltbdEEPBTMlZlnIRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524336;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Q7ThQKrJrUK5oMYJBq5fhreycz/VI8fNer0LVsOfblk=;
	b=ri0d38+LM0rE7YOFXwrcPk00BYko+Jx1KUGoT2eJWld1sLFrdIyUTfQgZPNLgMSEs697
	 QiTIt2WZGmkxtvsddblNrkRhfyA5lN7NNm6YnCeqcbLiC0iUcTIcKkqO+vRCOVdowpzGN
	 1wISnMD6ZhBXFjjdrPHBrHmk3K31SEoTkSD7q1F5SKZB5THRJvgjyPQHcIfKCaMmUfXkk
	 PvaiqZFeXHDWDEyWTYZw/Q12ISmTRb8Hqk74QTperGVAdzSYhi7UOfThYb6pd1JhDYzxt
	 RUauLJFNzgVAVvYPcz+3az2KKWjPaT2C227iCPkWQmz5+swcJZy9Q5RIj+Y2gpZc6fA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524336;
	bh=Q7ThQKrJrUK5oMYJBq5fhreycz/VI8fNer0LVsOfblk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Qc4iRggb1p20N/EJoWFrFlwQ2TQT7fzwW6LVJ/U0MqLA3CLY9Cx3k+UqbQ9CAtiDc
	 +nEH4tlZ9MJ9L15hTeKH7a2rHFJbRuQopQphPuWPoDOBfci6fs/6/RTL5bXRa7m0+i
	 EcWTEJ08eidtc0QEVv3QVcvftMV8SRavoX4lAFRvRc5UddsIw4NeMCtogXL/fw+zw+
	 WMKTcx8bSyZYBObn3gGDRjuX9gkLn6jVtJT2o0FdqebPGWJcZZ8sMo4GHKPcjHljI3
	 WFjahuqOtJGTwM9gAiK+P6KYx83qwLimxaihcBW7cphbaXZ10qu0n69/YXnLtXVekF
	 rBvK57dJT5eTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DA6660D89;
	Fri,  4 Sep 2026 12:18:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E189F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F295360DAD
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TX_eX7pFNGNt for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:18:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org BFF0260C27
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524321;
 b=Ne8Zzsw9txIdRQcuwjWCV6Qz2YTpyNsPKtiU2fPRDww1IEmozmWO1+ajZDEPwz1am1QT
 uqiwUD+p4mZ7riD1Owce0EHtHdXzIvLR21KY3a36OiPmfaW6ksTVEUVWkKS31BJhgWTia
 /5Hm1j3AMZV54ykSK9wu9gu1DZGTGyXsO2WlcOTou+tqYOevnq5rfeiGQzPkxF1Mq7Jg5
 +emI24DHbl7HwzngRuuF2chZltDCV+sMMGZBc5NbEZTW6agxF2CBanGiAAlTKN4TKmEZA
 v4R6N60ENFRb/USCK9dQpkrnn7zfsx2Rs6TomhfPR6nMAx86ceTUTb9ras32hUpNjhA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524321;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=XsCIIHkD6iFGtD3sFdEV3ZbkoEaZgwwOIvybRdfqjlo=;
 b=XlZtf67mbfwVzwJVi0zfdCB4R8xTioxuMG3gcY0kQsa3PfyWYTNNVKBSRZ4cFB8OVJob
 VbBugEikxAFjjtOGof5GPAcqQDf+QGhwuAQ9x9wrCHLjQsiOnDl0fiuZ3ZX66SVUd+s1U
 EMw8BFdzmXat7hrxP9s/ZHTfGPSoJk7RegVmV81JzTjKiHp/hqvgipxxEcdkANeQSRpTF
 NnImb0JbP1E4BhLRYV3YrrwIfWuzNsteodl0C7IkYeel/zffbGaVnZeh/0YzwisczLud1
 kGPZpinaAAQpOu6jgECKMXqJ+u5CCcHYLziY0BDvcknLodMaKcx0N7tPGDlE8lh0U+A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fP+fM6dc; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BFF0260C27
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:18:40 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-49b0eab380eso8157915e9.0
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524318; x=1789129118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=XsCIIHkD6iFGtD3sFdEV3ZbkoEaZgwwOIvybRdfqjlo=;
 b=YZWfY2vtgjuYRgtNOFYVUNcmeoypNSoi1zNIWMqP6yjYiW7KwfsJOEmecr3ViOvg5E
 5EIu+NqdUptmhzlZ0PqVyE8z48An440/wNiGjEYuGUiAcRMM8jgdwB60FhomXPDeSrq6
 UxFuVJ/8dJgxBKx1qi6eJNuyXC8xClcU5ZIa7w93hIThb/yvcetiXbShJWeYqOVFPMSJ
 /Sb0MD9/7FXtqZLAZkTlC2buff/GZYK4A96suDz/lVwcvP3I9/C9y+nd7K6BRuiYtNLK
 3RxLX+cukFNvowElp23mhrc7SAENTVex6q+vzi1oqNskFIkYit27TtDx0HFJy5leslFs
 vZYg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEX/2eo7gEyBpl0/2Xmvs8OsywndoPR7V4ScP1R4Ine9WUa6LNCxV0kqWk4A7xR4s9sR5jsy3o1xY=@buildroot.org
X-Gm-Message-State: AFuF++l6x970JzgOyglHvOaskcHvdHooXCnyyiTQffJrwePpMM+TBQeW
 wLRqnunOJclESpPeOCygcUL3KMxYodC6brgjj/TD0Yjl3LxHOJqVyscZdfdAbD5rPHLmP8sMDlR
 69M6w
X-Gm-Gg: AYBFou0PqzP6O3USF2/TAPuW+kF++go4jjD1Gdt1PAg5aLxY61Gt9JEGsFTk6APhHFt
 hfLFRg2rQnddyQvMJEEQpZOwXVWw1adtRN/LaHX17XmTTAmpVOA/ZzVUZlKE7n7UW/n1pvGIuXe
 7q2Vgo+lpQj0EBghUB0w7zRTuPSxJ8lwM1+XyPVlZ46E87hoP1IA7wdG6PiewpoXIrs28FfQbYz
 vqKV4XRMFv59y6EmfaxlIe2++9z/jHqT90YtUvDFlltOwCUneY2EQKQHi2vwUxH3YSMYwUToNBk
 D3bnD2Wj/jNvLj5GgQalv8IadnipR7v7bYXHl/frNNNYXuepCXYBMJDgzMmuiklLFErXnHlFW5h
 ghubPbTGpGcROgp9WNcGMwEaipdFJAUgGF72B7c14oqECbzfWNYsre1ir9zv1ncNZcWGfo1MCpS
 UY+wvKxiAVJR3384lRVtFeayihCvxPsDYUwKAyga0vAsuIH+uattJSp/67Y5rTOKbYJJE=
X-Received: by 2002:a05:600c:1d07:b0:49c:f13e:e4d with SMTP id
 5b1f17b1804b1-49cf86f4fe4mr44395775e9.10.1788524318121; 
 Fri, 04 Sep 2026 05:18:38 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce591f846sm90174045e9.1.2026.09.04.05.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:18:37 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:36 +0200
Message-ID: <20260904121836.405669-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824213315.3323882-2-thomas.petazzoni@bootlin.com>
References: <20260824213315.3323882-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/gdb: handle xxhash optional
 dependency
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
> Since gdb 9.x, gdb can optionally use the xxhash library. Since we
> currently don't do anything about it, it's a potential "silent"
> dependency.
> 
> In particular, for host-gdb, this means host-gdb might end up being
> linked with the system-provided xxhash library if available.
> 
> This patch handles this dependency:
> 
> - For the target package, by looking at the value of
>   BR2_PACKAGE_XXHASH
> 
> - For the host package, by looking at the value of a newly introduced
>   BR2_PACKAGE_HOST_GDB_XXHASH
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  package/gdb/Config.in.host |  5 +++++
>  package/gdb/gdb.mk         | 16 ++++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index 823c2e9966..61fe32d8ff 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -49,6 +49,11 @@ config BR2_PACKAGE_HOST_GDB_LZMA
>  	help
>  	  This option enables lzma support in the cross gdb.
>  
> +config BR2_PACKAGE_HOST_GDB_XXHASH
> +	bool "xxhash support"
> +	help
> +	  This option enables xxhash support in the cross gdb.
> +
>  choice
>  	prompt "GDB debugger Version"
>  	default BR2_GDB_VERSION_16
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index ebb80072cf..cfec0585da 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -217,6 +217,14 @@ else
>  GDB_CONF_OPTS += --without-expat
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XXHASH),y)
> +GDB_CONF_OPTS += --with-xxhash
> +GDB_CONF_OPTS += --with-xxhash-prefix=$(STAGING_DIR)/usr
> +GDB_DEPENDENCIES += xxhash
> +else
> +GDB_CONF_OPTS += --without-xxhash
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XZ),y)
>  GDB_CONF_OPTS += --with-lzma
>  GDB_CONF_OPTS += --with-liblzma-prefix=$(STAGING_DIR)/usr
> @@ -301,6 +309,14 @@ else
>  HOST_GDB_CONF_OPTS += --without-lzma
>  endif
>  
> +ifeq ($(BR2_PACKAGE_HOST_GDB_XXHASH),y)
> +HOST_GDB_CONF_OPTS += --with-xxhash
> +HOST_GDB_CONF_OPTS += --with-xxhash-prefix=$(HOST_DIR)
> +HOST_GDB_DEPENDENCIES += host-xxhash
> +else
> +HOST_GDB_CONF_OPTS += --without-xxhash
> +endif
> +
>  # Since gdb 9, in-tree builds for GDB are not allowed anymore,
>  # so we create a 'build' subdirectory in the gdb sources, and
>  # build from there.
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
