From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Jan 2014 12:30:41 +0100
Subject: [Buildroot] [PATCH] tcpreplay: cross-compile with tcpdump
	support
In-Reply-To: <1390468034-7430-1-git-send-email-judge.packham@gmail.com> (Chris
 Packham's message of "Thu, 23 Jan 2014 22:07:14 +1300")
References: <87txcvb13p.fsf@dell.be.48ers.dk>
 <1390468034-7430-1-git-send-email-judge.packham@gmail.com>
Message-ID: <87ppnjaqam.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:

 > If tcpdump is enabled set ac_cv_path_tcpdump_path so that verbose output
 > is enabled on the target.

 > Signed-off-by: Chris Packham <judge.packham@gmail.com>
 > ---
 > Hi,

 > This should get verbose support working if the tcpdump package is selected.
 > This may also fix some of the build errors (if they set BR2_PACKAGE_TCPDUMP=y)
 > but the real fix will come from upstream.

 >  package/tcpreplay/tcpreplay.mk | 6 ++++++
 >  1 file changed, 6 insertions(+)

 > diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
 > index 0939c6c..a2cd16e 100644
 > --- a/package/tcpreplay/tcpreplay.mk
 > +++ b/package/tcpreplay/tcpreplay.mk
 > @@ -18,4 +18,10 @@ TCPREPLAY_DEPENDENCIES = libpcap
 >  TCPREPLAY_LIBS = -lpcap $(if $(BR2_PACKAGE_LIBUSB),-lusb-1.0)
 >  TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close='$(TCPREPLAY_LIBS)'
 
 > +ifeq ($(BR2_PACKAGE_TCPDUMP),y)
 > +TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=/usr/sbin/tcpdump

The problem here is that the configure script checks if /usr/bin/tcpdump
(on the build machine) is executable, and otherwise errors out - So this
breaks if you try to build it on a machine without tcpdump.

The configure script needs to be changed to not do this test when cross
compiling (or only warn).

 > +else
 > +TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=no
 > +endif
 > +
 >  $(eval $(autotools-package))
 > -- 
 > 1.8.4.rc2



-- 
Bye, Peter Korsgaard
