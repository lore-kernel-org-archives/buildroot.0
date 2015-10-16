From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 16 Oct 2015 11:42:05 +0200
Subject: [Buildroot] [PATCH] package/skeleton: add a startup script to
	wait for slow network interfaces
In-Reply-To: <874mi86ok0.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 03 Oct 2015 15:59:11 +0200")
References: <1443879105-3036-1-git-send-email-yann.morin.1998@free.fr>
 <874mi86ok0.fsf@dell.be.48ers.dk>
Message-ID: <874mhr40b6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
 >> On some machines, the network interface is slow to appear. For example,
 >> on the Raspberry Pi, the network interface eth0 is an ethernet-over-USB,
 >> and our standard boot process is too fast, so our network startup script
 >> is called before the USB bus is compeltely enumerated, thus it can't
 >> configure eth0.

 >> If Buildroot is configured to do a DHCP on an interface, install a
 >> startup script, just before S40network, that waits for that interface.

 >> Since Buildroot can only be configured to run DHCP on a single interface,
 >> we do not need a script that waits for more than one interface.

 >> Closes #8116.

 > This assumes we have at most 1 interface to wait for.

 > Perhaps we could instead do something like (untested):

 > IFACES=$(awk '/^auto/ { print $2 }' /tmp/interfaces)

 > for i in $(seq $WAIT_DELAY); do
 >     for IFACE in $IFACES; do
 >         if [ ! -e "/tmp/$IFACE" ]; then
 >            sleep 1
 >            continue 2
 >         fi
 >     done

 >     echo "ok"; exit 0
 > done

 > echo "timeout"; exit 1

Committed after moving it to S40network and changing the implementation
to support multiple interaces, thanks.

-- 
Bye, Peter Korsgaard
