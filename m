From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Jul 2014 09:26:25 +0200
Subject: [Buildroot] [PATCH 1/1] libssh2: fix library search path issues
 when zlib support enabled
In-Reply-To: <53B3A420.2090900@mind.be>
References: <1403878684-11934-1-git-send-email-acoffignal@geral.com>
 <20140629163016.41256df2@free-electrons.com>
 <f8abef86a41446e6ac7848dfa49e9842@VMSMBX02.gpi.pri>
 <20140630140216.49d73fa4@free-electrons.com>
 <53B1590D.9040606@geral.com> <53B3A420.2090900@mind.be>
Message-ID: <20140702092625.16c98f0d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 02 Jul 2014 08:18:08 +0200, Arnout Vandecappelle wrote:

>  However, I see in the configure script at line 14539:
> 
>     eval additional_libdir=\"$libdir\"
> 
> and a bit lower, at line 14616:
> 
>             dir="$additional_libdir"
>                                     if test -n "$acl_shlibext"; then
>               if test -f "$dir/$libname$shrext"; then
>                 found_dir="$dir"
>                 found_so="$dir/$libname$shrext"
> 
>  Since libdir is /usr/lib, it will indeed find libz there.
> 
>  I guess, Thomas, that on your machine, libz.so is in /usr/lib64 so configure
> doesn't find it there.

Right, it's in /usr/lib/x86_64-linux-gnu.

>  But basically that means this configure script is truly broken, not just for
> libz but for any use of AC_LIB_HAVE_LINKFLAGS...
> 
>  Perhaps AUTORECONF will help?

Alexandre, can you try to add LIBSSH2_AUTORECONF = YES to libssh2.mk,
in replacement to your fix?

That being said, there are a number of packages for which we explicitly
pass a --with-<foo>=$(STAGING_DIR), so it's not completely crazy to do
the same for libssh2, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
