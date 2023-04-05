Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46413C7EE21
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 15:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A476C8207C;
	Wed,  5 Apr 2023 15:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A476C8207C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lm-nkwRGrg7G; Wed,  5 Apr 2023 15:06:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98E8082083;
	Wed,  5 Apr 2023 15:06:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98E8082083
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 627341BF4E7
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 15:06:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A10682083
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 15:06:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A10682083
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-B4KvVTcMkS for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 15:06:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C9BE8207C
Received: from cluster-h.mailcontrol.com (cluster-h.mailcontrol.com
 [208.87.234.190])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C9BE8207C
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 15:06:32 +0000 (UTC)
Received: (from mailcontrol@localhost)
 by rly09h.srv.mailcontrol.com (MailControl) with ESMTP id 335F6VS7068239
 for buildroot@buildroot.org; Wed, 5 Apr 2023 16:06:31 +0100
Received: from rly09h.srv.mailcontrol.com (localhost [127.0.0.1])
 by localhost (envelope-sender NDivecha@granitenet.com) (MIMEDefang) with ESMTP
 id 335F6Vjq068112 (TLS bits=256 verify=OK)
 for buildroot@buildroot.org; Wed, 05 Apr 2023 16:06:31 +0100 (BST)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly09h.srv.mailcontrol.com (MailControl) id 335F6Vhm068103
 for buildroot@buildroot.org; Wed, 5 Apr 2023 16:06:31 +0100
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by rly09h-eth0.srv.mailcontrol.com (envelope-sender NDivecha@granitenet.com)
 (MIMEDefang) with ESMTP id 335F6Ux6067951 (TLS bits=256 verify=OK)
 for buildroot@buildroot.org; Wed, 05 Apr 2023 16:06:31 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8YRCFzBIq+s2VuF+tD8CZVz2pZVNXFzu9HHNgAuIAZGbi0M6xwayXpoBNMn1HcnzLGJzY2CyMIseUULon6ledf3/oefH8deGnUYxg0jaVSBEuzQm/EN5qA0zrX/LqfuzwYKwVeoFU91nyJLdItWrjBjwpGEJH87wNsxNkXLb8nf2OvKkLOe9xU9XwW1nYwImnuu31bzqGtCx7KNGiSP4ImdGvhTW+TfhwhJSr1pVDdbuGIKtR6a+XMimqCXxQNfvCe9WyQbvtFZc7PaF05Slyf9MecKUlHXaER7skTujoEKVzehGx04DF/YO4kTtkXRXQIS3doe4980mkybLTEEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LfvXZ+YpWvCx6uJSntqMIDQcyer0mQ33T21qSwtLrCA=;
 b=jpscHfaDQ/9A3irxG8zsukQubS52aF8CAGU6qiO0x3CpRkpyrY9SSWep9qOV9EGXFOqRAwMIOdChD0WSl4oVlpajLe8cEqTpwknZXht42WdQjMEAkBApzhvskbMURptUxUHO06763GUObYRx/kNLS/D+ynF8nHrLunjUl9D+wZNsCyMInThS7jHebkr7vy2tBz2lxEwlD53w2AbOGzO67x/tod7akwt7kCZWgnxM8XtgUWBRIu5VLTQnrpPFVgFfL1iUK2O+ecVdm51lwE/RrFJSb7Sx10lIIXgV2Iw1/GRe5rMN3wSpTgjMbfn6GfIjtEp4NMBjQ7fAhDHdYY4T+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=granitenet.com; dmarc=pass action=none
 header.from=granitenet.com; dkim=pass header.d=granitenet.com; arc=none
