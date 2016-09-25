From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sun, 25 Sep 2016 18:25:44 +0200
Subject: [Buildroot] [PATCH] darkhttpd: new package
In-Reply-To: <20160917141052.61d23a72@free-electrons.com>
References: <1474111899-5705-1-git-send-email-eric.le.bihan.dev@free.fr>
 <20160917141052.61d23a72@free-electrons.com>
Message-ID: <20160925162543.GA23763@itchy>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On 16-09-17 14:10:52, Thomas Petazzoni wrote:
> On Sat, 17 Sep 2016 13:31:39 +0200, Eric Le Bihan wrote:
> > This new package provides darkhttpd, a simple, fast HTTP 1.1 web server
> > for static content.
> >
> > Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>
> Thanks for this patch. A few comments/questions below.
>
> > diff --git a/package/darkhttpd/Config.in b/package/darkhttpd/Config.in
> > new file mode 100644
> > index 0000000..bd12588
> > --- /dev/null
> > +++ b/package/darkhttpd/Config.in
> > @@ -0,0 +1,18 @@
> > +config BR2_PACKAGE_DARKHTTPD
> > +	bool "darkhttpd"
>
> Did you validate the architecture/toolchain dependencies? MMU, C++,
> wchar, etc. ?

I missed a fork(), so it will depend on BR2_USE_MMU.

> > +	  Note: when Busybox or SysV init system is used, darkhttpd logs to
> > +	  /var/log/darkhttpd.log, which may grow beyond the file system limits.
> > +	  Please consider using a log rotating system such as logrotate or
> > +	  change the path to the log file using the configuration file.
>
> Is it really worth having such a comment here? I believe this applies
> to many (all?) daemons.

Of course, so maybe a warning about this should be added in some section
of the manual... I'll remove it.

> > +# Allow a few customizations from a config file
> > +test -r /etc/default/darkhttpd && . /etc/default/darkhttpd
> > +
> > +DARKHTTPD_PROG=/usr/sbin/darkhttpd
> > +DARKHTTPD_PIDFILE=/var/run/darkhttpd.pid
> > +DARKHTTPD_FLAGS="$DARKHTTPD_FLAGS --chroot --uid nobody --gid www-data"
> > +DARKHTTPD_ARGS="${DARKHTTPD_ROOT:-/var/www} --log /var/log/darkhttpd.log $DARKHTTPD_FLAGS"
>
> I don't understand why you have this construction of _ARGS in several
> steps. What about:
>
> DARKHTTPD_ARGS="${DARKHTTPD_ROOT:-/var/www} --log /var/log/darkhttpd.log $DARKHTTPD_ARGS --chroot --uid nobody --gid www-data"
>
> instead (assuming the variable in the /etc/default file is
> DARKHTTP_ARGS instead of DARKHTTP_FLAGS, the former being much more
> common than the latter IMO).

I used this to avoid a long line. It is only a cosmetic choice. I'll use
a single statement.

I used two distinct variables named $DARKHTTPD_ROOT and $DARKHTTP_FLAGS
because the command line parsing of darkhttpd is not very tolerant: the
root directory must be the first argument and all remaining ones should
be options.

$DARKHTTPD_ARGS is too general and does not highlight this.

> > +DARKHTTPD_MAKE_OPTS = CC="$(TARGET_CC)"
>
> Can you use $(TARGET_CONFIGURE_OPTS) instead ?

Will do!

Thanks for the review.

Best regards,

--
ELB
