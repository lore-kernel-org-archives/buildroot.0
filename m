From: Trent Piepho <tpiepho@impinj.com>
Date: Tue, 27 Feb 2018 19:28:40 +0000
Subject: [Buildroot] [PATCH] package/skeleton-init-systemd: create a
 symlink /var/run to ../run
In-Reply-To: <05855f3c-84ce-01b1-d86f-0394a807d01f@mind.be>
References: <20180222221014.19584-1-romain.naour@gmail.com>
 <1519410337.25567.173.camel@impinj.com>
 <05855f3c-84ce-01b1-d86f-0394a807d01f@mind.be>
Message-ID: <1519759720.25567.204.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2018-02-24 at 19:15 +0100, Arnout Vandecappelle wrote:
> 
> > target/usr/share/factory/var/run -> ../run
> > 
> > It points to target/usr/share/factory/run, which is wrong.
> 
>  Well, as such it is not wrong. What is wrong IMO is that we do:
> 
>         for i in $(TARGET_DIR)/usr/share/factory/var/*; do \
>                 j="$${i#$(TARGET_DIR)/usr/share/factory}"; \
>                 if [ -L "$${i}" ]; then \
>                         printf "L+! %s - - - - %s\n" \
>                                 "$${j}" "../usr/share/factory/$${j}" \
>                         || exit 1; \
>                 else \
> ...
> 
>  The correct thing to do would be to copy the symlink I think, so something like:
> 
>                 if [ -L "$${i}" ]; then \
> 			target=`readlink $${i}`
>                         printf "L+! %s - - - - %s\n" \
>                                 "$${j}" "$${target}" \
>                         || exit 1; \

But that ends up with another problem.  While the var-factory.conf file
will be ok:
/var/run - - - - ../run

The target tree in the build area is not ok:

$ mkdir -p target/var/run/nginx
mkdir: cannot create directory ?target/var/run?: File exists

The problem is like I said, ${TARGET_DIR}/var is a symlink to
${TARGET_DIR}/usr/share/factory/var.  This means the link
${TARGET_DIR}/var/run -> ../run actually points to
${TARGET_DIR}/usr/share/factory/run, which does not exist.

So while you do get a valid /var on the target when tmpfiles is
creating things, the tree in the build area is broken and any package
that tries to create things in ${TARGET_DIR}/var/run (like nginx) will
break at target install time.

The double symlink that the current tmpfile code in buildroot makes
actually works.  I suspect that's why it was written that way to begin
with.

When building, you get:
${TARGET_DIR}/var -> ../usr/share/factory/var
${TARGET_DIR)/usr/share/factory/var/run -> ../../../../run
Producing, as desired:
${TARGET_DIR)/var/run -> ${TARGET_DIR}/run

Then on the target after tmpfiles has created the links:
/var is a directory
/var/run -> ../usr/share/factory/var/run
/usr/share/factory/var/run -> ../../../../run
Producing, again as desired:
/var/run -> /run

It would be simpler to just use explicit tmpfiles entries to make
everything, but one needs a valid target tree when building too.  Thus
the process of creating tmpfiles entries from the target tree.

>  However, I believe our var-factory.conf is even more wrong. systemd already
> supplies /usr/lib/tmpfiles.d/var.conf for exactly this purpose. That one already
> has the stanza to create the correct /var/run symlink. That var.conf is not
> complete though. For example, mysql expects /var/lib/mysql to exist while
> var.conf just creates /var/lib. So we do indeed need something like
> var-factory.conf, but I think that it should take into account anything that is
> already created by other tmpfiles configurations. So it should search each
> file/directory that it finds in /usr/share/factory/var in all of the existing
> tmpfiles.d entries, and if it is found there and it is not a C entry, it should
> recurse.

If buildroot were to create /etc/tmpfile.d/var.conf, instead of var-
factory.conf, it would override the systemd supplied var.conf rather
than augmenting it.

This is what I do to make RO rootfs work.  In my overlay, I have an my
own var.conf file in /etc to override the systemd one.  Mine does not
have the /var/run symlink, since buildroot will produces this.

A useful RO root likely also needs a persistent writable partition, for
 instance to store logs.  So I also have lines to make /var/log
persistent in the replacement for the systemd var.conf file.
