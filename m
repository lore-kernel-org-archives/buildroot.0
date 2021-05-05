From: Uwe Fechner <uwe.fechner@nl.abb.com>
Date: Wed, 5 May 2021 11:14:38 +0000
Subject: [Buildroot] sudo: error while loading shared libraries
In-Reply-To: <20210504214306.378dbbaf@windsurf>
References: <AM0PR06MB5923A441CD0C1EF1952FC031C05A9@AM0PR06MB5923.eurprd06.prod.outlook.com>,
 <20210504214306.378dbbaf@windsurf>
Message-ID: <AM0PR06MB5923BCE07863B47DBF9AAC02C0599@AM0PR06MB5923.eurprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

Thanks for looking into this issue, but your suggestion did not help:

$ LD_LIBRARY_PATH=/usr/libexec/sudo sudo dmesg
sudo: error while loading shared libraries: libsudo_util.so.0: cannot open shared object file: No such file or directory

Any other idea?

Uwe
________________________________
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Tuesday, May 4, 2021 9:43 PM
To: Uwe Fechner <uwe.fechner@nl.abb.com>
Cc: buildroot at busybox.net <buildroot@busybox.net>
Subject: Re: [Buildroot] sudo: error while loading shared libraries

This email originated from outside of your organization. Please do not click on links or open attachments unless you recognize the sender and know the content is safe.


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
https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.com%2F&amp;data=04%7C01%7Cuwe.fechner%40nl.abb.com%7Ce7e4cd3c187e43ca459c08d90f34d801%7C372ee9e09ce04033a64ac07073a91ecd%7C0%7C0%7C637557541905702900%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=xTDZlOO1mFKWSYRVNADflI0hh2%2F9CTbkVBOKIYIztHg%3D&amp;reserved=0
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210505/34ffd530/attachment.html>
