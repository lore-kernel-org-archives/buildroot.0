From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 31 Aug 2020 22:05:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/busybox: fix avahi-autoipd
 error message
In-Reply-To: <20200723171918.12763-1-tekieli.lukasz@gmail.com> (Lukasz
 Tekieli's message of "Thu, 23 Jul 2020 19:19:17 +0200")
References: <20200723171918.12763-1-tekieli.lukasz@gmail.com>
Message-ID: <87pn76bmye.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lukasz" == Lukasz Tekieli <tekieli.lukasz@gmail.com> writes:

 > When using a combination of udhcpc and avahi-autoipd in case of receiving IP
 > from a DHCP server, the following message can be seen:
 > "Failed to kill daemon: No such file or directory".
 > Add a check for a running avahi-autoipd to fix this issue.

 > Signed-off-by: Lukasz Tekieli <tekieli.lukasz@gmail.com>
 > ---
 >  package/busybox/udhcpc.script | 6 +++---
 >  1 file changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
 > index 711963f974..0196351cd5 100755
 > --- a/package/busybox/udhcpc.script
 > +++ b/package/busybox/udhcpc.script
 > @@ -42,19 +42,19 @@ case "$1" in
 >  		rm -f $TMPFILE
 
 >  		if [ -x /usr/sbin/avahi-autoipd ]; then
 > -			/usr/sbin/avahi-autoipd -k $interface
 > +			/usr/sbin/avahi-autoipd -c $interface && /usr/sbin/avahi-autoipd -k $interface

Longer term this should really move to an
/usr/share/udhcpc/default.script.d/avahi-autoipd file, but OK - That can
be done later.

Committed, thanks.

-- 
Bye, Peter Korsgaard
