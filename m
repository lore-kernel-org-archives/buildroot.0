From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Tue, 27 Mar 2012 21:36:10 -0300
Subject: [Buildroot] [PATCH v5] vlc: New package
In-Reply-To: <201203252148.58501.arnout@mind.be>
References: <1332381260-15711-1-git-send-email-ismael.luceno@gmail.com>
 <201203252148.58501.arnout@mind.be>
Message-ID: <20120327213610.72c77611@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 25 Mar 2012 21:48:57 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:
> On Thursday 22 March 2012 02:54:20 Ismael Luceno wrote:
> > Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
> 
>  Not done yet, unfortunately...  But for a big patch like this that's
> to be expected.

I know.

>  If you're in a hurry to get this integrated, it may be worthwhile to
> split the patch into a basic one that includes a minimal feature set,
> and an extension that adds all the config options for the different
> components.

I would prefer to get it integrated as a whole. Sooner is better, but I
would like to get it right once and forever.

<...>
>  udev is a special case, because it depends on the /dev management
> option BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV.  You can't use a
> select for that one (it would be too confusing).  So just set a
> depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV.  The comment
> is not needed in this case, because it's quite obvious that udev
> support only makes sense if you have udev.

Hmmm... that sounds a bit confusing... the dependency is actually on
libudev, but does that necessarily mean
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV?

> > diff --git a/package/multimedia/vlc/vlc-uclibc-fixes.patch
> > b/package/multimedia/vlc/vlc-uclibc-fixes.patch new file mode 100644
> > index 0000000..5471b08
> > --- /dev/null
> > +++ b/package/multimedia/vlc/vlc-uclibc-fixes.patch
> > @@ -0,0 +1,25 @@
> > +Fixes compilation with uClibc, which doesn't provide
> > gnu/libc-version.h nor +gnu_get_libc_version.
> > +
> > +Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
> 
>  Did you send this patch upstream to vlc?  If not, could you do so?

Yes, I sent it but was rejected, they consider it a bug in uClibc. I'll
add a comment on the patch.

> > +# The following rmoves the relink_command. If not removed, libtool
> > tries to
>                    ^^^removes
> > +# relink against the host libraries, instead of the sysroot.
> > +VLC_POST_BUILD_HOOKS += VLC_FIX_LA_FILES
> > +define VLC_FIX_LA_FILES
> > +	find $(@D) -name '*.la' -exec $(SED) '/^relink_command=/d'
> > '{}' +
> 
>  For which .la's is this needed?  I've compiled various
> configurations with several toolchains and I don't see a
> relink_command in any of the .la files...

Well, in the scm version I was using, for all them, but perhaps that
somehow changes when compiling from a tarball... strange...

> 
> > +	touch $(@D)/modules/access/zip/libzip_plugin.la \
> > +		$(@D)/modules/misc/liblogger_plugin.la
> 
>  And why is this needed?

Because those depend on other .la files, and otherwise get re-built,
thus add the relink_command again...

Thanks for the suggestions. I'll try to address the issues and send a
new patch soon :).
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120327/6f8843ce/attachment.asc>
