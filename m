From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 16 Nov 2017 00:19:19 +0100
Subject: [Buildroot] Cannot rebuild autobuild
In-Reply-To: <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
References: <20171113102757.ir7so5o7h7zopcvq@dell5510>
 <20171113144231.gddccsqlelrhrokw@dell5510>
 <20171114234409.114f002f@gmx.net>
 <20171115125857.dcy6j7qvjt32ww43@dell5510>
 <61134b08-bb0a-4665-4b68-3ea2e4063563@mind.be>
Message-ID: <20171116001919.67e98b4b@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Thu, 16 Nov 2017 00:03:45 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 15-11-17 13:58, Petr Vorel wrote:
> >> Cannot execute cross-compiler '.../host/opt/ext-toolchain/bin/x86_64-ctng_locales-linux-gnu-gcc'
> >> make[1]: *** [package/pkg-generic.mk:209: .../build/toolchain-external/.stamp_configured] Error 1
> >> make: *** [Makefile:16: _all] Error 2
> >> Maybe the toolchain definition should select BR2_HOSTARCH_NEEDS_IA32_LIBS?  
> > It must be some system library dependency as I was able to run the build on Debian unstable.
> > Failing build is on openSUSE Tumbleweed x86_64 (the same as you), but I have glibc-32bit
> > and many other 32 bit packages installed (as well on Debian machine).
> > I tried to play with BR2_HOSTARCH_NEEDS_IA32_LIBS, but didn't found the solution.
> > Thomas, any idea what can be wrong?  
> 
> 
>  What does .../host/opt/ext-toolchain/bin/x86_64-ctng_locales-linux-gnu-gcc -v
> report? When you run ldd on it? When you run it under strace? What about the
> other binaries bundled in that tarball? What about other external toolchains
> (e.g. sourcery)?

The above error message is from old buildroot 2016.11.3 (the compiler tar file is downloaded and
upacked and fails at runtime)...

The original error is with git master (or all buildroot past the ec54092c916440501006bfa51a820eb953100510
('toolchain-external-custom: new package') commit:

/usr/bin/install -m 0644 support/misc/target-dir-warning.txt .../build-prebuild-toolchain-001/target/THIS_IS_NOT_YOUR_ROOT_FILESYSTEM
^[[7m>>> skeleton-init-sysv  Extracting^[[27m
^[[7m>>> skeleton-init-sysv  Patching^[[27m
^[[7m>>> skeleton-init-sysv  Configuring^[[27m
^[[7m>>> skeleton-init-sysv  Building^[[27m
^[[7m>>> skeleton-init-sysv  Installing to target^[[27m
rsync -a --ignore-times --exclude .svn --exclude .git --exclude .hg --exclude .bzr --exclude CVS --chmod=u=rwX,go=rX --exclude .empty --exclude '*~' package/skeleton-init-sysv//skeleton/ .../build-prebuild-toolchain-001/target/
^[[7m>>> skeleton  Extracting^[[27m
^[[7m>>> skeleton  Patching^[[27m
^[[7m>>> skeleton  Configuring^[[27m
^[[7m>>> skeleton  Building^[[27m
^[[7m>>> skeleton  Installing to target^[[27m
make[1]: *** No rule to make target 'toolchain-external-custom', needed by '.../build-prebuild-toolchain-001/build/toolchain-external/.stamp_configured'.  Stop.
make: *** [Makefile:16: _all] Error 2

The error occurs  before the prebuild toolchain is downloaded/extracted...

Regards,
Peter

> 
>  Regards,
>  Arnout
