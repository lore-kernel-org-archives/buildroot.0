From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Jan 2018 15:47:24 +0100
Subject: [Buildroot] [PATCH 1/1] fs/cpio: add option to manually specify
 file list
In-Reply-To: <20180101132242.GB24931@scaer>
References: <20171026191627.18949-1-sconnor@lynx.com>
 <20171026191627.18949-2-sconnor@lynx.com>
 <20180101125448.41ee4404@windsurf> <20180101132242.GB24931@scaer>
Message-ID: <20180101154724.10ad21fc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 1 Jan 2018 14:22:42 +0100, Yann E. MORIN wrote:

> > So I'm inclined to just apply this, as it may be useful for some users.
> > If you don't voice a concern within the next days, I'll apply.  
> 
> I don't like this much, in fact.
> 
> In such a case, I would say that the initramfs filesystem is a different
> system, and thus should be built with a different .config.
> 
> Basically, what I do in this situation:
> 
>   - have a first .config for kernel+modules + initramfs, and with a
>     post-build script that:
>     1. copy all the kernel modules "somewhere",
>     2. trim the kernel modules that end up in the initramfs, to keep
>        just what is needed to boot;
> 
>   - have a second .config with just userland, plus a post-build script
>     that vampirises the kernel modules from "somwehere" (as saved above)
> 
> Of course, the "somewhere" is agreed on because I know it.
> 
> Besides, this is much more flexible than what this patch proposes.
> 
> Really, the core of the issue is to believe that the two systems are
> one. They are not: they are two different systems.

On the other hand, the initramfs is very often a subset of the complete
root filesystem, and being able to generate an image of this subset
directly from the same configuration as the full-blown system is
definitely a nice thing.

I agree that a separate configuration to build the initramfs is more
flexible, but it also has its drawbacks (to handle kernel modules, as
you mentioned, but also in terms of rebuilding the toolchain if you're
using an internal toolchain). One example where it might be annoying to
have a separate configuration is if you have a single package that
builds both a kernel module and a user-space counterpart.

So yeah, Seamus proposal is not ideal in terms of flexibility, but it
does solve one common use-case with little complexity.

Again, I'm not 100% convinced either, so it's good to have this
discussion.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
