Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A1BC88E72
	for <buildroot@archiver.kernel.org>; Thu, 17 Sep 2026 17:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D810460B83;
	Thu, 17 Sep 2026 17:31:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Epe_uLooOEpb; Thu, 17 Sep 2026 17:31:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9C15A608B3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789666278;
	b=CKnMqD6VW7aC9ltpH6hpd42kWCsG8+IETRzntX43LETs+Mn46jgfZPaSIvbxz9t0lkBz
	 ddi4keq7OpJzfWx8HUyRotxqd24t2pc52H9kSH4T1q1fTRS5zb07V3bEaoEMKnRtJjC0a
	 IR6Ew/RUi9b5K+aaqrESYv9RnF8b6h2+WY4HASl08a/PlH2NYU0YHp/KGodARwL1d3x0u
	 HIQABvdOFRXpQf1Cpgm3S7idGWXZ64THKnssayRgkk/8XiEtgkTdlFvOcGdTLzGTwKbBQ
	 obPztQ2Jiscg/8B7UEl6D64ktne6Y8YaUfYFUnJTd7stxLukzAInPHkUXjIxJQw1TWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789666278;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Rsick1tW8UVSMQN+LKq+fUGFZw+26arlFUKpOnt9vgQ=;
	b=JXeBiZYQigcr4+I8Nk2lllFKcQyPAGoBN8k1CwtacmA9abiyohmXaNFIElJBUMOAXZBq
	 gj0lYlMbv1Lj3GdAvb9tNhwSIWxEVl9TKkKtuA8ZIWDdA24gFDLyDlSekEDDrdcCs6/62
	 nIoWGTQiwpzPG+3Lf4wuMVqxiky+pbyUDterXpoKE/93qrJxdsxJAu7p2tS7EQZygCxwO
	 yWCYib+zNbq5xV4uFzeGlU+Jeix6pGD5bFb04+T3ii1xjalMsft5QqFzARD2LsWlIMsmZ
	 3hB9aJsOJs05K40XP/IJQ9fcoHSbkMne16xTMaudyUlzDgjkHVZpi1PD/mM6IWuvMPA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=J+8n8mmb;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789666278;
	bh=Rsick1tW8UVSMQN+LKq+fUGFZw+26arlFUKpOnt9vgQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=exVA0Vy7wc9OX4Oo6OCfCiFiryKA48ZO0fHZ3JTQqXMUwdok0DlNsmU6/GtblBWZ8
	 NUsZr735pYk+TezQQoeDuu4j5X/yejo4bkLurvMIAmbaCXEr5a8OCW6IaM0CFUP+cb
	 nYeVMIfm5eJD3OJ2U/LDxjfh3AF1WtwLJjDJ35f9cUmAoEDT5TsySxo9EwnS6wuzZP
	 SxLEFv7907JS6QKHX4/XMT9AmEdv4C3fSIssanPSh9p0mrfGudJC575fOK31TbMA73
	 5TEi4M7ctWzg1Fp3Zqapcr2dnU/UDfjnuu6oosZI7sR7xB9IHsQKLA00ZH7RIw6Yce
	 rS+DmnenrClvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C15A608B3;
	Thu, 17 Sep 2026 17:31:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AE4B623F
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 17:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9406C608A4
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 17:31:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cQmwSS6tzJg7 for <buildroot@buildroot.org>;
 Thu, 17 Sep 2026 17:31:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 15633608B3
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789666276;
 b=dRp2HRHW/rvu2itRdwl1xe350Lmg5piApAW0l8bm1dTVXLXkMZDPx3nqvnVVudmj1MXa
 ML6rlhNvsh/0zCq/OByjd0IDt+RgBzHArqv67KHozkokNkFzDQDs8V/TcfA8dwQzhzdJ0
 yEg5Sap128rQLH8GV3cp/Fmotz1N0ypPYsVlD6hYbBAnaimIXJh3GwvhAffSugu8PRAXT
 181PVyv0H3BhU53xvcJEZWZ0HsfSPxSOKortgphq+UoQU+AKC1pQzVyOPCalnbU3GUV2w
 631IPQAEONBoUaaLh5yQoBkEk46BtUn1YuR9RfvQNdw01cxHui1jts61d/QpHRptupw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789666276;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=iEXDr58tD0GDroPs6ruE2IPa7Wf6MVXKTATnaVBJz+8=;
 b=gUYaTo3H5eQt7mMJL08uhht3L90Lcf497z38QYM6fLD7YGSu16tDaBuYndpTdMEwxh6W
 1XlaOt/QbXxJJTdAEKmhQMqpuOoHzlZkkYRj5em7jYHjrFWQ9l1UZOrytxeP7N7zTdEBl
 k9rzQkYmH8LwFScAYgIDEDYRvizzlJeHpv9p3ZfAPms22+l6i32XY4LVpZqAp87W5TpEq
 0JSUiQ6JAIqsPSKQqxXH7u2TSnYTEw20xG58rbxd/+XkM/YcRBWpUYwBmFA3mXIsLXZS3
 tr1q2+7H5MoOs/f6ITUqNx5a/0y6iKENn9uYHjHaZKDW5VNNqbZM5zC67dz7fhlYNQA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=J+8n8mmb; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=J+8n8mmb
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15633608B3
 for <buildroot@buildroot.org>; Thu, 17 Sep 2026 17:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789666271;
 bh=iEXDr58tD0GDroPs6ruE2IPa7Wf6MVXKTATnaVBJz+8=;
 h=From:To:Cc:Subject:Date:From;
 b=J+8n8mmbDcV5q/GaXrm3UEAY8Skx9A0hom6Ytmqu0TOaTMBv6vqrbtb14ZY70Hk8J
 RiQXpZLrt5Z+2qHBJ49mLICOAfbYEW+7WaB9mpK1YU1NF+U/X930GVUtSzvE6isKRp
 GjlsexS+NAn3Kntmykb5XQneUjRqjs0zES+XYmgRqsIUB8CUl2kVPgdH1dR7LJ2WqE
 FhEI2K+K5Td+drZWwmg3QheM0nSevVoy5heEYqMfdn/3Ah7Pa09Pai9PRNe1rxLgQH
 iUduS1XTwBIJ5q3Vf4DimEheIRlggVkdvi16Ul29Y4eLimBjXUxiD+PwkS469tbdM9
 ukF5HNqJkCHDw==
