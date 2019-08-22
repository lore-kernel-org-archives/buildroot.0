From: chalil jitesh <chaliljitesh@gmail.com>
Date: Thu, 22 Aug 2019 19:00:46 +0530
Subject: [Buildroot] btrfs filesystem image creation using TARGET_DIR
 path
In-Reply-To: <20190801094345.11611680@windsurf.home>
References: <CAP8JTaaqcBbCdoJHm5=zi0dc4NtNaq2Y=krx0UbCVz4PdB2sJw@mail.gmail.com>
 <20190731144516.06e94517@windsurf>
 <CAP8JTaY_9cS7vTMK_hxJsn2USEuKVZnNjj-s1bXP8fkXbipLMA@mail.gmail.com>
 <20190801094345.11611680@windsurf.home>
Message-ID: <CAP8JTabtfuzkYbxZL99_Ocy9Q+zb-Ek-+F97r3a2+GBnpABG6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for reviewing the our steps and suggestions.
As per suggestion I tried to build as non-root user also but still the
issue is getting reproduced and capabilities are not getting retained
in the btrfs image generated.
In our project we are setting the permissions from corresponding
package makefile using the steps as suggested by you.
Also the capabilities set for a file are working when we build a
squashfs image from buildroot (BR2_TARGET_ROOTFS_SQUASHFS). (If we
unmount the squashfs image the capabilities set for a file are working
for the same target directory which we are using for testing btrfs)
But when we build the btrfs image from buildroot
(BR2_TARGET_ROOTFS_BTRFS) for the same target directory we are
observing this issue (If we unmount the btrfs image, the capabilities
set for the file are not present in the unmounted path).

For squashfs file system in buildroot/fs/squashfs/squashfs.mk file,
the target directory used seems to be BASE_TARGET_DIR.
$(HOST_DIR)/bin/mksquashfs $(BASE_TARGET_DIR) $@ $(ROOTFS_SQUASHFS_ARGS)

But for btrfs file system in buildroot/fs/btrfs/btrfs.mk file, the
target directory used seems to be TARGET_DIR .
BTRFS_OPTS = \
	-f \
	-r '$( TARGET_DIR)' \

Kindly please review our observations and please suggest why the
capabilities are not getting retained for btrfs(uses TARGET_DIR), but
capabilities are working for squashfs (uses BASE_TARGET_DIR) .

With Thanks and Regards
Jitesh

On 8/1/19, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Thu, 1 Aug 2019 12:19:49 +0530
> chalil jitesh <chaliljitesh@gmail.com> wrote:
>
>> Thanks for reviewing and providing the information.
>>
>> The following is the issue i am facing when using the TARGET_DIR.
>> Suppose we set any capabilities to the files in the BASE_TARGET_DIR
>> (./target in the below example) during the buildroot compilation. Example
>> if we set some capabilities to the tool ping in BASE_TARGET_DIR as in
>> example below.
>> example : setcap cap_net_raw=ei ./target/bin/ping
>> If we use BASE_TARGET_DIR with the -r option in
>> buildroot/fs/btrfs/btrfs.mk
>> (buildroot/fs/btrfs/btrfs.mk : -r '$(BASE_TARGET_DIR)')
>> After the rootfs.btrfs image is generated from buildroot, if we mount the
>> btrfs file sytem and check the capability of the file ping, the
>> capability
>> is getting retained in the btrfs file system generated as in example
>> below
>> (if BASE_TARGET_DIR  is used btrfs.mk).
>> [root at localhost images]# mkdir test
>> [root at localhost images]# mount -t btrfs ./rootfs.btrfs test
>> [root at localhost images]# getcap ./test/bin/ping
>> ./test/bin/ping = cap_net_raw+ei
>> [root at localhost images]#
>
> The correct way to assign capabilities is to use the <pkg>_PERMISSIONS
> variable, which allows to define extended attributes for any file
> installed by a package.
>
> You might want to have a look at the current discussion in the
> following patches:
>
>   http://patchwork.ozlabs.org/patch/1140027/
>   http://patchwork.ozlabs.org/patch/1140026/
>
> Especially the second patch is very relevant, because it's precisely
> taking care of setting the right capabilities for ping.
>
> Also, from the above, it seems like you are doing your Buildroot build
> as root, which is really not recommended. We strongly recommend to do
> Buildroot builds as a normal user.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
