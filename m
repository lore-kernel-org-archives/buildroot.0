From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 18 Oct 2014 18:59:03 +0200
Subject: [Buildroot] [PATCH 3/5] infra: Add automatic install of init
	scripts
In-Reply-To: <20141018185601.1a8e732c@free-electrons.com>
References: <1413643624-14757-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1413643624-14757-4-git-send-email-maxime.hadjinlian@gmail.com>
 <20141018185601.1a8e732c@free-electrons.com>
Message-ID: <CAGduivwJMVzpd+uc6Ng_CMivXP1i3pNBtFVjd0ara70oZ5UKYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all

On Sat, Oct 18, 2014 at 6:56 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Maxime Hadjinlian,
>
> On Sat, 18 Oct 2014 16:47:02 +0200, Maxime Hadjinlian wrote:
>
>> +ifeq ($(BR2_INIT_SYSTEMD),y)
>> +     $(Q)if test -n "$($(PKG)_INIT_SYSTEMD_FILES)" ; then \
>> +             mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants ; \
>> +             for s in $($(PKG)_INIT_SYSTEMD_FILES); do \
>> +                     f=$$(basename $${s}); \
>> +                     $(INSTALL) -D -m 644 $${s} $(TARGET_DIR)/lib/systemd/system/$${f} ; \
>> +                     ln -fs /lib/systemd/system/$${f} \
>> +                             $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/$${f} ; \
>> +             done ; \
>> +     fi
>> +     $($(PKG)_INSTALL_INIT_SYSTEMD)
>> +endif
>> +ifeq ($(BR2_INIT_SYSV)$(BR2_INIT_BUSYBOX),y)
>> +     $(Q)if test -n "$($(PKG)_INIT_SYSV_FILES)" ; then \
>> +             for s in $($(PKG)_INIT_SYSV_FILES); do \
>> +                        f=$$(basename $${s}) ; \
>> +                        $(INSTALL) -D -m 0755 $${s} $(TARGET_DIR)/etc/init.d/$${f} ; \
>> +             done ; \
>> +     fi
>> +     $($(PKG)_INSTALL_INIT_SYSV)
>> +endif
>
> Why is an explicit variable necessary ? Why not simply install all the
> S* and K* files from the package directory for sysvinit/busybox and all
> the .service (or some extension) of the package directory for systemd ?
> I think we discussed this at the meeting, no?
Indeed, but as stated in the cover letter, we need to have a variable,
because, some packages only install their init scripts conditionally
(take ntpd for example).
So you can't blindly install files only by maching their names.
Also, the current trend is that applications have their init scripts
in the sources, and we don't want to keep a copy if in our packages,
we want to take it straight from the sources, having such a variable
enable that.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
