From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 8 Aug 2017 00:19:26 +0200
Subject: [Buildroot] Failing bind 9.11.1-P3 configure failure
In-Reply-To: <15dba6532c8-c03-26aa@webjas-vab011.srv.aolmail.net>
References: <15dba6532c8-c03-26aa@webjas-vab011.srv.aolmail.net>
Message-ID: <20170808001926.554b1a0a@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello 'grunpferd'(*),

On Sun, 6 Aug 2017 21:53:01 -0400, grunpferd at netscape.net wrote:

> Currently unable to build bind 9.11.1-P3.
> 
> 
> 
> It looks like there is some confusion over the local existence of header files resulting in the following error message.
> Previous version of bind compiles successfully.
> 

Could be, mind to try with BR2_COMPILER_PARANOID_UNSAFE_PATH enabled?

> 
> ...
> checking for using OpenSSL for hash functions... no
> checking for PKCS11 support... no
> checking for PKCS11 tools... disabled
> checking for native PKCS11... disabled
> checking for clock_gettime... yes
> checking for lmdb library... yes
> checking for library containing mdb_env_create... no
> configure: error: found lmdb include but not library.
> package/pkg-generic.mk:217: recipe for target '/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/bind-9.11.1-P3/.stamp_configured' faile
> d
> make: *** [/u/rfg/w/buildroot_tk1_gcc7_4.12/output/build/bind-9.11.1-P3/.stamp_configured] Error 1
> 
> ...

Local build of bind here (with a random configuration) succeeds, mind to try
the following buildroot patch:

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 988f40e1c2..c65568e9e3 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -24,6 +24,7 @@ BIND_CONF_ENV = \
        BUILD_CC="$(TARGET_CC)" \
        BUILD_CFLAGS="$(TARGET_CFLAGS)"
 BIND_CONF_OPTS = \
+       --without-lmdb \
        --with-libjson=no \
        --with-randomdev=/dev/urandom \
        --enable-epoll \


Regards,
Peter

(*) Using a real name instead of any pseudonym or fake name is preferred

> 
> 
> So buildroot can't configure bind-9.11.1-P3.
> 
> 
> Ross
> 
> 
> 
> 
> 
> 
> 
> 
