From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 04 Feb 2019 10:27:39 +0100
Subject: [Buildroot] [PATCH v7 4/8] mariadb: use host-openssl from
 buildroot-system
In-Reply-To: <20190129093919.22060-4-patrick.havelange@essensium.com> (Patrick
 Havelange's message of "Tue, 29 Jan 2019 10:39:15 +0100")
References: <20190129093919.22060-1-patrick.havelange@essensium.com>
 <20190129093919.22060-4-patrick.havelange@essensium.com>
Message-ID: <874l9jykc4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Patrick" == Patrick Havelange <patrick.havelange@essensium.com> writes:

Hi,

 > From: Peter Seiderer <ps.report@gmx.net>
 > - change WITH_SSL for host build from bundled to system (and add
 >   host-openssl dependency) to avoid the following configure failure:

 >   CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
 >     Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
 >     (Required is at least version "3.3.24")
 >   Call Stack (most recent call first):
 >     /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
 >     /usr/share/cmake/Modules/FindGnuTLS.cmake:54 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
 >     libmariadb/CMakeLists.txt:298 (FIND_PACKAGE)

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > Tested-by: Ryan Coe <bluemrp9@gmail.com>
 > Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>

 > ---
 > Changes v7:
 >   - none

 > Changes v6:
 >   - none
 > ---
 >  package/mariadb/mariadb.mk | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
 > index e17649209a..e354a9137c 100644
 > --- a/package/mariadb/mariadb.mk
 > +++ b/package/mariadb/mariadb.mk
 > @@ -86,7 +86,8 @@ MARIADB_CONF_OPTS += \
 >  	-DMYSQL_DATADIR=/var/lib/mysql \
 >  	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)
 
 > -HOST_MARIADB_CONF_OPTS += -DWITH_SSL=OFF
 > +HOST_MARIADB_DEPENDENCIES = host-openssl
 > +HOST_MARIADB_CONF_OPTS += -DWITH_SSL=system

I don't quite get this patch. What is the relation to the openssl bump?

From the error message it sounds like mariadb perhaps has gnutls
support, and it ends up falling back to that if SSL support is disabled?
Can't we just disable that?

-- 
Bye, Peter Korsgaard
