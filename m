From: Andreas Naumann <dev@andin.de>
Date: Wed, 13 Jun 2018 10:32:12 +0200
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <CAOJ2eMfh5-dqjRxrZhhBv6yQj6k1jgstnDSWqtsy4LG+UuVmBw@mail.gmail.com>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com>
 <9ca7c9e9-061c-1dfb-f348-b92407b2f7e0@mind.be>
 <1528825657.28705.168.camel@impinj.com>
 <CAOJ2eMd6vMsXRDSwNRBT1cK2S2i2kBhpqdMvkv9tqUoPTcYhrw@mail.gmail.com>
 <20180612210124.18e1f168@windsurf>
 <CAOJ2eMfh5-dqjRxrZhhBv6yQj6k1jgstnDSWqtsy4LG+UuVmBw@mail.gmail.com>
Message-ID: <f8d008ac-4b0e-52a5-93f5-cec21e31459e@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

on a general note, I do find that buildroot does an outstanding job in 
providing a lot of simple to use functionality while keeping it within a 
well defined scope!
To help achieve that for SDK generation, I'll describe my use 
cases/preferences.

Am 12.06.2018 um 21:25 schrieb Stefan Becker:
> Hi Thomas, All,
> 
<snip>
> 
> But I'm against building something for naught. If the tarball turns
> out to be unusable I get slower buildroot builds. Which in turns will
> force me to extract what "original sdk without tarball" was doing out
> of buildroot makefile and hard-code it into my build script. And then
> I can remove "sdk" from the buildroot make command. I fail to see how
> that is simpler.

I also prefer speed over storage size (gz vs. xz) and definitely want to 
spend both only for building what I need.

> 
> If you don't offer a way to specify the generated tarball name, fine.
> Then I won't use sdk-tarball at all, even if the tarball itself would
> be usable in our downstream integration. Or I could come up with a way
> to "guess" the build artefact name in my build script and symlink it
> to the wanted build artefact name (again, I fail to see how this is
> simpler).

Even though the sdk target has been around for a while, I still use 
custom steps to a) build the SDK on a absolute path to avoid relocation 
needs and b) tar it with a project-specific name.

So if b) is provided by buildroot I'd be very interested to finally give 
up my addon mess (modifiying HOST_DIR before the build) and switch to 
buildroots way.
However, for maintenance reasons I want to support existing project 
setups, which would only be "simple" if there was an easy way to
- run the relocation previous to packing
- adjust the location to be packed accordingly
- and define the name of the tarball with a set of "beyond buildroot" 
Project-Variables

I guess one way to achieve that would be baking this sort of 
customization into the defconfig. However, that makes usage of 
savedefconfig more or less useless to me because it leads to constantly 
changing defconfigs. (Which is undesirable as my messing with HOST_DIR 
has showed me).
Allowing environment variables to control the process would work too, 
but I dont know if thats considered "good practise" or "simple" either.


best regards,
Andreas
