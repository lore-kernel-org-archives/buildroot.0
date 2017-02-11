From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 11 Feb 2017 22:35:05 +0100
Subject: [Buildroot] [PATCH v1 2/2] WIP: qt5base: use system/buildroot
 provided harfbuzz
In-Reply-To: <20170211192055.157a05a1@free-electrons.com>
References: <20170209223055.31121-1-ps.report@gmx.net>
 <20170209223055.31121-2-ps.report@gmx.net>
 <20170210171223.0492d6ca@gmx.net>
 <20170211192055.157a05a1@free-electrons.com>
Message-ID: <20170211223505.0c88b566@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 11 Feb 2017 19:20:55 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Fri, 10 Feb 2017 17:12:23 +0100, Peter Seiderer wrote:
> 
> > Qt5 does not (yet) have the dependency on BR2_TOOLCHAIN_HAS_SYNC_4 (but seems
> > to compile fine with the bundled version of harfbuzz), is this
> > because (the existing) dependency on BR2_TOOLCHAIN_HAS_THREADS_NPTL is
> > 'stronger' than BR2_TOOLCHAIN_HAS_SYNC_4 (or is this complete unrelated)?
> 
> These are completely unrelated. For example, SPARC has NPTL, but not
> BR2_TOOLCHAIN_HAS_SYNC_4.

Thanks for the answer...

Found the trick of the Qt built-in harfbuzz, they use the QAtomicPointer implementation
instead of the default harfbuzz provided for hb_atomic_int_impl_add, hb_atomic_ptr_impl_get
and hb_atomic_ptr_impl_cmpexch (see qtbase-opensource-src-5.8.0/src/3rdparty/harfbuzz-ng/config.h).

What should we do for the !BR2_TOOLCHAIN_HAS_SYNC_4 case:

- fall back to qt built-in harfbuzz
- disable harfbuzz support

Regards,
Peter

> 
> Thomas
