From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 12 Mar 2013 14:34:39 +0100
Subject: [Buildroot] [RFC/PATCH] fs/common.mk: Fix wrong double dollar
	usage
In-Reply-To: <20130312124400.GA3443@localhost>
References: <1362863052-8781-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <CAAXf6LXzA2qSxq+5XRzRQUrXTHhTwYg2VA9GdTiNpPzkcNndxQ@mail.gmail.com>
 <20130312100611.GD2506@localhost>
 <CAAXf6LUevRWy7hgHh2rrL9BVq2A95W=MAh8wCd8cZCy_c0A_sg@mail.gmail.com>
 <20130312124400.GA3443@localhost>
Message-ID: <CAAXf6LX4-K5S-Q1R4StQNzA2iAUKhmtG9z6wHNdf9Do7jobucw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ezequiel,

On Tue, Mar 12, 2013 at 1:44 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> On Tue, Mar 12, 2013 at 12:28:15PM +0100, Thomas De Schampheleire wrote:
>> Hi Ezequiel,
>>
>> On Tue, Mar 12, 2013 at 11:06 AM, Ezequiel Garcia
>> <ezequiel.garcia@free-electrons.com> wrote:
>> > Hi Thomas,
>> >
>> > Thanks for your answer.
>> >
>> > On Tue, Mar 12, 2013 at 10:05:04AM +0100, Thomas De Schampheleire wrote:
>> >> Hi,
>> >>
>> >> On Sat, Mar 9, 2013 at 10:04 PM, Ezequiel Garcia
>> >> <ezequiel.garcia@free-electrons.com> wrote:
>> >> > Double dollar sign is used to put an explicit dollar sign,
>> >> > for instance, when writing a makefile rule.
>> >> >
>> >> > In this case, there are some makefile conditionals where
>> >> > makefile variables are evaluated using double dollar signs
>> >> > instead of single dollar, which is wrong.
>> >> >
>> >> > In particular, this fixes a buildroot 'make' stall
>> >> > when building with an empty device table (empty BR2_ROOTFS_DEVICE_TABLE).
>> >> >
>> >> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
>> >> > ---
>> >> > I'm sending this as RFC because I'm new to buildroot
>> >> > and because I'm not a makefile wizard.
>> >> > AFAIK, this fixes a real bug in my compilation,
>> >> > as explained in the commit message.
>> >>
>> >> In fact you are reverting changes made by Arnout a while back, see git
>> >> commit 847895d29524d81b64afb059b8649a77802a469b
>> >> http://git.buildroot.org/buildroot/commit/?id=847895d29524d81b64afb059b8649a77802a469b
>> >> There were specific reasons to make these changes, so I don't think we
>> >> should revert them like this.
>> >>
>> >> Be aware that these make targets are inside a 'define
>> >> ROOTFS_TARGET_INTERNAL' statement, and later in the file this
>> >> 'function' is executed with 'call'. This makes the rules for $ or $$ a
>> >> little different than in standard make recipes.
>> >
>> > Mmmm, I see. So it's not as easy as it seemed!
>> > However, please note I'm *only* fixing the conditionals,
>> > not the targets or the rules. See below.
>> >
>> >>
>> >> You mention a 'stall', can you elaborate more? What happens exactly?
>> >> Can you debug this further?
>> >>
>> >
>> > Yes, I have. The problem is that this conditional
>> >
>> >   ifneq ($$(ROOTFS_DEVICE_TABLES),)
>> >          cat $$(ROOTFS_DEVICE_TABLES) > $$(FULL_DEVICE_TABLE)
>> >
>> > is *never* false. However, if ROOTFS_DEVICE_TABLES is empty
>> > the command will execute like this:
>> >
>> >   $ cat > some_file
>> >
>> > which simply stalls (well it doesn't stall, it's waiting for EOF at stdin).
>> > I think this is easily reproducible, just set an empty value in your
>> > BR2_ROOTFS_DEVICE_TABLE option.
>> >
>> > As I said in the patch I'm far from a makefile wizard, but it seems
>> > to me that $$(ROOTFS_DEVICE_TABLES) (double dollar) is not equivalent
>> > to $(ROOTFS_DEVICE_TABLES) (single dollar) from the perspective of the
>> > conditional.
>>
>> I can reproduce the problem you mention.
>> The main problem is that the 'ifneq' never evaluates to false, as you
>> mentioned, even if its contents are 'empty'. They are never really
>> empty, because of this line:
>>
>> ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
>>         $(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
>>
>> Because it is a concatenation of two strings separated by spaces,
>> there will always be a space in the final variable, which means it's
>> not empty. We need to strip it.
>
> You're right! (I actually verified this before sending the patch,
> but I was doing something wrong because I missed the extra space).
>
>> The following change fixes your problem, it runs the qstrip on the
>> overal combination of the variables, causing the space to be removed
>> if it's the only thing left.
>>
>> diff --git a/fs/common.mk b/fs/common.mk
>> --- a/fs/common.mk
>> +++ b/fs/common.mk
>> @@ -33,8 +33,8 @@
>>
>>  FAKEROOT_SCRIPT = $(BUILD_DIR)/_fakeroot.fs
>>  FULL_DEVICE_TABLE = $(BUILD_DIR)/_device_table.txt
>> -ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE)) \
>> -       $(call qstrip,$(BR2_ROOTFS_STATIC_DEVICE_TABLE))
>> +ROOTFS_DEVICE_TABLES = $(call qstrip,$(BR2_ROOTFS_DEVICE_TABLE) \
>> +       $(BR2_ROOTFS_STATIC_DEVICE_TABLE))
>>
>>  define ROOTFS_TARGET_INTERNAL
>>
>>
>
> Indeed, this patch fixes my problem. Do you want me to prepare a patch?
>
> Otherwise, if you plan to submit the patch yourself, feel free to add:
> Tested-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Feel free to send the patch yourself, I don't mind. It will be quicker :)

Best regards,
Thomas
