From: Jan Viktorin <xvikto03@stud.fit.vutbr.cz>
Date: Sun, 7 Apr 2013 22:11:39 +0200
Subject: [Buildroot] [PATCH 4/4] toolchain-external: remove older
 Microblaze toolchain
In-Reply-To: <20130407205553.65f5e32c@skate>
References: <1365357662-25960-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1365357662-25960-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20130407204958.54b890fa@jvarch> <20130407205553.65f5e32c@skate>
Message-ID: <20130407221139.7cd13371@jvarch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

thanks for explaining the reasons to delete the v2 toolchain.

I am currently not able to provide a simple example that reproduces the
situation. Very briefly, I've got a shared library 'libx.so' and an application
'app'. The compilation fails while linking the app with the library. The call
__udivsi3 is located in the libx.so.

The `readelf -d libx.so` says this:

Dynamic section at offset 0x3c9c contains 14 entries:
  Tag        Type                         Name/Value
 0x00000004 (HASH)                       0x94
 0x00000005 (STRTAB)                     0x608
 0x00000006 (SYMTAB)                     0x228
 0x0000000a (STRSZ)                      731 (bytes)
 0x0000000b (SYMENT)                     16 (bytes)
 0x00000007 (RELA)                       0x8e4
 0x00000008 (RELASZ)                     696 (bytes)
 0x00000009 (RELAENT)                    12 (bytes)
 0x00000003 (PLTGOT)                     0x4e1c
 0x00000002 (PLTRELSZ)                   516 (bytes)
 0x00000014 (PLTREL)                     RELA
 0x00000017 (JMPREL)                     0xb9c
 0x00000018 (BIND_NOW)                   
 0x00000000 (NULL)                       0x0

while for other shared libraries that work (and use the same kind of division)
I found:

Dynamic section at offset 0x47c0 contains 20 entries:
  Tag        Type                         Name/Value
 0x00000001 (NEEDED)                     Shared library: [libc.so.6]
 0x0000000c (INIT)                       0xffc
 0x0000000d (FINI)                       0x44fc
 0x00000004 (HASH)                       0x94
 0x00000005 (STRTAB)                     0x658
 0x00000006 (SYMTAB)                     0x238
 0x0000000a (STRSZ)                      639 (bytes)
 0x0000000b (SYMENT)                     16 (bytes)
 0x00000007 (RELA)                       0x99c
 0x00000008 (RELASZ)                     1116 (bytes)
 0x00000009 (RELAENT)                    12 (bytes)
 0x00000003 (PLTGOT)                     0x59f0
 0x00000002 (PLTRELSZ)                   516 (bytes)
 0x00000014 (PLTREL)                     RELA
 0x00000017 (JMPREL)                     0xdf8
 0x00000018 (BIND_NOW)                   
 0x6ffffffe (VERNEED)                    0x95c
 0x6fffffff (VERNEEDNUM)                 1
 0x6ffffff0 (VERSYM)                     0x8d8
 0x00000000 (NULL)                       0x0

So it seems to me that it is a problem with some options passed to the linker
(maybe) because the libc.so.6 reference is missing in the first listing. But I
didn't find anything strange yet. It needs some more review (and more time :/)
but for now the workaround with v2 and LD_PRELOAD is sufficient. I will return
to that issue later. I hope it is just a silly mistake and I will be able to
move to the 14.3 (anyway, thanks for providing it).

Regards
Jan Viktorin

On Sun, 7 Apr 2013 20:55:53 +0200
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Dear Jan Viktorin,
> 
> I'm really happy to see that there are some Microblaze developers using
> Buildroot! Besides this toolchain problem, we would be really happy to
> get your reports and feedback about how Buildroot performs for
> Microblaze platforms.
> 
> On Sun, 7 Apr 2013 20:49:58 +0200, Jan Viktorin wrote:
> 
> > there is an issue with the newer toolchain I'm not able to solve. I
> > tried to google for a solution but I failed.
> > 
> > hidden symbol `__udivsi3' in
> > buildroot/output/host/opt/ext-toolchain/bin/../lib/
> > gcc/microblazeel-unknown-linux-gnu/4.6.2/libgcc.a(udivsi3.o) is
> > referenced by DSO
> 
> Argh. Do you have a way of reproducing this issue?
> 
> 
> > Would it be possible to not delete the older toolchain? I think it is
> > possible to do `git clone` and then just copy the archive to its
> > place like this:
> > 
> > $ git clone https://github.com/Xilinx/microblaze_v2.0_le.git
> > Initialized empty Git repository
> > in /home/user/microblaze_v2.0_le/.git/ remote: Counting objects: 4,
> > done. remote: Compressing objects: 100% (4/4), done.
> > remote: Total 4 (delta 0), reused 4 (delta 0)
> > Unpacking objects: 100% (4/4), done.
> > $ cp microblaze_v2.0_le/microblazeel-unknown-linux-gnu.tgz SOMEWHERE
> > $ rm -Rf microblaze_v2.0_le/
> 
> The problem is that the external toolchain logic is not able to
> download a Git repo and then take a single file from it... It could be
> extended to do that, but I'm not really a fan of doing that just for
> the beauty of Microblaze toolchains.
> 
> Even the new Microblaze toolchain is problematic: it is available as a
> directory inside a Git repo with lots of other stuff. I've contacted
> Xilinx, but they don't seem to understand what the problem is. So the
> only solution we have found so far for the new Microblaze toolchain is
> to make ourselves a tarball of it, which we've stored in
> sources.buildroot.net.
> 
> I can do the same for the older toolchain if you're interested.
> 
> That said, the older toolchain uses a *very* old glibc, and was causing
> lots of problems in our autobuilders. I think it would be a lot better
> to see how to fix the build problem with the newer toolchain. Have you
> tried reporting it to the Xilinx people?
> 
> Thanks,
> 
> Thomas
