From: Patrick Fischer <pf@stollmann.de>
Date: Fri, 20 Mar 2009 13:35:32 +0100
Subject: [Buildroot] how to find ununsed libs
In-Reply-To: <20090320084220.17551.qmail@bux.stollmann.net>
References: <20090320084220.17551.qmail@bux.stollmann.net>
Message-ID: <20090320123533.27816.qmail@bux.stollmann.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I found my mistake.
I don't follow symlinks.
libc.so.0 -> libuClibc-0.9.28.so

I also can't find out if a lib will loaded dynamic on runtime.
for example iptables  will load some libs only if they are needed.

It is an ugly way but it works for me.

I also link some libs static if they are only used once.

Now my Image is 700k smaller

Best regards
Patrick





Patrick Fischer schrieb:
> Hello
>
> I wrote a small script to check which libs are needed on the target.
> So i found that libstdc++.so.5.0.7 is installed but not needed by any 
> prog.
> (this is not about why this is in the target, I'm using a very old 
> version of buildroot)
>
> But my script told me that i don't need a lot of libs like
> libuClibc-0.9.28.so
> (ld-uClibc-0.9.28.so is needed)
>
> I think this is a bug in my script.
> Can anybody check my script if it works fine?
>
>
> #!/bin/sh
>
> LIBSNEEDED=needed_libs
> LIBSFOUND=fount_libs
> LDD=mipsel-linux-ldd
> ROOTFS=build_mipsel/root/
>
> find $ROOTFS -type f -exec $LDD  {} 2>/dev/null  \; | grep -v "not a 
> dynamic executable" | cut -d"=" -f1 | tr -d "\t" | sort -n > $LIBSNEEDED
> find $ROOTFS -name "*so*" -type f  -exec ls -l {} \;| cut -d " " -f 
> 5,9 | sort -n -r > $LIBSFOUND
>
> cat $LIBSFOUND | while read size lib
> do
>        #example build_mipsel/root/lib/libresolv-0.9.28.so -> libresolv
>        if grep `basename $lib | cut -d"-" -f1 | cut -d"." -f1` 
> $LIBSNEEDED > /dev/null;
>        then
>                echo $lib is needed
>        else
>                echo $lib not needed, you can save $size bytes
>        fi
> done
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>


-- 
Patrick Fischer

Software Developer
Phone: +49 40 890 88-443
Email: pf at stollmann.de

-------------------------------------------------------------
http://www.stollmann.de
Tel: +49 40 890 88-0
Fax: +49 40 890 88 444
Stollmann E+V GmbH, Mendelssohnstr. 15D, D-22761 Hamburg,
HRB Hamburg 55634, VAT-ID DE 811 675 541
GF: Peter Herrmann, Christian L?hrs
mailto:pf at stollmann.de
-------------------------------------------------------------
