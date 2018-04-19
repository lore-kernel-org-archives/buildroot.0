From: Guillaume William Bres <guillaume.bressaix@gmail.com>
Date: Thu, 19 Apr 2018 23:35:48 +0200
Subject: [Buildroot] [PATCH 1/1] reaver: add missing dependency on non
 static lib.
In-Reply-To: <42941498-53f1-e48d-5a75-78493ad701d6@mind.be>
References: <1524069781-671-1-git-send-email-guillaume.bressaix@gmail.com>
 <42941498-53f1-e48d-5a75-78493ad701d6@mind.be>
Message-ID: <CAJe0E3fi6_Yj6SEqkGp2s5h4nDZgQdDK_egJCoA9CjRLqaLMyQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you, yes you are right.

I improved my methods, I reproduced the build error here by copying the
config file. I improved things a little bit with

ifeq ($(BR2_STATIC_LIBS),y) # --static seems to cause the pb
REAVER_CONF_ENV += ac_cv_lib_pcap_pcap_open_live=yes
endif

it's less dramatic but still a dirty work around:
libpcap is properly selected by the package, so has been previously
downloaded & installed by buildroot. -lpcap is properly passed to the
linker from my first submission. Yet pcap_open_live test by configure still
fails. My understanding is the line I just added avoids testing
"pcap_open_live" which causes a failure. Dunno if you're okay with that.

Make now actually proceeds further & produces some new errors, yet still
somehow related to pcap, I could use your input on them:

step that fails now:
$buildroot/output/host/mips64el-buildroot-linux-uclibc/sysroot/usr/lib64/../lib64/libpcap.a(pcap-dbus.o):
In function `dbus_write':
pcap-dbus.c:(.text+0x48): undefined reference to `dbus_message_demarshal'
pcap-dbus.c:(.text+0x8c): undefined reference to `dbus_message_demarshal'

I started googling & looking at dbus related packages but haven't made any
progress yet

Guillaume William Bres-Saix
Software engineer - NIST
325 Broadway, Boulder, CO 80305
<guillaume.bressaix@gmail.com>

2018-04-18 23:55 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:

>
>
> On 18-04-18 18:43, Guillaume W. Bres wrote:
> > Fixes
> >
> >       http://autobuild.buildroot.net/results/
> 519b4347f496c043ddecdf15f57efb0b3addee42
> >       http://autobuild.buildroot.net/results/
> c3daad76473a704e379634e3b87d51468a353f41
> >
> > lpcap is not found when BR2_STATIC_LIBS=y
>
>  Instead of just blindly disabling static, it's worthwhile to try to fix it
> instead. You can use the pattern that is used in e.g. arp-scan:
>
> ifeq ($(BR2_STATIC_LIBS),y)
> REAVER_CONF_OPTS += \
>         LDFLAGS="$(TARGET_LDFLAGS) `$(STAGING_DIR)/usr/bin/pcap-config
> --static
> --additional-libs`"
> endif
>
> (untested).
>
>  Regards,
>  Arnout
>
> >
> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
> > ---
> >  package/reaver/Config.in | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/package/reaver/Config.in b/package/reaver/Config.in
> > index 0fd8ab7..3e73d0e 100644
> > --- a/package/reaver/Config.in
> > +++ b/package/reaver/Config.in
> > @@ -1,5 +1,6 @@
> >  config BR2_PACKAGE_REAVER
> >       bool "reaver"
> > +     depends on !BR2_STATIC_LIBS
> >       select BR2_PACKAGE_LIBPCAP
> >       help
> >         Reaver is a tool to audit networks against brute WPS pins
> > @@ -7,3 +8,6 @@ config BR2_PACKAGE_REAVER
> >
> >         https://code.google.com/archive/p/reaver-wps/wikis/README.wiki
> >         https://github.com/t6x/reaver-wps-fork-t6x
> > +
> > +comment "reaver needs a toolchain w/ dynamic library"
> > +     depends on BR2_STATIC_LIBS
> >
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180419/43d71132/attachment.html>
