From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 15:59:11 +0200
Subject: [Buildroot] [PATCH] package/skeleton: add a startup script to
	wait for slow network interfaces
In-Reply-To: <1443879105-3036-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 3 Oct 2015 14:31:45 +0100")
References: <1443879105-3036-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <874mi86ok0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > On some machines, the network interface is slow to appear. For example,
 > on the Raspberry Pi, the network interface eth0 is an ethernet-over-USB,
 > and our standard boot process is too fast, so our network startup script
 > is called before the USB bus is compeltely enumerated, thus it can't
 > configure eth0.

 > If Buildroot is configured to do a DHCP on an interface, install a
 > startup script, just before S40network, that waits for that interface.

 > Since Buildroot can only be configured to run DHCP on a single interface,
 > we do not need a script that waits for more than one interface.

 > Closes #8116.

A more generic solution for dynamic changes to network interfaces is to
NOT mark them as auto and instead use ifplugd -M <interface>.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/skeleton/S39wait-for-network-if | 43 +++++++++++++++++++++++++++++++++
 >  package/skeleton/skeleton.mk            |  2 ++
 >  2 files changed, 45 insertions(+)
 >  create mode 100644 package/skeleton/S39wait-for-network-if

 > diff --git a/package/skeleton/S39wait-for-network-if b/package/skeleton/S39wait-for-network-if
 > new file mode 100644
 > index 0000000..010026e
 > --- /dev/null
 > +++ b/package/skeleton/S39wait-for-network-if
 > @@ -0,0 +1,43 @@
 > +#!/bin/sh
 > +
 > +# In case we have a slow-to-appear interface (e.g. eth-over-USB),
 > +# and we need to configure it, wait until it appears. But not too
 > +# long either. WAIT_DELAY is in seconds.
 > +WAIT_DELAY=15
 > +
 > +wait_for_IF() {
 > +    IF="$(sed -r -e '/^auto lo/d;' \
 > +                 -e '/^auto (.+)$/!d;' \
 > +                 -e 's//\1/;' \
 > +                 /etc/network/interfaces
 > +         )"

This assumes we have at most 1 interface to wait for.

Perhaps we could instead do something like (untested):

IFACES=$(awk '/^auto/ { print $2 }' /tmp/interfaces)

for i in $(seq $WAIT_DELAY); do
    for IFACE in $IFACES; do
        if [ ! -e "/tmp/$IFACE" ]; then
           sleep 1
           continue 2
        fi
    done

    echo "ok"; exit 0
done

echo "timeout"; exit 1

-- 
Bye, Peter Korsgaard
