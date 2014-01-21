From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 21 Jan 2014 12:49:05 +0100
Subject: [Buildroot] Problem with multi interface support in udhcpc
	script?
In-Reply-To: <CANxTyt44suVoSpVTivmKde77P7fUYRa04a_fQfb=ceA-Yym9sQ@mail.gmail.com>
 (Danomi Manchego's message of "Tue, 14 Jan 2014 09:47:05 -0500")
References: <CANxTyt44suVoSpVTivmKde77P7fUYRa04a_fQfb=ceA-Yym9sQ@mail.gmail.com>
Message-ID: <87fvohimha.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

Hi,

 > Peter,
 > Back in June 2013, you committed this change to add support for
 > multiple neetwork interfaces in resolv.conf:

 > http://git.buildroot.net/buildroot/commit/package/busybox/udhcpc.script?id=584f418ec1ae3f0b5e09c10133c82578d78a3e03

 > However, I don't think that this quite works.  The "nameserver" lines
 > are okay, because it's supposed to be one server per line.  But there
 > is supposed to be only one "search" line.  So, for example, if I use
 > the resolv library to dump resolv.conf data, I only get the search
 > domains from the *last* search line.   Similarly, when I try to
 > resolve a name, the search domain ommitted by the reolve library info
 > appears to not be used by busybox's "nslookup" app.

Ahh, so we need to add per-interface domain comments and generate a
'search' line with all domains. As you say, the last search line "wins"
(also verified in uClibc code), we could perhaps just so something
similar to the nameservers, E.G.:

nameserver ... # eth0
search foo # eth0
nameserver ... # eth1
search bar # eth1
search foo bar # COMBINED


while read KEYWORD VALUE COMMENT;
do
    # drop combined search line
    case "$COMMENT" in
        *COMBINED) continue ;;
    esac

    if [ "$KEYWORD" = "search" ]; then
        DOMAINS="$DOMAINS$VALUE "
    fi

    echo "$KEYWORD $VALUE $COMMENT"
done < /tmp/resolv.conf

echo "search $DOMAINS # COMBINED"

 > FYI, the program that used to dump resolv.conf info is below.

 > I'm wondering if there needs to be comment lines to track the search
 > domains per interface, and then a fancy grep+sed bit to synthesize a
 > single aggregate search line from those comments.

 > When you did the original change, do you recall if you tested if the
 > multiple search lines let you resolve non-FQDN refs correctly?

No, I must say that the setup where I needed DHCP on multiple interfaces
only had DNS setup on a single one.

-- 
Bye, Peter Korsgaard
