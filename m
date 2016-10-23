From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Oct 2016 17:21:51 +0200
Subject: [Buildroot] [PATCH] pkg-download: fix fetching URLs with ? from
 PRIMARY/SECONDARY
In-Reply-To: <20161022150413.25a85c1c@free-electrons.com>
References: <20161021202715.16528-1-arnout@mind.be>
 <20161022150413.25a85c1c@free-electrons.com>
Message-ID: <679e0dd7-6a24-e90f-4136-8b3caef2033d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 22-10-16 15:04, Thomas Petazzoni wrote:
> Hello,
> 
> There is nothing named "SECONDARY" in Buildroot, it's called "BACKUP".
> This can be fixed when applying the patch.
> 
> On Fri, 21 Oct 2016 22:27:15 +0200, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> Some packages download files (especially patches) with a ? in the
>> URL. The ? marks the query part of the URL. However, the downloaded
>> file still contains the ? but from then on it doesn't designate a
>> query part anymore. Therefore, when fetching from PRIMARY or
>> SECONDARY site over http, the server will report a 404 Not Found.
>>
>> To fix, we need to replace the ? with %3F. Obviously, this should
>> be done only when fetching from PRIMARY or SECONDARY. For fetching
>> from the real upstream, the ? really does designate the query part.
> 
> One thing I'm wondering is if the '?' character is the only one that
> needs to be escaped like this, or not.

 From wikipedia, an URL is:

scheme:[//[user:password@]host[:port]][/]path[?query][#fragment]

so after the path, only ? and # are interpreted differently between the normal
download and the PRIMARY/BACKUP download. You might think that & (or ;) is also
special, but those characters are only special when they appear _after_ '?'.
Just to be sure I tested a ?...&... scenario (just adding \&foo after one of the
openssl patches) and with this patch it works correctly both for normal and
PRIMARY downloads. [1]

 As to #fragment, that's very simple: it can never occur because it's
interpreted by the client and doesn't get sent to the server. If a # ends up in
a URL somehow, it already has to be escaped anyway or it won't get passed by wget.

 Note: I haven't tested a PRIMARY that has scp or file download method, but
those are not affected by this patch anyway.

 Regards,
 Arnout

[1]  Well, actually it doesn't work at all, our download handling fails
dramatically when there is a & in the URL. I tried fixing it by adding quoting
here and there, but it's not exactly trivial. Since we don't have URLs with &
and I don't expect any, I'm not continuing work on this. But at least using our
dl-wrapper works for a URL like ...%3F...&...

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
