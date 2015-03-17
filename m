From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 17 Mar 2015 23:17:04 +0100
Subject: [Buildroot] [PATCH v1] collectd: fix postgresql library
 detection
In-Reply-To: <20150317225808.3c2af021@free-electrons.com>
References: <1426628645-26181-1-git-send-email-ps.report@gmx.net>,
 <20150317225808.3c2af021@free-electrons.com>
Message-ID: <trinity-7eabbdff-c2e6-4caa-b52a-096bcb8a8845-1426630624690@3capp-gmx-bs37>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello Thomas,

> Gesendet: Dienstag, 17. M?rz 2015 um 22:58 Uhr
> Von: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> An: "Peter Seiderer" <ps.report@gmx.net>
> Cc: buildroot at busybox.net
> Betreff: Re: [Buildroot] [PATCH v1] collectd: fix postgresql library detection
>
> Dear Peter Seiderer,
> 
> On Tue, 17 Mar 2015 22:44:05 +0100, Peter Seiderer wrote:
> 
> >  ifeq ($(BR2_PACKAGE_POSTGRESQL),y)
> >  	COLLECTD_CONF_OPTS += --with-libpq=$(STAGING_DIR)/usr/bin/pg_config
> > +	COLLECTD_CONF_ENV = LIBS="-lpthread -lm"
> 
> If they are needed, why isn't pg_config returning those linker flags?
> 

Because pg_config only implements --includedir and --libdir:
    $ cat host/usr/sh4-buildroot-linux-uclibc/sysroot/usr/bin/pg_config
#!/bin/sh

#
# Minimal pg_config implementation as replacement for the native pg_config application
# Only implements --includedir and --libdir
#

prefix=/home/seiderer/BUildroot/build_sh_postgresql_collectd/host/usr/sh4-buildroot-linux-uclibc/sysroot/usr

case "$1" in
  --includedir)
        echo "$prefix/include"
        ;;
  --libdir)
        echo "$prefix/lib"
        ;;
  *)
        echo "Usage: $0 {--includedir|--libdir}"
esac


And collectd configure uses only this two options...

> I'm sorry to be annoying, but I really don't like adding LIBS variables
> all over the place, because they tend to become wrong/unneeded, and we
> never notice.

...suspected this argument, I am open for other suggestions, but I think
this aproach is the least invasive...

Regards,
Peter

> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>
