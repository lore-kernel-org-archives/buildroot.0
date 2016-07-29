From: David Raeman <draeman@bbn.com>
Date: Thu, 28 Jul 2016 20:09:11 -0400
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in should grab
	HOST_DIR headers using -isystem instead of -I.
In-Reply-To: <20160728220029.GI5862@free.fr>
References: <20160725195227.21112-1-draeman@bbn.com>
 <20160728220029.GI5862@free.fr>
Message-ID: <000001d1e92d$6f450750$4dcf15f0$@bbn.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, All,

I am unable to reproduce the failure even using the defconfig from the autobuild entry.  However, I poked around in setup.py and believe I found the reason for the failure and perhaps the reason why I cannot reproduce it on my host system.

The root of the issue is in host-python-2.7.12/setup.py, around line 478.  The code is grabbing the CPPFLAGS environment variable and is building a list of include directories by grabbing all instances of the -I argument from that environment variable.  Of course that means it will miss the directory that is being provided with -isystem.

That list of include directories is then used to search for header files to determine which system libraries are available, and to enable or disable respective modules.  Around line 526, the directory /usr/include is automatically added to the list if not cross-compiling (since this is a host package).  Since my host system has zlib installed natively, this file-searching logic will find /usr/include/zlib.h and knows that zlib is on the host system, even though it did not search the proper area at .../buildroot/output/host/usr/include.  If the autobuild system does not have zlib header natively at /usr/include/zlib.h, that would explain why autobuild fails and yet I cannot reproduce the failure.

The solution should be a one-line patch to setup.py so that it also looks for the -isystem flag in CPPFLAGS.  I will follow-up with a patch.

Cheers,
David


-----Original Message-----
From: Yann E. MORIN [mailto:yann.morin.1998 at free.fr] 
Sent: Thursday, July 28, 2016 6:01 PM
To: David Raeman <draeman@bbn.com>
Cc: buildroot at buildroot.org
Subject: Re: [Buildroot] [PATCH 1/2] package/Makefile.in should grab HOST_DIR headers using -isystem instead of -I.

David, All,

On 2016-07-25 15:52 -0400, David Raeman spake thusly:
> HOST_CFLAGS includes a search path for HOST_DIR/usr/include using -I.  
> When HOST_CFLAGS is used by a package, these flags are passed to the 
> compiler ahead of flags passed by the package's internal make system.  
> If a package has a header file with the same name as a header file in 
> HOST_DIR, this causes the toolchain to prefer the file from the system 
> include directory because its -I appears first on the command line.  I 
> believe conflicts should prefer the file provided by the package.  
> This can be accomplished by using -isystem, which is more appropriate then -I for system-level include paths.

This breaks building the host-python:

    Python build finished, but the necessary bits to build these modules were not found:
    _bsddb             _curses            _curses_panel
    _sqlite3           _ssl               _tkinter
    bsddb185           bz2                dbm
    dl                 gdbm               imageop
    readline           sunaudiodev        zlib
    To find the necessary bits, look in setup.py in detect_modules() for the module's name.

which in turn makes host-python-setuptoolss fail to build as well:

    http://autobuild.buildroot.org/?reason=host-python-setuptools-18.7.1
    http://autobuild.buildroot.org/results/caf/cafe38622a592ac2df96306dfd9b2c9c0450e4f0/build-end.log

But the failure is really due to Python not finding the jost-zlib that is installed.

Could you have a look at this please?

Regards,
Yann E. MORIN.

> Real-world example: I need libfdt present in my HOST_DIR to install a 
> patched version of QEMU.  Meanwhile, the u-boot package provides its 
> own copy of libfdt.h that is modified from upstream.  If I have libfdt 
> installed into HOST_DIR, then host-uboot-tools fails to build because 
> it grabs the libfdt.h from the HOST_DIR area instead of using the 
> patched version from its own source tree.  This patch corrects this issue.
> 
> This assumes the -isystem flag is supported by the host compiler.
> 
> Signed-off-by: David Raeman <draeman@bbn.com>
> ---
>  package/Makefile.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in index 
> afd5d3a..b0ef706 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -222,7 +222,7 @@ UNZIP := $(shell which unzip || type -p unzip) -q
>  
>  APPLY_PATCHES = support/scripts/apply-patches.sh $(if $(QUIET),-s)
>  
> -HOST_CPPFLAGS  = -I$(HOST_DIR)/usr/include
> +HOST_CPPFLAGS  = -isystem $(HOST_DIR)/usr/include
>  HOST_CFLAGS   ?= -O2
>  HOST_CFLAGS   += $(HOST_CPPFLAGS)
>  HOST_CXXFLAGS += $(HOST_CFLAGS)
> --
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

--
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' 
| conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
