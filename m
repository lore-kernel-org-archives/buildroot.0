From: Markus Mayer <mmayer@broadcom.com>
Date: Tue, 18 Dec 2018 13:22:25 -0800
Subject: [Buildroot] [PATCH 1/4] system cfg: introduce option
 BR2_SYSTEM_DEFAULT_PATH
In-Reply-To: <20181218192728.GB24194@scaer>
References: <20181218005116.17435-1-mmayer@broadcom.com>
 <20181218005116.17435-2-mmayer@broadcom.com>
 <20181218192728.GB24194@scaer>
Message-ID: <CAGt4E5vrqjewKWyVtqH5mAsQ_by6UKOUSjze3q6obPvh7HJa3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 18 Dec 2018 at 11:27, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Markus, All,
>
> On 2018-12-17 16:51 -0800, Markus Mayer spake thusly:
> > The configuration option BR2_SYSTEM_DEFAULT_PATH allows the user to
> > override the default path, which can be used by /etc/profile and some
> > system daemons.
> >
> > It defaults to the value previously hard-coded in /etc/profile. This
> > default should be suitable for most users.
> >
> > Signed-off-by: Markus Mayer <mmayer@broadcom.com>
> > ---
> >  system/Config.in | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/system/Config.in b/system/Config.in
> > index 0f77b9b6721a..93458c0011b7 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -386,6 +386,16 @@ comment "automatic network configuration via DHCP needs ifupdown or busybox or n
> >
> >  endif # BR2_ROOTFS_SKELETON_DEFAULT
> >
> > +config BR2_SYSTEM_DEFAULT_PATH
> > +     string "Set the system's default PATH"
> > +     default "/bin:/sbin:/usr/bin:/usr/sbin" if !BR2_ROOTFS_MERGED_USR
> > +     default "/bin:/sbin" if BR2_ROOTFS_MERGED_USR
>
> Do we really care to have a different value at all?
>
> In the merged-/usr case: if the command exists, it is found in either
> /bin or /sbin, and the lookup stops there. If the command does not
> exist, it is looked for in the four locations, instead of only two.
>
> This does not look like too much of an overhead, does it?
>
> Anyway, if we really want different values, then:
>   - we can simplify it a bit,
>   - and use the realy locations rahter than the  symlinks:
>
>     default "/usr/bin:/usr/sbin" if BR2_ROOTFS_MERGED_USR
>     default "/bin:/sbin:/usr/bin:/usr/sbin"
>
> (kconfig will stop on the fiurst default that is valid.)
>
> But for my part, I think a single default as is currently used is
> enough (i.e. /bin:/sbin:/usr/bin:/usr/sbin).

I am perfectly okay with a single value. That's how I had it
originally, until I saw Carlos' e-mail.

I'll let the powers that be make the call on this one. :-) If we do go
with two separate default values, I'll use the above simplification
(with just a single if).

Regards,
-Markus
