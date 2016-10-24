From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Oct 2016 17:47:57 +0200
Subject: [Buildroot] Toolchain wrapper CFLAGS [was: Re: Report from the
 Buildroot Meeting in Berlin]
In-Reply-To: <20161024165710.652d270a@free-electrons.com>
References: <20161019221035.2350c181@free-electrons.com>
 <c2da1832-3282-33f0-1588-e828f3df4801@mind.be>
 <874m42lztg.fsf@dell.be.48ers.dk>
 <b4fb3016-266b-d9bf-bbe1-ec7169c7136a@imgtec.com>
 <20161024142840.4c398e72@free-electrons.com>
 <8c64e8e7-1907-5e74-c743-3d980539be06@mind.be>
 <bf335e58-9056-4b66-6c07-6b5e0570eaa7@imgtec.com>
 <20161024165710.652d270a@free-electrons.com>
Message-ID: <d65c8acc-6d6f-8bcb-aab8-14460f217dea@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Changing the subject here, we're no longer talking about the BR meeting :-) ]

On 24-10-16 16:57, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 24 Oct 2016 15:52:27 +0100, Vicente Olivert Riera wrote:
> 
>> I proposed basically the same idea on IRC few days ago, but instead of
>> checking an env variable I was proposing to add an option to the wrapper
>> in order to switch which flags should be used.
> 
> An option doesn't work, because it can easily be "lost" by the package
> build system. An environment variable is much more difficult to loose.
> 
>> You didn't like the idea because "it's hard to distinguish between
>> 'kernel-like' and 'userspace-like' packages" and because "you want to be
>> able to use the buildroot-generated toolchain to build a kernel
>> externally, without adding hacks".
>>
>> I'm confused. With Thomas proposal you will need to declare that env
>> variable if you want to be able to build a kernel with that
>> buildroot-generated toolchain. That's a hack similar as adding an option
>> called -foo, for instance.
>>
>> Plus, I don't see how the problem of distinguishing between
>> 'kernel-like' and 'userspace-like' package is solved if we use an env
>> variable instead of an option.
>>
>> I'm not saying that I don't like Thomas proposal. I do like it, and in
>> fact, probably is cleaner than adding an option to the wrapper. What I
>> don't understand is that you said you didn't like my idea due to those
>> two reasons, and now you say that you "kind of like" Thomas' idea which
>> (I think) still has the same issues as mine ('kernel-like' and
>> 'userspace-like' packages distinguishing plus buildroot-generated
>> toolchain reuse without hacks).
>>
>> Am I missing something here?
> 
> You're probably just missing the fact that we are discussing, trying to
> find approaches. Which means we sometimes contradict ourselves, go back
> to previous proposals that were not considered good originally, etc.

 Or in this case: I forgot about the good reasons I had before not to like that
approach.


> But yes, you're right: the fact that the wrapper is not usable as-is to
> build a Linux kernel or a bootloader outside of Buildroot without
> passing some weird option or environment variable makes my proposal
> not appealing at all.
> 
> Shouldn't we bite the bullet and stop doing shit with this wrapper? I.e
> only make it pass the absolutely mandatory --sysroot option but not
> other option whatsoever. Yes, this means potentially fixing broken
> package build system, but if that's the right thing to do?

 But this would mean that the wrapper is not usable as-is to build any userspace
program outside of buildroot, because you have to pass the appropriate
--float-abi or whatever option to be able to link it with the Buildroot
libraries... For me, that's even worse than not being able to build kernel or
bootloader without some magic flags.


 Let's try to summarize:

* There are a few flags (--sysroot for sure, maybe others) that are absolutely
mandatory to be able to build anything.

* There are other flags (-mmsa and many others) that *should* be used by
userspace programs to generate the kind of code that we want.

* Some of these "other" flags *must not* be used when building kernel or bootloader.

* We could pass all the flags to the package build system so we can easily
select per package which flags to pass. However:
  - Not all package build systems make it easy to pass flags (i.e. they may drop
some of them).
  - It is very convenient to be able to build externally from buildroot by just
calling the wrapper.
  - [I thought there was an additional reason why we have this wrapper, but I
can't remember... Per-package staging would need it I think?]

 Approaches we have considered:

* Pass the flags that are always OK through the wrapper, pass other flags only
to the package build system. But then we loose those flags in case the build
system doesn't listen to CFLAGS. Also, packages built externally should provide
those flags explicitly if they want to be built the same way as normal packages.

* Add an option or environment variable in the wrapper to disable the dangerous
flags. But then we have to identify which cases are bootloader-or-kernel-like,
and it's more difficult to build externally from buildroot. In addition, some
bootloader-like packages may build both bootloader code and userspace code with
the same flags (grub2? linux-perf?).

* Pass explicit disable flags (-mno-msa) to bootloader-or-kernel-like packages,
but that has the same problems as the previous one, and in addition is a lot
more messy.

* Use a different wrapper for bootloader-or-kernel-like. Same issue as the
previous ones, just it's a bit easier to be sure that the package build system
will use that particular wrapper (passing CC= has a higher likelihood of being
honoured than CFLAGS=).

* Somehow detect that we're building a bootloader-or-kernel-like package from
the wrapper itself, and disable the dangerous options in that case. We do
something like that for -mcpu and ARM's -mfloat-abi. But can we do that in
general? I believe the kernel will always pass a -march option, but can we be
sure of that?


 Did I miss anything?


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
