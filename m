Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75602CA5FA3
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 21:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 04E4380A53;
	Mon, 28 Sep 2026 21:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0BEN1Sfq9-q1; Mon, 28 Sep 2026 21:01:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 14DF380AEA
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790629275;
	b=XvlCRgbE6Lgrbv7QZSifEsIKDB/0SBfN2KEmkVNfpKpsVTN8kyNNI+3HikJhlnwoID6V
	 teXqLhCL6gWwOxATKMBxKF5sN9nvxvhMj7QfOzH9olmILvNDb+rMeCAu1kRMynhwu90YV
	 3/vxp5PUUjFyU3OZ21fOEo4Uo3JaeG+U5lBwYGEb2OfQVEkO60rMPiWsDHzNH80Z3Z3NC
	 vSS8sqYgN2IVlb7LvAjQIQgUnrz1u8+U5IcsxUaXaZ6tSRk15CB6NpPsonJMfjiXG2ozW
	 5lxjFMqnLI9meHOnZz/inJFLc9DtLOesHTtfGs9TpTcKq/tXMT/reJMchDFl2NlwCoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790629275;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=iXSWrmrt3qZg7hYqG+oQHz+Fz1jAW/XIrrPIYmSWkt4=;
	b=VenZBcfC+liGwV+deOeKkurmlyUnpfDJ+NyQyrSnLrmVK0KBFOlJReR5AAqRNIowHTI3
	 9TBwOmFe9ejtwC0ixgBSNb3OcAFfKBMe74p21kFainJYxc5/hFkW/Vlq3hRdVU8RNqbsx
	 qUS3pqn7mqbP3E4VctysWFKCBK3wgLwgJkrNC9L5w8dm4JXKYWe6hPo70czYu1QmlwynC
	 Mffs7opuF0uby879FP6xqwiO/8+tbGpnFlRbSgs06+jceqkeF3nhQEAHKwcroiRL13iIP
	 rJsR19PemQK0M6GPD5j6GX50DibLQPGM2ifIUV2wAZnkowuC7LYZTIrW0RYzRfhM/Hg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790629275;
	bh=iXSWrmrt3qZg7hYqG+oQHz+Fz1jAW/XIrrPIYmSWkt4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qXGmkOEKOsmaDM8IXzxO+lsNHvc+7OCEMiR9hbmyyO07GFKfcT2FE2641F1URSevM
	 B7B+NdKt9ExLXlKElQLwwtt5YGovKRacE7zQyfXRruL94yUssK5Z7ozRys2upYH5Sn
	 dvnq8Bwu4cluS+8lLxzK97wfRBCr7HEG8LZDcdmVLSAms/8eCdKOUo//HwxXDp1yra
	 5d+seZnJVXMeztiLD7V9UOi+4xjWwKOIuivTQ69YbbwPrXrd/kNsAD1COSAF0wbSZP
	 cUeD4zssIsnTvXKeNW2VXNDO7QfvP0BeZVavigkYDDLSZAdMzuPp/DoXGk1R0d4y9W
	 pUj0UoG+rb+GA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14DF380AEA;
	Mon, 28 Sep 2026 21:01:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AF7961
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0067D6061F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2y4J9EW_ZhFd for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 21:01:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 2521F60615
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790629273;
 b=LnlXrVWjx4tbahkZX/NepYadpCvoMn7B11Y5HQdek+80kPnSh7IUu5Nm6ISM2Ahr9dig
 fqRBtpMbrw9fG6xBzOUMEfM3B4FdfoY7lAYt+2U0YgyoFL7Je2o1N4Q7q7nRLmP9kIs9d
 Xi/I42rMN+s5PXta3evfyH1FvI/kbJx2jASMu37jddObZpbXKiBXGlqtdkrAj1NwnC9K6
 IR1DE2mEypsX0rW0iqGHflF0mT2U7ueZ94m7RcY8dqUUaTRDcEbWG4HYFLsEhzMrwuW3w
 D1UNu/co5epg84JP+DyejuLb6TcdKlCVMtt7t98DItFLQ1adR/aZffWWtkuKsV6sL1A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790629273;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=90xuCZu29WyHHdVJxHR6OCIW0CzegRKakvLc3O4+qpY=;
 b=RB4wgMxQw4IbxCDLv9SjTRshbkL12j6+QuD6GxV+RGeYe3RKCHGOk86lFvWd+ncY2Y5u
 6YG58vsSWfi2YygUNQKaiRKnyaws/UBQJMkpyvJuqz56Drrf9TjiBwgWnjTC9hPIIB0op
 nGK7zN0RI0OBx4IZfm+97ITXJuSyhSxrk9/fIIiDLxacB/tugyboKJztHD2Nky8ktNqbs
 GNPp0wXmTo86tIN3H/zwnQhZ9SPOULJ2iQ+2kEqgNQuk5xz6qdadFgtRVK7UfhOvI1f5A
 GnFJSMrvEogMw/ziNXv3HRzs8eb+KSS2fz2jxdIb9qE6vHDikBBgfiopwU7JFkv0Sww==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2521F60615
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 21:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1E58983D2; Mon, 28 Sep 2026 21:00:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 15:05:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce1bde641bd7628e4db44e41f22eede540a89576
X-Git-Newrev: b3fc9c76fa3c253da2b3db535e24f8a6da91b607
X-Patchwork-Hint: ignore
Message-Id: <20260928210000.B1E58983D2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ntp: add support for OpenSSL 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b3fc9c76fa3c253da2b3db535e24f8a6da91b607
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ntp/0008-openssl4.patch | 100 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/package/ntp/0008-openssl4.patch b/package/ntp/0008-openssl4.patch
new file mode 100644
index 0000000000..fc8ba9ef8e
--- /dev/null
+++ b/package/ntp/0008-openssl4.patch
@@ -0,0 +1,100 @@
+Enable building with OpenSSL 4.0
+
+Upstream: https://bugs.ntp.org/show_bug.cgi?id=4023
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff -Nru a/ntpd/ntp_crypto.c b/ntpd/ntp_crypto.c
+--- a/ntpd/ntp_crypto.c	2026-05-19 05:47:27 +0000
++++ b/ntpd/ntp_crypto.c	2026-05-19 05:47:27 +0000
+@@ -2019,6 +2019,9 @@
+ 	struct calendar *pjd	/* pointer to result */
+ 	)
+ {
++	/* OpenSSL 4 makes ASN1_TIME opaque */
++#if OPENSSL_VERSION_NUMBER < 0x40000000L
++
+ 	size_t	len;		/* length of ASN1_TIME string */
+ 	char	v[24];		/* writable copy of ASN1_TIME string */
+ 	unsigned long	temp;	/* result from strtoul */
+@@ -2064,7 +2067,24 @@
+ 	pjd->year = temp;
+ 
+ 	pjd->yearday = pjd->weekday = 0;
+-	return;
++
++#else	/* OpenSSL 4+ follows */
++
++	struct tm	t;
++	int		rc;
++
++	rc = ASN1_TIME_to_tm(asn1time, &t);
++	INSIST(0 == rc);
++
++	pjd->second	= t.tm_sec;
++	pjd->minute	= t.tm_min;
++	pjd->hour	= t.tm_hour;
++	pjd->monthday	= t.tm_mday;
++	pjd->month	= t.tm_mon;
++	pjd->year	= t.tm_year;
++	pjd->yearday	= t.tm_yday;
++	pjd->weekday	= t.tm_wday;
++#endif
+ }
+ 
+ 
+@@ -3517,6 +3537,7 @@
+ 		X509_EXTENSION *ext;
+ 		ASN1_OBJECT *obj;
+ 		int nid;
++		int datalen;
+ 		ASN1_OCTET_STRING *data;
+ 
+ 		ext = X509_get_ext(cert, i);
+@@ -3550,8 +3571,21 @@
+ 		 */
+ 		case NID_subject_key_identifier:
+ 			data = X509_EXTENSION_get_data(ext);
+-			ret->grpkey = BN_bin2bn(&data->data[2],
+-			    data->length - 2, NULL);
++#if OPENSSL_VERSION_NUMBER >= 0x40000000
++			datalen = ASN1_STRING_length(data);
++			if (datalen > 2) {
++				ret->grpkey =
++				    BN_bin2bn(ASN1_STRING_get0_data(data) + 2,
++					      datalen - 2, NULL);
++			}
++#else	/* OpenSSL 3.x or earlier follows */
++			datalen = data->length;
++			if (datalen > 2) {
++				ret->grpkey =
++				    BN_bin2bn(&data->data[2],
++					      datalen - 2, NULL);
++			}
++#endif
+ 			/* fall through */
+ 		default:
+ 			DPRINTF(1, ("cert_parse: %s\n",
+diff -Nru a/ports/winnt/ntpd/ntservice.c b/ports/winnt/ntpd/ntservice.c
+--- a/ports/winnt/ntpd/ntservice.c	2026-05-19 05:47:27 +0000
++++ b/ports/winnt/ntpd/ntservice.c	2026-05-19 05:47:27 +0000
+@@ -87,6 +87,7 @@
+ 	int	argc_after_opts;
+ 	char **	argv_after_opts;
+ 
++	init_lib();		/* ntp_strerror() below needs it */
+ 	ssl_applink();
+ 
+ 	/* Save the command line parameters */
+diff -Nru a/util/ntp-keygen.c b/util/ntp-keygen.c
+--- a/util/ntp-keygen.c	2026-05-19 05:47:27 +0000
++++ b/util/ntp-keygen.c	2026-05-19 05:47:27 +0000
+@@ -625,7 +625,7 @@
+ 
+ 	/*
+ 	 * Create new encrypted GQ server keys file if requested;
+-	 * otherwise, look for an exisiting file. If found, fetch the
++	 * otherwise, look for an existing file. If found, fetch the
+ 	 * public key for the certificate.
+ 	 */
+ 	if (gqkey)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
