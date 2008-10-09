From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Thu, 09 Oct 2008 08:49:35 +0200
Subject: [Buildroot] Both cramfs + jffs2 in buildroot?
In-Reply-To: <20081009004228.GA12878@cloud.net.au>
References: <48ECAD04.6070209@timeterminal.se>
	<20081009004228.GA12878@cloud.net.au>
Message-ID: <48EDA97F.4050300@timeterminal.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It already works perfectly.

I've got a /linuxrc script which not only mounts /etc for init to
takeover, but also checks the integrity of the jffs2 fs before mounting
as well as look out for a upgrade request if the rootfs has been
upgraded (in case it's incompatible with the older jffs2 fs).

It even check if the "factory reset"-button is held down, and the
rewrites the jffs2 fs. The rootfs always contains a default image of the
jffs2 fs. Since it's very small, it doesn't require much disk space.

I'd like to recommend a look at Axis ETRAX SDK which does this really in
a very nice way, and that's from where I got my inspiration.

I hope this will be possible with Buildroot some day, because it both
ease for firmware upgrades and makes the product failsafe (in case of a
corrupted /etc, it will be rewritten).

Regards
Daniel

Hamish Moffatt wrote:
> On Wed, Oct 08, 2008 at 02:52:20PM +0200, Daniel Nystr?m wrote:
>> (Sorry if this has been a topic earlier, but it's really hard to search
>> the mailing archive)
>>
>> Is it possible in Buildroot to make both a read-only rootfs and a second
>> writable filesystem?
>>
>> A common setup is using cramfs for / and mounting a jffs2 on /mnt/flash,
>> and then make a symlink of /etc to point at /mnt/flash/etc where all
>> config files are writable.
>>
>> Is this possible to achive with Buildroot?
> 
> No, there's no support for building two file systems with different
> contents.
> 
> There might be better ways to handle this anyway, like copying /etc from
> the cramfs to the rw jffs2 on the first bootup?
> 
> With regard to mounting /mnt/flash/etc onto /etc, I don't think a
> symlink will work - you need to use/run stuff from /etc before the
> second file system can be mounted. I suggest a minimal /etc in the root,
> enough to get the other file system mounted, and then "mount --bind" the 
> new /etc over the top.
> 
> 
> Hamish
