Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883BFC432BE
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:16:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FC9C61371
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FC9C61371
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D5E7A40347;
	Mon, 23 Aug 2021 22:16:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oPF52ixodllm; Mon, 23 Aug 2021 22:16:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20D524034E;
	Mon, 23 Aug 2021 22:16:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EC3F91BF2F7
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB09E60692
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:16:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xzj-JwelsJvg for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 22:16:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7556D60690
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 22:16:35 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id lc21so7673301ejc.7
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 15:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qO258uiRIIqGfSQDfKKYOrsMin9A0nV46KnNMiLKRQ8=;
 b=CN6OkwWAwHwnQO0Z8d72noBLIWeEWvBDai5+zYGMGdmZ+HNdv0KMr5TYkQjZamHIoh
 CliGzsc6eNl6AYbQvgfv7KL8fV0gONuqMAXsoK1gnBWDVT6Xk+h6L3TZiMOE3WBRurxZ
 DwZDf3UInbzFHFRnzMwHEj98P0Z3GSM0pLBlggsUaId5d/1YqqsDhOqS8B8vU5DCRZ77
 Vx4Pu7mGa3U5CVX8nKmm3/UzJr08L4PtK9+iTwamrxYS0iyljQHFckrOdL+h7Nm6NRM5
 +/TSD2XotTD9enYJAqjWosnHtl8A3ag2fCspFuPresAhJ8PpCSQaOsCEtxBvqqBzMKmJ
 tDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qO258uiRIIqGfSQDfKKYOrsMin9A0nV46KnNMiLKRQ8=;
 b=PDPT2LHeEFkOQ7AlEP1gCndkNrpilQ8+UYHzCd4L+qz638ACSD1oaDEal+QxgD1m4i
 pyl3DdiGrq2PLq9FZjfw5eCSBSoyNWsC3TrR2xAVItrt9Gc7BO56aEzt/wZ99DTYhXEF
 XlsbSMWkTrI5U1tNKNKMZxzCRd0KnzRFDgjx+JTU97LCG23eG+AD23PZZ1n6AdasqeOr
 aelKKhsBOCrktOsAU7JQVJRMeuhlIhjohZPHwmkVFbdoEjXLG+XggPE5+UrJFXmfaCoP
 Rlij5MFMDRn6ED8DFAMZbaKEXPsId5st1szwaOpDAeTBLKNfGWlHP7Vqg+9or8nHzvWM
 mmtg==
X-Gm-Message-State: AOAM53224yseouBe4PopJ7CHdK6RbImBq6qtoRqAc1UQ8+fQHb0LXyM5
 0j7Wz+PFDBPdCYDJBBybkIeXY4rWRVqLiQ==
X-Google-Smtp-Source: ABdhPJz0IMDzof96BgJTyqnRpKILjx+tBtJKc4xxvU01gxrEfgADtsZqlvPH4+CWLpizKzHktcHAAA==
X-Received: by 2002:a17:906:28db:: with SMTP id
 p27mr6377701ejd.94.1629756993706; 
 Mon, 23 Aug 2021 15:16:33 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w11sm9772822edc.5.2021.08.23.15.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 15:16:33 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818122511.005d6a5c@windsurf> <20210818110558.GY27036@scaer>
 <20210818221842.5926641d@windsurf> <20210818210431.GZ27036@scaer>
 <cd13188c-9e4b-635d-e582-ec10285c922d@mind.be>
 <20210824000634.07d68905@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <efc23fd6-91e4-a26c-c38a-5802ace44c28@mind.be>
Date: Tue, 24 Aug 2021 00:16:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210824000634.07d68905@windsurf>
Content-Language: en-GB
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-08-17
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 24/08/2021 00:06, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 23 Aug 2021 22:55:30 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>>  I have a theory, but it's a bit far out... We basically have this:
>>
>> gcc -o empty empty.c
>> objcopy --dump-section .interp=/dev/stdout empty > loader.txt
>>
>> The timestamp of 'empty' is going to be near the end of the gcc run. The
>> timestamp of 'loader.txt', on the other hand, is going to be all the way at the
>> beginning of the shell run. So, if the filesystem doesn't have nanosecond
>> precision, it's possible that 'empty' and 'loader.txt' have the same timestamp.
>>
>>  It's not a good theory, though, because make shouldn't consider 'loader.txt'
>> older than 'empty' if they have exactly the same timestamp.
>>
>>
>>
>>  Ooh, I just discovered something nasty! Apparently, objcopy updates the
>> modification time of its input file...
>>
>> $ touch empty; ls -l --full-time empty loader.txt; make SHARED=yes loader.txt;
>> ls -l --full-time empty loader.txt
>> -rwxr-xr-x 1 arnout arnout 24K 2021-08-23 22:53:27.450172624 +0200 empty*
>> -rw-r--r-- 1 arnout arnout  28 2021-08-23 22:52:57.949935937 +0200 loader.txt
>> objcopy --dump-section .interp=/dev/stdout empty > loader.txt
>> -rwxr-xr-x 1 arnout arnout 24K 2021-08-23 22:53:27.563173530 +0200 empty*
>> -rw-r--r-- 1 arnout arnout  28 2021-08-23 22:53:27.563173530 +0200 loader.txt
>>
>> I guess this way there is some chance that loader.txt gets a modification time
>> just before the updated mtime of empty...
>>
>> So the solution would be to touch loader.txt just after creating it. We could
>> patch it like that, give it a go in the autobuilders, then send the patch upstream?
> 
> Wow, great investigation! Really odd that objcopy updates the mtime of
> its input file, though.

 The man page says:

       infile
       outfile
           The input and output files, respectively.  If you do not specify
outfile, objcopy creates a temporary file and destructively renames the result
with the name of infile.


 strace shows that that is exactly what it does.

 With the following command, it no longer overwrites the input file:

objcopy --dump-section .interp=loader.txt empty /dev/null


 I'll spin up a patch.


 Regards,
 Arnout

> 
> Thomas
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
