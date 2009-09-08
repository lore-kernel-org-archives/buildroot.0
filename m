From: angus salkeld <angus.salkeld@alliedtelesis.co.nz>
Date: Wed, 09 Sep 2009 07:54:25 +1200
Subject: [Buildroot] [RFC] [PATCH 0/5] Buildroot cleanup
In-Reply-To: <4AA75F310200007000017827@gwia.alliedtelesyn.co.nz>
References: <4AA62DD20200000D00128C56@gwia.alliedtelesyn.co.nz>
	<4AA75F310200007000017827@gwia.alliedtelesyn.co.nz>
Message-ID: <4AA75F310200007000017827@gwia.alliedtelesyn.co.nz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Comments inline.

On Tue, 2009-09-08 at 00:09 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> I would like to propose a few patches to start a cleanup of
> Buildroot. My goal is not only to cleanup Buildroot internally, but
> also to clean it up so that it is easier to understand for our users.
> 
> This thread is meant to be a preliminary discussion only and is not
> yet a request for inclusion, because :
> 
>  * Some of the proposed changes remove features that I think confuse
>    our users and are not central in Buildroot operation, but others
>    might have different opinion on the matter ;
> 
>  * The changes are relatively invasive and I did only limited testing
>    on them.
> 
>  * The documentation is not updated with the changes. I'm waiting for
>    the community opinion on the changes before spending time to update
>    the documentation
> 
> While the commit logs gives all the details, I would like to give an
> quick overview of the proposed changes :
> 
>  1. Remove the "project" feature.
> 
>     This feature is meant to allow an user to build a Linux system for
>     several similar platforms where the differences are only in
>     Busybox, kernel and U-Boot configuration. While this feature might
>     be useful in some very specific cases, my opinion is that it adds
>     far too much complexity in Buildroot compared to the added-value
>     it gives.
> 
>     Removing this feature allows to instantly make the directory
>     layout a lot simpler to understand for a newcomer (no strane
>     project_build_ARCH directory anymore !)
> 
>  2. Remove the BOARD/LOCAL feature.
> 
>     This mechanism is a duplication of something that could already be
>     done in a different way: by adding a new target in target/device/.
> 
Quite a few of our engineers like this feature.
When you are testing that a change doesn't break other targets it is
nice to have a shell per "board" and just be able to run "make" in
each to re-build.

Is the O= a direct replacement for this?


>  3. By default, put the output directories in a single directory,
>     named output/.
> 
>     Nothing complex, it just clarifies the tree for a new user.
> 
>  4. Remove BR2_TOPDIR_PREFIX and BR2_TOPDIR_SUFFIX
> 
>     The same thing can be done with O=
> 
>  5. Rename the output directories with more sensible names.
> 
>     In the output directory, we now have
> 
>      - build/    where all the packages are built
>      - images/   where the final kernel and rootfs images are stored
>      - staging/  the staging directory (containing the development files
>                  and libraries compiled for the target)
>      - target/   which contains the target root filesystem
>      - host/     which contains all the host programs
>      - stamps/   which contains the stamps files
> 

We have a a number of boards to build and this is going put the burden
on the end user to handle moving the output directory around.
Not very user friendly for people who use buildroot in anything but the
simplest case.

Please still support the ability to build multiple targets within the
same buildroot (in configuration). One option would be to make "O=<dir>"
a configuration option (defaulting to the output directory).


Another suggestion would be to completely separate out the toolchain
into a new package "buildcross.git" that only builds the cross
toolchain and then buildroot always uses the external toolchain.
It would make buildroot's toolchain setup simpler (one toolchain mode).
And make sharing toolchains more obvious.

Regards
Angus Salkeld

> Thanks for your input,
> 
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
