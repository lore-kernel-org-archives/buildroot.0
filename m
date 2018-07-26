From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 26 Jul 2018 10:39:59 +0200
Subject: [Buildroot] [PATCH] vim: install /bin/vi as a relative symlink
In-Reply-To: <20180724103031.1b1cd416@windsurf>
References: <20180718123443.7242-1-casantos@datacom.com.br>
 <20180718150350.4a910b0c@windsurf> <87fu0g53wd.fsf@tkos.co.il>
 <589643561.4441380.1531997921281.JavaMail.zimbra@datacom.com.br>
 <877elq5tz0.fsf@tkos.co.il>
 <1840086717.4674313.1532086956701.JavaMail.zimbra@datacom.com.br>
 <20180723151740.145c41ea@windsurf>
 <93989b29-232f-20a2-4ac4-835066e5229b@mind.be>
 <20180724103031.1b1cd416@windsurf>
Message-ID: <e9abed90-472c-b96c-ca78-79283c81cd02@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-07-18 10:30, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 24 Jul 2018 09:55:40 +0200, Arnout Vandecappelle wrote:
> 
>>  The thing is, I don't believe that relying on BR2_ROOTFS_MERGED_USR is the
>> right approach. I've had projects with a usr -> . symlink in a custom skeleton,
>> for instance. We could of course declare such a skeleton invalid, but I don't
>> think that it is checked currently. Also I can imagine that there could be other
>> custom skeleton layouts that could create problems.
>>
>>  We already use ln --relative in a few places, isn't that the easiest solution?
> 
> ln --relative is not supported on old distros, we even have a patch on
> systemd to remove its use of ln --relative.

 Crap, yes, I had done a quick grep, found some hits, and didn't notice it were
patches *removing* the --relative.

 I would still very much prefer to create a relative symlink automagically. Some
ideas:

1. Install a proper host-coreutils if the system-provided one is too old
(similar to cmake). Meh.
2. Always make absolute symlinks (pointing to target dir) and at some point call
https://github.com/brandt/symlinks to convert absolute to relative.
3. Make an 'ln' wrapper that converts absolute to relative, using e.g. the shell
scriptlet from [1].

 Regards,
 Arnout


[1]
https://unix.stackexchange.com/questions/85060/getting-relative-links-between-two-paths/85068#85068



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
