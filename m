Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBA8E7DF13
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 17:49:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D3DE780CEC;
	Mon,  2 Feb 2026 17:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvmlGOlgKxAL; Mon,  2 Feb 2026 17:49:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4470480D3D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770054594;
	bh=Cticg/jhbVaie1jU7Gfr0WgttreYfoj5ciokGxuCx/8=;
	h=To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sHcpQIEQ9qMNqLV7AAkS+kV2TqTiB3u0fsKG9kHyj4Tz6H4coDNNPB/nFZ7USjd7L
	 lI0Y5G74rDtXcZOWF5JYsxB2TjeRR8LHny6ie5q3O5KbU1IJFTwj+04KR01dlRoL9Y
	 kybWbV/7M4JufQ/FoMURyIfVqptb3+v5V49E/ddBO75RWmYPC6ry5bz4qeSqom8f0l
	 qMfYeopBWubJ3jQS21K8jstnTwXddNsPbtHrO5OT2olfv6CVxD50Zx5s4xv0qV5hqS
	 QT4KY1owm++48LSqwV5YQt2VpS1dkja4PB5I2E2sqK3wac2BST0klfqwsOX5hYdehi
	 gjPUtDaUKn12A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4470480D3D;
	Mon,  2 Feb 2026 17:49:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 149CA23E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 016646074C
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:49:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lu4INTwLeUin for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 17:49:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c200::1;
 helo=db3pr0202cu003.outbound.protection.outlook.com;
 envelope-from=jimmy.wesolowski@mobileye.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3AD866064A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AD866064A
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3AD866064A
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 17:49:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=octISf4fSZ2vIjgkExmEEE4/fmiHEpje0pHSuUS+wQbOeBWukyfPQ1S/cf1LdhJh6SPIu/VguQHgIvs7vtNUwkAKz4lKTrvNsJ3YyVPFqS0r+RUBBRu7Q7Fmzyl7EKgXqT482kRQEWmwwq5pl5V4N3GLDIuViKn+H16ydqkjaWYGCbcPZ6j1i+2CCn213ZlQR/mevPnqwCIGujinPBAZ5FNdiirG22PG9EmJoD7ZUcjOyoK3Rr0ELY1JDi6ixdV4ArDPySF1V5Lta92sqsrQmKT00QdukkhsIZdCvzXfdYEfuABI2hM85RqxppzqNQOm2cMEkrqzs7Ert9uTlLLObw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1SdiukcZOsVgQgBmoU7Go6B6qONdYMzPxIsEDAih/U=;
 b=vxAg2zvkOK/SkAqMlkHiQ3PQh2zHUBQwhdQ/BK3N+cpXBNuKdqGSaZWcZjhZHVI1RJGqs5YKAQzlDfF1/xW4VfvmIoumYZRRzprd0REQPP3h/yQS8ZvO1qU76h8H2hFG9APBWEpRK4qWEcWZY0VMQESzZtxBrKB7zraU3M/NdpKgEme1ljCDrpBLezVS0ahf/+SAZV+VQz7WM0KN00iSz1/9T/JSZILFQaJvc54mzKeI95uD3RKvXyQoYkNP6zu4/8P00w8CVUfOmOV+NV6k4ES5nBd+aa54BGJFNVfQ5wlvU23XGUpZjPzZYOwRYn9Hn3s+8BnANFjGr7/UCaCk6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com (2603:10a6:10:2a7::13)
 by VI1PR09MB3600.eurprd09.prod.outlook.com (2603:10a6:803:13c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Mon, 2 Feb
 2026 17:49:43 +0000
Received: from DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f]) by DB9PR09MB4987.eurprd09.prod.outlook.com
 ([fe80::646a:ffaf:f0a1:cf9f%4]) with mapi id 15.20.9587.010; Mon, 2 Feb 2026
 17:49:43 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
CC: Guenther Harrasser <Guenther.Harrasser@mobileye.com>
Thread-Topic: [PATCH 0/3] package/xdp-tools: add new package
Thread-Index: AQHclGxQQB1d5zdYv0eW5bD2Wjs8YQ==
Date: Mon, 2 Feb 2026 17:49:43 +0000
Message-ID: <DB9PR09MB498763B6FA5A72213CEAF2A6F69AA@DB9PR09MB4987.eurprd09.prod.outlook.com>
References: <20260202142359.2577937-1-jimmy.wesolowski@mobileye.com>
 <20260202142359.2577937-3-jimmy.wesolowski@mobileye.com>
