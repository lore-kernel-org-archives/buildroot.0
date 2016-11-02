From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 3 Nov 2016 00:27:23 +0100
Subject: [Buildroot] [git commit] core: re-enter make if $(CURDIR) or
 $(O) are not canonical paths
In-Reply-To: <20161102221830.GA3319@free.fr>
References: <20161019211757.83C7D80DB7@busybox.osuosl.org>
 <20161102221830.GA3319@free.fr>
Message-ID: <CAHXCMMLoxKuaHnb_g7qtWuN-yC==pM-EzXq5JiD0Et5ZronfxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Arnout, all,

On Wed, Nov 2, 2016 at 11:18 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Samuel, All,
>
> On 2016-10-19 23:11 +0200, Thomas Petazzoni spake thusly:
>> commit: https://git.buildroot.net/buildroot/commit/?id=173135df5b69dfd5ae6fe6cf2de8833c6f74c143
>> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> When $(CURDIR) and/or $(O) contain symlinks in their paths, they can be
>> resolved differently, depending on each package build-system (whether it
>> uses the given paths or get the absolute canonical ones).
>>
>> Using absolute canonical paths will help achieving reproducible builds and
>> will make easier tracking down host machine paths leaking into the host,
>> target or staging trees.
>> So, this change ensures the build takes place with the CURDIR and O
>> variables are set to their absolute canonical paths.
>>
>> In order to recall the toplevel makefile with absolute canonical paths
>> for $(CURDIR) and $(O), we need to:
>> 1- Compute the absolute canonical paths for $(CURDIR) and $(O) that will
>>    be passed to the sub-make. This is achieved using the 'realpath' make
>>    primitive. However, some care must be taken when manipulating O:
>>    - the out-of-tree makefile wrapper happens a trailing "/.", we need
>>      to strip this part away to not break the comparison driving the
>>      sub-make call;
>>    - the user can leave a trailing '/' to $(O);
>>    - according to [1,2], realpath returns an empty string in case of
>>      non-existing entry. So, to avoid passing an empty O= variable to
>>      sub-make, it is necessary to define the output directory and create
>>      it prior to call realpath on it (because on the first invocation,
>>      $(O) usually does not yet exists), hence the trick doing the mkdir
>>      right before calling realpath.
>> 2- Update EXTRAMAKEARGS with the absolute canonical $(O) and use it
>>    when call recalling the top-level makefile with umask and paths
>>    correctly set.
>> 3- Lastly, update the condition for setting the CONFIG_DIR and
>>    NEED_WRAPPER variables.
>>
>> Note:
>> * This change takes care of the makefile wrapper installed in $(O) to
>>   avoid unneeded make recursion.
>
> This commit breaks a few use-cases that were previously working.
>
> for example, Maxime reports that:
>
>     make BR2_PRIMARY_SITE=blabla source
>
> no longer works.
>
> Also, the autobuilders now no longer respect their 'njobs' configuration
> option, for the same reason; they (basivally) do:
>
>     make BR2_JLEVEL=kwargs["--njobs"]
>
> but this is nol onger working either.
>
> Care to have a look at this, please?

Could you explain in details a test case you got (what you look at
exactly to get this, or maybe you just git-bisect-ed?)?

I think it may be cause by this patch [1] not being apply.
Would you mind give it a try and report back?
I gave it a quick try using this diff [2], and running 'make
foo-reconfigure' w/ and w/o various variables on the command line.

Arnout, do you have an idea about what happens here?... this is a bit
beyond my make-fu :-/

Regards,

[1] http://patchwork.ozlabs.org/patch/682684/
[2] http://code.bulix.org/8k4x9g-107063/?raw


-- 
Samuel
