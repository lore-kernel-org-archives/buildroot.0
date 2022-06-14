Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C77C43334
	for <buildroot@archiver.kernel.org>; Tue, 14 Jun 2022 17:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A9805834AE;
	Tue, 14 Jun 2022 17:30:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AFc9tamgME-b; Tue, 14 Jun 2022 17:30:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3482833CA;
	Tue, 14 Jun 2022 17:30:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF7B1BF23C
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 17:30:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BF9D418A6
 for <buildroot@lists.busybox.net>; Tue, 14 Jun 2022 17:30:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TfkUTyGKL6Ko for <buildroot@lists.busybox.net>;
 Tue, 14 Jun 2022 17:30:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E33C641852
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 17:30:34 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id kq6so18512013ejb.11
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 10:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:from:subject:to
 :content-language:organization:content-transfer-encoding;
 bh=f7fLCdD13018zq+QMeTYyHXnGj70MksFUM8BPBkqBZQ=;
 b=aO25Qm8lKx1b/yit9hGhqO4eROVtJeBiWpS6OAEfDbedhSxQg1FKog3/xOLcNT1vCs
 P5A6i2tOsNlHWtjvAZq1d/mZ/TdsXn6EIL6e6WNr1Y6nFv5z+gElQ7c3JFrbjQ8KZqIN
 P2rBQHSixI1/Zwo2QbvWkXjwYkEcDl+EcsS3868xrlttwvh+1XW65CR4E6ba0Eys2TSe
 MRy5pOxGtnH9liRJgrGZLFJQX0SUaZmO6yVk0PE9XoDYY3SVO3CkCH6MpMVGKdj6CVWc
 TD+YCHIj7miupqg6S+fgoe1SeAowxw7BnLaSo3ekUdweKrSkw530k5KY8GGpvtaQG4vS
 GnRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:from
 :subject:to:content-language:organization:content-transfer-encoding;
 bh=f7fLCdD13018zq+QMeTYyHXnGj70MksFUM8BPBkqBZQ=;
 b=U+rXs0uYu9p3+W+fXj0Aktz+YR0jVzdBNDy3KRHwSeO6IkTzTLAYwuSV337f0z4Gca
 YaHOVD1xG0FU3kdB0tVbdfc8WJ6bQA04MtlJ9fHvTTqBjO2ogDTwTM1VtC+zdFdpmbB4
 DHdWnAkYjpTjcaq0vmTeWdrlfx94K0t6FFs50yoQNOkiqh1apotxhR/k8R3aonT9aSx6
 eieXfdTwRsXTjgw0fSajWP+9ZCcidXgyMeh2UWWMzpLs1zyXxQsJ5MagxWxrJ0/wNvlg
 oSV0FFOJrcOFvnVmiOvHUz4guWWkHdZWHvQZLURBQDismfw+47rfl+bpGZaTOM29aYOt
 3zXA==
X-Gm-Message-State: AJIora9uUi1cnSD5YTo3pcDQ+A8KEk7ePXJyjxg76HvvlhLaaO4iqKWF
 AZH364U0iwNjdruiWijTC5GXwEH/4CamoN+K
X-Google-Smtp-Source: AGRyM1uYYC8nsMue6Xt6/YDrV18h+PJo+Rvf6N13M8vHref3F4T+H+2oMxzPeIxC0xC+v2y/DuU1dw==
X-Received: by 2002:a17:907:2c65:b0:70e:c2ee:781b with SMTP id
 ib5-20020a1709072c6500b0070ec2ee781bmr5249573ejc.281.1655227833021; 
 Tue, 14 Jun 2022 10:30:33 -0700 (PDT)
