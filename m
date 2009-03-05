From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Mar 2009 15:22:52 +0100
Subject: [Buildroot] Duplication and size of binaries in generated
	toolchain
In-Reply-To: <20090305151359.20b37039@surf> (Thomas Petazzoni's message of
	"Thu\, 5 Mar 2009 15\:13\:59 +0100")
References: <20090305151359.20b37039@surf>
Message-ID: <878wnkf3r7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> After compiling a toolchain with Buildroot (no packages, no
 Thomas> kernel, see attached configuration file), I end up with
 Thomas> duplicated binaries in the STAGING_DIR.

 Thomas> Same story for as, c++, g++, gcc, ld, nm, objcopy, objdump, ranlib,
 Thomas> strip. In total, it's 24 MB of binaries that are duplicated.

 Thomas> I'm not sure why the binaries without the arm-linux prefix are needed
 Thomas> in usr/arm-linux/bin. But if they are, couldn't they be symbolic links.

They are hard links to the same file:

find -type f -name \*ar|xargs stat
  File: `./usr/bin/powerpc-linux-uclibc-ar'
  Size: 3675834         Blocks: 7192       IO Block: 4096   regular file
Device: fe00h/65024d    Inode: 3638102     Links: 2
Access: (0755/-rwxr-xr-x)  Uid: ( 1000/    peko)   Gid: ( 1000/    peko)
Access: 2009-03-05 13:39:31.000000000 +0100
Modify: 2009-03-05 13:39:31.000000000 +0100
Change: 2009-03-05 13:39:32.000000000 +0100
  File: `./usr/powerpc-linux-uclibc/bin/ar'
  Size: 3675834         Blocks: 7192       IO Block: 4096   regular file
Device: fe00h/65024d    Inode: 3638102     Links: 2
Access: (0755/-rwxr-xr-x)  Uid: ( 1000/    peko)   Gid: ( 1000/    peko)
Access: 2009-03-05 13:39:31.000000000 +0100
Modify: 2009-03-05 13:39:31.000000000 +0100
Change: 2009-03-05 13:39:32.000000000 +0100

 Thomas> Last question: why are the individual binutils so big ? For example,
 Thomas> the strip program is 2.9 MB, ar is 2.4 MB. This looks ridiculously big
 Thomas> for such simple tools. First of all, they are not stripped and they
 Thomas> include debugging symbols, is it really necessary ? Even after
 Thomas> stripping, strip itself is still ~650 KB. Is it because of the static
 Thomas> linking against libbfd ?

I don't actually know. Bernhard?

-- 
Bye, Peter Korsgaard
