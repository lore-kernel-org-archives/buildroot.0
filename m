From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 22:22:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/libid3tag: needs host-gperf
In-Reply-To: <20200414102259.1285346-1-fontaine.fabrice@gmail.com>
References: <20200414102259.1285346-1-fontaine.fabrice@gmail.com>
Message-ID: <20200415222244.41dd959d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Apr 2020 12:22:59 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Since switch to debian in commit
> 210ccaef5784011bc035d0ae13611cb4e76f389f, host-gperf is needed to
> generate frametype.c which is empty by default otherwise build with

When I run "make libid3tag-patch", frametype.c is definitely not empty.
frametype.c is newer than frametype.gperf:

$ stat -c %y frametype.gperf frametype.c Makefile.am 
2004-01-23 10:41:32.000000000 +0100
2004-02-17 03:34:39.000000000 +0100
2020-04-15 22:19:56.233134509 +0200

However, the Makefile.am seems to be touched by one of the patches, and
the Makefile rule to regenerate using gperf goes like this:

$(srcdir)/frametype.c: $(srcdir)/frametype.gperf Makefile.am
        cd $(srcdir) &&  \
        gperf -tCcTonD -K id -N id3_frametype_lookup -s -3 -k '*'  \
                frametype.gperf |  \
        sed -e 's/\(struct id3_frametype\);/\1/' |  \
        sed -e '/\$$''Id: /s/\$$//g' >frametype.c

So, since the .c is older than the Makefile.am, it tries to regenerate
with gperf.

Could you double check this, and adjust the commit log as necessary ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
