Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742AFC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 07:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03004404AB;
	Wed,  3 Jul 2024 07:01:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JLeK1yT_fGog; Wed,  3 Jul 2024 07:01:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E40641A41
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E40641A41;
	Wed,  3 Jul 2024 07:01:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A5D61BF363
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 07:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6291141A41
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 07:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_lgi87KlIah for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 07:01:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BFE07404AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFE07404AB
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFE07404AB
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 07:01:39 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-425809eef0eso22121995e9.3
 for <buildroot@buildroot.org>; Wed, 03 Jul 2024 00:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719990098; x=1720594898;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I8t50CBObo2yxc69DABdC/WCnXLKcXL+/uiiedkaOjY=;
 b=G3/SD1eP8Dz6wiY1848rAFNxoifDI3QcxerBwQZRlwhQStHuFmzXJBMYyskvE/dtGE
 fHUR7rifE/KtY7YlobSQdWznX+9bOASWO/UpsLLAEW3kmHzm1y72ilEX7TCdJE812sOp
 JfZGusaLgyh1T5+bhYFJrB2zGrM82wiie69WW5Coar6VKmQzMwtBoBOemzkSorXGAfsy
 8Lj8Epn9uddu8DEXwhd+PrFs0/EopB5d41YY89cNiBjvFsUI8Dq6qYUpXzeJQIecCjj/
 AaZ7IGkO3r5DahtLpsZsAj3cJAsAZYqp1C4NbL//9JAbAB+eGfooZQ9XWDwdRwTBJxax
 nngw==
X-Gm-Message-State: AOJu0YxGS+ecT2ZiVQQ5adE2FTgZzxFi+W99ragG5x6pPzkUfR9girfc
 oRySy5G4rOMh08vPpUzv8xQnXddSmSSYcT07pF9DiRrJiWwzqyv6+GrvHBIqq3E=
X-Google-Smtp-Source: AGHT+IFdgLhWR+doD1dNiuW4BopHJdlLWUmh815VLAFVVCp2q/L4pklzu0QodVI6Ctmr6GCImMNsLA==
X-Received: by 2002:a05:600c:1508:b0:425:5a26:a12c with SMTP id
 5b1f17b1804b1-4257a02f915mr73962855e9.13.1719990097966; 
 Wed, 03 Jul 2024 00:01:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256aed237dsm228412825e9.0.2024.07.03.00.01.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 00:01:37 -0700 (PDT)
Message-ID: <8fe270a0-708f-49f8-972e-221e99f23f08@mind.be>
Date: Wed, 3 Jul 2024 09:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Fiona Klute <fiona.klute@gmx.de>
References: <20240702165708.3796162-1-fiona.klute@gmx.de>
 <20240702165708.3796162-2-fiona.klute@gmx.de> <ZoRf7pXimhw4wh-s@landeda>
Content-Language: en-GB
In-Reply-To: <ZoRf7pXimhw4wh-s@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1719990098; x=1720594898; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I8t50CBObo2yxc69DABdC/WCnXLKcXL+/uiiedkaOjY=;
 b=dP5VUu0r/4uw9vQWaJid71ObTs9Iqin8vTiemhpqc8ObTn9x3PtmRwEqZT7WWc9Z6C
 t6kwDWoyrm/5ipfKFlOJqPWz6HQEsTdwU5e40W+a6aX4OcSFMXH1PeprqljpxSb7mNTM
 KOtC0cXUwIJzppHaJOURqy50lB/6K35v4Eesrnl3trQv7/R8u04iOIYFE8L6Ld4QS3gj
 4OolX52jxtJOloqKJ5dCbDpG18zYomRHCtYuxaDlQQGU0eMiyjq57F78uWC693LPh87O
 g04Pf3X9CbwSo00cziVf44XlMnv/Pdzwu1X5NgDkSbcl/KLgU80ZDg5qWIjwSfb1oX2z
 VPXQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=dP5VUu0r
Subject: Re: [Buildroot] [PATCH v2 1/4] package/openssh: don't kill open
 sessions on restart
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/07/2024 22:15, Yann E. MORIN wrote:
> Fiona, All,
> 
> On 2024-07-02 18:57 +0200, Fiona Klute via buildroot spake thusly:
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
>>
>> The previously used "killall sshd" stopped all instances of sshd. With
>> OpenSSH before 9.8 that meant not only the listening server, but also
>> instances serving currently open sessions, possibly including the one
>> used to send the restart command, preventing it from completing the
>> "start" part of "restart" and leaving the system unreachable over SSH.
>>
>> Instead, use the PID file that sshd creates by default to target only
>> the listening server. This leaves any open SSH sessions unaffected.
> 
> Rather than play with the PID ourselves, can we use start-stop-daemon
> instead? Currently, we run sshd and it daemonises all by itself, but if
> we pass -D, then start-stop-daemon will be able to do that, and handle
> the PID file automatically for us.

  Note that there's a little disadvantage of that: when sshd daemonizes by 
itself, it will only return after the real daemon has started listening. If 
start-stop-daemon does the daemonisation, it will return immediately.

  I don't think this is important enough to not daemonise with start-stop-daemon 
- if you need fine-grain control by the init system you should use a proper init 
system. But it's important to be aware of the implied limitations.

  Regards,
  Arnout

> 
> Regards,
> Yann E. MORIN.
> 
>> With OpenSSH 9.8 open sessions are handled by the separate
>> sshd-session binary so killall does not hit them any more, but
>> a targeted "kill" command is still desirable.
>>
>> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
>> ---
> [--SNIP--]
>> diff --git a/package/openssh/S50sshd b/package/openssh/S50sshd
>> index 22da41d1ca..f1ff9dfec1 100644
>> --- a/package/openssh/S50sshd
>> +++ b/package/openssh/S50sshd
>> @@ -3,6 +3,8 @@
>>   # sshd        Starts sshd.
>>   #
>>
>> +PIDFILE="/var/run/sshd.pid"
>> +
>>   # Make sure the ssh-keygen progam exists
>>   [ -f /usr/bin/ssh-keygen ] || exit 0
>>
>> @@ -14,15 +16,25 @@ start() {
>>
>>   	printf "Starting sshd: "
>>   	/usr/sbin/sshd
>> -	touch /var/lock/sshd
>>   	echo "OK"
>>   }
>> +
>>   stop() {
>>   	printf "Stopping sshd: "
>> -	killall sshd
>> -	rm -f /var/lock/sshd
>> +	pid="$( cat "${PIDFILE}" 2>/dev/null || true )"
>> +	if [ -z "${pid}" ]; then
>> +		echo "ERROR: not running"
>> +		return 1
>> +	fi
>> +	kill "${pid}"
>> +	# SSHD deletes its PID file when exiting, wait for it to
>> +	# disappear.
>> +	while [ -f "${PIDFILE}" ]; do
>> +		sleep 0.1
>> +	done
>>   	echo "OK"
>>   }
>> +
>>   restart() {
>>   	stop
>>   	start
>> @@ -44,4 +56,3 @@ case "$1" in
>>   esac
>>
>>   exit $?
>> -
>> --
>> 2.45.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
