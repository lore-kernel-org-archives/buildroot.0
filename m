From: kaneda at chez.com <kaneda@chez.com>
Date: Sun, 06 May 2018 00:39:04 +0200
Subject: [Buildroot] Fighting with suid bit
In-Reply-To: <87bmdvwmy9.fsf@dell.be.48ers.dk>
References: <ffeaf5280e229a536de5f81fba84c99b@chez.com>
 <c41fae3e-3307-d3aa-8572-e65028237408@mind.be>
 <94873ecfb7c2d71d61d4ce5d76fd3cfb@chez.com>
 <87bmdvwmy9.fsf@dell.be.48ers.dk>
Message-ID: <01bcd0bb46db1d23d1ff9e66371da64c@chez.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Shame on me !
You make me check my buildroot version and, unfortunatly, I was using an 
old buildroot git commit.

I so switched to 2018.02.x branch.
Some hours later (distclean power), I can confirm suid bit is no longer 
lost on cpio archive.

Thanks for your help


Le 2018-05-04 15:49, Peter Korsgaard a ?crit?:
>>>>>> "kaneda" == kaneda  <kaneda@chez.com> writes:
> 
>  > Hi,
>  > It seems you got something here....
> 
> 
>  > /target
>  > - ucon64 is 4755
>  > - udevadm is 4755
> 
> 
>  > rootfs.tar.gz
>  > - ucon64 is 4755
>  > - udevadm is 4755
> 
> 
>  > rootfs.cpio
>  > - ucon64 is 0755
>  > - udevadm is 0755
> 
> 
>  > As you can see, it's not only my own file, but also udevadm
> 
> What buildroot version are you on? I just did a quick test on 2018.02.x
> with the following config:
> 
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_IPUTILS=y
> BR2_TARGET_ROOTFS_CPIO=y
> 
> (the iputils package has a few setuid binaries):
> 
> tar -tvf rootfs.tar | grep ping
> -rwsr-xr-x 0/0           43264 2018-05-04 15:35 ./bin/ping
> -rwxr-xr-x 0/0           12108 2018-05-04 15:35 ./sbin/arping
> 
> cpio -ivt < rootfs.cpio | grep ping
> -rwxr-xr-x   1 root     root        12108 May  4 15:35 sbin/arping
> -rwsr-xr-x   1 root     root        43264 May  4 15:35 bin/ping
> 
> So that looks sensible.
> 
> I also tried it on current master with the same results:
> 
> tar -tvf rootfs.tar | grep ping
> -rwsr-xr-x 0/0           43264 2018-05-04 15:44 ./bin/ping
> -rwxr-xr-x 0/0           12108 2018-05-04 15:44 ./sbin/arping
> 
> cpio -ivt < rootfs.cpio | grep ping
> -rwxr-xr-x   1 root     root        12108 May  4 15:44 sbin/arping
> -rwsr-xr-x   1 root     root        43264 May  4 15:44 bin/ping
> 
> --
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