Received: from [10.1.0.189] (ip-188-118-3-185.reverse.destiny.be.
 [188.118.3.185]) by smtp.gmail.com with ESMTPSA id
 gx7-20020a170906f1c700b006fe8ec44461sm5290993ejb.101.2022.06.14.10.30.32
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 10:30:32 -0700 (PDT)
Message-ID: <01c15cae-b2f1-875f-ea8a-03c23269d3d0@mind.be>
Date: Tue, 14 Jun 2022 19:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
From: Frederik Van Bogaert <frederik.vanbogaert@mind.be>
To: buildroot@buildroot.org
Content-Language: en-US
Organization: Mind
Subject: [Buildroot] [PATCH] package/libunwind: Upstep to v1.6.2
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Re-sending because my mail client mangled the first attempt :-) This also removes an old patch to fix atomic_ops for ARM pre-ARMv6. atomic_ops support has been replaced with C11 atomics, so the patch did not apply anymore, and should be unnecessary. This does mean compilation will fail with systems that don't support C11 atomics, i.e. GCC versions older than 4.9 Signed-off-by: Frederik Van Bogaert <frederik.vanbogaert@mind.be> --- ...O_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch | 56 ------------------- package/libunwind/Config.in | 2 + package/libunwind/libunwind.hash | 2 +- package/libunwind/libunwind.mk | 6 +- 4 files changed, 4 insertions(+), 62 deletions(-) delete mode 100644 package/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch diff --git a/package/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch b/package/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch deleted file mode 100644 index 2a37ed7784..0000000000 --- 
a/package/libunwind/0001-Add-AO_REQUIRE_CAS-to-fix-build-on-ARM-v6.patch +++ /dev/null @@ -1,56 +0,0 @@ -From 24484e80b3e329c9edee1995e102f8612eedb79c Mon Sep 17 00:00:00 2001 -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com> -Date: Tue, 13 May 2014 23:32:27 +0200 -Subject: [PATCH] Add AO_REQUIRE_CAS to fix build on ARM < v6 - -ARM earlier than ARMv6, such as ARMv4 and ARMv5 do not provide -optimize atomic operations in libatomic_ops. Since libunwind is using -such operations, it should define AO_REQUIRE_CAS before including -<atomic_ops.h> so that libatomic_ops knows it should use emulated -atomic operations instead (even though they are obviously a lot more -expensive). - -Also, while real atomic operations are all inline functions and -therefore linking against libatomic_ops was not required, the emulated -atomic operations actually require linking against libatomic_ops, so -the commented AC_CHECK_LIB test in acinclude.m4 is uncommented to make -sure we link 
against libatomic_ops. - -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---- - acinclude.m4 | 8 +------- - include/libunwind_i.h | 1 + - 2 files changed, 2 insertions(+), 7 deletions(-) - -diff --git a/acinclude.m4 b/acinclude.m4 -index 497f7c2..9c15af1 100644 ---- a/acinclude.m4 -+++ b/acinclude.m4 -@@ -22,11 +22,5 @@ fi]) - AC_DEFUN([CHECK_ATOMIC_OPS], - [dnl Check whether the system has the atomic_ops package installed. - AC_CHECK_HEADERS(atomic_ops.h) --# --# Don't link against libatomic_ops for now. We don't want libunwind --# to depend on libatomic_ops.so. Fortunately, none of the platforms --# we care about so far need libatomic_ops.a (everything is done via --# inline macros). --# --# AC_CHECK_LIB(atomic_ops, main) -+ AC_CHECK_LIB(atomic_ops, main) - ]) -diff --git a/include/libunwind_i.h b/include/libunwind_i.h -index 23f615e..deabdfd 100644 ---- a/include/libunwind_i.h -+++ b/include/libunwind_i.h -@@ -95,6 +95,7 @@ WITH THE SOFTWARE OR THE 
USE OR OTHER DEALINGS IN THE SOFTWARE. */ - (pthread_mutex_unlock != NULL ? pthread_mutex_unlock (l) : 0) - - #ifdef HAVE_ATOMIC_OPS_H -+# define AO_REQUIRE_CAS - # include <atomic_ops.h> - static inline int - cmpxchg_ptr (void *addr, void *old, void *new) --- -1.9.2 - diff --git a/package/libunwind/Config.in b/package/libunwind/Config.in index 5284b5864c..b914cd46f7 100644 --- a/package/libunwind/Config.in +++ b/package/libunwind/Config.in @@ -23,6 +23,8 @@ config BR2_PACKAGE_LIBUNWIND bool "libunwind" depends on BR2_TOOLCHAIN_HAS_THREADS depends on BR2_PACKAGE_LIBUNWIND_ARCH_SUPPORTS + # GCC 4.9 is the first to implement C11 atomics + depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # forcefully links against libgcc_s, only available in dynamic # linking configurations depends on !BR2_STATIC_LIBS diff --git a/package/libunwind/libunwind.hash b/package/libunwind/libunwind.hash index de00c59988..1d532a7830 100644 --- a/package/libunwind/libunwind.hash +++ 
b/package/libunwind/libunwind.hash @@ -1,5 +1,5 @@ # Locally calculated after checking pgp signature -sha256 90337653d92d4a13de590781371c604f9031cdb50520366aa1e3a91e1efb1017 libunwind-1.5.0.tar.gz +sha256 4a6aec666991fb45d0889c44aede8ad6eb108071c3554fcdff671f9c94794976 libunwind-1.6.2.tar.gz # Hash for license file sha256 6a0dbbdaec2b3136b7bf045586f4212bdf74e7af688bf9dfe9154607cf5ec156 COPYING diff --git a/package/libunwind/libunwind.mk b/package/libunwind/libunwind.mk index aaa33464a9..9cd587d0a3 100644 --- a/package/libunwind/libunwind.mk +++ b/package/libunwind/libunwind.mk @@ -4,7 +4,7 @@ # ################################################################################ -LIBUNWIND_VERSION = 1.5.0 +LIBUNWIND_VERSION = 1.6.2 LIBUNWIND_SITE = http://download.savannah.gnu.org/releases/libunwind LIBUNWIND_INSTALL_STAGING = YES LIBUNWIND_LICENSE_FILES = COPYING @@ -16,8 +16,4 @@ LIBUNWIND_CONF_OPTS = \ --disable-tests \ $(if 
$(BR2_INSTALL_LIBSTDCPP),--enable-cxx-exceptions,--disable-cxx-exceptions) -ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y) -LIBUNWIND_DEPENDENCIES += libatomic_ops -endif - $(eval $(autotools-package)) -- 2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
