From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Jul 2017 10:11:04 +0200
Subject: [Buildroot] [PATCH] support/tests: allow properly indented
 config fragment
In-Reply-To: <20170716091807.7ce7e5c5@windsurf>
References: <20170715224949.25598-1-yann.morin.1998@free.fr>
 <20170716091807.7ce7e5c5@windsurf>
Message-ID: <20170716081104.GA30047@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-07-16 09:18 +0200, Thomas Petazzoni spake thusly:
> On Sun, 16 Jul 2017 00:49:49 +0200, Yann E. MORIN wrote:
> > Currently, defining a config fragment in the runtime test infra requires
> > that the fragment not to be indented. This is beark, and causes grievance
> > when looking at the code (e.g. to fix it).
> > 
> > Just strip out all leading spaces/tabs when writing the configuration
> > lines into the config file.
> 
> Seems good in principle, but could you give an example of an indented
> config fragment you intend to use?

Sure. Here's a diff against master, for example:

    diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
    index b205b6a55a..9fad28f834 100644
    --- a/support/testing/tests/fs/test_squashfs.py
    +++ b/support/testing/tests/fs/test_squashfs.py
    @@ -5,12 +5,12 @@ import infra.basetest
     
     class TestSquashfs(infra.basetest.BRTest):
         config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
    -"""
    -BR2_TARGET_ROOTFS_SQUASHFS=y
    -# BR2_TARGET_ROOTFS_SQUASHFS4_GZIP is not set
    -BR2_TARGET_ROOTFS_SQUASHFS4_LZ4=y
    -# BR2_TARGET_ROOTFS_TAR is not set
    -"""
    +        """
    +        BR2_TARGET_ROOTFS_SQUASHFS=y
    +        # BR2_TARGET_ROOTFS_SQUASHFS4_GZIP is not set
    +        BR2_TARGET_ROOTFS_SQUASHFS4_LZ4=y
    +        # BR2_TARGET_ROOTFS_TAR is not set
    +        """
     
         def test_run(self):
             unsquashfs_cmd = ["host/bin/unsquashfs", "-s", "images/rootfs.squashfs"]

And here is a big file which is easier to read with indented config
fragments:
    https://git.buildroot.org/~ymorin/git/buildroot/tree/support/testing/tests/init/test_systemd.py?h=yem/systemd-skeleton-2

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
