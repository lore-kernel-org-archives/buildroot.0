From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 24 Oct 2016 15:52:27 +0100
Subject: [Buildroot] Report from the Buildroot Meeting in Berlin
In-Reply-To: <8c64e8e7-1907-5e74-c743-3d980539be06@mind.be>
References: <20161019221035.2350c181@free-electrons.com>
 <c2da1832-3282-33f0-1588-e828f3df4801@mind.be>
 <874m42lztg.fsf@dell.be.48ers.dk>
 <b4fb3016-266b-d9bf-bbe1-ec7169c7136a@imgtec.com>
 <20161024142840.4c398e72@free-electrons.com>
 <8c64e8e7-1907-5e74-c743-3d980539be06@mind.be>
Message-ID: <bf335e58-9056-4b66-6c07-6b5e0570eaa7@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/10/16 14:05, Arnout Vandecappelle wrote:
> 
> 
> On 24-10-16 14:28, Thomas Petazzoni wrote:
>> Hello,
>>
>> On Mon, 24 Oct 2016 13:19:30 +0100, Vicente Olivert Riera wrote:
> [snip]
>>> And another question. What happen if we use the real compiler to build
>>> kernels and bootloaders? Would that be a problem? I don't know other
>>> architectures, but for MIPS the only variable we need to pass to the
>>> make program for building a kernel is ARCH=mips. The defconfig will set
>>> all the rest (float, endian, etc.).
>>
>> Could be an approach to investigate, but I'm afraid is not as simple as
>> it looks. "perf" for example is part of the kernel, built with our
>> cross-compiler, but we would need to go through the wrapper because
>> "perf" is user-space code, and it does need to link with a bunch of
>> libraries available in our sysroot (so the --sysroot flag is important).
> 
>  ... but perf *is* built separately from the kernel code, in linux-tools-perf.
> 
>  I kind of like the idea of having a TARGET_CC_UNWRAPPED that we pass to the
> packages that are non-hosted.
> 
> 
>> Perhaps we need an environment variable in the wrapper that tells it
>> "use all your flags" vs. "use only the flags that are really important,
>> such as --sysroot". We could then set this environment variable when
>> building specific packages such as the kernel and bootloaders.
> 
>  This, however, is probably the safest solution, and fairly elegant as well.
> I'll keep it in mind when I (finally) start working on this :-)

I proposed basically the same idea on IRC few days ago, but instead of
checking an env variable I was proposing to add an option to the wrapper
in order to switch which flags should be used.

You didn't like the idea because "it's hard to distinguish between
'kernel-like' and 'userspace-like' packages" and because "you want to be
able to use the buildroot-generated toolchain to build a kernel
externally, without adding hacks".

I'm confused. With Thomas proposal you will need to declare that env
variable if you want to be able to build a kernel with that
buildroot-generated toolchain. That's a hack similar as adding an option
called -foo, for instance.

Plus, I don't see how the problem of distinguishing between
'kernel-like' and 'userspace-like' package is solved if we use an env
variable instead of an option.

I'm not saying that I don't like Thomas proposal. I do like it, and in
fact, probably is cleaner than adding an option to the wrapper. What I
don't understand is that you said you didn't like my idea due to those
two reasons, and now you say that you "kind of like" Thomas' idea which
(I think) still has the same issues as mine ('kernel-like' and
'userspace-like' packages distinguishing plus buildroot-generated
toolchain reuse without hacks).

Am I missing something here?

Regards,

Vincent

> 
>  Regards,
>  Arnout
> 
