Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7BE5CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:58:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B436681756;
	Sat,  3 Oct 2026 13:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xlq1q7SLktrp; Sat,  3 Oct 2026 13:58:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9B15E8179A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791035885;
	b=BolBdmMyo5b1k9sniP1/iAtRMIolZeVpmlJeRACIIHNIh40tq+4MQ2S7UUuXIE6C2Zaj
	 KYbKsyPjZgwfwV5ErQ93Uk2P3rahcjZSvcFPcLCZuWxHqJINKBDG1Aah0hT12bhLMw1Zo
	 J4BAgNWz2NYh1uXY3ML5quqsEdld8uUin/9k56wwOHffQ9r0pWjPhbQ/0wC+VZUfHm0FJ
	 C5NyXsESGMYOUCDvEMibPSNoLFS00UWrqx4iec1PPfCGZKZhJf87hkEu1MVlnE6JCI8T/
	 b9z6EK4vpj+nuf2nESq4IWFelaMq1OmPYtWXqay1I5Dm4SPUZCr4dQwlB8XCidIeuEQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791035885;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=vhdLn8BPhF1S8L+nUE8SAbi0DTDJtmTjjOZIYHaX6Xo=;
	b=lTcGNGOTXH3803cJmTHOB4mxi8dzDO6FqXF8dVSATaOxieMOZHO0w0GYpezUo8h7jQ2d
	 Zy3W0vVS/27plZ6OfziXNoM1/XgacakHGRiDsFuexkgTCOGHJVvfUIyVp7LZFyihRfHBT
	 7WdFGWppmPMtdEv3ZxVVAx6QzcsXRg0/rknbLEwRK426GDkC6YeCqQz4NihRMtT/efd1c
	 Uv3AzR94vneMdb9Xv+0DYKAU34C/t0MJgTNvD/SVC+o9fHBXQo2CHTQ0WmlO929YA6FGQ
	 NULkDbs4m8fJyKrNiz6Nqa5nboUCS6XpId401mZlsN84YAeHcHbwTnV5JXZCNG0Whug==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791035885;
	bh=vhdLn8BPhF1S8L+nUE8SAbi0DTDJtmTjjOZIYHaX6Xo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cHZ8kSDUfRIU5oaGj8zTo9dpyhol3vy3lfgByy9P4eAvgOcxGiFq6m5wf0115rpF/
	 EQb2q818sloXw8ZQi9B2APVkBKZzLk4Q+RHbEx8Rj5rYLTJxjvNh9Rl8JVVuigrksg
	 Wvixjz7LF9psaIbmV/d2u9ElELvHuGHIZHySpd4ayR1UbuO8d+Qbm8a9+K+r7wBy45
	 arEu+x1PJR5VL0SCnXSA4HXUfm16YwqrarRP1q7IoShwVVRuY8SpaAhMqSbKwZtbM7
	 JXMolUK+EK5ck9FsGxqhnrEjrxhtrwp1rUuNEnhCBKtF6QRZmPfjq+eoQ9uB9ii5il
	 mh0cKcJi50yhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B15E8179A;
	Sat,  3 Oct 2026 13:58:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CBF4CA0F
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B32BD414E2
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCDdkV1gzuEG for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:56:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CD1C1414C9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791035816;
 b=XY9xtHi7RVpWnQi0PKt7T/X/1SphIdLtql3y+acHCF2k9uH9G619AqVhNTHJqpy+ws2G
 QCLY2ImEo6pP45GHdUL/qH13QCZvuoFBXwrRJaHzynN3Ozikj/Hsp8KIH8TBFlEPEAwu4
 dEZlteyCAF4JAnZIYurHE2TfHQS0amdpXFz0BgL+x9VJK1cjs6uWcKVZ8LFcTdaWbYhrz
 CWz+xfAslFtvSiHsRf2PWX6jjHb+NvXJnTK9VvJ2GwHj1j/7ghmhCQwxxSkFCO5MXRyFX
 qOpc8FbgQslAqg74iQji8BeX1S1zeAtfMZJSwDFA0I6V3AF2qFyHD1GR122gsO4HeGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791035816;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=1rlrZTKygLA6MohHQiIlUFo0EDrDYyv+t+F6CpjpqTw=;
 b=YlcTm2ktdPQp9ap6mzS1n2KYqfOr35n5v56eKMpUjzN/bd2nLWJX1NeNF426D0RCUcfm
 lDZqwEf+2nMrNZ6SEuwnCI0JNyxWBBlsCfsRsuhcmAd4HyUQk9n3GfvkQQRvgllRXlget
 9gra4yvBEVB1+JkkKxMUMBG1CHBc0o/4Znuawv9knKi9KiPlGxnj1jI6Gz6PNVQh99sf/
 0Cz9ep9yga6/XBQLtuaq5WwNYFKTXG8pae1g2i2AMFh5n8GpzRquXSCX/Y8NJLYZJZZJI
 NZI2gDqGuxSyF3xfqsz+xcccWBkPOA55kMdsHSymZEnyIxGpGglWTGvf5bf4Tse3opw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD1C1414C9
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:56:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2452288699; Sat,  3 Oct 2026 13:55:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 15:44:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: caf8356f76c5bdea2b9888f732b22032a9a0c5f6
X-Git-Newrev: 3bb3557f667b756f9eed14a161679d0f9306170d
X-Patchwork-Hint: ignore
Message-Id: <20261003135542.2452288699@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-lxml: bump to version 6.1.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/3bb3557f667b756f9eed14a161679d0f9306170d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update license hash due to additional notices for CPython code and
libraries bundled in upstream wheels:
https://github.com/lxml/lxml/commit/fbf0ae1d38d156fbd9de61d8092bc2766f07819f
https://github.com/lxml/lxml/commit/0e9989972a6c430277f962054db9c4cf19ec28c0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-lxml/python-lxml.hash | 6 +++---
 package/python-lxml/python-lxml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-lxml/python-lxml.hash b/package/python-lxml/python-lxml.hash
