From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Jun 2013 21:51:18 +0200
Subject: [Buildroot] [git commit] busybox: udhcpc.script: fix
	resolv.conf handling with multiple interfaces
In-Reply-To: <51CB213A.9070202@mind.be> (Arnout Vandecappelle's message of
 "Wed, 26 Jun 2013 19:13:30 +0200")
References: <20130626132400.8C4AC9B1C4@busybox.osuosl.org>
 <51CB213A.9070202@mind.be>
Message-ID: <87k3lg4pmx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >> diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
 >> index f7beb56..43742fb 100755
 >> --- a/package/busybox/udhcpc.script
 >> +++ b/package/busybox/udhcpc.script
 >> @@ -13,6 +13,13 @@ case "$1" in
 >> /sbin/ifconfig $interface up
 >> /sbin/ifconfig $interface 0.0.0.0
 >> 
 >> +		# drop info from this interface
 >> +		# resolv.conf may be a symlink to /tmp/, so take care
 >> +		TMPFILE=$(mktemp)
 >> +		grep -vE "# $interface\$" $RESOLV_CONF > $TMPFILE
 >> +		cat $TMPFILE > $RESOLV_CONF

 Arnout>  Isn't the non-atomicity of this line a potential race condition?

Possibly, but no worse than what it was before ;)


 Arnout> mv -f $TMPFILE $(readlink -f $RESOLV_CONF)
 Arnout> might be a better idea.

Yes. Care to send a patch?

-- 
Bye, Peter Korsgaard