In-Reply-To: <20260202142359.2577937-3-jimmy.wesolowski@mobileye.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR09MB4987:EE_|VI1PR09MB3600:EE_
x-ms-office365-filtering-correlation-id: 7aa26093-4258-4d44-5d39-08de628372ac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7142099003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?9vVYreXDI4TF6V+PdRUYQAGws67N48HlPxJkBqOiZcuf/WZ1ISxT3g9MV6?=
 =?iso-8859-1?Q?dhppFmg+SXTJF9eM6EvTBFCr1SFX2odSKfcwMsT2Uuq8h32134HkwiPCkY?=
 =?iso-8859-1?Q?RIyyd4L57Q7NWN/cyXHULLHd2HwP9GRCBErNc1CbxMUqTNKe1A7EYw9AQj?=
 =?iso-8859-1?Q?d68efSjgKLS0Ps7NcbM7dDRy3LyTcqJkuTbKnp2oFcbv5Jpflja8c6mr0c?=
 =?iso-8859-1?Q?5OLxviZD9e4CafPvM7ROugwF0QbucBNdtRGYzll7MO1s1aLnrRHZC8iECG?=
 =?iso-8859-1?Q?IrhmP+54Rx4wW4ZEM6ZqGOLhowpyyF5H4vdfJR+3OwKkc5m6KxrFqHaNOl?=
 =?iso-8859-1?Q?Z/V0eL9bpRoQWGOig8cYe9Upkn3NJDHDFAo5u/JfC6QLfAy6MqGpKXq49m?=
 =?iso-8859-1?Q?vd6ieYci5CK0I1w0+EiGJ2RqED/5Yi+fjU7tNHDFxCMInip9k66R+yF9H9?=
 =?iso-8859-1?Q?ddGgPvrBq3Mh/pKcHOjbADqSZwJfXsUCCUVasgQm1aiFnYkiND8lIltd0j?=
 =?iso-8859-1?Q?nU7hn/SOdqgehVfECqJ8ROl8rekieJPnWxbNVO9GmPCJrd6uan6zMTrDkn?=
 =?iso-8859-1?Q?AGhHWPI9FqdtA6h0gBPMBn6CEm7bToVmn9BlY8uWTFv4XKZKv2d9r4HwF/?=
 =?iso-8859-1?Q?yEeNt0TTSmztrDWE0wlRVfcMZ1zr5IEJ2RFihd08uYhA+ggT7Laxbp6Rt+?=
 =?iso-8859-1?Q?pVt6BLAizxc57eMBcD22aLunq+5iQ2k1LNp89PqkIrlngTx8KD4nPMjtme?=
 =?iso-8859-1?Q?o6B6MUpxJRIQyGh6ei3j5Gd0X6U3Nl4sB/0wHZwj8wxhQWw3Fa8rPR2oVp?=
 =?iso-8859-1?Q?rOWeS/38heIBS4lCGHkPdr42zJqYUtrpjARwZ1eZ2BfJ+3TNJ5m+64JQPl?=
 =?iso-8859-1?Q?ElfJvgEno+r+G/ZeLf1ak+mvS5WjmEUg0WThHn7eF1Hznf52QVVunBHxyA?=
 =?iso-8859-1?Q?+gjibfE2o5z2lA2iVYsAeoFGJH77Od314Qrio/1NuYDDtJ14m5UHPjpVLy?=
 =?iso-8859-1?Q?N2x8jwesqmTo9v9oV59rQJGfcoQlvZB+s638dLU9378b7JbvUSyYkqR03u?=
 =?iso-8859-1?Q?bXyJVcmOFhl1p+W7POKWbVJaqp5Zg/hX7yoeQs0fUxw1+5mmHiLeuI8/2k?=
 =?iso-8859-1?Q?hdKuyZLILJdUQIA+AaSVua3fSjkuqRkzbGBI/CPUL1jOMOcTNd7cLlho4F?=
 =?iso-8859-1?Q?2iTozQ6kpdnIxDCHgOYTQdOaMFoDP7kkNL8ymbuBe9MoiridhQkTorkeyt?=
 =?iso-8859-1?Q?DogicUy7YexpyaV9XoTZzJpmHJA+sXRVCxd199HU5BGOsS8g5WL1SKaBV4?=
 =?iso-8859-1?Q?9NbYlKSyOnAAKheMzXlGj+PGLwSAlLNTtyDXP7lF5MEcCGsTZg3AjpKVby?=
 =?iso-8859-1?Q?5Zfo9MQsq7TPUZPFK9+jsxAa2+0xRcSO7FOEgNiyHpIguzqPY6SGoW7sOF?=
 =?iso-8859-1?Q?7FZr8WxwKrfbS9H2nL6wpepiEqnwwdt0hYbsvK7aG7xqxvh8gwDYJW6/Ox?=
 =?iso-8859-1?Q?l9Up2DkZIaaarToOAnkn30J5GZnVMQ/xSPBjfFh9VSbrhRdSGb00B49Xyc?=
 =?iso-8859-1?Q?mUWEtaDyVcrjcTh6AlYORud/g+JQBcoy1Wiwodfsxlibie/b1RBfefwIZu?=
 =?iso-8859-1?Q?zQkG0LyehNAcnScIHLDY6Rd90KD5Buf9JyWJnRPnQY646Paa4sR9jWnGlX?=
 =?iso-8859-1?Q?4Qc/rB1TYOiTHv2AVZL3RMmJ9EDJXUSsGwqyjeYH?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR09MB4987.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7142099003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?IxJCjJmdX0Pw5MR3MbD3sZn5g5S1EmpljMBz7yQ4SJ3JHhjndbCaJGX2pa?=
 =?iso-8859-1?Q?vX4v1iymJrhdPz+I758MIt50rvPGHWUI3t6GDnW4yILKZKrWImR6cr/oyD?=
 =?iso-8859-1?Q?FdIJSOBLBfFF65kFVcC4maf/8dy0rVouzZCEodqsjroGHsuMZlpAJFDQIX?=
 =?iso-8859-1?Q?cxNpPvF9/odyx7m7rSJtNkD0SjeU5Yguc/OpDsbVJ/ZUIfIVIVeUXrYi53?=
 =?iso-8859-1?Q?MhxzHN9+flWAZ4yqy7aOq5KeisRb96cpSStqewL2TgGUoFBcyPh5kwdFAw?=
 =?iso-8859-1?Q?bE4f6eQK8XBl1bDpH0XvZCmItUnKL/Via/idfMOdG3/LTv7ZKiKz6jkAjx?=
 =?iso-8859-1?Q?qlvU7fIDAOjskVAb3fSJAjSzbGz6b76gQc7SSk6miC+3nYjLbhgUmx+HWj?=
 =?iso-8859-1?Q?+aa+ey6soqOXTYpFgs2INxvvvohbxXI7eXV5bF0sA4Lxni7AsT0z1yth4z?=
 =?iso-8859-1?Q?7DQKS+uDba+sG345BID1hWUAfDOyCznZ/XTwYBTTQTcEOioIil9xRgMT1c?=
 =?iso-8859-1?Q?6XXblCOuOjN5QJHIM4PgCSF0zyK/vcxGIVFVIorrnG0bMj42qR+tKRAZ9W?=
 =?iso-8859-1?Q?UfNzpW4/XC9rVgwCHLonaUrOdn0kpqXCBB0zKgAKSp26LgvyALl+jT0L0C?=
 =?iso-8859-1?Q?I4OwjLQOMvJ/7Fr0W2J1fkkE8GdYSGntZkJSEOgEoadM9o+G4p77sHIdiE?=
 =?iso-8859-1?Q?S66Ls1qbg6b33HJrP4793QKDuWhKgRzCiaS+wOljIgjHJkV91F9evo28Eh?=
 =?iso-8859-1?Q?kJA2hKNOoPzHrFIo5HY22G0iIpycn9OlSDWMBDKcSJ70Rw72TfMVZ1WvAD?=
 =?iso-8859-1?Q?BTsTMrjDGSUkPh6YaEoUko4CFIEcKH5fEiq67umJd6kb1nndm1PXGUlSXY?=
 =?iso-8859-1?Q?RddrLzTGEjnDGyLxdNVcjVXR36y0VGpi/k3smayYFmPdz4nn0FCdFZbPx9?=
 =?iso-8859-1?Q?ExUV+geqT0HFM2CGNBdfGYRnF4ExgwsgUvkq3/iFNHiD1/XUIlU/sonCtz?=
 =?iso-8859-1?Q?CrkvnYbXlLUpDp8Nh5Z1LrnjGl3jHZ7tiENOSK1lBFS+Z+Z+urlrhaYymu?=
 =?iso-8859-1?Q?Nl1F69yKEfxTjTEnveFHf9vXw2i2nuc2hiV02IKW6hXgGIob3r2aLbMhZ0?=
 =?iso-8859-1?Q?hhcWAF8Eqi75S8LAFa+oiETiiIrM0ijhn2I1vCv/+CBDAhhXz+/U6Y2O16?=
 =?iso-8859-1?Q?REmQh76PDSABUEORAhFil0+G5du/2JDwLVzuAMOSgyw3zc07f14L3dIxVW?=
 =?iso-8859-1?Q?3y84R9xld3BrGeIhM8WJax3vcOnHiXSKYSvwkKbl9fb7hTklKNfS4YoTwn?=
 =?iso-8859-1?Q?8jfwlG+ubbvwwN+0QZNx+JbQXMH3w3Xbawy4MI7KyOTfKFZnpY9lQ/X+7Z?=
 =?iso-8859-1?Q?TpJzOZgBQty7W11LjZyQ6eZcoF4vNaP/SAhaeGpxXGi8Q8QqnOGCF+pDdx?=
 =?iso-8859-1?Q?BKePPOZE8gQ5XEw0opUmoTKaKRHMALRAiMyEGYxmkcVMcyoLRZaOwRGdB8?=
 =?iso-8859-1?Q?TLnfNU29FFUmmOyuiBF/zeP1pypk17zE2nKCil1y0qdm7lrhq+ArZhhKNd?=
 =?iso-8859-1?Q?lepVZj9Gr3tpdquhy1oKTJh6NZplF+9c8UMG1pEY/U71Ezugk2z4bQVLtg?=
 =?iso-8859-1?Q?F1w4Q+5zcV4VNu3TmQkck4azjBL6QNzeHEPtX98B+vToJDhRmjrk3+j+pW?=
 =?iso-8859-1?Q?DH7qKJ8rW7MumVPk9A0PO50Rd1XlyobWLjR0WPbh/RDqlE6abZt8ZpWGvY?=
 =?iso-8859-1?Q?xqMdKoC2PzEAHp/XmDIBbcB1CF40oEJvU7Fcz3ln5XAyDz?=
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR09MB4987.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa26093-4258-4d44-5d39-08de628372ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 17:49:43.6882 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: amZrBedLQOd8M/FzztKViM3lk+NpNmKDDmuJgR3WRQYx8V5ksbDAsRb6+ho3QGofAkeGXTL2tKAo1Cbn+yUFEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR09MB3600
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mobileye.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M1SdiukcZOsVgQgBmoU7Go6B6qONdYMzPxIsEDAih/U=;
 b=iXigTaT6AiTi/zeEt9BfStcMjjgZE642Fm1YR7lQjWXXrAI+Ws524LVNM7wYo701C49uDuHGSjGxFWUuCFA7gP8IeHuyVSjtSXJKBXHKHP4DE4qySf/9oRKtzk4UUN6j6lbP+5IU2w30TVlKBzc3j66CrcEabT1vSk+x0GvOqus=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mobileye.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256
 header.s=selector1 header.b=iXigTaT6
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
Subject: [Buildroot] [PATCH 0/3] package/xdp-tools: add new package
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
From: Jimmy Wesolowski via buildroot <buildroot@buildroot.org>
Reply-To: Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some clarifications:
Binutils and GCC for BPF are following a previous patch series [1][2], with
the review comments applied. They are now both individual packages
without any relation to the host or target toolchain.

