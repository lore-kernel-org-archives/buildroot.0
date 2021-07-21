Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5B2BC6377B
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:18:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59DBA61246
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 22:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59DBA61246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=att.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2686A6062A;
	Wed, 21 Jul 2021 22:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id shEt92kECoFL; Wed, 21 Jul 2021 22:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B782605D2;
	Wed, 21 Jul 2021 22:18:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A58FC1BF859
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9573A81CE1
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 22:18:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=att.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OG-ELRglYFVD for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 22:18:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from sonic307-13.consmr.mail.ne1.yahoo.com
 (sonic307-13.consmr.mail.ne1.yahoo.com [66.163.190.36])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E9D7981CD0
 for <buildroot@busybox.net>; Wed, 21 Jul 2021 22:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1626905924; bh=uM0CPl5HmoRhmgDwEMnitGYAAYXarWe0SBUP5ALi9Nw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From:Subject:Reply-To;
 b=q+Edr/+sQPAegrnx81lFBmhhPuEHo5plqqnbCFy/ga3LugMfG1OKIoZVulOGh0nSjrzNn5UlUTmjd+SEHd0DF/7u4vQq4nHnzvCkENYLHdvCxGYkxZZzbyfx+qpVlnksi02jZKioL9+CE8PY2jdsQKVyzxT+pyyhNqF8OexmFRE=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1626905924; bh=xFgArHh2EIus0ljgaYjA8pVasJLvjgj1pxSj8klwXEE=;
 h=X-Sonic-MF:Subject:To:From:Date:From:Subject;
 b=hGJtg1oxRNRRLm+VufkKPr+ry3V+1o0zSkOE52qGj6TQxv+dTvQEbDUghnqXj8m8VjMDCPABEoLQ7zAEJ1eBcFXfFRxFdnoMAy8Wjs1m2WXWOhiUh2H5Ysgi6j5DTW0BjLSJEsewOZaPKqmwMIAv8yh+DPF1VnRN0Me73pyNV3Z5sgzKXsUPBNWzZ00PoEgoVG19ZF9in4gn0fmsXMedO2Sk+WAzOSpi+CGz8DxupyikkXs9JjWRFYGfuu5teppDHYJHZQSXvmz8L64/KmhQPPOHedsTIljijAsDm6fH8kw5tb4efwPFE1wg/78G6oEnUlGwRbCf7bOncAU4+v12Tw==
X-YMail-OSG: JeUhyucVM1nNSv86zSkwnB_gundigmYad1IICUnWBb0onkS8IW04bV4y4l9zqx7
 uloPwOZzID4mpYWStP3cRiFbnOoJ0ifcqpBROSZeU6otnia790KTvBquhw_nCSdcgjixqo7aalsr
 dwxNGIDy4vnf6W7I7WTOze2dBxusbTTl1lElO9bcACxw_phF6ziiy9U3YkmsAnpCoKfAYl2bkNT8
 UV49_QR92aJVmB8EuglEAhpHbxwlxwwuv62k4EYM3UJR93hlXQ21GsXpmGZz2SxYXp5SdtpmKGLU
 uxV.6Yy1JkWizitr1fNKbCN8p9VelauDi0ZG.f958vN8SAWGY5WQX8_o2eMjjIBFD33tjLVYLL0c
 CpcUe5UOh2JfZh6JM_NxDS2ejDUR98tQl8mhQ3F44AngEpn4FOnw8OxJUV5CAuVNlibl8hwZSPKZ
 79MSM8LB8KKrw.F82SaJYB15RzhdZtxcokeV.9ukk9VQl3XscVbMu2xHj7dt4TzlgZOwsy5LTruH
 p7JC7QxQkobJ9vd0UXxARF.c8IQl76_Fky04_JQblRrudPDsEAI.WkVwppf9skUa33Vt0OhzitX0
 toIpVAaSAY2WsU_NjvmAIAET02eEJBGt0tfeiKFJ5iPlQ.f5nrKdFCqrudeAmMVELbDWS9ezSmbi
 XHZIerx2PdQVlRWR3ezCUk_L64fwj7Kx89UCV8tEXgvaroYbJ41ltkKk24K94nnaNqd5bEyDP7RM
 7PH.Gx1ZjvE9HsuTt8pXBOm2NKHxsIN4B7y944jW1hO.SzgufTXi_9mQE.FoDCFOxtMwjubhvBp4
 85K_rOcds18HllSOTOGyeff1HhOuCUtfARBozoP1_MfHGzwZSoNOc_xfhIKjAYN2Xm48XLLJNTGf
 jN3euZfuVe55NU3zWC_6obLA9RRvS9xkKIvUoScU33iKj.lLEKxj9yzCn97.4VLzLPX2AdI7DrYi
 tuF.pP3QrXgg4onKrpQqdOpkNSJSORmPxTuMZ5g1EpHjnjRXvqJZjx_iOAFOTHP8yvhEFEBvdNIj
 tqpLd3CsFXbHuxRunrVnHjUi94kS5CeqxmByHkT2zj1R.UyIGvBfS.T3ZlQC5bjxmLvm04.3hbsx
 Es3kE.3MIf3_krs6q7wUt7tXFMRfhNLkYZBFxlbhlMT7RVmeF76H7uSS7DMNhIB.MsNfmqCr1C0A
 hft8oPxrZd9xB70AEZ8EzHoxy4wB4KnWceXc8UFs75gZifasKn01BPRafwNXiHV8zkNEn2SpoJh7
 Z2m4uefixzQHKHT0tI6ats0yFas4jsO4ORE8LzqdBWM6wOH00BNRntiEBY_rtc_Cy3ByvfyLqjQG
 R1ihDtWJqtVWz2ufWo6pFVDMSeL59s1nzqHOSo_EYu74QEM.p10bFg8fD_MEouiqjtjBYEi2CLu8
 XfxcIrqfwbdi42wKnL_NlFUwvnbOjsa8df_AQGgZvkFafJgwzXth70vDL7g_kJqlJ8Aucnu7P3kR
 ILlTHGB1i.Y5CQvDOB79zwW2vZwUECToL9f498uQM8Bj6fNLTpFMKgiy74aNL7z2ivBtzNGZ91Rk
 ke8HppF7SzI4nfgn.nm5AhcpOAbstOwyzK8pWylwgJo7Zl_YNCga6ibvqI_L4eeN2x_AWGb.cadh
 KSKQ4AGLqYrwuXicm87_oXk_SQiAlw3zz9jtrsVdFGyfK8ByJd4JX54fA2eEweya3_awUBNVQVzG
 WVeOF3nghFu72.JXBxkBqhzhnQA9v41EQEqXnUsE4wZyY0eckluz.LKcYDeofvTu_ud_BD_DyENk
 Rjglon2CjyHqOXj579aqL3Ff25VvGIUUOlSdoWKdQ.U7kVMaWjHKvfo3fu4bSoH9Ilh7oY45cjIQ
 tFQYnvhwc8V.MlgXBh_W3q734IXzf2V3a4ly10N6.m4fnVa4uP6TiTlixkRqT_hpXfc.MsIYTj0k
 _4FelgyjAZUedPbp9XgyeUcHehuTIRHw0OO9HyC_IcVhUcIOWBxr3bG9qvGpmDtSRQ_329Yyxcqm
 GjeKBt2i9djAeodSsjrs4Pv6p2L5gsqetaoexs5a4PwUC3NGE5zV7MZ5GrvrF3q0xLL1xc3GFGVa
 _rHI4fuKBf6DbcrE1Tv9DSFOoyKlcOMDF.qDYccXbxmZDftiE1.zXu72OKQC_YI3kBnDgYTIqPLa
 46xgyqmvhC.5D_83v9c00eMIhMZrOjTkZ6et8EgXfXnaZNE7nBWyfFtxT1ZnPPlJ9rDPmnxyrjD7
 Tj9qWGkasHtBfpK.uqolJjNAvnXTysq2Oaomrt1WrZAeSVDjCkWezg1smn8LKy5QLGVUFSCtFgMM
 OHPSM9vtsfHH_hhgXCs8Hp2n1TBlMfPC0V5S4dw0PQD7xIhyqFjlA1QNBZJ6.9Rjyl4qL0nhnulg
 jDNEhKaZECuRANunrj4xaYkNk7MkVzwc1JwN..5yjSnEkoGUOUfCxh8GlRbq4LPMAp3FIN3GpgBR
 ZpPT9Z3m8kqSVDvBiv8Rik6qv0u9y178nl2d8Zn7ncF8R5JHzNjoqt4XDSAJPuPhlcAGNZjxS_pT
 yDQ--
