From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 14:51:44 +0200
Subject: [Buildroot] [PATCH 1/5] package/mariadb: use host-openssl from
 buildroot-system
In-Reply-To: <20190915193559.8464-1-bluemrp9@gmail.com>
References: <20190915193559.8464-1-bluemrp9@gmail.com>
Message-ID: <8c5e2a96-7093-3239-79b9-1d690d1e3383@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15/09/2019 21:35, Ryan Coe wrote:
> From: Peter Seiderer <ps.report@gmx.net>
> 
> - change WITH_SSL for host build from bundled to system (and add
>   host-openssl dependency) to avoid the following configure failure:
> 
>   CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
>     Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
>     (Required is at least version "3.3.24")
>   Call Stack (most recent call first):
>     /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
>     /usr/share/cmake/Modules/FindGnuTLS.cmake:54 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
>     libmariadb/CMakeLists.txt:298 (FIND_PACKAGE)
> 

 I've added some of the feedback from Thomas to the commit message here and
applied the series to master, thanks. I've also put patch 5/5 as the second patch.

 Peter, the first 3 are probably for backporting to both stable branches. The
version bump should definitely go to 2019.08.x, but I believe also 10.3.15 is
affected by those CVEs so maybe the bump should be carried there as well...

 Regards,
 Arnout

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> Tested-by: Ryan Coe <bluemrp9@gmail.com>
> ---
>  package/mariadb/mariadb.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
> index bc22642beb..8aa10d6de1 100644
> --- a/package/mariadb/mariadb.mk
> +++ b/package/mariadb/mariadb.mk
> @@ -86,7 +86,8 @@ MARIADB_CONF_OPTS += \
>  	-DMYSQL_DATADIR=/var/lib/mysql \
>  	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)
>  
> -HOST_MARIADB_CONF_OPTS += -DWITH_SSL=OFF
> +HOST_MARIADB_DEPENDENCIES = host-openssl
> +HOST_MARIADB_CONF_OPTS += -DWITH_SSL=system
>  
>  # Some helpers must be compiled for host in order to crosscompile mariadb for
>  # the target. They are then included by import_executables.cmake which is
> 
