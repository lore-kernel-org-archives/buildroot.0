From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 17 Feb 2016 10:45:41 +0100
Subject: [Buildroot] [PATCH v2 1/2] libimxvpuapi: add new package
In-Reply-To: <CAAMH-yuzsvt-6U-JX7RhNoEcWoJA4ahRm4U27LvWLwXyg4UtTg@mail.gmail.com>
References: <1454363759-23349-1-git-send-email-gary.bisson@boundarydevices.com>
 <1454363759-23349-2-git-send-email-gary.bisson@boundarydevices.com>
 <20160216215313.15f228fe@gmx.net>,
 <CAAMH-yuzsvt-6U-JX7RhNoEcWoJA4ahRm4U27LvWLwXyg4UtTg@mail.gmail.com>
Message-ID: <trinity-cadde813-570a-4e7a-b943-d69330bfa040-1455702340920@3capp-gmx-bs24>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gary,

> Gesendet: Dienstag, 16. Februar 2016 um 23:57 Uhr
> Von: "Gary Bisson" <gary.bisson@boundarydevices.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Betreff: Re: [Buildroot] [PATCH v2 1/2] libimxvpuapi: add new package
>
> Peter, All,
> 
> On Tue, Feb 16, 2016 at 9:53 PM, Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > Hello Gary,
> >
> > On Mon,  1 Feb 2016 22:55:58 +0100, Gary Bisson <gary.bisson@boundarydevices.com> wrote:
> >
> > > <snip>
> > > +LIBIMXVPUAPI_VERSION = 0.10.1
> > > +LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
> > > +LIBIMXVPUAPI_LICENSE = LGPLv2.1+
> > > +LIBIMXVPUAPI_LICENSE_FILES = LICENSE
> > > +LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu
> > > +LIBIMXVPUAPI_INSTALL_STAGING = YES
> > > +
> > > +define LIBIMXVPUAPI_CONFIGURE_CMDS
> > > +     cd $(@D); \
> > > +     $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python2 ./waf configure \
> > > +             --prefix=/usr
> > > +endef
> >
> > On my x86_64 (OpenSUSE-13.2) host build the libs and libimxvpuapi.pc
> > are installed into $(STAGING_DIR)/usr/lib64 and $(TARGET_DIR)/usr/lib64.
> >
> > To be usable by eg. gst1-imx the install path should be $(STAGING_DIR)/usr/lib
> > and $(TARGET_DIR)/usr/lib. To achieve this I added '--libdir=/usr/lib' to
> > overwrite the default '/usr/lib64':
> 
> I'd like to understand why it behaves like this with your setup. I'm
> using a 64-bit OS too (Debian Testing) but the libs go to /usr/lib as
> expected.
> 
> Could you pastebin the full log of libimxvpuapi build, your buildroot
> configuration as well as you 'env'?
> 

Build log attached (rm -r build/libimxvpuapi-0.10.1; make V=1 2>&1 | tee out_build_libimxvpuapi_orig.txt),
same buildroot setup as in previous e-mail: out_build_libimxvpuapi_orig.txt

$ cd build/libimxvpuapi-0.10.1/
$ /home/seiderer/Work/BD_Nitrogen6x/Buildroot-2016-02/build_2016_02_001/host/usr/bin/python2 ./waf configure --help
...
    --libdir=LIBDIR     object code libraries [EXEC_PREFIX/lib64]
...

