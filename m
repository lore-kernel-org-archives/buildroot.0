Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C45CDB465
	for <buildroot@archiver.kernel.org>; Thu, 19 Oct 2023 11:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5258382242;
	Thu, 19 Oct 2023 11:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5258382242
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HEpL9ll9yuDF; Thu, 19 Oct 2023 11:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09BF583C8A;
	Thu, 19 Oct 2023 11:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09BF583C8A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF4CB1BF5A2
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 11:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 86627414A1
 for <buildroot@lists.busybox.net>; Thu, 19 Oct 2023 11:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86627414A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlFCPmRixM-a for <buildroot@lists.busybox.net>;
 Thu, 19 Oct 2023 11:23:01 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 59DE840332
 for <buildroot@buildroot.org>; Thu, 19 Oct 2023 11:23:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59DE840332
Received: from 91-153-34-210.elisa-laajakaista.fi ([91.153.34.210] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qtR7D-002FBH-7Y; Thu, 19 Oct 2023 13:22:59 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 75363cd5;
 Thu, 19 Oct 2023 11:22:58 +0000 (UTC)
Date: Thu, 19 Oct 2023 14:22:54 +0300
Message-ID: <20231019142254.GC1924783@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20231019110851.1924092-1-aperez@igalia.com>
References: <20231018093933.1315894-1-aperez@igalia.com>
 <20231019110851.1924092-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2rOEU3QjSFjBF3auHGeRmUE4sUxePmGt5UO640CNNaM=; b=jPqJgk81Glj+/msZQ4M+9WVOBu
 gzzhb2fyee1xoUnNUfAe+KL7WZWJ0E50B1khcEq1PfgrPw0FFgFTXhpkGTNHLP1477DWnJsbsxq9B
 eOGDkJsz/V6OLzk7/R04trLjAWChUfAwqXo1VXBc+W5A/qeQ1JE3VttcMfTEihkHayzE0W173EBLK
 AdyZtnKgziaKPcux1slYPRt/dhg74C6cYPktkAk4IPGJyjRSYXXwcbAUvI08voNCn2O+1fzuD8icN
 NXXXkzjOEc+4OPUjEJ3ES5gRq79yOdZaath6O9GZhBzW76hEXFs7smmkPqIlm2jckf2AeVW/TqbKt
 ge78nKQw==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=jPqJgk81
Subject: Re: [Buildroot] [PATCH] package/xdg-dbus-proxy: fix tarball name in
 hash file
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
Content-Type: multipart/mixed; boundary="===============1298762110119177092=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1298762110119177092==
Content-Type: multipart/signed; boundary="xw5aeo3KoaMeiZPQ"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--xw5aeo3KoaMeiZPQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgUGV0ZXIsCgpPbiBUaHUsIDE5IE9jdCAyMDIzIDE0OjA4OjM1ICswMzAwIEFkcmlhbiBQZXJl
eiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPiBGaXhlczogNDg3NzYxYTVi
MiAoInBhY2thZ2UveGRnLWRidXMtcHJveHk6IGJ1bXAgdG8gdmVyc2lvbiAwLjEuNSIpCj4gU2ln
bmVkLW9mZi1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cj4g
LS0tCj4gIHBhY2thZ2UveGRnLWRidXMtcHJveHkveGRnLWRidXMtcHJveHkuaGFzaCB8IDIgKy0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpDb3VsZCB5
b3UgYXBwbHkgdGhpcyBvbmUgZml4PyBJJ3ZlIHNlbnQgYSB2MiBwYXRjaCBhZnRlciBub3RpY2lu
ZyB0aGF0IEkKZGlkbid0IHVwZGF0ZSB0aGUgdGFyYmFsbCBuYW1lIGluIHRoZSAuaGFzaCBmaWxl
IGJ1dCB5b3UgbWVyZ2VkIHYxIG9mIHRoZQpwYXRjaCB3aXRoIHRoZSBtaXN0YWtlLiBUaGlzIHdp
bGwgZml4IHRoZSBpc3N1ZSwgYW5kIGFwb2xvZ2llcyBmb3IgdGhlCmJhY2sgYW5kIGZvcnRoIE86
LSkKCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UveGRnLWRidXMtcHJveHkveGRnLWRidXMtcHJveHku
aGFzaCBiL3BhY2thZ2UveGRnLWRidXMtcHJveHkveGRnLWRidXMtcHJveHkuaGFzaAo+IGluZGV4
IDM3ZjE3OTBjOWIuLmY2MWE2YTkxYWUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS94ZGctZGJ1cy1w
cm94eS94ZGctZGJ1cy1wcm94eS5oYXNoCj4gKysrIGIvcGFja2FnZS94ZGctZGJ1cy1wcm94eS94
ZGctZGJ1cy1wcm94eS5oYXNoCj4gQEAgLTEsNSArMSw1IEBACj4gICMgRnJvbSBodHRwczovL2dp
dGh1Yi5jb20vZmxhdHBhay94ZGctZGJ1cy1wcm94eS9yZWxlYXNlcy90YWcvMC4xLjUKPiAtc2hh
MjU2ICAwNjFkY2ZhZjhhMDY1MGU1ZmQ5ZDU0MzJkZmU4OGJkYTc0OWVhMGQwNzlkYzEzNjMwNGJm
ZWNmYmNlMDY2MWZiICB4ZGctZGJ1cy1wcm94eS0wLjEuNC50YXIueHoKPiArc2hhMjU2ICAwNjFk
Y2ZhZjhhMDY1MGU1ZmQ5ZDU0MzJkZmU4OGJkYTc0OWVhMGQwNzlkYzEzNjMwNGJmZWNmYmNlMDY2
MWZiICB4ZGctZGJ1cy1wcm94eS0wLjEuNS50YXIueHoKPiAgCj4gICMgSGFzaCBmb3IgbGljZW5z
ZSBmaWxlczoKPiAgc2hhMjU2ICBkYzYyNjUyMGRjZDUzYTIyZjcyN2FmM2VlNDJjNzcwZTU2Yzk3
YTY0ZmUzYWRiMDYzNzk5ZDhhYjAzMmZlNTUxICBDT1BZSU5HCj4gLS0gCj4gMi40Mi4wCgpDaGVl
cnMsCuKAlEFkcmnDoW4K

--xw5aeo3KoaMeiZPQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZTERjgAKCRCRxVnb5MkS
O22BAJ4ofttoAfflw1H8XPoRK5UJHWm5mgCdEmBI5imZywkFHvc7Rgjs+5VORG0=
=lfQi
-----END PGP SIGNATURE-----

--xw5aeo3KoaMeiZPQ--

--===============1298762110119177092==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1298762110119177092==--
