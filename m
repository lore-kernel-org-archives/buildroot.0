From: dan robinson <dgrobinson@dgrobinson.com>
Date: Wed, 14 Dec 2011 11:07:54 -0800 (PST)
Subject: [Buildroot] root permissions issue (reformatted)
In-Reply-To: <32975350.post@talk.nabble.com>
References: <32975350.post@talk.nabble.com>
Message-ID: <32975352.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Okay, I think I have this figured out.  The NFS server is setting the file
owner's UID to 65534, which is the user 'nobody' on the server.  The NFS
client does not have root write permissions on the NFS server's filessytem.  

This came out of an investigation into why I couldn't log into a vanilla
buildroot built system.  Shadow passwords is on, but the root password in
the shadow file was blank.

--dan robinson

dan robinson wrote:
> 
> I have an NFS mounted root.  The directory, on the NFS server, does not
> have write permissions for 'other'.  I am not able to create a file when I
> run the command, 'touch one'.  On the NFS server side, I run 'chmod o+w'
> and that is shown in the second 'ls' command.  I can create a file.
> 
> If I 'su' to default, I can create files in that user's directory.
> 
> Note that the file, 'one', is owned by 65534.  I have included the
> /etc/passwd file.  This is -2 in 16 bits.  Noteworthy?
> 
> I ran the 'id' command.
> # id
> uid=0(root) gid=0(root) groups=0(root),10(wheel)
> 
> Ideas?
> 
> --dan robinson
> 
> 
> 
> # ls -al
> total 20
> drwxrwxr-x    2 root     root          4096 Dec 14  2011 .
> drwxr-xr-x   16 root     root          4096 Dec  7  2011 ..
> -rw-------    1 65534    65534          104 Dec 14  2011 .ash_history
> -rw-r--r--    1 root     root             0 Nov 30  2011 .bash_history
> -rw-r--r--    1 root     root           175 Nov 30  2011 .bash_logout
> -rw-r--r--    1 root     root           161 Nov 30  2011 .bash_profile
> # touch one
> touch: one: Permission denied
> 
> // chmod o+w has been run on NFS server
> # ls -al
> total 20
> drwxrwxrwx    2 root     root          4096 Dec 14  2011 .
> 
> drwxr-xr-x   16 root     root          4096 Dec  7  2011 ..
> -rw-------    1 65534    65534          121 Dec 14  2011 .ash_history
> -rw-r--r--    1 root     root             0 Nov 30  2011 .bash_history
> -rw-r--r--    1 root     root           175 Nov 30  2011 .bash_logout
> -rw-r--r--    1 root     root           161 Nov 30  2011 .bash_profile
> # touch one
> # ls -al
> total 20
> drwxrwxrwx    2 root     root          4096 Dec 14  2011 .
> drwxr-xr-x   16 root     root          4096 Dec  7  2011 ..
> -rw-------    1 65534    65534          138 Dec 14  2011 .ash_history
> -rw-r--r--    1 root     root             0 Nov 30  2011 .bash_history
> -rw-r--r--    1 root     root           175 Nov 30  2011 .bash_logout
> -rw-r--r--    1 root     root           161 Nov 30  2011 .bash_profile
> -rw-r--r--    1 65534    65534            0 Dec 14  2011 one
> 
> # cat /etc/passwd
> root::0:0:root:/root:/bin/sh
> daemon:x:1:1:daemon:/usr/sbin:/bin/sh
> bin:x:2:2:bin:/bin:/bin/sh
> sys:x:3:3:sys:/dev:/bin/sh
> sync:x:4:100:sync:/bin:/bin/sync
> mail:x:8:8:mail:/var/spool/mail:/bin/sh
> proxy:x:13:13:proxy:/bin:/bin/sh
> www-data:x:33:33:www-data:/var/www:/bin/sh
> backup:x:34:34:backup:/var/backups:/bin/sh
> operator:x:37:37:Operator:/var:/bin/sh
> haldaemon:x:68:68:hald:/:/bin/sh
> dbus:x:81:81:dbus:/var/run/dbus:/bin/sh
> ftp:x:83:83:ftp:/home/ftp:/bin/sh
> nobody:x:99:99:nobody:/home:/bin/sh
> sshd:x:103:99:Operator:/var:/bin/sh
> default:x:1000:1000:Default non-root user:/home/default:/bin/sh
> 
> 
> 

-- 
View this message in context: http://old.nabble.com/root-permissions-issue-%28reformatted%29-tp32975350p32975352.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
