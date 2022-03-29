Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7CAC433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 12:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 454BE417CC;
	Tue, 29 Mar 2022 12:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHumxlbLOGzm; Tue, 29 Mar 2022 12:49:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E8964171A;
	Tue, 29 Mar 2022 12:49:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F2B321BF9AD
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 12:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF73F60E54
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 12:48:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=jackodemononcascadec.onmicrosoft.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDqb0WC86yoY for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 12:48:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e1b::61d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71CEC60E7E
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 12:48:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RnitjOAFGB/EfA7EqfumLjL7WIS2kbIuYvha600ow62tejq+gp2eBH+YYw2F59kppppqXgnsRRn4OtxTq68i0De76Ux3fC47MZuY4w7r1q1D95GGIFZh0PClJ/iA+KQA0eAtCRBSOZQvBXi+8auRhLukXJOG2qLmmknLZi/RcSy8vsQPlTeU1A9StCXM7dbaVexPVYxH6KzgEa9fwxUERw4+ZbBdT+Gb6cfcUYS9sjes+1aoQTXpMcB5c/wZQIKLIlg/mN/WhX+iZ+blncF5mXygYb/EFtP2pv+9gibCW5VCh2BgwgTaIVkWPFmUPEgHy+y4TX+aSuqSrhgO23Wn4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pSxLJYRxg7sQFOWLoLgJ8xbHrRSUBlqbZjg22Z+JXI=;
 b=YaNDP8tG5tGvbb8p59+iTs8QC5aiszg81Pn4w+KU7DHFpc21bUs+OHK/4roXBdTYZ2C8T7RoEbPArb3A5jWi2jCpzL/zRpQ90lwiCGukH/+TsC8rJZo1++7Ik57Jt7BLyTvgFQ8wdAG2lqIfyOsVRkUth0CEM+LvC07J4w27G6Np+OtB+GfrKmi4W9FpTuwB055DS+IfEAhzZr0nKfRvHssbNVspbqF5LithkrLy9ZGXNjLIqQVrjOO+tIn7klu+mkQC2myIZXY4b4ymlfkOsFp8G+EUkFlOXwRTYIyJmP5HK4qKoX/WwlwPiYSuO3qEmLu9QliAGygEkeGtHh4NtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=thejacksons.uk; dmarc=pass action=none
 header.from=thejacksons.uk; dkim=pass header.d=thejacksons.uk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jackodemononcascadec.onmicrosoft.com;
 s=selector2-jackodemononcascadec-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pSxLJYRxg7sQFOWLoLgJ8xbHrRSUBlqbZjg22Z+JXI=;
 b=l9atfYjd0AG9tqAcK/WjVSkREEL5WOLIRGWrAnd9AGJDdcGnLgLn+l0IV0ZzpTMwd3eYC0CYs5f05C05J2mHdGJs/qd059iXIOtJbmbfrHKaCjGT6H8GDPHu8l6040yhb6UWlp/eXTwKrePQsM3WLmFy1hnMU1l9ZK5RwvfHK7U=
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com (2603:10a6:20b:32::21)
 by AM4PR0201MB2083.eurprd02.prod.outlook.com (2603:10a6:200:4a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.23; Tue, 29 Mar
 2022 12:48:51 +0000
Received: from AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::5c61:b5c0:8686:2528]) by AM6PR02MB4884.eurprd02.prod.outlook.com
 ([fe80::5c61:b5c0:8686:2528%7]) with mapi id 15.20.5102.023; Tue, 29 Mar 2022
 12:48:51 +0000
From: Dan Jackson <dan@thejacksons.uk>
To: Andreas Ziegler <br015@umbiko.net>
Thread-Topic: Adding USB support to existing device on 2.6.39.3 kernel -
 possible?
Thread-Index: AQHYQ1EGpCcDGFOvN0u2NbHmcspfi6zWS9xg
Date: Tue, 29 Mar 2022 12:48:51 +0000
Message-ID: <AM6PR02MB48848F8B3F5238DF24891A59DA1E9@AM6PR02MB4884.eurprd02.prod.outlook.com>
References: <mailman.22068.1648533484.192135.buildroot@buildroot.org>
 <2854f91f1188e166bf02e3a6ab6249a4@umbiko.net>
