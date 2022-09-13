Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D1BC54EE9
	for <buildroot@archiver.kernel.org>; Tue, 13 Sep 2022 12:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD06D60E66;
	Tue, 13 Sep 2022 12:07:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD06D60E66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BmqNvI9IzU3O; Tue, 13 Sep 2022 12:07:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1ABF60E38;
	Tue, 13 Sep 2022 12:07:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1ABF60E38
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D046C1BF3AD
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:07:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7436D408A9
 for <buildroot@lists.busybox.net>; Tue, 13 Sep 2022 12:07:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7436D408A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JOvxrY0rxcZs for <buildroot@lists.busybox.net>;
 Tue, 13 Sep 2022 12:07:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 117C840325
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2045.outbound.protection.outlook.com [40.107.22.45])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 117C840325
 for <buildroot@buildroot.org>; Tue, 13 Sep 2022 12:07:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QvQaf/2Qofh/HoBJsSnovIqoVAd/ZFSDc6XwCdGQcXZ0R9UTVFfHgeVhLigI4jFNrUhcfaMiaEmFFbJ+DkrRAwsef08MVIoscg2lS2vkG8rVHWm2k+eFtwh9oKmOfFOQ02IzL/cjS2PPN5KkjuI4RO5nuOGLT1IrpuxDJOAJLnu4tm68w1fmjTu9mB5wXjQx426WTvEfzuq0G4+PddYLC0iuIOncX2Jifm+TN3QHfVIEsS0xdojtep4u5bpUY/MAsry+C7G57V1emf/YVYpbHfvRsOTQjiyejTVc5hNw7TP8zgTj1INTdXRyzMRuWQqFOooKwMagPub+xGpUN5bWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSBsyM6L82/s/8xpJq7uVXwmONH7C+2qVhEXyUU7IWk=;
 b=DzEfKOHOncK/AdlaYSGEjVaQ+HlUp8CElYKD7z7An0uYUiTd6Tc5ESE00Ijzj981MU6XlGXO9XW/QRluSR0Hqp6LwQBxlBQAnU3I9/3QUCRZRYHpl/ZQuTXuby06GR0clZIgVjWLZys/tZA9A37rvdiEtcy1skk1DwLIKUA6hDmOV9cA1fNMumUgpIJxk2s7hBq7fDNLv75h50IAuHxND4SmWLyX7jXyOkkYuuee7f8LwCN/U1zynRFjPdiz8TyXNiwjw76HFt2CgdwseyiGh/QCOVZHRLXaGNSM6ZlWdkX4VsUn+ebk13UTST9qlsjLPCSqxEGanG6gaEiGnYim3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=abatec.at; dmarc=pass action=none header.from=abatec.at;
 dkim=pass header.d=abatec.at; arc=none
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM (2603:10a6:802:39::26)
 by AM7P190MB0663.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:118::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Tue, 13 Sep
 2022 12:07:18 +0000
