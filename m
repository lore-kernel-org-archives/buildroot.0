From: Enoch W. <ixew@hotmail.com>
Date: Tue, 14 Jan 2020 18:48:01 +0000
Subject: [Buildroot] Multiple ("simultaneous") buildroot projects
In-Reply-To: <0559f5de-e2c1-12b5-deeb-57f62103b7c3@mind.be>
References: <BY5PR01MB6084639E519B441D79221318CC390@BY5PR01MB6084.prod.exchangelabs.com>
 <0559f5de-e2c1-12b5-deeb-57f62103b7c3@mind.be>
Message-ID: <BY5PR01MB6084637E18DE8692ABF9B17DCC340@BY5PR01MB6084.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Very helpful answer, Thanks, Enoch.


On 1/13/20 5:27 PM, Arnout Vandecappelle wrote:



On 09/01/2020 20:08, Enoch W. wrote:


Good day to all,


I have now a second buildroot project in active development relying on a different Linux version.

Is there a recommended way to manage the two with maximal code sharing?



 Normally if the two project should be able to use the same buildroot tree -
even if you add custom packages directly in the buildroot tree (rather than
through BR2_EXTERNAL), they can share code.

 They would be different only because they use a different defconfig.

 You can have the build results side-by-side by setting an output directory
explicitly with O= instead of using the default output/

 The two project configurations may share some of the common files (e.g. kernel
configuration fragments, overlay files, post-build and post-image scripts). For
example, I would typically have an organisation like this:

-+-- buildroot (= checked-out buildroot sources, typically as a git submodule)
 +-+ output
 | +-- project1 (= O=$PWD/output/project1 output directory used for project1)
 | +-- project2 (= O=$PWD/output/project2 output directory used for project2)
 +-- project1 (overlay, kernel config, ... specific for project1)
 +-- project2 (overlay, kernel config, ... specific for project2)
 +-- common (overlay, kernel config, ... common to the projects)
 +-+ configs
 | +-- project1_defconfig (= Buildroot defconfig for project1)
 | +-- project2_defconfig (= Buildroot defconfig for project2)
 +-- Makefile (top-level makefile that sets O= and calls into buildroot make)


 Regards,
 Arnout





Or is it best to put the two in separate docker containers? :-)

I've seen this question coming up before, but not receiving an "official answer".


Thanks, Enoch.


_______________________________________________
buildroot mailing list
buildroot at busybox.net<mailto:buildroot@busybox.net>
http://lists.busybox.net/mailman/listinfo/buildroot



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200114/16e04f01/attachment.html>
