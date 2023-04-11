Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919F1C76196
	for <buildroot@archiver.kernel.org>; Tue, 11 Apr 2023 07:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30388418FE;
	Tue, 11 Apr 2023 07:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30388418FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6M_yUyxEaTWZ; Tue, 11 Apr 2023 07:06:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F8C341928;
	Tue, 11 Apr 2023 07:06:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F8C341928
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F25F1BF2F2
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 07:06:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5805D40640
 for <buildroot@lists.busybox.net>; Tue, 11 Apr 2023 07:06:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5805D40640
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hO3rPgoPWtqf for <buildroot@lists.busybox.net>;
 Tue, 11 Apr 2023 07:06:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BE25405BC
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BE25405BC
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 07:06:04 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id o18so6453026wro.12
 for <buildroot@buildroot.org>; Tue, 11 Apr 2023 00:06:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681196762;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+1uVwNXD54WcyAAtOuI+FOfAa3TS3quiMzJtwWghC3A=;
 b=INcehH//+jyk6ZHGO/65L8m19lzijzH8hCgSV+Y9a3pnWxdv69cUgm7EHoiW8605YC
 Zf6XXeOeez0ZzHCuIv4JI0IvltBZb3DZSF4ZPRgo6rXJxOzwoBP14E4HoNc3wDGEPHS5
 5anj+r/DHJCOcVOGywYGCs3qZegshlmv9UwFxzFBdW0h7J4XZHBm5x2gFvItaqaFmMPU
 P5ijjeiMNBlLl2vJVDHKs4B5KPwij8yaWzGS6E1onPCYAKFmZzVAnIMoW5QppT2zalxZ
 6LkchOzRo/GP6smpc8L9fhPCZMmoF58zsxdYvE18vn1R54tgGzDBQdC28eSwekGch0hQ
 bP2g==
X-Gm-Message-State: AAQBX9dZFESU+EbIJ4xQ+YoXbsAzCHhz1rPfVR7yO9cRBXWdB/fxOGN/
 84EW6jA/ubNxhd2cNA20tA+rVg==
X-Google-Smtp-Source: AKy350adHgDS8xc1EJMrI3gfmAyshgkytySVQBoKbRo8jWdCnWbC6ago92jrqoWC41xP3dlil1yGcw==
X-Received: by 2002:adf:dfcc:0:b0:2ef:af46:1278 with SMTP id
 q12-20020adfdfcc000000b002efaf461278mr8265871wrn.10.1681196762244; 
 Tue, 11 Apr 2023 00:06:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 r12-20020adfdc8c000000b002d1e49cff35sm13806242wrj.40.2023.04.11.00.06.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 00:06:01 -0700 (PDT)
Message-ID: <56b6fb34-6d61-785f-e131-3eed3fca5842@mind.be>
Date: Tue, 11 Apr 2023 09:05:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-GB
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Knight <james.d.knight@live.com>
References: <SN4P221MB0682D9AC28AB53863A652575A0969@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
 <20230410211106.GO2819@scaer>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230410211106.GO2819@scaer>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1681196762;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+1uVwNXD54WcyAAtOuI+FOfAa3TS3quiMzJtwWghC3A=;
 b=OTEw4+q8k1nt/RUD1vxYstSgwA8pX8JuRmgLT0b5YCud2Cfv4jij5F1xf0vASbIdPS
 6e4AR9P1J0o44n1UA8lQJComGsZfzBviYHOJ8fNgsNtNsiiCsLDKHycyew95H3MwGGMM
 nfUmw5sEIthIzgjdsnMjEF9hA/xDm6jciQSSF/I1xMkhvSb8POnMS5bm933WOHx/JAm/
 fNgIW8nVZp/dBcI7nhM32fm3gjdR7+YVfkSel4FUraiROUvN7AZIJCbNTbINMrNiEnHA
 mOGLzWhCkjYWHBGpzUsr5GgkJmDm+hHzP7b1bHzvIVkJ8NpMJoYD408yrTq5nSvomJmB
 1fKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OTEw4+q8
