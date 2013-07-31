From: pierre <p.floury@gmail.com>
Date: Wed, 31 Jul 2013 10:56:00 +0200
Subject: [Buildroot] [PATCH] pacakge : add trace-cmd package
In-Reply-To: <CAAXf6LW95FOYZ69myDTfhQz7hHPXhix7aZTMsg77YAA25yi5AQ@mail.gmail.com>
References: <p.floury@gmail.com>
 <1375192983-29277-1-git-send-email-p.floury@gmail.com>
 <CAAXf6LW95FOYZ69myDTfhQz7hHPXhix7aZTMsg77YAA25yi5AQ@mail.gmail.com>
Message-ID: <CACszssV7-euO7F7HcqBxQf8nzj_hDit8+oW=T7TcQsF4c4pXjw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thank you for your reply and your comments.

Here is a new version of the package.

Concerning the work flow, I sent the first patch via "git send-email",
which was a bit laconic.. Is it ok if I just attach the patch file to a
"regular" email ?

Best regards,

Pierre




On Tue, Jul 30, 2013 at 6:59 PM, Thomas De Schampheleire <
patrickdepinguin+buildroot@gmail.com> wrote:

> Hi Pierre,
>
> Thanks for your contribution! Below are some comments...
>
> On Tue, Jul 30, 2013 at 4:03 PM,  <p.floury@gmail.com> wrote:
> > From: pierre <pierre.floury@gmail.com>
> >
> > ---
> >  package/Config.in            |    1 +
> >  package/tracecmd/Config.in   |    9 +++++++++
> >  package/tracecmd/tracecmd.mk |   24 ++++++++++++++++++++++++
> >  3 files changed, 34 insertions(+)
> >  create mode 100644 package/tracecmd/Config.in
> >  create mode 100644 package/tracecmd/tracecmd.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index d980871..4a7bc5d 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -39,6 +39,7 @@ source "package/memstat/Config.in"
> >  source "package/netperf/Config.in"
> >  source "package/oprofile/Config.in"
> >  source "package/perf/Config.in"
> > +source "package/tracecmd/Config.in"
> >  source "package/ramspeed/Config.in"
> >  source "package/rt-tests/Config.in"
> >  source "package/strace/Config.in"
> > diff --git a/package/tracecmd/Config.in b/package/tracecmd/Config.in
> > new file mode 100644
> > index 0000000..cb24816
> > --- /dev/null
> > +++ b/package/tracecmd/Config.in
> > @@ -0,0 +1,9 @@
> > +config BR2_PACKAGE_TRACECMD
> > +       bool "trace-cmd"
> > +       help
> > +         trace-cmd - command line reader for ftrace
> > +         need to have ftrace enable into your kernel:
> > +
> > +
> http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
>
> The help text should not repeat the name of the command.
> Also, please remove the colon (:) and make the second line a real
> sentence, for example:
> "To do anything useful with this, you should enable ftrace in your
> kernel configuration"
>
> > +
> > +comment "trace-cmd - command line reader for ftrace"
>
> This comment should not be there. We only put comments when packages
> are hidden due to missing dependencies.
>
> > diff --git a/package/tracecmd/tracecmd.mk b/package/tracecmd/tracecmd.mk
> > new file mode 100644
> > index 0000000..3ddff28
> > --- /dev/null
> > +++ b/package/tracecmd/tracecmd.mk
> > @@ -0,0 +1,24 @@
> > +#############################################################
> > +#
> > +# tracecmd
> > +#
> > +#############################################################
> > +
> > +TRACECMD_VERSION = 8c10a774f1f8586cd8b0e
> > +TRACECMD_SITE =
> http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
>
> This version is tagged, so you'd preferable use that for the version:
> trace-cmd-v2.2.1
>
> > +TRACECMD_SITE_METHOD = git
> > +TRACECMD_INSTALL_STAGING = YES
> > +TRACECMD_LICENSE = GPL
> > +# No license file, the license is in the installed header
> > +TRACECMD_LICENSE_FILES = COPYING
>
> What do you mean with this comment 'No license file'? There is a
> COPYING file, so I don't see the point.
>
> Also, the license should be as specific as possible, so GPLv2, GPLv2+
> etc. See
> http://buildroot.uclibc.org/downloads/manual/manual.html#legal-info-list-licenses
> for the list of known abbreviations.
>
> In the case of tracecmd, there both are GPLv2 as LGPLv2.1 files, so
> both licenses should be specified, as well as the license files
> COPYING and COPYING.LIB.
>
> > +define TRACECMD_BUILD_CMDS
> > +     $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> > +endef
> > +
> > +define TRACECMD_INSTALL_TARGET_CMDS
> > +       $(INSTALL) -D -m 0755 $(@D)/trace-cmd $(TARGET_DIR)/usr/bin
> > +       $(INSTALL) -d -m 0755 $(TARGET_DIR)/usr/lib/trace-cmd/plugins
> > +       $(INSTALL) -D -m 0755 $(@D)/plugin_*.so
> $(TARGET_DIR)/usr/lib/trace-cmd/plugins
> > +endef
> > +
> > +$(eval $(generic-package))
>
> If you send an updated version, please also fix the typo in the title:
> pacakge -> package.
>
> Best regards,
> Thomas
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130731/5065470b/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-package-add-trace-cmd-profiling-tool.patch
Type: application/octet-stream
Size: 2514 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130731/5065470b/attachment.obj>
