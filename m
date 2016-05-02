From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 2 May 2016 23:32:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/macchanger: fix musl build
In-Reply-To: <1462218005.2955.1.camel@embedded.rocks>
References: <1453588987-16758-1-git-send-email-bernd.kuhls@t-online.de>
 <1462218005.2955.1.camel@embedded.rocks>
Message-ID: <18bdd441-ce98-cdb6-b233-5c97b328ad9e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/16 21:40, J?rg Krause wrote:
> Hi,
>
> On Sa, 2016-01-23 at 23:43 +0100, Bernd Kuhls wrote:
[snip]
>> +@@ -113,7 +113,7 @@ mc_net_info_get_permanent_mac (const net
>> + 	epa->size = IFHWADDRLEN;
>> +
>> + 	memcpy(&req, &(net->dev), sizeof(struct ifreq));
>> +-	req.ifr_data = (caddr_t)epa;
>> ++	req.ifr_data = (char *)epa;
>> +
>> + 	if (ioctl(net->sock, SIOCETHTOOL, &req) < 0) {
>> + 		perror ("[ERROR] Could not read permanent MAC");
>
> any reason why this patch is marked as "Changes Requested"? The build
> error is still present...

  IIRC, Bernd posted almost a hundred patches at the time for musl fixes, most 
of which were taken from Alpine Linux, and almost all of which had insufficient 
explanation of the problem and of the fix (nothing more than "fix musl build" 
and a reference to the alpine patch). Also many of them were simply incorrect: 
they would maybe fix the build, but possibly introducing other bugs or sometimes 
just breaking the code. So after reviewing and rejecting a dozen of them, 
ThomasP just made a generic comment that all of them should be done more 
carefully and marked all of them as Changes Requested.

  If you would like to recover and review them, just select in patchwork patches 
from Bernd that are marked as changes requested and that have musl in the 
subject. Feel free to repost (with better commit messages of course).

  This one specifically does look good to me - except for the commit message, 
which should be something like:

caddr_t is a BSD type. POSIX usually uses void* instead, but specifically in 
struct ifreq the type of ifr_data is char*.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