$ env
LESSKEY=/etc/lesskey.bin
NNTPSERVER=news
MANPATH=/usr/local/man:/usr/share/man
HOSTNAME=XXXXXXX
XKEYSYMDB=/usr/X11R6/lib/X11/XKeysymDB
HOST=XXXXXXX
TERM=rxvt-unicode-256color
SHELL=/bin/bash
PROFILEREAD=true
HISTSIZE=1000
MORE=-sl
JRE_HOME=/usr/lib64/jvm/java/jre
USER=seiderer
LS_COLORS=
XNLSPATH=/usr/share/X11/nls
QEMU_AUDIO_DRV=pa
HOSTTYPE=x86_64
CONFIG_SITE=/usr/share/site/x86_64-unknown-linux-gnu
FROM_HEADER=
PAGER=less
CSHEDIT=emacs
XDG_CONFIG_DIRS=/etc/xdg
LIBGL_DEBUG=quiet
MINICOM=-c on
MAIL=/var/mail/seiderer
PATH=/opt/tools/bin:/home/seiderer/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games
CPU=x86_64
JAVA_BINDIR=/usr/lib64/jvm/java/bin
INPUTRC=/home/seiderer/.inputrc
PWD=/home/seiderer/Work/BD_Nitrogen6x/Buildroot-2016-02/build_2016_02_001/build/libimxvpuapi-0.10.1
gopher_proxy=
JAVA_HOME=/usr/lib64/jvm/java
LANG=en_US.UTF-8
PYTHONSTARTUP=/etc/pythonstart
SDK_HOME=/usr/lib64/jvm/java
GPG_TTY=/dev/pts/3
AUDIODRIVER=pulseaudio
QT_SYSTEM_DIR=/usr/share/desktop-data
JDK_HOME=/usr/lib64/jvm/java
SHLVL=1
HOME=/home/seiderer
ALSA_CONFIG_PATH=/etc/alsa-pulse.conf
SDL_AUDIODRIVER=pulse
LESS_ADVANCED_PREPROCESSOR=no
OSTYPE=linux
LS_OPTIONS=-N --color=none -T 0
WINDOWMANAGER=/usr/bin/gnome
G_FILENAME_ENCODING=@locale,UTF-8,ISO-8859-15,CP1252
LESS=-M -I -R
MACHTYPE=x86_64-suse-linux
LOGNAME=seiderer
CVS_RSH=ssh
XDG_DATA_DIRS=/usr/share
SSH_CONNECTION=10.5.121.193 49159 10.5.123.15 22
LESSOPEN=lessopen.sh %s
XDG_RUNTIME_DIR=/run/user/1000
DISPLAY=localhost:13.0
XAUTHLOCALHOSTNAME=DLxX9PSE02
NO_AT_BRIDGE=1
LESSCLOSE=lessclose.sh %s %s
G_BROKEN_FILENAMES=1
JAVA_ROOT=/usr/lib64/jvm/java
COLORTERM=1
BASH_FUNC_mc%%=() {  . /usr/share/mc/mc-wrapper.sh
}
OLDPWD=/home/seiderer/Work/BD_Nitrogen6x/Buildroot-2016-02/build_2016_02_001
_=/usr/bin/env

Regards,
Peter

> > --- a/package/libimxvpuapi/libimxvpuapi.mk
> > +++ b/package/libimxvpuapi/libimxvpuapi.mk
> > @@ -14,7 +14,7 @@ LIBIMXVPUAPI_INSTALL_STAGING = YES
> >  define LIBIMXVPUAPI_CONFIGURE_CMDS
> >         cd $(@D); \
> >         $(TARGET_CONFIGURE_OPTS) $(HOST_DIR)/usr/bin/python2 ./waf configure \
> > -               --prefix=/usr
> > +               --prefix=/usr --libdir=/usr/lib
> >  endef
> >
> >  define LIBIMXVPUAPI_BUILD_CMDS
> >
> >
> > With this you can add my
> >
> > Tested-by: Peter Seiderer <ps.report@gmx.net>
> >
> > for '...! imxvpudec ! imxipuvideosink'
> 
> Ok, I'll do that once I understand the difference which requires this
> libdir argument.
> 
> > But I had problems using the imxeglvivsink element and
> > with qt5 eglfs, suspecting your 'Update most Freescale packages' patch series
> > (using buildroot-2016.02-rc1 with your '[PATCH v3 0/2] gst1-imx: bump version to 0.12.0'
> > patches on top), but did not find time yet to investigate further...
> 
> Does a basic gstreamer pipeline work?
> # gst-launch-1.0 videotestsrc ! imxeglvivsink
> 
> If not there's no wonder qt5 doesn't like it. I haven't tried qt5 but
> I'm sure the gstreamer imxeglvivsink does work.
> 
> In case you've enabled BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV, you
> might need to load the Galcore module manually in case you don't have
> eudev for instance:
> # insmod /lib/modules/3.14.28/extra/galcore.ko
> 
> Regards,
> Gary
> 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: out_build_libimxvpuapi_orig.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160217/72bf950a/attachment.txt>
