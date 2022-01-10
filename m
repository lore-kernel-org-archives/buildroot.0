Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C0BC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 20:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B041F408B9;
	Mon, 10 Jan 2022 20:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9l6j4BnAPBn; Mon, 10 Jan 2022 20:59:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B1E040322;
	Mon, 10 Jan 2022 20:59:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16C0C1BF97F
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 20:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04A4F82F77
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 20:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRBtKSoc-b6X for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 20:58:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6E85582DD9
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 20:58:58 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20AJMl9T000592; 
 Mon, 10 Jan 2022 20:58:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dfkys4avj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 20:58:57 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20AKlWoY017003;
 Mon, 10 Jan 2022 20:58:56 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dfkys4av1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 20:58:56 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20AKq6G2013381;
 Mon, 10 Jan 2022 20:58:54 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 3df2897mrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Jan 2022 20:58:54 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 20AKnqPU50201006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Jan 2022 20:49:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B7DBA4054;
 Mon, 10 Jan 2022 20:58:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 194D9A405F;
 Mon, 10 Jan 2022 20:58:52 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 10 Jan 2022 20:58:52 +0000 (GMT)
Received: from yukon.ibmuc.com (unknown [9.171.70.95])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id 7184922019F;
 Mon, 10 Jan 2022 21:58:51 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 21:58:44 +0100
Message-Id: <20220110205844.815899-3-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220110205844.815899-1-clg@kaod.org>
References: <20220110205844.815899-1-clg@kaod.org>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f6ctDP7TtRm0IEe4rKDql4fDArlRMPT2
X-Proofpoint-ORIG-GUID: 4NiGzePm6eXX7KjoJ8U_vdJIFuNE7A8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-10_09,2022-01-10_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=842 lowpriorityscore=0 clxscore=1034 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201100139
Subject: [Buildroot] [PATCH 3/3] package/qemu: Add support for PPC970
 processors
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UFBDOTcwIHByb2Nlc3NvcnMgYXJlIHdlbGwgc3VwcG9ydGVkIGJ5IHRoZSBRRU1VIHBzZXJpZXMg
YW5kIG1hY2Jvb2sKbWFjaGluZXMuIFRoZSBsYXRlc3QgZGViaWFuIDExIChiaWcgZW5kaWFuKSBy
dW5zIHdpdGggU01QLiBSZS1hZGQKc3VwcG9ydC4KCkZpeGVzOiBlZmM2N2RlZWYzOGMgKCJxZW11
OiByZW1vdmUgc3VwcG9ydCBmb3Igc29tZSBQb3dlclBDIHByb2Nlc3NvcnMgaW4gaG9zdCBxZW11
IikKU2lnbmVkLW9mZi1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4KLS0tCiBw
YWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3QgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL3FlbXUvQ29uZmln
LmluLmhvc3QgYi9wYWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3QKaW5kZXggZGY1ZDkyMTEyNTgy
Li5mOWNkYjliNzAzNzEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcWVtdS9Db25maWcuaW4uaG9zdAor
KysgYi9wYWNrYWdlL3FlbXUvQ29uZmlnLmluLmhvc3QKQEAgLTIyLDcgKzIyLDcgQEAgY29uZmln
IEJSMl9QQUNLQUdFX0hPU1RfUUVNVV9BUkNIX1NVUFBPUlRTCiAJZGVmYXVsdCB5IGlmIEJSMl94
dGVuc2EKIAlkZWZhdWx0IHkgaWYgQlIyX3g4Nl82NAogCWRlcGVuZHMgb24gIUJSMl94ODZfc3Rl
YW1yb2xsZXIgJiYgIUJSMl94ODZfY29yZV9hdngyCi0JZGVwZW5kcyBvbiAhQlIyX3Bvd2VycGNf
NjIwICYmICFCUjJfcG93ZXJwY182MzAgJiYgIUJSMl9wb3dlcnBjXzk3MAorCWRlcGVuZHMgb24g
IUJSMl9wb3dlcnBjXzYyMCAmJiAhQlIyX3Bvd2VycGNfNjMwCiAKIGNvbmZpZyBCUjJfUEFDS0FH
RV9IT1NUX1FFTVVfU1lTVEVNX0FSQ0hfU1VQUE9SVFMKIAlib29sCi0tIAoyLjMxLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
