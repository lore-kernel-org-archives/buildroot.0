From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 May 2013 17:30:42 +0200
Subject: [Buildroot] [PATCH] linux: CONFIG_KERNEL_LZO option requires
	host-lzop
In-Reply-To: <20130514111651.0c61cb24@skate> (Thomas Petazzoni's message of
 "Tue, 14 May 2013 11:16:51 +0200")
References: <1368431920-22020-1-git-send-email-fabio.porcedda@gmail.com>
 <20130513100421.4a84d09f@skate>
 <CAHkwnC_KQ30thPqy3WA3wGpOipMfmf6rk-HY78sf=Dus8F9ExQ@mail.gmail.com>
 <20130514111651.0c61cb24@skate>
Message-ID: <8761ylshnh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Dear Fabio Porcedda,
 Thomas> On Tue, 14 May 2013 11:02:32 +0200, Fabio Porcedda wrote:

 >> I know that the best solution is to depend on the linux kernel
 >> configuration, but I don't know a way to do that cleanly.
 >> Maybe some clever idea?
 >> 
 >> Adding mandatory dependency is the simplest and always works but as
 >> you pointed it always builds host-lzop even when is not used.
 >> 
 >> Choosing the compression within buildroot doesn't wok when using a
 >> defconfig or linux-xconfig target but at least does build host-lzop
 >> only when is used.

 Thomas> It does work, as long as the compression type is enforced by
 Thomas> Buildroot, regardless of what was selected by linux-xconfig or
 Thomas> the defconfig.  That's what we do today for
 Thomas> DEVTMPFS/DEVTMPFS_MOUNT/INITRAMFS_SOURCE for example.

 Thomas> However, before going ahead and implementing that, I'd like to
 Thomas> have the opinion of Peter and maybe others.

I agree that it isn't really nice to needlessly build host-lzop/xz if
not needed, but I also dislike extra configuration options (that might
not be in sync with the defconfig).

The difference between the other options we have and this is that either
we closely interact with the kernel build (for initramfs) or the system
fails in nonobvious ways at runtime if not set (devtmpfs).

Nothing else in buildroot really cares about the kernel compression
option (besides that the kernel needs specific build tools).

A quick test on my not-especially-beefy laptop shows:

make host-lzop  29.83s user 3.73s system 107% cpu 31.312 total
make host-xz  21.03s user 2.66s system 126% cpu 18.759 total

So ~50s extra build time if you build a Linux kernel, which isn't too
bad.

Perhaps we can come up with a better solution later, but I'll apply the
patch as it is for 2013.05.

-- 
Bye, Peter Korsgaard
