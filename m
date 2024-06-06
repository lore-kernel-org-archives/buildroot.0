Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40070C27C52
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:40:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0289D4188A;
	Thu,  6 Jun 2024 19:40:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2qnyEco3wqF6; Thu,  6 Jun 2024 19:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FEB541925
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9FEB541925;
	Thu,  6 Jun 2024 19:40:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F0C41BF95C
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1984F41925
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNysoF8n9f17 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D7FBE41949
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7FBE41949
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D7FBE41949
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:40:42 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-42121d27861so14065065e9.0
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 12:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717702841; x=1718307641;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yLDPg9TMeKN1AGYgfz6Fo+tSapr5lxVY6U58LEmK5lA=;
 b=Ul4FCjeK4KTMc5lYY3NhSjbSIAC7bJ4d961eOk/uBiE+zkLR2rARpqNhNGsxtchEQG
 6vCOigVCqBD1YEoOYy/yAHcj3YKDTwGYGAJRPMPklBY2RxQdecuGilvqspPqZcAdulGD
 yktT3Avqrk8cx1IKnuysN6gNQHTgZyZ1dGQJwaP+y0/scK7ZVYNbmWReqlCtkB4bQDPZ
 7HWt9mswaVuzqZnVAh+KTtjNItSoZcmrOJ0d91+0YeNja5pop0IQvdhyXp/FLgUxzwGL
 5ha28S9Iw2VeKeVTDbA9o4FiwZrnq2Ii4TyxCwaVgPbTcrR9aKM5qIxLxebRd7+Y2YVh
 ZdrA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCoyMH3vCRCdCw0Y8yl4gWbD4QkEY8t+LmYVY/owIr+tXPmcnHmLxHbB5NN3rzeYhFbF9MgBCTOGyF9z7Y5YiQP2Hsh+P8ig==
X-Gm-Message-State: AOJu0YzjAV53HOM/Yn68TAaB1L9Pl/eA3nXvgSjC4EtrL5KYtP6tvINT
 /QpgcwQ6J1qtzJd1ACRkG/Q4zUMpP9n5434TtjwL1LRPqpNjwpxfEwNqKz9BUgs5dIW3uPVhA5M
 K
X-Google-Smtp-Source: AGHT+IF0rOl9wdf27PMebCQiZAIy+uUxe5JPSMysz9JyyWlwPhulM2Y+hwLviIyoDqqu7TRYPEtTHw==
X-Received: by 2002:a05:600c:4ec9:b0:41b:3c4c:211b with SMTP id
 5b1f17b1804b1-42164a0dbbfmr5712865e9.22.1717702840686; 
 Thu, 06 Jun 2024 12:40:40 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4215c2a6130sm31051965e9.26.2024.06.06.12.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 12:40:40 -0700 (PDT)
Message-ID: <7322a32d-34a5-4c8b-82b2-c3d0be46d32f@mind.be>
Date: Thu, 6 Jun 2024 21:24:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20240514215406.2866563-1-bernd@kuhls.net>
Content-Language: en-GB
In-Reply-To: <20240514215406.2866563-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717702841; x=1718307641; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yLDPg9TMeKN1AGYgfz6Fo+tSapr5lxVY6U58LEmK5lA=;
 b=fcasR4reMw7ECO+OBRhVBgmNPl/yC/T5LkJOOf/MgfHSupFo0wLhUhSqiZqFGcOME+
 j/Ott3QYLlMDnHviWOnXbV7c5qUL9UD0ZzfuenRyE6LGics4XexcocWLUtuXqG1Iekhn
 aTgk/etBqHjFbI715tsEIIPPWCkkLJh1463BdbabcNRJ/IsjMDFLBv3lU6/clPV9OuZu
 WS2PhV3b/RtyV2BKfA3cf5uBeXCn3E1bz6eG29KpMrb5HrI55uLoV8ngACbOA89bzfgE
 v4gLsSuaQmxl/xK5R+CBkwTFiVxoKPLvJVDudMLziLmvVghQ7yMnffzDYpVflpBx73Dl
 WdPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=fcasR4re
