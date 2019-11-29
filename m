From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri, 29 Nov 2019 09:32:07 +0100
Subject: [Buildroot] [PATCH] package/postgresql: fix filesystem naming
 consistency
In-Reply-To: <20191128223833.702e9baf@gmx.net>
Message-ID: <3057858685-24792@mail.unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From:   Peter Seiderer <ps.report@gmx.net> 

 To:   Pascal de Bruijn <p.debruijn@unilogic.nl> 
 Cc:   <buildroot@busybox.net> 
 Sent:   11/28/2019 10:38 PM 
 Subject:   Re: [Buildroot] [PATCH] package/postgresql: fix filesystem naming consistency 

Hello Pascal, 
 
On Thu, 28 Nov 2019 12:15:42 +0100, Pascal de Bruijn <p.debruijn@unilogic.nl> wrote: 
 
> Currently the service is called postgresql, but other filesystem 
> references are called pgsql, which is inconsistent and confusing. 
> 
> Given that at least Debian uses postgresql in the filesystems 
> as well I would suggest moving the filesystem reference to align 
> with the service name as opposed to the other way around. 
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl> 
> --- 
> ?package/postgresql/Config.in ? ? ? ? ?| 2 +- 
> ?package/postgresql/S50postgresql ? ? ?| 8 ++++---- 
> ?package/postgresql/postgresql.mk ? ? ?| 4 ++-- 
> ?package/postgresql/postgresql.service | 6 +++--- 
> ?4 files changed, 10 insertions(+), 10 deletions(-) 
> 
> diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in 
> index e548d3c..2f677da 100644 
> --- a/package/postgresql/Config.in 
> +++ b/package/postgresql/Config.in 
> @@ -11,7 +11,7 @@ config BR2_PACKAGE_POSTGRESQL 
> ? ? ? ? database system. 
> 
> ? ? ? ? Enable the readline package to gain readline support in 
> - ? ? ? pgsql (the command line interpreter), which offers 
> + ? ? ? psql (the command line interpreter), which offers 
 
+1 for fixing this typo (which dates back to my initial submission from 2014) 
in a separate patch... 
 
> ? ? ? ? command history and edit functions. 
> 
> ? ? ? ? Enable the zlib package to gain builtin compression for 
> diff --git a/package/postgresql/S50postgresql b/package/postgresql/S50postgresql 
> index 1ece4fc..8d7ad34 100644 
> --- a/package/postgresql/S50postgresql 
> +++ b/package/postgresql/S50postgresql 
> @@ -5,20 +5,20 @@ 
> 
> ?umask 077 
> 
> -if [ ! -f /var/lib/pgsql/PG_VERSION ]; then 
> +if [ ! -f /var/lib/postgresql/PG_VERSION ]; then 
> ? ? ? echo "Initializing postgresql data base..." 
> - ? ? su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql' 
> + ? ? su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/postgresql' 
 
-1 for this change as /var/lib/pgsql is the suggested/common default location, see e.g. [1], 
and is saving 5 characters at many location from the script ;-) 


This comes down to:
Do you want to stick with an upstream recommendation even if it's ill considered...
Given this is a trivially avoided inconsistency.


The whole point of having consistent naming between service and related directories is that you don't even have to look in the documentation where things are.



On a sidenote, PostgreSQL does look for /etc/postgresql/postgresql.conf  regardless and not /etc/pgsql/pgsql.conf, so it's a bit of mess really...


As far as I can tell Debian choose to fix this, and RedHat seems to have stuck with the upstream inconsistency as well.


So ultimately it's a bit of philosophical choice...



Regards,
Pascal de Bruijn

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191129/ac3c8cfd/attachment.html>
