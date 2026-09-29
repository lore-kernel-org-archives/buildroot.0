Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A14ECA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E7C60854;
	Tue, 29 Sep 2026 18:45:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RctHRbdnK6eK; Tue, 29 Sep 2026 18:45:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 1794460842
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707507;
	b=n5TICKcEgWNmJM+jRNss7dzapfI4GSR+ioJQmSwH3drQr4dzYCljh2Hvam5ABDm6VR70
	 n45sn6Jh9jFBL2aTZAHqb6ac34MUWsVJSAXJsTT/zG1UtJlzq++v2PbC3LenE/CZBl9rU
	 9MSbPuouEeqfbNkLjmiOhpQqbFttyM0CV0Vi71EkJXySqkCppYWKbG6w6SIi8OD+xOJQA
	 dcEEDi4hrBfzSOEgQs2pAIo56jOG/CqtmF3Co3Uk55b66zIoMmCAfplcN2vrfhFUhAsjy
	 1AG6xr4qRJKY9JD8FHPWEkDYFGXhVcffNJbLDSgzRU5iAfzg9GPXsKIEV4uDfSzr7gw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707507;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=k5/1TBEU9xmxur1UfKX5Z7kOYfIaM6xBK0u4VxdW4tY=;
	b=n+rrk+JjoEnQColXfnu2yImOM5nrRfRsn49QKV0EbfovbYqcX8oFuPKQPhlQ3CEPFDRh
	 XjEpk6ZVtDcj0WqbR0VuVIOhbsadC+djCa9v1Q/rjuB54P8BqOACA3/QrYVuWNDdVbQSh
	 ccBU1SiGlh12dlpJUYFgOKi2QO7XT/VGU4ZIn8ok5P8/FWiyUWbB2kAnhHuh0bYWHyY32
	 ijLbps8yQDeeaJtYwQwn0TyWoj9mdifDLc4zpj/B965WOAJkmpBcQsY5vT8yNjgrpgitH
	 sZf4CnJcqtz9bqBML5WKKEqhpiXyaucqUqo83a6Ii1QItNhEq5P5zY/Kh/GS3IS+ZLQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707507;
	bh=k5/1TBEU9xmxur1UfKX5Z7kOYfIaM6xBK0u4VxdW4tY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pbw8eje/Fc7IJXFY4CevVrQxSYQM5mfKrhPLNrVVoSXiqkrSgC0SNslMqlI4Pi7qH
	 d4MVOEuCrE15ku49Rzz5ro1td+xyFMSTgk1Ls4UqNKzxQzvrZldTjShs2nnSwo2/gv
	 YIuVHnFN8MYQtylkPj7nYABhL2aDut/nHAJeaBTu6XmYu7Y5R5gF5C62oyXeRgy1p2
	 yC3ocLbG/Jnqebdm7drVlqqtQl7vZs9cxPjM5mXyFAYDBpNXRvzJVnNijHRrIzRrXP
	 N9QwCDVRg2bEZWQxz2T+fAjdG87uRUVJZ95DVdMYN3fWlhZ25btDGws21WE1Fv2TA/
	 bv45SplgzIyhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1794460842;
	Tue, 29 Sep 2026 18:45:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 78C7714C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5ED354032B
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Di6RR5QmhCUk for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:45:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 70D66400D5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707504;
 b=Uv0MljboVcR/sUKVbP0TipSNf5EjX7xIkNAT7WxQ1TjeD1vyDCxU9mBtnWTNhz8EpCxa
 seFB4jYDCay9FZRcXdsQebsaqcaUicQssln9QUuMc0E+IIvvzp9sEealUDGTTjuPfYxMG
 tJUAxqvpeu5OIXrQzPTFE49ttB+tL9I6QD+W1yBP03DLPZq100ErExyYuuhdp388tvKBd
 3lEsQ4x02/erFbJzZzvCOsMrvnHzxiq/7cpLDSOaErTnLw5YUhx9m/HmKb0ek7uzCD3h8
 M1HKt8j2bGz2wGAPOnl6iSAUy/ARWxXq/7zBBYt77iKTwBpK87ikBOej0h3ypcBLKMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707504;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=VElR+GExYdksvdCjEMluHGHfjY7JxI6fqGCtPvlmO8Q=;
 b=BN6eYEVZ4oTS4otlnNALksoYM9tloOznY9sUXmX2sDh3Yjvczzue33WOyqnwOQwDvhhh
 QFy0tcR+4V/BntsKlYIrhQENXL58A/oQslorPO4arOaiR53MXzmbo0VIYCW3d5UuPClit
 +y4jShluiZVzUaxek6Wgq2D38BZTZfl9qCkL5gyu2J5I8C/rL5c5betr3SfQF4en24S6K
 JQ3NeydXVhSYnvAG5ykSu3Yp42oWkd+Aj1iLMYZLOz3uqqhAPcnULkHDGA8am0zYKXZ39
 lwYYm5ilpONr/dsa5PmRSHAo7vaZQYBoEYN5Qz9i9+glLzLPIZVoAp4tveAuV42hX6Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=gkPoHI5W; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=gkPoHI5W
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 70D66400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707029;
 bh=VElR+GExYdksvdCjEMluHGHfjY7JxI6fqGCtPvlmO8Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gkPoHI5WSZbir0HX7amYqRo3WYmvRvxw/KYfrR1xpYJ5k6LWHDNBuAEaKtkFFgdVo
 Iq1fLQA8gifz1bErhZdJ+o/w7jAsKYL0l9FILCwxwbmKdWM8XC+ygMZGY5FTGhlNU/
 j6+aiy5wHqs5hof5r5Jx55kKFxDHh0zjh+9MmkD8n81JArVE9+swf/Vuk8BJaQqFn7
 K98anpoTqXSfAr0yEXM051o5j1Fsom9I/8Kw2fF/7fBo6Sd72cr6aKJQxHPu3Hlqp6
 Cfj9+uORZ38D707PXlejwjYV54p1TY1nuJpdT+2OM84DPEpigr/w7BoA0uOP8X4v+S
 4telhuW1bcvUA==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 noLNwLjoCsGg9nGo5SRfC+ne1VNpwyc//W+HcQHcZOZwKwEoBOsanbG6XksdfenAC5FfJ+BKYEM
 LivTYea0NaBgGPU2QWE70oDW1IZwZ9b+JvYChs4FgOlznLOUPdvk9Wh1XFEVKwfJiQ0YZ9/l17F
 GgHnUfTN4kJXTbOT9No3lEGUbeDnd7T9bxWD5O32mvkVl1dmJJ6Zyy0LRFhTLf7Pn95mLB0Tor1
 xnUZs/55u4pRXx2erZjXQFOG6VrLMHtVYpM1YkLHiZ5NP0lJwA8TKUJLjOdbB/4z4DJVNBF3fTr
 PD52SqRbb+EyinuLr3SVMPb8exbcMZuDUihxmb4evgEB6Ut6LfajBGpszhxT7lVPjCABHM+KXI4
 t1wlWMgSctXXGbYcgJICnTVZJH3UBzOzze0jukPQXdTYvJ0DLOXw7Uibw2yKGV0nzkBcKgePB2D
 U30K/cO+8MuDPnliBN5NrkuGmGoZwVaIdzyoyCh8UQQMYf/xp1kvQKMts0YwmgVG4v01d08qbeh
 2BU0dh4vpqk+Lghawe7xNguDYYg06NjfvcQU8IsqD9eBRDc7jq6NCflzLr84krSHQEYzenGJJ7e
 R/aOggQ=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 36A4AA4C51E0;
 Tue, 29 Sep 2026 20:37:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgi-000000006Jn-1Esd;
 Tue, 29 Sep 2026 18:36:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>
Date: Tue, 29 Sep 2026 20:35:33 +0200
Message-ID: <20260929183607.1849293-35-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 34/66] package/ca-certificates: Replace
 c_rehash with openssl rehash
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

The upcoming bump of libopenssl to 4.0.2 removes the c_rehash script:

https://openssl-library.org/post/2026-04-14-openssl-40-final-release/
https://github.com/openssl/openssl/blob/openssl-4.0.2/CHANGES.md#openssl-40

"* Removed `c_rehash` script tool.  Use `openssl rehash` instead."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Martin Bark <martin@barkynet.com>
---
 package/ca-certificates/ca-certificates.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f5675b754d..0f88df3eec 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -36,7 +36,7 @@ define CA_CERTIFICATES_GEN_BUNDLE
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(TARGET_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
@@ -65,7 +65,7 @@ define HOST_CA_CERTIFICATES_INSTALL_CMDS
 	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
-	$(HOST_DIR)/bin/c_rehash $(HOST_DIR)/etc/ssl/certs
+	$(HOST_DIR)/bin/openssl rehash $(HOST_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
 	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