index a58aa720b5..af8a9ebee6 100644
--- a/package/python-lxml/python-lxml.hash
+++ b/package/python-lxml/python-lxml.hash
@@ -1,8 +1,8 @@
 # md5, sha256 from https://pypi.org/pypi/lxml/json
-md5  ac9a945976227fd854d3e9e034e52ca1  lxml-6.0.2.tar.gz
-sha256  cd79f3367bd74b317dda655dc8fcfa304d9eb6e4fb06b7168c5cf27f96e0cd62  lxml-6.0.2.tar.gz
+md5  15ecfaf666e0a881667005cc96e0a343  lxml-6.1.3.tar.gz
+sha256  45222d94ddd511536f3b2f7d9deae3b2339b4ce0f075f1ca25703b07cad9dd21  lxml-6.1.3.tar.gz
 # Locally computed sha256 checksums
-sha256  41d49dd406aa0e1548a6d5f21a30d6bf638b3cd96eb7289dd348d83ed2e40392  LICENSES.txt
+sha256  388fa99f3bde4447cd5a4cbb114037be026854db6cfe89e112691c1d8abdcf3c  LICENSES.txt
 sha256  69edb445c1335a8312d4c09271847e9956d84f0d9f724d125340cc3fad767b2a  doc/licenses/BSD.txt
 sha256  0497ae8138811ef4466ede653bab7a59feb3d3c14f9ed50fc33a00aeb5bec32e  doc/licenses/elementtree.txt
 sha256  56c5b13f28b78958890c36e3249c34c169041e42ebcfdce8080f3324ba2bf4de  src/lxml/isoschematron/resources/rng/iso-schematron.rng
diff --git a/package/python-lxml/python-lxml.mk b/package/python-lxml/python-lxml.mk
index d12f65dd8c..bd12065d5d 100644
--- a/package/python-lxml/python-lxml.mk
+++ b/package/python-lxml/python-lxml.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_LXML_VERSION = 6.0.2
-PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/aa/88/262177de60548e5a2bfc46ad28232c9e9cbde697bd94132aeb80364675cb
+PYTHON_LXML_VERSION = 6.1.3
+PYTHON_LXML_SITE = https://files.pythonhosted.org/packages/23/ad/28ecd7cb894d172f3c9c80a075eeeb2017ac62e3632cee05a5f9493547eb
 PYTHON_LXML_SOURCE = lxml-$(PYTHON_LXML_VERSION).tar.gz
 
 # Not including the GPL, because it is used only for the test scripts.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
