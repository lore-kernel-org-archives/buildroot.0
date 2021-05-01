From: Alexander Dahl <post@lespocky.de>
Date: Sat, 1 May 2021 08:11:47 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/e2fsprogs: disable e2scrub
 conditionally
In-Reply-To: <20210430220325.GD2137340@scaer>
References: <20210430091627.3414609-1-tianyuanhao@aliyun.com>
 <20210430220325.GD2137340@scaer>
Message-ID: <20210501061147.vniwop7auf3vfb32@falbala.internal.home.lespocky.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hei hei,

On Sat, May 01, 2021 at 12:03:25AM +0200, Yann E. MORIN wrote:
> Tian, All,
> 
> On 2021-04-30 17:16 +0800, Tian Yuanhao via buildroot spake thusly:
> > e2scrub_all depends on coreutils' readlink. If you use busybox's
> > readlink, you will see the following error:
> > 
> >   readlink: invalid option -- 'e'
> > 
> > Disable e2scrub if its dependencies are not met.
> > 
> > Signed-off-by: Tian Yuanhao <tianyuanhao@aliyun.com>
> > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: James Hilliard <james.hilliard1@gmail.com>
> 
> I've done a few changes:
> 
>   - add a kconfig option like for other tools
>   - move the conditions to that new option
>   - reword the commit log accordingly
> 
> With the above: applied to master, thanks.

That sounds like quite invasive changes.  What about juts providing
feedback and wait for a new iteration? o.O

Greets
Alex

> 
> Regards,
> Yann E. MORIN.
> 
> > ---
> > Changes v2 -> v3:
> >   - check dependencies (suggested by James)
> > 
> > Changes v1 -> v2:
> >   - use make flags instead of configure options (suggested by Yann)
> > ---
> >  package/e2fsprogs/e2fsprogs.mk | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> > 
> > diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
> > index 4420d16aff..db4b849143 100644
> > --- a/package/e2fsprogs/e2fsprogs.mk
> > +++ b/package/e2fsprogs/e2fsprogs.mk
> > @@ -74,6 +74,16 @@ E2FSPROGS_INSTALL_STAGING_OPTS = \
> >  	DESTDIR=$(STAGING_DIR) \
> >  	install-libs
> >  
> > +# e2scrub support needs bash, coreutils, lvm2 and util-linux
> > +ifneq ($(BR2_PACKAGE_BASH)$(BR2_PACKAGE_COREUTILS)$(BR2_PACKAGE_LVM2)$(BR2_PACKAGE_UTIL_LINUX),yyyy)
> > +E2FSPROGS_MAKE_OPTS += E2SCRUB_DIR=
> > +endif
> > +
> > +E2FSPROGS_INSTALL_TARGET_OPTS = \
> > +	$(E2FSPROGS_MAKE_OPTS) \
> > +	DESTDIR=$(TARGET_DIR) \
> > +	install
> > +
> >  # Package does not build in parallel due to improper make rules
> >  define HOST_E2FSPROGS_INSTALL_CMDS
> >  	$(HOST_MAKE_ENV) $(MAKE1) -C $(@D) install install-libs
> > -- 
> > 2.25.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
/"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
\ / CAMPAIGN     | speech censured, the first thought forbidden, the
 X  AGAINST      | first freedom denied, chains us all irrevocably.?
/ \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210501/9830f14a/attachment.asc>
