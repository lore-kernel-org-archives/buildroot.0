Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48319C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 06:49:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4114403C9;
	Mon, 31 Jul 2023 06:49:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4114403C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6vXPZ2a1LADN; Mon, 31 Jul 2023 06:49:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 14689402DC;
	Mon, 31 Jul 2023 06:49:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14689402DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBE7B1BF3F2
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 06:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADE2C40940
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 06:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADE2C40940
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BvDjol7PQz0Z for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 06:49:33 +0000 (UTC)
X-Greylist: delayed 2425 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 31 Jul 2023 06:49:31 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F324C40933
Received: from fallback16.i.mail.ru (fallback16.i.mail.ru [79.137.243.71])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F324C40933
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 06:49:31 +0000 (UTC)
Received: from [10.161.55.49] (port=52668 helo=smtpng1.i.mail.ru)
 by fallback16.i.mail.ru with esmtp (envelope-from <fido_max@inbox.ru>)
 id 1qQM5X-00Epp8-RG
 for buildroot@buildroot.org; Mon, 31 Jul 2023 09:09:03 +0300
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
 id 1qQM5N-0004yI-NJ; Mon, 31 Jul 2023 09:08:54 +0300
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 09:08:47 +0300
Message-Id: <20230731060847.25665-1-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailru-Src: smtp
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD920919EE866B1AD243D6E4888BA110515B2490C5D3E001F4E00894C459B0CD1B924D763B45DAC42C7B217638881204D08253F0E9A10E72B12838627A7128B43D1
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75CCA5FD4E6ACD987EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379BF04B24BEB7B2D58638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D80BFC1CEBEDC8FCA79BFAB41CA5814B526F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE74A95F4E53E8DCE969FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18E5D25F19253116ADD2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8B406C66621D3021AFA471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249B372FE9A2E580EFC725E5C173C3A84C3C74813BC7F81EC8435872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-C1DE0DAB: 0D63561A33F958A586C0B6D1AE2344E5F7974B233BCFE3417BB7B6934A214694F87CCE6106E1FC07E67D4AC08A07B9B013BDA61BF53F5E1D9C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A091D471462564A2E19CB5012B2E24CD356
X-C8649E89: 1C3962B70DF3F0ADE00A9FD3E00BEEDF77DD89D51EBB7742D3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF4D5588E701E2AF737882A8C9DA5FDE8B1964D9FA0D571D0B556E4126AFF222FF265F63FF884E79B3337391BE08E8D56E56E010EB3F8A88216FC8876F7071B38040B08DDBC5CE87D002C26D483E81D6BEEB84411BD425175970A7FB4ED9620804ADE12199CE9660BE
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojJslAqQEzemsSBwNFCux1OQ==
X-Mailru-Sender: 689FA8AB762F73930F533AC2B33E986B3369D15B082E93573F7ED17D7FD8DD2B98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-7564579A: 646B95376F6C166E
X-77F55803: 6242723A09DB00B4A38953B6848CF8DB06702C87FFD4F486B2453A25CCE322A468F3CF0E9FE49B6943608B47A4DED820906DAF92F1CFF1B86A1BE785831DEC7F4C4B93087815CE4D
X-7FA49CB5: 0D63561A33F958A55C4886108C4D7CD787654C623F4B69AB5FFFDFC1FC898D91CACD7DF95DA8FC8BD5E8D9A59859A8B6A096F61ED9298604
X-87b9d050: 1
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5xhPKz0ZEsZ5k6NOOPWz5QAiZSCXKGQRq3/7KxbCLSB2ESzQkaOXqCBFZPLWFrEGlV1shfWe2EVcxl5toh0c/aCGOghz/frdRhzMe95NxDFd+XxdZzrZy25osTUWKhz2FA==
X-Mailru-MI: C000000000000800
X-Mras: Ok
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=iDmaOMd8+QPcRJ5a8qqoCcSlTVte7zRGOOE2DZqNz/w=; 
 t=1690786172;x=1690876172; 
 b=r7exYGd9m+/Ynzndup7txlbJgUf1NlOInj4jEEzwgYf1YbWcY/poe57HuZbBPc9O1ZB3n7Y061pSuHxkO/+Or09fVBDABYAlyFN0eGYJLbUnjZa37C0rbpdIbXbjwsilIGgJJ7A8I3fn0G86nfltdWrU5b/POu+sWiEIgOXdxZTs+aYThQ5dnFaV2GjcnmK6kiYb+QAyjfzefRI3j8cbH34VXhwRF2uzdZIwm6Brc//YeeFyf0JItGp1g2v7gppRvWSEoZD+4PLeIwcOIHl5VrS3NGgaLvF3C1FHc70MjrHtBNqTLFYdmUtnbIcD9O6HaP0kFSuJgT3OLAqC94x9Ig==;
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=inbox.ru; s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=iDmaOMd8+QPcRJ5a8qqoCcSlTVte7zRGOOE2DZqNz/w=; 
 t=1690783743;x=1690873743; 
 b=PTe9e68Du/h4h9mNzhf7qPDqpComFSofQ5OaTdXmoRt0RTrB9mqDL0TyJ+uE0ysyYcy9I68+TEL7/n3/cbFXAATFB3QUoJ1q8XebRhfWCIQfxxNcuPE+dYlPqoCZmN7N/9zGheu7iVBTpSmYKmRJTKxxDS1k8f16ShQ18itZ4vfYfRFdJ7Nb002+qkJ7ZUvo4TdVsczqO9UgptM4girs7DsGNqbDl+9mUUi1v4J4UaIF13HSdajFHJJYT5dzERnmrU7vVvpUHvhW9JZ4Dt5+B9kN8tWlJlvSW2ufetwMWrywj4K4aF9pCywRZD64moq4bG0VIWueSl9WtRvdjHTwgQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=r7exYGd9; 
 dkim=pass (2048-bit key) header.d=inbox.ru header.i=@inbox.ru
 header.a=rsa-sha256 header.s=mail4 header.b=PTe9e68D
