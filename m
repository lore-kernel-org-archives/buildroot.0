From: Rafael A Barrero <rafa@linux.it>
Date: Thu, 7 Dec 2006 19:55:50 -0800
Subject: [Buildroot] udev make errors
In-Reply-To: <3662182B-2B05-4C74-94FC-15AA4864BCB9@linux.it>
References: <3662182B-2B05-4C74-94FC-15AA4864BCB9@linux.it>
Message-ID: <C6F82487-A777-4606-9447-B6AEDDEA1F00@linux.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi;

Here's what I've been able to come up with:

If you take a look at the make log I have below, you'll see the  
following line:

 > mkdir /root/src/buildroot/build_i686/root/udev/rules.d

This however, fails because the parent directory /root/src/buildroot/ 
build_i686/root/udev/ does not exist before the child directory is  
created (/root/src/buildroot/build_i686/root/udev/rules.d). A  
solution the process is to use"mkdir -p" will solve this, or simply  
creating both parent and the child directories sequentially.

So, if you can get past that one...possibly by helping make out and  
creating the directory yourself, most of 'udev-100' is installed but  
then fails here:

...
make[1]: Leaving directory `/root/src/buildroot/build_i686/udev-100'
/usr/bin/install -m 0755 -D package/udev/init-udev
/root/src/buildroot/build_i686/root/etc/init.d/S10udev
/usr/bin/install -m 0644 -D package/udev/udev.conf
/root/src/buildroot/build_i686/root/etc/udev
/usr/bin/install: cannot stat `package/udev/udev.conf': No such file or
directory
make: *** [/root/src/buildroot/build_i686/root/sbin/udev] Error 1
[root at host buildroot]#

By reading this the error seems obvious to me... although someone  
help me out here - are we missing 'udev.conf' in buildroot? Can  
someone please import this file into CVS?

Thanks,

PS - The udev README says: "kernel 2.6.15 is required for reliable  
operation". Keyword being "reliable".

Rafael.


On Dec 7, 2006, at 2:03 PM, Rafael A Barrero wrote:

> Hi;
>
> I'm having problems going through the install of udev-100. After it
> builds properly, I get these errors:
>
> // BEGIN FILE //
> ....
>    LD       udevmonitor
>    CC       udevinfo.o
>    LD       udevinfo
>    CC       udevtest.o
>    LD       udevtest
>    CC       udevstart.o
>    LD       udevstart
> make[1]: Leaving directory `/root/src/buildroot/build_i686/udev-100'
> touch -c /root/src/buildroot/build_i686/udev-100/udev
> mkdir /root/src/buildroot/build_i686/root/sys
> mkdir /root/src/buildroot/build_i686/root/etc/udev/rules.d
> mkdir: cannot create directory `/root/src/buildroot/build_i686/root/
> etc/udev/rules.d': No such file or directory
> make: [/root/src/buildroot/build_i686/root/sbin/udev] Error 1  
> (ignored)
> /usr/bin/install -D -m 0644 /root/src/buildroot/build_i686/udev-100/
> etc/udev/frugalware/* \
>                  /root/src/buildroot/build_i686/root/etc/udev/rules.d
> /usr/bin/install: target `/root/src/buildroot/build_i686/root/etc/
> udev/rules.d'
> is not a directory
> make: *** [/root/src/buildroot/build_i686/root/sbin/udev] Error 1
> [root at host buildroot]#
> // END OF FILE //
>
> Thanks,
>
> Rafael.
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
