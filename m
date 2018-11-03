From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 3 Nov 2018 23:01:07 +0100
Subject: [Buildroot] [PATCH 1/2] ngrep: bump to version 1.47
In-Reply-To: <20181103224222.229c064a@windsurf>
References: <20181101132326.13015-1-fontaine.fabrice@gmail.com>
 <20181103224222.229c064a@windsurf>
Message-ID: <CAPi7W8388ghbe_PtDyJ_Hi1=2PLo4sAoZbzwORjH4qLGQ-ue5w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le sam. 3 nov. 2018 ? 22:42, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Thu,  1 Nov 2018 14:23:25 +0100, Fabrice Fontaine wrote:
>
> > - Add an upstream patch to fix --enable-pcre
>
> If there is a --enable-pcre option, it is a strong indication that PCRE
> is not mandatory. Indeed:
>
> $ ./configure --help
> [...]
> --enable-pcre           use PCRE instead of GNU regex (default GNU)
>
> So PCRE is not mandatory.
Indeed, PCRE is not really "mandatory", ngrep use GNU regex by default
but this was already the case before the bump (in version 1.45): see
https://github.com/jpr5/ngrep/blob/V1_45/configure.in.
I didn't want to change this behavior when bumping the package and I
could find why pcre wasn't made optional in the initial commit back in
2011.
However, I'll add a third patch in my serie to make pcre an optional
dependency before bumping the package..
>
> > -NGREP_LIBS = -lpcap -lpcre
>
> Since this variable no longer exists...
Yes, -lpcap and -lpcre are now correctly added by the project.
>
> >  ifeq ($(BR2_STATIC_LIBS),y)
> >  NGREP_LIBS += `$(STAGING_DIR)/usr/bin/pcap-config --static --additional-libs`
> >  endif
> > @@ -20,7 +20,6 @@ NGREP_CONF_ENV += LIBS+="$(NGREP_LIBS)"
>
> This assignment becomes totally pointless.
OK, I'll replace it by:
ifeq ($(BR2_STATIC_LIBS),y)
NGREP_CONF_ENV += LIBS="$(STAGING_DIR)/usr/bin/pcap-config --static
--additional-libs"
endif
>
> >  NGREP_CONF_OPTS = \
> >       --with-pcap-includes=$(STAGING_DIR)/usr/include/pcap \
> >       --enable-pcre \
> > -     --with-pcre=$(STAGING_DIR)/usr \
> >       --disable-dropprivs \
> >       --disable-pcap-restart
> >
>
> You should add a --disable-tcpkill here, and then in your PATCH 2/2,
> add the optional dependency on libdnet.
OK, I'll make a v2 with this update (and the other ones)
>
> Your series on wireshark has the same issue: the first patch should
> ensure all new optional dependencies are unconditionally disabled, and
> then follow-up patches should enable them conditionally. This is
> necessary for a correctly bisectable patch series. When patches are so
> close in the same series, it's not a big big deal, but it's always
> better when it's done really correctly.
OK, I'll do a v2 of wireshark serie too.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
