From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Dec 2012 15:32:51 +0100
Subject: [Buildroot] (no subject)
In-Reply-To: <50DEFA7A.7020002@petroprogram.com>
References: <1356745553-15362-1-git-send-email-stefan.froberg@petroprogram.com>
 <20121229085947.130784d2@skate> <50DEFA7A.7020002@petroprogram.com>
Message-ID: <20121229153251.6bdfecfe@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Sat, 29 Dec 2012 16:13:14 +0200, Stefan Fr?berg wrote:

> Thomas, can you tell a git newbie like me how to make single patch but
> still keeping that Signed-off line in
> each logical file in that single one patch ?

I am not sure to understand your question. I think you're confusing the
SoB line in the Buildroot patch with the SoB line in the patches that
apply on mesa3d, aren't you?

So basically, your final patch should look like this:

=======================================================================
mesa3d: bump to version 8.0.5

Here you explain that you're bumping to 8.0.5, and that it requires new
patches, for this reason and that reason, and blablabla.

Signed-off-by: Stefan Fr?berg <...>
---
Here git will generate the diff-stat of your overall patch

diff --git a/package/x11r7/mesa3d/mesa3d.mk b/package/x11r7/mesa3d/mesa3d.mk 
index ...
--- a/package/x11r7/mesa3d/mesa3d.mk
+++ b/package/x11r7/mesa3d/mesa3d.mk
... here your changes to mesa3d.mk

diff --git a/package/x11r7/mesa3d/mesa3d-01-something.patch b/package/x11r7/mesa3d/mesa3d-01-something.patch
index ...
--- /dev/null
+++ b/package/x11r7/mesa3d/mesa3d-01-something.patch
+ mesa3d: fix something
+
+ This is the description of the mesa3d-01-something.patch. You explain
+ what you are doing here.
+
+ Signed-off-by: Stefan Fr?berg <...>
+
+ ... here your mesa3d-01-something.patch ...

diff --git a/package/x11r7/mesa3d/mesa3d-02-something-else.patch b/package/x11r7/mesa3d/mesa3d-02-something-else.patch
index ...
--- /dev/null
+++ b/package/x11r7/mesa3d/mesa3d-02-something-else.patch
+ mesa3d: fix something else
+
+ This is the description of the mesa3d-02-something-else.patch. You explain
+ what you are doing here.
+
+ Signed-off-by: Stefan Fr?berg <...>
+
+ ... here your mesa3d-02-something-else.patch ...
=======================================================================

And that's it. See the recently posted "[Buildroot] [PATCH 20/20]
enlightenment: new package" e-mail. It adds enlightenment.mk and
contains a patch to it.

Basically you need *one* Signed-off-by in the commit log of the Git
patch that applies to Buildroot. And then one Signed-off-by per patch
that you're applying to mesa3d, but those Signed-off-by are *inside*
the patch applied to mesa3d, not in the commit log of the Git patch
applied to Buildroot.

> So far I have done the following:
> 
> create branch
> 
> make some changes
> git add those_changes
> git commit -s -m "description"
> 
> repeat the previous three if necessary
> 
> git format-patch -M master
> 
> git send-email .......

Yes, that's correct, except that your patches should not be separated,
because they are altogether needed to make mesa3d build correctly. You
have correctly understood the rule that patches should be split as much
as possible in little pieces to ease the review. But you forgot the
rule that the build process should not be broken between patches, even
patches of the same set.

So basically, now you have a branch with 5 commits. So, what you are
going to do is:

 1) Got into this branch

 git checkout yourbranch

 2) Do an interactive rebase of your branch

 git rebase -i master

 3) A text editor will open, with 5 lines, corresponding to your five
 commits. Each line will start with the word "pick". Keep this "pick"
 action for the first line, but for the four next lines, change "pick"
 to "squash", and exit your text editor.

 4) Git will merge your four patches into the first one, leaving at the
 end only one patch. In the process, it will open a text editor to
 allow you to edit the commit message of the first patch.

And that's it.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
