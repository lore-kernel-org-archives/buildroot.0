From: Erico Nunes <nunes.erico@gmail.com>
Date: Thu, 15 Sep 2016 23:29:42 +0200
Subject: [Buildroot] [PATCH 1/5] grub2: bump up version
In-Reply-To: <c4d34da0-6dc8-3eec-a2aa-08cf5b05bf42@mind.be>
References: <20160913041548.10290-1-nunes.erico@gmail.com>
 <20160913041548.10290-2-nunes.erico@gmail.com>
 <c4d34da0-6dc8-3eec-a2aa-08cf5b05bf42@mind.be>
Message-ID: <CAK4VdL3qyfs+o66W8ekmPOWO7bpxEXg-d2_V0wqYn9pa9NxL6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

thanks for the review!

On Wed, Sep 14, 2016 at 2:25 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 13-09-16 06:15, Erico Nunes wrote:
>> Grub 2 version 2.00 which exists in Buildroot dates back from 2012 and
>> does not support new interesting features such as ARM support.
>>
>> Despite it being the last official non-beta release, it makes sense to
>> bump Grub 2 to current master HEAD as the project has not been providing
>> regular releases since then.
>> Other distributions such as Fedora have also been shipping variations of
>> the newer "beta" releases.
> [snip]
>> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
>> index dc4e51e..ecdf421 100644
>> --- a/boot/grub2/grub2.mk
>> +++ b/boot/grub2/grub2.mk
>> @@ -4,9 +4,9 @@
>>  #
>>  ################################################################################
>>
>> -GRUB2_VERSION = 2.00
>> -GRUB2_SITE = $(BR2_GNU_MIRROR)/grub
>> -GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
>> +GRUB2_VERSION = 4e0f8f66e321cf1051c0e01f6fbcc6fc35a807b6
>> +GRUB2_SITE = git://git.savannah.gnu.org/grub.git
>
>  It's not so nice that we have to download via git, no http protocol, we have to
> autoregen, we can't check the signature...
>
>  Isn't it better to use grub-2.02~beta3.tar.xz which is just half a year old?

My initial intention was to use grub-2.02~beta3 tar, however I was
unsure about that too and had a brief chat with Yann and Thomas on IRC
about it before working on this. The conclusion was that it would be
better to juse use HEAD instead of that as it had a few extra bugfix
patches that we would probably want anyway. I guess beta3 would also
be compatible with the rest of the changes here, so it is just the
tradeoff of having no hash check, having to clone git, having to
autogen.sh, against losing some bugfixes. I think additional opinions
on this would be appreciated.

>> +GRUB2_SITE_METHOD = git
>>  GRUB2_LICENSE = GPLv3+
>>  GRUB2_LICENSE_FILES = COPYING
>>  GRUB2_DEPENDENCIES = host-bison host-flex
>> @@ -70,6 +70,11 @@ GRUB2_CONF_OPTS = \
>>       --enable-libzfs=no \
>>       --disable-werror
>>
>> +define GRUB2_RUN_AUTOGEN
>> +     cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
>> +endef
>> +GRUB2_PRE_CONFIGURE_HOOKS += GRUB2_RUN_AUTOGEN
>
>  Isn't there a possibility to use GRUB2_AUTORECONF = YES?
>
>  If not, you must:
>
> * Explain in a comment why not.
> * Add host-automake host-autoconf to GRUB2_DEPENDENCIES
> * Normally also host-libtool and normally you have to run LIBTOOL_PATCH_HOOK,
> but grub2 doesn't use libtool.

AUTORECONF=YES is not enough for this, it doesn't call autogen.sh. We
have other a few other packages in Buildroot which have the same hook.
I have checked now and it seems that all of them do have some comment
for that, so looks like indeed I should also add it. I missed those
extra dependencies, so I think they should probably be added as well.
But this will depend on the outcome of the previous item (about using
git or beta3 tarball), so there also exists a chance this may just
disappear.

Erico
