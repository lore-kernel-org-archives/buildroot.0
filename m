From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 30 Apr 2015 16:31:05 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: udhcpc create leases file
In-Reply-To: <1430358118-5304-1-git-send-email-matt@thewebers.ws> (Matt
 Weber's message of "Wed, 29 Apr 2015 20:41:58 -0500")
References: <1430358118-5304-1-git-send-email-matt@thewebers.ws>
Message-ID: <87zj5pvgba.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matt@thewebers.ws> writes:

 > Signed-off-by: Matt Weber <matt@thewebers.ws>
 > ---
 >  package/busybox/udhcpc.script | 23 +++++++++++++++++++++++
 >  1 file changed, 23 insertions(+)

 > diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
 > index 50c52e6..d5d81bf 100755
 > --- a/package/busybox/udhcpc.script
 > +++ b/package/busybox/udhcpc.script
 > @@ -61,6 +61,29 @@ case "$1" in
 >  			echo adding dns $i
 >  			echo "nameserver $i # $interface" >> $RESOLV_CONF
 >  		done
 > +
 > +		# Based on http://sourceforge.net/p/kboot/mailman/message/1168535/

A more detailed commit message would be good. After looking at that URL
I'm still not quite sure what this is needed for? It doesn't seem to be
read again anywhere.

> +		} >> /var/lib/misc/udhcpc-$interface.leases

Are you sure this should append the file and not overwrite it? Why would
you want to keep older lease info around when you receive a new one?

Perhaps this belongs in a hook in your rootfs overlay?

-- 
Bye, Peter Korsgaard
