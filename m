From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Apr 2017 16:48:29 +0200
Subject: [Buildroot] [PATCH] syslinux: Builds with the target toolchain
In-Reply-To: <20170405153859.7654c11d@armant.office.greenbone.net>
References: <1491386987-6695-1-git-send-email-benoit.allard@greenbone.net>
 <20170405130227.10a029e2@free-electrons.com>
 <20170405153859.7654c11d@armant.office.greenbone.net>
Message-ID: <5ed2e44f-0550-cad7-2e0f-ede47a26099c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-04-17 15:38, Beno?t Allard wrote:
> On Wed, 5 Apr 2017 13:02:27 +0200
> Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
>>> diff --git a/boot/syslinux/syslinux.mk b/boot/syslinux/syslinux.mk
>>> index 5b7906c..50feea3 100644
>>> --- a/boot/syslinux/syslinux.mk
>>> +++ b/boot/syslinux/syslinux.mk
>>> @@ -51,8 +51,10 @@ SYSLINUX_POST_PATCH_HOOKS += SYSLINUX_CLEANUP
>>>  # and the internal zlib should take precedence so -I shouldn't
>>>  # be used.
>>>  define SYSLINUX_BUILD_CMDS
>>> -	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(HOSTCC) -idirafter
>>> $(HOST_DIR)/usr/include $(HOST_LDFLAGS)" \
>>> -		AR="$(HOSTAR)" $(SYSLINUX_EFI_ARGS) -C $(@D)
>>> $(SYSLINUX_TARGET)
>>> +        $(TARGET_MAKE_ENV) $(MAKE1) \
>>> +            CC="$(TARGET_CC)" LD="$(TARGET_LD)"
>>> NASM="$(HOST_DIR)/usr/bin/nasm" \
>>> +            HOSTCC="$(HOSTCC)" HOST_CFLAGS="$(HOST_CFLAGS)"
>>> HOST_LDFLAGS="$(HOST_LDFLAGS)" \
>>
>> In fact, it would have been better to use CC_FOR_BUILD,
>> CFLAGS_FOR_BUILD, LDFLAGS_FOR_BUILD in the syslinux Makefile. If you
>> do this, then you can simplify this to:
>>
>> 	$(TARGET_MAKE_ENV) $(MAKE1) $(TARGET_CONFIGURE_OPTS) \
>> 		NASM=... $(SYSLINUX_EFI_ARGS) -C $(@D)
>> $(SYSLINUX_TARGET)
>>
> 
> I didn't addressed this in my version 2 of the patch as somehow, when
> using $(TARGET_CONFIGURE_OPTS) instead of the various variables, the
> Makefiles from syslinux were not able to define CFLAGS on their own, or
> somehow, they didn't used their version of it.

 That's because the Makefile in syslinux does

CFLAGS = ...

This means that if you pass CFLAGS on the left-hand side of $(MAKE) (i.e., in
the environment), they won't be used at all, and if you pass it on the
right-hand side, the one from the Makefile won't be used.

 The solution is to patch the syslinux Makefile to either:

- not assign to CFLAGS at all, instead use some other variable and use that in
the build command;
- assign CFLAGS with either ?= (for defaults that can be overridden by the user)
or += (for things that always have to be there) instead of just =; in this case
you should pass TARGET_CONFIGURE_OPTS in the environment, not as a Makefile
override.

 The second option is a bit simpler to patch in, but it requires GNU make which
some upstreams don't like.

 Regards,
 Arnout

 PS should we make this a FAQ entry in the manual?

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 833 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170405/119d142e/attachment.asc>
