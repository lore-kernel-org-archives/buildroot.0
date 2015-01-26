From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 Jan 2015 18:11:05 +0100
Subject: [Buildroot] [PATCH 1/2] qwt: compile as a static lib if
 QT_SHARED is not selected
In-Reply-To: <CACQ1gAiDQySdHAt3xy82+fwVmJLqfRrCbR=NHDR9roHbhdSFVw@mail.gmail.com>
References: <1421749049-1431-1-git-send-email-richard.genoud@gmail.com>
 <20150120174507.1d11ab61@free-electrons.com>
 <87siey4i48.fsf@dell.be.48ers.dk> <54C60A2A.9090805@gmail.com>
 <20150126122141.437dd519@free-electrons.com>
 <CACQ1gAiDQySdHAt3xy82+fwVmJLqfRrCbR=NHDR9roHbhdSFVw@mail.gmail.com>
Message-ID: <20150126181105.16dea123@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Genoud,

On Mon, 26 Jan 2015 18:00:48 +0100, Richard Genoud wrote:

> > Probably. Unfortunately with kconfig, we cannot easily add one option
> > for debug symbols, static/dynamic linking to each package. It would add
> > gazillions of options.
> >
> > One possibility would be to have one global string option that you
> > could fill in with a space-separated list of packages that you want to
> > be built statically, even if the rest of the system is built
> > dynamically.
> Indeed, a generic solution like that would be great.
> The solution is not straight-forward though. (but as I'm not a
> buildroot-internals guru, I may be missing something)
> What I see is that the option
> BR2_LIST_OF_STATIC_PACKAGES="qwt qt busybox"
> Will define :
> QWT_FORCE_STATIC=y
> QT_FORCE_STATIC=y
> BUSYBOX_FORCE_STATIC=y
> 
> And the BR2_STATIC_LIB=y will define pkg-name_FORCE_STATIC=y for all packages

Yes, kind of. All this should be done in the generic-package
infrastructure. Something like this in the inner-package function

ifneq ($(filter $(1),$(call qstrip,$(BR2_LIST_OF_STATIC_PACKAGES))),)
$(2)_FORCE_STATIC = YES
endif

ifeq ($(BR2_STATIC_LIB),y)
$(2)_FORCE_STATIC = YES
endif

> And then, in every single package file we'll have to change:
> s/\<BR2_STATIC_LIB\>/pkg-name_FORCE_STATIC/g

Indeed.

> but I'm really not sure this is the best way.

I don't really see a better way of doing this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
