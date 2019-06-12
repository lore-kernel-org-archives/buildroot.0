From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Jun 2019 09:06:47 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-06-10
In-Reply-To: <20190612070200.GB6981@tungsten.ozlabs.ibm.com>
References: <20190611060050.0BE6687AFF@hemlock.osuosl.org>
 <20190612053352.GA6981@tungsten.ozlabs.ibm.com>
 <20190612084927.4e224933@windsurf>
 <20190612070200.GB6981@tungsten.ozlabs.ibm.com>
Message-ID: <20190612090647.388b2517@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Jun 2019 17:02:01 +1000
Sam Bobroff <sbobroff@linux.ibm.com> wrote:

> Ah, right. So that hack is no good, and it suggests that no hack on
> the buildroot side can work as long as GZIP is being overwritten by the
> package's build system. I'll have a go hacking the build system in cups
> to rename the GZIP variable but hopefully their upstream will fix it
> soon :-)
> 
> At least some of the compressed files are part of some kind of test data,
> so I'll see if they're the only ones and could perhaps be left out
> entirely.

Alternatively, Buildroot could use a gzip wrapper, installed in
$(HOST_DIR)/bin to pass this -n option when BR2_REPRODUCIBLE=y. The
gzip man page says that using the GZIP environment variable is
"obsolescent":

      The obsolescent environment variable GZIP can hold a set of default  options
       for  gzip.   These  options  are interpreted first and can be overwritten by
       explicit command line parameters.  As this can  cause  problems  when  using
       scripts,  this  feature  is  supported  only for options that are reasonably
       likely to not cause too much harm, and gzip warns if it is used.  This  fea?
       ture will be removed in a future release of gzip.

       You  can  use  an  alias  or script instead.  For example, if gzip is in the
       directory /usr/bin you can prepend $HOME/bin to your PATH and create an exe?
       cutable script $HOME/bin/gzip containing the following:

             #! /bin/sh
             export PATH=/usr/bin
             exec gzip -9 "$@"

Of course, if we go in this direction, we have to take care of what
happens if host-gzip is installed, as it would overwrite the wrapper.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
