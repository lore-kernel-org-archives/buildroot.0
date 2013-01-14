From: Gilles Talis <gilles.talis@gmail.com>
Date: Sun, 13 Jan 2013 16:47:50 -0800
Subject: [Buildroot] [PATCH 1/1] httping: new package
In-Reply-To: <CAKcgs2xk-=iG-3Ezmc1upEPBjhSGcmgg9WSwn=1E3+OKDT05fg@mail.gmail.com>
References: <1358036972-10406-1-git-send-email-gilles.talis@gmail.com>
 <20130113120500.0ad7be3a@skate>
 <CAKcgs2xk-=iG-3Ezmc1upEPBjhSGcmgg9WSwn=1E3+OKDT05fg@mail.gmail.com>
Message-ID: <CAKcgs2wLk-cOK7qUDJ23TidHSyESJF-vCoL+JezDSL2q0H1c0w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I forgot to copy mailing list.
Sorry about that and thanks for your help.
Gilles.

2013/1/13 Gilles Talis <gilles.talis@gmail.com>

> Dear Thomas,
>
> I thought I knew Makefiles better than that. Well, I was wrong :-).
> The reason why TARGET_CONFIGURE_OPTS does not work in this case is because
> it overrides the original Makefile's CFLAGS variable (that should be kept
> in order for target to compile). Apart from adding "override" in the
> package Makefile, I actually do not see how to use TARGET_CONFIGURE_OPTS
> and still keep Makefile CFLAGS. Any hint?
> This will surely help me for future patches/projects.
>
> thanks
> Gilles.
>
> 2013/1/13 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
>> Dear Gilles Talis,
>>
>> On Sat, 12 Jan 2013 16:29:32 -0800, Gilles Talis wrote:
>> > Httping is like 'ping' but for http-requests.
>> >
>> > Fixed commit following review
>>
>> Do not put such a comment in the commit. If you want to put a changelog
>> with the differences since the first posting, it should go...
>>
>> >
>> > Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
>> > ---
>>
>> ... here. I.e, after the "---" sign.
>>
>> That's because we don't want the changelog to end up forever in the
>> Buildroot commit history.
>>
>> > +if BR2_PACKAGE_HTTPING
>> > +
>> > +config BR2_PACKAGE_HTTPING_OPENSSL
>> > +     bool "OpenSSL support"
>> > +     depends on BR2_PACKAGE_OPENSSL
>> > +     default y
>> > +     help
>> > +       Adds openSSL support to httping
>>
>> I'd say it should rather be:
>>
>> config BR2_PACKAGE_HTTPING_OPENSSL
>>         bool "OpenSSL support"
>>         select BR2_PACKAGE_OPENSSL
>>         help
>>           Adds OpenSSL support to httping
>>
>> When we have sub-options to enable more features, we generally use
>> "select" to make sure that the needed libraries are brought in.
>>
>> > +HTTPING_VERSION = 1.5.6
>>
>> Any reason not to use 1.5.7.
>>
>> > +HTTPING_SOURCE = httping-$(HTTPING_VERSION).tgz
>> > +HTTPING_SITE = http://www.vanheusden.com/httping
>> > +HTTPING_LICENSE = GPLv3
>> > +HTTPING_LICENSE_FILES = license.txt
>>
>> Actually, the license seems to be GPLv2. If you look at this
>> license.txt file, it says:
>>
>> The license of this program can be obtained from:
>> http://www.vanheusden.com/license.txt
>>
>> And if you look at this other license.txt file, it contains the text of
>> GPLv2.
>>
>> > +define HTTPING_BUILD_CMDS
>> > +     $(MAKE) CC="$(TARGET_CC)" \
>> > +             LD="$(TARGET_LD)" \
>> > +             STRIP="$(TARGET_STRIP)" \
>> > +             SSL=$(HTTPING_SSL) \
>> > +             DEBUG=no \
>> > +             TFO=$(HTTPING_TFO) -C $(@D)
>> > +endef
>>
>> I saw your e-mail with your issues using TARGET_CONFIGURE_OPTS. But
>> there shouldn't be any issue doing:
>>
>> define HTTPING_BUILD_CMDS
>>         $(MAKE) $(TARGET_CONFIGURE_OPTS) \
>>                 SSL=$(HTTPING_SSL) \
>>                 DEBUG=no \
>>                 TFO=$(HTTPING_TFO) -C $(@D)
>> endef
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, Free Electrons
>> Kernel, drivers, real-time and embedded Linux
>> development, consulting, training and support.
>> http://free-electrons.com
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130113/6e554f49/attachment.html>
