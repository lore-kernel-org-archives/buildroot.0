From: ANDY KENNEDY <ANDY.KENNEDY@adtran.com>
Date: Tue, 28 Jun 2016 19:49:22 +0000
Subject: [Buildroot] [PATCH] Reiserfsprogs
In-Reply-To: <20160628181846.25cc7912@free-electrons.com>
References: <F9C551623D2CBB4C9488801D14F864C6EE83116F@ex-mb1.corp.adtran.com>
 <20160628181846.25cc7912@free-electrons.com>
Message-ID: <F9C551623D2CBB4C9488801D14F864C6EE831CFF@ex-mb1.corp.adtran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: Tuesday, June 28, 2016 11:19 AM
> To: ANDY KENNEDY
> Cc: 'buildroot at busybox.net'
> Subject: Re: [Buildroot] [PATCH] Reiserfsprogs
> 
> Hello,
> 
> Thanks for this patch. See my review below.

Thomas,

Got it.  Thanks for the detailed review.

I'll make the changes and resubmit.  I didn't change much from
what Rod had done, but do not disagree with your changes.

A couple of questions below.

Andy

> 
> On Mon, 27 Jun 2016 18:46:26 +0000, ANDY KENNEDY wrote:
> > 1234567890123456789012345678901234567890123456789012345678901234567890
> > This patch was attempted earlier by Rod Boyce:
> >
> > All,
> >
> > Attached is a patch that adds reiserfsprogs to build root.
> >
> > Regards,
> > Rod Boyce
> > Index: package/Config.in
> >
> > I have tweaked it to make it fit into the latest git repo.
> >
> > This patch adds support for reiserfsprogs.
> 
> All of this commit log is not appropriate. It should just be:
> 
> reiserfsprogs: new package
> 
> and pretty much nothing else, except if you have other comments to add
> about the package. Remember that the commit log stays forever in the
> Git history of the project, so we don't need the "All, Attached is a
> patch ....".
> 
> >
> > Signed-off-by:  Andy Kennedy <andy.kennedy@adtran.com>
> 
> I am not sure your patch has been formatted using Git. Please use "git
> format-patch" to format your patch, and then "git send-email" to send
> it.

What was the formatting problem?  I'm not using git to do the formatting,
but a side-by-side diff of the directories.  Also, doesn't git send-email
require direct access to SMTP from the workstation?  I don't have that.

