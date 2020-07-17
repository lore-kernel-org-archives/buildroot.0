From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 17 Jul 2020 22:20:43 +0200
Subject: [Buildroot] [PATCH 1/1] treewide: replace nogroup with nobody
In-Reply-To: <20200717102048.346554-1-nolange79@gmail.com>
References: <20200717102048.346554-1-nolange79@gmail.com>
Message-ID: <20200717202043.GI18825@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2020-07-17 12:20 +0200, Norbert Lange spake thusly:
> Use the recommended groupname for user nobody. One practical
> issue is that systemd-sysusers will otherwise create a
> nobody group with gid 999.
> 
> Quote: "If the username exists on a system,then they should
> be in the suggested corresponding group".
> 
> https://refspecs.linuxfoundation.org/LSB_5.0.0/LSB-Core-generic/LSB-Core-generic/usernames.html

Note the phrasing, which states 'should' and 'suggested', in that they
are not mandatory. And indeed, I'm looking at Ubuntu 19.10 here. which
has a 'nogroup' group, and no 'nobody' group.

It is however to be noted that, initially, only the 'nobody' group did
exist (commit 339f2f492e, 2001-12-22), and subsequently removed soon
afterwards (commit 08782ae7d8, 2002-04-26). to be then reintroduced
again a while later (commit 3ed6fb0af3, 2005-08-07).

And them oh-so-shortly afterwards, the 'nogroup' group makes its grand
appearance (commit 3c31be684d, 2005-08-09), on the excuse to make LTP
happy.

However, nowadays, LTP does check preferentially for 'nobody', and falls
back on 'nogroup', with this comment (in IDcheck.sh):

    # nobody is a standard group on all distros, apart from debian based ones;
    # let's account for the fact that they use the nogroup group instead.

So, indeed, switching to using 'nobody' makes sense, and would not make
LTP less happy.

As for the numbering, I seemd to recall some specificities of 65534, and
indeed I found commit 9c67af2c52, 2019-08-25, that switched 'nogroup'
from 99 to 65534, so we're clean there too.

And for the records, I was the one to drop the 'nobody' group 7 years
ago now, in commit 908198e756, stating "Anyway, the user 'nobody'
belongs to the group 'nogroup' in any sane distribution." Damn. ;-]

Nits, below...

> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/boa/boa.conf                 | 18 +++++++++---------
>  package/mosquitto/mosquitto.mk       |  2 +-
>  package/oracle-mysql/oracle-mysql.mk |  2 +-
>  package/systemd/systemd.mk           |  1 -
>  system/skeleton/etc/group            |  2 +-
>  5 files changed, 12 insertions(+), 13 deletions(-)
> 
> diff --git a/package/boa/boa.conf b/package/boa/boa.conf
> index e94029665f..03630c0f9a 100644
> --- a/package/boa/boa.conf
> +++ b/package/boa/boa.conf
> @@ -7,7 +7,7 @@
>  # generated parser.  If it reports an error, the line number will be
>  # provided; it should be easy to spot.  The syntax of each of these
>  # rules is very simple, and they can occur in any order.  Where possible
> -# these directives mimic those of NCSA httpd 1.3; I saw no reason to 
> +# these directives mimic those of NCSA httpd 1.3; I saw no reason to

Lots of spurious changes (removal of trailing spaces), should not be in
that patch.

Regards,
Yann E. MORIN.

