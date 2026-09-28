Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24088CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 11:50:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E25CC80C5D;
	Mon, 28 Sep 2026 11:50:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FNUJxZRyCxOj; Mon, 28 Sep 2026 11:50:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 094D580D6E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790596249;
	b=eniAwgxJEMyUbO/zCVUG7CaxNBIYOSKRxbW7W2P3I+rPZkIlku6QbocILaenWtgowYjJ
	 n0Qz+Ll0jVfSc0+l3oYaP0PVmCcNUj/oEHn4YoinFain/KM6OMNCPrNiPgmfV15MCCyE7
	 uwTPQAffUbu5Gs+IQxq2Pq0e7Eh11j/GuP/DBk/gpUvEssUjHTzKKQpYYHLlB5gJ0dvS+
	 qp0YicRyTB78+ts8tM0E5c6dcNPhDND3810qxgKJI4vCg7sOgYiH7Weewu16rOZwaTOLk
	 ueqxWydujpj+DTYRKeWWZc7+/6CXm6TV3tDet0yCrx1O0iZ0390jtIy6Jy53ALki/sg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790596249;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CIfH6hjHASAe/su9nWyhchaXn7vktpZrqb9+ZNfYCKw=;
	b=Yu3uCKq6xQD2LyyXiT9E4xJOyzUKzkOAzcOVeJ8/I1KVfGDWijF5jT3cEJmzCNETsyWU
	 hOxTwDLTU1uiHDF96cSSXWk0KDmBzpsYeXgtrNGeoCCmSdYtFVFDB+NiDrRiswXNiBOzK
	 2ZAwNVRA+zkQ5cwyoyX6xNhomiWnRAgpFi7Z1pIRhI8KP31xiWQGuYUx/5waTfrwoCW6h
	 RUzh0Sek1B16nEwpAj/KpJefi7CLUf+cepsgyW9buSZzVl8gdtaP//aK02ZNnNUR5SJNi
	 NUi5v6quFVvr4F+90bPvH0B9STKP0uqjWkFqfbqfCKGL/uNv8UqMYHIfv6xzEYtDYGg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790596249;
	bh=CIfH6hjHASAe/su9nWyhchaXn7vktpZrqb9+ZNfYCKw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A5ht65usLf+Ah7iT7FIDagCQZQz3sFI369pPPlFRfzDE2Wq8Wf0iKFzZEnks5BRqQ
	 GaRkVc9OWpYwoJJIdcVUBXP2DE9OFlvNypu7/TH/fNvbGiSglEAt2i+HEvdb3ZGtpF
	 ZF3LlVagkqfd4CdMHMneOebrhv3wr14ZGf1k22H1leXZbuzwVb+3ZrhqK/1JE5qaOr
	 sbt2vYwTGfEuIoeNqST05tee0D685qWQIImq0+nWsVEhZp0PB3USYDtYY4DRWhuLQx
	 5om9ALUkg3JIHBO0Q+S3RKPirfKx04s7oplr8ijGMGeKBU/DQ6A/DqZxT8Cn4bVuqZ
	 L2wniLxlanvlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 094D580D6E;
	Mon, 28 Sep 2026 11:50:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4CB783D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:50:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32AC060631
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:50:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iyDavhGB5-8B for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 11:50:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 81871605EE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790596247;
 b=BtvTDmxYnoqZ3E3aNbkpV14F98bgb2AUVyzlPjmQeqn3er3Ep2kza+pHChs2EtHHY3ol
 kqITUGW1SnzXwpwMvuB82pJ85qnEEpbAzMZEY5kdkERfvvJh13jpUaRGX1YOFzlzZNi7f
 k9mh/Vy3UDa37Ow6orJnhlW7Y1SAdZePzy2hRcoQz8NgQt6mBNgmjjFnpHaClckWTC3MQ
 q3Q2y31ZiBrZBz99oVdX/zi/2BvcfXJaeboh2wnPFeG+ckd0exnbTFSYDne7Ti6nr72oA
 1bWb9AUQ+GIe+KHZ8n/kjd8OXrEBphl9+UEAT1ngRn2LTs9aHq10yUmL6opvbzqiYSQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790596247;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/LMQ+6pylVIU8i2yXVz+9UyvfNDGdcgZv2VNDbJvpAc=;
 b=OBL4ro91msKDNE2Mcbu3S29OsLoYB0U2qz4gebMM08wKoUc9rO8C8J1LX/YSkfkSBqhU
 inCpi2EhVDzBJG6L4MFwFC+IDHG+7g9siIymesaYu7cZpeduXK645Bqa6/cR5W599GUFw
 dd9pgwH9sHtwTf4tTSohUBBLyls7nH/7HKgy2g3bGxgywoHF7tUlRiKRh2RKMdwBKYd++
 i+Wg+pvXMmyBf8JiICHOOAdZFivTDbZKbwZgJ0LXYoZT16367/Is985LXkccRIqnEisyT
 GpBNUVR8+mDsbqLa8HuyGuVqUZzxrwShjmDG4WVpCHjmmxpvvqyfSkXl3YVMidk2Mng==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81871605EE
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 11:50:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32D139830F; Mon, 28 Sep 2026 11:49:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Sep 2026 13:50:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0edc67470bd781477d0cbf0269cc608b7feaf32f
X-Git-Newrev: a9d4e45d9590c9358e42454fc8c3be5bddccfff2
X-Patchwork-Hint: ignore
Message-Id: <20260928114935.32D139830F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsnmp: fix build with OpenSSL
 4.0.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9d4e45d9590c9358e42454fc8c3be5bddccfff2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch | 99 ++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch b/package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch
