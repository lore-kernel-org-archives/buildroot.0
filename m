Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A652C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 07:10:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D28E260F70
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 07:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D28E260F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A300582C3E;
	Tue,  3 Aug 2021 07:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "In-Reply-To"
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F6y7BVDkDyh4; Tue,  3 Aug 2021 07:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB8EE82BC3;
	Tue,  3 Aug 2021 07:10:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4BE481BF35B
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 07:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4842C402A0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 07:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "Cc"
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lemf__Jbaj8P for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 07:10:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1930540291
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 07:10:48 +0000 (UTC)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17373IaG031544
 for <buildroot@buildroot.org>; Tue, 3 Aug 2021 03:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : cc :
 subject : in-reply-to : in-reply-to : references : date : message-id :
 content-type : mime-version; s=pp1;
 bh=bn5aNo5a0tuBWljJRkJm2B4VUEz575DvFR1ctQuqWNg=;
 b=P0OeZVo8AUVOjQ4j+kLnx62PP2Lo3OnGW6C24AcIm1vOkEkSJLS9K6WWy3aHEoamMYzR
 e63HAcA873RYaMYy8bEKjyH69Rifcyii1oW47ck1a8JkIVEjZbXutNd+ilAartVY0PmA
 esSiUnai8pp4CLWLw+yy8KePQm9UDh5Ea/N0BJt6tD6d/iSy6AG23K8OK/sHfuT+A2Zc
 fhJ0Fami24yN66K/rWI+lsJeM7L6RUg6O4CdDTBEWFpcbi0dWg6vU3qk1VM5M1LWVBxs
 pIaNTZCqOexB9qdRQ4lS6zstwGBy7LmV+mKsDixo+aeSqAaU6cSanyHt0pakXUsqcMNc KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a6keanahv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 03:10:47 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17373Nr9032144
 for <buildroot@buildroot.org>; Tue, 3 Aug 2021 03:10:47 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a6keanahd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 03:10:47 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17379PUJ032137;
 Tue, 3 Aug 2021 07:10:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma05fra.de.ibm.com with ESMTP id 3a4x58dw01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 07:10:45 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1737AgL352756750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Aug 2021 07:10:42 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4B15A408A;
 Tue,  3 Aug 2021 07:10:42 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 89C36A406E;
 Tue,  3 Aug 2021 07:10:42 +0000 (GMT)
Received: from localhost (unknown [9.171.48.220])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Aug 2021 07:10:42 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
In-Reply-To: <20210801204650.75712-1-fontaine.fabrice@gmail.com>
In-Reply-To: 
References: <20210801204650.75712-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 09:10:42 +0200
Message-ID: <8735rr3swd.fsf@oc8242746057.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BNtmnTe4D4OJF_lsGwzpKP0Q7Zv3egGO
X-Proofpoint-GUID: 2GUnhU16Wb2pTwJfdXOGBoy3o4qc5Ctf
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_02:2021-08-02,
 2021-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108030047
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/s390-tools: fix build with curl
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: , Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