X-Sonic-MF: <stilor@att.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic307.consmr.mail.ne1.yahoo.com with HTTP; Wed, 21 Jul 2021 22:18:44 +0000
Received: by kubenode512.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID f262c7f3f76d8a2c7e145506f9571a57; 
 Wed, 21 Jul 2021 22:18:37 +0000 (UTC)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210721194605.1552794-1-stilor@att.net>
 <20210721194605.1552794-3-stilor@att.net> <20210721221501.4c14fcfd@windsurf>
From: Alexey Neyman <stilor@att.net>
Message-ID: <fde74814-37a5-cf13-e617-a8af599c0039@att.net>
Date: Wed, 21 Jul 2021 15:18:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210721221501.4c14fcfd@windsurf>
Content-Language: en-US
X-Mailer: WebService/1.1.18469
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Subject: Re: [Buildroot] [PATCH 2/2] package/qemu: filter out long make
 options
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
Cc: buildroot@busybox.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,

On 7/21/21 1:15 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Wed, 21 Jul 2021 12:46:05 -0700
> Alexey Neyman <stilor@att.net> wrote:
>
>> Since qemu started using ninja, they have the following fragment in the
>> Makefile:
>>
>> MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
>> NINJAFLAGS = ... $(if $(MAKE.n), -n) ...
>>
>> Buildroot's generated makefile in the O= directory invokes make in the
>> base buildroot with --no-print-directory. However, make's placement of
>> the --no-print-directory in MAKEFLAGS varies between the versions of
>> the host make; make 4.3 places that at the end while make 3.82 places
>> it at the beginning. As a result, if building on a system with an older
>> host make, qemu's makefile invokes `ninja -n` which does not generate
>> any outputs.
>>
>> To reproduce, on a CentOS 7 machine or docker image:
>>    mkdir /tmp/br-build && cd /tmp/br-build
>>    make -C ~/buildroot pc_x86_64_bios_defconfig O=`pwd`
>>    make menuconfig # Switch to glibc, enable "QEMU" and "QEMU tools"
>>    make all # Build succeeds
>>    find target -name qemu-img # No binary has been built
> I'm not sure to grasp all the implications of this, but isn't this a
> bug in Qemu's build machinery, that should be fixed in Qemu's Makefile
> instead ?

I was on the fence about it myself. Okay, I'll try to send a fix for 
qemu/Makefile to Qemu developers and see if they agree to pick it up; 
they could argue they don't support being invoked with --no-print-directory.

Regards,
Alexey.

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
