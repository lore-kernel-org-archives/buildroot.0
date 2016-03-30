From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Mar 2016 15:41:02 +0200
Subject: [Buildroot] [PATCH] tcl: remove non-existent
 --with-system-sqlite configure option
In-Reply-To: <1459344688-24416-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1459344688-24416-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160330154102.56aa3d9b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 30 Mar 2016 14:31:28 +0100, Vicente Olivert Riera wrote:
> For some reason, even if this option is not available anymore, it's
> causing build failures if we use it. When we remove it the build
> succeeds.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/022/02296f8624d3406a63d3a179f53862f245c56dc1/
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

I don't see why you think this option no longer exists. A simple grep
is pretty clear that it still exists:

pkgs/sqlite3.11.0/configure:  --with-system-sqlite    use a system-supplied libsqlite3 instead of the
pkgs/sqlite3.11.0/configure:# The --with-system-sqlite causes the TCL bindings to SQLite to use
pkgs/sqlite3.11.0/configure:# Check whether --with-system-sqlite was given.
pkgs/sqlite3.11.0/configure.ac:# The --with-system-sqlite causes the TCL bindings to SQLite to use
pkgs/sqlite3.11.0/configure.ac:AC_ARG_WITH([system-sqlite],
pkgs/sqlite3.11.0/configure.ac: [AC_HELP_STRING([--with-system-sqlite],

Looking at the output of './configure --help' to figure out which
options are available is not sufficient. Indeed, when you have
sub-configure scripts, as is the case for tcl, ./configure --help
doesn't show you the options of the sub-configures, but it is actually
passing the main configure options down to the sub-configures. See
https://www.gnu.org/software/automake/manual/html_node/Subpackages.html#Subpackages
for details.

So your patch fixes the problem because it tells TCL to use its bundled
version of sqlite, and not the one provided by Buildroot. Which means:

TCL_DEPENDENCIES = $(if $(BR2_PACKAGE_SQLITE),sqlite)

becomes useless, as well as other parts of tcl.mk that refer to
BR2_PACKAGE_SQLITE.

In addition, we generally prefer to *not* use bundled versions of the
libraries, so it would be better to figure out why using the system
sqlite no longer works, possibly by reporting a bug upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
