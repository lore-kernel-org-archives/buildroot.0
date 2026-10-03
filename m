Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 811FBCA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 11:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2987640F11;
	Sat,  3 Oct 2026 11:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKCMdKuQE3iY; Sat,  3 Oct 2026 11:02:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0EDE840F19
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791025359;
	b=bVGGw9Fq0qsgV/sX/viw6GNXZIFhCgetuZVElBvZHCztuJbT+vWraaPeJ13tQ3Z2E5NN
	 toXLgNt14Jx3hEuf7qGztNUKLySxG6Wbs6X2hIzwf5MvURBoN//AR6wu4u896UDbDPotU
	 OlH2G21oBUbyeGGzBamitaJ0QPDrgBTRPS1G+cyBguFErIfn97dcOTz0/C1d/94toCtuL
	 vhfmJ4S7wLNSWbhzm5TAjzaNgPHHYfzifyOB+0c1zMMrDXRuef6n20MVjTy4cATBO0a12
	 brSfylZ3nJX/0xNZUUz0Zw75IRb+UG1673YEWBdCOdT88JwaowyxxX8fPy1LOCUCGJQ==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791025359;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:CC:Thread-Topic:Thread-Index:
	 Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=py/FX3uWubSaC2Ko43Bcc+R4yAuH2SBey4zUSmeFKvg=;
	b=YGczhh0Cx2FABslZVjcE/FT4caBIbbyYsTsTPhbBaAQraRlY4BhYrK3TJNFkFOKKdpWv
	 XXnKwAWoLypZkteCup5y7EtSNLCh6HhPDM71pFPrAYHyrGdOo6vvEqGlPOBh9uVztg9Zh
	 P3COJQLV3DKct526hbJ82humS2Rc1HObL7CJoZaNrYAlqqVmv5d+WA4lKzKIPulijMmAB
	 1wDyk0So9weRoiV8pTi9cXvLMLA1OOr6BS/7sPMoUdAZ/ybnndxq80+83teQz9N1V1krv
	 JxanHxfNwtzOromaos9WBESsuoTckOb3aM/+VJW/B27/o9omQtmixEvYoPBYcc1UFAQ==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791025359;
	bh=py/FX3uWubSaC2Ko43Bcc+R4yAuH2SBey4zUSmeFKvg=;
	h=From:To:CC:Date:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HPYIh/xV+F+ZmNXsPGTir/VLzaMhZvp77OP0/fkMElkSHdUMA/++hoNj4JSji4bDE
	 K6tm5yy8JhwpIZCSXEXtFqoGeMI0uRzYbyc7MZ50+6t4OLQ+uiW45+8KhCdcLCWSiO
	 CGEryAoL0ml1klUF79Xzo2NfJxW0ZSt+LpK9VxtVU1IT9fQV909nHb+VJqNcEEd0CZ
	 HfzYX75nLH/50b4ludJ0FFf3Z4/NRvDp9hPmuq9anwLTFzjVfO45K9NHN0ULX9HApR
	 6W1u70u2RNxILaRfM+yCE2Xd+cyluSLa9Q/l4mTRbjaPZIP/AvhW5OnSkl8+D6+sOq
	 ZPnHfL8OiOoKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EDE840F19;
	Sat,  3 Oct 2026 11:02:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 22F0B263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2047A60642
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:02:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MX08G99SxhVa for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 11:02:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8A97660621
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2001:489a:2202:c::607"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1791025344;
 b=e4tSPAXjSed6UW4wvusHX5TUFtGU6c1qqvfFI+tQAdjUK1dmnoZyRvhTrDoO+/gGXBSN
 iO6Brj7rlsK5BCjUBrAZECrFUdAQ9C2QKDejwVJYX8jCFGBdMxT3N9lDc+VJhiTmk1qKF
 eddS7RfNBOuISV7KVVRq3bJrCkkMEG31pFZPkRxN5AHc08b/4X3LKsL37YlXHWxhVgapx
 8GYxYFV656VS7LeJUcl4O5STbDY4Le8H0GFGN5Z9tQcnXlfJGoDigdW2X6UqKq31XYxKS
 AEUWEVB1MKowPIZTItRyIujgxTh34+/Z1a6V7QmXPFJ5UDiNr7BrdmyTQtaxpgNy/nA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791025344;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:CC:Subject:
 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
 x-ms-publictraffictype:x-ms-traffictypediagnostic:
 x-ms-office365-filtering-correlation-id:
 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
 x-microsoft-antispam:x-microsoft-antispam-message-info:
 x-forefront-antispam-report:
 x-ms-exchange-antispam-messagedata-chunkcount:
 x-ms-exchange-antispam-messagedata-0:Content-Type:
 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-originalarrivaltime:
 X-MS-Exchange-CrossTenant-fromentityheader:
 X-MS-Exchange-CrossTenant-id:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
 bh=YsUwruULg/7ImjL/MxYbwwJ9zn7nlYM3AxoIVKyTRe0=;
 b=PZsbHYwbwytiBEh/HpomJgjg2DG/uj8eErrGlK9ZrWQiM9q45mU4M6FJxPVvR5mucpy+
 EBtS8wmXRXmkgXtKWg2UF0FcGzoDpQ0Z5eHI/ebXoseFGehgTcVEktCiKX8dm/fIaYTK+
 kzDcTfBsxu8s4dPAqLDE8jAC3jfV9NFhtHAktmfjjjyDuvdAsLRENpG9m9ObsMnpjxGRW
 UVgKnhnQHO78L3DjWHnBUbTx4NrbmxoRvkzNkKWkYyEHnH5fPku0Rzk5BW2PYlz6LS7qs
 Ukg0pO07hc5C8J6iK6jiXAFK1yEFwMeEEHtxKQ5qA22VY3JjZPy8W/oDe5XVONBP9IQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org;
 dmarc=pass header.from=xes-inc.com; 
 dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=zx9hmcSM; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:489a:2202:c::607"
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:c::607;
 helo=usg02-bn3-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=zx9hmcSM
