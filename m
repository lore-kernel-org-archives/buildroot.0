Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6116ACD5BD2
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 00:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11C4E81547;
	Wed, 27 May 2026 00:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Zp1gn0RA5Ew; Wed, 27 May 2026 00:55:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1A2ED816E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779843301;
	bh=zG9TfgZlhLuL+sowvcUUofndN+floOCtzW4BLNLmNhs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YwgZ57NArdPF2mY25nY3xjyhbUG8XzSaKU0+Bw2Epaa+Orb3fRqcPgM4D2E9G+sFt
	 EH84xzaMhucl0eD7LTDdiVEKOZVF3IM7WLdoZuTurZHQjqrruUCT9pxwcfz2cEwmHv
	 YX1/NVzjVJUNHK/Sf9BdoFn38uFB/PNiuJrnyWmfIrVVNythnNtdec0PWfgtW685So
	 g26OMfGREhD4o+qdUC1WD+tMKyIevMb27cpsb8Qr8w/dwDMlljgF2tAY89WUE46pX4
	 cDIh8WVMP6dEF3qw1KKBWEzjJWFcc588lEa0AxPDfLt3wJi8hk4qHIdWjbITlAncBa
	 5eLRBi5htFCdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A2ED816E2;
	Wed, 27 May 2026 00:55:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F86223F
 for <buildroot@buildroot.org>; Wed, 27 May 2026 00:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60C13816E2
 for <buildroot@buildroot.org>; Wed, 27 May 2026 00:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQarZUgO3GSc for <buildroot@buildroot.org>;
 Wed, 27 May 2026 00:54:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d202::2;
 helo=gvzp280cu018.outbound.protection.outlook.com;
 envelope-from=neustradamus@hotmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8374381547
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8374381547
Received: from GVZP280CU018.outbound.protection.outlook.com
 (mail-swedencentralazolkn190120002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d202::2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8374381547
 for <buildroot@buildroot.org>; Wed, 27 May 2026 00:54:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OddvUuV5aalrKb2zafrpvOU8x/fMP3NHqloB3CHbMWEjcv9Dg/Htjmc9F05YmhWi67547p6EZWmvn63k3KLBCzssmlDYfAtMyFedLp1gECeolyEv+gg6NDDvgJrP2x5Ikk1xmDA3ZEw7NmGOW3CK3cKKD7i7p+XYErGvFtVubQH6EsASSlDFZ6sJdxOqD/FdGpET6lHIzJPTf1WwT5ARG323JPugbGzCfuShNEM1D1nM9P3r2fZqAHpmstvSOkTXvC9S7JPoM8IIGbPJ7cuyIXB2t3bzyUQxryY8j8bVk5LCO3TEEiIf5QZG9sJnwI7YivpCYwRGxOpORT7dZ+8WKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fDokpTrM7trSjv5lCVvPJrtrFUXr+aaWf7NTXwUrZWg=;
 b=ndhIGiFMW3UrHULYBkcSzu5qfwsDkOmhWxX9njEDvADPM6F9ZMEs0J4qf5Uk1ym3IlaWNMJmyRysPY1G1lc2IpWo7IboTaKPuv13vNdGbmP6FcgJP80UbPKHaL3Gr59dxpvM4qWo8tRMEA3Ca+vBevM1b990GnUuFG0MVOhG9S3t01yRxvRrub3aTwR6mdFBnOJrR97Any19Lzrvg6zS6GKjzGRvtUkVU345q4EGHINfeOKsuuoIKLQx1qc5yEwez5kDKoMvy99WJ4u25W1bTG635LXhBgeEgNmrI/5Yv+hbSg3gvgJbAiqg5vZ0DYhAPslF1483biCu/Y7rrU7PdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from GV5P280MB2281.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:375::19)
 by MM0P280MB0899.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:3::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.11; Wed, 27 May 2026 00:54:53 +0000
