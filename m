From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 20 Apr 2011 18:59:56 +0200
Subject: [Buildroot] which templates are used?
In-Reply-To: <20110419222547.3c28192b@surf>
References: <4DA36046.2040606@michaelburghart.de>
	<4DA369FA.8050505@michaelburghart.de> <4DA3709E.7070005@daccii.it>
	<4DA3976B.40807@gmail.com> <20110419222547.3c28192b@surf>
Message-ID: <BANLkTinSSo9GAx1KM-gNndkv4xNaGDEvBw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19 April 2011 22:25, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> On Mon, 11 Apr 2011 17:06:03 -0700
> Steve Calfee <stevecalfee@gmail.com> wrote:
>
>> ?BR2_ROOTFS_POST_BUILD_SCRIPT
>
> That's also what I use. Instead of making modifications to
> fs/skeleton/, or completely duplicating that skeleton, my post build
> script :

I currently use git branches and edit fs/skeleton in each branch. I have
one branch per project. I think this setup has some nice properties:

> ?*) Adjust some files from the skeleton. It does this in a way that
> ? ?allows to re-run make several times without screwing things. For
> ? ?example, if I need to add a new line at the end of a file
> ? ?(like /etc/fstab), I first test that this line hasn't already been
> ? ?added, in order to avoid duplicates.

Automatically handled (or non-existent problem) if using fs/skeleton with
git branches.

> This technique has several advantages :
>
> ?*) You don't change the default skeleton, which would mess things up
> ? ?next time you upgrade Buildroot ;

Why is it messy?

Using git branches you will be notified of conflicts. Upgrades are safe.
If, on the other hand, the post build script is used to edits skeleton
files you may end up with undetected conflicts after a skeleton upgrade
(unsafe).

> ?*) As the post build script is executed at every 'make' invocation,
> ? ?you don't have to 'make clean ; make' to see the effect of your post
> ? ?build script changes.

I've modified the top Makefile so that fs/skeleton is copied to target dir
on every 'make' (patches sent to list[1]).

It may be seen as a downside that this approach is only
one-project-per-branch. But I find that there are already differences
between projects, not only in the skeleton files, so I use one branch per
project anyway.

Are there any (other) downsides to this approach I may have missed?

[1]: http://lists.busybox.net/pipermail/buildroot/2011-March/041685.html

Best regards,
Bj?rn Forsman
