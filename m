From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 17:33:46 +0100
Subject: [Buildroot] [PATCH/next v1] package/ifupdown-scripts: send
 udhcpc to background in case lease is not obtained
In-Reply-To: <20210216202022.27264-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Tue, 16 Feb 2021 21:20:22 +0100")
References: <20210216202022.27264-1-ps.report@gmx.net>
Message-ID: <87eehe3b85.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > - Add the 'udhcpc_opts -b' option to /etc/network/interfaces for the
 >   system dhcp configured interface. With this option ('-b: background if
 >   lease is not obtained') the udhcpc keeps running in case the initial
 >   dhcp requests are not answered immediately.

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 >  package/ifupdown-scripts/ifupdown-scripts.mk | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
 > index 5ef032142c..d3135b18b6 100644
 > --- a/package/ifupdown-scripts/ifupdown-scripts.mk
 > +++ b/package/ifupdown-scripts/ifupdown-scripts.mk
 > @@ -28,6 +28,7 @@ define IFUPDOWN_SCRIPTS_DHCP
 >  		echo "  pre-up /etc/network/nfs_check"; \
 >  		echo "  wait-delay 15"; \
 >  		echo "  hostname \$$(hostname)"; \
 > +		echo "  udhcpc_opts -b"; \

Wouldn't it make more sense to change the value of
CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS in our default busybox.config instead
of hardcoding it here?

Does this still do the right thing for the fallback to IPv4LL addressing
if avahi-autoipd is enabled?

-- 
Bye, Peter Korsgaard