There is currently no support in GCC BPF for "#pragma unroll" and
"#pragma clang loop unroll(full)", and requires another patch/patches
to adapt this for GCC.

1. https://patchwork.ozlabs.org/project/buildroot/patch/20220809094109.2279=
598-1-james.hilliard1@gmail.com/
2. https://patchwork.ozlabs.org/project/buildroot/patch/20220809094109.2279=
598-2-james.hilliard1@gmail.com/

________________________________________
From:=A0Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
Sent:=A002 February 2026 15:23
To:=A0buildroot@buildroot.org <buildroot@buildroot.org>
Cc:=A0Guenther Harrasser <Guenther.Harrasser@mobileye.com>; Jimmy Wesolowsk=
i <Jimmy.Wesolowski@mobileye.com>
Subject:=A0[PATCH 3/3] package/xdp-tools: add new package
=A0
This adds the XDP tools libxdp support.
Some patches are required to allow building against GCC BPF.

Some more work is needed to allow building against GCC or against Clang,
and to verify the support of the other components of XDP tools (xdp-bench,
xdp-dump, ...).

Change-Id: Ic389bcaa044ba8c176c5b92294d3d808bb0aefa6
Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
---
=A0package/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0=A0 1 +
=A0...le-add-support-for-other-BPF-compile.patch | 213 ++++++++++++++++++
=A0package/xdp-tools/Config.in=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 |=A0 61 +++++
=A0package/xdp-tools/xdp-tools.hash=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =
|=A0=A0 5 +
=A0package/xdp-tools/xdp-tools.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 | 110 +++++++++
=A05 files changed, 390 insertions(+)
=A0create mode 100644 package/xdp-tools/0001-configure-Makefile-add-support=
-for-other-BPF-compile.patch
=A0create mode 100644 package/xdp-tools/Config.in
=A0create mode 100644 package/xdp-tools/xdp-tools.hash
=A0create mode 100644 package/xdp-tools/xdp-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 94ea56b297..ff16b95d69 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -160,6 +160,7 @@ menu "Debugging, profiling and benchmark"
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/valgrind/Config.in"
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/vmtouch/Config.in"
=A0=A0=A0=A0=A0=A0=A0=A0 source "package/whetstone/Config.in"
+=A0=A0=A0=A0=A0=A0 source "package/xdp-tools/Config.in"
=A0endmenu
=A0
=A0menu "Development tools"
diff --git a/package/xdp-tools/0001-configure-Makefile-add-support-for-othe=
r-BPF-compile.patch b/package/xdp-tools/0001-configure-Makefile-add-support=
-for-other-BPF-compile.patch
new file mode 100644
index 0000000000..cef3c3798f
--- /dev/null
+++ b/package/xdp-tools/0001-configure-Makefile-add-support-for-other-BPF-c=
ompile.patch
@@ -0,0 +1,213 @@
+From 75844533449ce924f7798feda42747c130b7359b Mon Sep 17 00:00:00 2001
+From: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
+Date: Mon, 26 Jan 2026 12:23:44 +0200
+Subject: [PATCH] configure/Makefile: add support for other BPF compilers
+
+We should allow other compilers than Clang for BPF. Now that the support
+for BPF in GCC is completed (https://lwn.net/Articles/975412/), it should
+be possible to compile XDP tools with GCC.
+
+Upstream: N/A not yet upstreamed to XDP tools.
+
+Signed-off-by: Jimmy Durand Wesolowski <jimmy.wesolowski@mobileye.com>
+---
+ configure=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 74 ++++++++++=
+++++++++++++++++------------
+ lib/common.mk=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 2 +-
+ lib/libxdp/Makefile=A0=A0=A0=A0=A0=A0 |=A0 2 +-
+ lib/libxdp/tests/Makefile |=A0 2 +-
+ lib/util/Makefile=A0=A0=A0=A0=A0=A0=A0=A0 |=A0 2 +-
+ 5 files changed, 55 insertions(+), 27 deletions(-)
+
+diff --git a/configure b/configure
+index f363ef6..acbb581 100755
+--- a/configure
++++ b/configure
+@@ -3,6 +3,8 @@
+ # This is not an autoconf generated configure
+ #
+
++set -e -o pipefail
++
+ # Output file which is input to Makefile
+ CONFIG_FINAL=3Dconfig.mk
+ CONFIG=3D".${CONFIG}.tmp"
+@@ -20,7 +22,6 @@ check_opts()
+=A0=A0=A0=A0 echo "PRODUCTION:=3D${PRODUCTION}" >>$CONFIG
+=A0=A0=A0=A0 echo "DYNAMIC_LIBXDP:=3D${DYNAMIC_LIBXDP}" >>$CONFIG
+=A0=A0=A0=A0 echo "MAX_DISPATCHER_ACTIONS:=3D${MAX_DISPATCHER_ACTIONS}" >>=
$CONFIG
+-=A0=A0=A0 echo "BPF_TARGET:=3D${BPF_TARGET}" >>$CONFIG
+ }
+
+ find_tool()
+@@ -54,13 +55,14 @@ find_tool()
+ check_toolchain()
+ {
+=A0=A0=A0=A0 local emacs_version
+-=A0=A0=A0 local clang_version
++=A0=A0=A0 local bpf_compiler_version
++=A0=A0=A0 local bpf_compiler_major
+=A0=A0=A0=A0 local bpftool_version
+
+=A0=A0=A0=A0 : ${PKG_CONFIG:=3Dpkg-config}
+=A0=A0=A0=A0 : ${CC=3Dgcc}
+=A0=A0=A0=A0 : ${OBJCOPY=3Dobjcopy}
+-=A0=A0=A0 : ${CLANG=3Dclang}
++=A0=A0=A0 : ${BPF_COMPILER=3Dclang}
+=A0=A0=A0=A0 : ${M4=3Dm4}
+=A0=A0=A0=A0 : ${EMACS=3Demacs}
+=A0=A0=A0=A0 : ${BPFTOOL=3Dbpftool}
+@@ -68,9 +70,9 @@ check_toolchain()
+=A0=A0=A0=A0 : ${ARCH_INCLUDES=3D}
+=A0=A0=A0=A0 : ${ARCH_NAME=3D}
+
+-=A0=A0=A0 CLANG=3D$(find_tool clang "$CLANG")
++=A0=A0=A0 BPF_COMPILER=3D$(find_tool "${BPF_COMPILER}" "${BPF_COMPILER}")
+
+-=A0=A0=A0 for TOOL in $PKG_CONFIG $CC $OBJCOPY $CLANG $M4 $READELF; do
++=A0=A0=A0 for TOOL in $PKG_CONFIG $CC $OBJCOPY $BPF_COMPILER $M4 $READELF=
; do
+=A0=A0=A0=A0=A0=A0=A0=A0 if [ ! $(command -v ${TOOL} 2>/dev/null) ]; then
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "*** ERROR: Cannot find tool ${T=
OOL}" ;
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exit 1;
+@@ -79,17 +81,42 @@ check_toolchain()
+
+=A0=A0=A0=A0 ARCH_NAME=3D$($CC -print-multiarch 2>/dev/null)
+
+-=A0=A0=A0 clang_version=3D$($CLANG --version | sed -nE 's/.*clang version=
 ([[:digit:]]+).*/\1/p')
+-=A0=A0=A0 if [ "$?" -ne "0" ]; then
+-=A0=A0=A0=A0=A0=A0=A0 echo "*** ERROR: Couldn't execute '$CLANG --version=
'"
+-=A0=A0=A0=A0=A0=A0=A0 exit 1
+-=A0=A0=A0 fi
+-
+-=A0=A0=A0 echo "Found clang binary '$CLANG' with version $clang_version (=
from '$($CLANG --version | head -n 1)')"
+-=A0=A0=A0 if [ "$clang_version" -lt "11" ]; then
+-=A0=A0=A0=A0=A0=A0=A0 echo "*** ERROR: Need LLVM version 11+, '$CLANG' is=
 version $clang_version"
