From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 30 Apr 2015 09:48:13 -0500
Subject: [Buildroot] [PATCH 1/1] busybox: udhcpc create leases file
In-Reply-To: <87zj5pvgba.fsf@dell.be.48ers.dk>
References: <1430358118-5304-1-git-send-email-matt@thewebers.ws>
 <87zj5pvgba.fsf@dell.be.48ers.dk>
Message-ID: <CANQCQpaw-Ft7NFRCHYns6em8GU78+LBvU-2yhZapqOMxzH_VFg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Thu, Apr 30, 2015 at 9:31 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Matt" == Matt Weber <matt@thewebers.ws> writes:
>
>  > Signed-off-by: Matt Weber <matt@thewebers.ws>
>  > ---
>  >  package/busybox/udhcpc.script | 23 +++++++++++++++++++++++
>  >  1 file changed, 23 insertions(+)
>
>  > diff --git a/package/busybox/udhcpc.script b/package/busybox/udhcpc.script
>  > index 50c52e6..d5d81bf 100755
>  > --- a/package/busybox/udhcpc.script
>  > +++ b/package/busybox/udhcpc.script
>  > @@ -61,6 +61,29 @@ case "$1" in
>  >                      echo adding dns $i
>  >                      echo "nameserver $i # $interface" >> $RESOLV_CONF
>  >              done
>  > +
>  > +            # Based on http://sourceforge.net/p/kboot/mailman/message/1168535/
>
> A more detailed commit message would be good. After looking at that URL
> I'm still not quite sure what this is needed for? It doesn't seem to be
> read again anywhere.

Sorry, I can add that.  In general, it adds the leases functionality
that mimics full dhclient behavior.  This file can then be used at a
system level to know least expiration and other server provided
information.

>
>> +             } >> /var/lib/misc/udhcpc-$interface.leases
>
> Are you sure this should append the file and not overwrite it? Why would
> you want to keep older lease info around when you receive a new one?

I just mimic'd dhclient but I could see in a embedded space you might
only want to keep the latest and when a lease expires, removing this
file.  I think the full client usually used this file to set an
interface after reboot to the previous lease if one was still valid.
I wasn't going to keep this behavior since for embedded devices it
doesn't make sense.

>
> Perhaps this belongs in a hook in your rootfs overlay?

Right now there isn't any way to get dhcp lease information after a
lease is provided.  It seemed this should be a standard capability of
the script.  I do agree I should make it not append and clean up when
there isnt' a lease.

Thanks for the feedback!
-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
