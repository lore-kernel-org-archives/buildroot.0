From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 16:01:57 +0200
Subject: [Buildroot] [PATCH] package/skeleton: add a startup script to
	wait for slow network interfaces
In-Reply-To: <874mi86ok0.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 03 Oct 2015 15:59:11 +0200")
References: <1443879105-3036-1-git-send-email-yann.morin.1998@free.fr>
 <874mi86ok0.fsf@dell.be.48ers.dk>
Message-ID: <87twq859uy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 >> +wait_for_IF() {
 >> +    IF="$(sed -r -e '/^auto lo/d;' \
 >> +                 -e '/^auto (.+)$/!d;' \
 >> +                 -e 's//\1/;' \
 >> +                 /etc/network/interfaces
 >> +         )"

 > This assumes we have at most 1 interface to wait for.

 > Perhaps we could instead do something like (untested):

 > IFACES=$(awk '/^auto/ { print $2 }' /tmp/interfaces)

That should naturally be /etc/network/interfaces

 > for i in $(seq $WAIT_DELAY); do
 >     for IFACE in $IFACES; do
 >         if [ ! -e "/tmp/$IFACE" ]; then

and /sys/class/net/$IFACE

See, I did actually do a quick test after all ;)

-- 
Bye, Peter Korsgaard
