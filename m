From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Aug 2015 22:47:25 +0200
Subject: [Buildroot] [PATCH 1/2] package/poco: bump to version 1.6.1
In-Reply-To: <20150810205427.156aa7b9@free-electrons.com>
References: <1438682248-29767-1-git-send-email-joerg.krause@embedded.rocks>
 <20150810162227.6a3cde19@free-electrons.com>
 <1439217249.5186.18.camel@embedded.rocks>
 <20150810205427.156aa7b9@free-electrons.com>
Message-ID: <20150810204725.GG3676@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-08-10 20:54 +0200, Thomas Petazzoni spake thusly:
> On Mon, 10 Aug 2015 16:34:09 +0200, J?rg Krause wrote:
> > In that case I do not understand the help text from
> > nightly.buildroot.org, 17.4. The .hash file:
> > 
> > "The none hash type is reserved to those archives downloaded from a
> > repository, like a git clone, a subversion checkout? or archives
> > downloaded with the github helper Section 17.19.2, ?How to add a 
> >                     ^^^^^^^^^^^^^
> > package from GitHub?."
> > 
> > And from the example:
> > "# No hash for 1234, comes from the github-helper:
> > none   xxx                                                             
> >  libfoo-1234.tar.gz"
> 
> I think the case where we really need the "none" type is for packages
> that sometimes get downloaded as a tarball, and sometimes from Github.

Yes, that's one of the reasons the 'none' type was added.

> Look for example at binutils.hash:
> 
> # From ftp://gcc.gnu.org/pub/binutils/releases/sha512.sum
> sha512  ffe8ef263ef99183e8cc823fe8487ff7d0f7bf9a8efd2853b5f4636aca0023850d13de4eac7d77a5f69413d8a50e6f95bb14569be53df86c0bce38034525ab74  binutils-2.22.tar.bz2
> sha512  dec753bbba008f1526b89cf1bd85feba78f362f5333ffdf93953fd131eb755976dec82a0a4ba38c43d2434da007137780cfe674de5414be5cf7ce7fbc6af6d16  binutils-2.23.2.tar.bz2
> sha512  5ec95ad47d49b12c4558a8db0ca2109d3ee1955e3776057f3330c4506f8f4d1cf5e505fbf8a16b98403a0fcdeaaf986fe0a22be6456247dbdace63ce1f776b12  binutils-2.24.tar.bz2
> sha512  0b36dda0e6d32cd25613c0e64b56b28312515c54d6a159efd3db9a86717f114ab0a0a1f69d08975084d55713ebaeab64e4085c9b3d1c3fa86712869f80eb954d  binutils-2.25.1.tar.bz2
> # No hash for the ARC variant, comes from the github-helper:
> none   xxx  binutils-arc-2015.06.tar.gz
> 
> We want hashes for the tarballs, so we added them. But then, the logic
> of the hash verification is that if a .hash file exists, then *all*
> files downloaded by the package should have hashes. If not, then the
> build is aborted. That's why we added this "none" type.
> 
> Now, we could also decided to add just a single "none" entry in the
> hash file of packages downloaded from Github just to make it clear that
> there is voluntarily no hash being provided, and therefore clarify
> between packages that don't have a hash file because it hasn't been
> added yet from packages that don't have a hash file because they are
> downloaded from Github. But it means adding quite a bunch of pretty
> useless .hash files to the ~220+ packages we download from github.
> 
> In any case, we should clarify that in the documentation, indeed.
> 
> Yann, thoughts?

I think the overall goal is to have .hash files for all packages. Having
a .hash files for all packages would allow us to make hashes truly
mandatory, and make a missing .hash file an error, rather than the
warning it is today.

Which in turn would ensure we have hashes for all packages for which it
makes sense.

Of course, that would mean adding a 'none' hash for those packages for
which we can't have  ahash (like the github helper, or any git/svn/... 
checkouts.

So, what J?rg did was in my opinion correct, even if we did not
explicitly document that! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
