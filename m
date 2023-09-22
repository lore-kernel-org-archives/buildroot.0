Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BD7CD4850
	for <buildroot@archiver.kernel.org>; Fri, 22 Sep 2023 18:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 240AC61695;
	Fri, 22 Sep 2023 18:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 240AC61695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDTY-eNPNzvK; Fri, 22 Sep 2023 18:58:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AEA961690;
	Fri, 22 Sep 2023 18:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AEA961690
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE58D1BF3EE
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 18:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C49A661659
 for <buildroot@lists.busybox.net>; Fri, 22 Sep 2023 18:58:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C49A661659
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vni7nbHwsZZI for <buildroot@lists.busybox.net>;
 Fri, 22 Sep 2023 18:58:27 +0000 (UTC)
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B8B0861683
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 18:58:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8B0861683
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3214de9cd8bso2315553f8f.2
 for <buildroot@buildroot.org>; Fri, 22 Sep 2023 11:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695409104; x=1696013904;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rtyxSRtZ1Xy7f7FmB0wb1t2+LdsfDMoVrVrW1lKtW8k=;
 b=elnx3vyshP4jKUXByEUfzXoGph5pjgngML1RQ0OWTO31pGJKVsRNN8cwqTSQxcWnMj
 Dp2lbX4hCpUsjBeZxjr2UAYb6DG9FUGwUgz7Uw8FqWNi/e3oVMAIfOUdYXdC0k5bD551
 MRjE0xFdBl4LAujIGnzmq4XUplo4Mnzl2NLXkhDohnP6VyK2ltE7Vvk3ygpfX67ihiA3
 rdOV8BQBxwnKHgrdbpEQIi5IOblHHxls2R+I59KLT/AjvFmFlydXO9rsXN1uYKsAJsW0
 oQcIMepLVehal2GjZBkrYGrMiubnsIktSwXcMX0B8hoUkSK2XwI0Z1hqZy44Qw1zd3O7
 RmRw==
X-Gm-Message-State: AOJu0YwTr4FN8oNhMnwK1atYo25RrmVZaxmNMiVTsvGPB5oesI9a9UmJ
 jXRL5W8m8cOMtaLHTZQDQWE2CA==
X-Google-Smtp-Source: AGHT+IFWxKqEB6/VOX1KWR63Vp7MKxpN4V5dyYs1gGyecPMeg0e2x81mnMQAzJHj7GBu3J+NOO1zvw==
X-Received: by 2002:a5d:53c4:0:b0:321:cec8:e64d with SMTP id
 a4-20020a5d53c4000000b00321cec8e64dmr498692wrw.62.1695409104246; 
 Fri, 22 Sep 2023 11:58:24 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a170906a40500b009ae4ead6c01sm3059309ejz.163.2023.09.22.11.58.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 11:58:23 -0700 (PDT)
Message-ID: <5cd153c7-7e4c-d9cb-72b1-5a64a75cf6ea@mind.be>
Date: Fri, 22 Sep 2023 20:58:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Lang <dalang@gmx.at>
References: <20230906200929.291410-1-dalang@gmx.at>
 <20230908223239.06963447@windsurf>
In-Reply-To: <20230908223239.06963447@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1695409104; x=1696013904; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rtyxSRtZ1Xy7f7FmB0wb1t2+LdsfDMoVrVrW1lKtW8k=;
 b=Iolr0lqGGoo/3YOH/EYRlYuTkyCGDTi4vBzVaDrB3PRoU5S9+EKF4n6GB1XYLTgS3+
 J0NFFFbSyvqeHQtGe+DSBc2RDQP+Y0gBCDThq4Goq7MvJzkcQtmWoDA+mezDDAka5U13
 V6H8qREg9SboB+kgigzdFQzNnxKZHhv7Ul5Egts1OOf4E7Vaa4vB2goY67hisJisb/la
 +hfS/yITMil/0XBdSvWhGi+/ZWB1+ebXhggF/mdYrc3cOEM3m95VaN3YBQxjwlcRFFOm
 V4nGdBXCRGGUP1BHNyYqq9X2VMO96VEp2pUQ8UFBhwvOsk6bNon4CarJUx1/sxHT8XGY
 OlSA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Iolr0lqG
Subject: Re: [Buildroot] [PATCH] package/libssh: ignore CVE-2023-3603
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



On 08/09/2023 22:32, Thomas Petazzoni via buildroot wrote:
> Hello Daniel,
> 
> On Wed,  6 Sep 2023 22:09:27 +0200
> Daniel Lang <dalang@gmx.at> wrote:
> 
>> The affected code isn't present in any release, see [0].
>>
>> [0]: https://www.libssh.org/2023/07/14/cve-2023-3603-potential-null-dereference-in-libsshs-sftp-server/
>>
>> Signed-off-by: Daniel Lang <dalang@gmx.at>
> 
> Here the NVD database tells us that the following CPE identifier is
> affected:
> 
>    cpe:2.3:a:libssh:libssh:-:*:*:*:*:*:*:*
> 
> So the version field is not '*', but '-', and I think our pkg-stats
> script doesn't do the right thing when handling '-'. I remember asking
> the NVD maintainers about this, and they replied:
> 
>      The '-' in the URI 'cpe:2.3:a:ntp:ntp:-:*:*:*:*:*:*:*' is used
>      because the affected version was not specified. We need to use the
>      '-' when the affected version is not specified otherwise, using the
>      '*' will incorrectly call all versions of NTP as vulnerable.
> 
> 
>      The '*' is the wildcard, while the '-' is used to represent
>      unspecified versions, a placeholder to an update, as explained
>      earlier.
> 
> I believe right now pkg-stats handles '-' like '*', but I'm not sure
> it's the right thing to do. But the answer from NVD didn't really help
> because "unspecified versions" doesn't mean much.

  On the other hand, we can't interpret it as "this CVE doesn't apply to any 
version at all", because for all we know we actually _are_ using a vulnerable 
commit sha. And I'm sure there are other situations where the - is used that we 
also can't simply exclude.

  I think we should interpet the - as "human intervention is needed" - which is 
exactly what happened here.

  Therefore, I applied the commit to master, thanks. I extended the commit 
message with a bit of the above information.


> Another thing that would be good to do in pkg-stats is warn if there is
> a CVE listed in <pkg>_IGNORE_CVES, but this CVE in fact does not
> affects the package. This would allow us to catch mistakes, but also
> cases where a CVE was added to the ignore list, but no longer needs to
> be in that list because the NVD data has been updated/improved.

  +1 to that!


  Regards,
  Arnout

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
