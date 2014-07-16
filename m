From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Wed, 16 Jul 2014 14:22:53 +0200
Subject: [Buildroot] [RFC 6/9] libgtk3: new package
In-Reply-To: <20140708173455.GB25364@rmm-p1267483>
References: <1404827832-1101-1-git-send-email-hadrien.boutteville@gmail.com>
 <1404827832-1101-7-git-send-email-hadrien.boutteville@gmail.com>
 <20140708173455.GB25364@rmm-p1267483>
Message-ID: <53C66E9D.5070507@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, 8 Jul 2014 19:34:57 +0200, Eric Le Bihan wrote:
>> diff --git a/package/libgtk3/libgtk3-0002-add-file-introspection-m4.patch b/package/libgtk3/libgtk3-0002-add-file-introspection-m4.patch
>> new file mode 100644
>> index 0000000..3cd0569
>> --- /dev/null
> I guess the addition of this file is needed because you have to perform an
> autoreconf, but GOBJECT_INTROSPECTION_CHECK could not be resolved, right?

Yes. It's the solution given by the GTK+3 doc.

> Maybe you can avoid it by patching configure.ac, to add a check, as performed
> in Systemd:
> 
>   m4_ifdef([GOBJECT_INTROSPECTION_CHECK],
>            [GOBJECT_INTROSPECTION_CHECK([1.31.1])],
>            [AM_CONDITIONAL([HAVE_INTROSPECTION], [false])
>             enable_introspection=no])

I will test, I actually prefer this solution rather than adding a file.
Thanks!

>> +
>> +# We do not build a full version of libgtk3 for the host, because that
>> +# requires compiling Cairo, Pango, ATK and X.org for the
>> +# host. Therefore, we patch it to remove dependencies, and we hack the
>> +# build to only build gdk-pixbuf-from-source and
>> +# gtk-update-icon-cache, which are the host tools needed to build Gtk
>> +# for the target.

I realized that I forget to modify the comment for this part :-/. This
comment was for my first attempt with a patch which reduced dependencies
like for libgtk2. Now we don't patch to reduce dependencies and we just
manually build gtk-update-icon-cache to get rid of the dependencies and
the configure.

>> +HOST_LIBGTK3_DEPENDENCIES = host-libglib2 host-libpng host-gdk-pixbuf
>> +
>> +HOST_LIBGTK3_CFLAGS = $(shell $(HOST_DIR)/usr/bin/pkg-config \
>> +	--cflags --libs gdk-pixbuf-2.0)
> 
> When experimenting on my side, I've noticed that gtk+ >= 3.10 can build a
> native version of gtk-update-icon-cache if --enable-gtk2-dependency=no is set
> when invoking './configure'.
> 
> Unfortunately, if the target toolchain is based on uClibc, the macro
> AM_GLIB_GNU_GETTEXT will detect the libintl built for the target and will add
> '-lintl' to the default list of libraries for the linker (used for both native
> and target builds).
> 
> But no native version of libintl is available (the functions are provided by
> glibc): gtk-update-icon-cache will not build...
> 
> So, Buildroot must still build its own version, as done in your patch.

Yes, and your solution was better than my first patch ;-).

Thanks,

Hadrien
