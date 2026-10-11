Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30270CA9ECC
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 21:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD31140596;
	Sun, 11 Oct 2026 21:08:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1yaNQEbB0c7v; Sun, 11 Oct 2026 21:08:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E037940587
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791752881;
	b=UsNkfxoKTD6Pl6N87lhxIYqXfPB2KRYw83sN5n0lZ1EVUFBOALrvuIO3NxqXsl3/YDy+
	 BwVcF/iqVjBCjscUSbxbgF0UzbEluBejMSVmYBmMDf26OgcJ4USU89uQ5K38U0g1MWMqX
	 TIlWm9qF4+xGh1wu0MqgfOMpnjSC5wQtzY3ncdWnGfGjCDFRVorIVYq23CXz0L3vVfwuG
	 OYBdovRxTJ5kC5PYx2q6gC4XryZTbcLhB9RtSVj0RAuEDYW8GWGst9T70dHqAiger/Jn3
	 JN1yoQBmuo8+pJZrUlzf0XzkhawR33UTAPqrhlXe3jiLQRTfKElN0y9j7nrlxnQyttg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791752881;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=pAXkTkJPrY4nGYsvA7mjProq+lDro3u6Y6ACXS9aZ7E=;
	b=lqkGARiJo02Cqa0naBkUkNLnIVIKoUPa7XtbtlZs3dEtVRU/gMuASTQSRUu1eiNosHbS
	 ZU9FSO4/Q+O7MvJ1wxuVhVRDA6gyCkyBv0BIbzWOkAGjsjhya3Ohz2yPNoE4k51maPL4x
	 fsn/JRXH+cvPkd9Wc2l49kBhUo3ok9tQHKlePLlQ2zG98ZuFuj8r3Y6+ZiZ1ooexxErEX
	 IID/8RdcF7QNLc+PWUzFa5CsWtNA5rX/oQvB0pugSSWAHmb+wUagICjtyhfJA6K+ldi9g
	 hVO0nPdFGDsdeg1izL7JwZatNWJdhEh2RoHKqtrGbBV4o6bNkhnLlPOTSI5N/LE14Gg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791752881;
	bh=pAXkTkJPrY4nGYsvA7mjProq+lDro3u6Y6ACXS9aZ7E=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dvnl3tFAMagAkUeeLajEGKYAEChlhnzjEsQ5xWoIdYtEYNALnqlXEsOOnyC+IbwdE
	 HDakEgpaEhE8BqMBRR8dLFqkXfsfqB9HXz5Dr8ItBT7QG561T7mAZ615QMEa4IIVbr
	 9gZaTEO3UWNc15Y/kus6oKIWzjpoVxH0TmJQSngpr6eozqDB49qrM+t9bAC3NYpvBd
	 DSUm1Ki+r1LOm7IggF6Uq53B5MPHw1eubAPGiyPWmqE5OrBwU098wEKZSszcWEJYGX
	 hMygjk4twWl6Dsa0UwWTNQ+EwksK/n8FKVQ9SagYkzDmxwl2W3/waXDMW0+g8aQsOx
	 rHd4EGBlQP1Pg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E037940587;
	Sun, 11 Oct 2026 21:08:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 195E22E0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2DD84058C
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ty5sF7h5eQ6I for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 21:07:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3A6F840578
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791752878;
 b=MKYlcl6TQExSCClG17lCXl0TWQHuy4aEuq+0yn6Rr2MLfSQ2olNJMpXEPXrYP6Gv8zor
 71N/fZa2UhVqHxerUSUpQg5jHjhUGLyPQQh8SwOU/l5C1jBhCzso3dcPBUXXObqzLLPJm
 hklxPsPqVB0DDhsHCRD0wacdJc2S0WBz5tWjfZ9cE5uI4Zl1MmptIfkKSfJHnMsi5SVYK
 EPdQmV/NavD9QlwNHEKKzEHRzLcRh/QS186QzxxjtUh+QkVNA7Y/Tyzlh8rAa/bebBC7z
 HyiC2Ui4q9Qu3jLU2O7iORNB4gat+pk35LZVZHb5QIXZDn0pHGTGNzjQ7g2RuRuNDQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791752878;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=4MfqQh4IL394lh2DfS6dYxEmamKmaoheyl9d1MxI/UQ=;
 b=m2xFLT9wkVyxAhof3byCHow0rgWV+P2AkOvcA9d1+RvUsdgfGlwbehFGp8MNy11Xehco
 pm7ptyG8n8oM/oBTW5+Sr5UuND5QpWF5strV/Nm3HS6lyhiIAXCdcBDHA0Y/PdYjjWcP8
 jTFofvbNLJ2ieDtIsNb4gfyEPDpPmJUUt88yWUGFh53rCIgBL1IsuwHL3FIT61hcpXH2x
 RY5+ijIajJ7q4Qoo5yRY9QDW2/+jeryozxhjfg5K6EjGCAVPjYLill2DlWCO5maB93O/9
 mfqebxhNR7zit1VOTsgILAygj+HPcX+0hLsKtRy2jO9laUVcF67IFzyTsV9G27nH/0Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A6F840578
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 21:07:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 538929527C; Sun, 11 Oct 2026 21:06:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 23:06:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4422d99a4e1c7676def18ec700f3beebea26b1bf
X-Git-Newrev: 1468b63006b2577842035fa69573dc9438239c78
X-Patchwork-Hint: ignore
Message-Id: <20261011210639.538929527C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lldpd: fix compilation issue with
 kernel 7.3 on aarch64
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7614519798087926352=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7614519798087926352==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1468b63006b2577842035fa69573dc9438239c78
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

lldpd bundles some uapi linux files for old distributions, especially
the types.h one.

Since kernel commit d4bf9e08d412 ("arm64: uapi: Use __u128 instead of
__uint128_t in UAPI headers"), the type __u128 is used by sigcontext.h.
This type is defined in types.h, but the old version bundled by lldpd
does not provide it. This lack leads to the following compilation error:

  In file included from ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/bits/sigcontext.h:30,
                   from ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/signal.h:301,
                   from ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/sys/param.h:28,
                   from privsep_io.c:5:
  ../../../../host/aarch64-buildroot-linux-gnu/sysroot/usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
     81 |         __u128 vregs[32];
        |         ^~~~~~
        |         __u32

The uapi linux files bundled by lldpd are the ones of kernel 4.19
(https://github.com/lldpd/lldpd/commit/a192a2e91f81), and they are
prepended to the include path, so they shadow the sysroot ones.

Remove them so that lldpd uses the uapi files of the sysroot, but only
when the toolchain provides kernel headers 4.19 or later. With older
headers the bundled files are kept, so those configurations are left
unchanged.

Signed-off-by: Thibaut Collet <thbt.cllt@gmail.com>
Reviewed-by: Vincent Jardin <vjardin@free.fr> (✓ DKIM/buildroot.org)
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/lldpd/lldpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index f0cbc7e436..9ecf622b22 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -61,6 +61,13 @@ else
 LLDPD_CONF_OPTS += --without-readline
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19),y)
+define LLDPD_DROP_UAPI_FILES
+	rm -rf $(@D)/include/linux
+endef
+LLDPD_POST_PATCH_HOOKS += LLDPD_DROP_UAPI_FILES
+endif
+
 define LLDPD_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/lldpd/S60lldpd \
 		$(TARGET_DIR)/etc/init.d/S60lldpd

--===============7614519798087926352==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7614519798087926352==--
