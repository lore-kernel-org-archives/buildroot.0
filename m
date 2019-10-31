From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 31 Oct 2019 14:01:33 +0100
Subject: [Buildroot] [PATCH 1/1] package/domoticz: fix build with RELRO
In-Reply-To: <20191031134302.685d1858@windsurf.home>
References: <20191031102306.15433-1-fontaine.fabrice@gmail.com>
 <20191031134302.685d1858@windsurf.home>
Message-ID: <CAPi7W81G6kXj_ueiGDq2ocz_Q8HesGVDpp5g7BgXJ1qpqpu6WQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Le jeu. 31 oct. 2019 ? 13:43, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello Fabrice,
>
> As usual, thanks for working on build issues.
>
> On Thu, 31 Oct 2019 11:23:06 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > diff --git a/package/domoticz/0003-CMakeLists.txt-Add-USE_PRECOMPILED_HEADER-option.patch b/package/domoticz/0003-CMakeLists.txt-Add-USE_PRECOMPILED_HEADER-option.patch
> > new file mode 100644
> > index 0000000000..831e4816e1
> > --- /dev/null
> > +++ b/package/domoticz/0003-CMakeLists.txt-Add-USE_PRECOMPILED_HEADER-option.patch
> > @@ -0,0 +1,35 @@
> > +From e2dfb2ece19748ba99ec8199fc902c0c9daff325 Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Wed, 30 Oct 2019 18:55:48 +0100
> > +Subject: [PATCH] CMakeLists.txt: Add USE_PRECOMPILED_HEADER option
> > +
> > +Add USE_PRECOMPILED_HEADER to allow the user to disable precompiled
> > +header feature. Thanks to this, domoticz will be able to be built with
> > +RELRO on buildroot
>
> What is the relationship between using precompiled headers and relro
> build problems ?
I took me some time to understand the issue.
It seems that linker flag such as -Wl,-z,relro should not be used when
building a precompiled header.
I discovered this through this domoticz commit message:
https://github.com/domoticz/domoticz/commit/68698e7a5dce80dea5a9b997d7e171b80bf566ac

However, this commit does not fix the issue on buildroot as
-Wl,-z,relro is not passed through CXXFLAGS but through our
toolchain-wrapper.
Updating toolchain/toolchain-wrapper.c to add the logic to manage
precompiled header seems more complicated than adding an option to
disable this feature from domoticz.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
