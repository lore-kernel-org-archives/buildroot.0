Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D7AC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 10:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FB6183E53;
	Thu, 11 Jan 2024 10:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FB6183E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6gW7f1p6mPfI; Thu, 11 Jan 2024 10:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AE3983E56;
	Thu, 11 Jan 2024 10:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AE3983E56
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 338391BF2F5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B2E283E56
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 10:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B2E283E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SE70g-c1dy5g for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 10:31:57 +0000 (UTC)
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4532983E53
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 10:31:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4532983E53
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-40e5451c13aso22771085e9.2
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 02:31:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704969115; x=1705573915;
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PiRsgAfCRxURYG+BkLjlYIrcaplbZ33qbD0mZ0gkqok=;
 b=WmJAD9LPIuzXkI1kLQyTyCfimVsk2lD+0c5BsAsSPAeuTityWmepUI4aX4CCWRy0uY
 tp8Ut0V1PJxQx5FMlm4NXJQtqttS22iQ/8qDCqGzUWiBQ7f03VRbjPNLbgAmXHYSYaQL
 xGw/7Tqwy1TRuZMN6jhIPJCMkxdkCOkTzSN/r0HYSBEU7+jsn92NizB+jd2jEnnrN2UT
 /z+abmc/OUfPUmiZ2YJVWaFG3LxqfjhGAhN/0Qv/CBH2z1kt7PcKi8yz0CtPtGyBSOUR
 Xwd9yev29/Ex6LyLvt3ki3k7F9JiNqIZ/EdLZOw+iXgC09Tm+30UfAxSRoP0mSlVtAdd
 4Y4w==
X-Gm-Message-State: AOJu0YyrYzCc4+cQCJGoIQEE+WSTABO0ynVqOlrbXZA2gDPRCQuv4CuP
 UI3MYEYC7thvA4uu1Gum3D6TGUQQgTAwMQ==
X-Google-Smtp-Source: AGHT+IFE1Qf6neG70ITElGyqc2436F8F7BJAABVwduQCk1tRKGQ3rTJ2/QOTyWeem8Dw087hE3V4ZA==
X-Received: by 2002:a05:600c:4fcd:b0:40e:5662:1db with SMTP id
 o13-20020a05600c4fcd00b0040e566201dbmr174402wmq.238.1704969114851; 
 Thu, 11 Jan 2024 02:31:54 -0800 (PST)
Received: from [10.5.2.37] ([80.215.186.92]) by smtp.gmail.com with ESMTPSA id
 jg1-20020a05600ca00100b0040d4e1393dcsm5233377wmb.20.2024.01.11.02.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 02:31:54 -0800 (PST)
Message-ID: <2757abb8-16f3-45eb-8c27-6ab06cadea90@smile.fr>
Date: Thu, 11 Jan 2024 11:31:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240110163412.3977522-1-antoine.coutant@smile.fr>
 <ZZ7-2b0Hv75GJAA0@landeda>
From: Antoine Coutant <antoine.coutant@smile.fr>
In-Reply-To: <ZZ7-2b0Hv75GJAA0@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1704969115; x=1705573915;
 darn=buildroot.org; 
 h=in-reply-to:from:references:cc:to:content-language:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PiRsgAfCRxURYG+BkLjlYIrcaplbZ33qbD0mZ0gkqok=;
 b=j1Eo+yYHJDubbDzq0j6IRSBWGqhh13dq50gBWpvKM5+psYx282gWRNin5+UHSaBZ4/
 9+hyuYktJupaiJ23B8U/LLOkRHCEL1vjQ2YjQqsnMepgShg7/zO2bWuKKikyTz9foNYx
 7V6Rlh2ZTlgqOmCGlZVh39HG0JkSxoULi3HiiixjIbujkKhILIUwLKOFseXofkHB0DBU
 ItjEXupanMi6se9aaykcNUAJJ/mikZqCPngBFByX+wImfWn81R7gf9uzuIgIgmQb8c8R
 i4m8dEel1Bn9GQ2jbsxaN0xc/UPwyOZ7pJekYQ4wU8SBnny/KlGx7icKd7eWmXwxl5qq
 YfSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=j1Eo+yYH
Subject: Re: [Buildroot] [PATCH v3 1/3] Revert "support/download: generate
 even more reproducible tarballs"
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
Cc: sebastian.weyer@smile.fr, romain.naour@smile.fr,
 Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5144566105007635775=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.
--===============5144566105007635775==
Content-Type: multipart/alternative;
 boundary="------------tcugIsWZbqyFIHZcWYDfYNUj"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------tcugIsWZbqyFIHZcWYDfYNUj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Yann, All,

On 10/01/2024 21:32, Yann E. MORIN wrote:
> Antoine, All,
>
> On 2024-01-10 17:34 +0100, Antoine Coutant spake thusly:
>> From: "Yann E. MORIN"<yann.morin.1998@free.fr>
>>
>> Commit 768f9f80f62c (support/download: generate even more reproducible
>> tarballs) causes non-reproducibility in tarballs we previousy
>> generated, especially the archives for two cargo-vendored packages,
>> ripgrep and sentry-cli.
> [--SNIP--]
>> Reported-by: Antoine Coutant<antoine.coutant@smile.fr>
>> Reported-by: Thomas Petazzoni<thomas.petazzoni@bootlin.com>
>> Signed-off-by: Yann E. MORIN<yann.morin.1998@free.fr>
>> Cc: Vincent Fazio<vfazio@xes-inc.com>
>> Cc: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>> Tested-by: Romain Naour<romain.naour@smile.fr>
>> Tested-by: Antoine Coutant<antoine.coutant@smile.fr>
> You should have added your own SoB line here. The SoB line is abot the
> chain of propagation of a patch. I was the author, so obviously I SoB-ed
> it. Since you grabbed it and sent it, you are part of the chain of
> propagation, so you should SoB it.
>
> See:https://developercertificate.org/
>
> I was case (a) as described in there, you were case (b).
>
> Regards,
> Yann E. MORIN.
Ok thanks, I will send the patch back with my SoB.

