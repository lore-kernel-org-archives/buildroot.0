From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 3 Nov 2016 16:19:38 +0100
Subject: [Buildroot] [git commit] core: re-enter make if $(CURDIR) or
 $(O) are not canonical paths
In-Reply-To: <CAGduivzPY9V05Cy3HQgYu6rLUjbX5Kuz8wUueaf0HGwcjQwx7Q@mail.gmail.com>
References: <20161019211757.83C7D80DB7@busybox.osuosl.org>
 <20161102221830.GA3319@free.fr>
 <CAHXCMMLoxKuaHnb_g7qtWuN-yC==pM-EzXq5JiD0Et5ZronfxA@mail.gmail.com>
 <00e6d7a0-0e8e-ffaa-6382-6084a3af8162@mind.be>
 <CAGduivzPY9V05Cy3HQgYu6rLUjbX5Kuz8wUueaf0HGwcjQwx7Q@mail.gmail.com>
Message-ID: <265a8ed3-b0b9-5039-558f-b449d2b3aedd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-16 16:05, Maxime Hadjinlian wrote:
> Hi everyone,
> 
> On Thu, Nov 3, 2016 at 2:58 AM, Arnout Vandecappelle <arnout@mind.be
> <mailto:arnout@mind.be>> wrote:
> 
> 
> 
>     On 03-11-16 00:27, Samuel Martin wrote:
>     > Yann, Arnout, all,
>     >
>     > On Wed, Nov 2, 2016 at 11:18 PM, Yann E. MORIN <yann.morin.1998@free.fr
>     <mailto:yann.morin.1998@free.fr>> wrote:
>     >> Samuel, All,
>     >>
>     >> On 2016-10-19 23:11 +0200, Thomas Petazzoni spake thusly:
>     >>> commit:
>     https://git.buildroot.net/buildroot/commit/?id=173135df5b69dfd5ae6fe6cf2de8833c6f74c143
>     <https://git.buildroot.net/buildroot/commit/?id=173135df5b69dfd5ae6fe6cf2de8833c6f74c143>
>     >>> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>     <https://git.buildroot.net/buildroot/commit/?id=refs/heads/master>
>     >>>
>     >>> When $(CURDIR) and/or $(O) contain symlinks in their paths, they can be
>     >>> resolved differently, depending on each package build-system (whether it
>     >>> uses the given paths or get the absolute canonical ones).
>     >>>
>     >>> Using absolute canonical paths will help achieving reproducible builds and
>     >>> will make easier tracking down host machine paths leaking into the host,
>     >>> target or staging trees.
>     >>> So, this change ensures the build takes place with the CURDIR and O
>     >>> variables are set to their absolute canonical paths.
>     >>>
>     >>> In order to recall the toplevel makefile with absolute canonical paths
>     >>> for $(CURDIR) and $(O), we need to:
>     >>> 1- Compute the absolute canonical paths for $(CURDIR) and $(O) that will
>     >>>    be passed to the sub-make. This is achieved using the 'realpath' make
>     >>>    primitive. However, some care must be taken when manipulating O:
>     >>>    - the out-of-tree makefile wrapper happens a trailing "/.", we need
>     >>>      to strip this part away to not break the comparison driving the
>     >>>      sub-make call;
>     >>>    - the user can leave a trailing '/' to $(O);
>     >>>    - according to [1,2], realpath returns an empty string in case of
>     >>>      non-existing entry. So, to avoid passing an empty O= variable to
>     >>>      sub-make, it is necessary to define the output directory and create
>     >>>      it prior to call realpath on it (because on the first invocation,
>     >>>      $(O) usually does not yet exists), hence the trick doing the mkdir
>     >>>      right before calling realpath.
>     >>> 2- Update EXTRAMAKEARGS with the absolute canonical $(O) and use it
>     >>>    when call recalling the top-level makefile with umask and paths
>     >>>    correctly set.
>     >>> 3- Lastly, update the condition for setting the CONFIG_DIR and
>     >>>    NEED_WRAPPER variables.
>     >>>
>     >>> Note:
>     >>> * This change takes care of the makefile wrapper installed in $(O) to
>     >>>   avoid unneeded make recursion.
>     >>
>     >> This commit breaks a few use-cases that were previously working.
>     >>
>     >> for example, Maxime reports that:
>     >>
>     >>     make BR2_PRIMARY_SITE=blabla source
> 
>     >>
>     >> no longer works.
>     >>
>     >> Also, the autobuilders now no longer respect their 'njobs' configuration
>     >> option, for the same reason; they (basivally) do:
>     >>
>     >>     make BR2_JLEVEL=kwargs["--njobs"]
>     >>
>     >> but this is nol onger working either.
>     >>
>     >> Care to have a look at this, please?
>     >
>     > Could you explain in details a test case you got (what you look at
>     > exactly to get this, or maybe you just git-bisect-ed?)?
> 
> So here's my test case; I use an external and here's how my CI bot does it:
> 
> $ rm buildroot/dl/tzdata* ; make O=../output -C buildroot
> BR2_EXTERNAL=../myexternal tzdata-extract
> 
> It will go and download by using the BR2_PRIMARY_SITE defined in my defconfig,
> everything's fine.
> Now if I do that:
> 
> $ rm buildroot/dl/tzdata* ; make O=../output -C buildroot
> BR2_EXTERNAL=../myexternal BR2_PRIMARY_SITE="blabla" tzdata-extract
> It is still gonna use the value defined in my defconfig instead of the one on
> the command line which should take precedence.
> 
> It doesn't matter if you pass the variable to make or put it in the ENV.

 So, have you tested http://patchwork.ozlabs.org/patch/690649/ ?

 If yes, can you add your Tested-by?

 Regards,
 Arnout

> 
>     >
>     > I think it may be cause by this patch [1] not being apply.
>     > Would you mind give it a try and report back?
> 
> It clearly fixes my issue and I assume the one encountered by the autobuilders. 
> 
>     > I gave it a quick try using this diff [2], and running 'make
>     > foo-reconfigure' w/ and w/o various variables on the command line.
>     >
>     > Arnout, do you have an idea about what happens here?... this is a bit
>     > beyond my make-fu :-/
> 
>      Yay make-fu!
> 
>     http://patchwork.ozlabs.org/patch/690649/
>     <http://patchwork.ozlabs.org/patch/690649/>
> 
> 
>      I shouldn't have dismissed your patch [1] so easily...
> 
> 
>      Regards,
>      Arnout
> 
>     >
>     > Regards,
>     >
>     > [1] http://patchwork.ozlabs.org/patch/682684/
>     <http://patchwork.ozlabs.org/patch/682684/>
>     > [2] http://code.bulix.org/8k4x9g-107063/?raw
>     <http://code.bulix.org/8k4x9g-107063/?raw>
>     >
>     >
> 
>     --
>     Arnout Vandecappelle                          arnout at mind be
>     Senior Embedded Software Architect            +32-16-286500
>     <tel:%2B32-16-286500>
>     Essensium/Mind                                http://www.mind.be
>     G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
>     LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
>     <http://www.linkedin.com/in/arnoutvandecappelle>
>     GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> 
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