Received: from USG02-BN3-obe.outbound.protection.office365.us
 (mail-bn3usg02on0607.outbound.protection.office365.us
 [IPv6:2001:489a:2202:c::607])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A97660621
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 11:02:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=aIMQwVVz9itaf3svEqZqnG7SDc7GEzSjcIfXENQTKIi/bzK+uTz79/CRo9UqGRxzZxe2WTIy5g6Au/60yI+tExXT5EMlW4OT3BN6MSmdde8wvS6o3+TUhSySWsfCSAceJVIFv1O+I1beLw0FSfT4BWBzJyt4XV0VnSasdqSifWUskpsaj9ocgVZ9/DPV93s695xjXRHj9xawr29M6ea6PCKT5gLD4Xls/mM49hdzF7r9WJ38ZVyBoTlAxBomA1pcCuloaqvhDif2l4kUuUemZcKftsCTG6rEeiJu7ufLpj/zyCY//P2VJwMGcLiDsjMIG6+FS0c7KRdby02rJQafAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsUwruULg/7ImjL/MxYbwwJ9zn7nlYM3AxoIVKyTRe0=;
 b=WdLQAp56TkzP8um++yyBJawhnr1JxTA2yb62+0wXaJs46WaQucRrlXzD4LKYTqEQowNwhXVjGMFz6pP0CxryVLS8J9dO0R3AfIHHBxP7wUThBAZdwKtnhuKKXTi/uUBSSxbPqrem8y0EHU4Jhts/vJ+DYT6QNu5nCjskQE0vKfoU5d00IDpEw+0zERvWzhiyQRCBBCGJkDR8aePU23G/4UtKCbuHogbURl9Y7N/olwhR3MeXrvkomqhyrjUmKsAHqdPnMD3b9Af3FPj2W2A3cz0OrJTAdLnV6k2ztEmY2fQKmoEQgodHGyNK71ojEsfZ08NxXvZXqo47uIxaE3OeNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsUwruULg/7ImjL/MxYbwwJ9zn7nlYM3AxoIVKyTRe0=;
 b=zx9hmcSMuKo1f58hMlSmEE/HfWyqSF1/jbtKXr1ZTPWhcs/bSuhjxpmw09KovQ4dJLIlDz+eZupDxD0s9B2lSYmaBwzlzLQaDeIMgpuuhcLWqYTBNfYUKjq7ZrPyVgbhiVIIorZ4Od5phkpn3v6sK6W9UfhuXlLT0yUQ73Z2t2FlimekcU6e7YSLEdR8ZOKpe9wPXiYnmOh1D8A8n5tdz7UL8eGfQRvBWlFK0tYGG8dq0lpEuUmLGUvGdF6BmirAfm2r1Zb4gENiNtBYFCOn3MsLa2CExs8usw20V3eMxxYJcJkmzh/y/6Tu48+Vj6bRPZpmss4qQ/LHmT7T+HuoyA==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN2P110MB1336.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.30; Sat, 3 Oct
 2026 11:02:18 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.21.0451.027; Sat, 3 Oct 2026
 11:02:17 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bernd Kuhls <bernd@kuhls.net>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