And, if you want the absolute truth of the matter, I'm not a git user
and struggle with using it (so, pointers for the "right way" would
not be taken as patronizing -- I'm okay with spoon feeding).

> 
> > diff -Naur a/package/reiserfsprogs/Config.in b/package/reiserfsprogs/Config.in
> > --- a/package/reiserfsprogs/Config.in	1969-12-31 18:00:00.000000000 -0600
> > +++ b/package/reiserfsprogs/Config.in	2016-06-24 14:03:06.000000000 -0500
> > @@ -0,0 +1,36 @@
> > +
> 
> Unnecessary empty line.
> 
> > +config BR2_PACKAGE_REISERFSPROGS
> > +	bool "reiserfsprogs"
> > +	select BR2_PACKAGE_ACL
> > +	select BR2_PACKAGE_UTIL_LINUX
> > +	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> 
> This dependency is not needed. reiserfsprogs doesn't use libblkid
> directly.
> 
> > +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> > +	select BR2_PACKAGE_E2FSPROGS
> 
> Alphabetic ordering would be better.
> 
> > +	help
> > +	  The reiserfs file system utilities.
> > +
> > +	  https://reiser4.wiki.kernel.org/index.php/Main_Page
> > +
> > +if BR2_PACKAGE_REISERFSPROGS
> > +
> > +config BR2_PACKAGE_REISERFSPROGS_MKREISERFS
> > +	bool "mkreiserfs"
> > +	default y
> > +
> > +config BR2_PACKAGE_REISERFSPROGS_REISERFSCK
> > +	bool "reiserfsck"
> > +	default y
> > +
> > +config BR2_PACKAGE_REISERFSPROGS_RESIZE_REISERFS
> > +	bool "resize_reiserfs"
> > +	default y
> > +
> > +config BR2_PACKAGE_REISERFSPROGS_REISERFSTUNE
> > +	bool "reiserfstune"
> > +	default y
> > +
> > +config BR2_PACKAGE_REISERFSPROGS_DEBUGREISERFS
> > +	bool "debugreiserfs"
> > +	default y
> 
> Please remove all those sub-options, the size of each binary is not big
> enough to justify having sub-options:
> 
> lrwxrwxrwx 1 thomas thomas     13 juin  28 18:12 output/target/usr/sbin/debugfs.reiserfs ->
> debugreiserfs
> -rwxr-xr-x 1 thomas thomas  63372 juin  28 18:12 output/target/usr/sbin/debugreiserfs
> lrwxrwxrwx 1 thomas thomas     10 juin  28 18:12 output/target/usr/sbin/fsck.reiserfs -> reiserfsck
> lrwxrwxrwx 1 thomas thomas     10 juin  28 18:12 output/target/usr/sbin/mkfs.reiserfs -> mkreiserfs
> -rwxr-xr-x 1 thomas thomas  17248 juin  28 18:12 output/target/usr/sbin/mkreiserfs
> -rwxr-xr-x 1 thomas thomas 151456 juin  28 18:12 output/target/usr/sbin/reiserfsck
> -rwxr-xr-x 1 thomas thomas  16580 juin  28 18:12 output/target/usr/sbin/reiserfstune
> -rwxr-xr-x 1 thomas thomas  16748 juin  28 18:12 output/target/usr/sbin/resize_reiserfs
> lrwxrwxrwx 1 thomas thomas     12 juin  28 18:12 output/target/usr/sbin/tunefs.reiserfs ->
> reiserfstune
> 
> > diff -Naur a/package/reiserfsprogs/Config.in.host b/package/reiserfsprogs/Config.in.host
> > --- a/package/reiserfsprogs/Config.in.host	1969-12-31 18:00:00.000000000 -0600
> > +++ b/package/reiserfsprogs/Config.in.host	2016-06-24 14:04:44.000000000 -0500
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_HOST_REISERFSPROGS
> > +	bool "host reiserfsprogs"
> > +	help
> > +	  The reiserfs file system utilities.
> > +
> > +	  https://reiser4.wiki.kernel.org/index.php/Main_Page
> 
> I don't think it is useful to have a host variant for reiserfsprogs,
> except if you add support to generate a root filesystem image using
> reiserfs. But since that's a separate effort, I would suggest to just
> drop the host variant of the package for now.
> 
> > diff -Naur a/package/reiserfsprogs/reiserfsprogs.mk b/package/reiserfsprogs/reiserfsprogs.mk
> > --- a/package/reiserfsprogs/reiserfsprogs.mk	1969-12-31 18:00:00.000000000 -0600
> > +++ b/package/reiserfsprogs/reiserfsprogs.mk	2016-06-24 14:04:20.000000000 -0500
> > @@ -0,0 +1,32 @@
> > +################################################################################
> > +#
> > +# reiserfsprogs
> > +#
> > +################################################################################
> > +
> > +REISERFSPROGS_VERSION = 3.6.25
> > +REISERFSPROGS_SITE =
> ftp://www.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs/v$(REISERFSPROGS_VERSION)
> 
> Please use http:// instead of ftp://.
> 
> > +REISERFSPROGS_LICENSE = GPLv2
> 
> The license is not exactly GPLv2. It is, according to the README file:
> 
> """
> ReiserFSprogs is hereby licensed under the GNU General Public License version 2
> but with the following "Anti-Plagiarism" modification
> """
> 
> So, you should probably use:
> 
> REISERFSPROGS_LICENSE = GPLv2 with exceptions
> 
> 
> > +REISERFSPROGS_LICENSE_FILES = COPYING README
> > +REISERFSPROGS_CONF_ENV = LIBS='-lcom_err -luuid -lpthread -lrt'
> 
> This line is not needed.

What is the preferred way to make those LDFLAGS go through?
I have tried it multiple ways and could only make it work
using the LIBS=... for the configure env.  Without this
line, reiserfsprogs doesn't build.

> 
> > +REISERFSPROGS_DEPENDENCIES = util-linux e2fsprogs acl
> 
> Alphabetic ordering is preferred.
> 
> > +
> > +# binaries to keep or remove
> > +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_MKREISERFS) += usr/local/sbin/mkreiserfs
> > +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_MKREISERFS) += usr/local/sbin/mkfs.reiserfs
> > +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_REISERFSCK) += usr/local/sbin/reiserfsck
> > +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_REISERFSCK) += usr/local/sbin/fsck.reiserfs
> > +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_RESIZE_REISERFS) +=
> usr/local/sbin/resize_reiserfs
> > +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_REISERFSTUNE) += usr/local/sbin/reiserfstune
> > +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_REISERFSTUNE) +=
> usr/local/sbin/tunefs.reiserfs
> > +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_DEBUGREISERFS) +=
> usr/local/sbin/debugreiserfs
> > +REISERFSPROGS_BINTARGETS_$(BR2_PACKAGE_REISERFSPROGS_DEBUGREISERFS) +=
> usr/local/sbin/debugfs.reiserfs
> 
> All those lines are useless, there is nothing installed in
> usr/local/sbin, everything is installed in usr/sbin. Also, as per my
> suggestion to drop the sub-options, those lines are in fact not
> necessary.
> 
> > +
> > +define REISERFSPROGS_TARGET_REMOVE_UNNEEDED
> > +	rm -f $(addprefix $(TARGET_DIR)/, $(REISERFSPROGS_BINTARGETS_))
> > +endef
> > +
> > +REISERFSPROGS_POST_INSTALL_TARGET_HOOKS += REISERFSPROGS_TARGET_REMOVE_UNNEEDED
> > +
> > +$(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
> 
> And drop this last line, since the host variant is probably not useful.
> 
> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
