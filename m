Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4839C433EF
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 13:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0889C8428A;
	Wed, 25 May 2022 13:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YUjuZWPI3Znl; Wed, 25 May 2022 13:31:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A0C384285;
	Wed, 25 May 2022 13:31:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50E421BF31F
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3FD7A84285
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:31:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p_6tuvs74GgP for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 13:31:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::61c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95BAB84284
 for <buildroot@buildroot.org>; Wed, 25 May 2022 13:31:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrUUt9+bodaJQOacVbm3SOCBdzyeCRt6cnQj0d/43e1KZ1DVVXvL63hanukc7ycvXe0cp02bBdkLUkmOXLpN0DM+pJuHhFx4KPXogmysAxWxbQlXiZxiu3gPj3vL+djEFjniuEzM0kOYt44NWnJSMh+nu82jXMijwTgdPmV1Fgw2k8Xr7zPFYRkZpelrJm9oq0Q1+fhWORZV6ybhGn4VRfSwRLpHwJd3mO5y65nH6OKCvz8cwLeApEWLTpS+eHQQ/9hK2aH3XKd6fNSW3+fkxChqeAB0opV3O9JxP9B4caue3GJtN3/GMHBf2dkt9RpCIw7lHnDkNxp0BavOZTKFYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y5AAVy/OMujlOI+QSZgoVW1qbOrpiy/Vp4wLD2mcnpA=;
 b=YxJ+wBIXC40kwJ3RuR9qzT3V4rtwsviRy4cMQFqCFfyD6EZxZT8ts9hjSnzpLXDFGTbRmjy7Gj5rqvlfJaPnxmN2690O/oGuh+tvNRoCzG6JxMS7B2q+BhcKnFQ9qRvxGrW8aAmtGVL0EdiH4QFPYISAJhbE6enmqcuTRlhKRjkKvCvwk2WXk0VQkUaz96Xe7iZfLaHActRzM9JF/zNQpYpOo9BGu5OGJddecZX+KFgjria4P+ezqr1ZPSN7oCiEvzICS/8EkdvLVuWAdAbhPzY64DZMYVbyM3oxEf4vbKyXcTSEFRrgVLIkj5e0rmlahwpH/HwiojMJmusH+uls6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y5AAVy/OMujlOI+QSZgoVW1qbOrpiy/Vp4wLD2mcnpA=;
 b=mNMJIhB0tXaoFmGeSsJltf+rqSGwmiAjnONd9fj1hhQkvrXiQuV8bYk3gwH9Y5tA8sz4k+5CkIqraHLlByCKDSwX3qkD4SgfcQcI7qkqzRQjJ0fAFDpG3ExO2u4uY0oC3B1lVIjJxVFAx1iX51aOKuAv3iIjGHBJ52qMEDVGI3k=
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com (2603:10b6:a03:320::24)
 by DM5PR02MB3211.namprd02.prod.outlook.com (2603:10b6:4:6b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.19; Wed, 25 May
 2022 13:31:02 +0000
Received: from SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08]) by SJ0PR02MB7758.namprd02.prod.outlook.com
 ([fe80::e83c:1862:8bea:4f08%4]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 13:31:02 +0000
From: Neal Frager <nealf@xilinx.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, Neal Frager
 <neal.frager@amd.com>
Thread-Topic: [Buildroot] [PATCH v1 1/4] board/zynqmp/post-build.sh:
 auto-generate extlinux.conf
Thread-Index: AQHYbd4O2Ejc8kIdTU6twGCobUN0xK0vTyKAgABLuwA=
Date: Wed, 25 May 2022 13:31:02 +0000
Message-ID: <SJ0PR02MB775852199F483861F0290385D7D69@SJ0PR02MB7758.namprd02.prod.outlook.com>
References: <20220522131535.1498502-1-neal.frager@amd.com>
 <20220525085717.GC301044@scaer>
In-Reply-To: <20220525085717.GC301044@scaer>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6dfb46b1-b0ca-4fc4-909b-08da3e52d002
x-ms-traffictypediagnostic: DM5PR02MB3211:EE_
x-microsoft-antispam-prvs: <DM5PR02MB3211927CEF8EEDEE9FE14ABCD7D69@DM5PR02MB3211.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: avkkuNvKStAeO62rV0iUd5KY6VlzYIfG2mwUJmUhynwozzE0abjQEiP/7w/bCIMIVJJlX8znwn8Q0qOqcrpsfhA78ZtjlmZIySIlT4Yk71s1TlBvmDBQqmYCk8MWLek1hPVdVeZQznOjjlCZbFG/LGoQfPDaT6p1rD1EFZb2Cv1ojieeU9ugOifAm5tVdiVHL7JFItRF4S4Ryu2NrFAIp45e0fUJLsIssAYWLSifcnoBKJnbxOJjZoC2Vb/lZyib+pXJfrrWkjMg7gAoXrUlK+Ud3/IS7489Fzev03zeiGSSRiWed/yhEYGK0EWwFviqdzkf8fCE6T+sCh/mH1riruyaqbJsQtK6vA08dbmSi1yTP2+AVXuaq+ILgOlzSZp3W0pSJgc+AXtl9sHxxCPmhGkeIv7rlhbg2Z5N7oW5PzSnP7UoPNZMUgTyVOckmGu4DgF3Lg25v2ZYN5g92cyPRP6S9s1CUGMUMa1MhnamAqoI2jaeFmYkXgEMmY3ispRJi/JMsx1eHtxWE/+ELCzrQ17LAYqjPs3XDSutuT11KVrY8RTXNwCEzru5TQDsuFAA5Ba8ynul5cVLmUOEG4sEasV7Z0vFsn6iLI1de66bp0j6tzx8skVrKORIGdAuJ5fjxkkq1hpmaWGW0mYGvv6hwzInKpYuEvjsadxHe75SoXMlaNalAVAQbCoVwyKqy6VzxL433WKBgIGKIZc6XXId+hsBLUJR4cL6cQZKEBESd757Z31CRlh0PJt0cPwQRnqy
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR02MB7758.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(9686003)(316002)(122000001)(64756008)(66556008)(5660300002)(66446008)(8676002)(33656002)(186003)(54906003)(71200400001)(86362001)(83380400001)(26005)(8936002)(66476007)(38100700002)(55016003)(38070700005)(6506007)(52536014)(7696005)(508600001)(2906002)(110136005)(66946007)(76116006)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTFYUkM1aWRRZU5lV0hncmxoRGlqQy9Ca3Y3NzBwd2U2S0xVbUNrdUpySElK?=
 =?utf-8?B?TFd0L042Z295MGgvdURMWEk0em1wbERMMzFpU0RTT3VYdUl1bk93bk0xM1Rq?=
 =?utf-8?B?ZzJFV1FSS3NiYkRpODJWeVZZWS9JK2NxMzNuTXMwckdFeHkybjcyNGdocGNV?=
 =?utf-8?B?RGozZm9mZEI0NjUrUHhuWlJHZU8wSnJaT3dUbHltenN4K2p4SklCSlQwRzQz?=
 =?utf-8?B?elBmUnVCZFp0anVGOGRHZVFFRmVOanBhNTVFa01Lay9oVVhXVFdJbmhzbGsr?=
 =?utf-8?B?dTRsRVFMd0NQQWJzZWM0citabXlHYUp0MTU0RHJKaGZYcjJyT2JKc3AyU0Rq?=
 =?utf-8?B?L25BTWZMTTB1VnpHak1jTmhWYllWUHF2Ni9SUDhOMkt1dDZkdjV1L1BOZ0Fi?=
 =?utf-8?B?c0xZVzlEelo5NkZXRmRBZ2UvT21CN3o0dkVzN09MK0xNVjZ1elRsYjFKQzFp?=
 =?utf-8?B?Z3lrbEtZRlQyTGdadnlDVk5EM2dSOVNzUnlxWXpndXhTWnpaczZIZithV3I2?=
 =?utf-8?B?VVYyeWErcDE2VDVNVmRZY2JvUjJMd1ZKOEFoTVJ3ZEdRcFdOU1FDalRaRWE3?=
 =?utf-8?B?aHdFWDVBdDRFQzV4SUNRck5ZTnZhUDgvZ3Z2dGRwTlg0QzNTMjVPaEcrNERs?=
 =?utf-8?B?R1RiQS9QcEdFdXQ4Q2F6ang0dlNtdjhxNmV5YzBRN2NXZVFkR2JRV3ZTeDhO?=
 =?utf-8?B?K0hVU05mbGs0enZlMmNKK3VJaDU4eW1kekpxMTJodkdyTlEvenZndzJuRHBx?=
 =?utf-8?B?SHlGTjRtMVpZSDVMVXdmeHI3eDIvOWYvSDlsKzhRSzVQekxFVHJ4UVVDV1hX?=
 =?utf-8?B?YkgxZXFSN2hUcGwzeFczSFhwQ0pxakJLY1U4NzR5TUQ3d2xoYlhPbUpLZ0FQ?=
 =?utf-8?B?UWdEVnJFZnE2bG8ySVlTNGRLWkloSmNYVXhrRzZmZitIdlNQaENLQ0h2MVBV?=
 =?utf-8?B?UlFFMi9xd0RiaFdHWDBGRHlxVWMrOWdaUUtsTHorVS9qMXd3SmM0N24weVB4?=
 =?utf-8?B?N3JUODEyTDdZbkY0YjRDQy9XbkNNdWVPTUYyWnh3dW9FM0IwaGh2R0FnamNX?=
 =?utf-8?B?Nm1ENUxiRlUyY1hLZVVUSEwyaHpZUnh1RDlhU3A2MDhZaFpmQUJGODFBSWN0?=
 =?utf-8?B?VDZHOU5PMnZpOStkNjJYU3F2Rno3VXBCUk1jelRYZGliUVVoZWNCRHYzY29G?=
 =?utf-8?B?UUJXU2VGMmw5c0o1Y0JSK2JOUUVOQXhyWHdkeE9mWThHUDNqNmdEWXNwMWl0?=
 =?utf-8?B?MXlqVVpVcGF3WEU1TVdqZTFFWTFOTVU3aDYyclpWYXNzWm5EUEREM05xanJG?=
 =?utf-8?B?QmFtSThZUFM4MFZ3dVNVWmJkQ0ZTTEFhM1h4NTdTSWRKa1FGWDFwVVF1RFRx?=
 =?utf-8?B?L3N6VE1kdEJrYUlmaXZ2TTRtK3VSdVlpZG0zZFh3N1JGN3p1WnVSa0JPRE1H?=
 =?utf-8?B?VFkzU2g0L3RNOXNsTXZXMTRMUGRjbElyZlJVSjREV3hDT1dxQzEvZ2ZuYUxO?=
 =?utf-8?B?ZXNlVitRT1RIR0t6MG5RUjhJdDB5ZTYvZFZSZ3lSUTdHei9qNVU3MlgwLy9E?=
 =?utf-8?B?U3lMaHR5NWJVRnM0aHlDdlNVS2N0Z28yZUwzUlZ6RTlubmV3MTNJSmpDSkFE?=
 =?utf-8?B?M0ZSWHhpd0F1MFBxajdDU2lNakI0SjBEeVU1TTB6RG5MWHp3a1FPQ243dTNw?=
 =?utf-8?B?bGhUTVJrRU13c283d2MxQWx0cXJnN1hzUmpXMHpVZHlCeXFXcmZ2Zlh4OXJt?=
 =?utf-8?B?SjNOSVJnWm1RVW1IK3ptNlBqWFJpL2ZudXlUaWdXbXMwU1R6Y2JkQUgwdTZm?=
 =?utf-8?B?UXgxK04yV2ZLSm4wM1czcWVNYmJnQWE2SFRjUGpaYjlKUmdMSFhLMlFzMkVK?=
 =?utf-8?B?dG5TNStQYit0QSt6ZVZhbC8rVjcxSjN4ZTArRDVHaVFiV2x0OE0xK2ZhQkdS?=
 =?utf-8?B?ZGJ0bXJmYzJMWFhUK2dUZHFLR3FWM0IrTk9Ic21jOUJCcW0yRFVVK1dWODl0?=
 =?utf-8?B?VEhYazBKdUVEaUdncEFDeHgvY21qV1Q4Qy9peTV1RWdYbzhaVkxTMWxxTjRs?=
 =?utf-8?B?SXhkVzdRSTV5bHpLeFFUMDlTeUZMdjMwMmtZTk9IODlrUjF2Y0xzRzNSL0N0?=
 =?utf-8?B?Tk5CZk4vTExVdHIzaHBhYUk5aXo1TnRRV2RETC9Yd2RDcmFZcmIxTzh4bGJm?=
 =?utf-8?B?c1pJRDh3M3ZJbEVEdmh5RkxKSXJiT3NnVEVxR1F3K1E5TXBsdTNKZ1psQ21B?=
 =?utf-8?B?UGRQZXQzellrY3lLY3M5bjFPZEVMZFVqZ1lhT0p2b2hjTnZieU9uOXFBTnF2?=
 =?utf-8?B?a0JzVFQrNnQxdS96TU5LZmZXTHNXRnVzMlBUTFZkdTdGc0xoa05Xdz09?=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB7758.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfb46b1-b0ca-4fc4-909b-08da3e52d002
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 13:31:02.3947 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S4YgaKHx3Fb9dXbudag64eefsVYdnCOJmZmM+Segdw8xTv5XMneNcdjoFHfK568kxr1RORzffRXeMbEBA70KBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3211
Subject: Re: [Buildroot] [PATCH v1 1/4] board/zynqmp/post-build.sh:
 auto-generate extlinux.conf
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "wesley@sonifex.co.uk" <wesley@sonifex.co.uk>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

>  BOARD_DIR="$(dirname $0)"
> +CONSOLE=$2
> +ROOT=$3
> +
> +FILE=$BOARD_DIR/extlinux.conf
> +if test -f "$FILE"; then
> +    echo "$FILE aready exists."
> +else
> +  cat << __HEADER_EOF >> $BOARD_DIR/extlinux.conf

> Why would you need append-redirection >> ? Afterall, you just tested that the file did not already exist... Anyway, see below...

Thank you for catching this.

> +label linux
> +  kernel /Image
> +  devicetree /system.dtb
> +  append console=$CONSOLE root=/dev/$ROOT rw rootwait __HEADER_EOF fi
>
>  install -m 0644 -D $BOARD_DIR/extlinux.conf 
> $BINARIES_DIR/extlinux.conf

> We try to avoid generating files in the source tree.

> Instead, why not just:

    FILE="${BOARD_DIR}/extlinux.conf"
    if test -f "$FILE"; then
        install -m 0644 -D "${BOARD_DIR}/extlinux.conf" "${BINARIES_DIR}/extlinux.conf"
    else
        mkdir -p "${BINARIES_DIR}"
        cat <<-__HEADER_EOF >"${BINARIES_DIR}/extlinux.conf"
    TAB>label linux
    TAB>  kernel /Image
    TAB>  devicetree /system.dtb
    TAB>  append console=${CONSOLE} root=/dev/${ROOT} rw rootwait
    TAB>__HEADER_EOF
    fi

> Note: the <<- rediretion removes leading TABs, so it is allows a nicer indentation (so, replace TAB> above with an actual TAB, of course).

Very good solution.  I was not aware of the <<- trick!  Thank you!

> Also, please always evaluate variables using curly braces and quote the
> expansion, like so:   "${foo}"   (in the here-document, quotes are not
> needed, of course).

Ok, I will update this.

> Eventualy, at the end of this series, the script will always be used for boards that do not already have an extlinux.conf, the condition can be dropped in a final patch, to just only keep the else part of the condition, don't you think?

Yes, I will add a last patch to the set that removes the if statement leaving a more simple solution at the end.

Thank you for your review!

Best regards,
Neal Frager
AMD

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
