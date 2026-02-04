Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E175E9D3FB
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 15:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02DD660D7E;
	Wed,  4 Feb 2026 15:29:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l-fgfu4qrAwm; Wed,  4 Feb 2026 15:29:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCEF160D97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770218985;
	bh=HlkYfEFDI0upuPZMyUsldBzRhZRNdh/GAkKNRFHsEAg=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YjVPivw5Y3gI2U4joJWjjQwa+uIKUxCpSD/1nHyEs59UvulpCNHlk++1Al1nGYsSg
	 ogDea9bhGAnBj+sBGwDPFWck2Gh16FEQEw5JxQwqH74822c/7kl+iwwL+jRtp0UVRY
	 mlzaaHlnPFHmjfz1OcmMT2CExHhMuege+U7s2qX5WySCUo/Kw2EM6QDeUTtepyLM8K
	 iSc0vNOEwtnrd7XiqAPqwvismuQ0AmwgtkyCfAt2lFrsQKiCXxd6d1J85tuHhzTjeJ
	 GigTg2TlzT6rYD9WSA3NpWF51C9qVOndO/FNDxcHeWlLLzwHMLwLa2U16EJw2lKMTB
	 s5Iee5fs5B7dQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCEF160D97;
	Wed,  4 Feb 2026 15:29:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5439F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A65D140665
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pV_lvK_-vEtn for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 15:29:41 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::62d;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 55CB8404F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 55CB8404F6
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on062d.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55CB8404F6
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 15:29:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=O9klXx1ALhWKYY8PBnabOlljvRoEnnkiQ3E1p7uD+gcFcgL3bDLF3EaBCqOnKp/YHzaACK/rEsivEHBpNh06rBrHF2cRScTcaUcJFV3PLV49xcEZG2oDpUeJLvPFKY27GXbgYRO4AhWrGGC4Ae6b+DXpEAvL2fU81RRVMZWYR0MYxwpe/mm0BDQRQg8NiqypK3kYdeiHnPKStWbVDqFwUKjNlnJRO9BbNs7woFFgVJN0rIaF74jJZABgCAgpYOtU0fxyodF9duUVkD6XlLWEQf/zm/yN/24Z6lbTSee7KmWYKIUnHb4wWslhX4LmkOrGMyVKPeFXGw7/+bnRLqVrxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkzGHOqYHt4HoYZ9JtC1iqTiDl6hx55DaIaTJALWMGs=;
 b=1S9HxHfyE2fcyKG4sXWtteI3A6OZQUG9mVXQxEthIHsmXU4zkYqWwb3dw6HgBC9J3o0v8IFM/PqPRpVmMHjxN++BIeda6ARMJNk9jEhevPX8quHnR3r9O+VyS7L7hx5F2jSB2c6KG0KHyA5VvsC1X75h42460TGsa+uFlIaqKQqr31RR+lsoMFeoLwVdNa0gPhb3m4ugvBRYgc5O+7YB0uwFd/zUzqvcNMVCpII5EM5C4nwW3efrw1DzLoMkD1GdTw/RE0gQrbY3Ugyr4b2JQAGehL0PmGupA3z5kkWR0r3PcKwrdNNIBAnhNLaQLvwQTC7KK5455nc4w6VqZW/9UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN2P110MB1011.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:168::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.17; Wed, 4 Feb
 2026 15:29:35 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9564.016; Wed, 4 Feb 2026
 15:29:35 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Thomas Perale <thomas.perale@mind.be>, Anton Bengtsson
 <anton.bengtsson@plejd.com>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v2 1/2] support/scripts/cve: replace
 distutils with looseversion
Thread-Index: AQHclesRvHMu1RctBkOlm2KpgXPuMA==
Date: Wed, 4 Feb 2026 15:29:35 +0000
Message-ID: <PH1P110MB1603E83DAEE62069B4FB81D49F98A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20250912083432.3444568-1-anton.bengtsson@plejd.com>
 <20260106221506.40473-1-thomas.perale@mind.be>