CC: =?utf-8?B?RmzDoXZpbyBUYXBhasOzcw==?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Thread-Topic: [Buildroot] [PATCH 085/114] package/python-sqlalchemy: bump
 version to 2.1.1
Thread-Index: AQHdUyanKW7wzGZLJUyyjhzNlEN2Vg==
Date: Sat, 3 Oct 2026 11:02:17 +0000
Message-ID: <PH1P110MB160389B6AC79B213507DF0A89F88A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20261003070128.1295458-1-bernd@kuhls.net>
 <20261003070128.1295458-85-bernd@kuhls.net>
In-Reply-To: <20261003070128.1295458-85-bernd@kuhls.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN2P110MB1336:EE_
x-ms-office365-filtering-correlation-id: 78cced77-3666-4b55-e681-08df213dc9f1
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|41320700013|366016|23010399003|1800799024|56012099006|10067099003|4143699003|18002099003|55112099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 2ls3DmpmAVzgtHcZJzemdYisAWubwmZ3aqTOsUP+wZv74YDU8E8/VCr/WZUeyIo+aoONM3qF68ZX0ccTyndOFTOOM2+wV0zOA20ip47UW52RZrfiOcPf7TDINqUzouNd4am16Qt4KX3UqgVCboay0SKMh8ormqUOGGrR/WymLabE4mL03ISUU/830JpylHKO3SYMl56BPdeqFGCxk7r1QDCBvJ/FOK5+qHkgmkLAQX33SIrdRKk84C1lnE+xRm2k2Po9L+9rralA2qKYiY/wAWKjf0OQgoxawFkYQdsflk0EX3QV9fgIB7du8pvVFwxOiLCTw2hzccxYFGJe/xZjuUo37aAzHmsr7A+iFgzjXb7g6YsT6Z1YAwRwgXQTrTfN292rWQCkaA67CFAQ/W2xY3+2f5au9THhdKWj8Otl6rabq5KysUUIdzs8A4emJzXL8jc+TpVaE0EJ6IGdQhDKUvqsMFTyLOGuSisJNYDZjT2/hOKQb2Z0tbe3RAmuD1zkrbiZFbkH2GCyMcXEuEPQwyIKWP6bn9P3HK8V5tXWbs1jatysPZ+i8LQ9YMuFWXDSm7z2KnElvFSdMRs/iT/kqQjFzJ6WidAD6dhwrTCfmshAyp0ItAw6+4zrpFADoDQ7p7nMR9JHeG2KlbyhU5pdYA389xvAUqxeZT2x/XOExzI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(41320700013)(366016)(23010399003)(1800799024)(56012099006)(10067099003)(4143699003)(18002099003)(55112099003)(22082099003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QmtpbjVhQzZyeVpJd1FKYmQyZmhMS3lFY3BUMzg4bW5Yb1JMSlhOTC9KTzdH?=
 =?utf-8?B?UTFlZzJzb1NmOXplajFzNDlaRVFJSUhlMUdhaFVMd0J0ZGU4UEhEMWUyNmp3?=
 =?utf-8?B?YjRYUWQwcStzeXFLUVdtVUM4bUhMQ0dYbkZqdWZOejdoenlmWXIwVFpBY1FW?=
 =?utf-8?B?clJlN0pyQlpPZ3d1c0ljM096dnByMllxYnJEaVMzSzVpMDB4LzFhR21FWXBO?=
 =?utf-8?B?MDdEV1h3NENVdm5KM1U5RkJ3cUlEbktKb1hkNlVhUEJ0b1haUUd1TktjUkt5?=
 =?utf-8?B?V1gweWhQa2VwWWxRaTBNa3liQWNVUThMWm5tMkdVa0Vac3B2V1U5UGZaL2F3?=
 =?utf-8?B?V2FReTB3NW9uYzFNckZNejNQSmoxNFFRVm16VFlIV2RPMFRaQWUwcnd5aGtW?=
 =?utf-8?B?RWJOUnFDSHpGdSt4RkQvemhtYjlCWnNGSm9ZbE9aOUJwNm5sb0xBSzRVVC9E?=
 =?utf-8?B?Y3JZUmdYSVRmcFhrR2dnbitWeTFZeThRb1VKME02bDRHcXB5YXNiQ1o1eWZp?=
 =?utf-8?B?UXdsdzFvWkswNWpRSG9PTE9GVzdCTlhtc25oWnlOQm0wR2ZiN3ZJUnB1eVVy?=
 =?utf-8?B?WjdIWDd6NDZsNDVuTHFWSnlWdk13amtxZU9wL3UyWGM2RGxNOWNUWVhiUnBW?=
 =?utf-8?B?L3ZhcmxGbnBHVUFCaVg1QVFLNmdidlI4S3NWNmF3amxMT2tLWDVFU1ZFN1E0?=
 =?utf-8?B?MEhBZVNhL0cwYlBNRnlsbnNybnlreis3RmhoK25KUFp6YmJHTjY1R2o4TjZr?=
 =?utf-8?B?QXA1NWZoR21rR09PSU9Hc2kzTThBeUhTL0FGYUhvK3ZGZlpmQjdwVTJRUW9S?=
 =?utf-8?B?M2VHckdaU29ZNStkVkVTSGxGTENRU3h4ZVRXclVLVlFBMTFyTy9MK0t4Mk52?=
 =?utf-8?B?RWFYNmh3UXVjMlF2SXRXdktoR0R0N1o0cGo1UDlDUGdCZndhTS96bUFVTTVh?=
 =?utf-8?B?cmlpa3BISFFRaXJMdDJMSGZvMEVRRGJpL3FiWEl2b09sNHFTMmhFTUN0NzZB?=
 =?utf-8?B?aGlKdlhha2Y3Q3NJTm5WaEE0bFBzaDh4TytVN05mTHkxK1NXeERPSmZRc0Jj?=
 =?utf-8?B?S3c2Zis5anNydGM4L0dXbFNKZ1k4bmNXTzVEeWNaZHFON3duY3J0TUk2c1dR?=
 =?utf-8?B?b3ZlczBSTU5WbEVVYjgrRlU2M0RkKzcwb1pqOE0xcjFSbTQ4bEZ1WkNMS2FW?=
 =?utf-8?B?VDUxR2F5QWdERE1NTjMzWmxnSDZOaGRZaWRxZ2pzejVWL2FYcUgvTm5zNURS?=
 =?utf-8?B?MXFCUzdXZk9DaGJUTjdQUDJ2Wnpmblo5ZzFHeU5TQlVKWHlWQmk1ZDdBa0NK?=
 =?utf-8?B?MXg1a1VNMVk0UXBlSXVpMC8waXFzanJTb2pTMXYzUnVFankybFlDcjNVL0NG?=
 =?utf-8?B?NElLaGplRGplY2hrL05zWnVhZk9mRDhnQXEwVWJXdjk1YmxZYnY2a0FMa0JG?=
 =?utf-8?B?MStJVHBLNEJOaUt4NzRJbUVoVEVUbW9pTnFON1NCK0ZzeFEyVThjL3daQ3dX?=
 =?utf-8?B?YVVyd3VwdmZYaVZsN1RVamY4dVBuYlNsRVQxcHZQMjcwTGwwdDdhQ2hvdnZu?=
 =?utf-8?B?UmR4enFkc2puNVE4V0FkdGtIQ1l0ZVlsZ2NrN1VFeHJpZ1RqOFZOWC9BVzhw?=
 =?utf-8?B?TC9UK2w2NldpZ0l5cGpQU1ZEZjcyNE1jRFc1bFBHZEFzdUtXdlhNRStjSmEy?=
 =?utf-8?B?M3BkTTU5TTZwSGhYQzVrUGs3bTl5eGs1d3REY0VrVVZjSFFOdlFqdkNTem0w?=
 =?utf-8?B?dkNQcnowSGZacnpFaXUxOFVNbEZkdzdwMkhqTktZZk9zSlp6WlVkNnN0MXNW?=
 =?utf-8?B?SmpuME1mb1FzeVE1czVjNEZFVnM0c1pnMnFibzZGZ1RaRWg1cEVVSEZIa3Nq?=
 =?utf-8?B?dy9nM3FPWElrVUhHbnhBc0pBWGwxSU9BYURSTmJGanA4Nkh5ZEJCbkhwZVNY?=
 =?utf-8?B?QWlIS3pPdkZJdHdmcFQ0Z2FoeUFZdW4rdWcxVHVoMU5tSU1JejFscmlRY1NQ?=
 =?utf-8?B?TjNicDN2SGpOZk51cytjUUxHL3p6L3ZGZVZaNDV1blFvRG43eDZuQi9pMHk3?=
 =?utf-8?B?ZmRsVTlLQ3p6c0xlVEdIaUZFdmxFcmFRalQzY0h5N0tUMjdtY0tnMDBscVN5?=
 =?utf-8?B?dTVLQXY0eS84NC9CYkxBbnBBM3VWTWhTZmpqeWZBb21LNVZMcjdSUzloK0VJ?=
 =?utf-8?Q?QxHXpGnLyORNa1JO/eR3Uwp2zGPi9aqcKNanyGchBxz0?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 78cced77-3666-4b55-e681-08df213dc9f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2026 11:02:17.4057 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1336
Subject: Re: [Buildroot] [PATCH 085/114] package/python-sqlalchemy: bump
 version to 2.1.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QmVybmQNCg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGJ1aWxkcm9v
dCA8YnVpbGRyb290LWJvdW5jZXNAYnVpbGRyb290Lm9yZz4gT24gQmVoYWxmIE9mIEJlcm5kDQo+
IEt1aGxzDQo+IFNlbnQ6IFNhdHVyZGF5LCBPY3RvYmVyIDMsIDIwMjYgMjowMSBBTQ0KPiBUbzog
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcNCj4gQ2M6IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50
YXBham9zQG5ld3Rlc2MuY29tLmJyPjsgSmFtZXMgSGlsbGlhcmQNCj4gPGphbWVzLmhpbGxpYXJk
MUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFtFeHRlcm5hbF0gLSBbQnVpbGRyb290XSBbUEFUQ0gg
MDg1LzExNF0gcGFja2FnZS9weXRob24tDQo+IHNxbGFsY2hlbXk6IGJ1bXAgdmVyc2lvbiB0byAy
LjEuMQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4N
Cj4gQ2M6IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29tLmJyPg0K
PiBDYzogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+DQo+IENjOiBZ
ZWdvciBZZWZyZW1vdiA8eWVnb3JzbGlzdHNAZ29vZ2xlbWFpbC5jb20+DQo+IC0tLQ0KPiAgcGFj
a2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoIHwgNCArKy0tDQo+
ICBwYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rICAgfCA0ICsr
LS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFs
Y2hlbXkuaGFzaA0KPiBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hlbXkvcHl0aG9uLXNxbGFsY2hl
bXkuaGFzaA0KPiBpbmRleCA4NWVmNzNkMThjLi5mM2E1NTk2MmYxIDEwMDY0NA0KPiAtLS0gYS9w
YWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lmhhc2gNCj4gKysrIGIv
cGFja2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5oYXNoDQo+IEBAIC0x
LDUgKzEsNSBAQA0KPiAgIyBtZDUsIHNoYTI1NiBmcm9tIGh0dHBzOi8vcHlwaS5vcmcvcHlwaS9z
cWxhbGNoZW15L2pzb24NCj4gLW1kNSAgZTdlOTQxYTE0ZmZlNzhkNjZiZjIzY2RhYWNjZGVlN2Qg
IHNxbGFsY2hlbXktMi4wLjQ5LnRhci5neg0KPiAtc2hhMjU2DQo+IGQxNTk1MGE1N2EyMTBlMzZk
ZDRjZWMxYWFjMjI3ODdlMmE0ZDU3YmE5MzE4MjMzZTJlZjhiMmRhZjlmZjJkDQo+IDVmICBzcWxh
bGNoZW15LTIuMC40OS50YXIuZ3oNCj4gK21kNSAgZDAyYmM4NzYzNjhjMTBlNzNmZWIwMGY4Mjgw
MzA5M2EgIHNxbGFsY2hlbXktMi4xLjEudGFyLmd6DQo+ICtzaGEyNTYNCj4gZmNmM2NiYjMzYmIy
M2JhZDc1ZDIxNTAxNTdjMjE4MDQ2MTg3NDU3MzFlOTkzMWFiMjdlNjE4NzlhOWY2MQ0KPiAyM2Ig
IHNxbGFsY2hlbXktMi4xLjEudGFyLmd6DQo+ICAjIExvY2FsbHkgY29tcHV0ZWQgc2hhMjU2IGNo
ZWNrc3Vtcw0KPiAgc2hhMjU2DQo+IGU4NjJiYjViOTA0ZmI1NTEzYzNlMTQyODhkN2EyNWExMmVi
MGVjYzc4NDdhMGE5NjVkMzEwZTlhOTU1ZTcNCj4gY2I5ICBMSUNFTlNFDQo+IGRpZmYgLS1naXQg
YS9wYWNrYWdlL3B5dGhvbi1zcWxhbGNoZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rDQo+IGIvcGFj
a2FnZS9weXRob24tc3FsYWxjaGVteS9weXRob24tc3FsYWxjaGVteS5taw0KPiBpbmRleCA0NmEx
ODBhNGQ0Li5mZGVhOWU0MzI1IDEwMDY0NA0KPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1zcWxhbGNo
ZW15L3B5dGhvbi1zcWxhbGNoZW15Lm1rDQo+ICsrKyBiL3BhY2thZ2UvcHl0aG9uLXNxbGFsY2hl
bXkvcHl0aG9uLXNxbGFsY2hlbXkubWsNCj4gQEAgLTQsOSArNCw5IEBADQo+ICAjDQo+IA0KPiAj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjDQo+ICMjIyMjIyMjIyMjIyMNCj4gDQo+IC1QWVRIT05fU1FMQUxDSEVNWV9WRVJT
SU9OID0gMi4wLjQ5DQo+ICtQWVRIT05fU1FMQUxDSEVNWV9WRVJTSU9OID0gMi4xLjENCg0KVGhl
IDIuMSBzZXJpZXMgaXMgcHJldHR5IG5ldyBzbyB3aXRoIGl0J3MgcmVjZW50IHB1Ymxpc2hpbmcg
dXNlcnMgYXJlIHN0YXJ0aW5nIHRvIGZpbmQgYnVncyBzaW5jZSBmZXcgcGVvcGxlIHRlc3Qgb24g
YmV0YSByZWxlYXNlcy4gDQoNCjIuMS4zIHdhcyByZWxlYXNlZCBhIGZldyBob3VycyBhZ28gWzBd
Lg0KDQpJdCBzaG91bGQgYmUgbm90ZWQgdGhhdCBzcWxhbGNoZW15IDIuMSBoYXMgdXBkYXRlZCB0
aGVpciBkZXBlbmRlbmNpZXMgdG8gbm8gbG9uZ2VyIHJlcXVpcmUgZ3JlZW5sZXQgYnkgZGVmYXVs
dC4gSXQgd2FzIG9ubHkgbmVjZXNzYXJ5IGZvciBhc3luYyBjb25uZWN0aW9ucyBzbyB0aGV5IG1v
dmVkIGl0IHRvIHRoZSBzcWxhbGNoZW15W2FzeW5jaW9dIGV4dHJhLiANCg0KSSBkb24ndCBzZWUg
YW55dGhpbmcgY2FsbGVkIG91dCBpbiBDb25maWcuaW4gb3IgZGVwZW5kZW5jaWVzIHNvIHRoaXMg
aXMganVzdCBhbiBGWUkgZm9yIHVzZXJzLg0KDQotVmluY2VudA0KDQpbMF06IGh0dHBzOi8vZ2l0
aHViLmNvbS9zcWxhbGNoZW15L3NxbGFsY2hlbXkvcmVsZWFzZXMvdGFnL3JlbF8yXzFfMw0KDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
