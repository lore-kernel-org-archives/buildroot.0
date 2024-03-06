Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A35AC5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 07:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A7DE81F5C;
	Wed,  6 Mar 2024 07:30:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1uzy23IbUyUQ; Wed,  6 Mar 2024 07:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECC0681F6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECC0681F6A;
	Wed,  6 Mar 2024 07:30:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B6F951BF97A
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 07:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1CE74154E
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 07:30:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sw9X3qiG0yLd for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 07:30:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B2A1416C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B2A1416C3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B2A1416C3
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 07:30:27 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0443B1BF209;
 Wed,  6 Mar 2024 07:30:25 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rhljN-0017iD-1J;
 Wed, 06 Mar 2024 08:30:25 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240305135724.1146746-1-fontaine.fabrice@gmail.com>
Date: Wed, 06 Mar 2024 08:30:25 +0100
In-Reply-To: <20240305135724.1146746-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 5 Mar 2024 14:57:24 +0100")
Message-ID: <87msrbyfzi.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/policycoreutils: fix build with BR2_TIME_BITS_64
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Do not remove _FILE_OFFSET_BITS=64 from CFLAGS and CPPFLAGS to avoid the
 > following build failure with BR2_TIME_BITS_64 raised since commit
 > 3c427c64726560ea1743282a3fdb78f5b28692eb:

 > In file included from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features.h:394,
 >                  from /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/errno.h:25,
 >                  from pp.c:20:
 > /home/fabrice/buildroot/output/host/mips-buildroot-linux-gnu/sysroot/usr/include/features-time64.h:26:5: error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >    26 | #   error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"
 >       |     ^~~~~

 > Indeed, this LFS workaround was there since the addition of the package
 > in commit cb328f77f8f07bfd89d6b69385c941a7b281732b  and is only needed
 > to fix a build failure with the old codesourcery-arm toolchain from 2014
 > which uses glibc < 2.23. as glibc 2.23 was released in February 2016:
 > https://sourceware.org/glibc/wiki/Release/2.23, drop this workaround as
 > already done for libselinux in commit
 > c1fa9bc2f7a4e5481edf4fce5c03dd45862fe72c. A follow-up patch will also
 > drop codesourcery-arm toolchain.

 > Fixes: 3c427c64726560ea1743282a3fdb78f5b28692eb
 >  - No autobuilder failures (yet)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Also fix host package

 >  package/policycoreutils/policycoreutils.mk | 17 ++---------------
 >  1 file changed, 2 insertions(+), 15 deletions(-)

 > diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
 > index 56889242e3..3ad7e9a5b3 100644
 > --- a/package/policycoreutils/policycoreutils.mk
 > +++ b/package/policycoreutils/policycoreutils.mk
 > @@ -11,7 +11,7 @@ POLICYCOREUTILS_LICENSE_FILES = LICENSE
 >  POLICYCOREUTILS_CPE_ID_VENDOR = selinuxproject
 
 >  POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(TARGET_NLS_DEPENDENCIES)
 > -POLICYCOREUTILS_MAKE_OPTS = LDLIBS=$(TARGET_NLS_LIBS)
 > +POLICYCOREUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) LDLIBS=$(TARGET_NLS_LIBS)
 
 >  ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 >  POLICYCOREUTILS_DEPENDENCIES += linux-pam
 > @@ -28,14 +28,6 @@ ifeq ($(BR2_PACKAGE_LINUX_PAM)$(BR2_PACKAGE_AUDIT),yy)
 >  POLICYCOREUTILS_MAKE_OPTS += LSPP_PRIV=y
 >  endif
 
 > -# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 > -# large file support.
 > -# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
 > -POLICYCOREUTILS_MAKE_OPTS += \
 > -	$(TARGET_CONFIGURE_OPTS) \
 > -	CFLAGS="$(TARGET_CFLAGS) -U_FILE_OFFSET_BITS" \
 > -	CPPFLAGS="$(TARGET_CPPFLAGS) -U_FILE_OFFSET_BITS"
 > -
 >  POLICYCOREUTILS_MAKE_DIRS = \
 >  	hll load_policy newrole run_init \
 >  	secon semodule sestatus setfiles \
 > @@ -59,14 +51,9 @@ endef
 
 >  HOST_POLICYCOREUTILS_DEPENDENCIES = host-libsemanage
 
 > -# Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
 > -# large file support.
 > -# See https://bugzilla.redhat.com/show_bug.cgi?id=574992 for more information
 > -# We also need to pass PREFIX because it defaults to $(DESTDIR)/usr
 > +# We need to pass PREFIX because it defaults to $(DESTDIR)/usr

Hmm, this doesn't apply because we don't have that 'We also need to pass
PREFIX because it defaults to $(DESTDIR)/usr' line - Where does that
come from?


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
