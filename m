From: Andreas Ehmanns <universeii@gmx.de>
Date: Wed, 13 Jan 2016 18:31:52 +0100
Subject: [Buildroot] [PATCH 1/1] openldap: add support to build the
	server
In-Reply-To: <20160112220927.25700e56@free-electrons.com>
References: <1450384879-5494-1-git-send-email-universeII@gmx.de>
 <20151229121950.30dfde8a@free-electrons.com> <569569E4.4010602@gmx.de>
 <20160112220927.25700e56@free-electrons.com>
Message-ID: <56968A08.8060902@gmx.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,
thanks for your comments. I will incorporate them, test it and send the 
patch in the next two days.

Regards,
Andreas

Am 12.01.2016 um 22:09 schrieb Thomas Petazzoni:
> Andreas,
>
> On Tue, 12 Jan 2016 22:02:28 +0100, Andreas Ehmanns wrote:
>
>> I reworked the patch and incorporated your findings. Please have a look
>> at my comments below and let me know what you think.
> Thanks! See below my comments.
>
>
>>> If you fix this, then the path to the pidfile (and argsfile) in
>>> slapd.conf are wrong, because they point to /var/run/, to which the
>>> ldap user has not write access.
>>>
>>> If you fix this again, when you start slapd, it complains:
>>>
>>> bdb_db_open: warning - no DB_CONFIG file found in
>>> directory /var/openldap-data: (2). Expect poor performance for suffix
>>> "dc=my-domain,dc=com".
>>>
>>> It should probably be fixed by using DB_CONFIG.example as DB_CONFIG
>>> in /var/openldap-data/.
>> My aim was to add the OpenLDAP server as provided by the package and
>> only make the changes necessary to allow the server to start up without
>> terminating.
>> slapd.conf is the default configuration provided by the package which is
>> a good starting point for people to setup their own configuration and
>> database. Of course everyone using the LDAP server has to make its own
>> configuration and database setup but this can't be provided or
>> preconfigured by buildroot.
> Right, but in general we try in Buildroot to provide a sane/minimal
> default configuration that "works" out of the box. It is a bit weird to
> have such a warning when the slapd daemon starts. But OK, it's not a
> very big issue either, we can always leave it as it is for now for this
> aspect.
>
>>> 	-p /var/run/slapd/slapd.pid
>> Slapd manages its own pid file. Why should start-stop-daemon create an
>> additional pid file
> start-stop-daemon will not create an additional pid file with just the
> -p option. Only if you pass the -m option in addition to -p. With -p,
> start-stop-daemon will only verify that the process has created the pid
> file. From the start-stop-daemon manpage:
>
>         -p, --pidfile pid-file
>                Check  whether  a  process  has created the file pid-file. Note:
>                using this matching option alone  might  cause  unintended  pro?
>                cesses  to  be  acted  on, if the old process terminated without
>                being able to remove the pid-file.
>
>         -m, --make-pidfile
>                Used  when  starting  a program that does not create its own pid
>                file. This option will make start-stop-daemon  create  the  file
>                referenced  with --pidfile and place the pid into it just before
>                executing the process. Note, the file will only be removed  when
>                stopping  the  program  if --remove-pidfile is used.  Note: This
>                feature may not work in all cases. Most notably when the program
>                being  executed forks from its main process. Because of this, it
>                is usually only  useful  when  combined  with  the  --background
>                option.
>
>>> Why do you pass -n ? And why do you use -a instead of -x ?
>> O.k., changed -a to -x
>> I thought that I need -n to be able to do a kill when shutting down the
>> server when NOT using pid file from start-stop-daemon. This was my
>> understanding from other init scripts. Am I wrong?
> If you specify -p, I think doing the name-based check with -n is useless.
>
>
>>>> +        killall -HUP $(basename ${DAEMON})
>>> I think it's better to use the pid file here, no?
>>>
>>> 	   kill -HUP $(cat /var/run/slapd/slapd.pid)
>> See comment above. Slapd is managing its own pid file.
> And? It doesn't prevent us from using it, right?
>
> Thanks!
>
> Thomas
