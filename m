From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 09:11:13 +0100
Subject: [Buildroot] Suggestion for Makefile to probably import
 BR2_CONFIG
In-Reply-To: <be14460d-9241-e14a-d4f1-8c30a62d7451@mind.be>
References: <CAGNmLEM_x8ykDr54gbT94em9YyH5+0ec=jCgjULh68yJLUzjnw@mail.gmail.com>
 <1cb3ee33-b12f-6534-9dbf-fb697fbf3482@mind.be>
 <CAGNmLEMn=NFuq+iKj8e2PuF-A4+tGj_VDjq1FBj6+xzDPU=_iQ@mail.gmail.com>
 <d7cd5dae-5ae3-54f3-4376-f17c27e98065@mind.be>
 <CAGNmLEN0N9NziMj6OUDEAkEhu6bDmc43jBnXV6MFSP3EEupnSg@mail.gmail.com>
 <be14460d-9241-e14a-d4f1-8c30a62d7451@mind.be>
Message-ID: <20180129091113.3acccd2c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Jan 2018 23:30:34 +0100, Arnout Vandecappelle wrote:

> > diff --git a/Makefile b/Makefile
> > index 7d8ab51..4b12359 100644
> > --- a/Makefile
> > +++ b/Makefile
> > ?# Pull in the user's configuration file
> > @@ -547,7 +550,7 @@ dirs: $(BUILD_DIR) $(STAGING_DIR) $(TARGET_DIR) \
> > ??????? $(HOST_DIR) $(HOST_DIR)/usr $(HOST_DIR)/lib $(BINARIES_DIR)
> > ?
> > ?$(BUILD_DIR)/buildroot-config/auto.conf: $(BR2_CONFIG)
> > -?????? $(MAKE1) $(EXTRAMAKEARGS) HOSTCC="$(HOSTCC_NOCCACHE)"
> > HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig
> > +?????? $(MAKE1) BR2_CONFIG=$(BR2_CONFIG) $(EXTRAMAKEARGS)
> > HOSTCC="$(HOSTCC_NOCCACHE)" HOSTCXX="$(HOSTCXX_NOCCACHE)" silentoldconfig  
> 
>  It would indeed make sense to pass all options pertaining to Kconfig explicitly
> to the silentoldconfig call.
> 
>  However, I wonder if it wouldn't be better to remove this auto.conf handling
> entirely. It is supposed to make sure that silendoldconfig gets run whenever
> something changed in Config.in files. But for that to work, we need to actually
> include the auto.conf file in the Makefile. Looking at what's done in the
> kernel, it seems there would be a lot more changes needed to get this right. And
> even then, I think there's still a risk to not get things fully right - e.g.
> changes in the host environment will not be detected.
> 
>  The only commit pertaining to this auto.conf dependency that I could find is
> commit 0b36880085f0c65286877853caccf0bde2dd7f0b, from 2010. Quoting its commit
> message:
> 
>     The previous commit has removed calls to conf_write_autoconf(), which
>     is the function that generates the KCONFIG_AUTOCONF,
>     KCONFIG_AUTOHEADER, KCONFIG_TRISTATE files and the split config (with
>     one file per config item). Therefore, those things were not generated
>     anymore before the build.
> 
>     In order to get them generated before the build, we use the same
>     mechanism as the kernel: run a silentoldconfig when the .config file
>     is newer than the KCONFIG_AUTOCONF file.
> 
>     In Buildroot, all those elements are not really used today, except the
>     split config which is used a little bit in the toolchain build, in a
>     try to make sure the toolchain gets rebuilt properly when the
>     configuration changes. It does not seem that this work has been
>     completed.
> 
>     However, as we want to keep the same behaviour as previously, we have
>     to generate all those elements before starting the build.
> 
>  So basically, the only reason to have this is to make sure this split config is
> generated, but we don't use any of it anymore.
> 
> 
>  Yann, Thomas, Peter, what do you think?

I haven't followed the entire discussion, so maybe I'll be out of topic
here. But indeed I believe the split config is completely unused
nowadays, and could be removed entirely.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
