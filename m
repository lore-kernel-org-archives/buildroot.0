From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Feb 2015 07:20:39 +0100
Subject: [Buildroot] BR2_ROOTFS_POST_IMAGE_SCRIPT fdisk anomaly
In-Reply-To: <CAEbDrgmWrn8Jf4VYgk0RtVBMgUf2DehNx3BS63Bqfte2+OhLrg@mail.gmail.com>
References: <CAEbDrgmWrn8Jf4VYgk0RtVBMgUf2DehNx3BS63Bqfte2+OhLrg@mail.gmail.com>
Message-ID: <20150215072039.7cb3353c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gregory Dymarek,

On Sat, 14 Feb 2015 22:37:04 +0000, Gregory Dymarek wrote:


> When executed manually the created partition is:
> 
>         Device Boot      Start         End      Blocks   Id  System
> 
> image.img1            2048       32048       15000+  83  Linux
> 
> When executed though the hook it reports:
> 
>     Device Boot      Start         End      Blocks   Id  System
> 
> image.img1            2048       32767       15360   83  Linux
> 
> Where is the difference coming from?

Most likely from a geometry difference.

I *guess* when you're using your post-image script in Buildroot, you're
using a fdisk built by Buildroot in output/host/usr/bin because we pass
this directory in the PATH when running post-image script. And when
you're running your command directly in the shell, you're using your
system fdisk.

And they make different decisions about the geometry of the device.

If you want to have exactly the same image, make sure to explicitly
pass the geometry. Maybe you should have a look at sfdisk which easily
allows to specify the geometry through command line option, and is also
easier than fdisk to automate the creation of partitions since you have
to pass only one line per partition.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
