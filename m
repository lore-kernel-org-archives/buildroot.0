From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 21 Oct 2014 14:25:57 -0300
Subject: [Buildroot] [PATCH] package/sysvinit: remove inline comment
 from root remount
In-Reply-To: <20141021171539.GA30778@free.fr>
References: <1413832724-15564-1-git-send-email-gustavo@zacarias.com.ar>
 <20141021171539.GA30778@free.fr>
Message-ID: <54469725.7030600@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/21/2014 02:15 PM, Yann E. MORIN wrote:

> Gustavo, All,
> 
> On 2014-10-20 16:18 -0300, Gustavo Zacarias spake thusly:
>> It breaks the root rw remount as explained in bug #7442.
>> Thanks to joymarquis at hotmail.com for pointing it out.
>>
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> 
> NAK, because that's what is used to decide whether to remount root RW or
> not (from system/system.mk ):
> 
>     ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
>     # Find commented line, if any, and remove leading '#'s
>     define SYSTEM_REMOUNT_RW
>         $(SED) '/^#.*# REMOUNT_ROOTFS_RW$$/s~^#\+~~' $(TARGET_DIR)/etc/inittab
>     endef
>     else
>     # Find uncommented line, if any, and add a leading '#'
>     define SYSTEM_REMOUNT_RW
>         $(SED) '/^[^#].*# REMOUNT_ROOTFS_RW$$/s~^~#~' $(TARGET_DIR)/etc/inittab
>     endef
>     endif
>     TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_RW
> 
> We must find another solution.

Searching for the comment isn't pretty, i'd just:

rwmo::sysinit:/bin/mount -o remount,rw / (sysvinit)
null::sysinit:/bin/mount -o remount,rw / (skeleton)

And nuke them when the root must be RO by searching for "mount -o
remount,rw /".

But really well done that should all move to an initscript at the S00
order that handles ALL of the filesystems at once in a predictable way
via /etc/fstab, there's no excuse.
Regards.