Subject: [Buildroot] [PATCH 1/1] package/timescaledb: bump version to 2.11.1
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
From: Maxim Kochetkov via buildroot <buildroot@buildroot.org>
Reply-To: Maxim Kochetkov <fido_max@inbox.ru>
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://github.com/timescale/timescaledb/blob/2.11.1/CHANGELOG.md

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 package/timescaledb/timescaledb.hash | 2 +-
 package/timescaledb/timescaledb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/timescaledb/timescaledb.hash b/package/timescaledb/timescaledb.hash
index 22705cfb16..aa8b3ac497 100644
--- a/package/timescaledb/timescaledb.hash
+++ b/package/timescaledb/timescaledb.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  96baf19f502387d2129324032407da6405800de8627bfa556bfd3a7b277287be  timescaledb-2.11.0.tar.gz
+sha256  06a653881dd2460a9c9007dd823be8827ef83fae90a4b628d0b0d5066f60f496  timescaledb-2.11.1.tar.gz
 sha256  0378e0948feefd85f579319c74d6e2b671194037f550c7176ef26649d94c895b  LICENSE
diff --git a/package/timescaledb/timescaledb.mk b/package/timescaledb/timescaledb.mk
index 3356094cb0..a32641e09d 100644
--- a/package/timescaledb/timescaledb.mk
+++ b/package/timescaledb/timescaledb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TIMESCALEDB_VERSION = 2.11.0
+TIMESCALEDB_VERSION = 2.11.1
 TIMESCALEDB_SITE = $(call github,timescale,timescaledb,$(TIMESCALEDB_VERSION))
 TIMESCALEDB_LICENSE = Apache-2.0
 TIMESCALEDB_LICENSE_FILES = LICENSE
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
