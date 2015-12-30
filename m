From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Dec 2015 23:40:50 +0100
Subject: [Buildroot] sysroot
In-Reply-To: <CA+C+_XTdzafsUvNhP=HAmqQbQVuzX5kjo3=QYAeNph2mghiiyQ@mail.gmail.com>
References: <CA+C+_XRofByfgd5oo5R1CZykm=vhsXQLD0ESODbkwxXwiTF9QA@mail.gmail.com>
 <5683FCE8.6000206@mind.be>
 <CA+C+_XTdzafsUvNhP=HAmqQbQVuzX5kjo3=QYAeNph2mghiiyQ@mail.gmail.com>
Message-ID: <56845D72.9080007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30-12-15 19:42, Mathew Benson wrote:
> First, I'm not complaining.  I recently discovered Buildroot and I love it. 
> Kudos to the maintainers.  I'm just learning it so I'm fumbling about a bit. 
> 
> I'm building a networked appliance that will run two applications.  Both
> applications are already written.  One I wrote and maintained myself over the
> past 4 years, but its 32 bit.  Upgrading it to 64 bit would have a massive
> impact on other projects.  Its planned.  Just not for a little while.  The other
> application is being written but requires 64 bit drivers.  The drivers are not
> open source, so I don't have access to the code.  The CPU is a 64 bit Intel to
> accommodate the 64 bit driver.  

 If with "driver" you mean that it's in the kernel, then you don't have a
problem: you can easily use a 64-bit kernel with a fully 32-bit userspace. It
does mean that you can't build your kernel with buildroot, but it should be
possible to just use your 32-bit cross-compiler for the kernel (remember to pass
ARCH=x86_64).


> I did get it almost working.  I verified I can
> run 32-bit applications by compiling host code, copying it over, and copying the
> needed 32 bit libraries over.  Obviously not the best solution.  I got it to
> cross compile 32 bit, with manual tweaks.  I had to change several .so linker
> scripts from "/lib" and "/usr/lib" to "/lib32" and "/usr/lib32", and changing
> symbolic links in "/usr/lib32" from "/lib" to "/lib32".  I see that buildroot is
> not intended for this use case, so I'm ok with my manual work around.
> 
> Though, I haven't quite got it to run correctly.  Its either a dynamic linking
> issue or just a misconfigured buildroot image.  When I run my executable, I get
> an error that suggests the system is interpreting the elf binary as a shell
> script.  I'm not sitting at that computer, so I can't copy the exact error. 
> Something like "error:  unexpected "("". 
> 
> I did create a 32 bit and a 64 bit buildroot environment.  I had merged them
> into a single multilib 64 bit environment, though now I'm thinking it would just
> be cleaner to keep them separate.

 Merging them is never going to make a real multilib environment, because
executable will look for the dynamic linker in /lib/ld-linux.so.2 (for glibc).
Both 64-bit and 32-bit executables look in the same place for it, so one of them
is going to be wrong.

 What you could do is to use a real multilib toolchain (e.g. a Sourcery
toolchain). Compile most of your rootfs in 64-bit, and the one application that
needs to be 32-bit you compile directly with the external toolchain (bypassing
hte buildroot wrapper). Then you also manually copy the 32-bit sysroot from the
external toolchain to the target.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
