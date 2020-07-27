From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 17:26:48 +0200
Subject: [Buildroot] [PATCH v3 5/7] package/systemd: needs kernel options
In-Reply-To: <20200621080000.180089-6-francois.perrad@gadz.org> (Francois
 Perrad's message of "Sun, 21 Jun 2020 09:59:58 +0200")
References: <20200621080000.180089-1-francois.perrad@gadz.org>
 <20200621080000.180089-6-francois.perrad@gadz.org>
Message-ID: <87blk1ugg7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:

 > according to https://wiki.gentoo.org/wiki/Systemd#Kernel
 > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 > ---
 >  package/systemd/systemd.mk | 11 ++++++++++-
 >  1 file changed, 10 insertions(+), 1 deletion(-)

 > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
 > index 8e01a0db5..b7213dd12 100644
 > --- a/package/systemd/systemd.mk
 > +++ b/package/systemd/systemd.mk
 > @@ -565,9 +565,18 @@ SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
 >  SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
 
 >  define SYSTEMD_LINUX_CONFIG_FIXUPS
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_POSIX_MQUEUE)

I don't see any reference to this anywhere in the systemd code or
README, so I've dropped this.

 >  	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUPS)
 > -	$(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER)
 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_CGROUP_BPF)

According to the README this is only required for IPAddressDeny= and
IPAddressAllow= in resource control unit settings, which I don't think
is used by anuy of the "standard" services - Dropped.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_BPF_SYSCALL)

Same for this one.

 > +	$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS)

This is already taken care of by linux/linux.mk, dropped.

Committed with these changes, thanks.

-- 
Bye, Peter Korsgaard
