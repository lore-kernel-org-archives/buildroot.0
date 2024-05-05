Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF04C4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 19:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ECFB400F1;
	Sun,  5 May 2024 19:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XI-7ObZYyve; Sun,  5 May 2024 19:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F10B40151
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F10B40151;
	Sun,  5 May 2024 19:33:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 28E341BF3CE
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 19:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 15AB640151
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 19:33:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KNzA9xqpDLTU for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 19:33:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BA908400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA908400F1
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA908400F1
 for <buildroot@buildroot.org>; Sun,  5 May 2024 19:33:28 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-41b869326daso8704785e9.0
 for <buildroot@buildroot.org>; Sun, 05 May 2024 12:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714937606; x=1715542406;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RHqysNZ0Tmx6KwCWJOiH8OcJtAt35hf4zn6nZauJB7Q=;
 b=L3Ch3LA1BBXg3Qd7fux8Ojvm48NWV5KU3uZiP+4YdOD5qXIhdaLzkPcoJS9VJ7olt7
 xuwI66t7ayoeKPA9hQlnkLQwKOkHKPSviWx2VYEbnH37MI6W0ubdCS+kDshF8RxvcwKY
 tIcAlQYcu13IE04giEdPGzMeBDJCeM/9lXciTbkYD2pfeR73YQ95RCIng+UOY0MBjtU3
 LsMMNtnyuJ1Hde7/V60ukcDFVcmMIXJcqz8XGMP6xhoQ+/hWQjlDik4TSYj6u2aKKxET
 7pRwzkLtksJJDkNxSEU821hYcKHSyF9j97eXV61v1jEkOoHGsrUNYH/TTePrR5VXYbq0
 WwuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFMmhBCKuxltQkD+Ms0dM0uv9H7YLtWJd4WVdCoEL7fl1MCQeY9bUua97W9H81ErCAYy4AS9tWJ4bP9/M9xkXuUMBPgDmimQ==
X-Gm-Message-State: AOJu0Yzl/h/f0clY1l9aa4Rsk5O5xuowPdD+hDjjR13iAczl6jhq0rAI
 wcJqDPZb9rAUjuQB86ovUptBbJNXiT9EUaNyt+vDJ/HyfQpLHCUjaSbJOkH2YyTs8OjXuirOftI
 S
X-Google-Smtp-Source: AGHT+IGg7Jbcdv5nQN2+dQ1T4tgU4lbJb+RHV8E70A4pONoo9hfKyvCs8UQTlP1g9b0CIX9ScEEBUw==
X-Received: by 2002:a05:600c:3b26:b0:41c:290e:7e6e with SMTP id
 m38-20020a05600c3b2600b0041c290e7e6emr8334962wms.35.1714937606492; 
 Sun, 05 May 2024 12:33:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a05600c4e1100b0041be3383a2fsm17426444wmq.19.2024.05.05.12.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 May 2024 12:33:25 -0700 (PDT)
Message-ID: <c9627c7b-f371-4c6a-8815-5ee3a3c1c190@mind.be>
Date: Sun, 5 May 2024 21:33:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dylan <november@dismail.de>, buildroot@buildroot.org
References: <XWZ0DS.CUMWYFFCDVCQ2@dismail.de>
Content-Language: en-GB
In-Reply-To: <XWZ0DS.CUMWYFFCDVCQ2@dismail.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1714937606; x=1715542406; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RHqysNZ0Tmx6KwCWJOiH8OcJtAt35hf4zn6nZauJB7Q=;
 b=CDHBC2ZnPA2HRlXSx8eIhKncLv2iPp0mSEE7r0Obr5XuAplAePO8qyO4TBK4proJZ5
 pMqIoF6F0NJTGgAfOQsIzYA2GZUZhf41XmRekVzYpsaFCvUglHmSwxREKxV8xZ5P81bB
 Y/UcC47JfoSehumaLNwErGtGDWlY9a/AeXEqB99AW81FOtO0474T785/1XiXcRlvoOlz
 pF/J7mXFefwExSP9bQQAVKYBX+yXssa12l+DdMSFjWUruFK/c+5TyPTqY/M8u20gE8af
 yEiNL6Y0g5uonHYL/TQ3wMD4PQ5c4xIbgOJENovVnB13Po2o8WC5eHs/R4NqkQaj3PCk
 pwCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=CDHBC2Zn
Subject: Re: [Buildroot] Issue Building New Package cmus
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/05/2024 20:41, Dylan via buildroot wrote:
> Hello,
> 
> I have added a new package, cmus, to my buildroot package list, but when I try 
> to compile it during a full rebuild, it returns an error message,
> 
> input.c: In function 'do_http_get':
> input.c:223:54: error: expected ')' before 'VERSION'
> CC lib.o
> make[2]: *** [scripts/lib.mk:66: input.o] Error 1
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [package/pkg-generic.mk:283: 
> buildroot/output/build/cmus-2.10.0/.stamp_built] Error 2
> make: *** [Makefile:82: _all] Error 2
> 
> 
> I can build the cmus package outside of buildroot, so I think it may be related 
> to my cmus.mk file, but I am not sure what is wrong with the file.
> 
> I've uploaded the contents of the cmus.mk file here:
> https://paste.ack.tf/8471de

  You have:

$(MAKE) $(TARGET_CONFIGURE_OPTS)

  This forces an override of all variables defined in TARGET_CONFIGURE_OPTS. One 
of those is CFLAGS, and in the Makefile itself the definition of VERSION is 
added to CFLAGS.

  The solution is typically to use

$(TARGET_CONFIGURE_OPTS) $(MAKE)

i.e. pass everything in the environment. But then you have to make sure that the 
Makefile properly handles that - e.g. that it uses += for CFLAGS (which it does).

  Regards,
  Arnout

> 
> If the mailing list supports it, I have the hash and config files attached, as 
> well.
> 
> 
> I'm using buildroot version 2024.02 and have tried running "make clean all".
> Is anyone else able to reproduce the same error, or can tell me what I've done 
> incorrectly?
> 
> Thank you,
> Dylan
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
