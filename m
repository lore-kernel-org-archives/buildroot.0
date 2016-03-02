From: Gabe Evans <gabe@hashrabbit.co>
Date: Wed, 02 Mar 2016 18:05:09 +0000
Subject: [Buildroot] [PATCH 14/32] package/systemd: add optional support
 for tmpfiles
In-Reply-To: <CAGduivwiSG4+ZsO2o1jaE0XRDF2E7uPA6Fp69683waNXsA9whg@mail.gmail.com>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
 <1456437341-19025-15-git-send-email-gabe@hashrabbit.co>
 <20160229225658.6144360b@free-electrons.com>
 <56D610EF.8010800@mind.be>
 <CAGduivwiSG4+ZsO2o1jaE0XRDF2E7uPA6Fp69683waNXsA9whg@mail.gmail.com>
Message-ID: <CAHsRNLjWj5cfL5Lm3Vj_Vzp1VWvzT99S7Xqu_RHKF4uWKDPLSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Sorry for the late reply.

On Wed, Mar 2, 2016 at 3:56 AM Maxime Hadjinlian <
maxime.hadjinlian@gmail.com> wrote:

> Hi Arnout, Thomas, Gabe, all
>
> On Tue, Mar 1, 2016 at 11:00 PM, Arnout Vandecappelle <arnout@mind.be>
> wrote:
> > On 02/29/16 22:56, Thomas Petazzoni wrote:
> >> Dear Gabe Evans,
> >>
> >> On Thu, 25 Feb 2016 21:55:23 +0000, Gabe Evans wrote:
> >>> Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
> >>> ---
> >>>  package/systemd/Config.in  | 9 +++++++++
> >>>  package/systemd/systemd.mk | 6 ++++++
> >>>  2 files changed, 15 insertions(+)
> >>>
> >>> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> >>> index 2ebd825..2f89b0e 100644
> >>> --- a/package/systemd/Config.in
> >>> +++ b/package/systemd/Config.in
> >>> @@ -118,6 +118,15 @@ config BR2_PACKAGE_SYSTEMD_QUOTACHECK
> >>>
> >>>
> http://www.freedesktop.org/software/systemd/man/systemd-quotacheck.service.html
> >>>
> >>> +config BR2_PACKAGE_SYSTEMD_TMPFILES
> >>> +    bool "enable tmpfiles support"
> >>> +    help
> >>> +      systemd-tmpfiles creates, deletes, and cleans up volatile and
> temporary
> >>> +      files and directories, based on the configuration file format
> and location
> >>> +      specified in tmpfiles.d(5).
> >>> +
> >>> +
> http://www.freedesktop.org/software/systemd/man/systemd-tmpfiles.html
> >>
> >> Can this really be made optional? We have other packages that rely on
> >> the tmpfiles.d feature:
> >
> >  Well, this is a bit similar to installing init scripts in /etc/init.d:
> that
> > assumes that it's a system with our /etc/init.d/rcS and an inittab that
> runs it.
> Indeed, note that this will causes program to fail to start and/or
> behave in-appropriately (especially with a RO system).
> >
> >  However, it is essential that all (or many) of these systemd tools
> default y,
> > to mimic the current situation. I think for the ones that you committed
> up to
> > now there is no harm in defaulting to no, but this one, random-seed,
> logind,
> > hostnamed, and hwdb should definitely default y IMHO.
> random-seed could default to n without a problem I think. I agree with
> you for the other.
>

I agree. These packages should default y. random-seed might also be better
to default to y to keep consistency with the S20urandom script in the
initscripts package.


> >
> >  Regards,
> >  Arnout
> >
> >>
> >> package/audit/audit.mk: mkdir -p $(TARGET_DIR)/usr/lib/tmpfiles.d
> >> package/audit/audit.mk: $(INSTALL) -D -m 644
> package/audit/audit_tmpfiles.conf \
> >> package/audit/audit.mk:
>  $(TARGET_DIR)/usr/lib/tmpfiles.d/audit.conf
> >> package/avahi/avahi.mk: $(INSTALL) -D -m 644
> package/avahi/avahi_tmpfiles.conf \
> >> package/avahi/avahi.mk:
>  $(TARGET_DIR)/usr/lib/tmpfiles.d/avahi.conf
> >> package/dhcp/dhcp.mk:
>  $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
> >> package/dhcp/dhcp.mk:
>  $(TARGET_DIR)/usr/lib/tmpfiles.d/dhcpd.conf
> >> package/nfs-utils/nfs-utils.mk: $(INSTALL) -D -m 0644
> package/nfs-utils/nfs-utils_tmpfiles.conf \
> >> package/nfs-utils/nfs-utils.mk:
>  $(TARGET_DIR)/usr/lib/tmpfiles.d/nfs-utils.conf
> >>
> >> Maxime, what do you think?
> Also, Gabe, if you want there's many more flags that you could
> enable/disable, I was planning to make a proper patch instead of the
> ugly one I have in my tree, but I currently add theses flags to
> systemd, that are a bit more than your selection, some of them are
> maybe redundant or even useless, it's a list of flags that follows me
> for a long time. But it drastically helped (along with the one you
> introduced) in reducing the bloat of systemd.
>
> I will give your series a spin as it's really interesting for me to
> replace my dirty patch :)
>

I'll have a look into these flags more when I have some free time. Thanks
for testing. :)

Thanks,
Gabe


>
> --disable-acl
> --disable-apparmor
> --disable-audit
> --disable-chkconfig
> --disable-compat-libs
> --disable-coverage
> --disable-dbus
> --disable-efi
> --disable-elfutils
> --disable-gcrypt
> --disable-gnutls
> --disable-gtk-doc
> --disable-gtk-doc-html
> --disable-gtk-doc-pdf
> --disable-gudev
> --disable-ima
> --disable-kdbus
> --disable-ldconfig
> --disable-libcryptsetup
> --disable-libcurl
> --disable-libidn
> --disable-manpages
> --disable-multi-seat-x
> --disable-myhostname
> --disable-networkd
> --disable-nls
> --disable-pam
> --disable-python-devel
> --disable-qrencode
> --disable-resolved
> --disable-seccomp
> --disable-selinux
> --disable-smack
> --disable-terminal
> --disable-tests
> --disable-utmp
> --disable-xattr
> --disable-xkbcommon
> --enable-blkid
>
>
> >>
> >> Thanks!
> >>
> >> Thomas
> >>
> >
> >
> > --
> > Arnout Vandecappelle                          arnout at mind be
> > Senior Embedded Software Architect            +32-16-286500
> > Essensium/Mind                                http://www.mind.be
> > G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> > LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> > GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
-- 
Gabe Evans | Co-Founder & CTO
hashrabbit.co ? angel.co/hashrabbit ? github.com/gevans
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160302/dd658dee/attachment.html>
