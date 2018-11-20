From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Nov 2018 11:22:00 +0100
Subject: [Buildroot] [PATCH next v4 6/6] core: implement per-package SDK
 and target
In-Reply-To: <20181119194905.GC2601@scaer>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
 <20181114105557.12599-7-thomas.petazzoni@bootlin.com>
 <de9da9af-71f4-cfe2-f691-5aae17e3ca0a@andin.de>
 <20181116144735.19585727@windsurf>
 <CAAXf6LWM0dcCJSVTSerox320PWKkpPcOXORF2cTaWfHitgRguQ@mail.gmail.com>
 <20181116195741.GV10271@scaer> <10c54101-3264-eefb-58d0-4770ef723717@mind.be>
 <20181119114806.4fb9d98b@windsurf.home> <20181119194905.GC2601@scaer>
Message-ID: <7f195412-448e-400f-0ba6-d710246c7656@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/11/2018 20:49, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2018-11-19 11:48 +0100, Thomas Petazzoni spake thusly:
[snip]
>> Indeed, what we would do is:
>>
>>  1. Download step
>>     Prepare PPD with download dependencies
>>     Do the normal download stuff
>>
>>  2. Extract step
>>     Prepare PPD with extract dependencies
>>     Do the normal extract stuff
>>
>>  3. Patch step
>>     Prepare PPD with patch dependencies
>>     Do the normal patch stuff
>>
>>  4. Prepare step
>>     Prepare PPD with the prepare dependencies
>>     Do the prepare stuff (i.e only the kconfig stuff for now)
>>
>>  5. Configure step
>>     Prepare PPD with the normal dependencies
>>     Do the normal configure stuff
>>
>> Does that clarify Yann's proposal ?
> 
> Yes, that clarifies it perfectly. Thanks! :-)
> 
>> I personally find it OK, even though it's a bit annoying to introduce
>> yet another step just for the sake of pkg-kconfig.

 Me too. And I'm not even sure if it really solves the pkg-kconfig problem. I
have a hard time remembering what all the issues were there.

 Perhaps, though, we should have a more general strategy of a per-infra
definition of what the steps are, instead of having a fixed sequence of steps.
I.e., have a pattern that should be followed by an infra-specific step to make
sure things are done correctly. So, for the kconfig case we would have an extra
kconfig_fixup step (we already have the stamp file, but it's not a real step
with hooks and the KCONFIG_DEPENDENCIES were strapped on as an afterthought),
and for the autoreconf case we would have an extra autoreconf step (instead of a
hook).


>> Also: I would not move autoreconf into this prepare step, but keep it
>> as it is today, within the configure step. I don't (today at least) see
>> the point/usefulness of moving the autoreconf into this prepare step.
> 
> For the PPD stuff? Definitely not.
> 
> But it will be usefull to run autoreconf in a step that is not the
> configure step, so we are able to share the source tree between host and
> target build, as well as stop rsyncing from _OVERRIDE_SRCDIR.

 But the problem is, for pkg-kconfig, we actually need the prepare stuff to be
done in the build directory, not the source directory... So it *still* doesn't
match.


> But then, I wonder if that is really the same as the 'prepare' step

 So no, it's not the same, but...

> above, because autoreconf will also require the same dependencies as the
> configure step.

 ... not because of this. Most dependencies are only really needed in the
configure step, it's only some of them (host-automake etc. obviously, but also
host-autoconf-archive and host-pkg-config for the .m4 files) that are needed for
the autoreconf. So if it is split, we would need to move some dependencies to
_PREPARE_DEPENDENCIES.


 Regards,
 Arnout