Received: from GV5P280MB2281.SWEP280.PROD.OUTLOOK.COM
 ([fe80::9938:ab3f:5a26:9ebb]) by GV5P280MB2281.SWEP280.PROD.OUTLOOK.COM
 ([fe80::9938:ab3f:5a26:9ebb%6]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 00:54:53 +0000
From: * Neustradamus * <neustradamus@hotmail.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, Peter Korsgaard
 <peter@korsgaard.com>
Thread-Topic: radvd 2.21 with CVE fixes
Thread-Index: AQHc7XJZZ078RXdUOUSkNpvWVB8+Gg==
Date: Wed, 27 May 2026 00:54:53 +0000
Message-ID: <GV5P280MB2281A925E41A90DC1942788BCB082@GV5P280MB2281.SWEP280.PROD.OUTLOOK.COM>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV5P280MB2281:EE_|MM0P280MB0899:EE_
x-ms-office365-filtering-correlation-id: 81e39c78-f4ed-44c3-7251-08debb8a908c
x-ms-exchange-slblob-mailprops: QG/aTLqFmejIuTVvfAV59fSe9dm3+UOJs7O5tDD2FjiLcmNqiyV9gwAD7KprzHm8Mzg5qXy0DOXuBpMvq8sRTA4szD1NoTCOlhRx0EqBp46ueEKjCCbIp4zH+6Q1LN0cm9vuOTyBUr/oOFVtl2ianUWJ+VeBXUD+79oFr5dhKzSv0mZmZQe0bds5po7lqu3zq2bFbrfvN0AaNs5uLsw5XkdGTm+8ZJglXCwDd19kvDSRk5ut4kwvmjbSz8PbvtgLhliADtEH47TR/QXZlgq3IFgND6tQBhqtgFsSNOy2iuVl9ofUrbuGJwBut87G6tMff+lDQwg6ABU3AuIJmp0vZPHG0YTqlRY2hDaL1EnY86EZSOq3s1Mf9QxPv9mcO2oJZWrUf2pCaD3Ip93ZjFZ4xqMcs3dQWiKF64top9f3tGMfz+Dht+yERaGtUCbu/lsGWYHGbXbg8l/4S71HMOMPHPlHorg2EpurPICoZPw+5/QrSU0TDguNKl35knRq5IU/s8lSeAVxqrCuwMHQzXkeiC1TgBDyUM655MW2X5zUMRUEIysHsaol4FbZ1Kue8hcM3c0yM14enwD14obQ43n0hcrigPzKYKgZxhEjThVCVTQ9AAFqsJD+Hl2/wpSYkAt2NbjzTFF8rvS1Yg8IeKANEYOO7sZJr83o
x-microsoft-antispam: BCL:0;
 ARA:14566002|51005399006|37011999003|55001999006|15080799012|15030799006|24021099003|8060799015|25031999004|19110799012|8062599012|31061999003|10035399007|3412199025|440099028|102099032|40105399003;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?8Al5zxngSSsRTd2hoBgT6auhM4MO2TxVF3wbk+g//9ldLwPY8cdEB1fhjd?=
 =?iso-8859-1?Q?aal8nFL5BagAaDy3w3mhmpzwyHm1zq41neAEuIaeBA0S2DcuRwltRffn2z?=
 =?iso-8859-1?Q?b27u43JZiurKUa3GwvN0qi/Kyk1WHG4CRUlLXS63f5WXT4ma3Di1mz5CC6?=
 =?iso-8859-1?Q?3mjGJ42c/h5QIQyPhwOgnFfEvFjI654rKr2tg7jybOnect/QLXDwv75Du2?=
 =?iso-8859-1?Q?U9hwAdEeKbXVhzZg5GrsZQ/IEDwDeEEqLtYmM4qT9xav0H+sgWJY9Yza5a?=
 =?iso-8859-1?Q?ktTOoujuiRpo3y9OEs8H1iUNVtrIjBUB6ttAWLDpq21tek7YI1gpdnQ6An?=
 =?iso-8859-1?Q?3o8TtVlonC4/SeVY9vZlxjqY0uwzWnBAu81fL289qJN78Eo+54lneWmmlL?=
 =?iso-8859-1?Q?RTF/KV3YmFOK+E1bcNXJ/WvH5zpmFs5yupeCyTmeCA3+QrugysCso0HVZW?=
 =?iso-8859-1?Q?AUvcM1mPLNSUAbIvVOweMhmY3MY4Y/i7iCmavStMPZgaoX5AzlgpXQVXU1?=
 =?iso-8859-1?Q?rNuKZ2jYOkw3QSIzJKbWTBInHiIHCdAa18eQYMIkO3YIeelWHCTRMgP+GB?=
 =?iso-8859-1?Q?5BjKknEf+SctU2ZPlrz8ykWl8WuIMEwTnxCW9KMcAZG0byQGIBJD6g4zTc?=
 =?iso-8859-1?Q?Na1aHgUTPICJy9owEbHKYcsL2ghHP2uwEvaslbpCk1Ei0LEfO2XTM9DqTR?=
 =?iso-8859-1?Q?MFUC2+g0LmfWGjhvvQzdr11P2TdQhRvSyknuyDqEdIGGNk51JNZtqFKOcR?=
 =?iso-8859-1?Q?+lXjjuMSPk/4aXje1cCBSuH/wocjtK2hZ4MUOZ6vFIlmMmwzuzvelGxD5l?=
 =?iso-8859-1?Q?PNLPXgcmAfh/LxUsDS6BUCPsKftRCYJ+N22orqsEH+Nmb2wAhTpyMxnA4K?=
 =?iso-8859-1?Q?iQ6uP1DCPylKHoTkT8Ok9hfaLL7atFZMTgW7jx/zoVaMT6xZnQIQ/kqLEy?=
 =?iso-8859-1?Q?L0sNn0pLx/nISH5NtbEDcZnxVW6iZi9R36Qz21KAoLNj8Rx+uX9Fdzrhu5?=
 =?iso-8859-1?Q?tLf1nWPknlzexbxNxa/dKq8LNr61YxcWxOS87rSjbVZi1oV4+f/ahPyjRi?=
 =?iso-8859-1?Q?Mf/x+iaMSZP410Pp3hCIaM/X8fzNjN1jvzLrRgOYiCuEzXrrMV9SUhUmst?=
 =?iso-8859-1?Q?UDIoI2JT/sPy50Zz3bhbqLHtFblMw=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?mXc2ufCQ7Si76/7w90p60g8XDt/oNVHAp+k2Gart+bsVt3W8pyv1Y/Nsk1?=
 =?iso-8859-1?Q?kTDXF25vCR6XcjIef6HHOKpSBTVM764IltsZ+qXRTxkKmLlYOenKI0clJo?=
 =?iso-8859-1?Q?Izfa5pbpEZuCuZLBmxhUEMW3zMgpyDISz7G1nM/FijQxR2sV8tfROsUQWc?=
 =?iso-8859-1?Q?TkO13WcNOajPOrCc+1IttswRKe6gOW2sgCAU2o95weQeVvA5vqn8KnSd6G?=
 =?iso-8859-1?Q?PItaHHN5mnJw66DdEJi/9nckoORlpNwKpHwi9lLCpMFLkEQCgnWCtBk6BJ?=
 =?iso-8859-1?Q?z4T+PUVxGAGYf2nMFYp0i1mpZ5FbJWIBrb95qDo0/hiybxirRzbOcPJyql?=
 =?iso-8859-1?Q?DXPCgMBvDEAcNHR3tYKzfsM/eLarqyv5ix5B7aH4Fvkxu0BLfpxxoAE9QL?=
 =?iso-8859-1?Q?D9BzKj9+ou17iCeHuKQI1hMrphkzTlD7SeM1/VsYc4fIYfX/h+3UlAmopL?=
 =?iso-8859-1?Q?t5XvHxr4FrEbVzbkLk3s5eloXIZKaFVJAjTOk35Lh2p6aeWkvpRljNA359?=
 =?iso-8859-1?Q?KxxPHN9EciAUid1ndOHSOExUZif8LUM7BK7bVeuLNlPSylx8UJm10vNGJd?=
 =?iso-8859-1?Q?CLnkwXLlVSXVDEHPF47DaoGev6ZS2ecBjUVzD3NQ28HQxZvIGUH75kI0UP?=
 =?iso-8859-1?Q?Q1mmAzFJ4+1xhZyyWRyhLIPSpClPgHLp6oY7oVditlOdEbzDM7b0SSGs26?=
 =?iso-8859-1?Q?7+HIHcAgFy4OKaQZfrTs5AGQ/A/SXKBP+4x9I0NEogJnAFvki7F490ij7q?=
 =?iso-8859-1?Q?GbTJDKbR4nutWh6U4pFcqOeH6Bf8mr4zOLjoldg+Z07j12NHODSAWT7DOy?=
 =?iso-8859-1?Q?OWle9/vF4eiPJI9Fd+nxBNpU30SbnENzejFM/zWhtfmHvOAiaB3l0omjNI?=
 =?iso-8859-1?Q?5mNu4EnGzJ2qvD3n3oIEuE5zvU9ky956rcEojOetvL2opcsDKsoigaprb4?=
 =?iso-8859-1?Q?rvCwJw/OcaRZYYlH+8z36AjMm4Aby9fVzdmYsTOIrsm9j5qmOwdu0MM/6B?=
 =?iso-8859-1?Q?nK8hBsiw4zPELZmHn+E3fvulI2W/z31SWNnk0SV7aIEWjesrhBQE9RVQte?=
 =?iso-8859-1?Q?A25ZZqzpqJ4prbJAWXIWtjRmns3pU4dXK1SJtxCD2+esEhwsLaAvxdwjcW?=
 =?iso-8859-1?Q?jjFcGpolUjXzj1D3/O1+4YE3++JEwF0VwV6wup2esf/zta+UR8A9Gy9tF6?=
 =?iso-8859-1?Q?+17+20jGktxvybjAlv3ey2IW5L61G2pq7H/mYZHyZoYFJsankYeWw2cpRa?=
 =?iso-8859-1?Q?bCkuDlqABdH6PXUWF2GybQMN0Y0JwFSngdU52HywLARZJ8FexPOfiSHS5G?=
 =?iso-8859-1?Q?ttvZtTIp9kz2i0ByvcetsGKFOMlohozOdeB//xctUhu5/koMLonsaapjWQ?=
 =?iso-8859-1?Q?oY1F6h1wvtrtFJ3Epwdy3sX0vq5LV9HYBEMpLsFmtd9ZCZuRyLW+m0UxYf?=
 =?iso-8859-1?Q?P3R0qUwlgUqawtLf?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-9412-4-msonline-outlook-10872.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV5P280MB2281.SWEP280.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e39c78-f4ed-44c3-7251-08debb8a908c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2026 00:54:53.7560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MM0P280MB0899
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotmail.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fDokpTrM7trSjv5lCVvPJrtrFUXr+aaWf7NTXwUrZWg=;
 b=eHa91JcbP81q2+SWIjDkyakUoGPgOD6zryqx+nJG06s/LTZKEsY6xyATye4eSsbEZLHM3wfCHa0x6yiNtTCyS+BhAc15V44KXopohyZ1+wn33t0/X6Kl37aQLJmkcwoZcLGpKF/0QZLAwrRfvhdvDyfrUfogFLI487T9rVQqa9sUG2VYL4017pbh9thYG6g/89rlswpePT+uR3dFWenieKM2Eyb0Ka3QjMha1w8TFjY2Tj6zExb6ehFRdCYBBS9uAtT17yba9ETELEQMDPN2k/keumPCK7soSrTdl9IQ9n5fbop2uBKrtYmzSjTLHv+St9GeRBqRzBm+etz/26qWlQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=hotmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=eHa91Jcb
Subject: [Buildroot] radvd 2.21 with CVE fixes
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

Dear Buildroot team, Peter Korsgaard,

Can you update radvd to 2.21 with CVE fixes?
- https://github.com/radvd-project/radvd/releases
- https://github.com/radvd-project/radvd/tags

Thanks in advance

Regards,

Neustradamus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
