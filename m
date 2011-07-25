From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 25 Jul 2011 10:47:57 +0200
Subject: [Buildroot] [PATCH 05/12] package: implement a 'local' site
	method
In-Reply-To: <201107251041.46720.yann.morin.1998@anciens.enib.fr>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <201107250920.26479.yann.morin.1998@anciens.enib.fr>
 <CAAXf6LVZ8tBGYDJevSVKia5buFCFOeO6LUM0vO0P2cx=0nqsPQ@mail.gmail.com>
 <201107251041.46720.yann.morin.1998@anciens.enib.fr>
Message-ID: <CAAXf6LVZD8C8m3R_UxEXGFsPPZLCXL70feauOU79UK=pMNGjhg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Mon, Jul 25, 2011 at 10:41 AM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Thomas, All,
>
> On Monday 25 July 2011 103710 Thomas De Schampheleire wrote:
>> On Mon, Jul 25, 2011 at 9:20 AM, Yann E. MORIN
>> <yann.morin.1998@anciens.enib.fr> wrote:
>> > Thomas*2, All,
>> >
>> > On Monday 25 July 2011 091116 Thomas Petazzoni wrote:
>> >> Le Sun, 24 Jul 2011 16:50:50 +0200,
>> >> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>> >> > But this also means that you cannot properly use a 'local' package
>> >> > from two buildroot installations, since the compilation process
>> >> > happens in the local directory. Is that correct?
>> >>
>> >> Yes, this is unfortunately correct. The only other options would be :
>> >>
>> >> ?* Do the build out-of-tree, but this is already been discussed in
>> >> ? ?another thread as being highly problematic for many packages ;
>> >>
>> >> ?* Make a copy of the complete source tree. This is reasonable for
>> >> ? ?small projects, but for example, for something like the kernel, it
>> >> ? ?is largely unreasonable, and one of the packages for which the
>> >> ? ?"source override" mechanism is the most interesting is the kernel
>> >> ? ?package.
>> >>
>> >> Do you see any other option ?
>> >
>> > Fake an out-of-tree build with some unionfs tricks. There is a FUSE-based
>> > unionfs that works pretty well:
>> > ? ?http://podgorny.cz/moin/UnionFsFuse
>> >
>> > The trick is to lure the package by making it believe it's being built
>> > in-tree, while in fact the package dir is a unionfs mount with:
>> > ?- the package source dir as the lowest-level, read-only branch
>> > ?- the actual build dir as the highest-level, read-write branch
>>
>> But this creates a dependency on the host kernel, right? It needs to
>> have FUSE support.
>
> Indeed. But what (recent) distro does not have FUSE enabled by default ?
> Certainly, Debian has, so does Ubuntu.

I don't know what the actual status is. I checked on the CentOS 5.6
installation that I'm using, and fuse is enabled as a module there.

If others agree that this is common, then that's fine by me.
Ideally, buildroot would work no matter whether there is fuse support.
If there isn't, then we should gracefully continue (with of course the
restriction that all gentargets building should be in-tree, unless we
implement the out-of-tree-support indication I suggested).

Best regards,
Thomas
