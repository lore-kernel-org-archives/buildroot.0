From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Thu, 25 Jan 2007 09:46:52 +0100
Subject: [Buildroot] [PATCH] Select MTD before EXT2/CRAMFS/SQUASHFS
	arebuilt
In-Reply-To: <02a001c74013$6ad21e60$01c4af0a@atmel.com>
References: <20070124225753.GD28221@aon.at>
	<02a001c74013$6ad21e60$01c4af0a@atmel.com>
Message-ID: <20070125084652.GA15747@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jan 25, 2007 at 12:51:12AM +0100, Ulf Samuelsson wrote:
>>>>Nak.  There are a great many situations where people use ext2
>>>>and/or cramfs and/or squashfs without wanting to also use MTD...
>>>>I happen to use all of them without wanting MTD at various times.
>>>>
>>>>-Erik
>>>
>>>Hmm,
>>>
>>>The intention is, that if ext2/squashfs/cramfs etc is selected,
>>>you ensure you build the  MTD utilities for the *host*.
>>
>>What specific failure do you see?
>>
>
>There are no mkfs.jffs2 application on the host, so it fails.

How does an eventual missing mkfs.jffs2 inhibit the generation of an
ext2 image?
Can you paste the error you were getting?

>>>$ mkfs.ext2 etc.
>>>
>>>Not that you put the MTD utilities into the root file system.
>>>How do I do what I intended then?
>>>(I hope building the host tools is not inconvenient).
>>
>>I do not want to download nor build a package that i do not need..
>
>How can you create an ext2/cramfs/squashfs if you have no
>application on your host that takes a directory and generates the fs????

See above. Perhaps you ment to select e2fsprogs for the ext2 filesystem
iff the host doesn't have an mkfs2? But then we seem to use genext2fs so
there is no need for an mkfs.ext2 installed on the host that i can see.

genext2fs should live in the TOOL_BUILD_DIR and not in the BUILD_DIR,
btw.

The BR2_TARGET_ROOTFS_JFFS2 already builds an host-mtd automatically, so
again this works (i did try this sometimes ago, it does work indeed).
$ grep  _MTD target/jffs2/Config.in -B2
        bool "jffs2 root filesystem"
        default n
        select BR2_PACKAGE_MTD
$ grep -e mtd-host$ target/jffs2/jffs2root.mk 
$(JFFS2_TARGET): host-fakeroot makedevs mtd-host

Again, paste the error you were seeing, please.
