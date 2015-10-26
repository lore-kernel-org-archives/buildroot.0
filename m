From: Thijs Vermeir <thijsvermeir@gmail.com>
Date: Mon, 26 Oct 2015 13:53:01 +0100
Subject: [Buildroot] [PATCH 1/2] x265: new package
In-Reply-To: <20151025214020.GL11692@free.fr>
References: <1445716229-40660-1-git-send-email-thijsvermeir@gmail.com>
 <87d1w2fxgq.fsf@dell.be.48ers.dk> <20151025214020.GL11692@free.fr>
Message-ID: <CAHCOiUSFUs4Nnr_r99LhkvOwS9HGZ19UPiGd0mwQAZadQDzLfA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sun, Oct 25, 2015 at 10:40 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> \Peter, All,
>
> On 2015-10-25 22:29 +0100, Peter Korsgaard spake thusly:
>> >>>>> "Thijs" == Thijs Vermeir <thijsvermeir@gmail.com> writes:
>>  > x265 is a H.265 / HEVC video encoder application library, designed to encode
>>  > video or images into an H.265 / HEVC encoded bitstream.
>>
>>  > http://x265.org
>>
>>  > Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>
>>
>> > +++ b/package/x265/x265.mk
>>  > @@ -0,0 +1,31 @@
>>  > +################################################################################
>>  > +#
>>  > +# x265
>>  > +#
>>  > +################################################################################
>>  > +
>>  > +X265_VERSION = 1.8
>>  > +X265_SOURCE = x265_$(X265_VERSION).tar.gz
>>  > +X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
>>  > +X265_LICENSE = GPLv2+
>>  > +X265_LICENSE_FILES = COPYING
>>  > +X265_SUBDIR = source/
>>
>> NIT: we normally don't append the trailing '/'.
>>
>> > +X265_INSTALL_STAGING = YES
>>  > +
>>  > +ifeq ($(BR2_i386)$(BR2_x86_64),y)
>>  > +X265_DEPENDENCIES += host-yasm
>>  > +endif
>>  > +
>>  > +ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
>>  > +X265_CONF_OPTS += -DENABLE_SHARED=true -DENABLE_PIC=true
>>  > +else
>>  > +X265_CONF_OPTS += -DENABLE_SHARED=false
>>  > +endif
>>
>> Any idea why the x265 developers don't use the "standard"
>> BUILD_SHARED_LIBS=ON|OFF flag like other packages?
>
> I gues it would work, since they do things like:
>
>     if(ENABLE_SHARED)
> and
>     if(ENABLE_PIC)
>
> Ditto for CLI.
>
> Thijs, care to check if changing true/false to ON/OFF still works,
> please? If so, can you send an patch? This way, all our Cmake-based
> packages will look the same, which is good for consistency.
>
> Regards,
> Yann E. MORIN.

Yes, I can look at it. To be clear you mean by the "standard" way:
- create a patch to accept BUILD_SHARED_LIBS (and enable fPIC) and
remove all the shared lib stuff from the mk file
- and change values in the mk file for the CLI option from true/false -> ON/OFF

Gr,
Thijs

>
>>  > +ifeq ($(BR2_PACKAGE_X265_CLI),)
>>  > +X265_CONF_OPTS += -DENABLE_CLI=false
>>  > +else
>>  > +X265_CONF_OPTS += -DENABLE_CLI=true
>>  > +endif
>>
>> We prefer positive logic, so I've swapped these around.
>>
>> Committed, thanks.
>>
>> --
>> Bye, Peter Korsgaard
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
