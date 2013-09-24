From: Mischa Jonker <Mischa.Jonker@synopsys.com>
Date: Tue, 24 Sep 2013 13:56:44 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-09-19
In-Reply-To: <87hadebvkm.fsf@dell.be.48ers.dk>
References: <20130920063008.7C55952C101@lolut.humanoidz.org>
 <20130921054145.52b70d5e@skate> <87hadebvkm.fsf@dell.be.48ers.dk>
Message-ID: <E6BF041E97966E4DB955F0DF883AD2D685F0BE15@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

First of all sorry for responding late. I have been traveling the past two weeks with limited access to e-mail/internet.

>  Thomas> Hum, apparently on ARC, building libgcc requires having the C
> library  Thomas> headers. So, due to the change to build gcc in two
> passes instead of  Thomas> three, we're building libgcc in the first
> pass, before the C library is  Thomas> built, causing (I believe) the
> above failure. Mischa, if you have any  Thomas> insights about this, I'm
> interested :)

Yes, apparently these headers are used inside the 'gmon' part of libgcc. 

> 
>  Thomas> Considering this problem, and the other SSP problems, I'm
> starting to  Thomas> wonder if my patch that changes the toolchain
> build mechanism to use  Thomas> two passes instead of three shouldn't
> be reverted for now, until I find  Thomas> the time to investigate all the problems that it is causing.
> 
> I'm thinking the same. Will you have time to work on it in the next
> week or so? Otherwise I think we should revert for now.

I like the speed improvement:-) I can provide a patch that adds a 'uclibc-headers' target inside the uclibc package, and let gcc-initial depend on both uclibc-headers and linux-headers for ARC. That seems to work OK for me.

Something like this:

--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -8,7 +8,7 @@ GCC_INITIAL_VERSION = $(GCC_VERSION)
 GCC_INITIAL_SITE    = $(GCC_SITE)
 GCC_INITIAL_SOURCE  = $(GCC_SOURCE)
 
-HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES)
+HOST_GCC_INITIAL_DEPENDENCIES = $(HOST_GCC_COMMON_DEPENDENCIES) uclibc-headers linux-headers
 
 HOST_GCC_INITIAL_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
 
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 3993d9b..30a5461 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -547,6 +547,14 @@ define UCLIBC_INSTALL_STAGING_CMDS
        $(UCLIBC_INSTALL_UTILS_STAGING)
 endef
 
+uclibc-headers: dirs uclibc-patch
+       $(MAKE1) -C $(UCLIBC_DIR) \
+               $(UCLIBC_MAKE_FLAGS) \
+               PREFIX=$(STAGING_DIR) \
+               DEVEL_PREFIX=/usr/ \
+               RUNTIME_PREFIX=$(STAGING_DIR) \
+               install_headers
+
 uclibc-menuconfig: dirs uclibc-patch
        $(MAKE1) -C $(UCLIBC_DIR) \
                $(UCLIBC_MAKE_FLAGS) \

Mischa
