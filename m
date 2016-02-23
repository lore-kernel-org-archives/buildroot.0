From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Feb 2016 00:04:19 +0100
Subject: [Buildroot] [git commit] docs/manual/contribute.txt: add formatting
	patches section
Message-ID: <20160223230639.BCE068074E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=eb56faf259338321e1c93271654201b0c812222a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Thomas P. has sent a few big feedback mails recently that explain how a
patch should be formatted. Indeed, this was not explained much in the
manual, so add a section that explains how patches should be formatted.
This is based heavily on the feedback that Thomas P. gave. Also,
specific examples for new packages and version bumps are added.

This will allow us to refer to
https://buildroot.org/manual.html#submitting-patches
in the future instead of composing long mails.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>
[Thomas: rewrap to our normal formatting practice.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/contribute.txt | 74 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 90c73de..1b1f4de 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -184,6 +184,80 @@ instead_.
 If you made some changes to Buildroot and you would like to contribute
 them to the Buildroot project, proceed as follows.
 
+==== The formatting of a patch
+
+We expect patches to be formatted in a specific way. This is necessary
+to make it easy to review patches, to be able to apply them easily to
+the git repository, to make it easy to find back in the history how
+and why things have changed, and to make it possible to use +git
+bisect+ to locate the origin of a problem.
+
+First of all, it is essential that the patch has a good commit
+message. The commit message should start with a separate line with a
+brief summary of the change, starting with the name of the affected
+package. The body of the commit message should describe _why_ this
+change is needed, and if necessary also give details about _how_ it
+was done. When writing the commit message, think of how the reviewers
+will read it, but also think about how you will read it when you look
+at this change again a few years down the line.
+
+Second, the patch itself should do only one change, but do it
+completely. Two unrelated or weakly related changes should usually be
+done in two separate patches. This usually means that a patch affects
+only a single package. If several changes are related, it is often
+still possible to split them up in small patches and apply them in a
+specific order. Small patches make it easier to review, and often
+make it easier to understand afterwards why a change was done.
+However, each patch must be complete. It is not allowed that the
+build is broken when only the first but not the second patch is
+applied. This is necessary to be able to use +git bisect+ afterwards.
+
+Of course, while you're doing your development, you're probably going
+back and forth between packages, and certainly not committing things
+immediately in a way that is clean enough for submission. So most
+developers rewrite the history of commits to produce a clean set of
+commits that is appropriate for submission. To do this, you need to
+use _interactive rebasing_. You can learn about it
+https://git-scm.com/book/en/v2/Git-Tools-Rewriting-History[in the Pro
+Git book]. Sometimes, it is even easier to discard you history with
++git reset --soft origin/master+ and select individual changes with
++git add -i+ or +git add -p+.
+
+Finally, the patch should be signed off. This is done by adding
++Signed-off-by: Your Real Name <your@email.address>+ at the end of the
+commit message. +git commit -s+ does that for you, if configured
+properly. The +Signed-off-by+ tag means that you publish the patch
+under the Buildroot license (i.e. GPLv2, except for package patches,
+which have the upstream license), and that you are allowed to do so.
+See http://developercertificate.org/[the Developer Certificate of
+Origin] for details.
+
+When adding new packages, you should submit every package in a
+separate patch. This patch should have the update to
++package/Config.in+, the package +Config.in+ file, the +.mk+ file, the
++.hash+ file, any init script, and all package patches. If the package
+has many sub-options, these are sometimes better added as separate
+follow-up patches. The summary line should be something like
++<packagename>: new package+. The body of the commit message can be
+empty for simple packages, or it can contain the description of the
+package (like the Config.in help text). If anything special has to be
+done to build the package, this should also be explained explicitly in
+the commit message body.
+
+When you bump a package to a new version, you should also submit a
+separate patch for each package. Don't forget to update the +.hash+
+file, or add it if it doesn't exist yet. Also don't forget to check if
+the +_LICENSE+ and +_LICENSE_FILES+ are still valid. The summary line
+should be something like +<packagename>: bump to version <new
+version>+. If the new version only contains security updates compared
+to the existing one, the summary should be +<packagename>: security
+bump to version <new version>+ and the commit message body should show
+the CVE numbers that are fixed. If some package patches can be removed
+in the new version, it should be explained explicitly why they can be
+removed, preferably with the upstream commit ID. Also any other
+required changes should be explained explicitly, like configure
+options that no longer exist or are no longer needed.
+
 ==== Preparing a patch series
 
 Starting from the changes committed in your local git view, _rebase_
