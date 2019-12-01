From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 1 Dec 2019 15:07:45 +0100
Subject: [Buildroot] [PATCH] package/postgresql: fix filesystem naming
 consistency
In-Reply-To: <3057858685-24792@mail.unilogic.nl>
References: <3057858685-24792@mail.unilogic.nl>
Message-ID: <b34b7020-ad95-4a3d-f9dc-25547198007f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/11/2019 09:32, Pascal de Bruijn wrote:
> From:   Peter Seiderer <ps.report@gmx.net> 
[snip]
>> -if [ ! -f /var/lib/pgsql/PG_VERSION ]; then 
>> +if [ ! -f /var/lib/postgresql/PG_VERSION ]; then 
>> ? ? ? echo "Initializing postgresql data base..." 
>> - ? ? su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/pgsql' 
>> + ? ? su - postgres -c '/usr/bin/pg_ctl initdb -D /var/lib/postgresql' 
>  
> -1 for this change as /var/lib/pgsql is the suggested/common default location, see e.g. [1], 
> and is saving 5 characters at many location from the script ;-) 

 More important than whether it is suggested by upstream, though: changing it
now breaks existing installations. Indeed, anyone who has installed a system
with existing current buildroot will have the databases in /var/ib/pgsql. After
this change, upgrading the system to newer buildroot will result in the
databases no longer being found and instead new databases are created...

 So, at least a "legacy" symlink pgsql->postgresql must be created. But even
that is a bit iffy, because it's likely that the databases are not directly in
the readonly rootfs, but symlinked to a (writeable) data partition. So the
symlink must be created at runtime. But even then, you can't know if the user
put the whole of /var/lib on the writeable partition, or just /var/lib/pgsql...


> This comes down to:
> Do you want to stick with an upstream recommendation even if it's ill considered...
> Given this is a trivially avoided inconsistency.

 It was trivially avoidable 5 years ago. Now, it is no longer trivial.


> The whole point of having consistent naming between service and related directories is that you don't even have to look in the documentation where things are.
> 
> 
> 
> On a sidenote, PostgreSQL does look for /etc/postgresql/postgresql.conf  regardless and not /etc/pgsql/pgsql.conf, so it's a bit of mess really...

 If these are the only reasons for changing the name, then I don't think it's
worth the bother of breaking existing systems.

 Regards,
 Arnout

> 
> 
> As far as I can tell Debian choose to fix this, and RedHat seems to have stuck with the upstream inconsistency as well.
> 
> 
> So ultimately it's a bit of philosophical choice...
> 
> 
> 
> Regards,
> Pascal de Bruijn
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
