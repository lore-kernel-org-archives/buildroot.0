Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912BAC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 18:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3007C4056D;
	Mon,  1 Aug 2022 18:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3007C4056D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4DFQEkEoJu61; Mon,  1 Aug 2022 18:11:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 353B140556;
	Mon,  1 Aug 2022 18:11:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 353B140556
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E63351BF337
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:11:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA9EA409E7
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 18:11:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA9EA409E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h_rjZxjJTBTD for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 18:11:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9ECF409E5
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9ECF409E5
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 18:11:25 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id r4so7085979edi.8
 for <buildroot@buildroot.org>; Mon, 01 Aug 2022 11:11:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+p2YXiDPNZ9FYDPRqET6X+Aym7TLJH6WGdKXFSw0QwU=;
 b=coC48H5rsUPYg8cE/GzYkeD8A39xmVqp2oq/3Am7Sh7RuKGIYwGEagxvbWK+J9Qgj3
 95kY4d+Zi5wHVQu/veGpNh5EOHfxA6a/rb10b+Brv+bOINvE3RBBRb4FYa0hvkdXsC5o
 QHnJ4O5lvl8/Y2nXFXwq52maZTBYHEw7LUqM2UCzaXvLy5w0Yk3R/Gc8EYQF3rfN/JuI
 8LpH4q59vX1ihU3FwGTZWYkIo0EwOdJhY2WwcdTumc+1VnGA4Gk07txXkPPt7Stw+n0X
 hjSzkqtLUW29iny7rTdRCHH0Ldhe6+Fb5oixPKGYsq4SbM14lhC61kkU3zEbVP3yP5dU
 p4YA==
X-Gm-Message-State: ACgBeo2cLdlWFNlyWc2yQQpadACwcSuGarzTZ3LGpiv41Y1NM77lUvgC
 QjB0FA6Un7Xq/O2qe+rs8boiIw==
X-Google-Smtp-Source: AA6agR7Vdu5m2k2dK/7sLtBWBjFWoc1glyhQywLjPJHnXji1UKd7HJh2Wb3r1bpJiQ9U5+OOYyaZ8A==
X-Received: by 2002:a05:6402:3552:b0:43d:a57d:22e9 with SMTP id
 f18-20020a056402355200b0043da57d22e9mr6026362edd.119.1659377483968; 
 Mon, 01 Aug 2022 11:11:23 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 s26-20020aa7d79a000000b0043d34ab7ad6sm5132920edq.49.2022.08.01.11.11.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Aug 2022 11:11:23 -0700 (PDT)
Message-ID: <8e538839-349e-09db-cf02-8b8b4ee0abae@mind.be>
Date: Mon, 1 Aug 2022 20:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sen Hastings <sen@phobosdpl.com>
References: <20220728232357.270130-1-sen@phobosdpl.com>
 <20220728232357.270130-2-sen@phobosdpl.com>
 <20220801190417.061c2858@windsurf>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220801190417.061c2858@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=+p2YXiDPNZ9FYDPRqET6X+Aym7TLJH6WGdKXFSw0QwU=;
 b=Ytg8YAxUs630ZLH6h1n/LQFiyWx9y68+1PJbel87f2Bqufa4hiJueelLaC0hHebsWm
 WzjJ5XxFnXrcxowKnVON9K8XzKOT01at0lVlt/z5apn3xD3ZpW/B4S9BKHGq/+Pa7eD2
 DFRDaJm80YtAEZdpDstrIK++LUOtBiK3TKgNYmEYt55gGs7AlDJ64Lhb3zPFXUy5W1BH
 WfVpQU/4fd6k49L+JBfhLGPf8kP6oUXheRElXMMuRD+/SJNPNU6kamH9kQ/Ia0Ld5YY/
 FgRv1EdeV4kzIT6O1cmkH8P6oFaa7QqOug8rUGTt1SHHzcHJRlxx9KtkUT5Qp5UuCR3r
 rwUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Ytg8YAxU
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts/pkg-stats: adjust
 column widths
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Sen,

On 01/08/2022 19:04, Thomas Petazzoni via buildroot wrote:
> On Thu, 28 Jul 2022 18:23:56 -0500
> Sen Hastings <sen@phobosdpl.com> wrote:
> 
>> This adjusts the column widths, mostly for asthetics/legibility.
>>
>> It is primarily for chrome based browsers, which like to
>> linebreak on explicit hyphens, meaning every CVE takes multiple lines.
>>
>> see: https://github.com/w3c/csswg-drafts/issues/3434
>>
>> Signed-off-by: Sen Hastings <sen@phobosdpl.com>
> 
> This doesn't behave extremely well here as it prevents wrapping of the
> package .mk file path in the first column, making this first column
> larger than it was. I guess wrapping on "/" would be ideally for this
> first column.
> 
> Here the table continues to exceed the width of my large browser window
> (with or without this patch), which is not very nice :-/

  Since pkg-stats takes a pretty long time to run, it would be nice if you could 
publish the output of pkg-stats (with no .config) somewhere so we can look at it 
directly and notice these things easier.

  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
