From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Jun 2014 00:19:53 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: bump to version 1.42.10
In-Reply-To: <1401833214-31074-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 3 Jun 2014 19:06:54 -0300")
References: <1401833214-31074-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87bnu9r5yu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Drop --disable-tls since it's not needed.
 > Add --disable-rpath to avoid unnecessary pollution.

 > e4defrag now needs an (e)glibc toolchain because of sync_file_range()
 > See e2fsprogs commit 58229aaf85d435469e901c974f31ead6d9124166

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  package/e2fsprogs/Config.in                        |  4 +++
 >  ..._CFLAGS-add-includes-when-cross-compiling.patch | 29 ++++++++++++++++++++++
 >  package/e2fsprogs/e2fsprogs.mk                     |  8 +++---
 >  3 files changed, 38 insertions(+), 3 deletions(-)
 >  create mode 100644 package/e2fsprogs/e2fsprogs-0002-BUILD_CFLAGS-add-includes-when-cross-compiling.patch

 > diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
 > index eb7bedb..1400f49 100644
 > --- a/package/e2fsprogs/Config.in
 > +++ b/package/e2fsprogs/Config.in
 > @@ -51,6 +51,10 @@ config BR2_PACKAGE_E2FSPROGS_E2UNDO
 >  config BR2_PACKAGE_E2FSPROGS_E4DEFRAG
 >  	bool "e4defrag"
 >  	depends on !BR2_avr32 && !BR2_nios2 # fallocate not implemented
 > +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # sync_file_range not impl
 > +
 > +comment "e4defrag needs an (e)glibc toolchain"
 > +	depends on BR2_TOOLCHAIN_USES_UCLIBC

What about musl? To match the comment we should use
!BR2_TOOLCHAIN_USES_GLIBC instead.

-- 
Bye, Peter Korsgaard
