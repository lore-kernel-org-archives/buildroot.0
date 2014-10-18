From: Maarten ter Huurne <maarten@treewalker.org>
Date: Sun, 19 Oct 2014 01:28:04 +0200
Subject: [Buildroot] [PATCH v2] modplugtools: Added package
In-Reply-To: <20141018215748.GF31723@free.fr>
References: <1413602358-7476-1-git-send-email-maarten@treewalker.org>
 <1413662640-16030-1-git-send-email-maarten@treewalker.org>
 <20141018215748.GF31723@free.fr>
Message-ID: <108749465.hOBsSJgTxk@hyperion>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

It seems I copy-pasted the wrong message ID for In-Reply-To, so threading is 
a bit messed up. Sorry about that.

On Saturday 18 October 2014 23:57:48 Yann E. MORIN wrote:
> On 2014-10-18 22:04 +0200, Maarten ter Huurne spake thusly:
> > diff --git a/package/modplugtools/Config.in
> > b/package/modplugtools/Config.in new file mode 100644
> > index 0000000..20009b6
> > --- /dev/null
> > +++ b/package/modplugtools/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_MODPLUGTOOLS
> > +	bool "modplugtools"
> > +	select BR2_PACKAGE_LIBAO
> > +	select BR2_PACKAGE_LIBMODPLUG
> 
> modplugtools should inherit the dependencies from libmodplug, namely
> C++:
> 
>     config BR2_PACKAGE_MODPLUGTOOLS
>         bool "modplugtools"
>         depends on BR2_INSTALL_LIBSTDCPP # libmodplug
>         select BR2_PACKAGE_LIBMODPLUG
>         select BR2_PACKAGE_LIBAO

Hmm, I didn't expect to have to propagate dependencies manually. On the 
other hand, if Kconfig tried to do this automatically, including supporting 
conditional dependencies, it might end up as a full Prolog interpreter. ;)

> > +	help
> > +	  This installs the 'modplug123' command line tool to play tracker
> > music +	  files (MOD, S3M, XM etc.) using libmodplug.
> 
> Since the comments in the .mk file are not directly visible to the user,
> it would be nice to put a little blurb about OSS vs. ALSA, something like:
> 
>     modplugplay uses libao to play MOD files, so can output
>     via either ALSA or OSS.

The libao source supports about a dozen different backends, but only ALSA 
and OSS are supported in Buildroot at the moment. That could change in the 
future though (maybe someone wants to build the PulseAudio backend too), so 
I'd rather not duplicate information that might become outdated through 
changes in a different package.

However, I could mention that libao is used for playing.

> > +	  http://modplug-xmms.sourceforge.net/
> > diff --git a/package/modplugtools/modplugtools.mk
> > b/package/modplugtools/modplugtools.mk new file mode 100644
> > index 0000000..186d4a7
> > --- /dev/null
> > +++ b/package/modplugtools/modplugtools.mk
> > @@ -0,0 +1,23 @@
> > +#######################################################################
> > ######### +#
> > +# modplugtools
> > +#
> > +#######################################################################
> > ######### +
> > +MODPLUGTOOLS_VERSION = 0.5.3
> > +MODPLUGTOOLS_SITE =
> > http://downloads.sourceforge.net/project/modplug-xmms/modplug-tools
> > +MODPLUGTOOLS_LICENSE = GPLv3
> > +MODPLUGTOOLS_LICENSE_FILES = COPYING
> > +
> > +MODPLUGTOOLS_DEPENDENCIES = libao libmodplug
> > +
> > +# The modplugtools package can build two players: modplugplay that
> > plays
> > +# directly via OSS and modplug123 that plays via libao. Since
> > modplugplay +# won't work without OSS support and modern kernels are
> > likely to have no +# OSS or OSS emulation, we build only modplug123.
> > +# If you have a system without ALSA support for some reason, you can
> > still +# use modplug123 to play over OSS via libao.
> 
> This comment should instead be part of the commit log, and a simpler
> comment should be added instead here:
> 
>     # Only build the mp123 subdir, which contains 'modplug123', since
>     # we do not want to build 'modplugplay', as it requires legacy OSS
>     # and 'modplug123' can output via either ALSA or OSS.

OK.

> Also, if the options of modplugplay and modplug123 are the same, then
> you could just install a symlink modplugplay -> modplug123 .

I don't see what problem that would solve; "modplug123" on its own will do 
just fine.

Bye,
		Maarten
