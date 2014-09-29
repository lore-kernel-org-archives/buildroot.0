From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Sep 2014 18:59:59 +0200
Subject: [Buildroot] [PATCH v2] autobuilder: branch support
In-Reply-To: <1412002483-43566-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1412002483-43566-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20140929185959.16890004@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Matt Weber,

On Mon, 29 Sep 2014 09:54:43 -0500, Matt Weber wrote:
> Adds an option to specify a specific repository and branch
> for the autobuilder to execute against (Defaults to the master
> branch and mainline repository).
> 
> Signed-off-by: Matt Weber <Matthew.Weber@rockwellcollins.com>

Thanks for the updated patch. However, I'd like the script to refuse
pushing results to autobuild.b.o if the repo and branch values are not
the default ones. So basically, as soon as a login and password are
passed (which for now indicate submission to autobuild.b.o, because
it's hardcoded in the script), the branch and repo should be the
default one.

Maybe something like:

BUILDROOT_DEFAULT_REPO = ...
BUILDROOT_DEFAULT_BRANCH = master

...

br_repo = BUILDROOT_DEFAULT_REPO
br_branch = BUILDROOT_DEFAULT_BRANCH

... get the config from the command line or config file ...

if br_repo != BUILDROOT_DEFAULT_REPO or br_branch != BUILDROOT_DEFAULT_BRANCH:
	if http_login and http_password:
		print "ERROR: cannot submit test results from foreign branch %s:%s" % (br_repo, br_branch)
		sys.exit(1)

or something along those lines.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
