Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BFEC433FE
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 08:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 940A84059B;
	Tue, 15 Nov 2022 08:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 940A84059B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YmNQF2XYXJFp; Tue, 15 Nov 2022 08:48:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5BD0405B2;
	Tue, 15 Nov 2022 08:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5BD0405B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5015B1BF232
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 08:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2179F4091B
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 08:48:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2179F4091B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7kjd6tBo4_H5 for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 08:48:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D738340913
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D738340913
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 08:48:02 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-59-Nz1oG5iSMS6UznH-D4w-xA-1; Tue, 15 Nov 2022 08:47:59 +0000
X-MC-Unique: Nz1oG5iSMS6UznH-D4w-xA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 15 Nov
 2022 08:47:59 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.044; Tue, 15 Nov 2022 08:47:59 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Victor Dumas' <dumasv.dev@gmail.com>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v4] support/scripts/fix-rpath: parallelize
 patching files
Thread-Index: AQHY5HrdYtmBeLLF50murzSrfjEf/q4/0tWQ
Date: Tue, 15 Nov 2022 08:47:58 +0000
Message-ID: <9d9a3bbf2cfd4f60b82a47087ef8ecba@AcuMS.aculab.com>
References: <20221019124017.427199-1-dumasv.dev@gmail.com>
 <20221020115512.483686-1-dumasv.dev@gmail.com>
In-Reply-To: <20221020115512.483686-1-dumasv.dev@gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v4] support/scripts/fix-rpath: parallelize
 patching files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Victor Dumas
> Sent: 20 October 2022 12:55
> 
> Using "xargs" instead of "while read" loop allows for the patching of files to be parallelized
> This significantly reduces the amount of time it takes to fix all the paths.
> On a larger RFS(~300MB) this script was taking 5 minutes, it now only takes about 30s on a 12 core
> machine
...
> +    # Limit the number of cores used
> +    procs=$(echo -e "$(($(nproc)-2)) \n 1" | sort -n | tail -n1)
> +    find "${rootdir}" ${find_args[@]} | xargs -0 -r -P ${procs} -I {} bash -c "patch_file
> '${PATCHELF}' '${rootdir}' '${sanitize_extra_args}' $@" _ {}

Are you sure that all versions of xargs the script needs to
run on support -P ?

Having xargs run 'bash -c "command" ...' and the quoting also looks odd.
I presume there is some reason xargs can't just run patrch_file.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