+-=A0=A0=A0=A0=A0=A0=A0 [ -n "$RELAXED_LLVM_VERSION" ] || exit 1
+-=A0=A0=A0 fi
++=A0=A0=A0 case ${BPF_COMPILER} in
++=A0=A0=A0=A0=A0 *clang* )
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 if ! bpf_compiler_version=3D$("${BPF_COMPILER=
}" --version | head -n1); then
++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "*** ERROR: Couldn't execute=
 '${BPF_COMPILER} --version'"
++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exit 1
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 bpf_compiler_major=3D$(
++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "${bpf_compiler_version}" \
++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | sed -nE 's/.*clang =
version ([[:digit:]]+).*/\1/p')
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "Found clang binary '${BPF_COMPILER}' wi=
th version ${bpf_compiler_version}"
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 if [ "$bpf_compiler_major" -lt "11" ]; then
++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "*** ERROR: Need LLVM versio=
n 11+, '${BPF_COMPILER}' is version ${bpf_compiler_version}"
++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 [ -n "$RELAXED_LLVM_VERSION" ] ||=
 exit 1
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 BPF_CFLAGS=3D"${BPF_CFLAGS} -target \"${BPF_T=
ARGET}\""
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 ;;
++
++=A0=A0=A0=A0=A0 *gcc* )
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 if ! bpf_compiler_version=3D$("${BPF_COMPILER=
}" -dumpversion); then
++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "*** ERROR: Couldn't execute=
 '${BPF_COMPILER} -dumpversion'"
