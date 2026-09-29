Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EDACA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E28A810BE;
	Tue, 29 Sep 2026 18:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XCF_-WmVaMYp; Tue, 29 Sep 2026 18:43:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2E5AC8084D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707408;
	b=OoFfNP5OLrUTVj3q3mF2pbmAn3YZ83sotU9UDmvqD/cmaDpntKbwGuhmksq9Ic2u7dzS
	 0f29OdE+3hntEkfLPv92bz07FBz9hIAyKJ7hMyl43G0AOCGa1J2dr0Fxe8d4cYyKL2Aie
	 sHJyliqV626XT7JD/O5al00Y9S/cPaIZQ0zr8DNlUf9Xcckw2g3/wy2pr5XmKt5ex++jT
	 gbunxSiZKMCZx8XfSrrcoNTMf8B3Q9OOyJrIJ/MwdO/VSf37fYd/STrcF6Xe/a6VTkbV+
	 9VJmcLKvN6lz0oDSR9LhSeAsOsC1G8Pr/UWBzY04c/0WrnM0+xxr+Hm9GUEJodBPEOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707408;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PeqDBmhJc2A3az0SecpZF71MlkzI6GC+pzltDKJRPL4=;
	b=nUf5t1Vq50UiemXnFZjekKPq185jRtw/AJW/gE5ZcmdXAi45rSssMflSk4ZZENuprfbU
	 EZRTXddRcMS1+yUt48qXb2A0eAh7ooxhr6F2aoOfBszEEeeXf12dO9d3r36D5Ib87y1lg
	 X8BsGbm335gSA33Oe42wnwIoVDTUJvjt4AZltP0giY6EzB1nMBiRdvKDxMIcsDkLVvQPo
	 NkEAImfOhLTOk7J7AZceS7RbentG40GoPEop1JbaPlW+Y+dG6bQEkLbNUM758lul9ROCL
	 A2u6GBJDvZJdTxmY841AXxTaswHsL0013kjm0T6aAwTFco5UjMTnRtknDqDE/AXMEaw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707408;
	bh=PeqDBmhJc2A3az0SecpZF71MlkzI6GC+pzltDKJRPL4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g3sZrPVN2Od6GSYrW46hk8fBIQhxNpJ45QniWAhMtDLaGzJYyiMMdnSDQ6EWNHciX
	 plG/xWi25QlxWr5Vy35uBWyNs+3L9VBIMqeez3Rw3kZ46khWMwHIamEC1DYadfmlcF
	 pwPjyzRAMcGdvN4fflO5rTciMWN/XoVmXuwT4xF9eBCOI9vd/BcdfOqKLMJvle1Yi/
	 A3hGaEAWwrKpEnkLEt5euX7x0sHBbZnXAhm/DLSEn7WGHGE/hZp9d+1mP6X88D+/x4
	 Xjy0nP26SsQOBsetwIkkZ7JxFH7O3WCgjIphVCXOajpYVng4ReK8LKfb+l+OGODGab
	 Hm/JJ75VW95gA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E5AC8084D;
	Tue, 29 Sep 2026 18:43:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B16B3D8
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D0836082B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:43:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0prq5qExdqQ8 for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:43:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5BD9C6082A
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707405;
 b=fWvsqdEEpkyTFpbxOONKKXLfBTY/4vqOIMFpTL/NqkFQJGd+ddB2n4U1X5Tbgr/KnJkF
 /MXUVdhGksQZfwbbfljjrrVcRGWvYG6LumVr+6voH6S2FsAmn/fg+YQ8WTbxxyZNzu04D
 w2I0Vt9KhD8SM0uEFQ6alBnd9o9t09NRkQPIEAoHbLe1QjgmbGZKbMr9kzr7Iipzqz+iv
 TrsLUdPsV3EZ6z0ogBfMGLglbVdD7tsho/KgU9boA4iqmIst6RT810+F7HiaUmec0wS7z
 Xkqggwl19Ky0EVzV7MKZoAiADqJSSM2ifDUBLWqTfyTyveJfg0jB8uSLsv7Q//8Q8cw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707405;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=cym8RRhSwvDZxQAXzHSuynuMOEOPoHuZiAINFnex+GA=;
 b=PKY1eBaIY45rUqRTYzNT6uE90hWM35Bfp/Rr66vFk5Vdwp/WsIch/LwMpmwj2arm5mgi
 bjJ0AWqxcvveUFF6rxscaJiUjECbJTWhBxrpUIKsDLTpBHP3NxKFUfpf69scze4yXLmhr
 RyETXMoSwO9DFa5BNDTA39ifxfgyZ23yLsJZY0iqRNAHZsiwchIs0/pJ/3t2JVGZkSLxA
 5K4zn6nIR2saeg0vULSyePSPmvlas1b9UsO6lMymKujp4g24Wx9uNiP4bd5ud1KhKmm6r
 /J/T5jpEr2J/9BymdS7Z8ujTd035bqbjngbnk2ap/Xuan7HJvDJmg1uRK9jWRWlyCEg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=hLmUjhOW; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=hLmUjhOW
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BD9C6082A
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707027;
 bh=cym8RRhSwvDZxQAXzHSuynuMOEOPoHuZiAINFnex+GA=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=hLmUjhOW0TQlrr4h8Mhb/78zTaM54SZJtQ8egGybM8HkxMYU/sZmhP+096cj9Mjw7
 jlFa/ETh2+fpS6YYsd4W/dcrD5jHhpSG9zAVVZb+1ZLgh7tkmDLnrukzoppqQr+Olt
 MLN1hfVnlIo1mR2m0pZBCse1DwjurDbD95TWF9e8e5ET08Dz6N5NLOwlX2EIL04qyt
 DqWgo46ZASHN6fkR84sEKz/vOoODgLvuNgtmJpshLGbE766Ch/0ZF3/2m80o8UwbTe
 evdttpzgk0VDDiyhnWtd8LcESRkh1gMwBl6FunUAxuhmA7lFZ5qONP4+/bJI36s9xp
 QzqgSiTRUzvEg==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 2dtcEopxgOcZc3X3qVw6OVH3vfqIuC4Ub6G6wG/p+ngXdNxXk4DSYY3bQSjl1cujVAyaGuwkhL7
 S1y260JWY/sEicKwk5pO7OuUrNTTyubD1+Qf5gnysbMkHEN60D4pn6AGPhxdITLMlRlEkW9OpnZ
 89/7RY8pN1nm10eerfME/YLcWuhxWOo+Gm3yEW7eh5GqoJxfznwVWfxMnE0LtyN+R1tnamg4EC0
 UdJfdXXAh6xKt/3suubt4sHGyxV4Pn1L0Nm1LqsHeeABZH15Ws+cOxsFFVPif5WKncaHo/qXpjb
 6qhUPPmDcT2E2R2L0ZrdwHw2btgqYuQq5rE06lG8GScaeZRvWt4Qhrwr+xBbdHBcKwluALkFeZR
 9JW8zzBWxZ/4vcv8M7ewyb9EGOzby7RY+ev3Oq8aCCXJrCpINNresNJqUTBxiY6BnZlF3u+f5/y
 0Nte7SVJF+vzG7/UAMiArzj2/TcqDyKeT4x+fFgZ22859EsYxb4Apngf9m19KpSlsOU9AFAQfZP
 Yfr6HgeRzBt/uz4dQm9dkTWnBrh8DA/vBv5jTkjfwiBFDcuvA8gTziTTfCwn2hJwOcE8kJUZmOQ
 dGNygFUg/j0FrfH0rfCPX5BOse0HODW9Y9k0djda3Zw3esAhRg==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BC77AA4C47D6
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgh-000000006Jn-0qX4
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:23 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:25 +0200
Message-ID: <20260929183607.1849293-27-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v7 26/66] package/resiprocate: security bump
 version to 1.14.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/resiprocate/resiprocate/releases/tag/resiprocate-1.14.0

