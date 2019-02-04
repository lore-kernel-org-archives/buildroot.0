From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 4 Feb 2019 21:10:37 +0100
Subject: [Buildroot] [PATCH v7 4/8] mariadb: use host-openssl from
 buildroot-system
In-Reply-To: <874l9jykc4.fsf@dell.be.48ers.dk>
References: <20190129093919.22060-1-patrick.havelange@essensium.com>
 <20190129093919.22060-4-patrick.havelange@essensium.com>
 <874l9jykc4.fsf@dell.be.48ers.dk>
Message-ID: <20190204211037.6f5df78e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter, Patrick,

On Mon, 04 Feb 2019 10:27:39 +0100, Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Patrick" == Patrick Havelange <patrick.havelange@essensium.com> writes:  
> 
> Hi,
> 
>  > From: Peter Seiderer <ps.report@gmx.net>
>  > - change WITH_SSL for host build from bundled to system (and add
>  >   host-openssl dependency) to avoid the following configure failure:  
> 9276747defdd4f91ec21ba0930afdf6d947730b6
>  >   CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
>  >     Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
>  >     (Required is at least version "3.3.24")
>  >   Call Stack (most recent call first):
>  >     /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
>  >     /usr/share/cmake/Modules/FindGnuTLS.cmake:54 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
>  >     libmariadb/CMakeLists.txt:298 (FIND_PACKAGE)  
> 
>  > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  > Tested-by: Ryan Coe <bluemrp9@gmail.com>
>  > Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>  
> 
>  > ---
>  > Changes v7:
>  >   - none  
> 
>  > Changes v6:
>  >   - none
>  > ---
>  >  package/mariadb/mariadb.mk | 3 ++-
>  >  1 file changed, 2 insertions(+), 1 deletion(-)  
> 
>  > diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
>  > index e17649209a..e354a9137c 100644
>  > --- a/package/mariadb/mariadb.mk
>  > +++ b/package/mariadb/mariadb.mk
>  > @@ -86,7 +86,8 @@ MARIADB_CONF_OPTS += \
>  >  	-DMYSQL_DATADIR=/var/lib/mysql \
>  >  	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)  
>  
>  > -HOST_MARIADB_CONF_OPTS += -DWITH_SSL=OFF
>  > +HOST_MARIADB_DEPENDENCIES = host-openssl
>  > +HOST_MARIADB_CONF_OPTS += -DWITH_SSL=system  
> 
> I don't quite get this patch. What is the relation to the openssl bump?

It was related back in 2018 when suggested by Ryan Coe ([1])...

> 
> From the error message it sounds like mariadb perhaps has gnutls
> support, and it ends up falling back to that if SSL support is disabled?
> Can't we just disable that?
> 

...and pre commit 9276747defdd4f91ec21ba0930afdf6d947730b6 which disabled
ssl support for the host build (did not get it right while rebasing the
openssl bump patch series), so yes, this patch can be dropped...

Regards,
Peter
 
[1] http://lists.busybox.net/pipermail/buildroot/2018-June/223349.html
[2] https://git.buildroot.net/buildroot/commit/package/mariadb?id=9276747defdd4f91ec21ba0930afdf6d947730b6