Regards,

Antoine Coutant

>> ---
>>   support/download/helpers | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/support/download/helpers b/support/download/helpers
>> index 265685eff5..90a7d6c1ec 100755
>> --- a/support/download/helpers
>> +++ b/support/download/helpers
>> @@ -53,9 +53,6 @@ mk_tar_gz() {
>>       tmp="$(mktemp --tmpdir="$(pwd)")"
>>       pushd "${in_dir}" >/dev/null
>>   
>> -    # Enforce group/others mode bits
>> -    chmod -R go-wx+X .
>> -
>>       # Establish list
>>       find . -not -type d -and -not \( -false "${find_opts[@]}" \) >"${tmp}.list"
>>       # Sort list for reproducibility
>> -- 
>> 2.25.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
--------------tcugIsWZbqyFIHZcWYDfYNUj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Yann, All,<br>
    </p>
    <div class="moz-cite-prefix">On 10/01/2024 21:32, Yann E. MORIN
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ZZ7-2b0Hv75GJAA0@landeda">
      <pre class="moz-quote-pre" wrap="">Antoine, All,

On 2024-01-10 17:34 +0100, Antoine Coutant spake thusly:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: "Yann E. MORIN" <a class="moz-txt-link-rfc2396E" href="mailto:yann.morin.1998@free.fr">&lt;yann.morin.1998@free.fr&gt;</a>

Commit 768f9f80f62c (support/download: generate even more reproducible
tarballs) causes non-reproducibility in tarballs we previousy
generated, especially the archives for two cargo-vendored packages,
ripgrep and sentry-cli.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">[--SNIP--]
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Reported-by: Antoine Coutant <a class="moz-txt-link-rfc2396E" href="mailto:antoine.coutant@smile.fr">&lt;antoine.coutant@smile.fr&gt;</a>
Reported-by: Thomas Petazzoni <a class="moz-txt-link-rfc2396E" href="mailto:thomas.petazzoni@bootlin.com">&lt;thomas.petazzoni@bootlin.com&gt;</a>
Signed-off-by: Yann E. MORIN <a class="moz-txt-link-rfc2396E" href="mailto:yann.morin.1998@free.fr">&lt;yann.morin.1998@free.fr&gt;</a>
Cc: Vincent Fazio <a class="moz-txt-link-rfc2396E" href="mailto:vfazio@xes-inc.com">&lt;vfazio@xes-inc.com&gt;</a>
Cc: Arnout Vandecappelle (Essensium/Mind) <a class="moz-txt-link-rfc2396E" href="mailto:arnout@mind.be">&lt;arnout@mind.be&gt;</a>
Tested-by: Romain Naour <a class="moz-txt-link-rfc2396E" href="mailto:romain.naour@smile.fr">&lt;romain.naour@smile.fr&gt;</a>
Tested-by: Antoine Coutant <a class="moz-txt-link-rfc2396E" href="mailto:antoine.coutant@smile.fr">&lt;antoine.coutant@smile.fr&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You should have added your own SoB line here. The SoB line is abot the
chain of propagation of a patch. I was the author, so obviously I SoB-ed
it. Since you grabbed it and sent it, you are part of the chain of
propagation, so you should SoB it.

See: <a class="moz-txt-link-freetext" href="https://developercertificate.org/">https://developercertificate.org/</a>

I was case (a) as described in there, you were case (b).

Regards,
Yann E. MORIN.
</pre>
    </blockquote>
    <span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Ok thanks, I will send the patch back with my SoB.</span>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">
</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Regards,</span></p>
    <p dir="ltr"
      style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span
style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Antoine Coutant
</span></p>
    <blockquote type="cite" cite="mid:ZZ7-2b0Hv75GJAA0@landeda">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">---
 support/download/helpers | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/support/download/helpers b/support/download/helpers
index 265685eff5..90a7d6c1ec 100755
--- a/support/download/helpers
+++ b/support/download/helpers
@@ -53,9 +53,6 @@ mk_tar_gz() {
     tmp="$(mktemp --tmpdir="$(pwd)")"
     pushd "${in_dir}" &gt;/dev/null
 
-    # Enforce group/others mode bits
-    chmod -R go-wx+X .
-
     # Establish list
     find . -not -type d -and -not \( -false "${find_opts[@]}" \) &gt;"${tmp}.list"
     # Sort list for reproducibility
-- 
2.25.1

_______________________________________________
buildroot mailing list
<a class="moz-txt-link-abbreviated" href="mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>
<a class="moz-txt-link-freetext" href="https://lists.buildroot.org/mailman/listinfo/buildroot">https://lists.buildroot.org/mailman/listinfo/buildroot</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------tcugIsWZbqyFIHZcWYDfYNUj--

--===============5144566105007635775==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5144566105007635775==--
