From: Carlos Santos <unixmania@gmail.com>
Date: Thu, 27 Feb 2020 17:16:38 -0300
Subject: [Buildroot] [PATCH 3/4] package/openrc: adapt "modules" init
 script to busybox "modprobe"
In-Reply-To: <CAJ4jsacn1PJp-EB+w8=Ny1dMKMhWJZ+Ftceqpd81yAtoKiAmEw@mail.gmail.com>
References: <20200227123938.13412-1-unixmania@gmail.com>
 <20200227123938.13412-4-unixmania@gmail.com>
 <20200227182727.0b277df7@windsurf>
 <CAJ4jsacn1PJp-EB+w8=Ny1dMKMhWJZ+Ftceqpd81yAtoKiAmEw@mail.gmail.com>
Message-ID: <CAJ4jsadcpiLDV9GQTW4_FfvdsH5U3cM4+7J1YrTOUMh71m6CDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 27, 2020 at 3:57 PM Carlos Santos <unixmania@gmail.com> wrote:
>
> On Thu, Feb 27, 2020 at 2:27 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > On Thu, 27 Feb 2020 09:39:37 -0300
> > unixmania at gmail.com wrote:
> >
> > > +# modprobe can be provided by either kmod or busybox
> > > +ifeq ($(BR2_PACKAGE_KMOD_TOOLS),)
> > > +ifeq ($(BR2_PACKAGE_BUSYBOX),y)
> > > +# Busybox modprobe does not have a --first-time option; --verbose is just -v
> > > +# and --use-blacklist is just -b.
> > > +ifeq ($(call KCONFIG_GET_OPT,CONFIG_MODPROBE,$(BUSYBOX_BUILD_CONFIG)),y)
> >
> > Is this working? Isn't that evaluated when Makefiles are parsed, i.e
> > before the build has extracted Busybox and created its .config file ?
> >
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
>
> Hum, not in a clean build. Good catch. :-(
>
> But it works if I use
>
>     $(BR2_PACKAGE_BUSYBOX_CONFIG) $(BUSYBOX_BUILD_CONFIG)
>
> So in a clean/first build it will take the value from the first file
> and in a dirty build it will take the value from the second file.

I just sent a v2 which hopefully cover all the cases. It even deals
with kconfig fragment files.

-- 
Carlos Santos <unixmania@gmail.com>
