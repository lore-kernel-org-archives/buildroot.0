From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 20 Aug 2014 14:34:45 +0200
Subject: [Buildroot] [PATCH 2/4] package/ncurses: fixup wide support for
 static targets
In-Reply-To: <20140820142238.404d0c48@free-electrons.com>
References: <1408474091-25947-1-git-send-email-gustavo@zacarias.com.ar>
 <1408474091-25947-3-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LXsfoHafOY9cdVfP1waNcaWkrM8xMgyiqswE4LHX56wMA@mail.gmail.com>
 <20140820142238.404d0c48@free-electrons.com>
Message-ID: <CAAXf6LXekzfe45PXJx8z=UB0wB6g=NnuvK5LCgPuhnP0KDKvBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Aug 20, 2014 at 2:22 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Tue, 19 Aug 2014 21:47:55 +0200, Thomas De Schampheleire wrote:
>
>> Here you could also do something like
>> ifeq ($(BR2_PREFER_STATIC_LIB),y)
>> NCURSES_LIB_EXT = .a
>> else
>> NCURSES_LIB_EXT = .so
>> endif
>> define NCURSES_LINK_LIBS
>>        for lib in $(NCURSES_LIBS-y); do \
>>                ln -sf $${lib}$(NCURSES_LIB_SUFFIX)$(NCURSES_LIB_EXT) \
>>                        $(1)/usr/lib/$${lib}$(NCURSES_LIB_EXT); \
>>        done
>> endef
>> to avoid duplicating the hook content.
>
> Except that for now, the semantic is:
>
>  * BR2_PREFER_STATIC_LIB=y -> install only static libraries
>
>  * BR2_PREFER_STATIC_LIB undefined -> install *both* static and shared
>    libraries.

Unless I'm missing something that is not what Gustavo's patch does. He
explicitly added an else clause. So if STATIC_LIB is not defined, only
links for the .so file will be created.

Best regards,
Thomas