Subject: Re: [Buildroot] [PATCH v2 1/3] board/qemu: define start qemu script
 outside of post-image script
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 10/04/2023 23:11, Yann E. MORIN wrote:
> James, All,
> 
> On 2023-04-07 01:21 -0400, James Knight spake thusly:
>> The following moves the definition of the QEMU board's `start-qemu.sh`
>> helper script from being inlined in the post-image script into its own
>> file. This should, in theory, make it easier to maintain the script in
>> the future.
>>
>> Signed-off-by: James Knight <james.d.knight@live.com>

[snip]
>> +cp "${QEMU_BOARD_DIR}/start-qemu.sh.in" "${START_QEMU_SCRIPT}"
>> +sed -i "s|VAR_DEFAULT_ARGS|${DEFAULT_ARGS}|g" "${START_QEMU_SCRIPT}"
>> +sed -i "s|VAR_QEMU_CMD_LINE|${QEMU_CMD_LINE}|g" "${START_QEMU_SCRIPT}"
>> +sed -i "s|VAR_SERIAL_ARGS|${SERIAL_ARGS}|g" "${START_QEMU_SCRIPT}"
> 
> This can all be done with a single call to sed, without cp either:
> 
>      sed "s|@SERIAL_ARGS@|${SERIAL_ARGS}|g" \
>          "s|@DEFAULT_ARGS@|${DEFAULT_ARGS}|g" \

  Have you tested this? AFAIK, multiple expressions need a -e to interpret them 
as expressions (now they're interpreted as file names).

>          "s|@QEMU_CMD_LINE@|${QEMU_CMD_LINE}|g" \
>          <"${QEMU_BOARD_DIR}/start-qemu.sh.in" \
>          >"${START_QEMU_SCRIPT}"
> 
>>   chmod +x "${START_QEMU_SCRIPT}"
>> diff --git a/board/qemu/start-qemu.sh.in b/board/qemu/start-qemu.sh.in
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..c2d77734c7a6b318a5f7adedfd9b0b5875e84f59
>> --- /dev/null
>> +++ b/board/qemu/start-qemu.sh.in
>> @@ -0,0 +1,14 @@
>> +#!/bin/sh
>> +(
> 
> No need for a sub-shell.
> 
>> +BINARIES_DIR="${0%/*}/"
>> +cd ${BINARIES_DIR}
> 
>      $ shellcheck board/qemu/start-qemu.sh.in
>      In board/qemu/start-qemu.sh.in line 4:
>      cd ${BINARIES_DIR}
>      ^----------------^ SC2164: Use 'cd ... || exit' or 'cd ... || return' in case cd fails.
>         ^-------------^ SC2086: Double quote to prevent globbing and word splitting.
> 
> The first is spurious (BINARIES_DIR is eaxctly where the running shell
> is), so ignoreit , but the second is valid, so:
>      # shellcheck disable=SC2164
>      cd "${BINARIES_DIR}"

  Global set -e probably would have been useful for this script.

> 
>> +if [ "${1}" = "serial-only" ]; then
>> +    EXTRA_ARGS='VAR_SERIAL_ARGS'
>> +else
>> +    EXTRA_ARGS='VAR_DEFAULT_ARGS'
>> +fi
>> +
>> +export PATH="${HOST_DIR}/bin:${PATH}"
> 
> This is the pain point: what is going to set HOST_DIR when this script
> is called? I think it should be substituted like the other variables, so
> this is what I did. The script can't be easily relocated, but that was
> not the goal for this script to be relocatable so far (it was only ever
> used in our CI), so making it relocatable can be done later (if
> possible).

  Should be rather easy since the script is put in BINARIES_DIR.

  Actually, if we assume that the script is indeed not used by anyone except our 
CI, we can put it in HOST_DIR and make finding HOST_DIR even more trivial! Of 
course, finding BINARIES_DIR becomes a little more difficult then :-)


  Regards,
  Arnout

> 
> Applied to master with all the above fixed, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
>> +exec VAR_QEMU_CMD_LINE ${EXTRA_ARGS}
>> +)
>> -- 
>> 2.39.1.windows.1
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
