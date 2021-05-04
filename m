From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 May 2021 21:43:06 +0200
Subject: [Buildroot] sudo: error while loading shared libraries
In-Reply-To: <AM0PR06MB5923A441CD0C1EF1952FC031C05A9@AM0PR06MB5923.eurprd06.prod.outlook.com>
References: <AM0PR06MB5923A441CD0C1EF1952FC031C05A9@AM0PR06MB5923.eurprd06.prod.outlook.com>
Message-ID: <20210504214306.378dbbaf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Uwe,

On Tue, 4 May 2021 11:18:59 +0000
Uwe Fechner <uwe.fechner@nl.abb.com> wrote:

> Hello,
> 
> we are using buildroot on i.mx6 since a long time.
> 
> Since yesterday I get the following error with the sudo package:
> 
> sudo dmesg
> sudo: error while loading shared libraries: libsudo_util.so.0: cannot open shared object file: No such file or directory
> 
> We are using sudo-1.9.5p2 .
> 
> The library exists and the permissions seem to be correct:
> 
> 
> ls -la /usr/libexec/sudo

Based on the error message, it seems like the library is not dlopen()ed
but directly linked into sudo. Hwoever, /usr/libexec/sudo is not in the
default search path for libraries, and therefore unless the sudo binary
has a RPATH/RUNPATH pointing to /usr/libexec/sudo, I believe what
you're seeing is expected.

To verify this, you can try:

LD_LIBRARY_PATH=/usr/libexec/sudo sudo dmesg

Really, I think libsudo_util.so has no business in /usr/libexec/sudo,
it should be in /usr/lib. Based on the names of the other .so files,
they look like dlopen()ed libraries, which can stay in
/usr/libexec/sudo.

> total 588
> drwxr-xr-x  2 root root   4096 May  3 19:31 .
> drwxr-xr-x 11 root root   4096 May  3 19:31 ..
> -rw-r--r--  1 root root  17716 May  3 19:31 audit_json.so
> -rw-r--r--  1 root root   9380 May  3 19:31 group_file.so
> lrwxrwxrwx  1 root root     21 May  3 19:31 libsudo_util.so -> libsudo_util.so.0.0.0
> lrwxrwxrwx  1 root root     21 May  3 19:31 libsudo_util.so.0 -> libsudo_util.so.0.0.0
> -rwxr-xr-x  1 root root 112412 May  3 19:31 libsudo_util.so.0.0.0
> -rw-r--r--  1 root root   5284 May  3 19:31 sample_approval.so
> -rw-r--r--  1 root root 420184 May  3 19:31 sudoers.so
> -rw-r--r--  1 root root   5260 May  3 19:31 sudo_noexec.so
> -rw-r--r--  1 root root   5276 May  3 19:31 system_group.so
> 
> Any idea?

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
