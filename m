From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 12 Oct 2014 11:21:20 +0200
Subject: [Buildroot] [PATCH 2/2] package/mono: new package
In-Reply-To: <20141012110213.5b7c6c8a@free-electrons.com>
References: <1413100208-12776-1-git-send-email-angelo.compagnucci@gmail.com>
 <1413100208-12776-3-git-send-email-angelo.compagnucci@gmail.com>
 <20141012102554.39aa340a@free-electrons.com>
 <CA+TH9VmaCh+6X7CQVWPctUQTz1mLZyrXB1FyAObNceO_9=BeWQ@mail.gmail.com>
 <20141012110213.5b7c6c8a@free-electrons.com>
Message-ID: <CA+TH9V=5MVzboiyLDxuuJwXJ=v-t9eZ-8kPF0q=AhXtDsS-1Rg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas!

2014-10-12 11:02 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Angelo Compagnucci,
>
> Yes, please, that's how we do things for all packages: if a configure
> option is there to not build something that is actually disabled in the
> Buildroot configuration, then we use that.

Ok!

> Then, the conditional shouldn't be here, but around the dependency of
> mono on host-mono.
>
> That being said, I would recommend you to keep things simple for now,
> and handle only this use case as a follow-up contribution.

It is already:

ifneq ($(MONO_ASSEMBLY_INCLUDED),)
define MONO_INSTALL_LIBS
rsync -av --exclude=*.so --exclude=*.mdb --exclude=[0-9].[0-9] \
$(HOST_DIR)/usr/lib/mono $(TARGET_DIR)/usr/lib/
rsync -av --exclude=*.so --exclude=*.mdb $(MONO_ASSEMBLY_INCLUDED) \
$(TARGET_DIR)/usr/lib/mono/
endef
MONO_DEPENDENCIES += host-mono
MONO_POST_INSTALL_TARGET_HOOKS += MONO_INSTALL_LIBS
endif

This way the dependency is met only when MONO_ASSEMBLY_INCLUDED.
By the way, I'll remove this logic, make 4.5 as default version and if
nothing selected, I'll default evenly on 4.5.

Thank you for your time!

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