In-Reply-To: <2854f91f1188e166bf02e3a6ab6249a4@umbiko.net>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=thejacksons.uk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 332792cd-8831-4fa7-8b04-08da118279f0
x-ms-traffictypediagnostic: AM4PR0201MB2083:EE_
x-microsoft-antispam-prvs: <AM4PR0201MB2083154B9FF4117C3E2E0BE2DA1E9@AM4PR0201MB2083.eurprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gMkng8FZjDJXyKgtcJKZpZa0JD2i9h485wmANViPwip+6UQOJFFE5QV5DarL2+AdsfjmtDrRP8JyuVaZzBXi/eS4qH4XSO9rBl39rD8oMpOoM8Dw5CUQ1EIGg5QlBGfCU85fR96ADcAz/2emW5LWfFdO+/g7I5d02WLdYV7g+hao81FYnPA6vqbGRh5EOzorT6ibMUUZ14Igup4SBh1L8oQ1B7zJV7sEuGilo9NNYU85+WyrKwC7ueo/6InaFGq5Hawg/FQMuN/RCQEZPAOQ10x9xhUYRk/zTrxIly62j8mxojuJjCONgvW76tjKCXSuXsCf8jQsjcmgUW/9mvjRaQ/ExroUYpKKkiyunXiKMjvVVI3tw7wdzaJHsWXgRF/vp4HrEl/GLrROZxKqttRPhSJzq6XncIKSimmfGRXQhMlLopfJ6FpDvoxc9mkDJXBltwm4JX9dlsvnF0kgs5SJYB/12tej08PLvjZrjcozDzdP5DaFwePClk4PQPd76uTKDgpDkJGg2Zw4jJrilhqRscV8pknQUCCEs3R0Pr2GwBU18stGQRmOHzOTahiERUTku/s2BfEiZ27+h3X6MU/zBaivJXxabLV/94kQJTsJEkOTvfkVzjHwX1mSv2Rhu4iZPwZ5DH8go19e7mBruQJiLNGgy+eyaIS/dDXzEyVeC5P4sDTl+jXZI/X5WsNTI8OS8ydAUXZn17pt/ALVBvLfVGCr/SBFyiRKgDV8306QmclIGFagY9EuurLdJo7+EaaPGIOQa2NGiSXJ8UjWBJ9F4g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR02MB4884.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(39830400003)(136003)(346002)(376002)(396003)(366004)(86362001)(4326008)(8676002)(186003)(6506007)(7696005)(316002)(66556008)(26005)(66574015)(9686003)(2906002)(66446008)(38100700002)(33656002)(53546011)(6916009)(66476007)(64756008)(55016003)(38070700005)(5660300002)(83380400001)(508600001)(76116006)(66946007)(122000001)(8936002)(966005)(71200400001)(52536014);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V22DwwLJB/OTZ7iTCdKGk7hE9tCEFLYgg5rCw/uCl0/DvtlDV6FVcofZcDf9?=
 =?us-ascii?Q?mYCp+PEqaofbjkBPM3w7gUQqtZnxmIcoluDAQ+nPU7GvRhx3Goo1dNxTMXZd?=
 =?us-ascii?Q?LKLNivHJ08F+TSOANUkpJMX50r9D+SB5lUBwByJ0otZIehjmtcXvRq45sVum?=
 =?us-ascii?Q?2EVrIuGCV2oT8DDVO+EqwZSAIh9cRVcHqG1pQb9TiXfvssSAiUurVeVbtQuD?=
 =?us-ascii?Q?aSPU99CK54R1KcA3XImrYar3Rr8QrYO7ZIHB/iK/Vi1OUNJOgnUMPue2Zn/n?=
 =?us-ascii?Q?gdyIVJpEdN+PmoNplfPWQbOGQwc625CqAum6p3t3xmeB7661uHFCvzuKadvm?=
 =?us-ascii?Q?FPhQYwwnzzPwCFUvZ+fFugRYUBOyqON8aLEQdFiYsFG3jYpSZ2y1HxSnxmj8?=
 =?us-ascii?Q?4g4wxl35HDPC7BPyHD7V5hpllnKqKVdWgIx588Vi7WuIEY3LzTpNemsvEFH0?=
 =?us-ascii?Q?TxhlSoExt2MNI+n1hZivz1KkehID8gAsjrFnRtwYEv+TwZORlOzr5SfhcnAM?=
 =?us-ascii?Q?jjkzZPLAdLjY5YMYC1VRhyG19AmprGhfD6LTGLKlFmtBh/VQjPo/upjg0/au?=
 =?us-ascii?Q?iOaXKJ/Wpc5CB3tGZQQVADTa6bsACA2gMw4eXqWGEl7q5L8sJ3dLoYP+JX9W?=
 =?us-ascii?Q?LORh7JNA62AJM9kVKxBO3JQgpGqU/h0E0r05EaXlT/lAv79XEujlTjcOeG4b?=
 =?us-ascii?Q?SjCn4FP25IK6gzeihLZWXIJRYcEvC+bA3dv4Rl5rSX2cOtNO6SFTe8mvI8e+?=
 =?us-ascii?Q?++KsdlPzKQgToMuk0PlBQ2IH1JpXaN9ZBKmtVSNVNikM2J7hP29mjuN0Ua/6?=
 =?us-ascii?Q?zFHy5zD8U4Cu08fQxseNQVROCxjqq0YxFL7HMFDrFt9x+1uh6FLgNgXx4QQy?=
 =?us-ascii?Q?+XClstoEC91C0Mq0536MQGEJ7P+bMC52woeaCKxWFD8BufQF7GJE0qXmI+fI?=
 =?us-ascii?Q?Mtk+r27V8hHYi3ZPGhTruJMovtL3ibYCGOP1mDGUAAKG+nuBGCJZQd7Ry31T?=
 =?us-ascii?Q?6WYkLAqetRKNQl1w5AQ8eaFod+XrLTMnsdS6mRDTnlNNy9U7ICHxWs6/3qYK?=
 =?us-ascii?Q?cWRxmaIjZaxw5+phY4Olx4jQUUkdkxG07YE8U0F1Xb9x6Ra5EmMTCqusB/4P?=
 =?us-ascii?Q?jGOJ1wxdczQGnOXJ3/YSGFdTesuyTSmWtTWlQdQfQekxBlHIbiYJRVu6JJlv?=
 =?us-ascii?Q?toNcsmaOsWaij2RnRYvi21ygXGkcB8eoDCI58NoDifk4nbZP4dBwfSC8hHgO?=
 =?us-ascii?Q?pxjtggswgTfo+A+4dLeqnzlX7Om+mJWmHIePFTMc+mqj+YIf8aRyHSjswoT8?=
 =?us-ascii?Q?8AdJVfcBsBXpFH8KxcFLPlxo0gJ6WkOwqZbk6E3UQnfoJf8HejynZkJad33i?=
 =?us-ascii?Q?m4He7cOaHrgH+li8KMTg7NjNUpNssrKeQnlywAGbUHik+RIjf+5WY5e6ldFA?=
 =?us-ascii?Q?JBxnuQmlbzCGtEMhGufAz1XvAvFmLVj05/GyVbLqgYpGNYckzUvuhohISgXf?=
 =?us-ascii?Q?Smc7GwxeO9gxYMhdCSVyBVBXDTGr1FUdM2ZgFmPudAogX0E1htP4Q+6+HhPd?=
 =?us-ascii?Q?4JuuI6WW+NKimoiNWy2HrGssG4HeHUwqTN1RkInREqO49kea4+eLugEMUAMO?=
 =?us-ascii?Q?+qA0bDgs2ZwLNu5pD6Vb9cFWv+2x3pbAvEfXDRFz1fqChiXuoGJzo8ehttvr?=
 =?us-ascii?Q?QkA0c/UvE3J6cFf+GNAr68x5VwUfzv0AvXu91eQnEqrSbVkZ?=
