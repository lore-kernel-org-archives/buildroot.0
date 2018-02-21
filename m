From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 21 Feb 2018 23:13:18 +0100
Subject: [Buildroot] BUG: systemd/dbus broken in -rc1
In-Reply-To: <20180221172202.uqpupaoy5bp65reu@sapphire.tkos.co.il>
References: <c2b37eb8-10f7-f27c-6175-6b3f08e937be@smile.fr>
 <20180221172202.uqpupaoy5bp65reu@sapphire.tkos.co.il>
Message-ID: <e5ed15f4-8d4e-a9dc-fb2c-40ce9f4109a7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 21/02/2018 ? 18:22, Baruch Siach a ?crit?:
> Hi J?r?my,
> 
> On Wed, Feb 21, 2018 at 01:42:32PM +0100, J?r?my Rosen wrote:
>> I have a systemd course where I use a minimal buildroot system as my
>> exercise machine.
>> It is a very minimal configuration based on 86_64+systemd+not much else.
>>
>> since the update of systemd to v237 there has been various problems related
>> to the
>> connexion between systemd and dbus. The easiest way to test is to run
>> "busctl" on
>> the system. It won't work complaining about "no such file or directory"
>>
>> This bug affects more or less all systemd-provided utilities, including
>> logind and systemd
>> itself.
>>
>> After investigating, the problem is that systemd looks for the dbus socket
>> in /run/dbus instead of
>> /var/run/dbus which is not where dbus puts the socket.
>>
>> However, systemd mandates that /run be a symlink to /var/run. The file
>> /usr/lib/tmpfiles.d/var.con
>> will create automatically that symlink at bootup. So in theory, looking at
>> the socket in /run should
>> work too.
>>
>> However, there is a second stacked bug. dbus creates, at install time, the
>> directory /var/run/dbus.
>> This breaks tmpfile.d which will not create the symlink since the directory
>> already exists.
>> Creating a file in /var/run makes no sense in the first place since that
>> directory is a tmpfs and will
>> be emptied at reboot time
>>
>> Now, I am not sure what to do from here on the buildroot side. I think it
>> could be usefull to have
>> some sort of security to check that /var/run doesn't exist and yell loudly
>> if it does, but I don't know
>> how to implement that
>>
>> An other approch would be for the systemd skeleton to create /var/run as a
>> symlink to ../run
>> (not /run) in order to let stuff be installed. The tmpfs mount at boot time
>> would hide the content,
>> but it should work
>>
>> To sum it up :
>> * systemd should look for the socket in /var/run :
>> https://github.com/systemd/systemd/issues/8197
>> * dbus should not create the /run/dbus directory in the first place : bug to
>> be opened
>> * buildroot needs to make sure /var/run is not created or is a correct
>> symlink.
>>
>> I'd gladly take advice on what to do to move forward on that issue...
> 
> The patch of Jan Kundr?t at http://patchwork.ozlabs.org/patch/870834/ might 
> solve your last issue. Not sure about the rest.

This patch doesn't solve J?r?my's issue since it only for the rootfs RO case.

define SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW
 	echo "/dev/root / auto rw 0 1" >$(TARGET_DIR)/etc/fstab
 	mkdir -p $(TARGET_DIR)/var
+	ln -s ../run $(TARGET_DIR)/var/run
 endef

Adding a symlink for the read-write case allow to make systemd work with dbus
but we have /run/dbud in the target directory (which will be hidden by the tmpfs
mount).

Romain

> 
> baruch
> 