++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exit 1
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 bpf_compiler_major=3D"$( \
++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "${bpf_compiler_version}" \
++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | sed --regexp-extend=
ed 's|([[:digit:]]+)\..+|\1|')"
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "Found GCC binary '${BPF_COMPILER}' with=
 version ${bpf_compiler_version}"
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 if [ "${bpf_compiler_major}" -lt 15 ]; then
++=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "*** ERROR: Need GCC version=
 15+, '${BPF_COMPILER}' is version ${bpf_compiler_version}"
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 fi
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 ;;
++
++=A0=A0=A0=A0=A0 * )
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "*** ERROR: Unknown compiler ${BPF_COMPI=
LER}"
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 exit 1
++=A0=A0=A0=A0=A0=A0=A0=A0=A0 ;;
++=A0=A0=A0 esac
+
+=A0=A0=A0=A0 if ! command -v $EMACS >/dev/null 2>&1; then
+=A0=A0=A0=A0=A0=A0=A0=A0 EMACS=3D""
+@@ -128,12 +155,13 @@ check_toolchain()
+=A0=A0=A0=A0 echo "PKG_CONFIG:=3D${PKG_CONFIG}" >>$CONFIG
+=A0=A0=A0=A0 echo "CC:=3D${CC}" >>$CONFIG
+=A0=A0=A0=A0 echo "OBJCOPY:=3D${OBJCOPY}" >>$CONFIG
+-=A0=A0=A0 echo "CLANG:=3D${CLANG}" >>$CONFIG
++=A0=A0=A0 echo "BPF_COMPILER:=3D${BPF_COMPILER}" >>$CONFIG
+=A0=A0=A0=A0 echo "M4:=3D${M4}" >>$CONFIG
+=A0=A0=A0=A0 echo "EMACS:=3D${EMACS}" >>$CONFIG
+=A0=A0=A0=A0 echo "ARCH_INCLUDES:=3D$ARCH_INCLUDES" >> $CONFIG
+=A0=A0=A0=A0 echo "READELF:=3D${READELF}" >> $CONFIG
+=A0=A0=A0=A0 echo "BPFTOOL:=3D${BPFTOOL}" >> $CONFIG
++=A0=A0=A0 echo "BPF_CFLAGS+=3D${BPF_CFLAGS}" >> $CONFIG
+=A0=A0=A0=A0 [ -n "$BPFTOOL" ] && echo "HAVE_FEATURES+=3DBPFTOOL" >>"$CONF=
IG"
+ }
+
+@@ -442,12 +470,12 @@ endif
+
+
+ ifeq (\$(VERBOSE), 0)
+-=A0=A0=A0 QUIET_CC=A0=A0=A0=A0=A0=A0 =3D @echo '=A0=A0=A0 CC=A0=A0=A0=A0=
=A0=A0 '\$@;
+-=A0=A0=A0 QUIET_CLANG=A0=A0=A0 =3D @echo '=A0=A0=A0 CLANG=A0=A0=A0 '\$@;
+-=A0=A0=A0 QUIET_LINK=A0=A0=A0=A0 =3D @echo '=A0=A0=A0 LINK=A0=A0=A0=A0 '\=
$@;
+-=A0=A0=A0 QUIET_INSTALL=A0 =3D @echo '=A0=A0=A0 INSTALL=A0 '\$@;
+-=A0=A0=A0 QUIET_M4=A0=A0=A0=A0=A0=A0 =3D @echo '=A0=A0=A0 M4=A0=A0=A0=A0=
=A0=A0 '\$@;
+-=A0=A0=A0 QUIET_GEN=A0=A0=A0=A0=A0 =3D @echo '=A0=A0=A0 GEN=A0=A0=A0=A0=
=A0 '\$@;
++=A0=A0=A0 QUIET_CC=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D @echo '=A0=A0=A0 CC=
=A0=A0=A0=A0=A0=A0 '\$@;
++=A0=A0=A0 QUIET_BPF_COMPILER =3D @echo '=A0=A0=A0 CC_BPF=A0=A0 '\$@;
++=A0=A0=A0 QUIET_LINK=A0=A0=A0=A0=A0=A0=A0=A0 =3D @echo '=A0=A0=A0 LINK=A0=
=A0=A0=A0 '\$@;
++=A0=A0=A0 QUIET_INSTALL=A0=A0=A0=A0=A0 =3D @echo '=A0=A0=A0 INSTALL=A0 '\=
$@;
++=A0=A0=A0 QUIET_M4=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D @echo '=A0=A0=A0 M4=
=A0=A0=A0=A0=A0=A0 '\$@;
++=A0=A0=A0 QUIET_GEN=A0=A0=A0=A0=A0=A0=A0=A0=A0 =3D @echo '=A0=A0=A0 GEN=
=A0=A0=A0=A0=A0 '\$@;
+ endif
+ EOF
+ }
+diff --git a/lib/common.mk b/lib/common.mk
+index ce24c48..15b438b 100644
+--- a/lib/common.mk
++++ b/lib/common.mk
+@@ -108,7 +108,7 @@ $(ALL_EXEC_TARGETS): %: %.c=A0 $(OBJECT_LIBBPF) $(OBJE=
CT_LIBXDP) $(LIBMK) $(LIB_OB
+=A0=A0=A0=A0=A0=A0=A0=A0 $< $(USER_EXTRA_C) $(LDLIBS)
+
+ $(XDP_OBJ): %.o: %.c $(KERN_USER_H) $(EXTRA_DEPS) $(BPF_HEADERS) $(LIBMK)
+-=A0=A0=A0=A0=A0 $(QUIET_CLANG)$(CLANG) -target $(BPF_TARGET) $(BPF_CFLAGS=
) -O2 -c -g -o $@ $<
++=A0=A0=A0=A0=A0 $(QUIET_BPF_COMPILER)$(BPF_COMPILER) $(BPF_CFLAGS) -O2 -c=
 -g -o $@ $<
+
+ $(BPF_SKEL_H): %.skel.h: %.bpf.o
+=A0=A0=A0=A0=A0=A0=A0 $(QUIET_GEN)$(BPFTOOL) gen skeleton $< name $(notdir=
 ${@:.skel.h=3D}) > $@
+diff --git a/lib/libxdp/Makefile b/lib/libxdp/Makefile
+index 7ea7e7e..78c2f8b 100644
+--- a/lib/libxdp/Makefile
++++ b/lib/libxdp/Makefile
+@@ -138,7 +138,7 @@ $(EMBEDDED_XDP_OBJS): %.embed.o: %.o
+=A0=A0=A0=A0=A0=A0=A0 $(Q)$(OBJCOPY)=A0 --rename-section .data=3D.rodata,a=
lloc,load,readonly,data,contents $@
+
+ $(XDP_OBJS): %.o: %.c $(BPF_HEADERS) $(LIBMK)
+-=A0=A0=A0=A0=A0 $(QUIET_CLANG)$(CLANG) -target $(BPF_TARGET) $(BPF_CFLAGS=
) -O2 -c -g -o $@ $<
++=A0=A0=A0=A0=A0 $(QUIET_BPF_COMPILER)$(BPF_COMPILER) $(BPF_CFLAGS) -O2 -c=
 -g -o $@ $<
+
+ .PHONY: man
+ ifeq ($(EMACS),)
+diff --git a/lib/libxdp/tests/Makefile b/lib/libxdp/tests/Makefile
+index aed8b4d..a9961c4 100644
+--- a/lib/libxdp/tests/Makefile
++++ b/lib/libxdp/tests/Makefile
+@@ -85,7 +85,7 @@ $(STATIC_LINK_TARGETS): %: %.c=A0 $(OBJECT_LIBBPF) $(STA=
TIC_OBJECT_LIBXDP) $(LIBMK
+=A0=A0=A0=A0=A0=A0=A0=A0 $< $(USER_EXTRA_C) $(STATIC_LDLIBS)
+
+ $(BPF_OBJS): %.o: %.c $(BPF_HEADERS) $(LIBMK) $(EXTRA_DEPS)
+-=A0=A0=A0=A0=A0 $(QUIET_CLANG)$(CLANG) -target $(BPF_TARGET) $(BPF_CFLAGS=
) -O2 -c -g -o $@ $<
++=A0=A0=A0=A0=A0 $(QUIET_CLANG)$(BPF_COMPILER) $(BPF_CFLAGS) -O2 -c -g -o =
$@ $<
+
+ run: all
+=A0=A0=A0=A0=A0=A0=A0 $(Q)env CC=3D"$(CC)" CFLAGS=3D"$(CFLAGS) $(LDFLAGS)"=
 CPPFLAGS=3D"$(CPPFLAGS)" LDLIBS=3D"$(LDLIBS)" V=3D$(V) $(TEST_RUNNER) $(TE=
ST_FILE) $(RUN_TESTS)
+diff --git a/lib/util/Makefile b/lib/util/Makefile
+index 64a6efc..3e2ebd2 100644
+--- a/lib/util/Makefile
++++ b/lib/util/Makefile
+@@ -18,7 +18,7 @@ clean:
+ BPF_CFLAGS +=3D -I$(HEADER_DIR) $(ARCH_INCLUDES)
+
+ $(UTIL_BPF_OBJS): %.o: %.c $(KERN_USER_H) $(BPF_HEADERS) $(LIBMK)
+-=A0=A0=A0=A0=A0 $(QUIET_CLANG)$(CLANG) -target $(BPF_TARGET) $(BPF_CFLAGS=
) -O2 -c -g -o $@ $<
++=A0=A0=A0=A0=A0 $(QUIET_BPF_COMPILER)$(BPF_COMPILER) $(BPF_CFLAGS) -O2 -c=
 -g -o $@ $<
+
+ $(UTIL_SKEL_H): %.skel.h: %.bpf.o
+=A0=A0=A0=A0=A0=A0=A0 $(QUIET_GEN)$(BPFTOOL) gen skeleton $< name ${@:.ske=
l.h=3D} > $@
+--
+2.43.0
+
diff --git a/package/xdp-tools/Config.in b/package/xdp-tools/Config.in
new file mode 100644
index 0000000000..8c9cd6a165
--- /dev/null
+++ b/package/xdp-tools/Config.in
@@ -0,0 +1,61 @@
+config BR2_PACKAGE_XDP_TOOLS
+=A0=A0=A0=A0=A0=A0 bool "xdp-tools"
+=A0=A0=A0=A0=A0=A0 select BR2_PACKAGE_LIBBPF
+=A0=A0=A0=A0=A0=A0 help
+=A0=A0=A0=A0=A0=A0=A0=A0 This package is the collection of utilities and e=
xample code
+=A0=A0=A0=A0=A0=A0=A0=A0 that uses the XDP library.
+
+if BR2_PACKAGE_XDP_TOOLS
+config BR2_PACKAGE_XDP_TOOLS_LIBXDP
+=A0=A0=A0=A0=A0=A0 bool "libxdp"
+=A0=A0=A0=A0=A0=A0 depends on BR2_PACKAGE_HOST_GCC_BPF_AT_LEAST_15 || BR2_=
PACKAGE_LLVM_BPF
+=A0=A0=A0=A0=A0=A0 help
+=A0=A0=A0=A0=A0=A0=A0=A0 The libxdp library itself
+if !BR2_PACKAGE_HOST_GCC_BPF_AT_LEAST_15 && !BR2_PACKAGE_LLVM_BPF
+comment "libxdp requires host-gcc version 15 or above, or LLVM with BPF su=
pport"
+endif
+
+if !BR2_PACKAGE_LLVM_BPF
+comment "Only libxdp is supported with GCC BPF"
+endif
+
+if BR2_PACKAGE_LLVM_BPF
+config BR2_PACKAGE_XDP_TOOLS_XDP_BENCH
+=A0=A0=A0=A0=A0=A0 bool "xdp-bench"
+=A0=A0=A0=A0=A0=A0 help
+=A0=A0=A0=A0=A0=A0=A0=A0 An XDP benchmarking tool
+
+config BR2_PACKAGE_XDP_TOOLS_XDP_DUMP
+=A0=A0=A0=A0=A0=A0 bool "xdp-dump"
+=A0=A0=A0=A0=A0=A0 select BR2_PACKAGE_LIBPCAP
+=A0=A0=A0=A0=A0=A0 help
+=A0=A0=A0=A0=A0=A0=A0=A0 A tcpdump-like tool for capturing packets at the =
XDP layer
+
+config BR2_PACKAGE_XDP_TOOLS_XDP_FILTER
+=A0=A0=A0=A0=A0=A0 bool "xdp-filter"
+=A0=A0=A0=A0=A0=A0 help
+=A0=A0=A0=A0=A0=A0=A0=A0 A simple packet filtering utility powered by XDP
+
+# config BR2_PACKAGE_XDP_TOOLS_XDP_FORWARD
+#=A0=A0=A0=A0=A0=A0 bool "xdp-forward"
+#=A0=A0=A0=A0=A0=A0 help
+#=A0=A0=A0=A0=A0=A0=A0=A0 An XDP forwarding plane
+comment "xdp-forward is not yet supported"
+
+config BR2_PACKAGE_XDP_TOOLS_XDP_LOADER
+=A0=A0=A0=A0=A0=A0 bool "xdp-loader"
+=A0=A0=A0=A0=A0=A0 help
+=A0=A0=A0=A0=A0=A0=A0=A0 A command-line utility for loading XDP programs u=
sing libxdp
+
+# config BR2_PACKAGE_XDP_TOOLS_XDP_MONITOR
+#=A0=A0=A0=A0=A0=A0 bool "xdp-monitor"
+#=A0=A0=A0=A0=A0=A0 help
+#=A0=A0=A0=A0=A0=A0=A0=A0 A simple XDP tracepoint monitoring tool
+comment "xdp-monitor is not yet supported"
+
+config BR2_PACKAGE_XDP_TOOLS_XDP_TRAFFICGEN
+=A0=A0=A0=A0=A0=A0 bool "xdp-trafficgen"
+=A0=A0=A0=A0=A0=A0 help
+=A0=A0=A0=A0=A0=A0=A0=A0 An XDP-based packet generator
+endif
+endif
diff --git a/package/xdp-tools/xdp-tools.hash b/package/xdp-tools/xdp-tools=
.hash
new file mode 100644
index 0000000000..39c5c47dd3
--- /dev/null
+++ b/package/xdp-tools/xdp-tools.hash
@@ -0,0 +1,5 @@
+# Hashes from: https://github.com/xdp-project/xdp-tools/releases
+sha256=A0 9f6eb9f2275c2431f59a80a99549b27c66832a751dd03c5993c6bc3f5c724b25=
=A0 xdp-tools-1.5.8.tar.gz
+
+# Locally computed:
+sha256=A0 734d0b7377af175d51c5ae07c061037862eb8d0d5a335544cfef9861c1895a2a=
=A0 LICENSE
diff --git a/package/xdp-tools/xdp-tools.mk b/package/xdp-tools/xdp-tools.mk
new file mode 100644
index 0000000000..61bd7f6602
--- /dev/null
+++ b/package/xdp-tools/xdp-tools.mk
@@ -0,0 +1,110 @@
+##########################################################################=
######
+#
+# xdp-tools
+#
+##########################################################################=
######
+
+XDP_TOOLS_VERSION =3D 1.5.8
+XDP_TOOLS_SITE =3D https://github.com/xdp-project/xdp-tools/releases/downl=
oad/v$(XDP_TOOLS_VERSION)
+XDP_TOOLS_LICENSE =3D GPL-2.0, LGPL-2.1, BSD-2-Clause
+XDP_TOOLS_LICENSE_FILES =3D LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
+XDP_TOOLS_DEPENDENCIES +=3D host-gcc-bpf libbpf
+XDP_TOOLS_INSTALL_STAGING =3D YES
+XDP_TOOLS_BIN_ARCH_EXCLUDE =3D /usr/lib/bpf
+
+XDP_TOOLS_BPF_CFLAGS =3D "--sysroot=3D$(STAGING_DIR)"
+# We need to pass the sysroot, *and* we pass our own header location before
+# xdp-tools uses its own bundled location "headers/".
+XDP_TOOLS_BPF_CFLAGS +=3D "-I$(STAGING_DIR)/usr/include"
+
+ifeq ($(BR2_PACKAGE_LLVM_BPF),y)
+=A0 XDP_TOOLS_DEPENDENCIES =3D llvm
+=A0 XDP_TOOLS_CONF_ENV =3D BPF_COMPILER=3Dclang
+else
+=A0 # "#pragma clang attribute" are not supported by GCC and require adapt=
ation in
+=A0 # xdp-tools
+=A0 XDP_TOOLS_BPF_CFLAGS +=3D "-DBPF_NO_PRESERVE_ACCESS_INDEX"
+=A0 XDP_TOOLS_CONF_ENV =3D BPF_COMPILER=3D$(BPF_TARGET_NAME)-gcc
+endif
+
+XDP_TOOLS_CONF_ENV +=3D BPF_CFLAGS=3D"$(XDP_TOOLS_BPF_CFLAGS)"
+
+# We do not want to build the man pages, which is controlled by Emacs
+# availability
+XDP_TOOLS_CONF_ENV +=3D EMACS=3Dinvalid
+
+# Many options are not handled by the custom (not autotools) configure, so=
 we
+# pass them at build/install time
+XDP_TOOLS_MAKE_ENV +=3D BPF_OBJECT_PATH=3D"$(STAGING_DIR)/usr/lib/bpf"
+XDP_TOOLS_MAKE_ENV +=3D HEADER_DIR=3D"$(STAGING_DIR)/usr/include"
+XDP_TOOLS_MAKE_ENV +=3D LIBBPF_LDLIBS=3D"$(STAGING_DIR)/usr/lib"
+XDP_TOOLS_MAKE_ENV +=3D LIBBPF_DIR=3D"$(STAGING_DIR)/usr/lib"
+XDP_TOOLS_MAKE_ENV +=3D PREFIX=3D"/usr"
+XDP_TOOLS_MAKE_ENV +=3D CPPFLAGS=3D"--sysroot=3D$(STAGING_DIR)"
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_LIBXDP),y)
+=A0 XDP_TOOLS_TARGETS +=3D libxdp
+endif # BR2_PACKAGE_XDP_TOOLS_LIBXDP=3Dy
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_BENCH),y)
+=A0 XDP_TOOLS_TARGETS +=3D xdp-bench
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_BENCH=3Dy
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_DUMP),y)
+=A0 XDP_TOOLS_TARGETS +=3D xdp-dump
+=A0 XDP_TOOLS_DEPENDENCIES +=3D libpcap
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_DUMP=3Dy
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_FILTER),y)
+=A0 XDP_TOOLS_TARGETS +=3D xdp-filter
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_FILTER=3Dy
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_FORWARD),y)
+=A0 XDP_TOOLS_TARGETS +=3D xdp-forward
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_FORWARD=3Dy
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_LOADER),y)
+=A0 XDP_TOOLS_TARGETS +=3D xdp-loader
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_LOADER=3Dy
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_MONITOR),y)
+=A0 XDP_TOOLS_TARGETS +=3D xdp-monitor
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_MONITOR=3Dy
+
+ifeq ($(BR2_PACKAGE_XDP_TOOLS_XDP_TRAFFICGEN),y)
+=A0 XDP_TOOLS_TARGETS +=3D xdp-trafficgen
+endif # BR2_PACKAGE_XDP_TOOLS_XDP_TRAFFICGEN=3Dy
+
+# xdp-tools uses clang, which does not receive the sysroot, so we pass it =
in
+# BPF_CFLAGS
+ifneq ($(XDP_TOOLS_TARGETS),)
+define XDP_TOOLS_BUILD_CMDS
+=A0=A0=A0=A0=A0=A0 $(TARGET_MAKE_ENV) $(XDP_TOOLS_MAKE_ENV) \
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(MAKE) $(XDP_TOOLS_MAKE_OPTS) \
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --directory $(@D) \
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(XDP_TOOLS_TARGETS)
+endef
+
+define XDP_TOOLS_INSTALL_STAGING_CMDS
+=A0=A0=A0=A0=A0=A0 $(TARGET_MAKE_ENV) $(XDP_TOOLS_MAKE_ENV) \
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(MAKE) $(XDP_TOOLS_MAKE_OPTS) \
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --directory $(@D) \
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DESTDIR=3D$(STAGING_DIR) \
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(if $(findstring libxdp,$(XDP_=
TOOLS_TARGETS)),libxdp_install) \
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(if $(filter-out libxdp,$(XDP_=
TOOLS_TARGETS)),install)
+endef
+
+# As opposed to the man pages, there is no way to avoid installing the tes=
ts on
+# the target, so we need to remove the whole usr/share/xdp-tools.
+define XDP_TOOLS_INSTALL_TARGET_CMDS
+=A0=A0=A0=A0=A0=A0 $(TARGET_MAKE_ENV) $(XDP_TOOLS_MAKE_ENV) \
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(MAKE) $(XDP_TOOLS_MAKE_OPTS) \
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --directory $(@D) \
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 DESTDIR=3D$(TARGET_DIR) MAN_FIL=
ES=3D \
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(if $(findstring libxdp,$(XDP_=
TOOLS_TARGETS)),libxdp_install) \
+=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 $(if $(filter-out libxdp,$(XDP_=
TOOLS_TARGETS)),install)
+=A0=A0=A0=A0=A0=A0 $(RM) -rf $(TARGET_DIR)/usr/share/xdp-tools
+endef
+endif # XDP_TOOLS_TARGETS !=3D ""
+
+$(eval $(autotools-package))
--
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
