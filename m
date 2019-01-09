From: Andreas Naumann <dev@andin.de>
Date: Wed, 9 Jan 2019 14:27:33 +0100
Subject: [Buildroot] [PATCH 1/2 v3] core: make symlinks relative when
 preparing the SDK
In-Reply-To: <CA+1k=2YqfmD2cYMHGTnFjW13A51Ki+2dMp96Y+9HGyo2z4qP+w@mail.gmail.com>
References: <cover.1545491919.git.yann.morin.1998@free.fr>
 <9f4825baa7a475b4d8f262925e1ff652b31cd6fb.1545491919.git.yann.morin.1998@free.fr>
 <20181226222135.4ef03363@windsurf>
 <CA+1k=2YqfmD2cYMHGTnFjW13A51Ki+2dMp96Y+9HGyo2z4qP+w@mail.gmail.com>
Message-ID: <5d63c254-1e80-bd9e-7ec1-b866fce178ab@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Am 05.01.19 um 01:53 schrieb Joel Carlson:
> On Wed, Dec 26, 2018 at 2:21 PM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello,
>>
>> On Sat, 22 Dec 2018 16:18:51 +0100, Yann E. MORIN wrote:
>>> The SDK is supposed to be relocatable, so symlinks must not be
>>> absolute.
>>>
>>> Add a new helper script, that replaces all absolute symlinks with
>>> relative ones.
>>
>> This script is really not trivial. This additional complexity raises a
>> simple question: how many packages install such absolute symlinks?
> 
> That was actually a good question.  I did a build where I turned on
> some 450+ random packages (estimated by counting the folders in build/
> other than host-* folders).  I encountered the following absolute
> links:
> iptables - 1 absolute symlink (sysroot/usr/bin/iptables-xml ->
> /usr/sbin/xtables-multi)
> ntfs-3g - 2 absolute symlinks (sysroot/sbin/mount.ntfs-3g ->
> /usr/bin/ntfs-3g  and  sysroot/sbin/mount.lowntfs-3g ->
> /usr/bin/lowntfs-3g)
> fontconfig - 16 absolute symlinks (sysroot/etc/fonts/conf.d/* ->
> /usr/share/fontconfig/conf.avail/*)
> And then not in my build, but pointed out by someone on a previous
> email thread, the eudev package produces 1 absolute symlink

I've been toying with this patch as well and among ~100 packages also 
found the absolute symlinks in iptables and eudev (only). Short of time 
and knowledge of how to suppress them being created I made two patches 
in the form:

+define EUDEV_REMOVE_BROKEN_SYMLINK
+	$(RM) $(STAGING_DIR)/sbin/udevadm
+endef
+
+EUDEV_POST_INSTALL_STAGING_HOOKS += EUDEV_REMOVE_BROKEN_SYMLINK
+

However, I don't propose this as a solution as I think a blacklist would 
concentrate the issue in one place rather than spreading exceptions all 
over the place.


regards,
Andreas
