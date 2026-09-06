Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA88C79F91
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 04:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F08280EBB;
	Sun,  6 Sep 2026 04:35:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJh6BNRqQGg0; Sun,  6 Sep 2026 04:35:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8339580EAB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788669310;
	b=MWY4hmWiN694sgdwoPUvScTenZid9AUrIclQLGuPvznK+9cklIv2dslFe1XOJB6ziD8v
	 ZImbMjyAqO++MVRx2X1QJClsymyKUk1mK28Jf1WUtQUBJ7iZTzpQZijoYdXOZ+4vt3QvC
	 KpYJ5kH6hFQ3twUy2DSmqpxejwrGzk0zNPB50yRvMMlRwZ/BqZYJx0JQgdrk05/40+fFU
	 dRmqk3EtSma2q8Mta3FXupQUbXetKKFLqq2aJb/WvbWHXFKszy33quWAJc7GRHEyL1916
	 utdbR4wGDpqFsWFryDIW8wdzGMuvNFkDcWcSJ/rlNbc4QZcXXOiq30pjmOnTiZDBB7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788669310;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:In-Reply-To:
	 References:Message-ID:X-Sender:X-Virus-Scanned:X-Virus-Status:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=fbQzh1S2q+CD2ChY2G+fsdq6wM2eC964eIUnqcjU6/0=;
	b=gnkLGEg2tiizhKmVd0Bcv76UhA1q3YnKJ9qUs9xix5MdK/ugatTdpi1SXQn8NIftjvhH
	 16Ttkdlw5tYVHzoVnS9TT9DvTqjfRCWgt9FIRx4bUFPSYsliOo+On7mljYg2O9slsGn7C
	 Hi37BQgr5oGLxlZrDl6hM6RheHWhu4CtFqI5kXQm39Cs/BxArbK+HIHNnuEIzEaQn33uk
	 HoFuY00cjqC3iehO0hKDIlpu1LAooZ0QbGQ/a/6L+yXmlpgpL3BAv+40541LkNXPtFJ6i
	 JL/vuBQfZmMInEOh9yjCYTbw1cgtCu+Yc26PyrgOldJieOM5805FVGpsxy8zfOP/AUA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788669310;
	bh=fbQzh1S2q+CD2ChY2G+fsdq6wM2eC964eIUnqcjU6/0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h4TdGHD52mIrbHqjy3CeGbWQN2tHAx4tA6NIP/g2a/p7NTvfoL2dvRSxzozyNjeSW
	 83buMS3ZJG7076L26dBb7KbX3NVD2yw7Mocua+BL0YGua2lYF/eJZRhPZv4lgkp1aC
	 mzpPWc2b7zImOohqxRcSDUEecmxeXO8o9yRl8RmH0tK2UiZHrcLLOc/+ECDWfY/Z8l
	 67VxbduGDDtH6p6wSVi4PaI/cOXsVmGbcokSMENPg3Sz8MaM/P16VntHmDBoiDKVhC
	 B+xZi3WMJ9pmN+5k4GJ4nidLVgs82dw0MtfuTcRjxf78r16GW8uzfCmtG+I7ia1gOG
	 fvayb++nKxUVw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8339580EAB;
	Sun,  6 Sep 2026 04:35:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CEBF4970
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 04:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C08044069C
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 04:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id otaHuFreCJOv for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 04:35:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 001444066D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788669306;
 b=RXXdcnOpMCH2ttiZMVvdVC5lKC9I3HJ14MeoA1s0NxEODbxiZWp5/++mSg0i7lwgzEt2
 LdtE/Ahc/N0nFp/dKRjapEvPl9UELaSDcWA/twAEKkhrMYQjnx5oeWXArtin0qVYwJrz7
 bTobkA1Zk1kMUXO7rR1sHzCmSO6rsdQzUpOH1PrRQRlyz8TQhXQoTWtXYspWpzJLnr/iO
 sdzyZG3HLbY3WPq471F6LcBcayUBnInofuUASef2nDdJ8+tZZV3fEVUF0bTh0fCV6Xd4J
 yWKGEOw1WgflseeSGcmNfzmgdbrpDs0duca32mpvGL8xT51hiQtIpVT2IyH9sQzsm6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788669306;
 h=Received-SPF:DKIM-Signature:Received:MIME-Version:Date:From:To:Cc:
 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
 Content-Transfer-Encoding:X-Virus-Scanned:X-Virus-Status;
 bh=j2Jq212k1MdDq/Cxz4l0CZubfyzAIa/Gf7esHto0A4A=;
 b=iCgatWW00D4CZUDNkVjt/BZwjAuiYiUvS/v3gosdCvLzf13SXkJcAb2IN7Z8ElNppGyA
 1PozyacPlh/n/wPeHAlPcFJQhb/nnaRy9opAuhak1HdnuUSkuigmY2dvsWHSpj1HUj0Ak
 T2FbpGzKsnenP8I+o2XVbFoGyKmC6HLdCF5rF0e8IVDHlLM0hm9PbflNdJNWq/R2eZluQ
 MfvjSFL4KZQs0EX9wHLngCErnfqjGMppDW/gIOfFMDwfbdg85S5WvEiQ3sQTUNlHfixFh
 ijdD6AEDlMIAfPPjTI/ZwEvUFeVkdUQ4QvnIxzczd6kZCdLyAEanqe9cFIp8iGMTVrw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=none header.from=umbiko.net; 
 dkim=pass header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=vfyxfLUR; 
 arc=none smtp.remote-ip="2a01:4f8:151:30a2::163"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:151:30a2::163; helo=serv15.avernis.de;
 envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=vfyxfLUR
