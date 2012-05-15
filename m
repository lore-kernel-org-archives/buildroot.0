From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 May 2012 20:28:03 +0200
Subject: [Buildroot] [PATCH v2] ccache: allow dynamic selection of cache
 directory
In-Reply-To: <4FA44012.8040008@mind.be>
References: <962414f85797a188de79.1333738037@beantl019720>
 <4FA44012.8040008@mind.be>
Message-ID: <20120515202803.0016103e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 04 May 2012 22:46:10 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>   On second review, a better implementation would be to replace the
> first sed by
> 
> sed -i 's,getenv("CCACHE_DIR"),getenv("BUILDROOT_CACHE_DIR"),'
> $(@D)/ccache.c

Euh? Why wouldn't we use CCACHE_DIR directly? What's the need of
renaming this environment variable here?

For the record, when I did the rework of ccache, I did hardcode the
cache directory into the ccache binary because I had issues passing
CCACHE_DIR everywhere. But I was trying to pass it to every gcc
invocation, and not globally through an export in the Makefile.

In any case, I would definitely prefer a solution that doesn't use a
wrapper. With a wrapper we would have:

 -> ccache wrapper
  -> ccache
   -> external toolchain wrapper
    -> gcc

If we can avoid the additional level of wrapping, it'd be nice.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
