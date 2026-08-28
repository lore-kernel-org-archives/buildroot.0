Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5714C61DB9
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 02:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 92CB740824;
	Fri, 28 Aug 2026 02:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwpWPuz0Tan7; Fri, 28 Aug 2026 02:53:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787885614;
	bh=5X93JZJVt3nFuJ9aYb5QS+uNtaWpWV7Ysu7dKqhqTqM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pfK+mJqRlnN4Pl1X7z5R9kkai8dMyGAStaEUUPfUeiiUcsL74zgIr+Sejp9qad7A3
	 zSt0xsrDOVvuMciE8jSCWVM5tQsnCtnVQauNEz+tqH1oj495pGsUdSCBYnuY+Cx/h7
	 dggbcROQuHIoAlFV+Inc1zGIfNkhXdlHfenvyEU4q0Iryh5Bzh/L2NH/3GfyA8bcUE
	 SyPk+c3ShzWqcYGtSjEOwohwP1+xUdmLfLNQIRtC1M4T0QgZYOyLOTcbMlc7Vgwv1w
	 yMG39i6C7TTUX3lXW9fut4uY4tKFY3c1BIlCU1nYmcuMY3wbbDchGLBTevRQfCtz4O
	 +8TIxxhmac3rQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCDBD40816;
	Fri, 28 Aug 2026 02:53:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65025CBC
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 02:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5692760663
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 02:53:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNPFxavWT_gA for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 02:53:31 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br025@umbiko.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=umbiko.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=WI9eLnUi
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF48A6063F
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 02:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=umbiko.net; s=mail;
 t=1787885605; bh=+FioOd22ch1rlYEYe9JV34Djq05xqAANce1/pJAop1A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=WI9eLnUiSI0+JpJ/VcUUSsovw3GnrnXQsrjk6KwMo815bozLLifvQ7vHRqD+SRVlX
 H7CK7oltM/4d/VUJ2hwJPtUS3bGmqC23U1Q5ZAJwh3c9wDlRlRX7QyZEsXcIzZ+3Cx
 Cn1RbAZkl+QNo6USTNtVCgHFDoXmXhQKvEuylItA=
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 2D012BDE0F50;
 Fri, 28 Aug 2026 04:53:25 +0200 (CEST)
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 02:53:24 +0000
From: Andreas Ziegler <br025@umbiko.net>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <buildroot@bubu1.eu>
In-Reply-To: <ao_Nj3une8D_aVEC@windsurf>
References: <20260827032643.1940-1-br025@umbiko.net>
 <20260827032643.1940-2-br025@umbiko.net> <ao_Nj3une8D_aVEC@windsurf>
Message-ID: <8a0420a64d1bb3fb4a10205de4d502aa@umbiko.net>
X-Sender: br025@umbiko.net
X-Virus-Scanned: clamav-milter 1.4.3 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] [PATCH v3 1/2] package/mpd: use upstream mpd.conf
 w/ buildroot modifications
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

Ji Thomas,

On 2026-08-27 05:40, Thomas Petazzoni wrote:
> Hello Andreas,
> 
> On Thu, Aug 27, 2026 at 05:26:38AM +0200, Andreas Ziegler wrote:
>> +# sed snippet from https://stackoverflow.com/a/37911473
>> +# single-line configurations will be inserted behind the last 
>> matching line
>> +# in the target file, multi-line blocks are just appended at the 
>> bottom.
>>  define MPD_INSTALL_EXTRA_FILES
>> -	$(INSTALL) -m 0644 -D package/mpd/mpd.conf 
>> $(TARGET_DIR)/etc/mpd.conf
>> +	$(INSTALL) -m 0644 -D $(@D)/doc/mpdconf.example 
>> $(TARGET_DIR)/etc/mpd.conf
>> +	export multiline=0
>> +	while read -r line; do \
>> +		if [[ $$line =~ ^[a-zA-Z] ]]; then \
>> +			if [ "$${line##*[[:space:]]}" == "{" ]; then \
>> +				export multiline=1; \
>> +				printf "%s\n" "$$line" >> "$(TARGET_DIR)"/etc/mpd.conf; \
>> +			else \
>> +				[ $$multiline ] && \
>> +					printf "\t%s\n" "$$line" >> "$(TARGET_DIR)"/etc/mpd.conf; \
>> +				[ ! $$multiline ] && \
>> +					sed 
>> '/#'$${line%%[[:space:]]*}'[^\n]*/,$$!b;//{x;//p;g};//!H;$$!d;x;s||&\n'"$$line"'|' 
>> -i "$(TARGET_DIR)"/etc/mpd.conf; \
>> +			fi \
>> +		elif [ "$$line" == "}" ]; then \
>> +			printf "%s\n" "$$line" >> "$(TARGET_DIR)"/etc/mpd.conf; \
>> +			export multiline=0; \
>> +		fi \
>> +	done < package/mpd/mpd.conf
> 
> I am sorry, but this is way too complicated for Buildroot's KISS
> principle. Some much simpler approach needs to be found.

You might have a point: too much effort for a file that is probably 
never used :-D

> Best regards,
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
