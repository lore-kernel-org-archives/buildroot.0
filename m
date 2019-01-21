From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 21 Jan 2019 07:05:14 -0700
Subject: [Buildroot] [PATCH 1/1] fs/common.mk: enable multithreaded xz
 compression
In-Reply-To: <CANQCQpbo+puWN0o99zFBqthPLAe9hkd9gBTfXiZrE3x-qTvoHg@mail.gmail.com>
References: <1548036475-25449-1-git-send-email-james.hilliard1@gmail.com>
 <CANQCQpbo+puWN0o99zFBqthPLAe9hkd9gBTfXiZrE3x-qTvoHg@mail.gmail.com>
Message-ID: <CADvTj4rH7G-LSt=TBzjNAUpSiRdCLgwf6NbuAqFAG-i95mZRnw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 21, 2019 at 7:02 AM Matthew Weber <matthew.weber@collins.com> wrote:
>
> James,
>
>
> On Sun, Jan 20, 2019 at 8:08 PM <james.hilliard1@gmail.com> wrote:
> >
> > From: James Hilliard <james.hilliard1@gmail.com>
> >
> > xz help indicates only 1 thread is used unless we set threads:
> > -T, --threads=NUM   use at most NUM threads; the default is 1; set to 0
> >                     to use as many threads as there are processor cores
> >
>
> It's good to see xz now has support, but I assume there is a minimum
> version?  We ran into this outside of Builroot on a project where we
> conditionally used the parallel "pxz" tool when available, as "xz"
> didn't have the -T support consistently in distros yet.
I thought it was using the version compiled by buildroot.
Isn't that what host-xz is being used for?
>
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  fs/common.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/fs/common.mk b/fs/common.mk
> > index a560417..6a57121 100644
> > --- a/fs/common.mk
> > +++ b/fs/common.mk
> > @@ -106,7 +106,7 @@ endif
> >  ifeq ($$(BR2_TARGET_ROOTFS_$(2)_XZ),y)
> >  ROOTFS_$(2)_DEPENDENCIES += host-xz
> >  ROOTFS_$(2)_COMPRESS_EXT = .xz
> > -ROOTFS_$(2)_COMPRESS_CMD = xz -9 -C crc32 -c
> > +ROOTFS_$(2)_COMPRESS_CMD = xz -T 0 -9 -C crc32 -c
> >  endif
> >
> >  $$(BINARIES_DIR)/$$(ROOTFS_$(2)_FINAL_IMAGE_NAME): ROOTFS=$(2)
> > --
> > 2.7.4
> >
>
> Thanks for sending the patch!
> Matt
