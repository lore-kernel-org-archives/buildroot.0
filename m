From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 16 Jan 2016 22:06:29 +0100
Subject: [Buildroot] [PATCH] libnspr: only enable thumb if
	BR2_ARM_INSTRUCTIONS_THUMB2
In-Reply-To: <878u3qy3oa.fsf@dell.be.48ers.dk>
References: <1452869536-13918-1-git-send-email-arnout@mind.be>
 <878u3qy3oa.fsf@dell.be.48ers.dk>
Message-ID: <569AB0D5.7010701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15-01-16 21:43, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
> 
>  > libnspr currently passes --enable-thumb2 if the CPU has thumb
>  > instructions. This option will pass -mthumb to the compiler. However,
>  > if an external multilib toolchain is used that has a thumb-specific
>  > variant, it will try to use that one. But we only copy a single variant
>  > to the sysroot, so the build will fail with:
> 
>  > In order to fix this, only enable thumb2 when we are really using
>  > thumb2. Note that it is still necessary to pass this option, cfr.
>  > http://autobuild.buildroot.org/results/d7323831372050e425a34f5104a46d8cbd6be214
> 
>  > We could have chosen to still enable thumb2 with the internal toolchain.
>  > However, that would mean we create a discrepancy between the result of
>  > building with the same (buildroot) toolchain when it is used as an
>  > internal one or as an external one. To avoid potentially surprising
>  > results, just stick to the option chosen for the rest of the rootfs.
> 
> Why do we actually ever pass --enable-thumb2 / --disable-thumb2? As far
> as I can see, the only thing this does is adding -marm / -mthumb to
> CFLAGS, and we already pass the correct -m<arm/thumb> option in the
> toolchain wrapper.

 Well, if you don't pass anything, it will check if the _compiler_ supports
thumb by compiling (not linking) something which checks for __thumb2__. So we
have to pass something.

 Er, on second look, it uses that compile to set MOZ_THUMB2 and then doesn't do
anything with it... Still, there is a good chance that upstream will in the
future do something with that symbol, so I think it's safer to explicitly
en/disable thumb2.

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
