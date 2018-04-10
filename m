From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 10:23:29 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-09
In-Reply-To: <c4f7202a-5609-9c3d-81b8-9209fe7497e4@smile.fr>
References: <20180410060022.4CF112071F@mail.bootlin.com>
 <c4f7202a-5609-9c3d-81b8-9209fe7497e4@smile.fr>
Message-ID: <20180410102329.3109623f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 10:15:29 +0200, Valentin Korenblit wrote:

> We have the following problem: llvm-config (host version installed in STAGING_DIR)
> is not being able to link correctly with the libc of the host system. This happens
> in the following scenario: target architecture = x86_64 and target libc != glibc
> (assuming host system has glibc).
> 
> As the RPATH specifies $ORIGIN/../lib and the binary is located in STAGING_DIR/usr/bin,
> it tries to link with the libc of the target, resulting in:

While the build is running, the rpath is not $ORIGIN/../lib. The RPATH
in the host and staging directories are only changed from an absolute
path to $ORIGIN/../lib in the "make sdk" target.

So while this will indeed cause a problem for llvm-config in the SDK
situation, I don't quite understand how you get this $ORIGIN/../lib
today, without running "make sdk".

> ./llvm-config: error while loading shared libraries: libc.so.0: cannot open shared object file:
> 	No such file or directory.
> 
> It is important that llvm-config is located in STAGING, as it returns linker flags and
> include directories relative to its location:
> 
> For example, when installed in STAGING_DIR/usr/bin:
> 
> ./llvm-config --ldflags
> -L/home/vakor/buildroot/output/host/x86_64-buildroot-linux-uclibc/sysroot/usr/lib
> 
> But when installed in HOST_DIR/bin
> 
> ./llvm-config --ldflags
> -L/home/vakor/buildroot/output/host/lib
> 
> The quick solution would be to change the RPATH to HOST_DIR/lib after copying it to STAGING,
> so we'll also need either chrpath or patchelf. Otherwise, we can do a wrapper script in
> STAGING that calls llvm-config from host, but this will have some outputs that are hardcoded
> and will be more difficult to maintain in case llvm-config is modified in future versions.
> 
> I would like to know which would be an appropriate solution for this, any suggestions are
> welcome.

One possibility is to do like we do for postgresql: provide our own
minimal -config script. See package/postgresql/pg_config for an example.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