Received: from VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76]) by VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
 ([fe80::40ee:4b47:3d8b:cb76%4]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 12:07:18 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [PATCH 1/1] package/python3: security bump to version 3.10.7
Thread-Index: AQHYx2kVgw31XuIKxk+po0iyO3wD3w==
Date: Tue, 13 Sep 2022 12:07:18 +0000
Message-ID: <VI1P190MB0493B4A92D026034AD0D83119F479@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1P190MB0493:EE_|AM7P190MB0663:EE_
x-ms-office365-filtering-correlation-id: 86684f1a-f5b3-40b7-3ae0-08da95808167
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bElzZVWiK6vqB5CsH7FRQ045UBWeLNqVvb2YQfRzV/Awb/zHL6iZUikNwl2cFHLMrxrlWoRLpEotMr1OhINys7lilRENwPMhQbnvIr1QXyuI7EIRqFIePeMM2pnIItiMEeZV2k+9AuKYD//Gb+XAL/n98cToPdvD4itkBrfA4JCIV89QsVAVyDjET9yhI9FdgwpAoQuzR6hIAVG1NO0TqPZiDACe6wgLKTIa/TnP9uSK7B1OR30uuhIwIej9RkjWoQbyAi6my0HkRVL2H3/bkl11rmw9JugIPFWSte/S/MeES870/ZCv1870oED60fIAj5qx3MsEVuiUZHmjDtvn0Z8i2MVYmM85fOLtseWKpE7j+c1djbNXHPwn2AZNxdibai5FqDjs6lAQ+FVqk6aA1J/5u/opTRP6hT2PmgEAQRGR/U/tFH59L088wmAbMTaBfbH0rO/UVyvre0UbL5f+YfT5VpTqHpIkCZen9rG43EnDWlsfBII/WWjaobQRPIDHij55ujm7vb2RzOTNqTHUROsWCxp/5LSqjMB5YYHZbv8BSi36i5mwV43ku68NFVbphYTdbO3b5Gj7uA6TCsRn/Diwitx6vF54HmzGSkVYnOF1NeSed9jjN9SNujApbuEwaLztlekeAkT/FtzcDYDv4xUxBE1qNyWLmzedJCEbnAbzxUgUGm+C7oNYCYSzgyR3uGSwKvkaYEB61+Ha6jhVKa/iM0L00aK5zAmgNNoVdedlyMTPDJCv0BlSrC3yB+DdZg55z+OlKFqDqN3YQjGwHl8rwqyqCt4+ATXs0SeWbog=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1P190MB0493.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39830400003)(346002)(396003)(376002)(136003)(366004)(451199015)(83380400001)(76116006)(966005)(54906003)(41300700001)(66476007)(316002)(8936002)(55016003)(2906002)(64756008)(38070700005)(5660300002)(8676002)(38100700002)(9686003)(7696005)(26005)(122000001)(33656002)(71200400001)(15650500001)(186003)(86362001)(6916009)(6506007)(66946007)(4326008)(66556008)(52536014)(478600001)(66446008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?0NDL7+9Wx/qNY8/7juKTvqQ9cz1hX5Zx4UWivLmL2yFrPWlZPQfRjU4O+N?=
 =?iso-8859-1?Q?Ia7Bxx5XxoeRLsVg20kV5ojSRcCljvqBqI5ZyNfpVpiwOfNP1uXgkm+DMe?=
 =?iso-8859-1?Q?/0Rr4BHrrYA6ZD/siQSkhTFJM0JARJxFkZZYaSULwQgkrXYWMGogeuFH+V?=
 =?iso-8859-1?Q?7W/9Pk3i5y5mE1DykeK999nopYkSu9jpnXYjBeI9bjSsrw6k89A6BdqAwT?=
 =?iso-8859-1?Q?75mEsg9bGP3zroONphz9hjhlBpmvo/4dTRN/b/eEBX6NbZTehyoQHhgZb5?=
 =?iso-8859-1?Q?O/S2S0NIwZ9q1hsLkCeu2HUvT2IlVBorOmuicEx9WeGL+gK2zNGfc9dhmf?=
 =?iso-8859-1?Q?X0rmWGoQhQW5bK8weYcIBqfrgiCMZnDQgHIbaDkXlh5BapeHsVmdjdS0Of?=
 =?iso-8859-1?Q?+H7wgikucH0X5VdeElS6hfVbNQRxYDII5oVFjBbLs2P9Ttgexwty+Qk7ag?=
 =?iso-8859-1?Q?VxEbN1O1IFWv/OCbYig/CcTZ9tNypklpr9/y1Va+s9gY7wDQj6uVfG8d80?=
 =?iso-8859-1?Q?fH8SZ4aI3o6TcFk7KDEm17lvU9OJD0eIJ7t4tFnhWmOtRwCHsGUa7OW3Ma?=
 =?iso-8859-1?Q?/Kb7LlWD9RdhWVkqPMarrY4kAvWwrFOtFYnxhFBSaPpjtomY2TuXNLyaX9?=
 =?iso-8859-1?Q?wfBhIXDfxr8EywvSPH0HNKkBBEN0fnWGMoUjV89MDerfNd0PFLMfOyg/bK?=
 =?iso-8859-1?Q?yg6h7+Z3ibDNA6xHc0+JJ39pBIAaX9Uc14w3lSx7ChsmickDdMQyUhMwrd?=
 =?iso-8859-1?Q?/JCNCKSSB+Ak5Xu1oGcKF7hyHXOZmHQr3SOOTdr4hrJTlqrAVElebirrjJ?=
 =?iso-8859-1?Q?Js9ysqJ8PQ05fsJQWRrb6qzsP6GhtQfFzwk0MNJ8Hji0y/EaNLR41BwdXQ?=
 =?iso-8859-1?Q?XNcYEgpX9EbxvR9HRnnzN50Y0iL4QKeXbZJ3FMyeuPNIvYJhzXFUdIn4nS?=
 =?iso-8859-1?Q?S3hV9ZoPL6cJiRgoxNoTUHTNzW3hYvFuTLUPdtIWX+7aKgcziOSU9Lsd9y?=
 =?iso-8859-1?Q?sOPnbsK5WF4cKDBscTXdKIglG2RYL5cn2Cn3gJOEh23QkgRf6NqupNrul9?=
 =?iso-8859-1?Q?xZNERN1MQrzQCYpHGxLNHUMKUNQJP7d9kIAOcBTht7Vr7O8xOu7Nq8o/XS?=
 =?iso-8859-1?Q?eZDQWG7fIvUTnaiEwVQDZX1l8+40t+2z5hy8wz1fA+PQ24s00kqbzpXEbH?=
 =?iso-8859-1?Q?F+cnyLfrKbrYwXFmrkYgtht77D0Ed1sN57xMTBWgJu/Dl0biz/5NtvKLyW?=
 =?iso-8859-1?Q?ypC3ULDyRFSILR4AgwNQ2md+Rmdig55srgS9sS96fpf8Wg4NqcK6rGx9lR?=
 =?iso-8859-1?Q?61wxF2bb35b5n80N+nMMtJyiw/DNA7ei6zEhIbTla8fl3zplpyenHOgAOY?=
 =?iso-8859-1?Q?KrEZ52WW5YqeWiHVFL3PdD9/qBtygiR/XKpZ2Oq0n1gjhcsNNhymBn83EH?=
 =?iso-8859-1?Q?JfAAkv77LaZvLDLWL8GTGJA+nXAVbkOB85IbvdGmNp6k8lybbI5ZyqUhqr?=
 =?iso-8859-1?Q?ncXgsGaBrRJCsdTxc56y7/4fNGROJK9zxDX+rQbXFmZd2BFIi6UlqAcz/E?=
 =?iso-8859-1?Q?UPfQ9tcU39HlCJFZGUQQenbDmgcj4uVpvA48mvvL0p0XfGiQkfr+f6gHsx?=
 =?iso-8859-1?Q?P83E3WCWv4fss=3D?=
MIME-Version: 1.0
X-OriginatorOrg: abatec.at
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1P190MB0493.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 86684f1a-f5b3-40b7-3ae0-08da95808167
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2022 12:07:18.5412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8814618e-1e36-4349-bccb-87b9400379c3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DZhp3OhC5YPNmaCZwTXM0wOrThFzIsrG1fbD+D4wjzPzZFXL0TCDLbLmf1d7GK64t00DdRwhxFLAWafYpGrWDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P190MB0663
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=abatec.at; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSBsyM6L82/s/8xpJq7uVXwmONH7C+2qVhEXyUU7IWk=;
 b=xCvNVY3gN4P8dUBL+7kF9zCr5/jLj3B8FvCkGa4Be3dj81gpSVmML1XjvjPETiOEK1QEOtOXsxSASy1Z20Jx29TrxpPwkwVUyF0zAuK2PnUBzeu3mcNl8GGuFNUGsK30kev/9gNAfVihfStqL5pfb+yxDM3F46Nu1xnE/iGKZGM=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=abatec.at header.i=@abatec.at header.a=rsa-sha256
 header.s=selector1 header.b=xCvNVY3g
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=abatec.at;
Subject: [Buildroot] [PATCH 1/1] package/python3: security bump to version
 3.10.7
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
From: Lang Daniel via buildroot <buildroot@buildroot.org>
Reply-To: Lang Daniel <d.lang@abatec.at>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix CVE-2020-10735

https://github.com/python/cpython/blob/v3.10.7/Misc/NEWS.d/3.10.7.rst

Signed-off-by: Daniel Lang <d.lang@abatec.at>
---
 ...b-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch | 6 ++++--
 package/python3/python3.hash                                | 2 +-
 package/python3/python3.mk                                  | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python3/0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch b/package/python3/0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
index 880277eb1d..0458283c18 100644
--- a/package/python3/0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
+++ b/package/python3/0032-lib-crypt-uClibc-ng-doesn-t-set-errno-when-encryptio.patch
@@ -16,6 +16,8 @@ https://gitlab.com/buildroot.org/buildroot/-/jobs/830981979
 [2] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/libcrypt/crypt.c?h=v1.0.36#n29
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Daniel: updated for 3.10.7]
+Signed-off-by: Daniel Lang <d.lang@abatec.at>
 ---
  Lib/crypt.py | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
@@ -28,10 +30,10 @@ index 33dbc46bb3..4692a5270c 100644
          result = crypt('', salt)
      except OSError as e:
          # Not all libc libraries support all encryption methods.
--        if e.errno == errno.EINVAL:
+-        if e.errno in {errno.EINVAL, errno.EPERM, errno.ENOSYS}:
 +        # Not all libc libraries set errno when encryption method is not
 +        # available.
-+        if e.errno == errno.EINVAL or e.errno == 0:
++        if e.errno in {errno.EINVAL, errno.EPERM, errno.ENOSYS} or e.errno == 0:
              return False
          raise
      if result and len(result) == method.total_size:
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 596f3e7c18..c625e7a8ea 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f795ff87d11d4b0c7c33bc8851b0c28648d8a4583aa2100a98c22b4326b6d3f3  Python-3.10.6.tar.xz
+sha256  6eed8415b7516fb2f260906db5d48dd4c06acc0cb24a7d6cc15296a604dcdc48  Python-3.10.7.tar.xz
 sha256  f03e17cd594c2085f66a454e695c7ebe5b4d3c0eff534f4f194abc2fd164621b  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index e34e7d1750..b7df26781a 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.10
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).7
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
