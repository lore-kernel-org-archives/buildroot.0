From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Jul 2017 17:45:52 +0200
Subject: [Buildroot] [PATCH 19/20] system: make systemd work on a
 read-only rootfs
In-Reply-To: <f137feaf-3cb1-4a9a-0331-d51bca014f50@mind.be>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <c74e8ad5fca764a23b9392af5cb83ecefb4a5817.1500398733.git.yann.morin.1998@free.fr>
 <f137feaf-3cb1-4a9a-0331-d51bca014f50@mind.be>
Message-ID: <20170724154552.GC2918@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-07-24 00:18 +0200, Arnout Vandecappelle spake thusly:
> On 18-07-17 19:25, Yann E. MORIN wrote:
> [snip]
> > With a line like:
> > 
> >     C /var/something - - - -
> > 
> > it will look for /usr/share/factory/something and copy it (recursively
> > if it is a directory) to /var/something, but only if it does not already
> > exist there.
> 
>  So we could just have a line
> 
> C /var - - - -
> 
> and be done with it?

No, because systemd-tmpfiles will only act if the entry does not exist.
But our case, /var does exist, and it is a mount point. We must have
/var to exist, because / is read-only.

If we were to use your construct, then systemd-tmpfiles would never do
anything at all.

From TMPFILES.D(5):

  C
    Recursively copy a file or directory, if the destination files
    or directories do not exist yet. Note that this command will
    not descend into subdirectories if the destination directory
    already exists. Instead, the entire copy operation is skipped.
    If the argument is omitted, files from the source directory
    /usr/share/factory/ with the same name are copied. Does not
    follow symlinks.

So we must have one tmpfile entry for each entry we need in /var/.

> [snip]
> > Note that we treat symlinks a little bit specially, by creating symlinks
> > to the factory defaults rather than copying them.
> 
>  You forgot to explain why. I guess because a relative symlink that was created
> based on the /usr/share/factory location wouldn't work any more.
> 
>  However, it is possible that a package creates a relative symlink based on the
> /var location. Most symlinks that we create in Buildroot stupidly assume that
> all the path components are not symlinks. So a package could for example do
> 
> ln -sf ../srv/www $DESTDIR/var/www
> 
> This will now create a broken symlink. It's fine as long as it is copied as-is
> to /var, but not with your approach...

Hmm... I'll have to think about that a bit more, even though I think I
have taken that into account...

At least I did see no breakage so far, but the set of packages I built
was arguably rather limited...

> [snip]
> > +define SKELETON_SYSTEMD_ROOT_RO_OR_RW
> > +	mkdir -p $(TARGET_DIR)/etc/systemd/tmpfiles.d
> > +	mkdir -p $(TARGET_DIR)/usr/share/factory
> > +	ln -s usr/share/factory $(TARGET_DIR)/var
> 
>  Since other stuff may also want to put things in /usr/share/factory, I think it
> should be
> 	mkdir -p $(TARGET_DIR)/usr/share/factory/var
> 	ln -s usr/share/factory/var $(TARGET_DIR)/var

Not really, because systemd-tmpfile will look in exactly the factory
path to find the source of the copy/link. See the exerpt I pasted above.

So, given this entry, for example:

    C /var/foo - - - -

systemd-tmpfiles will see if it can find /usr/share/factory/foo not
/usr/share/factory/var/foo

And if other packages install things in factory, they would most
probably install their own tmpfile description to copy it in place on
boot, becasue factory *is* for factory settings.

Thanks!

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> [snip]
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
