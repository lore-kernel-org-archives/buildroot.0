From: Marc Murphy <marcmltd@marcm.co.uk>
Date: Mon, 9 Oct 2017 21:01:41 +0000
Subject: [Buildroot] Successfully creating a new user
Message-ID: <8AE4BE7D9622DF41B76E1AD887AA1A477BB1C23D@MARCM-SBS2011.marcmltd.local>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
Currently using buildroot-2017.02 and trying to add a user.

I have been reading through the documentation about adding new users to my image and declared the path to the users file using BR2_ROOTFS_USERS_TABLES, this points to a file new_users in my board/boardname folder.

To test I used the defined example user:
test 8000 wheel -1 = - /bin/sh - Test user

This has been placed in the new_users file.  All seems good when I make.

If I go and examine the passwd file in etc it looks as though buildroot has tried to add the user but output is strange:
root:x:0:0:root:/root:/bin/sh
daemon:x:1:1:daemon:/usr/sbin:/bin/false
bin:x:2:2:bin:/bin:/bin/false
sys:x:3:3:sys:/dev:/bin/false
sync:x:4:100:sync:/bin:/bin/sync
mail:x:8:8:mail:/var/spool/mail:/bin/false
www-data:x:33:33:www-data:/var/www:/bin/false
operator:x:37:37:Operator:/var:/bin/false
nobody:x:65534:65534:nobody:/home:/bin/false
:/:/bin/sh0:10:Test user
dbus:x:1000:1000:DBus messagebus user:/var/run/dbus:/bin/false
sshd:x:1001:1002:SSH drop priv user:/:/bin/false
postgres:x:1002:1003:PostgreSQL Server:/var/lib/pgsql:/bin/sh

Further inspection with good old vi shows there is a control character in there....
root:x:0:0:root:/root:/bin/sh
daemon:x:1:1:daemon:/usr/sbin:/bin/false
bin:x:2:2:bin:/bin:/bin/false
sys:x:3:3:sys:/dev:/bin/false
sync:x:4:100:sync:/bin:/bin/sync
mail:x:8:8:mail:/var/spool/mail:/bin/false
www-data:x:33:33:www-data:/var/www:/bin/false
operator:x:37:37:Operator:/var:/bin/false
nobody:x:65534:65534:nobody:/home:/bin/false
test:x:8000:10:Test user^M:/:/bin/sh
dbus:x:1000:1000:DBus messagebus user:/var/run/dbus:/bin/false
sshd:x:1001:1002:SSH drop priv user:/:/bin/false
postgres:x:1002:1003:PostgreSQL Server:/var/lib/pgsql:/bin/sh

What is generating the ^M ??
Even if I edit passwd and remove the ^M I can't log in.

There must be something I am missing.  Any pointers please ?

Thanks
Marc
