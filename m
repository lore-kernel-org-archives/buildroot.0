From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 27 Sep 2017 22:57:00 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-09-26
In-Reply-To: <20170927063058.D8F91208CD@mail.free-electrons.com>
References: <20170927063058.D8F91208CD@mail.free-electrons.com>
Message-ID: <20170927195700.7jy5ifjzzjpuslem@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

On Wed, Sep 27, 2017 at 08:30:58AM +0200, Thomas Petazzoni wrote:
>     mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/bb42c6ac8d3783bb8203d7771640492cdd063148 |     
>         m68k |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/8e1f398a8ebd2f4ab403bc64e64624398cfe241a |     
>     mips64el |                      nmap-7.60 | NOK | http://autobuild.buildroot.net/results/678cbb13c6644328ff0f9032f4900ae8bf9ab2db |     

It looks like the nmap patch below would fix libssh2 detection:

diff --git a/configure.ac b/configure.ac
index 3d00e164e90f..474769aff7ea 100644
--- a/configure.ac
+++ b/configure.ac
@@ -674,7 +674,7 @@ AC_HELP_STRING([--without-libssh2], [Compile without libssh2]),
       AC_CHECK_LIB(ssh2, libssh2_version,
         [have_libssh2=yes
         LIBSSH2_INC=$with_libssh2/include
-        LIBSSH2_LIB=$with_libssh2/lib])],,[-lm])
+        LIBSSH2_LIB=$with_libssh2/lib], [-lm])],,)
 
     LDFLAGS=$_ldflags
     CPPFLAGS=$_cppflags

But autoreconf fails:

autoheader: warning: missing template: BSDI
autoheader: Use AC_DEFINE([BSDI], [], [Description])
autoheader: warning: missing template: DEC
autoheader: warning: missing template: FREEBSD
autoheader: warning: missing template: HAVE_IP_IP_SUM
autoheader: warning: missing template: HAVE_LIBPCAP
autoheader: warning: missing template: HAVE_OPENSSL
[...]
.../output/host/bin/autoheader failed with exit status: 1

This is caused by missing AC_DEFINE description parameter in some places 
throughout configure.ac. Not sure how upstream generated the bundled configure 
script using the same autoconf version, 2.69.

Anyone got an idea?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
