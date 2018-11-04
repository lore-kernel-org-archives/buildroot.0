From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 4 Nov 2018 12:04:19 +0100
Subject: [Buildroot] [PATCH 1/2] ngrep: bump to version 1.47
In-Reply-To: <20181104111953.08d765e0@windsurf>
References: <20181101132326.13015-1-fontaine.fabrice@gmail.com>
 <20181103224222.229c064a@windsurf>
 <CAPi7W8388ghbe_PtDyJ_Hi1=2PLo4sAoZbzwORjH4qLGQ-ue5w@mail.gmail.com>
 <20181104111953.08d765e0@windsurf>
Message-ID: <CAPi7W83CQfQGjuhZBUvZoPBsJJLSE2sgRj_P9UHt7Lvb9bpqpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le dim. 4 nov. 2018 ? 11:19, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Sat, 3 Nov 2018 23:01:07 +0100, Fabrice Fontaine wrote:
>
> > > So PCRE is not mandatory.
> > Indeed, PCRE is not really "mandatory", ngrep use GNU regex by default
> > but this was already the case before the bump (in version 1.45): see
> > https://github.com/jpr5/ngrep/blob/V1_45/configure.in.
> > I didn't want to change this behavior when bumping the package and I
> > could find why pcre wasn't made optional in the initial commit back in
> > 2011.
> > However, I'll add a third patch in my serie to make pcre an optional
> > dependency before bumping the package..
>
> Indeed, it could be a third patch.
OK, when I tried to enable GNU regex (on 1.47), I got the following error:
/usr/bin/make w -j --jobserver-fds=3,4 -C regex-0.12 regex.o
make[2]: Entering directory
'/home/fabrice/buildroot/output/build/ngrep-1_47/regex-0.12'
make[2]: *** No rule to make target 'w'.  Stop.

This error is raised by this command:
$(MAKE) $(MAKEFLAGS) -C $(REGEX_DIR) $(notdir $(REGEX_OBJS))

which means that MAKEFLAGS is set to "w -j --jobserver-fds=3,4".
I don't understand where this "w" and not "-w" is coming from. Do you
have any advice or clue?
I can make a patch to remove MAKEFLAGS but this won't be upstreamable.
Thanks for your help.
>
> > > > @@ -20,7 +20,6 @@ NGREP_CONF_ENV += LIBS+="$(NGREP_LIBS)"
> > >
> > > This assignment becomes totally pointless.
> > OK, I'll replace it by:
> > ifeq ($(BR2_STATIC_LIBS),y)
> > NGREP_CONF_ENV += LIBS="$(STAGING_DIR)/usr/bin/pcap-config --static
> > --additional-libs"
> > endif
>
> Sorry, my bad here, I had entirely missed that NGREP_LIBS was still
> being set in the BR2_STATIC_LIBS case. So the way you did it originally
> was OK, sorry about that. Doing is directly in NGREP_CONF_ENV also
> works, since there will be a single assignment of LIBS.
>
> > > You should add a --disable-tcpkill here, and then in your PATCH 2/2,
> > > add the optional dependency on libdnet.
> > OK, I'll make a v2 with this update (and the other ones)
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