Received: from BY5PR12MB5542.namprd12.prod.outlook.com (2603:10b6:a03:1db::15)
 by DS0PR12MB8501.namprd12.prod.outlook.com (2603:10b6:8:15d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Wed, 5 Apr
 2023 15:06:28 +0000
Received: from BY5PR12MB5542.namprd12.prod.outlook.com
 ([fe80::c694:a5f6:3240:192d]) by BY5PR12MB5542.namprd12.prod.outlook.com
 ([fe80::c694:a5f6:3240:192d%3]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 15:06:27 +0000
From: Nitesh Divecha <NDivecha@granitenet.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] - Python-awscrt/awsiotsdk Package
Thread-Index: AQHZZ9AywczQyTz3U02gr+2eWswDXQ==
Date: Wed, 5 Apr 2023 15:06:27 +0000
Message-ID: <BY5PR12MB5542A39031912B609E3F87DDB2909@BY5PR12MB5542.namprd12.prod.outlook.com>
References: <20230405053134.83F264014B@smtp2.osuosl.org>
In-Reply-To: <20230405053134.83F264014B@smtp2.osuosl.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB5542:EE_|DS0PR12MB8501:EE_
x-ms-office365-filtering-correlation-id: 71e16395-cdfc-4037-3413-08db35e75489
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3+/MGxlfWIPN7t96kQrYh4WD1NQEjFvExyvjqiFC/+smLL9HfWDUBxIr3ZTrA2Opf9xiAZF8r9Tat+KDZxOTQXjIdl8fjB1fz2k3224PhCDDbbxGB3fH/iEwwOszHGNDhCakB8Y0rjTLBWOnj3d7Sy7/qvURRSaxlbKqAhYkjos5e6Vop4WYc6GnxApC9ZCZlF2FeXDuYbMcKOiKvjpeFrnpbdVD6WAb/qUlfEmXX4Ru5EfalBcSJFYzsDrFExYpsPXaTlyr5UhjE4iVNklGjybXbxpHLOqltRYyMAPkWFtqPyWo5BtV3MRPTIH1NbYbSq9NkernzWmSDmSAxsEP7eCCaogGWutinKcTNXLi99dUMfsmr4FPY061Goap5cn+uQhdMB3dtOKl01PKe/B/DGraD4dq94iU217ljcgXyQh6WkAJi81p3XAEhLcEWkeE34XGBNwuap8QyWdPp9AWOeiI6yAcOKo8ZwvHWebFxjCA7y74oh4thZjF6W1Ncj7AZ6Ilt15oNrH4CU8AX2gxmy779qCGd/KR/SfRiVQBXoTXGVKfGVXxfLZ26oPF/Hqoj8caAfLXpA0H2fuA8nnE5vI5tDh+V8wfl3qoRP4DcpA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB5542.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(451199021)(55016003)(26005)(41300700001)(83380400001)(6506007)(66446008)(66946007)(6916009)(316002)(478600001)(64756008)(7696005)(8676002)(71200400001)(52536014)(76116006)(38100700002)(66556008)(33656002)(122000001)(166002)(66476007)(91956017)(38070700005)(9326002)(2906002)(86362001)(9686003)(5660300002)(8936002)(186003)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?4t2Oa71QuhcEBTXOCBNtyLKSeyRgxUbiKm6uS24NLJZzewMm0SkKi37S?=
 =?Windows-1252?Q?oR5SOKWZBdddDxd5w7Lq/HBXihlSH4YQP6Fy5fVUvVweufeD5xAPnxDl?=
 =?Windows-1252?Q?p/ladMJvoIBP/IyvnwLs7uoMIHHd/KA48ZSfbroZvouiaAbhYb0GnTLm?=
 =?Windows-1252?Q?YVKcehgYzGPckWRlMnMsu7dCTqRIph7S+jB7G5hJmre6HYMAGKsX9bzr?=
 =?Windows-1252?Q?TNTBiRsIpEoLzxiAfFTxhaAKVREsCS1q5XqxE7G3Rt3lfHMb8Xa8SCsr?=
 =?Windows-1252?Q?4Oq/IY1dmcSlCBnxIz9nXTjDMMvEGuiVFZ7DJaAog88+2S4o/kDAoNTS?=
 =?Windows-1252?Q?3ohYQzkuzwSmKpunG9KQDLnIE4z1jZIfm7zEzzYvc6sDvIh6p0mFeBYI?=
 =?Windows-1252?Q?qLpDe163NVSlDCnbi04VfRi8nFv8CZGs/arhBZnBC22t+aEUP7ucXwNY?=
 =?Windows-1252?Q?WQIZkWXkIeEUBxi+J4E50D1o+6+OT6ApruV6qDZpAtITYmEpHhVmtmuk?=
 =?Windows-1252?Q?vnlRKT1Y7c4Qede9eccDzdgp5+cz/8UWz7s28nMlCGr5ugccn8pdeiOj?=
 =?Windows-1252?Q?qMRqTMK7dyqZZISrjXr1d6NoUdXacArJubHwuGUfDQX3LtQGQxb9zLNq?=
 =?Windows-1252?Q?fTK3puM20ze+GHToNXtCQhOE7DweG/1Qy6mSBPZRp0oBzhpvJNcnlTnB?=
 =?Windows-1252?Q?ruwb0/8jY+yr0bacxbDd5yyiD531GoVt2yIGEmlOgRc3YY8yDP50lQoQ?=
 =?Windows-1252?Q?WUb/UcbeINGFhipHc5m1kfzU7Lr0Bushy2U0TUDX7oYQptkTUA3/tspO?=
 =?Windows-1252?Q?m0H4o7NL559PImpVdmJT/2c/5uPrQdSQnsOaqB2exwllITOz9y6zp3/h?=
 =?Windows-1252?Q?qqzII/etUY1D4MjjDDKBeJgPEn2hauWXETO9qy0f7Q0CBg8u6mdBXd3h?=
 =?Windows-1252?Q?aNDXsNX1PoDQebtiN4maZzaf9soA58Vyn0uEMwsxBf1V/2SsoZ008Sg1?=
 =?Windows-1252?Q?jlyt9ret0t3LmMYUZ+cLluYI4ur1sHLlLObpo3g1HtEvgK8V79IYYkT9?=
 =?Windows-1252?Q?8HmnF3Ha0w4P1pCZ2SnhMo5ey7STRa9z/nTdtTXngy1RYQwVQeCSBACJ?=
 =?Windows-1252?Q?UdcT3ZCLJPdkvNxNWw5jOOr4w5EIJczvakskf1CBW8/N5evfwqfm6UQD?=
 =?Windows-1252?Q?ZG89gh982YRfoPmye6qZTV/Ujh7mzCf3/bzWroR7V/BeE3xlVakWz91N?=
 =?Windows-1252?Q?TDmy3yidIp5LcuCKwZRcKr/tjpY7GmxWcsnWPql8G6jkkHhQUpMMOVCd?=
 =?Windows-1252?Q?V5ALEkUF3vr2CZGU7OQWimf9DuublG1B81Wzke6YCxqsIjts70JMf9hk?=
 =?Windows-1252?Q?Z7ngHawt394hbLzjn0TvrMgbjqtHy8867oedncceTAXViniVoQ1rE6jQ?=
 =?Windows-1252?Q?VfVhZL11YFXItZiEeQsG3As4HwRGXorPIDuHCoTUmLYI2KYL83/Zli2r?=
 =?Windows-1252?Q?zyZjaOD9lNqENBXrPwvtVxM1NxpVK5qBaaTS+I3Nbl5YBTevnHLNCwsk?=
 =?Windows-1252?Q?tnYA90jiNF+MvP7JNSYRl4tpO02sfKept/d3s6e7RoxhPNrgK3al7UN5?=
 =?Windows-1252?Q?9lvccGJg/5xuK0r/3TRv8aUnkSwnhSaRU3aq0l3F2R/yQB4q6FOKubuM?=
 =?Windows-1252?Q?KgTXr941kdBqBVVebDoyGeJaioDYsyY+StTJ24JTUsbBT9ooadGSgA?=
 =?Windows-1252?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: granitenet.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB5542.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71e16395-cdfc-4037-3413-08db35e75489
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2023 15:06:27.4724 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8dea12a7-9a1f-434b-8a56-8dd7fde58c4a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FfGC3XSPUthm77dD++6D8BsMn3eyXd+iYHbCRyrbh2vJd8HkWThhk8smLJ1pYEPF819QbpStKz2CKSsAbQie0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8501
X-MailControl-OutInfo: MTY4MDcwNzE5MTpGUEtleTEucHJpdjoI7PMW0tHixZlh/FIr7nWYtsw4qGlgZZ+TBPaogoSOBrvQimdmJyf5ngQHEg3PSziU8+A780bNLZgO0j6X732ZnpIGG/9YjTB2yQuunrqtBmXBJCT6q1CCS14DsWzHek26LZ5u/c0eTnQGd8pHzLGcvobLap8Uwg3DaTsidwG3F4eKmWkCOjCiXiECflPjR9HMW8gnA8hoPeF+ipBU6Va2zkvtRGejX8UWLRDj1tIYCYhIAdAa1TAlscXsoO//80VMFLrsHwd1vtwboI7PDx4KR6caRq7drSJXqG448R0hRp8s84K1WDDEneGh1tYRB79svWyCGVh7WdG/d2dBoxes
X-Scanned-By: MailControl 44278.2134 (www.mailcontrol.com) on 104.47.59.174
X-Mailcontrol-Refers-To: 335F6Vjq068112
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed;
 d=granitenet.com;
 h=from:to:subject:date:message-id:references:in-reply-to:content-type:mime-version;
 s=fpkey18762-1; bh=vXW+SMf2lkErjP2Rc5OJz/Q9HsJX1SpTp1lMoTsq9n0=;
 b=Hh3Cpl7lRqMd77clfYoNpyJAxPPLSLs4fsJKVQbbvSfm9sRmJ30Vv5s2UHHk3sghxkbeaLRLuwAQk+91Sc0aGvAfhXv+2LLpS2Cf/aFtnx99ecTDe7hZZG5l4wy8/fPMmCPLJtv3yS77V/29TVFI0gbq5AGSM0ExTgQC5neHZ6WMffkPQX6IbgloEXVPwZ9yXTA3JT96CE72vkeqLSM9fH9B01lXNBD81hqN3ab1ic0O9QqNNOjpSBsPenwn9fMU+FWL3gANJQfi5CQlAsatA09lE7+mJCjzUkP7dSo1ycVNvcAI01VO0Omgc9cheHZ36nS0CXJDTT7Vf/fr64gTUQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=granitenet.com header.i=@granitenet.com
 header.a=rsa-sha256 header.s=fpkey18762-1 header.b=Hh3Cpl7l
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=granitenet.com;
Subject: [Buildroot] - Python-awscrt/awsiotsdk Package
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
Content-Type: multipart/mixed; boundary="===============7729030661621504798=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7729030661621504798==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BY5PR12MB5542A39031912B609E3F87DDB2909BY5PR12MB5542namp_"

--_000_BY5PR12MB5542A39031912B609E3F87DDB2909BY5PR12MB5542namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hello All,

This is my first time with Buildroot so please bear with me!

I got two issues:

Issue #1:
I=92m trying to build a custom Linux distro with AWS package for my Sama7g5=
4-EK board. Following the guide (https://buildroot.org/downloads/manual/man=
ual.html#_infrastructure_for_python_packages) - 18.9.3. Generating a python=
-package from a PyPI repository, I was able to add the awscrt/awsiotsdk Pac=
kage and select both Python package under =93make menuconfig=94 and I was a=
ble to build successful image (no errors).

Burn the sdcard.img and booted the Sama7g54-EK board and tried to run my Py=
thon script and got following error:

# python3 app-code/provisioning.py 7770001111
Traceback (most recent call last):
  File "/home/root/app-code/provisioning.py", line 4, in <module>
    from awscrt import mqtt
  File "/usr/lib/python3.10/site-packages/awscrt/mqtt.py", line 9, in <modu=
le>
ImportError: /usr/lib/python3.10/site-packages/_awscrt.cpython-310-arm-linu=
x-gnueabihf.so: undefined symbol: aes_hw_encrypt
#

Issue #2:
And just for testing/development purpose I did include =93python-pip=94 pac=
kage but every time I run =93pip=94 I get following error:
# python3 -m pip install ./aws-iot-device-sdk-python-v2
Traceback (most recent call last):
  File "/usr/lib/python3.10/runpy.py", line 196, in _run_module_as_main
  File "/usr/lib/python3.10/runpy.py", line 86, in _run_code
  File "/usr/lib/python3.10/site-packages/pip/__main__.py", line 29, in <mo=
dule>
  File "/usr/lib/python3.10/site-packages/pip/_internal/cli/main.py", line =
9, in <module>
  File "/usr/lib/python3.10/site-packages/pip/_internal/cli/autocompletion.=
py", line 10, in <module>
  File "/usr/lib/python3.10/site-packages/pip/_internal/cli/main_parser.py"=
, line 8, in <module>
  File "/usr/lib/python3.10/site-packages/pip/_internal/cli/cmdoptions.py",=
 line 23, in <module>
  File "/usr/lib/python3.10/site-packages/pip/_internal/cli/parser.py", lin=
e 12, in <module>
  File "/usr/lib/python3.10/site-packages/pip/_internal/configuration.py", =
line 21, in <module>
  File "/usr/lib/python3.10/site-packages/pip/_internal/exceptions.py", lin=
e 7, in <module>
  File "/usr/lib/python3.10/site-packages/pip/_vendor/pkg_resources/__init_=
_.py", line 35, in <module>
  File "/usr/lib/python3.10/plistlib.py", line 61, in <module>
ModuleNotFoundError: No module named 'xml'

Tried to look for Python XML module but did not find any=85

My dev environment info:
Using Linux4Sam to build the distro for Sama7g54-EK board (AT91 and U-Boot)=
: https://www.linux4sam.org/bin/view/Linux4SAM/BuildRoot
Debian 11: Linux 5.10.0-21-amd64 #1 SMP Debian 5.10.162-1 (2023-01-21) x86_=
64 GNU/Linux

Any help will be highly appreciated.

Cheers,
Nitesh


--_000_BY5PR12MB5542A39031912B609E3F87DDB2909BY5PR12MB5542namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:o=3D"urn:schemas-microsoft-com:office:office" xmlns:w=3D"urn:sc=
hemas-microsoft-com:office:word" xmlns:m=3D"http://schemas.microsoft.com/of=
fice/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Menlo;
	panose-1:2 11 6 9 3 8 4 2 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hello All, <o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">This is my first ti=
me with Buildroot so please bear with me!
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I got two issues: <=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Issue #1:<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I=92m trying to bui=
ld a custom Linux distro with AWS package for my Sama7g54-EK board. Followi=
ng the guide (<a href=3D"https://buildroot.org/downloads/manual/manual.html=
#_infrastructure_for_python_packages">https://buildroot.org/downloads/manua=
l/manual.html#_infrastructure_for_python_packages</a>)
 - 18.9.3.&nbsp;Generating a&nbsp;python-package&nbsp;from a PyPI repositor=
y, I was able to add the awscrt/awsiotsdk Package and select both Python pa=
ckage under =93make menuconfig=94 and I was able to build successful image =
(no errors).
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Burn the sdcard.img=
 and booted the Sama7g54-EK board and tried to run my Python script and got=
 following error:
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"># python3 app-code/=
provisioning.py 7770001111<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Traceback (most rec=
ent call last):<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
home/root/app-code/provisioning.py&quot;, line 4, in &lt;module&gt;<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp;&nbsp;&nbsp; =
from awscrt import mqtt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
usr/lib/python3.10/site-packages/awscrt/mqtt.py&quot;, line 9, in &lt;modul=
e&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">ImportError: /usr/l=
ib/python3.10/site-packages/_awscrt.cpython-310-arm-linux-gnueabihf.so: und=
efined symbol: aes_hw_encrypt<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"># <o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Issue #2:<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">And just for testin=
g/development purpose I did include =93python-pip=94 package but every time=
 I run =93pip=94 I get following error:
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"># python3 -m pip in=
stall ./aws-iot-device-sdk-python-v2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Traceback (most rec=
ent call last):<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
usr/lib/python3.10/runpy.py&quot;, line 196, in _run_module_as_main<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
usr/lib/python3.10/runpy.py&quot;, line 86, in _run_code<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
usr/lib/python3.10/site-packages/pip/__main__.py&quot;, line 29, in &lt;mod=
ule&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
usr/lib/python3.10/site-packages/pip/_internal/cli/main.py&quot;, line 9, i=
n &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
usr/lib/python3.10/site-packages/pip/_internal/cli/autocompletion.py&quot;,=
 line 10, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
usr/lib/python3.10/site-packages/pip/_internal/cli/main_parser.py&quot;, li=
ne 8, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
usr/lib/python3.10/site-packages/pip/_internal/cli/cmdoptions.py&quot;, lin=
e 23, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
usr/lib/python3.10/site-packages/pip/_internal/cli/parser.py&quot;, line 12=
, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
usr/lib/python3.10/site-packages/pip/_internal/configuration.py&quot;, line=
 21, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
usr/lib/python3.10/site-packages/pip/_internal/exceptions.py&quot;, line 7,=
 in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
usr/lib/python3.10/site-packages/pip/_vendor/pkg_resources/__init__.py&quot=
;, line 35, in &lt;module&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">&nbsp; File &quot;/=
usr/lib/python3.10/plistlib.py&quot;, line 61, in &lt;module&gt;<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">ModuleNotFoundError=
: No module named 'xml'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Tried to look for P=
ython XML module but did not find any=85<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">My dev environment =
info:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Using Linux4Sam to =
build the distro for Sama7g54-EK board (AT91 and U-Boot): https://www.linux=
4sam.org/bin/view/Linux4SAM/BuildRoot<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Debian 11: Linux 5.=
10.0-21-amd64 #1 SMP Debian 5.10.162-1 (2023-01-21) x86_64 GNU/Linux<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Any help will be hi=
ghly appreciated.
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Cheers,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Nitesh<o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
</div>
</body>
</html>

--_000_BY5PR12MB5542A39031912B609E3F87DDB2909BY5PR12MB5542namp_--

--===============7729030661621504798==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7729030661621504798==--
