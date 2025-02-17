Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73688C021A0
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 09:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF065813C3;
	Mon, 17 Feb 2025 09:20:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwRHMUinnf0M; Mon, 17 Feb 2025 09:20:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA6D1814AB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA6D1814AB;
	Mon, 17 Feb 2025 09:20:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52F30DE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 09:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E0B54027C
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 09:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeI9qVziln_w for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 09:20:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D96FB400D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D96FB400D3
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D96FB400D3
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 09:20:37 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43948f77f1aso26124145e9.0
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 01:20:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739784035; x=1740388835;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hm+MNhRUc2BoWWjG0g7EQKkBpNpEpCWAktf/c9c6XqA=;
 b=XkAZQMWaDJKgj9COTsQxX5W7mhW1F11YTwhOH9eYSVh8bjaJk8Y+UuSU/rM0s0JrZK
 jVHS/X24Cemw8ubu4HBmZ+/DQ831mvpO4LCUS2QGmyHP90uhW1Xj7neo4mB6TQAYPP9c
 KU91cj090yUVHlopFKqE88+5F2+WzXFhj8dh9q0wfl1PdH8gHlIjx+3cm0fQ85SR+gsS
 sDNXkZY1ImlQnlL13IxpCVEs4irQ1pj0aWEx2VYGLjhvf5f55PNYiZFRm8RDsw+gVMHh
 hhQjaZDNqKcJQrpfXx5hX8HLpVQbFkM5vuK9DkSdGmKtYp66i43vjTJsKiLv6cJVR9x+
 WXbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEifzGOWSJQRhWdH8UgJ4+KLUPDrdMBG7mw636twXdydiOgs3jk7axjGpIQanyLHuSl0hpFBNpfXo=@buildroot.org
X-Gm-Message-State: AOJu0YwUJMAK8iH9mgPzdMGUrOch07nrY9skUNTdxsAYFiX9XCitRsOk
 TEpg6T3RDRknSQ2gVODIheKsLCFpH9pBHhSPxd60ut6YyapO3FPxAw7fxVsONrI=
X-Gm-Gg: ASbGncu4XetqY/U/StNRjlIXfYUlx7IH9HpZLoY6QFK/55dtyzbV+cs4uqDfA+QhLH1
 zi1GUp5TfX+F9inUoap4OLkoExnx5OfOmNsCccbjIFGnpUNcRymWbx2cScEUM+PZS3uMWZLVTGs
 OHCjM55WY5wzxquP7H74bCvFSzRP4bl9RHAgydP1yRsiov55rO55K0jbCYSOJK07BkU0PW1avQa
 Wp5zSUBgsZVCSuxiPLZ2EhZ8K7JJOnyVy2wNdz/tEbId/+dYL7++Jh97qUh4HM8Omio/vXB8JeM
 Qk4PtILbUcufy1GdFScGMem90JkaIoo7HS7lt0v3VXb8o6Yv+yPNAdK/2CFewix8EzEtGG0Qja8
 0cjA6hgFSak9Sx40oyTmkQ4MKy0VcMARPuWGYZWkeDGO0bw==
X-Google-Smtp-Source: AGHT+IG+hOtBnxLjovCLAujCNosUa3iSXE1De4j6cZTa5EZ7pYrjvu8HuP366zGBNsv9dC8hRDxO7w==
X-Received: by 2002:a05:600c:3b03:b0:439:57b5:f8a0 with SMTP id
 5b1f17b1804b1-4396e739a6dmr62609575e9.24.1739784035432; 
 Mon, 17 Feb 2025 01:20:35 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43987088ecbsm15557825e9.31.2025.02.17.01.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 01:20:34 -0800 (PST)
Message-ID: <8e84d75f-32f7-4095-80f9-0c1279d3ab10@mind.be>
Date: Mon, 17 Feb 2025 10:20:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Frager, Neal" <neal.frager@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>,
 "Simek, Michal" <michal.simek@amd.com>
References: <20250215125732.2965257-1-neal.frager@amd.com>
 <bcc4d526-57dc-4a95-9dc5-29c1c94f0ffa@mind.be>
 <SA1PR12MB5615121EEE77BC29889A29D8F0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
Content-Language: en-GB
In-Reply-To: <SA1PR12MB5615121EEE77BC29889A29D8F0F82@SA1PR12MB5615.namprd12.prod.outlook.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1739784035; x=1740388835; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hm+MNhRUc2BoWWjG0g7EQKkBpNpEpCWAktf/c9c6XqA=;
 b=OmUAE/tcnXUZyRbF7bVrYOkNFxVA+cBwrSInIdjQHkSQavZNvvS6o29BB97KxYI2hQ
 qI0myQulGjJ3ILZWzrEesJUNJ1nfA9rMt1K0cpLg4NzeTWKT8dZYXm1E5qyUhaFgxmlR
 jM+/B2mDbsSRkKDi5gJ9W6VZf8Tpc5FrY8P/eugVGPu+KRPGDbADITxsLcnEX6ntIZFa
 ErSzwZmDBwlcpFZW+CtzU2tCroSg5cCB38lkdvLmDmhwEcR6TC+B/j2TE7HKkxIYaP8k
 jekwGTz0KXA1W4gxfp161T0IaO0/L3fZP4JXRFS68uFlYL0o15INHC7U3yCN3zZnBPJD
 1+5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OmUAE/tc
Subject: Re: [Buildroot] [PATCH v3 1/5] package/binutils-bare-metal: add
 multiple tuple support
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/02/2025 18:54, Frager, Neal wrote:
[snip]
>> - $(if $($(PKG)_OVERRIDE_SRCDIR),,...) is dropped
> 
> Not sure it makes sense to do this if check when we are in the package in
> question.  The infrastructure needs to check whether the SRCDIR is
> overwritten for each package, but since we are in the package, we know
> SRCDIR has not been changed.  So I will keep it out.

  _OVERRIDE_SRCDIR is something you set in local.mk, typically in order to try 
out a patch before you commit it to a Buildroot patch (or to GLOBAL_PATCH_DIR if 
you're in an external). So you do actually still need that in order to stay 
consistent.


>> - $(QUIET) is dropped
> 
> $(QUIET) seems to be empty.  Not sure what it is for, so not sure why
> we should add it.

  QUIET is set to -q if Buildroot is started with `make -s`. It makes configure 
suppress almost all output.

$ make printvars VARS=QUIET
QUIET=
$ make -s printvars VARS=QUIET
QUIET=-q

[snip]
>>   I think we have two possibilities here: either we use the stuff from
>> autotools-package _exactly_ and just add to it (perhaps even keeping
>> HOST_BINUTILS_BARE_METAL_CONF_OPTS as a variable) or we adapt the entire thing
>> to precisely what is needed and useful for host-binutils-baremetal (so dropping
>> all the useless options). Either option works for me.
> 
>>   In the first case, we could even rewrite the autotools infra so all the common
>> stuff gets put in variables HOST_CONF_ENV and HOST_CONF_OPTS.
> 
> I am going with the second option now as it is the easiest to implement and
> a lot of the configs in autotools do not apply to binutils or gcc.

  Make sure to explain in the commit message why they can be 
removed/rewritten/whatever. It may make sense to do that in a separate patch, 
i.e. first copy it as is and in a second patch remove the redundant ones. 
Although in this case it is not really necessary - it only helps with the review 
and at this point we can trust that you looked at all the configure arguments.

  Also make sure that the commit message explains the two options and why this 
one is selected (basically what you wrote in this thread two mails before).

  Regards,
  Arnout

[snip]

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
