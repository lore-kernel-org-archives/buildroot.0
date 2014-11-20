From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Nov 2014 11:27:30 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-11-19
In-Reply-To: <87y4r6fc2v.fsf@dell.be.48ers.dk>
References: <20141120073014.164A510107F@stock.ovh.net>
 <20141120094407.4b487379@free-electrons.com>
 <87y4r6fc2v.fsf@dell.be.48ers.dk>
Message-ID: <20141120112730.156f9ee6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Thu, 20 Nov 2014 10:36:24 +0100, Peter Korsgaard wrote:

>  > The uClibc bug about setreuid().
> 
>  > What do we do about this one? It still isn't fixed upstream. Should we
>  > simply disable uClibc for static builds? (But then we would only have
>  > musl left as a C library compatible with static builds). Or do we
>  > simply blacklist for now the packages that are known to use the symbols
>  > causing problems?
> 
>  > Peter?
> 
> uClibc with static linking is useful for quite some setups, so I would
> find it a pity to globally disable it. Let's just disable the affected
> packages with a comment.

So you suggest to disable them within Buildroot, or through an
exception in the autobuild-run script?

Advantage of doing it in the autobuild-run script: we don't need to
propagate to all the reverse dependencies. The script will exclude any
configuration that has the problematic package selected with a uClibc
toolchain.

Drawback of doing it in  the autobuild-run script: normal users of
Buildroot may run into the issue.

> I did that yesterday:
> 
> http://git.buildroot.net/buildroot/commit/?id=d81d202e97258e440d1fc271ba5cdb7c01f7257f

Yep, Baruch pointed me to this commit, which I had missed.

>  >> sh4a |                       qt-4.8.6 | NOK | http://autobuild.buildroot.net/results/119adf6a31266e71e45fb1951d7e8ebbd1ff41fe/
> 
>  > Bug in the CodeSourcery SH4 toolchain. I don't think we have any other
>  > solution than blacklisting configurations that contain Qt4 Webkit and
>  > that use this toolchain. Opinions?
> 
> Yes, I also think we should just blacklist it.

I'll add an exception to the autobuilder then.

>  >> bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/cf2723cf650486586ff18b6ef57c91a74a97bbc9/
> 
>  > bfin-linux-uclibc-g++:
>  > /home/chroot/media/code/buildroot/autobuilder/instance-1/output/host/usr/bfin-buildroot-linux-uclibc/sysroot/opt/uClinux/bfin-linux-uclibc/lib/gcc/bfin-linux-uclibc/4.3.5/libstdc++.so:
>  > No such file or directory
> 
>  > Don't know what's going on. Someone to have a look?
> 
> I also looked at the log, and it doesn't make sense to me. I haven't
> investigated further though.

Ok.

> All in all, it looks pretty good!

Yes, it starts to look good.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