MIME-Version: 1.0
X-OriginatorOrg: thejacksons.uk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR02MB4884.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 332792cd-8831-4fa7-8b04-08da118279f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2022 12:48:51.3699 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e3dbf3de-d91d-474c-a156-23562e023d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Os65sHanWx06VuARAp8bPCaJzSEdMacgd4O1VF0+ZGK0fcIg5WzMNuuT3A19S9REWvUQPklIAVsrNt/550yzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0201MB2083
Subject: Re: [Buildroot] Adding USB support to existing device on 2.6.39.3
 kernel - possible?
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



> -----Original Message-----
> From: Andreas Ziegler <br015@umbiko.net>
> Sent: 29 March 2022 10:40
> To: Dan Jackson <dan@thejacksons.uk>
> Cc: Buildroot <buildroot@buildroot.org>
> Subject: Re: Adding USB support to existing device on 2.6.39.3 kernel -
> possible?
> 
> Hi Dan,
> 
> On 2022-03-29 05:58, Dan Jackson <dan@thejacksons.uk> wrote:
> 
> > Hello,
> >
> > Sorry once again if this is a silly/noob question.
> >
> > If I have an existing router device running a 2.6.39.3 kernel, which
> > has a USB port and is capable of supporting USB devices, but the
> > manufacturer has removed/not installed the necessary kernel modules,
> > can I use Buildroot to recreate the missing modules and thus re-enable
> > the missing USB support?
> 
> It might work: the driver is contained in the USB module, so building and
> loading that module could do the trick.
> 
> > If so, how would I do it?
> 
> Supposing the Linux kernel source contained in [1] is the one that is running
> on your device, you need to configure Buildroot to build a Linux kernel
> (BR2_LINUX_KERNEL). The manual [2] has some information about how to
> do this for a Kernel source tree (see chapter 8.14.6).

