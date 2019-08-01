From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Aug 2019 09:43:45 +0200
Subject: [Buildroot] btrfs filesystem image creation using TARGET_DIR
 path
In-Reply-To: <CAP8JTaY_9cS7vTMK_hxJsn2USEuKVZnNjj-s1bXP8fkXbipLMA@mail.gmail.com>
References: <CAP8JTaaqcBbCdoJHm5=zi0dc4NtNaq2Y=krx0UbCVz4PdB2sJw@mail.gmail.com>
 <20190731144516.06e94517@windsurf>
 <CAP8JTaY_9cS7vTMK_hxJsn2USEuKVZnNjj-s1bXP8fkXbipLMA@mail.gmail.com>
Message-ID: <20190801094345.11611680@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 1 Aug 2019 12:19:49 +0530
chalil jitesh <chaliljitesh@gmail.com> wrote:

> Thanks for reviewing and providing the information.
> 
> The following is the issue i am facing when using the TARGET_DIR.
> Suppose we set any capabilities to the files in the BASE_TARGET_DIR
> (./target in the below example) during the buildroot compilation. Example
> if we set some capabilities to the tool ping in BASE_TARGET_DIR as in
> example below.
> example : setcap cap_net_raw=ei ./target/bin/ping
> If we use BASE_TARGET_DIR with the -r option in buildroot/fs/btrfs/btrfs.mk
> (buildroot/fs/btrfs/btrfs.mk : -r '$(BASE_TARGET_DIR)')
> After the rootfs.btrfs image is generated from buildroot, if we mount the
> btrfs file sytem and check the capability of the file ping, the capability
> is getting retained in the btrfs file system generated as in example below
> (if BASE_TARGET_DIR  is used btrfs.mk).
> [root at localhost images]# mkdir test
> [root at localhost images]# mount -t btrfs ./rootfs.btrfs test
> [root at localhost images]# getcap ./test/bin/ping
> ./test/bin/ping = cap_net_raw+ei
> [root at localhost images]#

The correct way to assign capabilities is to use the <pkg>_PERMISSIONS
variable, which allows to define extended attributes for any file
installed by a package.

You might want to have a look at the current discussion in the
following patches:

  http://patchwork.ozlabs.org/patch/1140027/
  http://patchwork.ozlabs.org/patch/1140026/

Especially the second patch is very relevant, because it's precisely
taking care of setting the right capabilities for ping.

Also, from the above, it seems like you are doing your Buildroot build
as root, which is really not recommended. We strongly recommend to do
Buildroot builds as a normal user.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
