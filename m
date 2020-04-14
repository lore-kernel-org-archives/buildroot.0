From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Apr 2020 22:37:06 +0200
Subject: [Buildroot] [PATCH 2/3] package/daq: bump version to 2.0.7
In-Reply-To: <20200414194840.1344508-2-bernd.kuhls@t-online.de>
References: <20200414194840.1344508-1-bernd.kuhls@t-online.de>
 <20200414194840.1344508-2-bernd.kuhls@t-online.de>
Message-ID: <20200414203706.GF5853@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2020-04-14 21:48 +0200, Bernd Kuhls spake thusly:
> Added md5 hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Please note that building this version without autoreconf is broken on
> my system in contrast to version 2.0.6, reason unknown after comparing
> the source code of both versions. The configure script is re-run during
> build

The reason is that configure.ac is more recent than the rest of the
autotools files (and in fact more recent than all the other files). Even
Makefile.am is more recent than Makefile.in:

    $ ls -1Art
    README
    missing
    Makefile.in
    Makefile.am
    m4
    ltmain.sh
    install-sh
    depcomp
    daq.dsp
    COPYING
    configure
    config.sub
    config.h.in
    config.guess
    compile
    ChangeLog
    api
    aclocal.m4
    sfbpf
    os-daq-modules
    daq.vcxproj
    configure.ac

    $ stat configure.ac configure
      File: configure.ac
      Size: 11296           Blocks: 24         IO Block: 4096   regular file
    Device: 10301h/66305d   Inode: 7884583     Links: 1
    Access: (0444/-r--r--r--)  Uid: ( 1000/  ymorin)   Gid: ( 1000/  ymorin)
    Access: 2020-04-14 22:22:36.035348803 +0200
    Modify: 2020-04-08 14:23:58.000000000 +0200
    Change: 2020-04-14 22:22:36.035348803 +0200
     Birth: -
      File: configure
      Size: 497485          Blocks: 976        IO Block: 4096   regular file
    Device: 10301h/66305d   Inode: 7879943     Links: 1
    Access: (0555/-r-xr-xr-x)  Uid: ( 1000/  ymorin)   Gid: ( 1000/  ymorin)
    Access: 2020-04-14 22:22:36.027348801 +0200
    Modify: 2020-04-08 14:23:57.000000000 +0200
    Change: 2020-04-14 22:22:36.031348803 +0200
     Birth: -

So we can see that configure is oh-so=slightly older than configure.ac.
So 'make' will try to resolve the problem by generating it again, which,
as you discovered, does not work so nicely. We could solve the issue
without running autoreconf with somthing like:

    define DAQ_TOUCH_AUTOSTUFF
        touch $(@D)/configure
        touch $(@D)/Makefile.in
    endef

That, provided that configure is indeed in sync with configure.ac, of
course. Note also that there might be an issue with Makefile.{am,in} in
sub-directories, as the .in are at exactly the same date as the .am.

Can you check if the above inded fixes the issue? If so, can you respin
a series, please? Note, this is still acceptable to have the paralle
fixup even if autoreconf is not mandatory.

Additionaly, I wonder why we don't switch to snort 3.0 and daq 2.2.2,
instead. Any idea?

Regards,
Yann E. MORIN.

> causing an error because of variables missing at this stage in
> DAQ_CONF_ENV to fix libpcap detection. Running autoreconf fixes this
> problem so I took the freedom to add the parallel build fix used by
> Gentoo in this series to save some build time again.
> 
>  package/daq/daq.hash | 4 +++-
>  package/daq/daq.mk   | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/daq/daq.hash b/package/daq/daq.hash
> index 6a0cb5ed07..680988c6d7 100644
> --- a/package/daq/daq.hash
> +++ b/package/daq/daq.hash
> @@ -1,5 +1,7 @@
> +# From https://www.snort.org/downloads/snort/md5s
> +md5 ea796f001d1b00302e4e69e337ab2460 daq-2.0.7.tar.gz
>  # Locally computed:
> -sha256 d41da5f7793e66044e6927dd868c0525e7ee4ec1a3515bf74ef9a30cd9273af0  daq-2.0.6.tar.gz
> +sha256 bdc4e5a24d1ea492c39ee213a63c55466a2e8114b6a9abed609927ae13a7705e  daq-2.0.7.tar.gz
>  
>  # Hash for license files:
>  sha256 07f28289c09fd9eb5a6ff7bc710ff40363601b1bbc6f3637d8ed412150e90819  COPYING
> diff --git a/package/daq/daq.mk b/package/daq/daq.mk
> index 06983c0b6d..f7360cdb3d 100644
> --- a/package/daq/daq.mk
> +++ b/package/daq/daq.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DAQ_VERSION = 2.0.6
> +DAQ_VERSION = 2.0.7
>  DAQ_SITE = https://www.snort.org/downloads/snort
>  DAQ_LICENSE = GPL-2.0
>  DAQ_LICENSE_FILES = COPYING
> -- 
> 2.25.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
