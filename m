From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2015 17:57:41 +0200
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <55E86350.9070603@imgtec.com>
References: <1441148113-4894-1-git-send-email-yann.morin.1998@free.fr>
 <55E76348.3020509@mind.be> <55E76775.8030200@mind.be>
 <20150902220923.GD7845@free.fr>
 <CANPyyuODFsF95S_k6tJSdetokUXbeds3OgfQ6WwxAVh_M3VAyQ@mail.gmail.com>
 <55E86350.9070603@imgtec.com>
Message-ID: <20150903155741.GB3607@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, Vincent, All,

On 2015-09-03 16:12 +0100, Vicente Olivert Riera spake thusly:
> On 09/03/2015 03:46 PM, Mike Williams wrote:
> > On Wed, Sep 2, 2015 at 6:09 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >>>> On 02-09-15 00:55, Yann E. MORIN wrote:
> >>>>> systemd is incresaingly expected things to live in /usr/bin or
> >>>>> /usr/sbin.
> >>>>>
> >>>>> However, a lot of packages stil install stuff directly into /bin or
> >>>>> /sbin.
> >>>>>
> >>>>> Add an option so that /bin and /sbin be symlinks to /usr/bin and
> >>>>> /usr/sbin. Ditto for .lib for consistency.
> > 
> > The systemd build failed for me unless I modified systemd.mk as such:
> 
> same problem here:
> 
> mv:
> `/home/ldap/vriera/git-clones/buildroot-1/output/target/usr/lib/libsystemd.so.0'
> and
> `/home/ldap/vriera/git-clones/buildroot-1/output/target/lib/libsystemd.so.0'
> are the same file
> mv:
> `/home/ldap/vriera/git-clones/buildroot-1/output/target/usr/lib/libsystemd.so.0.8.0'
> and
> `/home/ldap/vriera/git-clones/buildroot-1/output/target/lib/libsystemd.so.0.8.0'
> are the same file
> make[5]: *** [libsystemd-install-hook] Error 1
> 
> > -- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -28,7 +28,6 @@ endif
> > 
> > SYSTEMD_CONF_OPTS += \
> >        --with-rootprefix= \
> > -       --with-rootlibdir=/lib \
> >        --enable-static=no \
> >        --disable-manpages \
> >        --disable-selinux \
> > @@ -37,7 +36,6 @@ SYSTEMD_CONF_OPTS += \
> >        --with-dbuspolicydir=/etc/dbus-1/system.d \
> >        --with-dbussessionservicedir=/usr/share/dbus-1/services \
> >        --with-dbussystemservicedir=/usr/share/dbus-1/system-services \
> > -       --enable-split-usr \
> >        --disable-efi \
> >        --disable-gnuefi \
> >        --disable-tests \
> > 
> > Once those changes were made everything worked fine so feel free to
> > add my Tested-by: Mike Williams <mike@mikebwilliams.com> if your next
> > patch spin includes them.
> 
> But I only needed to remove the "--with-rootlibdir=/lib \" line to make
> it build fine.

Well, since we're effectively ditching the split-usr case, there's no
reason to keep the --enable-split-usr configure option, is there?

Anyway, thanks both for testing! :-)

Mike, I won't carry your reviewd and tested tags, since I've made quite
some changes after all the comments, so that would not be fair to list a
review and test which would not have been conducted on the new code.
However, that's much appreciated! :-)  Do not hesitate to retest the new
version when I send it (soonish). Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
