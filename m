From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 16:13:20 +0100
Subject: [Buildroot] Blackfin Buildroot toolchain issue
In-Reply-To: <55084360.1070405@zacarias.com.ar>
References: <20150315221722.3645eb35@free-electrons.com>
 <20150315221813.173a36e2@free-electrons.com>
 <5508382D.7080008@zacarias.com.ar>
 <20150317153028.66788805@free-electrons.com>
 <55084360.1070405@zacarias.com.ar>
Message-ID: <20150317161320.50559502@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 17 Mar 2015 12:08:16 -0300, Gustavo Zacarias wrote:

> There's this as well:
> https://bugs.busybox.net/show_bug.cgi?id=7921
> Which basically boils down to uclibc NPTL requiring TLS.
> I'll check for space savings to see if it makes sense for it to even be
> an option.

I think it might make sense to keep it a blind option so that we don't
do --enable-tls on architectures that don't have TLS support at all (if
that even exists).

I have something like that in one of my branches:

commit 2ea50f3887747d6b72d6b133806d8b3ff995fe4a
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Wed Mar 11 23:05:00 2015 +0100

    gcc: make TLS option a blind option
    
    The current BR2_GCC_ENABLE_TLS option can lead users to create a
    non-working configuration: if they choose uClibc with NPTL and disable
    TLS support. This is bug #7921.
    
    Since TLS support is really an internal thing, it doesn't make a lot
    of sense to have a visible option for this. Therefore, this commit
    turns it to a blind option: TLS support is enabled in the compiler if
    glibc, eglibc or uClibc NPTL are used, and is disabled otherwise.
    
    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 1a5281c..120d4d8 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -109,12 +109,9 @@ config BR2_TOOLCHAIN_BUILDROOT_CXX
          your target system.
 
 config BR2_GCC_ENABLE_TLS
-       bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
+       bool
        default y
        depends on BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_EGLIBC || BR2_TOOLCHAIN_BUILDROOT_GLIBC
-       help
-         Enable the compiler to generate code for accessing
-         thread local storage variables
 
 config BR2_GCC_ENABLE_LTO
        bool "Enable compiler link-time-optimization support"


Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
