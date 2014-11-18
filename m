From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 18 Nov 2014 13:28:05 -0300
Subject: [Buildroot] [PATCH 1/2] arch/powerpc: add fsl e5500 and e6500
 support
In-Reply-To: <20141118162020.02921a54@free-electrons.com>
References: <1416266092-6465-1-git-send-email-gustavo@zacarias.com.ar>	<1416266092-6465-2-git-send-email-gustavo@zacarias.com.ar>	<CANQCQpbtbch9q-HKXFhQRkKxYpr1FD9nhebwpiaj=65O_Pm+xQ@mail.gmail.com>	<546B5779.9010708@zacarias.com.ar>
 <20141118162020.02921a54@free-electrons.com>
Message-ID: <546B7395.4040804@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/18/2014 12:20 PM, Thomas Petazzoni wrote:

> That's kind of annoying, and we have a similar problem on x86-64 when
> we need to build a 32 bits bootloader (though this might become less of
> an issue with UEFI being capable of using 64 bits bootloaders).
> 
> Should we do something about this, and support multilib? Note that SH4
> is also broken since quite a while in the internal toolchain backend
> because it needs multilib support. The issue is how do we decide which
> multilib variants to build? Do we simply "force" a certain set of
> multilib variants for a given architecture?

Yes it is, i think we should deal with it.
In most scenarios there aren't more than 2 possible combinations.
Quick examples would be:

* x86_64 -> i386, x32 (ugh), x86_64
Most of the time you want the 64-bit kernel with one of i386 or x32.
Bootloader might be subject to being built as 32-bit because of legacy.

* sparc64 -> 64-v9 or 32-v9.
Useful for a 64-bit kernel with 32ul mostly, or everything 64 (no
multilib) (i know we don't support sparc64, but it's a good testbed with
qemu for this so we could enable it).

* ppc64 -> 64 or 32, same deal as sparc64.

* sh4 -> i'm not familiar but i think there are more than 2 variants
that could be used at the same time?

* mips64 -> IIRC similar to sparc64 mixed ABI/bitness is possible.

For example back on gentoo times we had two separate toolchains for
kernel and userland for sparc64 (32ul/64k) which was the
reasonable/upstream default, these days it's multilib for that.
Question is, do we want to do the full multilib dance? (userland
components to match some blob prereq is the primary use for that).
Regards.
