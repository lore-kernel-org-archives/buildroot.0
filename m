From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Fri, 26 Feb 2016 12:28:39 +0530
Subject: [Buildroot] [Buildroot PATCH Selinux v10 04/11] linux-pam:
 selinux host dependencies
In-Reply-To: <20160223223650.74c20cfa@free-electrons.com>
References: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
 <1455603506-26138-4-git-send-email-niranjan.reddy@rockwellcollins.com>
 <20160223223650.74c20cfa@free-electrons.com>
Message-ID: <CAMshMJa8n2bFW1Jj3ssMBDgkM-Qkq=qe35x__X=f8HD0zCGSnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,


On Wed, Feb 24, 2016 at 3:06 AM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Niranjan Reddy,
>
> Again, missing commit log. The commit title is completely unclear, and
> does not even seem to be related to the change being done. How adding a
> host variant of the linux-pam package and using this host variant is
> related to "selinux host dependencies" ?
>

  Agree, I'll add commit log.


> On Tue, 16 Feb 2016 11:48:19 +0530, Niranjan Reddy wrote:
>
> > +# Use the host-pam pam_conv1 app to create the pam.d files
>
> So that's why linux-pam needs to depend on host-linux-pam. So the
> addition of this dependency in PATCH 2 should in fact go in this patch.
>
> > +define LINUX_PAM_CONFIG_FILE_TARGET_INSTALL
> > +     if [ -d $(TARGET_DIR)/etc/pam.d/ ]; then \
>
> Is this conditional really needed? Are there situations where linux-pam
> will not install things in /etc/pam.d/ ?
>
> > +             mv $(TARGET_DIR)/etc/pam.d/ $(TARGET_DIR)/etc/pam.d.orig/;
> \
> > +     fi; \
>
> ; \ not needed here
>
> > +     cd $(TARGET_DIR)/etc/ && cat $(@D)/conf/pam.conf |
> $(HOST_DIR)/usr/bin/pam_conv1; \
>
> Ditto
>
> > +     if [ -d $(TARGET_DIR)/etc/pam.d.orig ]; then \
> > +             cp -a $(TARGET_DIR)/etc/pam.d/*
> $(TARGET_DIR)/etc/pam.d.orig/; \
> > +             rm -rf $(TARGET_DIR)/etc/pam.d/; \
> > +             mv $(TARGET_DIR)/etc/pam.d.orig/ $(TARGET_DIR)/etc/pam.d/;
> \
> > +     fi;
>
> ; not needed
>

  Are you sure you want me to remove these ? If I remove  " ; \"  it gives
me compilation error.  when I see
  build-root manual in section 17.15.2 , if condition statements are ended
with semicolon. Please let me know.



>
> > +     $(INSTALL) -D -m 0644 package/linux-pam/system-auth.pamd
> $(TARGET_DIR)/etc/pam.d/system-auth
> > +endef
>
> linux-pam used to be packaged without this complicated dance. Can you
> add some justification about why we're doing this complicated dance,
> and what it brings?
>
> > +
> > +LINUX_PAM_POST_INSTALL_TARGET_HOOKS +=
> LINUX_PAM_CONFIG_FILE_TARGET_INSTALL
> >  LINUX_PAM_POST_INSTALL_TARGET_HOOKS += LINUX_PAM_INSTALL_CONFIG
> >
> > +HOST_LINUX_PAM_DEPENDENCIES = host-flex host-pkgconf
> > +
> > +HOST_LINUX_PAM_CONF_OPTS =
> > +     --disable-rpath \
> > +     --enable-read-both-confs \
> > +     --disable-regenerate-docu \
> > +     --disable-isadir \
> > +     --disable-nis \
> > +     --enable-securedir=/lib/security \
> > +     --disable-prelude \
> > +     --disable-cracklib \
> > +     --disable-lckpwdf \
> > +     --disable-db \
> > +     --disable-selinux \
> > +     --disable-audit \
> > +
> > +define HOST_LINUX_PAM_INSTALL_CMDS
> > +     $(INSTALL) -D -m 755 $(@D)/conf/pam_conv1/pam_conv1
> $(HOST_DIR)/usr/bin/
>
> We need a full destination path when $(INSTALL) -D is used, so
> $(HOST_DIR)/usr/bin/pam_conv1.
>

   Agree.


>
> > +endef
>
> One empty newline here please.
>

   Agree.


>
> >  $(eval $(autotools-package))
> > +$(eval $(host-autotools-package))
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



Thanks,
Niranjan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160226/c8213db3/attachment.html>