In-Reply-To: <20260106221506.40473-1-thomas.perale@mind.be>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN2P110MB1011:EE_
x-ms-office365-filtering-correlation-id: cd98ceb3-60ab-4a23-d188-08de640233b2
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|41320700013|38070700021|13003099007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ul0M0E7sekHtQrs9DpRNDzlb1J578am4a2HhvYqb6E0WjVoY/6mJpZfd7wSI?=
 =?us-ascii?Q?OZGe3NEwUiGW0vgLJvTqlLj3MMSHSLcKg5XZmlexoVk2Wx7Xf7INsA1jSYlB?=
 =?us-ascii?Q?Kv7oV3UM3qsmQEHdeGm2lJ99A43mHJGOcXfTPPZTnfJ2ENW6B1GFhG6Vii5L?=
 =?us-ascii?Q?565H6jNsABeObGUJodcM2NO48i7XkTSzxkq0MalRefuDzhd/+Q5q6eAmEv9Z?=
 =?us-ascii?Q?JKb9/2NAeiu5+PNGLgoJHxP1i73L6YYV3RybdxCnuszs8o+JvxEqXycKN8TE?=
 =?us-ascii?Q?jc4qMHK/E/wFpX7w2Cth3esqpnfYw+jYOS005E4CGFxilHTprs5F+V4EJKT7?=
 =?us-ascii?Q?iTL+yVmMMq58DzSbEjZ1buMXDwylkufeIgEK9AVGVpt9LA4PLBu0HBYGW+49?=
 =?us-ascii?Q?v98d3O9nu5vRhcvep/rjZmHHdaO1gS7e4Ix+kMoyg5rQ6NI+hdUXPFbv4lvd?=
 =?us-ascii?Q?PvsttzH+gztj7x0EVzcK0SlEVgoKpHwP/4aEJfxuAS3rRnajC3p55/OIYYO4?=
 =?us-ascii?Q?U7bgTo0ZWqtDtfdBxBmG/3s+6vtIkvgflqV38z8TPlDpmv9T6XoGwhaF3xiw?=
 =?us-ascii?Q?FFgaC8Pg3hkCGmA2pqkysUwgMpLLAV++juXdyHN5OCP6Ax43KBq/K5WNwStf?=
 =?us-ascii?Q?acVlrWuo4TtQsGhFhwrAGGeXD8M554q1/EttoLX7kTByrIT9mroBvyFysAkd?=
 =?us-ascii?Q?MncEYqBwes0g2uAdzduwUtFgTAAWT4fLW7Jx5ACgVdIUMFjgGc4cIcXqzT2c?=
 =?us-ascii?Q?R833m0G75egwbIetfAdQUnfSYeFm2Jvk4NQnd8dXklqWAVndra8KTyb0X5QD?=
 =?us-ascii?Q?XxQLNPePRxTwmUo3MF0E7UFJiSlf8IRfaMSBFV3iCfcbNR5GEgBVMolbd2Rd?=
 =?us-ascii?Q?mq3tjMyhVCayRkkEJChGKuzdkL5X1d4dse3vEil3KVgZ5J55XV5v49p/iU69?=
 =?us-ascii?Q?Dd1PC7Ch3uz3AIZ1kGLNA+WahkzPd0k+cv2kPGB/dVNDwEkbxH89sWSavFgG?=
 =?us-ascii?Q?FMEqTHPsIYqJFsj3Bwa/wgMo6+nrcDRWgrw6vFnO1PxG0X2gR+3MVeI1v+Ak?=
 =?us-ascii?Q?VkNg7rV41cLdQIye2OgCAcYH7qzGejjAxRjPDTYzIcmjclp9rTeXdpdA6Lzk?=
 =?us-ascii?Q?YfRnwctJ++fAuha+lNpZQ/I05N1WGpdvHNYO6cnY6mPKLBlRDv7FUJnTHcyu?=
 =?us-ascii?Q?zdzGU5YFFrcuvI6DiB8W89kinqYjfXzvL/jBp46crlNCn7gxAukgviABKlhg?=
 =?us-ascii?Q?Sa0ySh0Ck7ytTSxOp0q91pzHbKeGgtNiyZ0q4f5yiuTMRIUiPoxggxUWA1hq?=
 =?us-ascii?Q?7GZJL3x0elQgxo1ksDo8++FZgxT+wRJodpaN2JMR/BWRAMbXotvdb0GQdNgm?=
 =?us-ascii?Q?gRKiuL6x9UHefVpsrBr95xYxYvBXNWXo5rkuwupXLM/wME3O3uUd89Kd5KVh?=
 =?us-ascii?Q?VT1z96UVv3n9oF09PU/6FDZczIjWf6wRbkhkzJYDEZHXyJOwfom6W4gva84+?=
 =?us-ascii?Q?t9SOgz5gCT86H0ibJBsgOFprsBv3AiAU+nEwNJeqJi+njmxAWXSfi5Wt1xSR?=
 =?us-ascii?Q?SNNh8E4p06P4MEAwwQfygAC01acu6gdNhAyueiQ5?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(41320700013)(38070700021)(13003099007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0GWqknmYG7y0QBWDY7fR4uQVKZc1plTRcS5DoLseoRtF/8DiG3yCFcEHq0Zi?=
 =?us-ascii?Q?aC8o8wyEF3DxjYZKxMQO6I+mB9DMuKZ5P7jTDv3b8/ZgWN8H/NdY4z5EfnHd?=
 =?us-ascii?Q?tdMrsE0xRIbLVX27orhj+PB/AM3nDdqcsc1CYoqPzfTZvM+VHgdz+wsq1zQp?=
 =?us-ascii?Q?katvqy7J+JjSUBkRTTQI1s0XV5aeII2OrwLuRC/6Pd+hanwKNi6cXsnMumr8?=
 =?us-ascii?Q?fwM+YlxmH6WwN3BNM0ygVdjm8I0fwfdTXmv0a/n9o4STGDBkp9r9OyUYJytC?=
 =?us-ascii?Q?nS9Dbu8XkikpATwDTJloMMXyrz3XuEVFzrq/aRKTnPp+l51Ymdzva5Vy+IYp?=
 =?us-ascii?Q?1Vm9TKERetYdKo9FtHk2iV6VFdWIoGzZKzF1qQ7IS8Kp9CciGytVyszHTbah?=
 =?us-ascii?Q?pIYCclobO9qWq7xQtuk6KYm8x9/st7CIPSB3yzMcz2482kGNMxUN2fb+rDS8?=
 =?us-ascii?Q?qsMcWnjQ+nLuiO/1HZXSS3M8vylEyrlFhelClI62BJ3tN+fX8kWO9VdP5ylQ?=
 =?us-ascii?Q?pWp3Y1I72CTYi9E9n9tw9erjZ/3K/lD/QEu1kDv5cQklMTzd8GUGS+tvL13d?=
 =?us-ascii?Q?+DaFrTXWg0v7ctv250bARfo6m91ESwguivli4XeJ7En4UzKYHyNULgvTkoX3?=
 =?us-ascii?Q?13QQbxgxWL4BaD18OJqgKyT8XZWQpctj0vR6EP6OynjkdNmrLNPq6oGJ/nSn?=
 =?us-ascii?Q?OmV7ta33Usy09z4DZS0lW6w2ygmknmuJKZ/HiVdI6Fcuc2Fros+CQlzqKqhV?=
 =?us-ascii?Q?fygCOjz/njzDK9EjUTrJTVa1SoIRaxpqSMqYkKsx+x21hrat2VSuV0S5BHTW?=
 =?us-ascii?Q?yX5BHXaQHRXnSNtRGTXi3yRHTh72bcqGOBf8wVFDUS3HEIpkJRcfPtYhyzn7?=
 =?us-ascii?Q?8JTXygKe/VGh92WDD7EPW/0/HZ0/jWFzdA8CxEr3/SOxPGREd7JnhZcQOKMa?=
 =?us-ascii?Q?+qyrlxylwrPgnE3IM50PtK8GX+eyyZzZwaLTWs+5FT0a/tlnpyiWtLbSb+qn?=
 =?us-ascii?Q?6Tht/vsbE3k1CyKHmKW52Y8oEMcWOBL81S7tHISPPVRbxh41Gwnr+wzaLAPp?=
 =?us-ascii?Q?NvfJdNakUpKEiUnBmG4BocnedVPlhaz4EqP8TNwq6Bt+6eRnmpqfsclYkegr?=
 =?us-ascii?Q?yZUBHBgieu0EJ28NZeJIRrUEZ4tMgH2u5U3gbq4BBG1PrWbdYXIVB3TfaNLx?=
 =?us-ascii?Q?mW7ba/7t9E8EsH1p+SROHzw22oOdSiika3rYhrnuYeuRexVbq/n5ZnV9OjG6?=
 =?us-ascii?Q?NXNwp2tyCZZNVx1riT8LbiydUu2NzunLv+Ej8m8I3a9mO0f/bLjGP2Tv45Y5?=
 =?us-ascii?Q?9HwBko6Fu1UPjnFhrjO4szkcmbOaLI+VaG+bIx7ya6FZrDKJ4BYmg8ThAWO9?=
 =?us-ascii?Q?SnBkiQ42/T0YCjIud5N+e5qqs4k37QHdSPEaY9K1oneIF5aeR4LzTi41Ggwd?=
 =?us-ascii?Q?QVi6AqREIt1D9iH9WOAaZpG4p7VCBeD+dp7JGxji0EWW2CcN1hdRF6O+uY0w?=
 =?us-ascii?Q?wrRxycYHl4Toj6A=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cd98ceb3-60ab-4a23-d188-08de640233b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2026 15:29:35.2795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1011
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkzGHOqYHt4HoYZ9JtC1iqTiDl6hx55DaIaTJALWMGs=;
 b=zd2kp7QOBSW49TTfej01WXkTEETlEELWxz8luqrW1FzgyKxfPzpkB1Z6XXhAlgI6s8XQStwdbXw6BpiVBaS2w3e7H4cpG1AYT78HACGtolvYzmFdIwMaC0cbQAYQLaN+N1/NZe2SDvTV+/OjbFUdzVkwXpjHavNMlYbyDgpgbkRRuhN2p32ik6KVMPXFCjxQifV2/L85Wu4X8JsyZ1o+cCXZSZcKjhN371/CDCksYHDLPOxeIDEDAEqaZMolXZejNtAa9VPmsz7rKtDbbxiMHyqfGSbiGDIybn1043we8LAH8u0DEekTyr4tJs2v0yADaqm7GNOaA862b8QoujmStw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=zd2kp7QO
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH v2 1/2] support/scripts/cve: replace
 distutils with looseversion
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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


> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Thomas
> Perale via buildroot
> Sent: Tuesday, January 6, 2026 4:15 PM
> To: Anton Bengtsson <anton.bengtsson@plejd.com>
> Cc: Thomas Perale <thomas.perale@mind.be>; buildroot@buildroot.org
> Subject: [External] - Re: [Buildroot] [PATCH v2 1/2] support/scripts/cve:
> replace distutils with looseversion
> 
> Hi Anton,
> 
> In reply of:
> > The package 'distutils' was removed in Python 3.12[1] and looseversion[2]
> > appears to be a good drop-in replacement for distutils.version.LooseVersion.
> >
> > Also added inline script requirements suitable for uv, similar to the one
> > added for utils/check-package in
> 6ffcdb52e80b63e68c890aed52ff7f4d00e079b8.
> >
> > [1] https://docs.python.org/3/library/distutils.html
> > [2] https://pypi.org/project/looseversion
> >
> > Signed-off-by: Anton Bengtsson <anton.bengtsson@plejd.com>
> >
> 
> On my system I'm running python 3.13 which deprecated `distutils`. I didn't
> ran
> into any error running the `cve.py` until now. The reason for this looks to be
> that the `distutils` library is provided by setuptools on my system.
> 
> ```
> >>> import distutils
> >>> print(distutils.__file__)
> /usr/lib/python3.13/site-packages/setuptools/_distutils/__init__.py
> ```
> 
> Is there any reason to not use setuptools because I think there is an higher
> chance that a user have setuptools installed rather than `looseversion` (I
> didn't had it installed for instance).

I don't think it's safe to assume `setuptools` is available since it is not
present in virtual environments made by `python3 -m venv` though maybe we're
expecting this script to be run within some container that does provide
setuptools?

Even if we used setuptools, it's supposed to emit a deprecation warning when
constructing a LooseVersion object.

python3 -c "import distutils.version; distutils.version.LooseVersion('1.2.3.4')"
<string>:1: DeprecationWarning: distutils Version classes are deprecated. Use packaging.version instead.

If we don't move to a non-deprecated package, like looseversion, then we could
use the `suppress_known_deprecation` context manager to suppress the messages.
I'm a little surprised if these have not been seen already.

The chances that setuptools removes LooseVersion is probably very slim as it's
basically intercepting all old distutils functions for old packages, but either
way, the script technically has a dependency on a library that's not in the
stdlib so requires either a system level package to be installed or a venv with
dependencies.

AFAICT, `packaging.version` is not a suitable replacement for the CVE script
because `packaging` is reserved for python packaging semantics.

> 
> Other than that I tested your changes by comparing the output of two SBOMs
> (before and after applying your changes) that were passed to `cve-check`
> analysis.
> 
> Both had the same vulnerability set so to me this indeed shows that
> looseversion is a proper replacement.
> 
> Reviewed-By: Thomas Perale <thomas.perale@mind.be>
> 
> Best Regards,
> PERALE Thomas
> 
> > ---
> > Changes v1 -> v2:
> >   - Added inline scripts requirements for uv                (suggested by Arnout)
> >   - Added python3-looseversion to support/docker/Dockerfile (suggested by
> Arnout)
> >
> > Signed-off-by: Anton Bengtsson <anton.bengtsson@plejd.com>
> > ---
> >  support/scripts/cve.py | 16 +++++++++++-----
> >  1 file changed, 11 insertions(+), 5 deletions(-)
> >
> > diff --git a/support/scripts/cve.py b/support/scripts/cve.py
> > index ba41762fa0..524f08f48f 100755
> > --- a/support/scripts/cve.py
> > +++ b/support/scripts/cve.py
> > @@ -16,14 +16,20 @@
> >  # You should have received a copy of the GNU General Public License
> >  # along with this program; if not, write to the Free Software
> >  # Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
> USA
> > +#
> > +# /// script
> > +# dependencies = [
> > +#     "looseversion==1.3.0",
> > +# ]
> > +# ///
> >
> >  import datetime
> >  import os
> > -import distutils.version
> >  import json
> >  import subprocess
> >  import sys
> >  import operator
> > +from looseversion import LooseVersion
> >
> >  sys.path.append('utils/')
> >
> > @@ -190,7 +196,7 @@ class CVE:
> >          by this CVE.
> >          """
> >
> > -        pkg_version = distutils.version.LooseVersion(version)
> > +        pkg_version = LooseVersion(version)
> >          if not hasattr(pkg_version, "version"):
> >              print("Cannot parse package '%s' version '%s'" % (name, version))
> >              pkg_version = None
> > @@ -202,7 +208,7 @@ class CVE:
> >          # version, as they might be different due to
> >          # <pkg>_CPE_ID_VERSION
> >          else:
> > -            pkg_version = distutils.version.LooseVersion(cpe_version(cpeid))
> > +            pkg_version = LooseVersion(cpe_version(cpeid))
> >
> >          for cpe in self.each_cpe():
> >              if not cpe_matches(cpe['id'], cpeid):
> > @@ -214,7 +220,7 @@ class CVE:
> >
> >              if cpe['v_start']:
> >                  try:
> > -                    cve_affected_version =
> distutils.version.LooseVersion(cpe['v_start'])
> > +                    cve_affected_version = LooseVersion(cpe['v_start'])
> >                      inrange = ops.get(cpe['op_start'])(pkg_version,
> cve_affected_version)
> >                  except TypeError:
> >                      return self.CVE_UNKNOWN
> > @@ -226,7 +232,7 @@ class CVE:
> >
> >              if cpe['v_end']:
> >                  try:
> > -                    cve_affected_version =
> distutils.version.LooseVersion(cpe['v_end'])
> > +                    cve_affected_version = LooseVersion(cpe['v_end'])
> >                      inrange = ops.get(cpe['op_end'])(pkg_version,
> cve_affected_version)
> >                  except TypeError:
> >                      return self.CVE_UNKNOWN
> > --
> > 2.51.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
