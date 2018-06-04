From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 4 Jun 2018 23:34:34 +0200
Subject: [Buildroot] [PATCH 1/2] host-perl-autodie: new package
In-Reply-To: <20180604230457.13d4e185@windsurf>
References: <20180603081134.1933-1-fontaine.fabrice@gmail.com>
 <20180604230457.13d4e185@windsurf>
Message-ID: <CAPi7W83DNMjUBWrXYbfy_bdz0FaT_yR_i+Ym1zD8Chckfm4ZWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

2018-06-04 23:04 GMT+02:00 Thomas Petazzoni <thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Sun,  3 Jun 2018 10:11:33 +0200, Fabrice Fontaine wrote:
> > Replace functions with ones that succeed or die with lexical scope
> >
> > https://metacpan.org/release/autodie
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/perl-autodie/perl-autodie.hash |  6 ++++++
> >  package/perl-autodie/perl-autodie.mk   | 13 +++++++++++++
> >  2 files changed, 19 insertions(+)
> >  create mode 100644 package/perl-autodie/perl-autodie.hash
> >  create mode 100644 package/perl-autodie/perl-autodie.mk
>
> This series doesn't fix the problem for me. Indeed, whois seems to be
> using /usr/bin/perl explicitly, so it doesn't find the perl-autodie
> built by Buildroot:
>
> >>> host-perl-autodie 2.29 Extracting
> >>> host-perl-autodie 2.29 Patching
> >>> host-perl-autodie 2.29 Configuring
> >>> host-perl-autodie 2.29 Building
> >>> host-perl-autodie 2.29 Installing to host directory
> >>> whois 5.3.0 Extracting
> /home/buildroot/output/host/bin/xzcat /home/buildroot/buildroot/dl/whois/whois_5.3.0.tar.xz
> | /home/buildroot/output/host/bin/tar --strip-components=1 -C
> /home/buildroot/output/build/whois-5.3.0   -xf -
> >>> whois 5.3.0 Patching
> >>> whois 5.3.0 Configuring
> >>> whois 5.3.0 Building
> PATH="/home/buildroot/output/host/bin:/home/buildroot/
> output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
> /usr/bin/make -j5 CC="/home/buildroot/output/host/bin/arm-linux-gcc"
> CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
> -Os " LIBS="" Makefile.depend whois mkpasswd -C
> /home/buildroot/output/build/whois-5.3.0
> /home/buildroot/output/host/bin/arm-linux-gcc   -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -MM -MG *.c >
> Makefile.depend
> make[2]: 'Makefile.depend' is up to date.
> /usr/bin/perl make_version_h.pl debian/changelog > version.h
> /usr/bin/perl make_ip_del.pl < ip_del_list > ip_del.h
> /usr/bin/perl make_ip6_del.pl < ip6_del_list > ip6_del.h
> /usr/bin/perl make_as_del.pl < as_del_list > as_del.h
> /usr/bin/perl make_as32_del.pl < as32_del_list > as32_del.h
> Can't locate autodie.pm in @INC (you may need to install the autodie
> module) (@INC contains: /home/buildroot/output/host/lib/perl
> /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl
> /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5) at
> make_version_h.pl line 5.
> BEGIN failed--compilation aborted at make_version_h.pl line 5.
> make[2]: *** [Makefile:82: version.h] Error 2
> make[2]: *** Deleting file 'version.h'
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [package/pkg-generic.mk:232: /home/buildroot/output/build/whois-5.3.0/.stamp_built]
> Error 2
> make: *** [Makefile:16: _all] Error 2
>
> The second issue that I have is I'm not sure we want to add host-perl
> as a dependency of whois (and that's what your series is indirectly
> doing). host-perl is a pretty heavy dependency. I see three
> possibilities here:
>
>  - Keep it as you do, with perl-autodie using the host-perl-package
>    infrastructure, which means adding a host-perl dependency to the
>    dependency chain of whois.
>
>  - Implement perl-autodie like libxml-parser-perl, i.e explicitly avoid
>    using host-perl-package to avoid the host-perl dependency.
>
>  - Add a requirement on perl-autodie to be installed system-wide in
>    support/dependencies/dependencies.sh, like we're already doing for a
>    few other Perl packages.
>
Second or third solution are definitely better than first one. Which one do
yo prefer?
Perhaps, the second option is better, I don't know if all our users run the
dependencies.sh script?

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180604/ef06045b/attachment.html>
