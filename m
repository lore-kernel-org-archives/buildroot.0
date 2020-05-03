From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Sun, 3 May 2020 19:10:36 +0200
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix host
 version of .pc file for wrapper
In-Reply-To: <20200503134807.4e709fe4@windsurf.home>
References: <20200502060435.23004-1-james.hilliard1@gmail.com>
 <20200502143243.4e2b3ef3@windsurf.home>
 <CADvTj4oM52ZaAVbC3pUjTPf5ezKj36SF76Udz1c7uBsryXMdRw@mail.gmail.com>
 <20200503134807.4e709fe4@windsurf.home>
Message-ID: <7340e836-134f-a02f-9b3a-528c322517d8@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/05/2020 13:48, Thomas Petazzoni wrote:
> Hello James,
> 
> On Sat, 2 May 2020 13:36:04 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
> 
>>>> +define HOST_GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
>>>> +     # Set prefix to /usr because pkg-config appends the sysroot directory
>>>> +     $(SED) "s%^prefix=.*%prefix=\/usr%g" \
>>>> +             $(HOST_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc  
>>>
>>> No, the host variant of pkg-config should not append the sysroot
>>> directory. If it does, then it is wrong.  
>> Well this was when building the target package that uses the host
>> pkgconfig libdir.
> 
> And? According to 4e0bc29993376613d200e892d491e31ea5a49622, Meson has
> some understanding of when it is using pkg-config to find libraries to
> build native code or to build target code.
> 
> As you can see in this commit:
> 
> -pkgconfig = '@HOST_DIR@/usr/bin/pkg-config'
> +pkgconfig = '@HOST_DIR@/bin/pkgconf'
> 
> Meson is no longer going through our pkg-config wrapper that passes the
> right environment variables to ensure pkg-config returns values valid
> for building target code.
> 
> Since Meson goes through $(HOST_DIR)/bin/pkgconf directly, we do not
> pass any specific sysroot argument to pkg-config. It is up to Meson to
> pass the appropriate sysroot value when working with target code, and
> to not pass any sysroot value when working on native code.

Look at the logs i posted in this thread. meson uses the 'pkgconfig' in
the cross-file only when finding target libraries. It does not use it
when finding native libraries.

Instead, for native libraries, it expects a native-file, which we don't
provide. As a fallback, it searches for $PKG_CONFIG_FOR_BUILD,
$PKG_CONFIG, or for a 'pkg-config' in $PATH. And we have a pkg-config in
$PATH, it is the target pkgconf wrapper.

The fix in 4e0bc29993376613d200e892d491e31ea5a49622 does not work.
Meson still uses the pkg-config wrapper when working with native code.
