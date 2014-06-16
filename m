From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 16 Jun 2014 17:19:31 +0200 (CEST)
Subject: [Buildroot] Sourcery Codebench standard edition
In-Reply-To: <1111022260.18094075.1402928168412.JavaMail.root@openwide.fr>
Message-ID: <84042763.18097561.1402931971145.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Someone has already tried to use Sourcery CodeBench standard edition with Buildroot ?
(I guess not since it don't work as is ;-) )
I'm using buildroot 2013.08, but I think problems remain in the latest version.

I had several issue with the external-toolchain wrapper, since this toolchain need the -msgxx-glibc flag in CFLAGS.

Here is what I have done:
1) Add this new toolchain as external toolchain in ext-tool.mk:
else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201405),y)
#TOOLCHAIN_EXTERNAL_SITE = no public download site
TOOLCHAIN_EXTERNAL_SOURCE = ia32-2014.05-08-i686-pc-linux-gnu-i386-linux.tar.bz2
TOOLCHAIN_EXTERNAL_CFLAGS += -msgxx-glibbc

2) The sysroot directory can't be deducted from "gcc -print-file-name=libc.a" without -msgxx-glibc,
so I added $(TOOLCHAIN_EXTERNAL_CFLAGS) in ext-toolchain-checked and ext-toolchain-installed target.
(file ext-tool.mk)

3) Then, I had a link issue since the specific directory "sgxx-glibc" from toolchain's sysroot wasn't copied to Buildroot's sysroot:
"cannot find crt1.o no such file or directory "
I added a rsync in copy_toolchain_sysroot helper to copy "sgxx-glibc"

4) Now, I can build some target packages but I have links issues with some packages (ncurses, util-linux, can-utils, e2fsprogs)
And, last but not least, I can't build a kernel Linux (It's a pity)

All build fine with the latest (but quite old now) Sourcery CodeBench x86/x86_64 2012.09 toolchain.

Any ideas ?

Best regards,
Romain Naour
