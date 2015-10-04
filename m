From: =?UTF-8?Q?Matthias_Wei=C3=9Fer?= <m.weisser.m@gmail.com>
Date: Sun, 4 Oct 2015 18:05:15 +0200
Subject: [Buildroot] [PATCH] squashfs: Add lz4 hc compression
In-Reply-To: <87lhbk871v.fsf@dell.be.48ers.dk>
References: <1439279901-4337-1-git-send-email-m.weisser.m@gmail.com>
 <87lhbk871v.fsf@dell.be.48ers.dk>
Message-ID: <CAO8h3eGcP2kKFDWaa3iUUzYOhF=5Jw+jzNci1o2=C=0GQY5QSg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter

2015-10-03 14:34 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Matthias" == Matthias Weisser <m.weisser.m@gmail.com> writes:
>
> Hi,
>
> Sorry for the slow response.
>
>  > lz4 offers a high compression mode. A minimalistic file system shrinks by about 15%.
>  > Signed-off-by: Matthias Weisser <m.weisser.m@gmail.com>
>  > ---
>  >  fs/squashfs/Config.in   | 3 +++
>  >  fs/squashfs/squashfs.mk | 4 ++++
>  >  2 files changed, 7 insertions(+)
>
>  > diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
>  > index ca9ddb2..94e126e 100644
>  > --- a/fs/squashfs/Config.in
>  > +++ b/fs/squashfs/Config.in
>  > @@ -18,6 +18,9 @@ config BR2_TARGET_ROOTFS_SQUASHFS4_GZIP
>  >  config BR2_TARGET_ROOTFS_SQUASHFS4_LZ4
>  >      bool "lz4"
>
>  > +config BR2_TARGET_ROOTFS_SQUASHFS4_LZ4_HC
>  > +    bool "lz4hc"
>
> Is there ever any use case for enabling lz4 WITHOUT the high compression
> option? The only drawback is somewhat slower filesystem creation, right?
> Perhaps we can just adjust the existing lz4 option to use -Xhc?

I also thought about that. But didn't want to change anything existing.
From my point of view there is no reason not to use the high
compression mode. Actually the Linux kernel does exactly this
when LZ4 compression is activated. The compression speed is
still in the range of zlib compression and therefore not that slow.

Should I send a new patch?

Regards
Matthias

>
>
>
>> +
>  >  config BR2_TARGET_ROOTFS_SQUASHFS4_LZMA
>  >      bool "lzma"
>
>  > diff --git a/fs/squashfs/squashfs.mk b/fs/squashfs/squashfs.mk
>  > index 446906f..528e0f7 100644
>  > --- a/fs/squashfs/squashfs.mk
>  > +++ b/fs/squashfs/squashfs.mk
>  > @@ -9,6 +9,9 @@ ROOTFS_SQUASHFS_DEPENDENCIES = host-squashfs
>  >  ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4),y)
>  >  ROOTFS_SQUASHFS_ARGS += -comp lz4
>  >  else
>  > +ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZ4_HC),y)
>  > +ROOTFS_SQUASHFS_ARGS += -comp lz4 -Xhc
>  > +else
>  >  ifeq ($(BR2_TARGET_ROOTFS_SQUASHFS4_LZO),y)
>  >  ROOTFS_SQUASHFS_ARGS += -comp lzo
>  >  else
>  > @@ -23,6 +26,7 @@ endif
>  >  endif
>  >  endif
>  >  endif
>  > +endif
>
>  >  define ROOTFS_SQUASHFS_CMD
>  >      $(HOST_DIR)/usr/bin/mksquashfs $(TARGET_DIR) $@ -noappend \
>  > --
>  > 2.1.4
>
>  > _______________________________________________
>  > buildroot mailing list
>  > buildroot at busybox.net
>  > http://lists.busybox.net/mailman/listinfo/buildroot
>
>
> --
> Bye, Peter Korsgaard
