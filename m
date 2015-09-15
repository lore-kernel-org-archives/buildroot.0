From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Sep 2015 14:27:08 +0200
Subject: [Buildroot] [RFC 3/6] system: add mdev-only /dev management
 (without devtmpfs)
In-Reply-To: <87k2rrvqlh.fsf@dell.be.48ers.dk>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
 <1441747734-18730-4-git-send-email-luca@lucaceresoli.net>
 <55EFF9FF.1020402@mind.be> <55F02630.5050500@lucaceresoli.net>
 <20150909155427.53f9c8b5@free-electrons.com>
 <87bnd43eph.fsf@dell.be.48ers.dk>
 <20150914233402.3575da80@free-electrons.com>
 <87zj0oznp2.fsf@dell.be.48ers.dk>
 <20150915093030.622d2366@free-electrons.com>
 <87zj0oumrg.fsf@dell.be.48ers.dk>
 <20150915114159.758baca9@free-electrons.com>
 <87k2rrvqlh.fsf@dell.be.48ers.dk>
Message-ID: <55F80E9C.7070208@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-09-15 14:01, Peter Korsgaard wrote:
> Or alternatively, extend the S10mdev logic to detect that it need to
> create a tmpfs on /dev (by looking for devtmpfs in /proc/filesystems or
> detecting that /dev is RO) and have all the fixup there. That way it
> atleast doesn't add any more complications to the rest of Buildroot /
> users.

 That's a great idea, because it actually simplifies the buildroot code (no
longer needed to force devtmpfs in the kernel when mdev is selected).

 To detect, it's as simple as:

if [ "$(cut -d ' ' -f 2,3 /proc/mounts | sed -n '/^\/dev /s///p')" != devtmpfs ]


 Regards,
 Arnout


-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
