From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 10 Nov 2018 18:07:08 +0100
Subject: [Buildroot] [PATCH 1/3] fs: apply permissions late
In-Reply-To: <87bm6z89dp.fsf@dell.be.48ers.dk>
References: <cover.1540626349.git.yann.morin.1998@free.fr>
 <4f9a31b0fb8f87ded9c788cb92d727b6763859ac.1540626349.git.yann.morin.1998@free.fr>
 <87bm6z89dp.fsf@dell.be.48ers.dk>
Message-ID: <20181110170708.GD2445@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-11-08 23:58 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > The combination of fakeroot, tar, and capabilities is broken, because
>  > fakeroot currently badly handles capabilities, which are currently
>  > simply ignored.
> 
>  > As described in #11216, asking tar to explicitly store and restore
>  > capabilities ends up with a failling build, when tar actually tries to
>  > restore the capabilities. Adding support for capabilities to fakeroot
>  > (by adding host-libcap as dependency) does not fix the problem.
> 
>  > Capabilities are stored in the extended attribute security.capabilty.
>  > It turns out that tar does have special handling when extracting and
>  > restoring that extended attribute, and that fails miserably when running
>  > under fakeroot...
> 
> Hmm, playing a bit around with tar here (1.29, Debian) it looks like it
> doesn't actually extract the security.capability xattrs when --xattrs is
> used unless --xattrs-include='*.*' is used:
> 
> getcap /usr/bin/i3status
> /usr/bin/i3status = cap_net_admin+ep
> 
> sudo tar -cvvvf foo.tar /usr/bin/i3status

Sorry, but as discussed on IRC, your analysis is incorrect, because you
are really root, by mean of sudo. The issue manifests itself only under
fakeroot.

[...]
> I don't see where we are passing --xattrs-include.

We are not, and this is all the grief reported in BZ-11216.

> Are we sure this is a
> fakeroot issue after all?

So, here is a report of a bit more experimentations. 'master' is 6a5e9a7ac6.
The configuration is from support/testing/tests/core/test_file_capabilities.py
The tar that is used is the one from my system: tar (GNU tar) 1.29

    master
        no capability in rootfs

    master
    tar with --xattrs-include='*'
        no capability in rootfs

    master
    untar with --xattrs-include='*'
        no capability in rootfs

    master
    tar with --xattrs-include='*'
    untar with --xattrs-include='*'
        File [...]/usr/sbin/getcap has unrecognised filetype 0, ignoring
        /usr/sbin/getcap is missing from rootfs

    master
    fakeroot with libcap
        no capability in rootfs

    master
    fakeroot with libcap
    tar with --xattrs-include='*'
    untar with --xattrs-include='*'
        File [...]/usr/sbin/getcap has unrecognised filetype 0, ignoring
        /usr/sbin/getcap is missing from rootfs

To be noted: the rootfs in that config is a squashfs. mksquashfs simply
ignores the unknown filetype, so getcap is missing in the filesystem.
However, should one switch to using ext4 for the test, then mkfs.ext4
would choke on that unknown filetype, and error out, which we would
catch (same behaviour whether fakeroot is linked with libcap or not):

    Copying files into the device: __populate_fs: ignoring entry "getcap"
    getcap: File not found by ext2_lookup while looking up "getcap"
    mkfs.ext4: File not found by ext2_lookup while populating file system
    *** Maybe you need to increase the filesystem size (BR2_TARGET_ROOTFS_EXT2_SIZE)
    fs/ext2/ext2.mk:46: recipe for target '/home/ymorin/dev/buildroot/O/images/rootfs.ext2' failed
    make[1]: *** [/home/ymorin/dev/buildroot/O/images/rootfs.ext2] Error 1
    Makefile:23: recipe for target '_all' failed
    make: *** [_all] Error 2

Note that only the first three lines are messages from mkfs.ext4. It also
fails for ext2 and ext3, btw, and possibly some other filesystems.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
