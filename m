From: Waldemar Brodkorb <wbx@openadk.org>
Date: Thu, 16 Apr 2015 21:55:25 +0200
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <5527BF02.6060304@zacarias.com.ar>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
 <XnsA4777FCDAF5A6berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <55265956.3020607@zacarias.com.ar>
 <20150409202054.GD27057@waldemar-brodkorb.de>
 <5527BF02.6060304@zacarias.com.ar>
Message-ID: <20150416195525.GK27057@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Gustavo Zacarias wrote,

> On 04/09/2015 05:20 PM, Waldemar Brodkorb wrote:
> 
> > uClibc-ng has $ORIGIN support. Can you test it with samba4?
> 
> Yes, and it fails to work, snip:
> 
> -----
> # /etc/init.d/S91smb start
> Starting SMB services: /usr/sbin/smbd: can't load library 'libtalloc.so.2'
> FAIL
> Starting NMB services: /usr/sbin/nmbd: can't load library 'libtalloc.so.2'
> FAIL
> # ls -l /lib/*uClibc*
> -rwxr-xr-x    1 root     root         25304 Apr  9  2015
> /lib/ld-uClibc-1.0.1.so
> lrwxrwxrwx    1 root     root            14 Apr  9  2015
> /lib/ld-uClibc.so.0 -> ld-uClibc.so.1
> lrwxrwxrwx    1 root     root            18 Apr  9  2015
> /lib/ld-uClibc.so.1 -> ld-uClibc-1.0.1.so
> -rwxr-xr-x    1 root     root        367544 Apr  9  2015
> /lib/libuClibc-1.0.1.so
> # ls -l /usr/lib/samba/libtalloc*
> lrwxrwxrwx    1 root     root            18 Apr  9  2015
> /usr/lib/samba/libtalloc.so.2 -> libtalloc.so.2.1.1
> -rwxr-xr-x    1 root     root         19396 Apr  9  2015
> /usr/lib/samba/libtalloc.so.2.1.1
> -----
> 
> On the build machine:
> $ readelf -d ?mbd|grep RPATH
>  0x0000000f (RPATH)                      Library rpath: [/usr/lib/samba]
>  0x0000000f (RPATH)                      Library rpath: [/usr/lib/samba]
> 
> So, it's not up to it yet.

It is not a missing or broken $ORIGIN support. As you posted, there
is no $ORIGIN used in RPATH.
I am really sure it is this commit and option which is solving the
runtime problem:
http://git.uclibc.org/uClibc/commit/?id=409f14d9b5e47513d5c939120a33965997c8ceb2

Will be part of uClibc-ng 1.0.2.

best regards
 Waldemar