>  # introduce gratuitous differences.
>  
>  # $Id: boa.conf,v 1.1 2004/10/09 02:48:37 andersen Exp $
> @@ -46,7 +46,7 @@ Port 80
>  # Group: The group name or GID the server should run as.
>  
>  User nobody
> -Group nogroup
> +Group nobody
>  
>  # ServerAdmin: The email address where server problems should be sent.
>  # Note: this is not currently used, except as an environment variable
> @@ -68,7 +68,7 @@ ErrorLog /var/log/boa/error_log
>  
>  # AccessLog: The location of the access log file. If this does not
>  # start with /, it is considered relative to the server root.
> -# Comment out or set to /dev/null (less effective) to disable 
> +# Comment out or set to /dev/null (less effective) to disable
>  # Access logging.
>  
>  AccessLog /var/log/boa/access_log
> @@ -78,7 +78,7 @@ AccessLog /var/log/boa/access_log
>  #  process if the receiving end of a pipe stops reading."
>  #AccessLog  "|/usr/sbin/cronolog --symlink=/var/log/boa/access_log /var/log/boa/access-%Y%m%d.log"
>  
> -# UseLocaltime: Logical switch.  Uncomment to use localtime 
> +# UseLocaltime: Logical switch.  Uncomment to use localtime
>  # instead of UTC time
>  #UseLocaltime
>  
> @@ -88,8 +88,8 @@ AccessLog /var/log/boa/access_log
>  
>  #VerboseCGILogs
>  
> -# ServerName: the name of this server that should be sent back to 
> -# clients if different than that returned by gethostname + gethostbyname 
> +# ServerName: the name of this server that should be sent back to
> +# clients if different than that returned by gethostname + gethostbyname
>  
>  #ServerName www.your.org.here
>  
> @@ -103,7 +103,7 @@ AccessLog /var/log/boa/access_log
>  # output rules, it prepends the interface number to each access_log line.
>  # You are expected to fix that problem with a postprocessing script.
>  
> -#VirtualHost 
> +#VirtualHost
>  
>  # DocumentRoot: The root directory of the HTML documents.
>  # Comment out to disable server non user files.
> @@ -131,9 +131,9 @@ DirectoryMaker /usr/lib/boa/boa_indexer
>  
>  # DirectoryCache: If DirectoryIndex doesn't exist, and DirectoryMaker
>  # has been commented out, the the on-the-fly indexing of Boa can be used
> -# to generate indexes of directories. Be warned that the output is 
> +# to generate indexes of directories. Be warned that the output is
>  # extremely minimal and can cause delays when slow disks are used.
> -# Note: The DirectoryCache must be writable by the same user/group that 
> +# Note: The DirectoryCache must be writable by the same user/group that
>  # Boa runs as.
>  
>  # DirectoryCache /var/spool/boa/dircache
> diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
> index 2a9b504eb8..cdd515e1a4 100644
> --- a/package/mosquitto/mosquitto.mk
> +++ b/package/mosquitto/mosquitto.mk
> @@ -114,7 +114,7 @@ define MOSQUITTO_INSTALL_INIT_SYSTEMD
>  endef
>  
>  define MOSQUITTO_USERS
> -	mosquitto -1 nogroup -1 * - - - Mosquitto user
> +	mosquitto -1 nobody -1 * - - - Mosquitto user
>  endef
>  endif
>  
> diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
> index 1449c58e41..ccfa40cfb1 100644
> --- a/package/oracle-mysql/oracle-mysql.mk
> +++ b/package/oracle-mysql/oracle-mysql.mk
> @@ -102,7 +102,7 @@ ORACLE_MYSQL_CONF_OPTS += --without-debug
>  endif
>  
>  define ORACLE_MYSQL_USERS
> -	mysql -1 nogroup -1 * /var/mysql - - MySQL daemon
> +	mysql -1 nobody -1 * /var/mysql - - MySQL daemon
>  endef
>  
>  define ORACLE_MYSQL_ADD_FOLDER
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 88adf1941c..ddcf7d0cc0 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -45,7 +45,6 @@ SYSTEMD_CONF_OPTS += \
>  	-Dloadkeys-path=/usr/bin/loadkeys \
>  	-Dsetfont-path=/usr/bin/setfont \
>  	-Dtelinit-path=/sbin/telinit \
> -	-Dnobody-group=nogroup \
>  	-Didn=true \
>  	-Dnss-systemd=true \
>  	-Dportabled=false
> diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
> index 76346b35f2..6822a277bf 100644
> --- a/system/skeleton/etc/group
> +++ b/system/skeleton/etc/group
> @@ -23,4 +23,4 @@ staff:x:50:
>  lock:x:54:
>  netdev:x:82:
>  users:x:100:
> -nogroup:x:65534:
> +nobody:x:65534:
> -- 
> 2.27.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
