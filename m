From: Willy Lambert <lambert.willy@gmail.com>
Date: Wed, 30 Jan 2013 03:21:39 +0100
Subject: [Buildroot] making a second small failsafe file system
In-Reply-To: <1359509586.7974.207.camel@genx>
References: <1359509586.7974.207.camel@genx>
Message-ID: <CAKvQZ_3JP9aDgDPPacY7_hP7upmGU9bQBzJ6yrGevmvD0QL6MQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/1/30 John Stile <john@stilen.com>:
> I have a board with 8Mb of NOR and 256Mb of NAND.
>
> I plan to normally use NAND, divided into redundant halves, but if
> neither half can boot, I would like a failsafe minimal file system on
> NOR in order to re-image NAND over the network.
>
> What are my options?
>
> Do I maintain a separate buildroot just for that failsafe?
>
> Should I create a post-build script that assembles a tiny file system
> image?
>
> Has anyone tired this?

I'm doing something quite similar.

You have to maintain 2 sets of configurations, You should save all
your config files in :
_ config folder for buildroot .config file
_ board/${your_entity}/operationnal board/${your_entity}/recovery for
other files (such as linux kernel configs, files to add, post_install
script to execute,...)

Then the best is to do 2 outofsource (in the sense of buildroot)
builds so you can have both in parallel during developpemnt.

As your device has 2 separate memories, you will have to keep those 2
operating systems separatly. The way you will install rootfs (img
file, dumping rootfs.ext2,nfs boot) is really depending on your
application. If you plan to create an img file (that you may
partition, prepare MBR,...) you will need to do it after everything is
done in BR (so it is not part of the post install script);


>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
