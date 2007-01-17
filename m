From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 17 Jan 2007 16:30:02 +0100
Subject: [Buildroot] Fontconfig
In-Reply-To: <1169038154.6702.5.camel@localhost>
References: <1169038154.6702.5.camel@localhost>
Message-ID: <20070117153002.GB28672@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 17, 2007 at 01:49:14PM +0100, Julien Vermillard wrote:
>Hello,
>
>Look like fontconfig got a problem :

fontconfig is completely broken:
1)
It passes the TARGET_CFLAGS down to the HOSTCC which just works out of
pure luck for you.
2) It builds the host-tools fc-cache, fc-cat etc that is ment to be used
on the _host_ against the target libraries and headers.

I have a patch that adds a BUILD_CFLAGS for the host-compiler, but
that's only half of the story; Fontconfig does not distinguish between
freetype-config for the host vs. target, so fontconfig is essentially
b0rked for cross-compilation (at least IMHO).

I did not look if the CVS version on freedesktop.org fixes these obvious
bugs. If it does, we should use that version instead of the release, if
it doesn't than someone should better fix fontconfig to cleanly
cross-compile upstream..

HTH,
>
>make[4]: Entering directory
>`/opt/buildroot/buildroot/build_i586/fontconfig-2.4.2/fc-case'
>gcc  -Os -pipe     -o fc-case  fc-case.o  
>fc-case.o: In function `main':
>fc-case.c:(.text+0x3e6): undefined reference to `__ctype_b'
>collect2: ld returned 1 exit status
>make[4]: *** [fc-case] Error 1
>make[4]: Leaving directory
>`/opt/buildroot/buildroot/build_i586/fontconfig-2.4.2/fc-case'
>make[3]: *** [all] Error 2
>make[3]: Leaving directory
>`/opt/buildroot/buildroot/build_i586/fontconfig-2.4.2/fc-case'
>make[2]: *** [all-recursive] Error 1
>make[2]: Leaving directory
>`/opt/buildroot/buildroot/build_i586/fontconfig-2.4.2'
>make[1]: *** [all] Error 2
>make[1]: Leaving directory
>`/opt/buildroot/buildroot/build_i586/fontconfig-2.4.2'
>make: *** 
>[/opt/buildroot/buildroot/build_i586/fontconfig-2.4.2/.compiled] Error 2
>
>Any idea ?
>
>Julien
>
>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
>
