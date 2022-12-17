Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2929EC4332F
	for <buildroot@archiver.kernel.org>; Sat, 17 Dec 2022 07:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E91D82178;
	Sat, 17 Dec 2022 07:56:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E91D82178
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jiIw1i88rNKF; Sat, 17 Dec 2022 07:56:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9928682175;
	Sat, 17 Dec 2022 07:56:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9928682175
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF8611BF2BB
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 07:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9D8460B77
 for <buildroot@lists.busybox.net>; Sat, 17 Dec 2022 07:56:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9D8460B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z0FEQEB_54ng for <buildroot@lists.busybox.net>;
 Sat, 17 Dec 2022 07:56:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D371660797
 for <buildroot@uclibc.org>; Sat, 17 Dec 2022 07:56:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D371660797
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id BB9BF83BE5; Sat, 17 Dec 2022 07:56:40 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Sat, 17 Dec 2022 07:56:40 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.8
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dmrauh@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15181-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15181] New: Building libcurl fails due to faulty
 package definition
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=15181

            Bug ID: 15181
           Summary: Building libcurl fails due to faulty package
                    definition
           Product: buildroot
           Version: 2022.02.8
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: dmrauh@posteo.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

Hi all,

I'm trying to compile "libcurl" using Buildroot 2022.02.8 with the following
relevant options in my .config:

BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_LIBCURL_OPENSSL=y
BR2_PACKAGE_OPENSSL=y


Unfortunately the build is reproducibly failing during "libcurl-configure" with
the following symptoms:

...
configure: PKG_CONFIG_LIBDIR will be set to
"/home/rauhdomi/build/out/host/x86_64-buildroot-linux-gnu/sysroot/usr/lib/pkgconfig"
checking for openssl options with pkg-config... found
configure: pkg-config: SSL_LIBS: "-lssl -lcrypto "
configure: pkg-config: SSL_LDFLAGS: "-L/usr/lib64 "
configure: pkg-config: SSL_CPPFLAGS: "-I/usr/include "
checking for HMAC_Update in -lcrypto... no
checking for HMAC_Init_ex in -lcrypto... no
checking OpenSSL linking with -ldl... no
checking OpenSSL linking with -ldl and -lpthread... no
configure: OPT_OPENSSL:
/home/rauhdomi/build/out/host/x86_64-buildroot-linux-gnu/sysroot/usr
configure: OPENSSL_ENABLED: 
configure: error: --with-openssl was given but OpenSSL could not be detected
make[1]: *** [package/pkg-generic.mk:283:
/home/rauhdomi/build/out/build/libcurl-7.84.0/.stamp_configured] Error 1
make: *** [Makefile:40: _all] Error 2

After poking around for a bit I narrowed it down to the following part of
libcurl's package definition in Buildroot "libcurl.mk":

# configure adds the cross openssl dir to LD_LIBRARY_PATH which screws up
# native stuff during the rest of configure when target == host.
# Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
# are found first.
LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if
$(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib

Since on my build system "pkgconf" is also installed through my distro's
package manager (in version 1.8.0), its "libpkgconf.so.3" is used instead of
the one part of "$(HOST_DIR)/lib", when building "libcurl". Apparently this has
never been a problem before because the versions were semantically compatible,
which isn't the case any longer.

I guess this bug has the potential to affect any user having "pkgconf" already
installed on their system.

My proposal on how to fix the bug would be as follows:

diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index e241bd1c88..f6f5501f83 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -46,7 +46,7 @@ LIBCURL_DEPENDENCIES += openssl
 # native stuff during the rest of configure when target == host.
 # Fix it by setting LD_LIBRARY_PATH to something sensible so those libs
 # are found first.
-LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if
$(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)/lib:/usr/lib
+LIBCURL_CONF_ENV += LD_LIBRARY_PATH=$(if
$(LD_LIBRARY_PATH),$(LD_LIBRARY_PATH):)$(HOST_DIR)/lib:/lib:/usr/lib
 LIBCURL_CONF_OPTS += --with-ssl=$(STAGING_DIR)/usr \
        --with-ca-path=/etc/ssl/certs
 else

This way we always make sure that libs part of the SDK generated by Buildroot
take precedence over the ones coming from the build system.

Best regards,
Dominik

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
