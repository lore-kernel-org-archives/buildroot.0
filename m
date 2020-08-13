From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 13 Aug 2020 20:06:52 +0200
Subject: [Buildroot] [PATCH] Makefile: properly account for custom tags
 in BR2_VERSION_FULL
In-Reply-To: <20200720115958.2564971-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 20 Jul 2020 13:59:57 +0200")
References: <20200720115958.2564971-1-thomas.petazzoni@bootlin.com>
Message-ID: <87mu2y5sjn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > BR2_VERSION_FULL is currently defined as follows:
 >   BR2_VERSION_FULL := $(BR2_VERSION)$(shell $(TOPDIR)/support/scripts/setlocalversion)

 > This BR2_VERSION_FULL value then gets used as the "VERSION" variable
 > in the /etc/os-release file.

 > The logic of "setlocalversion" is that if it is exactly on a tag, it
 > returns nothing.

 > If it is on a tag + a number of commits, then it returns only
 > -XYZ-gABC where XYZ is the number of commits since the last tag, and
 > ABC the git commit hash (these are extracted from git describe).

 > This output then gets concatenated to BR2_VERSION which gives
 > something like 2020.05 or 2020.05-00123-g5bc6a.

 > The issue is that when you're on a tag specific to your project, which
 > is not a Buildroot YYYY.MM tag, then the output of setlocalversion is
 > empty, and all you get as VERSION in os-release is $(BR2_VERSION)
 > which is not really nice. Worse, if you have another non-official
 > Buildroot tag between the last official Buildroot tag/version and
 > where you are, you will get $(BR2_VERSION)-XYZ-gABC, but XYZ will not
 > correspond to the number of commits since BR2_VERSION, but since the
 > last tag that "git describe" as found, which is clearly incorrect.

 > Here is an example: you're on master, "make print-version" (which
 > displays BR2_VERSION_FULL) will show:

 > $ make print-version
 > 2020.08-git-00758-gc351877a6e

 > So far so good. Now, you create a tag say 5 commits "before" master,
 > and show BR2_VERSION_FULL again:

 > $ git tag -a -m "dummy tag" dummy-tag HEAD~5
 > $ make print-version
 > 2020.08-git-00005-gc351877a6e

 > This makes you believe you are 5 commits above 2020.08, which is
 > absolutely wrong.

 > So this commit simplifies the logic of setlocalversion to simply
 > return what "git describe" provides, and not prepend $(BR2_VERSION) in
 > the main Makefile. Since official Buildroot tags match official
 > Buildroot version names, you get the same output when you're on an
 > official Buildroot tag, or some commits above a Buildroot tag. An in
 > other cases, you get a sensible output. The logic is also adjusted for
 > the Mercurial case.

 > In the above situation, with this commit applied, we get:

 > $ make print-version
 > dummy-tag-6-g6258cdddeb

 > (6 commits instead of 5 as we have this very commit applied, but at
 > least it's 6 commits on top of the dummy-tag)

 > Finally, if you're not using a version control system, setlocalversion
 > was already returning nothing, so in this case, the Makefile simply
 > sets BR2_VERSION_FULL to BR2_VERSION to preserve this behavior.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
