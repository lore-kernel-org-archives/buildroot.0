From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Nov 2017 00:40:55 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <20171116001919.67e98b4b@gmx.net>
References: <20171113102757.ir7so5o7h7zopcvq@dell5510>
 <20171113144231.gddccsqlelrhrokw@dell5510> <20171114234409.114f002f@gmx.net>
 <20171115125857.dcy6j7qvjt32ww43@dell5510>
 <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
 <20171116001919.67e98b4b@gmx.net>
Message-ID: <58b8ef53-75b6-fc8b-8d37-e21570ae4e3b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 16-11-17 00:19, Peter Seiderer wrote:
> Hello Arnout,
> 
> On Thu, 16 Nov 2017 00:03:45 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
> 
>> On 15-11-17 13:58, Petr Vorel wrote:
>>>> Cannot execute cross-compiler '.../host/opt/ext-toolchain/bin/x86_64-ctng_locales-linux-gnu-gcc'
>>>> make[1]: *** [package/pkg-generic.mk:209: .../build/toolchain-external/.stamp_configured] Error 1
>>>> make: *** [Makefile:16: _all] Error 2
>>>> Maybe the toolchain definition should select BR2_HOSTARCH_NEEDS_IA32_LIBS?  
>>> It must be some system library dependency as I was able to run the build on Debian unstable.
>>> Failing build is on openSUSE Tumbleweed x86_64 (the same as you), but I have glibc-32bit
>>> and many other 32 bit packages installed (as well on Debian machine).
>>> I tried to play with BR2_HOSTARCH_NEEDS_IA32_LIBS, but didn't found the solution.
>>> Thomas, any idea what can be wrong?  
>>
>>
>>  What does .../host/opt/ext-toolchain/bin/x86_64-ctng_locales-linux-gnu-gcc -v
>> report? When you run ldd on it? When you run it under strace? What about the
>> other binaries bundled in that tarball? What about other external toolchains
>> (e.g. sourcery)?
> 
> The above error message is from old buildroot 2016.11.3 (the compiler tar file is downloaded and
> upacked and fails at runtime)...
> 
> The original error is with git master (or all buildroot past the ec54092c916440501006bfa51a820eb953100510
> ('toolchain-external-custom: new package') commit:
> 
> /usr/bin/install -m 0644 support/misc/target-dir-warning.txt .../build-prebuild-toolchain-001/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
> ^[[7m>>> skeleton-init-sysv  Extracting^[[27m
> ^[[7m>>> skeleton-init-sysv  Patching^[[27m
> ^[[7m>>> skeleton-init-sysv  Configuring^[[27m
> ^[[7m>>> skeleton-init-sysv  Building^[[27m
> ^[[7m>>> skeleton-init-sysv  Installing to target^[[27m
> rsync -a --ignore-times --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS --chmod=u=rwX,go=rX --exclude .empty --exclude '*~' package/skeleton-init-sysv//skeleton/ .../build-prebuild-toolchain-001/target/
> ^[[7m>>> skeleton  Extracting^[[27m
> ^[[7m>>> skeleton  Patching^[[27m
> ^[[7m>>> skeleton  Configuring^[[27m
> ^[[7m>>> skeleton  Building^[[27m
> ^[[7m>>> skeleton  Installing to target^[[27m
> make[1]: *** No rule to make target 'toolchain-external-custom', needed by '.../build-prebuild-toolchain-001/build/toolchain-external/.stamp_configured'.  Stop.
> make: *** [Makefile:16: _all] Error 2
> 
> The error occurs  before the prebuild toolchain is downloaded/extracted...

 That is really weird, the toolchain-external-custom dependencies should be
defined no matter what... Could you pastebin the output make 'make -qp' somewhere?

 I would think it would be somehow related to gcc not being executable, but
since this occurs before the package is even extracted... Just to be sure, what
is the contents of output/build when you get this error? There is no
toolchain-external-custom directory yet, right?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
