From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2019 19:12:04 +0200
Subject: [Buildroot] [PATCH 1/2] package/docker-compose: bump version to
 1.24.1
In-Reply-To: <20191026140526.19489-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 26 Oct 2019 16:05:24 +0200")
References: <20191026140526.19489-1-peter@korsgaard.com>
Message-ID: <87y2x7e8ij.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes https://gitlab.com/buildroot.org/buildroot/-/jobs/332656041
 > The recent bump of a number of python packages broke docker-compose, as
 > docker-compose specifies both minimum and maximum versions for (most of) its
 > dependencies:

 > Dependencies of docker-compse 1.20.1 (! = unmet):
 > cached-property: < 2 (currently 1.51)
 > docopt: < 0.7 (currently 0.6.2)
 > ! pyyaml: < 4.0, patched to < 4.3 (currently 5.1.2)
 > requests: < 2.19, patched to < 3 (currently 2.22.0)
 > ! texttable: < 0.10 (currently 1.6.2)
 > websocket-client: < 1.0 (currently 0.56.0)
 > ! docker: < 4.0 (currently 4.1.0)
 > dockerpty: < 0.5 (currently 0.4.1)
 > six: < 2 (currently 1.12.0)
 > jsonschema: < 3 (currently 2.5.1)
 > enum34: < 2 (currently 1.1.6)
 > backports.ssl-match-hostname: >= 3.5 (currently 3.7.0.1)
 > ipaddress: >= 1.0.16 (currently 1.0.23)

 > To fix this, bump docker-compose to the most recent release (1.24.1).  This
 > is unfortunately not enough, as our docker, pyyaml, requests and texttable
 > packages are too new, so add 3 patches from upstream to relax the version
 > checks of dependencies.  Notice that patch 0003 is from
 > https://github.com/docker/compose/pull/6623 and has not been merged yet.

 > Discussions around the problem of these maximum versions of the dependencies
 > and the fact that all downstream users have to patch it is ongoing here:

 > https://github.com/docker/compose/issues/6756

 > docker-compose 1.24.1 added a requirement for ssh support in python-docker in:
 > https://github.com/docker/compose/commit/7b82b2e8c721010b73f664e9d4657746a1fcd92b

 > So add a dependency for python-paramiko and update the toolchain dependency
 > for C++ (from python-paramiko -> python-cryptography) and adjust the
 > toolchain configuration of the runtime test to match.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

..

 > +++ b/package/docker-compose/Config.in
 > @@ -4,6 +4,7 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 >  	depends on BR2_USE_WCHAR # python
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS # python
 >  	depends on !BR2_STATIC_LIBS # python
 > +	depends on BR2_INSTALL_LIBSTDCPP # python-paramiko -> python-cryptography
 >  	select BR2_PACKAGE_PYTHON3 if !BR2_PACKAGE_PYTHON
 >  	select BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME \
 >  	       if BR2_PACKAGE_PYTHON # runtime
 > @@ -11,6 +12,7 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 >  	select BR2_PACKAGE_PYTHON_IPADDRESS if BR2_PACKAGE_PYTHON # runtime
 >  	select BR2_PACKAGE_PYTHON_CACHED_PROPERTY # runtime
 >  	select BR2_PACKAGE_PYTHON_DOCOPT # runtime
 > +	select BR2_PACKAGE_PYTHON_PARAMIKO # runtime
 >  	select BR2_PACKAGE_PYTHON_PYYAML # runtime
 >  	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 >  	select BR2_PACKAGE_PYTHON_TEXTTABLE # runtime
 > @@ -24,6 +26,7 @@ config BR2_PACKAGE_DOCKER_COMPOSE
 
 >  	  https://www.docker.com/
 
 > -comment "docker-compose needs a toolchain w/ wchar, threads, dynamic library"
 > +comment "docker-compose needs a toolchain w/ C++, wchar, threads, dynamic library"
 >  	depends on BR2_USE_MMU
 > -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 > +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 > +		BR2_STATIC_LIBS || BR2_INSTALL_LIBSTDCPP

As pointed out by Thomas, this should be !BR2_INSTALL_LIBSTDCPP. I guess
we can fix that when applying.

-- 
Bye, Peter Korsgaard
