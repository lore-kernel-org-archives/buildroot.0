From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Jan 2018 10:41:25 +0100
Subject: [Buildroot] Suggestion for Makefile to probably import
 BR2_CONFIG
In-Reply-To: <CAGNmLEMn=NFuq+iKj8e2PuF-A4+tGj_VDjq1FBj6+xzDPU=_iQ@mail.gmail.com>
References: <CAGNmLEM_x8ykDr54gbT94em9YyH5+0ec=jCgjULh68yJLUzjnw@mail.gmail.com>
 <1cb3ee33-b12f-6534-9dbf-fb697fbf3482@mind.be>
 <CAGNmLEMn=NFuq+iKj8e2PuF-A4+tGj_VDjq1FBj6+xzDPU=_iQ@mail.gmail.com>
Message-ID: <d7cd5dae-5ae3-54f3-4376-f17c27e98065@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi TP,

 [Please don't top-post, but reply inline like I do below.]

On 23-01-18 00:00, Toan Pham wrote:
> Thank you for the clarification.? BR2_CONFIG is a run-time generated config and
> that it shouldn't be used.? One should use BR2_DEFCONFIG instead to guarantee
> reproducible builds on different hosts.
> 
> Based on what you pointed out, BR2_CONFIG is more like a cached file of the
> build environment.? If I were to follow your methods described here:
> 
>     make BR2_DEFCONFIG=$PWD/myTarget1 O=output.target1

 Sorry, my bad, this should have been

make BR2_DEFCONFIG=$PWD/myTarget1 O=output.target1 defconfig

>     make O=output.target1
> 
> It wont work if output.target1 hasn't been configured with make
> {oldconfig,menuconfig,xconfig}.? ie error from BR2:
> 
>     ? GEN???? /projects/sandbox/ups/buildroot/output.test/Makefile
>     ***
>     *** Configuration file "/projects/sandbox/ups/buildroot/output.test/.config"
>     not found!
>     ***
>     *** Please run some configurator (e.g. "make oldconfig" or
>     *** "make menuconfig" or "make xconfig").
> 
> 
> 
> 
> Note that 'make silentoldconfig' isn't even an option.? It would be nice for BR2
> to have a 'silentoldconfig' target so that the config file gets generated
> automatically, without any user intervention on first run.? Also, having the
> ability to override BR2_CONFIG is also nice (for those who know what they're doing).

 Well, if you really know what you are doing, then you also know that you can in
fact override BR2_CONFIG :-). In fact, the commandline you give in your original
mail *will* work. Any assignment specified on the make commandline (after
'make') overrides the assignments done within the Makefiles.

 Regards,
 Arnout

> 
> TP
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> 
> On Mon, Jan 22, 2018 at 4:45 PM, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
> 
>     ?Hi TP,
> 
>     ?Thank you for your suggestion!
> 
> 
>     On 17-01-18 23:06, Toan Pham wrote:
>     >
>     >
>     > Hi,
>     >
>     > I would like to make a suggestion on patching the main Makefile line:?
>     >
>     > BR2_CONFIG = $(CONFIG_DIR)/.config??
>     >
>     > to
>     >
>     > BR2_CONFIG ?= $(CONFIG_DIR)/.config
>     >
>     >
>     > The main reason for this patch is that it allows the configuration file to be
>     > specified from command argument.? For example, I would be able to build two
>     > different targets (even in parallel) with the following commands:
>     >
>     >
>     > make BR2_CONFIG=$PWD/myTarget1 O=output.target1
>     >
>     > make BR2_CONFIG=$PWD/myTarget2 O=output.target2
>     >
>     >
>     > Without the above patch, buildroot assumes that the config file is already saved
>     > under output.target{1,2}/.config and would fail if the file does not exist.? I
>     > find that the above patch is very valuable, please comment or make suggestion!
> 
>     ?The .config file is a generated file. In fact, it will sometimes be overwritten
>     when you start a build. The .config files also contains information about your
>     build environment. So no, it really isn't a good idea to do this.
> 
>     ?If you have an existing defconfig file (normally generated with 'make
>     savedefconfig', but you can also just copy the .config file), you can use it as
>     the source of the generated .config as follows:
> 
>     make BR2_DEFCONFIG=$PWD/myTarget1 O=output.target1
>     make O=output.target1
> 
> 
>     ?Regards,
>     ?Arnout
> 
> 
>     --
>     Arnout Vandecappelle? ? ? ? ? ? ? ? ? ? ? ? ? arnout at mind be
>     Senior Embedded Software Architect? ? ? ? ? ? +32-16-286500
>     <tel:%2B32-16-286500>
>     Essensium/Mind? ? ? ? ? ? ? ? ? ? ? ? ? ? ? ? http://www.mind.be
>     G.Geenslaan 9, 3001 Leuven, Belgium? ? ? ? ? ?BE 872 984 063 RPR Leuven
>     LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>     <http://www.linkedin.com/in/arnoutvandecappelle>
>     GPG fingerprint:? 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> 
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
