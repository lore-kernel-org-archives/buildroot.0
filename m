Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FCDCA5FA7
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:45:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C62660855;
	Tue, 29 Sep 2026 18:45:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1T2Um0z4s8fg; Tue, 29 Sep 2026 18:45:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3D5BD6083B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707544;
	b=ZRFMtq5vJmT2Bqs46lfZm5tK303VfTuIpjHcKU47DL9E3BiEgYxSrAqj+r1+go1Mbb2N
	 GKC8q89wAaoVU6seHz8jiuBkJX04BMsgDtmAp6v15oR7TsuZxHEH24EHUM6EYuJ6Wu9rl
	 7BqMQE6HD8a9pmN51WD5IA3Ee0aHFPEntyEe8U5Y86eUNEYNt9i1Nge0hKEKXfhuosfua
	 n6PhvqLaBBK3WP2VFkAlH0AviEtrB2UMUScgV2wuAeUPQ3PUbG9IHZraG3Bz8WWiIIpTI
	 ENNjyPPfQv1qjQ/vJDe1RTk7qWdERciM3UmcaBtUiNLJIn/asFl7YgcYiV5NjO0Q7lw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707544;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	b=bift7f71E8lmzh79JKEIhLk46JUCHCeTOyyJd3wlxC1nSSb1rksZqtLR2tfx5FNuXg/r
	 mI9JpYAMr3Wf770gVRdEEDhAGErrO1WWNb7cUWt4ZUiL/k2ks4erqDUGGLcrZRZ7oxKa3
	 bcs+akcJgPEPHIhUHrBFr5JFduNWSnmEiacsRiOPJaJ3zkveO+har6lyu7KGUrrKXFnfJ
	 14u/IcMe977x8Wo2aLBZsTY9BeUjlzpo9W8mDcAEiqhXPLoNacMu3KWgTYujBbn4NZa85
	 eriPFsskWBZEeciDqfBuPkEt7h+akVsR4GxRdhPkTzpuYEgo6b+QZiUErjif6+mrVtA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707544;
	bh=CoKHt1SZEX9LCuTA4d+WI9H8Uc8vErfaVcWjqzjXnv0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Jh7osKTqevRPkpeN1Fh3Jwzg7+BmbGMcbZhh/q6H4X2p11J2hacvThOzHa9kkw+9W
	 zoOCCUSCDg2oU4LhpgAhCOSALi+yFF6fUo4rPnFE/VWKWDIvlh80GdoVroW0xNKuD2
	 tomr5Tdq4fh5YsdBNqbtXd7dNz7Fc6rtWqHuQJT71UlkpEC5gK9G90Fqz78kU8W63g
	 A/1eNZ/JTY/DAYbVQ8V1+cD7RC0Eokf9go8TWeuaDfWn5FVpgv0usEZCI0VfywCweu
	 GXlDM0T3XZ2/0f5i4ynzQHGMsXApK5j52QQW5UiYIWvZUNv4HfLBzI5+MFUVzHOKYw
	 JypobMWQBTPeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D5BD6083B;
	Tue, 29 Sep 2026 18:45:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B23F14C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 113588115D
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCpgLMBsI0Z5 for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:45:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2EB0081159
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707541;
 b=T4YEchwEw1o/QgrxuVg2q1ziJPbA0y+2OB/V7ZIDjAyDSld9LPFbUtSK6fQcUB6zTIli
 3YEMKLW7RuY0Ytas+lCKs7vcnKywoPgiv1RxtRBBfcF2batJjwVWgStZAciFp+7D7hxZD
 fM4SpHWiPnpN+PuREVxK/Yrpm8l/0kgoXl3UG3W2hPVnGmOoyKlHqf9L3gNwctJ4IS/Ku
 N7eUiAr5TtUroSWq7dXBUHzzyGLgz/ZnbaJA9KJuTXyHlNrs9ddyK2JEWebtUEkF8Uyhc
 JcMqUZjwzk0Y2+pDHcuCWuGFU8xlp6Jhy/UTkOeXZsl/pdOnsYuIH4QBBpMTb55jRlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707541;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 b=kcmPB6dTB3fvC166tmNzcLHLA7srFewGSzEXXKxrQDRNZ27pArEyGxQF9a/u+w0rb4dd
 6SDFxY+WlXiOhbPK9mbwbsP/RbF1NA9QvtCqgwa8H5Rig3Wc+3Iy1dl2Ns/RjFcAnqp/D
 db/X1hFMcMwHizG7/nHvkyVvBNmZvH48wCO2kLiEAIfw/FaIYd4tSOfd2IFdfc4lIERdK
 BxCCQ0QoUzpuwRmjnMHDHTgcXJxtoU//ww3LOyn4+QRRmNkGCL0sTK4SguhzCX5xZgslN
 HMCOHKu5bkNiEdGrje4NDzhKLydVCKw+X/a+uDj/+J2RoIcHKsqEAqLRJZp/SI/K8xg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=QpoC7KT5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=QpoC7KT5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2EB0081159
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707029;
 bh=LHOJTIGlY+j1RG0jlzs/vsKcOKV9OP98XT1khlQkS30=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=QpoC7KT5a4vWYR/TjUJw3Ws87LZKWcuplvNTpE3BOQDBl7TlgU3QV5s56XLYdyvMc
 s2MPzf2VG/mVYhrEJbvMP5g+FC+bAIsWlqLVRv3r8TTQ19RBiLMnlDNVLuENZBHZOq
 hQsQpAEtyTTLZwQ1IgxHomJMgzHnKWLOQG8Udk02VeLv//q7KuRzvj04k0U1+3WM7I
 ZaU2JAZsn06INknAo6iz2/acd6ItvE8cjJMnQx1clUDsINVkMyXLuO1uu1sEeiDXSh
 PxDb0FqY+xvh7iGlHIe+e+6L7o5ZfEo2PYSM/tYawXJboofoi93cuw1mAGlt0Sefq/
 k5LDZWHUhlvTQ==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 H+VUYLYc94v0bZRX2zYB1ctxP8IUgoHdoDdUmtPaK1MjSievPw1OU3TzbBltWbIHzciIVB65k5P
 R2kO1Rx5cbmyMEiQV+sRnrG58LBADP37GnVNnwHUgU2kaeaKan0FyEqa7azDSIunklwkx2TWb35
 C2CsD0Ogxx4vUis6XVvctVZQF8pUww6ssdUorSQPKpoSOB+aNhK9XnJu0XAt7B8/blpCB73ThZ8
 Dt4Knn2OXXz6E8trpPzn6NhYltEx1msoW3Yj6fk59kp095tz1xmL03Z/CO2Iv1VsVi2KM2RfEBZ
 IoCgGhYzrxJCtRZ0GOKMUtLZ7XUCZT40IhlTR6aZgGE0iHo3OaTiHeX431HrucpSBIOWuoB8WmF
 Ia6HBjXWDoIwYl2WGGbHW9D5pA8mPP+RCPSHpfDBmEpSdu2jefBIBJ8JxQbxyMci7y9gvpeMtxU
 +TNSwqvtB5pU67u2U8mLBkyfFv+LlrWKU7d4rxu4IqA5awmdOXEtNUmpTTO5cNcoluUZWoJPfu/
 PDfY0xxb8G21bCu7LGJHMUpppetinGNR4FX3A3yocna1m40qc9aRhUBLHtpxN7w7/HlgrL8GjOj
 tnCQ+g==
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B9F03A4C51E3
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 20:37:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgi-000000006Jn-2SZz
 for buildroot@buildroot.org; Tue, 29 Sep 2026 18:36:24 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 29 Sep 2026 20:35:36 +0200
Message-ID: <20260929183607.1849293-38-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v7 37/66] package/freeswitch: Add support for
 OpenSSL 4.0.0
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

configure checks for DTLSv1_method() and DTLSv1_2_method() to make sure
OpenSSL >= 1.0.1e is used, the functions itself are not used by
freeswitch. The two functions were removed from OpenSSL 4.0.0 breaking
the configure check. To fix the problem we let Freeswitch force-detect
the function to finish configure successfully.

Bug was reported upstream:
https://github.com/signalwire/freeswitch/issues/3159

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/freeswitch/freeswitch.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index e27c53650f..524599870c 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -75,6 +75,11 @@ FREESWITCH_CONF_ENV += \
 FREESWITCH_CONF_ENV += \
 	ac_cv_gcc_supports_w_no_unused_result=no
 
+# fix build with OpenSSL 4.0.0
+FREESWITCH_CONF_ENV += \
+	ac_cv_lib_ssl_DTLSv1_method=yes \
+	ac_cv_lib_ssl_DTLSv1_2_method=yes
+
 FREESWITCH_CONF_OPTS = \
 	--without-erlang \
 	--enable-fhs \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
