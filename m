From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Jun 2018 12:12:51 +0200
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <f8d008ac-4b0e-52a5-93f5-cec21e31459e@andin.de>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com>
 <9ca7c9e9-061c-1dfb-f348-b92407b2f7e0@mind.be>
 <1528825657.28705.168.camel@impinj.com>
 <CAOJ2eMd6vMsXRDSwNRBT1cK2S2i2kBhpqdMvkv9tqUoPTcYhrw@mail.gmail.com>
 <20180612210124.18e1f168@windsurf>
 <CAOJ2eMfh5-dqjRxrZhhBv6yQj6k1jgstnDSWqtsy4LG+UuVmBw@mail.gmail.com>
 <f8d008ac-4b0e-52a5-93f5-cec21e31459e@andin.de>
Message-ID: <6b49b9db-b1d4-0ba6-1434-0ca94b303756@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Andreas,

On 13-06-18 10:32, Andreas Naumann wrote:
> Hi,
> 
> on a general note, I do find that buildroot does an outstanding job in providing
> a lot of simple to use functionality while keeping it within a well defined scope!
> To help achieve that for SDK generation, I'll describe my use cases/preferences.

 Thanks for your input!


> Am 12.06.2018 um 21:25 schrieb Stefan Becker:
>> Hi Thomas, All,
>>
> <snip>
>>
>> But I'm against building something for naught. If the tarball turns
>> out to be unusable I get slower buildroot builds. Which in turns will
>> force me to extract what "original sdk without tarball" was doing out
>> of buildroot makefile and hard-code it into my build script. And then
>> I can remove "sdk" from the buildroot make command. I fail to see how
>> that is simpler.
> 
> I also prefer speed over storage size (gz vs. xz) and definitely want to spend
> both only for building what I need.

 Yep, it's pretty clear that my .xz idea doesn't get much traction :-)


>> If you don't offer a way to specify the generated tarball name, fine.
>> Then I won't use sdk-tarball at all, even if the tarball itself would
>> be usable in our downstream integration. Or I could come up with a way
>> to "guess" the build artefact name in my build script and symlink it
>> to the wanted build artefact name (again, I fail to see how this is
>> simpler).
> 
> Even though the sdk target has been around for a while, I still use custom steps
> to a) build the SDK on a absolute path to avoid relocation needs and b) tar it
> with a project-specific name.
> 
> So if b) is provided by buildroot I'd be very interested to finally give up my
> addon mess (modifiying HOST_DIR before the build and switch to buildroots way.
 Why is specifying a BR2_HOST_DIR  on the make command line messy? It is in fact
Buildroot's way :-)

> However, for maintenance reasons I want to support existing project setups,
> which would only be "simple" if there was an easy way to
> - run the relocation previous to packing
> - adjust the location to be packed accordingly
> - and define the name of the tarball with a set of "beyond buildroot"
> Project-Variables

 This starts to sound complicated... I would say, if you're content with a
non-relocatable SDK, setting BR2_HOST_DIR is the way to go.

 Perhaps we could consider a post-sdk script. That would get called with the
relevant variables so you could set up all the symlinks you want to find the
cross-compile tuple etc. Although, really, calling 'make printvars
VARS=GNU_TARGET_NAME' from your CI script doesn't sound like the end of the
world to me.


> I guess one way to achieve that would be baking this sort of customization into
> the defconfig. However, that makes usage of savedefconfig more or less useless
> to me because it leads to constantly changing defconfigs. (Which is undesirable
> as my messing with HOST_DIR has showed me).
> Allowing environment variables to control the process would work too, but I dont
> know if thats considered "good practise" or "simple" either.

 I don't really like putting stuff in environment variables. I'd rather have it
in local.mk variables then (which automatically means that they can also be set
on the command line). But even so, it smells like unneeded complexity to me.

 Summarizing where we are in this thread now, I think:

1. The tarball generation should be separated from the sdk generation itself,
with e.g.

sdk-tar: sdk
	@$(TAR) ...

2. The tarball should really be created as a .gz, not as an .xz or anything else.

3. In addition to the unique name, there should be a symlink/hardlink with a
constant name.

 Note that this doesn't solve the potential issue that the images/ directory is
constantly growing. So perhaps we should just give up on the unique name, and
instead only generate a constant name, like we currently do for all our build
artefacts.


 With all this in mind, I've marked the patch as Changes Requested.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