> Build with curl is broken since bump to version 2.17.0 in commit
> eab9110afbef9c39569c4cc988aed15c48f7ce44 and
> https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e
>
> Fixes:
>  - http://autobuild.buildroot.org/results/cfb46d7547c22f0a23aca2286dc5a1d2c20aadfc
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Split patch
>  - Add CURL_CONFIG and XML2_CONFI
>
>  ...lient-Makefile-add-CURL-XML2-_CONFIG.patch | 71 +++++++++++++++++++
>  package/s390-tools/s390-tools.mk              |  1 +
>  2 files changed, 72 insertions(+)
>  create mode 100644 package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch
>
> diff --git a/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch b/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch
> new file mode 100644
> index 0000000000..2f6ea5a11c
> --- /dev/null
> +++ b/package/s390-tools/0003-libkmipclient-Makefile-add-CURL-XML2-_CONFIG.patch
> @@ -0,0 +1,71 @@
> +From 49cd01dc97740b299119f32c822ccfd989ea7ec9 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 1 Aug 2021 21:50:21 +0200
> +Subject: [PATCH] libkmipclient/Makefile: add {CURL,XML2}_CONFIG
> +
> +Add CURL_CONFIG and XML2_CONFIG to allow the user to configure the
> +binaries used in check-dep-libkmipclient
> +
> +This will allow the user to avoid the following build failures raised
> +since version 2.17.0 and
> +https://github.com/ibm-s390-linux/s390-tools/commit/56fecf1832c3ebc4626ddf5c598762833c362d5e:
> +
> +/bin/sh: 1: curl-config: not found
> +Error: libcurl is not built with the OpenSSL backend
> +make[2]: *** [Makefile:54: check-dep-libekmfweb] Error 1
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/cfb46d7547c22f0a23aca2286dc5a1d2c20aadfc
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/ibm-s390-linux/s390-tools/pull/121]
> +---
> + libkmipclient/Makefile | 13 ++++++++-----
> + 1 file changed, 8 insertions(+), 5 deletions(-)
> +
> +diff --git a/libkmipclient/Makefile b/libkmipclient/Makefile
> +index 36efecb..addd096 100644
> +--- a/libkmipclient/Makefile
> ++++ b/libkmipclient/Makefile
> +@@ -50,6 +50,9 @@ detect-openssl-version.dep:
> + 	echo "}" >> $(TMPFILE)
> + 	mv $(TMPFILE) $@
> + 
> ++CURL_CONFIG ?= curl-config
> ++XML2_CONFIG ?= xml2-config
> ++
> + check-dep-libkmipclient: detect-openssl-version.dep
> + 	$(call check_dep, \
> + 		"libkmipclient", \
> +@@ -67,14 +70,14 @@ check-dep-libkmipclient: detect-openssl-version.dep
> + 		"libxml/tree.h", \
> + 		"libxml2-devel", \
> + 		"HAVE_LIBXML2=0", \
> +-		`xml2-config --cflags` `xml2-config --libs`)
> ++		`$(XML2_CONFIG) --cflags` `$(XML2_CONFIG) --libs`)
> + 	$(call check_dep, \
> + 		"libkmipclient", \
> + 		"curl/curl.h", \
> + 		"libcurl-devel", \
> + 		"HAVE_LIBCURL=0" \
> +-		`curl-config --cflags` `curl-config --libs`)
> +-	curl-config --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
> ++		`$(CURL_CONFIG) --cflags` `$(CURL_CONFIG) --libs`)
> ++	$(CURL_CONFIG) --ssl-backends | grep OpenSSL >/dev/null 2>&1 || { echo "Error: libcurl is not built with the OpenSSL backend"; exit 1; }
> + 	touch check-dep-libkmipclient
> + 
> + skip-libkmipclient-openssl:
> +@@ -104,8 +107,8 @@ tls.o: check-dep-libkmipclient tls.c kmip.h utils.h $(rootdir)include/kmipclient
> + names.o: check-dep-libkmipclient names.c names.h utils.h $(rootdir)include/kmipclient/kmipclient.h
> + utils.o: check-dep-libkmipclient utils.c names.h utils.h $(rootdir)include/kmipclient/kmipclient.h
> + 
> +-libkmipclient.so.$(VERSION): ALL_CFLAGS += -fPIC `xml2-config --cflags` `curl-config --cflags`
> +-libkmipclient.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `xml2-config --libs` `curl-config --libs`
> ++libkmipclient.so.$(VERSION): ALL_CFLAGS += -fPIC `$(XML2_CONFIG) --cflags` `$(CURL_CONFIG) --cflags`
> ++libkmipclient.so.$(VERSION): LDLIBS = -ljson-c -lcrypto -lssl `$(XML2_CONFIG) --libs` `$(CURL_CONFIG) --libs`
> + libkmipclient.so.$(VERSION): ALL_LDFLAGS += -shared -Wl,--version-script=libkmipclient.map \
> + 	-Wl,-z,defs,-Bsymbolic -Wl,-soname,libkmipclient.so.$(VERM)
> + libkmipclient.so.$(VERSION): kmip.o request.o response.o attribute.o key.o ttlv.o json.o \
> +-- 
> +2.30.2
> +
> diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
> index 7f7df0542e..71a7f2223c 100644
> --- a/package/s390-tools/s390-tools.mk
> +++ b/package/s390-tools/s390-tools.mk
> @@ -20,6 +20,7 @@ S390_TOOLS_MAKE_OPTS = \
>  ifeq ($(BR2_PACKAGE_LIBCURL),y)
>  S390_TOOLS_DEPENDENCIES += libcurl
>  S390_TOOLS_MAKE_OPTS += \
> +	CURL_CONFIG=$(STAGING_DIR)/usr/bin/curl-config \
>  	HAVE_CURL=1 \
>  	HAVE_LIBCURL=1
>  else
> -- 
> 2.30.2

Thanks for fixing it.

Regards
Alex
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
