From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Feb 2019 10:07:45 +0100
Subject: [Buildroot] [PATCH 1/3] runc: depend on linux headers >= 3.11
 for O_TMPFILE
In-Reply-To: <20190219223530.15956-1-christian@paral.in> (Christian Stewart's
 message of "Tue, 19 Feb 2019 14:35:28 -0800")
References: <20190219223530.15956-1-christian@paral.in>
Message-ID: <87ef7tfvku.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Add dependency on headers >= 3.11. O_TMPFILE, required by runc, was not
 > available until this version.

 > Fixes:

 > http://autobuild.buildroot.net/results/63e9d88ae5177541be463f1e2aafec59aa410479

 > Signed-off-by: Christian Stewart <christian@paral.in>
 > ---
 >  package/runc/Config.in | 6 ++++--
 >  1 file changed, 4 insertions(+), 2 deletions(-)

 > diff --git a/package/runc/Config.in b/package/runc/Config.in
 > index 47c850ef30..44713222e4 100644
 > --- a/package/runc/Config.in
 > +++ b/package/runc/Config.in
 > @@ -3,6 +3,7 @@ config BR2_PACKAGE_RUNC
 >  	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
 >  	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS
 > +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 # O_TMPFILE
 >  	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
 >  	help
 >  	  runC is a CLI tool for spawning and running containers
 > @@ -10,7 +11,8 @@ config BR2_PACKAGE_RUNC
 
 >  	  https://github.com/opencontainers/runc
 
 > -comment "runc needs a glibc or musl toolchain toolchain w/ threads"
 > +comment "runc needs a glibc or musl toolchain w/ threads, headers >= 3.11"
 >  	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS && \
 >  		BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
 > -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAN_USES_UCLIBC
 > +	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
 > +  	!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11 || BR2_TOOLCHAN_USES_UCLIBC

This line should be indented by a tab as pointed out by check-package.

Committed series after squashing into a single commit and extending the
commit message to explain when this issue was introduced and the C
library dependencies, thanks.

-- 
Bye, Peter Korsgaard
