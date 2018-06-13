From: Andreas Naumann <dev@andin.de>
Date: Wed, 13 Jun 2018 17:46:45 +0200
Subject: [Buildroot] [PATCH] core/sdk: generate the SDK tarball ourselves
In-Reply-To: <6b49b9db-b1d4-0ba6-1434-0ca94b303756@mind.be>
References: <20180609210607.13259-1-yann.morin.1998@free.fr>
 <e4bbb78b-8301-e576-7e65-f83d55e0da7b@mind.be>
 <1528737656.28705.131.camel@impinj.com>
 <9ca7c9e9-061c-1dfb-f348-b92407b2f7e0@mind.be>
 <1528825657.28705.168.camel@impinj.com>
 <CAOJ2eMd6vMsXRDSwNRBT1cK2S2i2kBhpqdMvkv9tqUoPTcYhrw@mail.gmail.com>
 <20180612210124.18e1f168@windsurf>
 <CAOJ2eMfh5-dqjRxrZhhBv6yQj6k1jgstnDSWqtsy4LG+UuVmBw@mail.gmail.com>
 <f8d008ac-4b0e-52a5-93f5-cec21e31459e@andin.de>
 <6b49b9db-b1d4-0ba6-1434-0ca94b303756@mind.be>
Message-ID: <20ef3c7e-1f93-e63f-fe70-7b6829fd589f@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Am 13.06.2018 um 12:12 schrieb Arnout Vandecappelle:
>   Hi Andreas,
> 

> 
>>> If you don't offer a way to specify the generated tarball name, fine.
>>> Then I won't use sdk-tarball at all, even if the tarball itself would
>>> be usable in our downstream integration. Or I could come up with a way
>>> to "guess" the build artefact name in my build script and symlink it
>>> to the wanted build artefact name (again, I fail to see how this is
>>> simpler).
>>
>> Even though the sdk target has been around for a while, I still use custom steps
>> to a) build the SDK on a absolute path to avoid relocation needs and b) tar it
>> with a project-specific name.
>>
>> So if b) is provided by buildroot I'd be very interested to finally give up my
>> addon mess (modifiying HOST_DIR before the build and switch to buildroots way.
>   Why is specifying a BR2_HOST_DIR  on the make command line messy? It is in fact
> Buildroot's way :-)

Specifying on command line would have been nice but remember this being 
ignored in favour of the .config setting. So I always modified .config 
before the build, which I do regard as somewhat messy.

> 
>> However, for maintenance reasons I want to support existing project setups,
>> which would only be "simple" if there was an easy way to
>> - run the relocation previous to packing
>> - adjust the location to be packed accordingly
>> - and define the name of the tarball with a set of "beyond buildroot"
>> Project-Variables
> 
>   This starts to sound complicated... I would say, if you're content with a
> non-relocatable SDK, setting BR2_HOST_DIR is the way to go.

I just tried again to set BR_HOST_DIR via environment but it doesnt 
propagate. It would work with make -e ... but I fear hard to discover 
side effects doing that. So I'd rather go with the relocation in the future.

> 
>   Perhaps we could consider a post-sdk script. That would get called with the
> relevant variables so you could set up all the symlinks you want to find the
> cross-compile tuple etc. Although, really, calling 'make printvars
> VARS=GNU_TARGET_NAME' from your CI script doesn't sound like the end of the
> world to me.

Actually, I'm using the printvars solution right now, no problem.

> 
> 
>> I guess one way to achieve that would be baking this sort of customization into
>> the defconfig. However, that makes usage of savedefconfig more or less useless
>> to me because it leads to constantly changing defconfigs. (Which is undesirable
>> as my messing with HOST_DIR has showed me).
>> Allowing environment variables to control the process would work too, but I dont
>> know if thats considered "good practise" or "simple" either.
> 
>   I don't really like putting stuff in environment variables. I'd rather have it
> in local.mk variables then (which automatically means that they can also be set
> on the command line). But even so, it smells like unneeded complexity to me.

Just as I fail in overwriting BR2_HOST_DIR from commandline I fail in 
setting BR2_PACKAGE_OVERRIDE_FILE to something else than defined in 
.config. I guess it would be really helpful if you could give me an 
example on how to do that.

> 
>   Summarizing where we are in this thread now, I think:
> 
> 1. The tarball generation should be separated from the sdk generation itself,
> with e.g.
> 
> sdk-tar: sdk
> 	@$(TAR) ...
> 
> 2. The tarball should really be created as a .gz, not as an .xz or anything else.
> 
> 3. In addition to the unique name, there should be a symlink/hardlink with a
> constant name.
> 
>   Note that this doesn't solve the potential issue that the images/ directory is
> constantly growing. So perhaps we should just give up on the unique name, and
> instead only generate a constant name, like we currently do for all our build
> artefacts.

Since the SDK tarball is something that is "thrown around" between 
developers on it's own, it might make sense to somehow being able to 
distinguish it?
For my case, I include a project version in the name, but no buildnumber 
or SHA. That way it just changes between project releases. Also, I have 
a separate sdk/ folder for it, because I dont like mixing target with 
host stuff. (and it can be cleaned independently).

So while it's easy enough to rename the tarball to an appropriate name 
after creating it with make sdk-tar, the contained top-level folder 
should somehow match this name right?


regards,
Andreas

> 
> 
>   With all this in mind, I've marked the patch as Changes Requested.
> 
>   Regards,
>   Arnout
> 