Received: from serv15.avernis.de (serv15.avernis.de
 [IPv6:2a01:4f8:151:30a2::163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 001444066D
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 04:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1788669300; bh=nP3lRIEtLOQ7f8qKoKIViXjDdyH2GkvlBbMnh56O3wM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=vfyxfLURrF8RLUNFoVxFvYf+uzrVyJPsjpQGdxWNF4O5lBwz5J8O8I1VqQmoK+kyu
 F/4hvToxaFOIuausE1vJmhHxSF6VkC45Dti5U/pt+JePuLzAdQn7wkgHHrrCuXyjza
 RmAa2/nsUO4LkA1vCJKKyQwe/4icWqT7xJlKyduk=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 24275BDE2CD6;
 Sun, 06 Sep 2026 06:35:00 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 04:34:59 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <apwjYdxffhgRv79A@windsurf>
References: <20260905040256.2221199-1-br025@umbiko.net>
 <20260905040256.2221199-2-br025@umbiko.net> <apwjYdxffhgRv79A@windsurf>
Message-ID: <b8199d879ba2335fb3b0462a0346f84a@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v4 1/2] package/mpd: remove unused,
 add mandatory configuration items
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 2026-09-05 14:14, Thomas Petazzoni wrote:
> Hello Andreas,
> 
> On Sat, Sep 05, 2026 at 06:02:52AM +0200, Andreas Ziegler wrote:
>> The configuration file supplied by Buildroot is only a sample; it will
>> not start MPD on a default installation. In a production build, a 
>> custom
>> mpd.conf has to be supplied via rootfs overlay or on the target 
>> system.
>> 
>> Supply the necessary configuration items to start mpd in a default 
>> build,
>> and discard unused customizations.
>> 
>> Signed-off-by: Andreas Ziegler <br025@umbiko.net>
> 
> Thanks for the new iteration.
> 
>> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
>> index 1b6815e904..bbd6fc16e5 100644
>> --- a/package/mpd/Config.in
>> +++ b/package/mpd/Config.in
>> @@ -119,7 +119,6 @@ config BR2_PACKAGE_MPD_LIBSNDFILE
>> 
>>  config BR2_PACKAGE_MPD_MAD
>>  	bool "mad"
>> -	default y
> 
> Why?

This is an optional component. It was never used by any Buildroot, in a 
user configuration it is also optional. I was always wondering why I was 
never able to get rid of this library ... It was also never used by the 
Buildroot configuration.

> 
>>  	select BR2_PACKAGE_MPD_ID3TAG
>>  	select BR2_PACKAGE_LIBMAD
>>  	help
>> @@ -244,7 +243,6 @@ comment "Output plugins"
>> 
>>  config BR2_PACKAGE_MPD_ALSA
>>  	bool "alsa"
>> -	default y
> 
> Why?

Also optional, a MPD server or a streaming setup will never use local 
output. Also, other output options might be selected. The buildroot 
configuration never contained an output section, so this was unused.

> 
> These changes are not really explained in your commit message. Also
> this change will break existing defconfigs that assume those options
> "default y". Is it important to change this? (Even though I agree they
> should not have been "default y" in the first place).

It may break a few, but also fix other configurations; I always have to 
check my own configs after running make defconfig. It will remove some 
of the complexity from Buildroot's mpd setup (and it handles only ~50% 
of available options).

>> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
>> index 4db0aee7cb..5852bbe73f 100644
>> --- a/package/mpd/mpd.mk
>> +++ b/package/mpd/mpd.mk
>> @@ -347,8 +347,6 @@ endif
>> 
>>  define MPD_INSTALL_EXTRA_FILES
>>  	$(INSTALL) -m 0644 -D package/mpd/mpd.conf 
>> $(TARGET_DIR)/etc/mpd.conf
>> -	mkdir -p $(TARGET_DIR)/var/lib/mpd/music
>> -	mkdir -p $(TARGET_DIR)/var/lib/mpd/playlists
> 
> Why is that no longer needed? Because of the configuration file
> change? Or because it was bogus/useless anyway?

/var/lib/mpd was the standard place where MPD used to place its files. 
But /var/lib is part of the root mount, you should not put music data 
there. The MPD manual itself advises to check and change this setting.  
Stored playlists are an optional component, and not every setup uses 
them. The full set of directories might have been necessary in the 
beginning, but became obsolete when MPD added remote database access in 
version 0.21.

> Thanks!
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
