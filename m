From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Oct 2013 14:26:06 +0200
Subject: [Buildroot] [PATCH] rsync: use system zlib and popt,
 also do not lose debug options
In-Reply-To: <1381923631-26549-1-git-send-email-denis@mingulov.com>
References: <1381923631-26549-1-git-send-email-denis@mingulov.com>
Message-ID: <20131016142606.10a9585c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Denis Mingulov,

On Wed, 16 Oct 2013 14:40:31 +0300, Denis Mingulov wrote:
> rsync by default compiles statically its own zlib and popt
> libraries, it is better to use system wide libraries instead -
> both for disk and memory consumption. Change rsync package
> accordingly.
> 
> Also previously a debug configure option has been lost, as
> overwritten by '--with-included-popt' option - fixed.
> 
> For example, on ARMv5 rsync binary size is reduced by about 25%.
> 
> Signed-off-by: Denis Mingulov <denis@mingulov.com>

Thanks, looks good, but I have one suggestion.

>  RSYNC_CONF_OPT = $(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug)
> -RSYNC_CONF_OPT = --with-included-popt
> +RSYNC_CONF_OPT += --with-included-zlib=no
> +RSYNC_CONF_OPT += --with-included-popt=no

Make this:

RSYNC_CONF_OPT = \
	$(if $(BR2_ENABLE_DEBUG),--enable-debug,--disable-debug) \
	--with-included-zlib=no \
	--with-included-popt=no

while it makes sense to append to <pkg>_CONF_OPT using += when such
appends are done under conditions, for the general configuration
options, just one assignment is clearer and that's what we use more or
less everywhere in Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
