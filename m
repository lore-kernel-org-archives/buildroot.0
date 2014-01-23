From: Martin Bark <martin@barkynet.com>
Date: Thu, 23 Jan 2014 20:08:57 +0000
Subject: [Buildroot] [PATCH] tcpreplay: cross-compile with tcpdump
	support
In-Reply-To: <87ppnjaqam.fsf@dell.be.48ers.dk>
References: <87txcvb13p.fsf@dell.be.48ers.dk>	<1390468034-7430-1-git-send-email-judge.packham@gmail.com>
 <87ppnjaqam.fsf@dell.be.48ers.dk>
Message-ID: <52E176D9.6040101@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Peter, Chris,

On 23/01/14 11:30, Peter Korsgaard wrote:
>>>>>> "Chris" == Chris Packham <judge.packham@gmail.com> writes:
>
>   > If tcpdump is enabled set ac_cv_path_tcpdump_path so that verbose output
>   > is enabled on the target.
>
>   > Signed-off-by: Chris Packham <judge.packham@gmail.com>
>   > ---
>   > Hi,
>
>   > This should get verbose support working if the tcpdump package is selected.
>   > This may also fix some of the build errors (if they set BR2_PACKAGE_TCPDUMP=y)
>   > but the real fix will come from upstream.
>
>   >  package/tcpreplay/tcpreplay.mk | 6 ++++++
>   >  1 file changed, 6 insertions(+)
>
>   > diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
>   > index 0939c6c..a2cd16e 100644
>   > --- a/package/tcpreplay/tcpreplay.mk
>   > +++ b/package/tcpreplay/tcpreplay.mk
>   > @@ -18,4 +18,10 @@ TCPREPLAY_DEPENDENCIES = libpcap
>   >  TCPREPLAY_LIBS = -lpcap $(if $(BR2_PACKAGE_LIBUSB),-lusb-1.0)
>   >  TCPREPLAY_CONF_ENV += ac_cv_search_pcap_close='$(TCPREPLAY_LIBS)'
>
>   > +ifeq ($(BR2_PACKAGE_TCPDUMP),y)
>   > +TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=/usr/sbin/tcpdump
>
> The problem here is that the configure script checks if /usr/bin/tcpdump
> (on the build machine) is executable, and otherwise errors out - So this
> breaks if you try to build it on a machine without tcpdump.

I think the patch is actually OK.  Looking at the configure script when 
ac_cv_path_tcpdump_path is set it does not check if the executable 
exists.  It only checks when using the --with-tcpdump option.

I tested the patch and choose tcpdump and tcpreplay with no 
/usr/sbin/tcpdump on the host.  The code builds and I see in the 
configure output the lines

checking for tcpdump... (cached) /usr/sbin/tcpdump

and

tcpdump binary path:        /usr/sbin/tcpdump

So i think this patch will work.

Thanks

>
> The configure script needs to be changed to not do this test when cross
> compiling (or only warn).
>
>   > +else
>   > +TCPREPLAY_CONF_ENV += ac_cv_path_tcpdump_path=no
>   > +endif
>   > +
>   >  $(eval $(autotools-package))
>   > --
>   > 1.8.4.rc2
>
>
>
