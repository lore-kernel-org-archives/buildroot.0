From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sat, 29 Dec 2012 18:54:01 +0200
Subject: [Buildroot] Generating patches against packages source code
In-Reply-To: <20121229171540.5bb22f40@skate>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
 <20121229085947.130784d2@skate> <50DEFA7A.7020002@petroprogram.com>
 <20121229153251.6bdfecfe@skate> <50DF04B3.30801@petroprogram.com>
 <20121229171540.5bb22f40@skate>
Message-ID: <50DF2029.1040605@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

29.12.2012 18:15, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Sat, 29 Dec 2012 16:56:51 +0200, Stefan Fr?berg wrote:
>
>> That's what I meant. Those *inside* Signed-off tags.
>> How should I add those inside Signed-off tags to individual patches
>> (either my own make or 3rd party)
>> applied to mesa3d ?
>>
>> Does git diff command do that ? It does not have -s switch like commit does.
> Ah, ok, I know understand your problem better. You're wondering how to
> nicely generate patches against the package you're working on.
>
> However, one thing you don't seem to realize is that the Signed-off-by
> line is just pure text. There's nothing special about this line, so if
> you have a patch sitting here in your directory, just open your
> favorite text editor, and add the Signed-off-by line, that's it. You
> don't need the '-s' option of Git to add the Signed-off-by line.

Ah, I was hoping (because Im lazy ;-) ) that I don't need to add
manually all those
Signed-off lines.

> So basically, you have three choices (ordered below from the poorest to
> the nicest, in my opinion).
>
> 1. Use the raw diff tool
>
> We will use the raw diff tool only. So first, extract one copy of
> mesa3d source code (outside of Buildroot), and rename the directory:
>
> 	tar xf mesa3d-8.0.5.tar.bz2
> 	mv mesa3d-8.0.5 mesa3d-8.0.5.orig
>
> Extract another copy:
>
> 	tar xf mesa3d-8.0.5.tar.bz2
>
> Then, do your modifications in the mesa3d-8.0.5/ directory. The
> mesa3d-8.0.5.orig/ must be kept unchanged. Once you're done doing your
> modifications, do:
>
> 	diff -ruN mesa3d-8.0.5.orig/ mesa3d-8.0.5/ > mesa3d-01-something.patch
>
> And then, edit mesa3d-01-something.patch with your text editor to add
> the patch description and the Signed-off-by line.
>
> This method is really poor mainly because it is hard to handle multiple
> patches with it. I do not recommend it.
>
> 2. Use quilt
>
> quilt is a tool that allows to generate a stack of patches. I typically
> use quilt as follows in the context of Buildroot. I start building a
> package, and realize it doesn't work. So the package source code has
> already been extracted in output/build/mesa3d-8.0.5/.
>
> What I do is:
>
> 	cd output/build/mesa3d-8.0.5/
> 	mkdir patches
> 	quilt new mesa3d-01-something.patch
> 	quilt edit configure.ac
> 	# Do my changes in configure.ac
>
> Then, I can test to build the package against (of course, don't do a
> make clean, or remove the package directory, or you would loose your
> patches). You can continue editing more files using "quilt edit
> <filename>".
>
> You can also add more patches:
>
> 	quilt new mesa3d-02-something-else.patch
> 	quilt edit ...
>
> At any point, to refresh (i.e generate) the current patch in the
> patches/ directory, run "quilt refresh". You can move forward and
> backward through your patches using quilt pop and quilt push.
>
> When you're on a particular patch, you can edit its description using
> 'quilt header -e'. There, write your patch description and
> Signed-off-by line.
>
> Once you're happy with your patches, make sure to refresh them all, and
> then do:
>
> 	cp patches/*.patch ${your_buildroot_src}/package/mesa3d/
>
> And that's its.
>
> That's typically the method I use when I have only a few minor
> modification to make to a package. It is practical because it can be
> done directly within the build directory of a package.
>
> 3. Use Git
>
> To use Git, the easiest way is to fetch the original source code of the
> package by cloning the official repository of the project, and do the
> modification here. So, something like:
>
> 	git clone git://somewhere.org/mesa3d.git
> 	cd mesa3d/
> 	# identify the tag that corresponds to the official release
> 	# you're working on, i.e 8.0.5. I'll assume it's called v8.0.5
> 	git branch buildroot-work v8.0.5
> 	git checkout buildroot-work
>
> 	# Do your work as usual with Git.
>
> 	# Then, to generate your patches:
> 	git format-patch master
>
> 	# All patches are named 000x-<something>.patch, so you'll have
> 	# to rename them. Typically, I do:
> 	for i in *.patch; do cp $i ${buildroot_src_dir}/package/mesa3d/mesa3d-$i ; done
>
> Hope this helps,
>
> Thomas

This was really helpfull!

I was always wondering how other people add all those several inside
Signed-off lines when submitting one big patch to this list.

Thanks a million!

Stefan
