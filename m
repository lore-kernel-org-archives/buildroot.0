From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 25 Jul 2011 09:20:26 +0200
Subject: [Buildroot] [PATCH 05/12] package: implement a 'local' site
	method
In-Reply-To: <20110725091116.1655460c@skate>
References: <cover.1311141087.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LUCODt7jvwhN7iFogCrH0F6isiszDJ=6710-Uu=kVz+sA@mail.gmail.com>
 <20110725091116.1655460c@skate>
Message-ID: <201107250920.26479.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas*2, All,

On Monday 25 July 2011 091116 Thomas Petazzoni wrote:
> Le Sun, 24 Jul 2011 16:50:50 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
> > But this also means that you cannot properly use a 'local' package
> > from two buildroot installations, since the compilation process
> > happens in the local directory. Is that correct?
> 
> Yes, this is unfortunately correct. The only other options would be :
> 
>  * Do the build out-of-tree, but this is already been discussed in
>    another thread as being highly problematic for many packages ;
> 
>  * Make a copy of the complete source tree. This is reasonable for
>    small projects, but for example, for something like the kernel, it
>    is largely unreasonable, and one of the packages for which the
>    "source override" mechanism is the most interesting is the kernel
>    package.
> 
> Do you see any other option ?

Fake an out-of-tree build with some unionfs tricks. There is a FUSE-based
unionfs that works pretty well:
    http://podgorny.cz/moin/UnionFsFuse

The trick is to lure the package by making it believe it's being built
in-tree, while in fact the package dir is a unionfs mount with:
  - the package source dir as the lowest-level, read-only branch
  - the actual build dir as the highest-level, read-write branch

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
