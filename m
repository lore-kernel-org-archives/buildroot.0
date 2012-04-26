From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 26 Apr 2012 22:12:15 +0200
Subject: [Buildroot] How do you add to library path?
In-Reply-To: <jnc1d9$t1p$1@dough.gmane.org>
References: <jnc1d9$t1p$1@dough.gmane.org>
Message-ID: <CAC1BbcRZ-Fft9=KZ7YpK66ykaFsN5XuatMWZCrG_5omk=MBKvA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 April 2012 19:42, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> What's the right way to permanently add a directory to the search path
> for dynamic libraries? ?(Preferably at build-time, rather than at
> run-time.)
>
> I've added the directory path to /etc/ld.so.conf using a post-build
> script. But, that file seems to be ignored at boot time (and there is
> no "ldconfig" to run even if I wanted to).
>
> I suppose I could set LD_LIBRARY_PATH globally, but for performance
> reasons, I'd prefer that the new path went into /etc/ld.so.cache. [I'm
> not sure how one sets a global environment variable anyway.]
>
> There have been several threads about this in the past, but none of
> them seemed to offer any answers...

$ grep -A8 config\ LDSO_CACHE extra/Configs/Config.in
config LDSO_CACHE_SUPPORT
	bool "Enable library loader cache (ld.so.conf)"
	depends on HAVE_SHARED
	default y
	help
	  Enable this to make use of /etc/ld.so.conf, the shared library loader
	  cache configuration file to support for non-standard library paths.
	  After updating this file, it is necessary to run 'ldconfig' to update
	  the /etc/ld.so.cache shared library loader cache file.
$ make help | grep util
  utils			- build target utilities
  hostutils		- build host utilities (see utils)
  install_utils		- install target utilities
  install_hostutils	- install host utilities

Generally speaking, you can globally export variables for sh in e.g.
/etc/profile

HTH,