It looks like I got that part to work. The buildroot build process definitely seems to be able to see the kernel source tree which is in /home/danj/DG3270_9.1.103FB/sourcecode/ti_linux/linux-2.6.39.3/src.

> 
> You then need to enable USB support in the kernel (Device Drivers -> USB
> support), probably
> 
>    CONFIG_USB=m
>    CONFIG_USB_EHCI_HCD=y
>    CONFIG_USB_OHCI_HCD=y
> 
> is enough, otherwise try some of the hardware specific (driver) options.

This is where I have fallen down. I did "make linux-menuconfig" expecting to be able to configure the kernel/modules (as I couldn't see any options for that in buildroot's own "make menuconfig").

However, at this point it seems like it went off and tried to build the whole kernel from a default configuration.

This eventually failed, so I tried "make linux-reconfigure" at that point but that did not work either.

Here is the error it gave upon failure:

/home/danj/buildroot-2022.02/output/host/lib/gcc/armeb-buildroot-linux-uclibcgnueabi/11.2.0/../../../../armeb-buildroot-linux-uclibcgnueabi/bin/ld: /home/danj/buildroot-2022.02/output/host/libexec/gcc/armeb-buildroot-linux-uclibcgnueabi/11.2.0/liblto_plugin.so: error loading plugin: /home/danj/buildroot-2022.02/output/host/libexec/gcc/armeb-buildroot-linux-uclibcgnueabi/11.2.0/liblto_plugin.so: undefined symbol: _onload
collect2: error: ld returned 1 exit status
Makefile.in:114: recipe for target '../utils/getconf' failed
make[3]: *** [../utils/getconf] Error 1
Makefile.in:455: recipe for target 'utils' failed
make[2]: *** [utils] Error 2
package/pkg-generic.mk:380: recipe for target '/home/danj/buildroot-2022.02/output/build/uclibc-1.0.40/.stamp_target_installed' failed
make[1]: *** [/home/danj/buildroot-2022.02/output/build/uclibc-1.0.40/.stamp_target_installed] Error 2
Makefile:84: recipe for target '_all' failed
make: *** [_all] Error 2

Looking at this error message, maybe I need to select an older version of gcc, in my buildroot configuration? Is it that the kernel can only be compiled by gcc versions that existed at the time?

> 
> Copy usbcore.ko from Buildroot target/lib/modules/{kernel-version}/ to the
> corresponding location on your device and load the driver with modprobe.
> 
> Depending on which functionality (e.g. USB_STORAGE) you want on your
> USB port, additional configurations changes may be necessary.

Yes, USB storage functionality is what I would like to add back in. Incidentally, this is a newer router than the one I was experimenting with before; this one has a Puma 6 CPU. Though, oddly I found it necessary to select an armv5 CPU type in buildroot in order to get binaries that work, despite /proc/cpuinfo on the device claiming it is armv6.

> 
> Kind regards,
> Andreas
> 
> > This time I successfully managed to build other binaries (e.g.
> > dropbear, busybox) which run OK on the device.
> >
> > Thanks,
> > Dan Jackson.
> > -------------- next part -------------- An HTML attachment was
> > scrubbed...
> > URL:
> > <http://lists.buildroot.org/pipermail/buildroot/attachments/20220329/4
> > 3c49a2d/attachment.html>
> 
> [1]
> https://sourceforge.net/projects/dg3270.arris/files/DG3270_9.1.103FB/
> [2]
> https://buildroot.org/downloads/manual/manual.html#_advanced_usage,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