Fixes the following security problems:

Use CSPRNG for security-sensitive SIP/STUN/TURN tokens (CWE-338)
    Use crypto RNG when generating certificates and nonce
    Use crypto RNG to generate various IDs that are supposed to be unique
    Improve transaction ID uniqueness
Authenticate STUN Binding responses (CWE-345)
Add Digest Authentication Support for SHA256 and SHA512/256 algorithms
Add new DigestStream class, capable of MD5, SHA1, SHA256, SHA512 and SHA512/256 hash algorithms
TLS handshake fixes
    Avoid using undefined client verification mode in TLS connection
    Disable TLS compression by default
    Correct TLS logging
Allow applications to get TLS connection/handshake errors
Propagate SSL Certificate Validation errors to ConnectionTerminated event/message
Cleanup SecurityAttributes
WinSecurity: expand constructors to allow setting of defaultPrivateKeyPassPhrase and DHParamsFilename
WinSecurity: perform normal preload process so that domain certificates can be loaded

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/resiprocate/resiprocate.hash | 2 +-
 package/resiprocate/resiprocate.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/resiprocate/resiprocate.hash b/package/resiprocate/resiprocate.hash
index 93a7131141..be09ac4624 100644
--- a/package/resiprocate/resiprocate.hash
+++ b/package/resiprocate/resiprocate.hash
@@ -1,3 +1,3 @@
 # Locally Computed
-sha256  059fda8f63c456fd61130d468a67655cfeafb5ba8ff5c1d0a55dc383f83e4fba  resiprocate-1.13.2.tar.gz
+sha256  f132e4d0fcae0c155f91e5dad608a9985e199e4e3c09b6029a70b1b3b6d0b156  resiprocate-1.14.0.tar.gz
 sha256  8c93f7d6085486e9d24b7c6f9c662d92e0b65571003ad15d0827bb99fd924261  LICENSE.md
diff --git a/package/resiprocate/resiprocate.mk b/package/resiprocate/resiprocate.mk
index ab8299302a..4af7bb7e76 100644
--- a/package/resiprocate/resiprocate.mk
+++ b/package/resiprocate/resiprocate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RESIPROCATE_VERSION = 1.13.2
+RESIPROCATE_VERSION = 1.14.0
 RESIPROCATE_SITE = $(call github,resiprocate,resiprocate,resiprocate-$(RESIPROCATE_VERSION))
 RESIPROCATE_LICENSE = VSL-1.0, BSD-3-Clause
 RESIPROCATE_LICENSE_FILES = LICENSE.md
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
