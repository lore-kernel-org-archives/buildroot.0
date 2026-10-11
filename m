Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97553CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 10:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DD6B80EDB;
	Sun, 11 Oct 2026 10:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZhPKF6wyclX; Sun, 11 Oct 2026 10:17:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 622DB80F3A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791713826;
	b=Kqz3eJTPRQnV02OYewbE1PmltZZlcr5cUlW8gfMfQVDn6R8Uz9PV6x+cB32ZbG0t6eKh
	 ALQ39+BD6IHX4itqjesvh1YnielbbCUU7RazAvHPCp7APdR0kxwINhjbZBjnyAz3jHf5J
	 kyOasgKAfXAlE3ePXpPEQJE+lHNaeYSmO2kL2QEpHgt8zOLjM5CP530NHZjTkUtWo1E42
	 XEFLEZgRG6ttjM3FWylePx0o6zC1zEowFtg+OCZLrzdu8MLGQniO7fyrX7wHi2qAHBqBo
	 BycH6q4oYvpLilnAQCyY/excO7V3fomT4Wn4VWjBMJMEbgE4IbMuGkJ3VhZ2biaxIZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791713826;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Errors-To:Sender;
	bh=Vf0jBy+zbYgnN5V2WAa1/ZaXTLtcO/nwaIJNArtzb2U=;
	b=G+wgJOQIhAEam7W/xkEk3K2GvbfXPrWcWxc4V8O3Em9iVFfK6VbdPxQZZ7hpvl/scOuC
	 KYt9wTfSEzZCW+GcfufFaB9mR6R77Kw3znEG+G6IExOKcK7hvYEsFBg0WFLZmsj1Uy23t
	 ip93DU+wbu6WMMMuW1Hq+taSzN+Gsigt16oydiGqW7BbUGTKYb76FnnCQIp+5XERf3xPF
	 XMYKcPy6I1Z9e1ge6gyiaQnMwRtmGVHSxTbvPJ/g2ExhLBvRw8U+C66bSFnu+m/+DLp1r
	 w4ZQ42OAP9/FwWRMBRT3zvd4jaFR1H/yS3calBSru/xnEamhhg/Phunh2Gm2bFqHdWQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791713826;
	bh=Vf0jBy+zbYgnN5V2WAa1/ZaXTLtcO/nwaIJNArtzb2U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jOBjwWum+6ZazSADgM9R1qvvYz5U05bnjt4aShqgV9CHSpF8dqeeyEzFSPrxmId8U
	 5DzG2bBAsDYjf7X6e3I2QyLPDaHp6ydBWDydpUxP1Q3rn7fLFpV1MSDw2YgOW0urAa
	 knuo2+Dy5+fETiMGv8zCuyZqYsO9XwXMQOx6Mq4RmryZ65q8E7ClcQMuBPWZjFURuF
	 kQUge+7WiL8BhrpIhHAaspJTWlORsCiLhDranVgdz984pIM/W2cAfoHeTLmUOlybcL
	 Tsh9T02HESLBWjix1KhyoD8uSlliRPJQ8YxpF72y5a7UcXEiABuc73c/iy5ImNwvFZ
	 Bs1+mA9mCg9/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 622DB80F3A;
	Sun, 11 Oct 2026 10:17:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E183F235
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7B7E60616
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BWPp82DLlym for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 10:17:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DEED160611
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791713823;
 b=rQXbjB51+UfcC9/6FJzqGmKASIZ7fC0vt/lz2+KL06/EE1D9RaPgm6dXzwUXP65iHnSV
 8QRLZ7eU/io9Dzmg0tj5b9h34vK933GqU1kSCVrhd9TpKhFjkYzoY7Y+Oisiozfxi4NMW
 qqb3xOf5E6SjFMIR0KsmRr0Ibuvv+PLvC2KklzdQeurRMOYXT65szdff7EH0yC9W+R56f
 322c74ylpW1yqMfv1oW2b9zeBj0KsAZxt6mpcS5A0sVt2xOaAlSh9svOoh1OgUrZnynpb
 GmR7ucii2VTWd6ptl9BR1QhpNxWEH4pM0uvgOQdMoSRVRdGsniTtClNNGYAVYgOHQrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791713823;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ofg6W+TMSErw6O26j+/XBVfl6CURHaipc8rEUWhS0NM=;
 b=OvVEgOwf/nOLeXu2ruUKnngMzZKGBDx4VOsNnjK6wVXhHKDyjEY4PRtpKZpWOVtz6KJG
 QHOjcDq+Ca6INLTSGpk4QWHCTqEQzXVOH+i+m8sNdz9W/TmWEw7hnGyVzojRxjnWeIR4u
 zBL4rMJw4WWOWjKts38WNOh/08x2EtTviohR4euAw1iUPWosOzGwIV4BzAvdThpn2G7lL
 /M5O+gklMj6nOrTxRhYlUnjhQL+7GKO1YNnfZJYglgFKWyQf/7Jox7c0dOmmf/uCWzi3l
 YqjPCw0P1xsB48RlJybpOR4NXfiQm9zhHYsDzT/ouvQPYEOUsbmPxPd0o3kae4rezPQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEED160611
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 10:17:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F88C93619; Sun, 11 Oct 2026 10:15:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 12:16:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 48e4bab464ccc6c829c57bf01482c2dc29af4301
X-Git-Newrev: bd4b90e81be0c47b324b50b81e0bfc9b38a5b99b
X-Patchwork-Hint: ignore
Message-Id: <20261011101545.3F88C93619@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cramjam: new package
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8662583519701871780=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8662583519701871780==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bd4b90e81be0c47b324b50b81e0bfc9b38a5b99b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add cramjam, a python bindings to de/compression algorithms.
It is needed by python-snappy package in order to bump the version.

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
[Peter: add BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS dependency, drop
        upstream tarball hash.
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                 |  3 +++
 package/Config.in                          |  1 +
 package/python-cramjam/Config.in           |  9 +++++++++
 package/python-cramjam/python-cramjam.hash |  3 +++
 package/python-cramjam/python-cramjam.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 657264a672..01d98f8698 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1146,6 +1146,9 @@ F:	support/testing/tests/package/test_nftables.py
 F:	support/testing/tests/package/test_python_networkmanager_goi.py
 F:	support/testing/tests/package/test_python_pyroute2.py
 
+N:	Flaviu Nistor <flaviu.nistor@gmail.com>
+F:	package/python-cramjam/
+
 N:	Flávio Tapajós <flavio.tapajos@newtesc.com.br>
 F:	configs/asus_tinker-s_rk3288_defconfig
 F:	board/asus/tinker-s/
diff --git a/package/Config.in b/package/Config.in
index 5773f33316..740872a0d2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1072,6 +1072,7 @@ menu "External python modules"
 	source "package/python-construct/Config.in"
 	source "package/python-contourpy/Config.in"
 	source "package/python-couchdb/Config.in"
+	source "package/python-cramjam/Config.in"
 	source "package/python-crayons/Config.in"
 	source "package/python-crc/Config.in"
 	source "package/python-crc16/Config.in"
diff --git a/package/python-cramjam/Config.in b/package/python-cramjam/Config.in
new file mode 100644
index 0000000000..730a47cdf8
--- /dev/null
+++ b/package/python-cramjam/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_CRAMJAM
+	bool "python-cramjam"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	help
+	  Python bindings to de/compression algorithms in Rust.
+	  Allows for using algorithms such as Snappy, without any
+	  system or other python dependencies.
+
+	  https://pypi.org/project/cramjam
diff --git a/package/python-cramjam/python-cramjam.hash b/package/python-cramjam/python-cramjam.hash
new file mode 100644
index 0000000000..5459d63f16
--- /dev/null
+++ b/package/python-cramjam/python-cramjam.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256 checksums
+sha256  10892f279948fe9a2dd5f2c559ef78aae1ebf4b5d5825e1eaf68b03787fde402  python-cramjam-2.11.0-cargo6.tar.gz
+sha256  b4f882bfc80d27a3732789bd883a8c1d342e8ffea7f622a71b3dfded834205ff  LICENSE
diff --git a/package/python-cramjam/python-cramjam.mk b/package/python-cramjam/python-cramjam.mk
new file mode 100644
index 0000000000..e1e060bfba
--- /dev/null
+++ b/package/python-cramjam/python-cramjam.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cramjam
+#
+################################################################################
+
+PYTHON_CRAMJAM_VERSION = 2.11.0
+PYTHON_CRAMJAM_SITE = $(call github,milesgranger,cramjam,v$(PYTHON_CRAMJAM_VERSION))
+PYTHON_CRAMJAM_SETUP_TYPE = maturin
+PYTHON_CRAMJAM_LICENSE = MIT
+PYTHON_CRAMJAM_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
+$(eval $(host-python-package))

--===============8662583519701871780==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8662583519701871780==--