X-KAS-Sym: v3:f51bdf72230551df:fGqf9WSAkq3Z9rH851r/JsyhtMo/7YJvtKDDs4iOnzYshFI6I5L3wHcxsRYQmmPebcnWn1ZSVe6bXVbwVBVd5Lgw/y9SIPHvu7VMovbtBw4WCxSQFnqi7gBhiDhWoHGzi4xmTnXNCouKU0Ycj/PKx6X5ynjtQqsbKnN2zqCDy2b4f9YdHRSKGt5nKs4SzEVa7bmDM2VS43QjsoKv2n2s+UFQCGlaNpoglKnN5rOoY9FWhlMygqZKsJ1dzioztiY7gCHUCIjvBtI5O7Tif/MxUCvyT0s3Wppku72puVS0sCVWe5ODuK5lREA5fVkdovOX7wHQYs/AHRpFZSh3vRoWbw==:boAVRInXAJriW7OwLrRC4t1rF7zF/sAA1a/Vb4ZxB1BJBVj93BDAkpOtLkmUu0iSixzL0P5jcHIpJDHz1nkb7wRX2oBqZHLA2vcxZlS/+9zCUuoQJPrDpCRb37txSu3GWdyOc3bfnz3HGLvkOw/NcGgU/o1fmkwY1vKPS2V28Nv58RH24n8xTounFYbCcC2rr1lCd6J7WQEWRFP6QLGInjNQ7Fc4C1e/r7lGmMoplXdFjmwIAFQlLpZU8xxuuNiOUy1V8Y+s4H1BxWfjh8A57f4oO843GzyK0s6KsahTXQbj96gWkTz85tPLQxaOA3DY749b/HybviHM+Gs4c0p9c/mzWGhMbDeGYgp78m9JBC4N9VUQ7/I5pKSjGwceq55/CrLIg1GKSJcpQr6DJrz6B0Hk9SWZEq3dVcngmht3pifBJDeUPxqPwyN0CTaxLV8dK1jnNCMRKCPCFmwFFQPesOEGVmYwm0f1JRCL45uEW4sfhLD2Aa7ODearEFLJR7Y8WQAHBYKwPbC8J571dyqpHRRSTK0zwarkTdFWDBSRa+uxniyjjgFxmOFvzWiiiayCTbvtMS+GpWWo7MoNM0vtNkTmN7Zs5g==
Received: from fli4l.lan.fli4l (p5b3a04f1.dip0.t-ipconnect.de [91.58.4.241])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6458AA4C452F;
 Thu, 17 Sep 2026 19:31:11 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45398)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x7Fx0-000000002pF-2fcA;
 Thu, 17 Sep 2026 17:31:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu, 17 Sep 2026 19:31:11 +0200
Message-ID: <20260917173111.3023501-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/cog: fix build with weston 16.x
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

Buildroot commit c5c0a76751a7e9ba1a8816da68218db9e1379eb9 bumped weston
to 16.0.0 causing a configure error with cog:

Run-time dependency libweston-15-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-14-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-13-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-12-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-11-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-10-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-9-protocols found: NO  (tried pkg-config)
Run-time dependency libweston-8-protocols found: NO  (tried pkg-config)

output/build/cog-0.18.5/platform/wayland/meson.build:67:8: ERROR:
 Problem encountered: No usable weston-protocols dependency found

This error was not yet found by the autobuilders and is solved by adding
a patch James Hilliard sent upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...-Add-support-for-weston-16-protocols.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/cog/0002-Add-support-for-weston-16-protocols.patch

diff --git a/package/cog/0002-Add-support-for-weston-16-protocols.patch b/package/cog/0002-Add-support-for-weston-16-protocols.patch
new file mode 100644
index 0000000000..1ba9f4dc6a
--- /dev/null
+++ b/package/cog/0002-Add-support-for-weston-16-protocols.patch
@@ -0,0 +1,32 @@
+From 7be8cae20d50d1d991bf5a0ad0155e0f784b0b60 Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Tue, 1 Oct 2024 10:24:56 -0600
+Subject: [PATCH] Add support for weston 16 protocols
+
+Weston 15 was released recently and the weston development branch is
+now using libweston-16-protocols.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+
+Upstream: https://github.com/Igalia/cog/pull/789
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ platform/wayland/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/platform/wayland/meson.build b/platform/wayland/meson.build
+index dad47a6..3ecf9d8 100644
+--- a/platform/wayland/meson.build
++++ b/platform/wayland/meson.build
+@@ -49,6 +49,7 @@ wayland_protocols_path = wayland_protocols_dep.get_variable(pkgconfig: 'pkgdatad
+ 
+ if wayland_platform_weston_protocols.length() > 0
+     foreach weston_dep_name : [
++            'libweston-16-protocols',
+             'libweston-15-protocols',
+             'libweston-14-protocols',
+             'libweston-13-protocols',
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
