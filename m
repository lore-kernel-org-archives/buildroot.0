Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C377EC19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 16:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BB6260BD1;
	Tue,  9 Aug 2022 16:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BB6260BD1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kG89JfuD1VVE; Tue,  9 Aug 2022 16:27:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8318460B4E;
	Tue,  9 Aug 2022 16:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8318460B4E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CAE2D1BF860
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 16:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A568881926
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 16:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A568881926
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8AyDJ-Oxfzxs for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 16:27:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9852481301
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9852481301
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 16:27:26 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so894287wmq.0
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 09:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=EKNVN3QlsxPpjq62P0HDbu/lIa+9znkMRvshzk2cL+0=;
 b=kwqVjWHwmtFflvpxT4DMZG9O+pv5cDxCZWwT9jl5VE35A4lm8UXvSEF+bld8T2eeOe
 cm60DglStMuCWq7Yd5IZuZbsGf+fqF2+AleVqqZCEr+7CxsNrq6Z4zX3/zzYo/JcEMVC
 XtFtUdmLLH5dbt7LPhrBC0qUSFFOtm56FXaT5fxyicjOe4BIbFxlZwIsoBWHDQuguyB0
 bRWMnHb6vCbPWr4XU1HJWnTapUlJi3qMS/P7oeQRZxIhoBMQ/k2ACuWqC6bqhp8cg7xv
 o8EaKqNl03he9/pUaQrcVG35S4kaAGh/afFr3T3cEADPb5e+NLMnBElw52812sc9VNiZ
 G3pA==
X-Gm-Message-State: ACgBeo0gbUGkfd8bSt336U3v1BkQlH8f6D2YlPW/frBpUFWjFFS3Wbq3
 qvRnyhlwmPtX9Fnl2iU5xMHRRJOB+j8=
X-Google-Smtp-Source: AA6agR6PgEmcJVEVCtm+9HI8ZguxBF21eogzYKHmeW++UunwHVoXQOodN6+4TxfVoH1LNHg3DAYBEA==
X-Received: by 2002:a1c:7708:0:b0:3a5:5543:cec4 with SMTP id
 t8-20020a1c7708000000b003a55543cec4mr2927721wmi.47.1660062444514; 
 Tue, 09 Aug 2022 09:27:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a5d4b92000000b0021d6924b777sm13545554wrt.115.2022.08.09.09.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 09:27:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 18:27:14 +0200
Message-Id: <20220809162714.1915094-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=EKNVN3QlsxPpjq62P0HDbu/lIa+9znkMRvshzk2cL+0=;
 b=XclgohnzOyGRd+JSiumz2oLaDq9j766k5AOvI3KriuAFe3ibWfn+0c5JjaQ81eYu+g
 DEYkbc3PLydcD/RV/9oNLchErT+lM8NpJI1qEhLOM+msJBTe6AmzEKvWYdjS/sUEr/2s
 O7i7lHt9Hdn26bTlw5rX0vupNtS2fRVPbtfNnFc2RXvfl8tai1I75JE/lkyPBv1mmXcL
 e/GUp2y3Q8wverjJ04Nwh9HaLyPLtHiE7EgjXmIKnWoYJkJKAQsNe4wia3tTIF/+TmPu
 UlEf8nXd0fXxfVzIgt+EfjJ7RmXgwydywyy1vY6V+0RnJkQiFYQ4eytgWDMiUK2nX0Db
 qBCw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Xclgohnz
Subject: [Buildroot] [PATCH v2,
 1/1] utils/genrandconfig: disable libopenssl without atomics
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libopenssl needs atomic or the build will fail (e.g. on sparcv8 without
libatomic):

${LDCMD:-/nvmedata/autobuild/instance-7/output-1/host/bin/sparc-buildroot-linux-uclibc-gcc}  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O0 -g2  -g2  -L.   \
	-o apps/openssl apps/asn1pars.o apps/ca.o apps/ciphers.o apps/cms.o apps/crl.o apps/crl2p7.o apps/dgst.o apps/dhparam.o apps/dsa.o apps/dsaparam.o apps/ec.o apps/ecparam.o apps/enc.o apps/engine.o apps/errstr.o apps/gendsa.o apps/genpkey.o apps/genrsa.o apps/nseq.o apps/ocsp.o apps/openssl.o apps/passwd.o apps/pkcs12.o apps/pkcs7.o apps/pkcs8.o apps/pkey.o apps/pkeyparam.o apps/pkeyutl.o apps/prime.o apps/rand.o apps/rehash.o apps/req.o apps/rsa.o apps/rsautl.o apps/s_client.o apps/s_server.o apps/s_time.o apps/sess_id.o apps/smime.o apps/speed.o apps/spkac.o apps/srp.o apps/storeutl.o apps/ts.o apps/verify.o apps/version.o apps/x509.o \
	 apps/libapps.a -lssl -lcrypto -ldl
/nvmedata/autobuild/instance-7/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ./libssl.so: undefined reference to `__atomic_fetch_sub_4'

It should be noted that openssl3 has added OPENSSL_DEV_NO_ATOMICS but
"this is intended for internal development only, to check the
refcounting is properly coded.  It should never become a configuration
option, hence the name of the macro.":
https://github.com/openssl/openssl/commit/503d4745a115b82db01c1fb22baaddb153d27cdb

Fixes:
 - http://autobuild.buildroot.org/results/bce526d538f43a541fdfbc0c9b4a7cecebbbc539

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle and
Yann E. Morin):
 - Update utils/genrandconfig instead of trying to propagate this
   dependency

 utils/genrandconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index fb20dedcbf..a00ff8ee8b 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -246,6 +246,11 @@ def fixup_config(sysinfo, configfile):
     if 'BR2_ARM_CPU_ARMV7M=y\n' in configlines and \
        'BR2_PACKAGE_LIBFFI=y\n' in configlines:
         return False
+    # libopenssl needs atomic, but propagating this dependency in
+    # Buildroot is really too much work, so we handle this here.
+    if 'BR2_PACKAGE_LIBOPENSSL=y\n' in configlines and \
+       not 'BR2_TOOLCHAIN_HAS_ATOMIC=y\n' in configlines:
+        return False
     if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
         configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
         configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
