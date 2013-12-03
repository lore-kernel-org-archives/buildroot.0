From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Tue, 3 Dec 2013 09:32:51 +0100
Subject: [Buildroot] [buildroot] libevas build failure analysis
In-Reply-To: <CACjG4B+AJ0F4BmrSVrfzMidVgUFGwWt7sBoxUD3QZyp0x6+EAw@mail.gmail.com>
References: <CACjG4B+qJvuzX=dZz5F7jNyc_m796_j2m9NZ91fpsoy52SX8VQ@mail.gmail.com>
 <CAKAx1cgki9JiRqU=zJJ0P8g5XpG7NEZN9WcBuYMa4mNyv2C-RA@mail.gmail.com>
 <CACjG4B+AJ0F4BmrSVrfzMidVgUFGwWt7sBoxUD3QZyp0x6+EAw@mail.gmail.com>
Message-ID: <CACjG4BLqXqufuzSHYWghXcZuWMpBPjbFUU7xGzLhSjQQrghK8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I got an answer from upstream, they said threads are mandatory in 1.8
release, don't know yet about our current 1.7.7, do we have any plan
bumping to 1.8 ?


2013/11/28 arnaud aujon <arnaud.aujon@gmail.com>

> Ok, the problem has been reported to the dev ML, I will follow this.
>
> Regards,
>
> Arnaud
>
>
> 2013/11/28 Lionel Orry <lionel.orry@gmail.com>
>
>> Can you send an email on e-devel maiiling list? They are about to put
>> EFL 1.7 in maintenance as soon as 1.8 is released, so I guess it's
>> time to tell them, I'm sure they will correct it quickly
>>
>>
>> On Thu, Nov 28, 2013 at 8:04 PM, arnaud aujon <arnaud.aujon@gmail.com>
>> wrote:
>> > Hi there,
>> >
>> > A quick analysis of libevas build failure
>> > (
>> http://autobuild.buildroot.org/results/15c/15cfb974e428b20ba230321cd8b59a82308785af/
>> )
>> >
>> > The build fails because the member 'delete_me' of the Image_Entry_Flags
>> > structure is undefined. This is because there is a ifdef
>> BUILD_ASYNC_PRELOAD
>> > surrounding this member which is not defined during the build because
>> the
>> > toolchain doesn't have thread support.
>> >
>> > From libevas.mk :
>> > # async image preload support needs threads support in toolchain
>> > ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>> > LIBEVAS_CONF_OPT += --disable-async-preload
>> > endif
>> >
>> > But it seems like the file evas_cache2.c is using 'delete_me'
>> regardless of
>> > the 'async image preload support'
>> >
>> > I don't have the time to investigate more, but it looks like without
>> threads
>> > we should use 'lib/cache' and not 'lib/cache2'  which are defining the
>> same
>> > symboles but 'cache2' absolutely need threads support, 'cache' doesn't .
>> > So I guess we have to fix the makefile to use this the 'cache'
>> > implementation.
>> >
>> > Does someone  know what we should do here ?
>> >
>> > Regards,
>> >
>> > Arnaud
>> >
>> >
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot at busybox.net
>> > http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131203/70f46be7/attachment-0001.html>
