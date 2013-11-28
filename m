From: arnaud aujon <arnaud.aujon@gmail.com>
Date: Thu, 28 Nov 2013 20:04:11 +0100
Subject: [Buildroot] [buildroot] libevas build failure analysis
Message-ID: <CACjG4B+qJvuzX=dZz5F7jNyc_m796_j2m9NZ91fpsoy52SX8VQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi there,

A quick analysis of libevas build failure (
http://autobuild.buildroot.org/results/15c/15cfb974e428b20ba230321cd8b59a82308785af/
)

The build fails because the member 'delete_me' of the Image_Entry_Flags
structure is undefined. This is because there is a ifdef
BUILD_ASYNC_PRELOAD surrounding this member which is not defined during the
build because the toolchain doesn't have thread support.

From libevas.mk :
# async image preload support needs threads support in toolchain
ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
LIBEVAS_CONF_OPT += --disable-async-preload
endif

But it seems like the file evas_cache2.c is using 'delete_me' regardless of
the 'async image preload support'

I don't have the time to investigate more, but it looks like without
threads we should use 'lib/cache' and not 'lib/cache2'  which are defining
the same symboles but 'cache2' absolutely need threads support, 'cache'
doesn't .
So I guess we have to fix the makefile to use this the 'cache'
implementation.

Does someone  know what we should do here ?

Regards,

Arnaud
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131128/384eca9c/attachment.html>
