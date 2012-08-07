From: Matthew Weber <matt@thewebers.ws>
Date: Tue, 7 Aug 2012 12:42:51 -0500
Subject: [Buildroot] Prebuilt concept
In-Reply-To: <CAFt09wMkzusGNstiUyX-WN18PtzRvwUhu6EU7ww204sVXPW9eQ@mail.gmail.com>
References: <CAFt09wNhCtxZcG63uJ8iCuaLeSWEMZrFRd-VuoNw3cTPkFXGAg@mail.gmail.com>
 <CAHXCMMKfgsM8JAdN=vbtmt2JPv1OSccq7SCYQRVpisqAg8HLyg@mail.gmail.com>
 <CAFt09wMkzusGNstiUyX-WN18PtzRvwUhu6EU7ww204sVXPW9eQ@mail.gmail.com>
Message-ID: <CAFt09wO4r6kXnLLhBW6ZGDdOCsrV38+vfG+dFQb421eXtrEi=g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here's what worked for me (taken from my Makefile).  I have only tested
this with an external toolchain, so I'm guessing there will be some
additional stamp files that need tweaking.

refresh_target:
        @echo "Cleaning up target install..."
        @rm -f $(BUILD_DIR)/.root       #Causes target dir to recreate
        @rm -rf $(TARGET_DIR)
        @find $(BUILD_DIR)/* -name "*target_installed" -type f -exec rm -f
{} \;        # Causes pkg to reinstall target dir
        @find $(BUILD_DIR)/* -name ".installed" -type f -exec rm -f {}
\;       # Causes grub to reinstall target dir
        @find $(BUILD_DIR)/* -name ".stamp_installed" -type f -exec rm -f
{} \; # Causes kernel to reinstall target dir
        @rm -rf $(STAMP_DIR)/ext-toolchain-
installed                            # Causes toolchain to recopy libs to
target dir

@make                                                                   #
Command Re-install of target dir
        @echo "Rebuilding target install..."


Thanks,
Matt


On Tue, Aug 7, 2012 at 10:39 AM, Matthew Weber <matt@thewebers.ws> wrote:

> Yeah, that's my thought exactly.  I'll post my results later today.
>
> rm output/build/.root
> rm -rf output/target
> find output/build/* -name "*target_installed" -type f -exec rm -f {} \;
> make
>
> Thanks!
>
>
> On Tue, Aug 7, 2012 at 10:28 AM, Samuel Martin <s.martin49@gmail.com>wrote:
>
>> Hi Matthew,
>>
>> 2012/8/7 Matthew Weber <matt@thewebers.ws>:
>> > My problem is overall build time for recreating the large # of packages
>> I'm
>> > building.  When I perform a verification of the target rootfs for a
>> release,
>> > I really just need it to recreate the output/target folder and don't
>> need to
>> > do a complete rebuild.  Has anyone tried to trick buildroot into just
>> > re-installing the target folder using all the existing (built) packages?
>>
>> A solution could be (not tested):
>> rm -rf output/target && find output/build -name
>> .stamp_target_installed -delete && make
>>
>> Cheers,
>>
>> --
>> Sam
>>
>
>
>
> --
> Thanks,
> Matt
>



-- 
Thanks,
Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120807/4304705e/attachment.html>
