From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 15 Nov 2012 09:13:30 +0100
Subject: [Buildroot] Problems building openssh in buildroot with glibc
In-Reply-To: <CAKduhStLWvGt0cSq4JoKKVmFw4knKZ-k=p-tyj1vtne3XKhR0w@mail.gmail.com>
References: <CAKduhStLWvGt0cSq4JoKKVmFw4knKZ-k=p-tyj1vtne3XKhR0w@mail.gmail.com>
Message-ID: <20121115091330.02d328d9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Price,

On Wed, 14 Nov 2012 13:52:36 -0800, Daniel Price wrote:
> Hi, I'm using a glibc x86_64 based toolchain, and, despite a lot of
> hacking, cannot seem to get the openssh included with buildroot to
> configure.  My host environment is Fedora 15.  The error I encounter
> looks like this:
> 
> -----
> checking OpenSSL header version... not found
> configure: error: OpenSSL version header not found.
> make: *** [/aux0/dp/distro-x86-br-xtools/output-minimal/build/openssh-6.0p1/.stamp_configured]
> Error 1
> -----
> 
> In config.log, I see:
> 
> -----
> configure:10816: checking OpenSSL header version
> configure:10853:
> /aux0/dp/distro-x86-br-xtools/output-minimal/host/usr/bin/x86_64-dssd-linux-gnu-gcc
> -o conftest  -pipe -O3 -g2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64 -Wall -Wpointer-arith -Wuninitialized
> -Wsign-compare -Wformat-security -Wno-pointer-sign -Wno-unused-result
> -fno-strict-aliasing -D_FORTIFY_SOURCE=2 -fno-builtin-memset
> -fstack-protector-all   -pipe -O3 -g2 -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -fstack-protector-all
> conftest.c -lcrypto -ldl -lutil -lz -lnsl  >&5
> configure:10853: $? = 0
> configure:10853: ./conftest
> ./conftest: error while loading shared libraries: libcrypto.so.1.0.0:
> cannot open shared object file: No such file or directory
> configure:10853: $? = 127
> configure: program exited with status 127
> -----
> 
> To summarize: the conftest compiles fine but fails to link at runtime.
>  I've tried various settings of CFLAGS, LDFLAGS, etc. without much
> luck, although my experience with linux's linker in this regard is
> very limited.  I went on a search to see if libcrypto.so.1.0.0 was
> present in my build environment and here is what I found:
> 
> -----
> $ find output -name libcrypto.so.1.0.0
> output/host/usr/x86_64-unknown-linux-gnu/sysroot/usr/lib/libcrypto.so.1.0.0
> output/build/openssl-1.0.0j/libcrypto.so.1.0.0
> output/target/usr/lib/libcrypto.so.1.0.0
> 
> $ find output -name opensslv.h
> output/host/usr/x86_64-unknown-linux-gnu/sysroot/usr/include/openssl/opensslv.h
> output/build/openssl-1.0.0j/include/openssl/opensslv.h
> output/build/openssl-1.0.0j/crypto/opensslv.h
> output/target/usr/include/openssl/opensslv.h
> -----
> 
> Can anyone else confirm the same problem?  Can anyone suggest a
> solution?  If I use uclibc, it compiles fine, but I'm constrained and
> can't do that.  I also know that I could switch to DropBear but I'd
> like to solve this.  I'm happy to file a bug if that helps.

Which Buildroot version are you using? If you're using 2012.08, then it
might be 11017f081fc5b034e680d89eaea729c19f450e01 that is missing,
which leads OpenSSH to not understand we're cross-compiling.

Can you show the entire build output of OpenSSH, preferably in a
pastebin?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
