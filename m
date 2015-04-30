From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Thu, 30 Apr 2015 20:17:59 +0200
Subject: [Buildroot] [PATCH] package/ccache: add universal wrapper script
In-Reply-To: <CANxTyt6qTC5cWRU1hz4eqJqV6YsUbaVKxA8FuYwkuWq2+-TbTw@mail.gmail.com>
References: <1430309142-36242-1-git-send-email-kaszak@gmail.com>
 <CANxTyt6qTC5cWRU1hz4eqJqV6YsUbaVKxA8FuYwkuWq2+-TbTw@mail.gmail.com>
Message-ID: <CABbD_XBp_Soe_PP7ew0VE7u2RMGuXHtZP_a6GtqASEz7=3QcQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Danomi,

> +       grep
> "BR2_ARCH\|BR2_TOOLCHAIN\|BR2_GCC\|BR2_BINUTILS\|BR2_UCLIBC\|BR2_GLIBC\|BR2_EGLIBC"
> $(BR2_CONFIG) | \
> > +       grep -v "#" | md5sum > $(HOST_DIR)/ccache_toolchain.config.hash
>
> Does the list used for grep need these as well, as they influence the
> ext-toolchain-wrapper.c?
>
> * BR2_TARGET_OPTIMIZATION
> * BR2_SOFT_FLOAT
>
>
This patch don't really calculates with ext-toolchain-wrapper.c, but it's a
good question if these config options should be factored in, I am not sure.
If these are passed at compilation time to the target compiler (by the
wrapper binary), then theoretically ccache gets them and calculates them
in, as ccache is not influenced by the wrapper (mtime turned off) - so we
don't need them in the hash file.
If the target compiler binary changes based on their values, then they
should be calculated in - I think this doesn't happen, as the external
binaries won't be changed.
Opinions?

(It's not a be a big deal to add them also into the grep line, but if we
restrict the hash too much, then it won't match the cache hits even when it
should. If we don't restrict it enough, it may generate false cache hits
and through that corrupted binaries.)

BR
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150430/47bff646/attachment.html>
