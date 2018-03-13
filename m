From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 13 Mar 2018 23:01:50 +0200
Subject: [Buildroot] [RFC] how to deal with a dependency on configure in
 a "Makefile"
In-Reply-To: <5376F4DC-C206-4034-B246-3D77B47B5B81@storagecraft.com>
References: <5376F4DC-C206-4034-B246-3D77B47B5B81@storagecraft.com>
Message-ID: <20180313210150.lcwrmxkro7r4er6s@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

On Tue, Mar 13, 2018 at 07:27:30PM +0000, Charles Hardin wrote:
> So, we hit this problem that took me a while to figure out - but, it seems 
> to be that
> xfsprogs has this bit in the Makefile when it extracts:
> 
> configure: configure.ac
>         $(LIBTOOLIZE_BIN) -c $(LIBTOOLIZE_INSTALL) -f
>         cp include/install-sh .
>         aclocal -I m4
>         autoconf
> 
> include/builddefs: configure
>         ./configure $$LOCAL_CONFIGURE_OPTIONS
> 
> 
> And the timestamps on the tar extraction end up in a race so that this gets invoked
> during the ?build? - so, I tried looking at other packages to deal with this and I can
> just touch configure on a PRE_CONFIGURE hook to get it to bounce forward or
> I could set AUTORECONF on xfsprogs. But, is there a preferred method to deal
> with this?

Which version of xfsprogs do you use?

Here is what I get for the current master branch xfsprogs tarball 
(xfsprogs-4.15.1.tar.xz):

$ stat -c '%n: %y' configure configure.ac
configure: 2018-02-27 04:05:49.000000000 +0200
configure.ac: 2018-02-27 04:04:50.000000000 +0200

'configure' is newer than 'configure.ac', so the 'configure' generation rule 
should not trigger.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