new file mode 100644
index 0000000000..e92dffff02
--- /dev/null
+++ b/package/netsnmp/0002-libsnmp-Fix-OpenSSL-4-build.patch
@@ -0,0 +1,99 @@
+From 1c70efc4334629ba278ea75a071d4dbabc198df8 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Fri, 12 Jun 2026 13:52:20 +0200
+Subject: [PATCH] libsnmp: Fix OpenSSL 4 build
+
+[ bvanassche: edited patch description and fixed OS/X build ]
+Fixes: https://github.com/net-snmp/net-snmp/pull/1101
+
+Upstream: https://github.com/net-snmp/net-snmp/commit/66736ece08dc2b4050acaf234e6959d21c89cb02
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ snmplib/snmp_openssl.c | 39 ++++++++++++++++++++++-----------------
+ 1 file changed, 22 insertions(+), 17 deletions(-)
+
+diff --git a/snmplib/snmp_openssl.c b/snmplib/snmp_openssl.c
+index 4471a7a9d3..0bd1a65882 100644
+--- a/snmplib/snmp_openssl.c
++++ b/snmplib/snmp_openssl.c
+@@ -234,6 +234,7 @@ void
+ netsnmp_openssl_cert_dump_names(X509 *ocert)
+ {
+     int              i, onid;
++    int              oname_value_type;
+     X509_NAME_ENTRY *oname_entry;
+     ASN1_STRING     *oname_value;
+     X509_NAME       *osubj_name;
+@@ -252,8 +253,9 @@ netsnmp_openssl_cert_dump_names(X509 *ocert)
+         oname_entry = X509_NAME_get_entry(osubj_name, i);
+         netsnmp_assert(NULL != oname_entry);
+         oname_value = X509_NAME_ENTRY_get_data(oname_entry);
++        oname_value_type = ASN1_STRING_type(oname_value);
+ 
+-        if (oname_value->type != V_ASN1_PRINTABLESTRING)
++        if (oname_value_type != V_ASN1_PRINTABLESTRING)
+             continue;
+ 
+         /** get NID */
+@@ -268,7 +270,7 @@ netsnmp_openssl_cert_dump_names(X509 *ocert)
+ 
+         DEBUGMSGT(("9:cert:dump:names",
+                    "[%02d] NID type %d, ASN type %d\n", i, onid,
+-                   oname_value->type));
++                   oname_value_type));
+         DEBUGMSGT(("9:cert:dump:names", "%s/%s: '%s'\n", prefix_long,
+                    prefix_short, ASN1_STRING_get0_data(oname_value)));
+     }
+@@ -433,30 +435,33 @@ _extract_oname(const GENERAL_NAME *oname)
+                 rtn = strdup(buf);
+             break;
+ 
+-        case GEN_IPADD:
+-            if (oname->d.iPAddress->length == 4) {
+-                sprintf(ipbuf, "%d.%d.%d.%d", oname->d.iPAddress->data[0],
+-                        oname->d.iPAddress->data[1],
+-                        oname->d.iPAddress->data[2],
+-                        oname->d.iPAddress->data[3]);
++        case GEN_IPADD: {
++            const int iplen = ASN1_STRING_length(oname->d.iPAddress);
++            const unsigned char *const ipdata =
++                ASN1_STRING_get0_data(oname->d.iPAddress);
++
++            if (iplen == 4) {
++                sprintf(ipbuf, "%d.%d.%d.%d", ipdata[0],
++                        ipdata[1],
++                        ipdata[2],
++                        ipdata[3]);
+                 rtn = strdup(ipbuf);
+-            }
+-            else if ((oname->d.iPAddress->length == 16) ||
+-                     (oname->d.iPAddress->length == 20)) {
++            } else if (iplen == 16 || iplen == 20) {
+                 char *pos = ipbuf;
+                 int   j;
+-                for(j = 0; j < oname->d.iPAddress->length; ++j) {
+-                    *pos++ = VAL2HEX(oname->d.iPAddress->data[j]);
++
++                for (j = 0; j < iplen; ++j) {
++                    *pos++ = VAL2HEX(ipdata[j]);
+                     *pos++ = ':';
+                 }
+                 *pos = '\0';
+                 rtn = strdup(ipbuf);
+-            }
+-            else
++            } else {
+                 NETSNMP_LOGONCE((LOG_WARNING, "unexpected ip addr length %d\n",
+-                       oname->d.iPAddress->length));
+-
++                       iplen));
++            }
+             break;
++        }
+         default:
+             DEBUGMSGT(("openssl:cert:san", "unknown/unsupported type %d\n",
+                        oname->type));
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