Subject: Re: [Buildroot] [PATCH 1/5] package/bc: fix build with gcc 14.x
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
Cc: Gregory Dymarek <gregd72002@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/05/2024 23:54, Bernd Kuhls wrote:
> Fixes:
> http://autobuild.buildroot.net/results/4d3/4d3c0e0a08cd734699cb61412c99d705738e8ab4/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Series applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...and-write-errors-on-input-and-output.patch | 41 ++++++++++++++++++-
>   1 file changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
> index cc72e5cd69..87654e3c14 100644
> --- a/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
> +++ b/package/bc/0002-notice-read-and-write-errors-on-input-and-output.patch
> @@ -26,6 +26,10 @@ Origin: other
>   Bug-Debian: http://bugs.debian.org/488735
>   
>   Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +[Bernd:
> + Updated to incorporate changes by Matthias Klose <doko@debian.org>
> + on 2024-03-13 that fix Debian bug https://bugs.debian.org/1065375]
>   ---
>    bc/execute.c | 10 +++++++++-
>    bc/main.c    |  3 +++
> @@ -276,6 +280,14 @@ diff --git a/dc/dc.c b/dc/dc.c
>   index 6a2bb26..ccdb1c2 100644
>   --- a/dc/dc.c
>   +++ b/dc/dc.c
> +@@ -45,6 +45,7 @@
> + #include <getopt.h>
> + #include "dc.h"
> + #include "dc-proto.h"
> ++#include "number.h"
> +
> + #ifndef EXIT_SUCCESS	/* C89 <stdlib.h> */
> + # define EXIT_SUCCESS	0
>   @@ -59,6 +59,7 @@ static void
>    bug_report_info DC_DECLVOID()
>    {
> @@ -304,6 +316,14 @@ diff --git a/dc/eval.c b/dc/eval.c
>   index 05a3d9e..6c54e61 100644
>   --- a/dc/eval.c
>   +++ b/dc/eval.c
> +@@ -41,6 +41,7 @@
> + #endif
> + #include "dc.h"
> + #include "dc-proto.h"
> ++#include "number.h"
> +
> + typedef enum {DC_FALSE, DC_TRUE} dc_boolean;
> +
>   @@ -97,12 +97,15 @@ static int input_pushback;
>    static int
>    input_fil DC_DECLVOID()
> @@ -512,6 +532,14 @@ diff --git a/dc/misc.c b/dc/misc.c
>   index cd23602..cd910b8 100644
>   --- a/dc/misc.c
>   +++ b/dc/misc.c
> +@@ -47,6 +47,7 @@
> + #include <getopt.h>
> + #include "dc.h"
> + #include "dc-proto.h"
> ++#include "number.h"
> +
> + #ifndef EXIT_FAILURE	/* C89 <stdlib.h> */
> + # define EXIT_FAILURE	1
>   @@ -89,6 +89,7 @@ dc_show_id DC_DECLARG((fp, id, suffix))
>    		fprintf(fp, "'%c' (%#o)%s", (unsigned int) id, id, suffix);
>    	else
> @@ -593,8 +621,11 @@ diff --git a/dc/stack.c b/dc/stack.c
>   index 49422df..174411d 100644
>   --- a/dc/stack.c
>   +++ b/dc/stack.c
> -@@ -35,7 +35,10 @@
> +@@ -33,9 +33,13 @@
> + #include "dc.h"
> + #include "dc-proto.h"
>    #include "dc-regdef.h"
> ++#include "number.h"
>    
>    /* an oft-used error message: */
>   -#define Empty_Stack	fprintf(stderr, "%s: stack empty\n", progname)
> @@ -657,6 +688,14 @@ diff --git a/dc/string.c b/dc/string.c
>   index dee9169..389d899 100644
>   --- a/dc/string.c
>   +++ b/dc/string.c
> +@@ -45,6 +45,7 @@
> + #endif
> + #include "dc.h"
> + #include "dc-proto.h"
> ++#include "number.h"
> +
> + /* here is the completion of the dc_string type: */
> + struct dc_string {
>   @@ -94,6 +94,7 @@ dc_out_str DC_DECLARG((value, discard_flag))
>    	dc_discard discard_flag DC_DECLEND
>    {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
